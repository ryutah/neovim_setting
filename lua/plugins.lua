local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      -- NOTE(ryutah): エラーが発生するため、いったんバージョンを固定
      {
        'williamboman/mason-lspconfig.nvim',
        tag = 'v1.32.0',

      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        commit = '299c77f264a9c9b7f30d0bdda91341ff756b53ca'
      },
      -- end
      'hrsh7th/cmp-nvim-lsp',
      'folke/neodev.nvim',
      'b0o/schemastore.nvim',
      'ray-x/lsp_signature.nvim',
    },
    config = function()
      require('configs/nvim_lspconfig')
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      { 'honza/vim-snippets', rtp = '.' },
    },
    config = function()
      require('configs/nvim_cmp')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('configs/nvim_treesitter')
    end,
  }

  use 'sainnhe/everforest'

  use 'nanotech/jellybeans.vim'

  use 'w0ng/vim-hybrid'

  use {
    'vim-airline/vim-airline',
    requires = {
      'vim-airline/vim-airline-themes'
    },
    config = function()
      require('configs/vim_airline')
    end
  }

  use {
    'ibhagwan/fzf-lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('configs/fzf_lua')
    end,
  }

  use {
    'miyakogi/seiya.vim',
    config = function()
      require('configs/seiya')
    end,
  }

  use {
    'editorconfig/editorconfig-vim',
    -- NOTE: https://github.com/editorconfig/editorconfig-vim/commit/7eec46701ec7a954a6cb0b0e348ad7c13a893425 で正しく機能しなくなってるので、いったんバージョン固定
    tag = 'v1.2.0',
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('configs/nvim_tree')
    end,
  }

  use 'jiangmiao/auto-pairs'

  use 'tpope/vim-surround'

  use 'https://tpope.io/vim/repeat.git'

  use {
    'https://tpope.io/vim/commentary.git',
    config = function()
      require('configs/commentary')
    end
  }

  use {
    'https://tpope.io/vim/fugitive.git'
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('configs/gitsigns')
    end
  }

  use {
    'github/copilot.vim',
    config = function()
      require('configs/copilot')
    end
  }

  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries',
    ft = { 'go', 'gomod', 'gosum' },
    config = function()
      require('configs/vim_go')
    end,
  }

  use {
    'buoto/gotests-vim',
    config = function()
      require('configs/gotests')
    end,
    ft = { 'go' },
  }

  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      require('configs/markdown_preview')
    end,
  }

  use {
    'weirongxu/plantuml-previewer.vim',
    requires = {
      'aklt/plantuml-syntax',
      'tyru/open-browser.vim',
    },
    config = function()
      require('configs/plantuml_previewer')
    end,
    ft = { 'plantuml' },
  }

  use {
    'vim-test/vim-test',
    config = function()
      require('configs/vim_test')
    end,
  }

  use {
    'cappyzawa/trim.nvim',
    config = function()
      require('configs/trim')
    end
  }

  use {
    'junegunn/vim-easy-align',
    config = function()
      require('configs/vim_easy_align')
    end,
  }

  use {
    'mattn/vim-maketable'
  }

  use {
    'mfussenegger/nvim-dap',
    requires = {
      'leoluz/nvim-dap-go',
      'theHamsta/nvim-dap-virtual-text',
      'LiadOz/nvim-dap-repl-highlights',
    },
    config = function()
      require('configs/nvim_dap')
    end,
  }

  use {
    'vinnymeller/swagger-preview.nvim',
    config = function()
      require('configs/swagger_preview')
    end,
  }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require('configs/aerial')
    end,
  }

  use {
    'mattn/emmet-vim',
  }

  use {
    'nvim-lua/plenary.nvim'
  }

  use {
    'toppair/peek.nvim',
    run = 'deno task --quiet build:fast',
    config = function()
      require('configs/peek')
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('configs/indent_blankline')
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
