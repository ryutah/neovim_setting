return require('lsp.utils').config({
  lsp = {
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
    }
  }
})
