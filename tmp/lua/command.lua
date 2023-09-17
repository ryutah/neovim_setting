local function install_dir(arg)
  local base_dir = vim.fn.stdpath('data') .. '/custom/bin/'

  local path = require('plenary.path'):new(vim.fn.stdpath('data'), 'custom', 'bin')
  path:mkdir({ parents = true, exist_ok = true })

  return base_dir .. arg
end

local function install_plantuml()
  vim.print('Installing plantuml...')

  local curl = require('plenary.curl')
  local response = curl.get('https://api.github.com/repos/plantuml/plantuml/releases?per_page=1')
  local latest_version = vim.json.decode(response.body)[1].name

  local url = 'https://github.com/plantuml/plantuml/releases/download/' ..
      latest_version .. '/plantuml-' .. string.sub(latest_version, 2) .. '.jar'

  curl.get(url, {
    output = install_dir('plantuml.jar'),
    timout = 300000,
  })

  vim.print('Installed plantuml ' .. latest_version)
end

local function install_gotests()
  vim.print('Installing gotests...')
  vim.fn.system('go install github.com/cweill/gotests/gotests@latest')
  vim.print('Installed gotests')
end

local function install_tools()
  install_plantuml()
  install_gotests()
end

vim.g.plantuml_jar_path = install_dir('plantuml.jar')

vim.api.nvim_create_user_command('UpdateTools', install_tools, {})
