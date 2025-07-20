--- @class lsp.Lsp
--- @field lsp string name of lsp
--- @field config vim.lsp.Config
--- @field mason? string alieas name for mason.nvim package

require('lsp.utils').setup()

--- @type lsp.Lsp[]
local lsps = {
  -- golang
  {
    lsp = 'gopls',
    config = require('lsp.gopls'),
  },
  {
    lsp = 'golangci_lint_ls',
    config = require('lsp.golangci_lint_ls'),
  },

  -- ts/js
  {
    lsp = 'biome',
    config = require('lsp.biome'),
  },
  {
    lsp = 'ts_ls',
    config = require('lsp.ts_ls'),
  },
  {
    lsp = 'astro',
    config = require('lsp.astro'),
  },
  {
    lsp = 'eslint',
    config = require('lsp.eslint'),
  },

  -- json
  {
    lsp = 'jsonls',
    config = require('lsp.jsonls'),
  },

  -- python
  {
    lsp = 'pyright',
    config = require('lsp.pyright'),
  },
  {
    lsp = 'ruff',
    config = require('lsp.ruff'),
  },

  -- lua
  {
    lsp = 'lua_ls',
    config = require('lsp.lua_ls'),
  },

  -- rust
  {
    lsp = 'rust_analyzer',
    config = require('lsp.rust_analyzer'),
  },

  -- yaml
  {
    lsp = 'yamlls',
    config = require('lsp.yamlls'),
  },

  -- terraform
  {
    lsp = 'terraformls',
    config = require('lsp.terraformls'),
  },

  -- bash
  {
    lsp = 'bashls',
    config = require('lsp.bashls'),
  },

  -- docker
  {
    lsp = 'dockerls',
    config = require('lsp.dockerls'),
  },

  -- efm
  {
    lsp = 'efm',
    config = require('lsp.efm'),
  },
}

local function setup_lsps()
  local lsp_names = {}

  for _, lsp in ipairs(lsps) do
    vim.lsp.config(lsp.lsp, lsp.config)
    table.insert(lsp_names, lsp.lsp)
  end

  vim.lsp.enable(lsp_names)
end

local function setup_diagnostic()
  -- refs: https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts
  vim.diagnostic.config({
    virtual_lines = true,
    float = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = '',
        [vim.diagnostic.severity.WARN] = '',
        [vim.diagnostic.severity.HINT] = '',
        [vim.diagnostic.severity.INFO] = '',
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
        [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
        [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
        [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      }
    }
  })

  -- see: https://xbgneb0083.hatenablog.com/entry/2022_6_12_avoid_conflict_lsp_hover if you want to use hover
  -- e.g.
  --   vim.api.nvim_create_autocmd('LspAttach', {
  --     callback = function()
  --       local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
  --       vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
  --       vim.api.nvim_create_autocmd({ "CursorHold" }, {
  --         group = diagnostic_hover_augroup_name,
  --         callback = function()
  --           vim.diagnostic.open_float()
  --         end
  --       })
  --     end
  --   })
end

local function setup_keymaps()
  -- see also configs/fzf_lua.lua
  vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
      -- enable lsp completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { buffer = ev.buf }
      vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<space>f', require('lsp.utils').format, opts)
    end
  })
end

setup_lsps()
setup_diagnostic()
setup_keymaps()

return (function()
  return {
    lsps = lsps,
  }
end)()
