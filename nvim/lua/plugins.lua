-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)

-- Packer сам себя
  use 'wbthomason/packer.nvim'

-- Color Theme
  use 'folke/tokyonight.nvim'

-- Frendly Snippets
  use 'rafamadriz/friendly-snippets'

-- Icons
  use 'onsails/lspkind-nvim'

-- Autosave
  use {
  	'Pocco81/auto-save.nvim',
  	config = function()
  		require('plugins.auto-save')
    end 
  }

--AUTOPAIRS--
  use {
	  'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

-- Lsp lines
   use{
   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
     config = function()
       require('plugins.lsp_lines')
     end,
   }

-- LSP
  -- use {
  --   'neovim/nvim-lspconfig',
  --   config = function()
  --     require('plugins.lspconfig')
  --    end
  -- }

-- Notify
  use {
    'rcarriga/nvim-notify',
    config = function ()
      require('plugins.notify')
    end
  }

-- Tabs top
  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('plugins.bufferline')
    end
  }

-- Terminal
  use {
    'akinsho/toggleterm.nvim', tag = '*',
    config = function()
      require('plugins.toggleterm')
    end
  }

-- Flutter/Dart
  use {
    'akinsho/flutter-tools.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('plugins.flutter')
    end
  }

-- Lightbulb
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
    config = function()
      require('plugins.lightbulb')
    end
  }

-- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
    	require('plugins.lualine')
    end
  }

-- Files Manager
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly',
    config = function()
      require('plugins.nvim-tree')
    end
  }


-- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins.treesitter')
    end
  }

-- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-ui-select.nvim' },
    config = function()
      require('plugins.telescope')
    end
  }

-- NVIM-CMP
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp-signature-help'
    },
    config = function()
      require('plugins.cmp')
    end
  }

-- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

-- Future
  -- use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
  --   require('git-conflict').setup()
  -- end }


  use {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require('plugins.dap')
    end,
  }

-- Tabnine
  use {
    'tzachar/cmp-tabnine',
    run = './install.sh',
    {requires = 'hrsh7th/nvim-cmp'},
    config = function()
      require('plugins.tabnine')
    end
  }
end)
