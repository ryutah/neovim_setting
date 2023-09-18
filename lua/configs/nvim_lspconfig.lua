-- mason registry: https://mason-registry.dev/registry/list

-- lsp config references:
--   {
--      name: string (required lsp name),
--      lsp_opts: table (optional lsp config),
--      config: {
--        format: {
--          enable: boolean (optional, default: true),
--        },
--      },
--   }

local lsps = {
  {
    name = 'golangci_lint_ls',
  },
  {
    name = 'gopls',
    lsp_opts = {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
          usePlaceholders = true,
          completeUnimported = true,
        },
      },
    }
  },
  {
    name = 'jsonls',
    config = {
      format = {
        enable = false,
      },
    },
    lsp_opts = {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = {
            enable = true,
          },
        },
      },
    }
  },
  {
    name = 'tsserver',
    config = {
      format = {
        enable = false,
      }
    },
  },
  {
    name = 'pyright',
    lsp_opts = {
      settings = {
        python = {
          pythonPath = require('utils/python').python_path(),
        },
      },
    },
  },
  {
    name = 'lua_ls',
    lsp_opts = {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    }
  },
  {
    name = 'rust_analyzer',
    lsp_opts = {
      settings = {
        ['rust-analyzer'] = {},
      },
    }
  },
  {
    name = 'yamlls',
    config = {
      format = {
        enable = false,
      },
    },
    lsp_opts = {
      settings = {
        yaml = {
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = "",
          },
          schemas = require('schemastore').yaml.schemas({
            extra = {
              {
                description = 'efm-langserver schema',
                url = 'https://raw.githubusercontent.com/mattn/efm-langserver/master/schema.json',
                fileMatch = { '**/efm-langserver/config.yaml', },
                name = 'efm-langserver/config.yaml',
              },
            }
          }),
        },
      },
    }
  },
  {
    name = 'terraformls',
  },
  {
    -- LSP の起動がかなり遅いので注意
    name = 'bashls',
    config = {
      format = {
        enable = false,
      },
    },
  },
  {
    name = 'dockerls',
  },
  -- additional config see: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
  {
    name = 'eslint',
  },
  {
    name = 'efm',
    lsp_opts = {
      init_options = {
        documentFormatting = true,
        documentRangeFormatting = true
      },
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'yaml',
        'json',
        'html',
        'css',
        'markdown',
        'sql',
        'terraform',
        'terraform-vars',
        'sh',
        'dockerfile',
      },
    },
  },
}

local daps = {
  {
    name = 'delve',
  },
}

local formatters = {
  'prettierd',
  'sql-formatter',
  'sqlfmt',
  'shfmt',
}

local linters = {
  'sqlfluff',
  'tflint',
  'markdownlint',
  'hadolint',
}

local setup_mason_tool_installer = function()
  local ensure_installed = {}
  for _, v in ipairs(lsps) do
    table.insert(ensure_installed, v.name)
  end

  for _, v in ipairs(daps) do
    table.insert(ensure_installed, v.name)
  end

  for _, v in ipairs(formatters) do
    table.insert(ensure_installed, v)
  end

  for _, v in ipairs(linters) do
    table.insert(ensure_installed, v)
  end

  require('mason-tool-installer').setup({
    ensure_installed = ensure_installed,
  })
end

local setup_mason = function()
  setup_mason_tool_installer()

  require('mason').setup()
  require('mason-lspconfig').setup()
end

local function setup_lsp_signature()
  require('lsp_signature').setup()
end

local exec_format = function()
  vim.lsp.buf.format({ async = false })
end

-- LSP の format 設定に応じて、ファイル保存時の auto formatting の設定と documentFormattingProvider の設定を行う
--
-- 同一の filetype に対して複数の LSP を設定している場合、どの LSP が format を行うかを設定する必要がある
--
-- client.server_capabilities.documentFormattingProvider の設定だけでも似たようなことはできるのだが、それだけではフォーマット可能な LSP がない場合に余計なメッセージが表示されてしまってうっとおしいので、 LSP に応じて BufWritePre の設定を適宜行うようにしている
--
-- see:
--  - https://www.reddit.com/r/neovim/comments/yirhjf/multiple_lsp_for_same_filetype_but_only_want_one/
--  - https://github.com/neovim/nvim-lspconfig/wiki/Multiple-language-servers-FAQ
local on_attach_nvim_lspconfig_setup_format = function(args)
  local format = args.format or {}
  local client = args.client

  if not client.server_capabilities.documentFormattingProvider then
    return
  end

  if client == nil then
    return
  end

  local enabled = true
  if format.enable ~= nil then
    enabled = format.enable
  end

  client.server_capabilities.documentFormattingProvider = enabled
  if enabled then
    vim.api.nvim_create_augroup('lsp_auto_format', {})
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'lsp_auto_format',
      callback = exec_format
    })
  end
end

local setup_lspconfig_auto_organize_import_on_save = function()
  vim.api.nvim_create_augroup('lsp_auto_organize_import', {})
  -- organize import for golang
  -- see:
  --   - https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'lsp_auto_organize_import',
    pattern = '*.go',
    callback = function()
      local params = vim.lsp.util.make_range_params()
      params.context = { only = { "source.organizeImports" } }
      local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
      for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
          if r.edit then
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            vim.lsp.util.apply_workspace_edit(r.edit, enc)
          end
        end
      end
    end
  })

  -- organize import for js and ts
  -- see:
  --   - https://www.reddit.com/r/neovim/comments/lwz8l7/how_to_use_tsservers_organize_imports_with_nvim/
  --   - https://github.com/typescript-language-server/typescript-language-server#organize-imports
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = 'lsp_auto_organize_import',
    pattern = { '*.js', '*.jsx', '*.ts', '*.tsx' },
    callback = function()
      local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) }
      }
      vim.lsp.buf.execute_command(params)
    end
  })
end

local setup_lspconfig_keymap = function()
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      -- use fzf-lua
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
      -- use fzf-lua
      -- vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', exec_format, opts)

      vim.keymap.set('i', '<C-f><C-h>', vim.lsp.buf.signature_help, opts)
    end
  })
end

local setup_lspconfig_symbol_highlight = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)

      if client.server_capabilities.documentHighlightProvider then
        vim.cmd [[
          hi! LspReferenceRead cterm=bold ctermbg=red guifg=OrangeRed1
          hi! LspReferenceText cterm=bold ctermbg=red guifg=OrangeRed1
          hi! LspReferenceWrite cterm=bold ctermbg=red guifg=OrangeRed1
        ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
          clear = false
        })
        vim.api.nvim_clear_autocmds({
          buffer = bufnr,
          group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          group = 'lsp_document_highlight',
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end,
  })
end

-- see: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#change-diagnostic-symbols-in-the-sign-column-gutter
local function setup_lspconfig_diagnostic()
  local signs = {
    Error = '',
    Warn = '',
    Hint = '',
    Info = '',
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

local setup_lspconfig = function()
  require("neodev").setup()

  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  for _, lsp in ipairs(lsps) do
    local config = {
      capabilities = capabilities,
      on_attach = function(client, _)
        local config = lsp.config or {}
        -- nvim-treesitter のハイライトが無効になってしまうため、semanticTokensProvider を無効にする
        -- see:
        --   - https://github.com/neovim/nvim-lspconfig/issues/2481
        client.server_capabilities.semanticTokensProvider = nil
        require('lsp_signature').on_attach()
        on_attach_nvim_lspconfig_setup_format({
          client = client,
          format = config.format,
        })
      end
    }

    if lsp.lsp_opts ~= nil then
      for k, v in pairs(lsp.lsp_opts) do config[k] = v end
    end

    lspconfig[lsp.name].setup(config)
  end

  setup_lspconfig_keymap()
  setup_lspconfig_auto_organize_import_on_save()
  setup_lspconfig_symbol_highlight()
  setup_lspconfig_diagnostic()
end

setup_mason()
setup_lsp_signature()
setup_lspconfig()
