local tools = require('internal/tools')

local setup_mason_tool_installer = function()
  local ensure_installed = {}
  for _, v in ipairs(tools.lsps) do
    table.insert(ensure_installed, v.name)
  end

  for _, v in ipairs(tools.daps) do
    table.insert(ensure_installed, v.name)
  end

  for _, v in ipairs(tools.formatters) do
    table.insert(ensure_installed, v)
  end

  for _, v in ipairs(tools.linters) do
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

local function setup_lspconfig_buf_write_pre(buf_write_pre_configs)
  local configs = buf_write_pre_configs or {}

  vim.api.nvim_create_augroup('custom_lsp_buf_write_pre', {})

  for _, config in ipairs(configs) do
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = 'custom_lsp_buf_write_pre',
      pattern = config.pattern,
      callback = config.callback,
    })
  end
end

local setup_lspconfig = function()
  require("neodev").setup()

  local lspconfig = require('lspconfig')
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  for _, lsp in ipairs(tools.lsps) do
    local config = {
      capabilities = capabilities,
      on_attach = function(client, _)
        local config = lsp.config or {}
        -- nvim-treesitter のハイライトが無効になってしまうため、semanticTokensProvider を無効にする
        -- see:
        --   - https://github.com/neovim/nvim-lspconfig/issues/2481
        client.server_capabilities.semanticTokensProvider = nil
        require('lsp_signature').on_attach()
        setup_lspconfig_buf_write_pre(config.buf_write_pre or {})
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
  setup_lspconfig_symbol_highlight()
  setup_lspconfig_diagnostic()
end

setup_mason()
setup_lsp_signature()
setup_lspconfig()
