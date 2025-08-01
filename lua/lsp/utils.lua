--- @class lsp.utils.ConfigOpt
--- @field disable_format? boolean if disabled, format will not be applied
--- @field on_pre_format? fun(client: vim.lsp.Client, bufnr: number) callback function to be called on BufWritePre
--- @field lsp? vim.lsp.Config

local group_name = 'lsp_on_attach'

local function setup()
  vim.api.nvim_create_augroup(group_name, {
    clear = true,
  })
end

--- @param client vim.lsp.Client
--- @param bufnr number
--- @param cmd string[]
local function code_action(client, bufnr, cmd)
  local encoding = vim.opt.fileencoding:get()
  local params = vim.lsp.util.make_range_params(0, encoding)

  table.insert(params, {
    context = { only = cmd },
  })

  local result = vim.lsp.client.request_sync(client, "textDocument/codeAction", params, 1000, bufnr) or {}

  for _, r in pairs(result.result or {}) do
    if r.edit then
      local enc = client.offset_encoding or "utf-16"
      vim.lsp.util.apply_workspace_edit(r.edit, enc)
    end
  end
end

local function format()
  vim.lsp.buf.format({ async = false })
end

--- generate lsp config
--- @param opts? lsp.utils.ConfigOpt
--- @return vim.lsp.Config
local function config(opts)
  local o = opts or {}

  --- @type vim.lsp.Config
  local default_config = {
    on_attach = function(client, bufnr)
      require('lsp_signature').on_attach()

      -- nvim-treesitter のハイライトが無効になってしまうため、semanticTokensProvider を無効にする
      -- see:
      --   - https://github.com/neovim/nvim-lspconfig/issues/2481
      client.server_capabilities.semanticTokensProvider = nil

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = group_name,
        buffer = bufnr,
        callback = function()
          if o.on_pre_format then
            o.on_pre_format(client, bufnr)
          end
          if not o.disable_format then
            format()
          end
        end,
      })
    end
  }

  if o.lsp then
    return vim.tbl_deep_extend('force', default_config, o.lsp)
  end

  return default_config
end


return (function()
  return {
    setup = setup,
    config = config,
    format = format,
    code_action = code_action,
  }
end)()
