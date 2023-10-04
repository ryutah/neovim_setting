local fzf_lua = require('fzf-lua')

vim.keymap.set('n', '<Leader><Leader><Leader>', require('fzf-lua.cmd').load_command, { silent = true, desc = 'fzf_lua commands' })
vim.keymap.set('n', '<Leader><Leader>f', fzf_lua.files, { silent = true, desc = 'fzf_lua files' })
vim.keymap.set('n', '<Leader><Leader>cm', fzf_lua.commands, { silent = true, desc = 'fzf_lua vim commands' })
vim.keymap.set('n', '<Leader><Leader>b', fzf_lua.buffers, { silent = true, desc = 'fzf_lua buffers' })
vim.keymap.set('n', '<Leader><Leader>gg', fzf_lua.grep_project, { silent = true, desc = 'fzf_lua grep project' })
vim.keymap.set('n', '<Leader><Leader>t', fzf_lua.btags, { silent = true, desc = 'fzf_lua btags' })
vim.keymap.set('n', '<Leader><Leader>o', fzf_lua.lsp_document_symbols, { silent = true, desc = 'fzf_lua lsp document symbols' })
vim.keymap.set('n', '<Leader><Leader>wo', fzf_lua.lsp_live_workspace_symbols, { silent = true, desc = 'fzf_lua lsp live workspace symbols' })
vim.keymap.set('n', '<Leader><Leader>d', fzf_lua.diagnostics_workspace, { silent = true, desc = 'fzf_lua lsp diagnostics' })
vim.keymap.set('n', '<Leader><Leader>rf', fzf_lua.lsp_references, { silent = true, desc = 'fzf_lua lsp references' })
vim.keymap.set('n', '<Leader><Leader>im', fzf_lua.lsp_implementations, { silent = true, desc = 'fzf_lua lsp implementations' })
vim.keymap.set('n', 'gd', fzf_lua.lsp_definitions, { silent = true, desc = 'fzf_lua lsp definitions' })
vim.keymap.set('n', '<Leader><Leader>ca', fzf_lua.lsp_code_actions, { silent = true, desc = 'fzf_lua lsp code actions' })
vim.keymap.set('n', '<Leader><Leader>gb', fzf_lua.git_branches, { silent = true, desc = 'fzf_lua git branches' })

local actions = require('fzf-lua.actions')
fzf_lua.setup({
  btags = {
    ctags_autogen = true,
  },
  commands = {
    actions = {
      ["ctrl-o"] = actions.ex_run_cr,
    },
  },
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
