return require('lsp.utils').config({
  lsp = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = {
          enable = true,
        },
      },
    }
  }
})
