local windows = require('utils/windows')

if windows().is_wsl2() and windows().is_apps_use_light_theme() then
  vim.g.airline_theme = 'ayu_light'
else
  vim.g.airline_theme = 'ayu_dark'
end
