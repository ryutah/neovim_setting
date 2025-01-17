local curl = require('plenary.curl')

local function install_dir(arg)
  local base_dir = vim.fn.stdpath('data') .. '/custom/bin/'

  local path = require('plenary.path'):new(vim.fn.stdpath('data'), 'custom', 'bin')
  path:mkdir({ parents = true, exist_ok = true })

  return base_dir .. arg
end

local function get_latest_stable_plantuml_version()
  local response = curl.get('https://api.github.com/repos/plantuml/plantuml/releases', {
    query = { per_page = 10 },
    timeout = 300000,
  })

  local versions = vim.json.decode(response.body)
  for _, value in ipairs(versions or {}) do
    -- jar ファイルが含まれる relase のみ対象とするために、tag_name に snapshot / relase が含まれていないものを返す
    if not string.find(value.tag_name, 'snapshot') and not string.find(value.tag_name, 'native') then
      return value.tag_name
    end
  end
end

local function install_plantuml()
  vim.print('Installing plantuml...')

  local latest_version = get_latest_stable_plantuml_version()
  local url = string.format(
    "https://github.com/plantuml/plantuml/releases/download/%s/plantuml-%s.jar",
    latest_version,
    string.sub(latest_version, 2)
  )
  vim.print(url)

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

local function install_treesitter_cli()
  vim.print('Installing treesitter-cli...')
  vim.fn.system('cargo install tree-sitter-cli')
  vim.print('Installed treesitter-cli')
end

local function install_swagger_ui_watcher()
  vim.print('Installing swagger-ui-watcher...')
  vim.fn.system('npm install swagger-ui-watcher -g')
  vim.print('Installed swagger-ui-watcher')
end

local function install_tools()
  install_plantuml()
  install_gotests()
  install_treesitter_cli()
  install_swagger_ui_watcher()
end

vim.g.plantuml_jar_path = install_dir('plantuml.jar')

vim.api.nvim_create_user_command('UpdateTools', install_tools, {})
