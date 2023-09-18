vim.keymap.set('n', '<Leader><Leader>f', "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>c', "<cmd>lua require('fzf-lua').commands()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>g', "<cmd>lua require('fzf-lua').grep_project()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>t', "<cmd>lua require('fzf-lua').tabs()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>o', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>", { silent = true })
vim.keymap.set('n', '<Leader><Leader>wo', "<cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<CR>",
  { silent = true })
vim.keymap.set('n', '<Leader>d', "<cmd>lua require('fzf-lua').diagnostics_workspace()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>rf', "<cmd>lua require('fzf-lua').lsp_references()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>im', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>", { silent = true })
vim.keymap.set('n', 'gd', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>ca', "<cmd>lua require('fzf-lua').lsp_code_actions()<CR>", { silent = true })
vim.keymap.set('n', '<Leader>gb', "<cmd>lua require('fzf-lua').git_branches()<CR>", { silent = true })

local actions = require 'fzf-lua.actions'
require 'fzf-lua'.setup({
  actions = {
    files = {
      ["default"] = actions.file_edit,
      ["ctrl-s"]  = actions.file_split,
      ["ctrl-v"]  = actions.file_vsplit,
      ["ctrl-t"]  = actions.file_tabedit,
      ["ctrl-q"]  = actions.file_sel_to_qf,
    },
  },
})
