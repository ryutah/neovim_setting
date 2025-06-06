require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
    'comment',
    'markdown_inline',
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  indent = {
    enable = true,
  },

  highlight = {
    enable = true,
    -- example of disabled
    -- disable = function(lang, bufnr) -- Disable in large C++ buffers
    --   return lang == "cpp" and vim.api.nvim_buf_line_count(bufnr) > 50000
    -- end,
    disable = {},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require('treesitter-context').setup({
  max_lines = 5,
})
