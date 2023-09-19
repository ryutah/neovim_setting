-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<Leader>v', '<cmd>NvimTreeFindFileToggle<CR>')

local api = require("nvim-tree.api")

local on_attach = function(bufnr)
  local opts = function(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "l", api.node.open.edit, opts("Edit Or Open"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set('n', '<C-h>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<C-s>', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

-- auto close nvim-tree when last window is closed
-- see: https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf() then
      vim.cmd('quit')
    end
  end
})

require('nvim-tree').setup({
  on_attach = on_attach,
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  diagnostics = {
    enable = true,
  }
})
