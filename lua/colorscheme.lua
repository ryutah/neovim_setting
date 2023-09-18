vim.opt.background = "dark"

if vim.fn.has('termguicolors') then
  vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  vim.opt.termguicolors = true
end

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_diagnostic_line_highlight = 1

vim.cmd.colorscheme('everforest')

vim.cmd.highlight('clear CursorLine')
