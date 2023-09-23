-- 末尾に謎の文字が入らないように設定してる
-- see: https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
vim.keymap.set(
  'i', '<C-f><C-f>', 'copilot#Accept()',
  {
    silent = true,
    script = true,
    expr = true,
    replace_keycodes = false,
    desc = 'accept copilot suggestion'
  }
)
vim.g.copilot_no_tab_map = true
