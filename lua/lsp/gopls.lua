local function go_organize_import()
  local encoding = vim.opt.fileencoding:get()
  local params = vim.lsp.util.make_range_params(0, encoding)

  table.insert(params, {
    context = {
      only = { "source.organizeImports" }
    },
  })

  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)

  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

return require('lsp.utils').config({
  on_pre_format = go_organize_import,
  lsp = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
    },
  }
})
