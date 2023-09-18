-- see: https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
vim.keymap.set(
  'i', '<C-f><C-f>', 'copilot#Accept()',
  { silent = true, script = true, expr = true, replace_keycodes = false }
)
vim.g.copilot_no_tab_map = true
