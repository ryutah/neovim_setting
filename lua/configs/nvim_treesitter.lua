-- =============================================================================
-- 1. nvim-treesitter (main ブランチ仕様) の設定
-- =============================================================================
local ts = require('nvim-treesitter')

-- パーサーの一括指定と自動インストール
ts.install({
  'comment',
  'markdown_inline',
})

-- バッファ侵入時に未インストールのパーサーを自動追従させる設定
require('nvim-treesitter.install').prefer_git = true


-- =============================================================================
-- 2. ハイライト & インデントの有効化設定 (安全な pcall 方式)
-- =============================================================================
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local ft = vim.bo.filetype

    -- 明確に不要な特殊バッファは事前に除外
    if ft == "packer" or ft == "lazy" or ft == "TelescopePrompt" or ft == "NvimTree" or ft == "fzf" then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if lang then
      -- 構文ハイライトを安全に開始 (エラーが出た場合はスキップする)
      -- これにより、未知のファイルタイプで内部の assert が落ちるのを防ぎます
      local success = pcall(vim.treesitter.start)

      -- ハイライトの開始に成功した場合のみ、インデントなどの追加処理を行う
      if success then
        vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
      end
    end
  end,
})


-- =============================================================================
-- 3. nvim-treesitter-context の設定
-- =============================================================================
require('treesitter-context').setup({
  max_lines = 5,
})
