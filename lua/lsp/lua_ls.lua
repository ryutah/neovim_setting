return require('lsp.utils').config({
  lsp = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace"
        }
      }
    },

    -- see: https://github.com/neovim/nvim-lspconfig/blob/7a88e3024a616e153b8760d64b3541e3a166c27f/doc/configs.md?plain=1#L6406
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if
            path ~= vim.fn.stdpath('config')
            and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
        then
          return
        end
      end

      --- @diagnostic disable-next-line: param-type-mismatch
      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            '${3rd}/luv/library',
          }
        }
      })
    end,
  }
})
