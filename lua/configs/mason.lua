local function setup()
  local ensure_installed = {
    -- daps
    'delve',
    'debugpy',

    -- formatters
    'prettierd',
    'sql-formatter',
    'shfmt',
    'buf', -- also use as linter

    -- linters
    'sqlfluff',
    'tflint',
    'markdownlint',
    'hadolint',
    'golangci-lint',
  }

  for _, lsp in ipairs(require('lsp').lsps) do
    table.insert(ensure_installed, lsp.mason or lsp.lsp)
  end

  require('mason').setup()
  require('mason-tool-installer').setup({
    ensure_installed = ensure_installed,
    auto_update = false,
    run_on_start = true,
  })
  require("mason-lspconfig").setup()
end

return (function()
  return {
    setup = setup,
  }
end)()
