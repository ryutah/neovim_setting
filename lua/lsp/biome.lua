return require('lsp.utils').config({
  -- NOTE: want to use local biome if available
  -- example: https://github.com/neovim/nvim-lspconfig/blob/7a88e3024a616e153b8760d64b3541e3a166c27f/lsp/biome.lua#L13
  lsp = {
    cmd = { 'biome', 'lsp-proxy' },
  },
})
