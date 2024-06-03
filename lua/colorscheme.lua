local windows = require('utils/windows')

if vim.fn.has('termguicolors') then
  vim.cmd('let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"')
  vim.cmd('let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"')
  vim.opt.termguicolors = true
end

if windows().is_wsl2() and windows().is_apps_use_light_theme() then
  vim.opt.background = "light"
else
  vim.opt.background = "dark"
end

vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_diagnostic_line_highlight = 1

vim.cmd.colorscheme('everforest')

vim.cmd.highlight('clear CursorLine')
