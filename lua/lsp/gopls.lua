local utils = require('lsp.utils')

return utils.config({
  on_pre_format = function(client, bufnr)
    utils.code_action(client, bufnr, { "source.organizeImports" })
  end,
  lsp = {
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
})
