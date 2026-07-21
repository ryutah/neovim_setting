local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('configs.mason').setup()
    end,
  },

  'neovim/nvim-lspconfig',

  'b0o/schemastore.nvim',

  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'honza/vim-snippets',
    },
    config = function()
      require('configs/nvim_cmp')
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ":TSUpdate",
    config = function()
      require('configs/nvim_treesitter')
    end,
  },

  -- nvim_treesitter で sqlx がサポートされていないようなので
  'andres-lowrie/vim-sqlx',

  'sainnhe/everforest',

  'nanotech/jellybeans.vim',

  'w0ng/vim-hybrid',

  {
    'vim-airline/vim-airline',
    dependencies = {
      'vim-airline/vim-airline-themes',
    },
    config = function()
      require('configs/vim_airline')
    end,
  },

  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('configs/fzf_lua')
    end,
  },

  {
    'miyakogi/seiya.vim',
    config = function()
      require('configs/seiya')
    end,
  },

  {
    'editorconfig/editorconfig-vim',
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('configs/nvim_tree')
    end,
  },

  'jiangmiao/auto-pairs',

  'tpope/vim-surround',

  'https://tpope.io/vim/repeat.git',

  {
    'https://tpope.io/vim/commentary.git',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      require('configs/commentary')
    end,
  },

  {
    'https://tpope.io/vim/fugitive.git',
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('configs/gitsigns')
    end,
  },

  {
    'github/copilot.vim',
    config = function()
      require('configs/copilot')
    end,
  },

  {
    'fatih/vim-go',
    build = ':GoUpdateBinaries',
    ft = { 'go', 'gomod', 'gosum' },
    config = function()
      require('configs/vim_go')
    end,
  },

  {
    'buoto/gotests-vim',
    config = function()
      require('configs/gotests')
    end,
    ft = { 'go' },
  },

  {
    'iamcco/markdown-preview.nvim',
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- see: https://github.com/iamcco/markdown-preview.nvim/issues/690#issuecomment-2782326124
    build = ":call mkdp#util#install()",
    config = function()
      require('configs/markdown_preview')
    end,
  },

  {
    'weirongxu/plantuml-previewer.vim',
    dependencies = {
      'aklt/plantuml-syntax',
      'tyru/open-browser.vim',
    },
    config = function()
      require('configs/plantuml_previewer')
    end,
    ft = { 'plantuml' },
  },

  {
    'vim-test/vim-test',
    config = function()
      require('configs/vim_test')
    end,
  },

  {
    'cappyzawa/trim.nvim',
    config = function()
      require('configs/trim')
    end,
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      require('configs/vim_easy_align')
    end,
  },

  {
    'mattn/vim-maketable',
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'theHamsta/nvim-dap-virtual-text',
      'LiadOz/nvim-dap-repl-highlights',
    },
    config = function()
      require('configs/nvim_dap')
    end,
  },

  {
    'vinnymeller/swagger-preview.nvim',
    config = function()
      require('configs/swagger_preview')
    end,
  },

  {
    'stevearc/aerial.nvim',
    config = function()
      require('configs/aerial')
    end,
  },

  {
    'mattn/emmet-vim',
  },

  {
    'nvim-lua/plenary.nvim',
  },

  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    config = function()
      require('configs/peek')
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('configs/indent_blankline')
    end,
  },
})
