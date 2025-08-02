local utils = require('lsp.utils')

return utils.config({
  --  missing field `context` ってエラーが出る
  -- on_pre_format = function(client, bufnr)
  --   utils.code_action(client, bufnr, {
  --     "source.fixAll.biome",
  --     "source.organizeImports",
  --   })
  -- end,
  -- NOTE: want to use local biome if available
  -- example: https://github.com/neovim/nvim-lspconfig/blob/7a88e3024a616e153b8760d64b3541e3a166c27f/lsp/biome.lua#L13
  lsp = {
    cmd = function(dispatchers)
      local root_dir = vim.fs.root(0, { 'package.json', 'package.json5', 'biome.json', 'biome.jsonc' })
      if root_dir and vim.fn.executable(root_dir .. '/node_modules/.bin/biome') == 1 then
        local cmd = { root_dir .. '/node_modules/.bin/biome', 'lsp-proxy' }
        return vim.lsp.rpc.start(cmd, dispatchers)
      end
      return vim.lsp.rpc.start({ 'biome', 'lsp-proxy' }, dispatchers)
    end
  },
})
