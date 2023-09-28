-- mason registry: https://mason-registry.dev/registry/list

-- lsp config references:
--   {
--      name: string (required lsp name),
--      lsp_opts: table (optional lsp config),
--      config: {
--        buf_write_pre: {
--          {
--            pattern: string (required file pattern),
--            callback: function (required callback function),
--          },
--        },
--        buf_write_post: {
--          {
--            pattern: string (required file pattern),
--            callback: function (required callback function),
--          },
--        },
--        format: {
--          enable: boolean (optional, default: true),
--        },
--      },
--   }

local function go_organize_import()
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

-- organize import for js and ts
-- import 順の変更で問題が出ること( import 順が変わることによる想定外の差分発生とか、インデントがずれるとか )が割とあるので一旦無効にする。
-- organize import が必要な場合は、プロジェクト個別に https://github.com/simonhaenisch/prettier-plugin-organize-imports などを設定する
--
-- organize import については以下を参考にする
-- see:
--   - https://www.reddit.com/r/neovim/comments/lwz8l7/how_to_use_tsservers_organize_imports_with_nvim/
--   - https://github.com/typescript-language-server/typescript-language-server#organize-imports
local function tsserver_organize_import()
  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) }
  }
  vim.lsp.buf.execute_command(params)
end

local lsps = {
  {
    name = 'golangci_lint_ls',
  },
  {
    name = 'gopls',
    config = {
      buf_write_pre = {
        {
          pattern = '*.go',
          callback = go_organize_import,
        },
      },
    },
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
    config = {
      buf_write_post = {
        {
          pattern = '*.proto',
          callback = function()
            vim.fn.system('buf format -w ' .. vim.fn.expand('%:p'))
            vim.cmd('edit!')
          end
        },
      },
    },
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
        'proto',
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
  'buf', -- also use as linter
}

local linters = {
  'sqlfluff',
  'tflint',
  'markdownlint',
  'hadolint',
}

return (function()
  return {
    lsps = lsps,
    daps = daps,
    formatters = formatters,
    linters = linters,
  }
end)()
