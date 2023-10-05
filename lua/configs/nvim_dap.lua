local dap_go = require('dap-go')
local dap = require('dap')
local api = vim.api

local function go_debug_set_delve_port()
  local port = os.getenv('GO_DEBUG_DELVE_PORT')
  if (port == nil or port == '') then
    port = '38697'
  end
  return port
end

local function go_debug_set_substitute_path()
  local path = os.getenv('GO_DEBUG_SUBSTITUTE_PATH')
  if (path == nil or path == '') then
    path = '/app'
  end
  return path
end

local function go_debug_set_root_dir()
  local root_dir = os.getenv('GO_DEBUG_PROJECT_ROOT_DIR')
  if (root_dir == nil or root_dir == '') then
    root_dir = '${workspaceFolder}'
  end
  return root_dir
end

dap_go.setup()
-- configurations to debug remote server (like docker container)
-- see:
--   https://github.com/mfussenegger/nvim-dap/issues/970
--   https://github.com/mfussenegger/nvim-dap/discussions/660
table.insert(dap.configurations.go, {
  type = 'delve',
  name = 'Attach remote',
  mode = 'remote',
  request = 'attach',
  substitutePath = {
    { from = go_debug_set_root_dir(), to = go_debug_set_substitute_path() },
  },
})
dap.adapters.delve = {
  type = 'server',
  host = 'localhost',
  port = go_debug_set_delve_port(),
}
require("nvim-dap-virtual-text").setup()
require('nvim-dap-repl-highlights').setup()

local function repl_toggle()
  dap.repl.toggle({ height = 10 })
end

-- default keymaps
vim.keymap.set('n', '[nvim_dap]', '<Nop>')
vim.keymap.set('n', '<Leader>d', '[nvim_dap]', { remap = true })
vim.keymap.set('n', '[nvim_dap]b', dap.toggle_breakpoint, { silent = true, desc = 'dap toggle breakpoint' })
vim.keymap.set('n', '[nvim_dap]c', dap.continue, { silent = true, desc = 'dap continue' })
vim.keymap.set('n', '[nvim_dap]t', dap_go.debug_test, { silent = true, desc = 'dap_go debug test' })
vim.keymap.set('n', '[nvim_dap]r', repl_toggle, { silent = true, desc = 'dap toggle repl' })

vim.api.nvim_create_augroup('nvim_dap_filetype_keymap', {})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'dap-float' },
  group = 'nvim_dap_filetype_keymap',
  callback = function()
    vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = 0 })
  end
})

-- keymaps of debugger is activate
local remaps = {
  {
    lhs = 'K',
    rhs = require("dap.ui.widgets").hover,
    opts = {
      silent = true,
    },
  },
  {
    lhs = '<C-n>',
    rhs = dap.step_over,
    opts = {
      silent = true,
    },
  },
  {
    lhs = '<C-i>',
    rhs = dap.step_into,
    opts = {
      silent = true,
    },
  },
}

-- remap keymap for debuger
-- see:
--   - https://github.com/mfussenegger/nvim-dap/wiki/Cookbook#map-k-to-hover-while-session-is-active
local function get_remap(lhs)
  for _, keymap in pairs(remaps) do
    if keymap.lhs == lhs then
      return keymap
    end
  end
  return nil
end

local function set_dap_session_keymaps()
  for _, remap in ipairs(remaps) do
    vim.keymap.set('n', remap.lhs, remap.rhs, remap.opts)
  end
end

local keymap_restore = {}

local function adds_keymap_restore(keymap)
  table.insert(keymap_restore, keymap)
end

local function delete_keymaps(keymaps, buf)
  for _, keymap in pairs(keymaps) do
    local remap = get_remap(keymap.lhs)
    if remap then
      adds_keymap_restore(keymap)
      vim.keymap.del('n', remap.lhs, { buffer = buf })
    end
  end
end

local function restore_keyamps()
  for _, remap in ipairs(remaps) do
    vim.keymap.del('n', remap.lhs)
  end

  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs or '', {
      silent = keymap.silent,
      callback = keymap.callback,
    })
  end
  keymap_restore = {}
end

dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    delete_keymaps(keymaps, buf)
  end

  set_dap_session_keymaps()
  dap.repl.open({
    height = 10,
  })
end

dap.listeners.after['event_terminated']['me'] = function()
  restore_keyamps()
end
