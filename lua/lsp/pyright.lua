-- poetry で作成した仮想環境で lsp を実行できるようにするために、 python のパスを取得する
-- see:
--   - https://kitagry.github.io/blog/programmings/2021/04/pyright-vim/
local function python_path()
  if vim.fn.isdirectory('.venv') ~= 0 then
    return vim.fn.getcwd() .. '/.venv/bin/python'
  end

  if not vim.fn.executable('poetry') then
    return ''
  end
  local venv_dir = vim.trim(vim.fn.system('poetry env info -p'))
  return string.format('%s/bin/python', venv_dir)
end

return require('lsp.utils').config({
  disable_format = true,
  lsp = {
    settings = {
      python = {
        pythonPath = python_path(),
      },
    },
  }
})
