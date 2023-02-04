local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  vim.api.nvim_command('packadd packer.nvim')
end
return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {'rose-pine/neovim', config = "vim.cmd('colorscheme rose-pine')"}
    use {'nvim-tree/nvim-web-devicons'} -- Icons for programming languages
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate",
      event = "BufWinEnter",
      config = "require('treesitter-config')"
    }
    use {
      'tamton-aquib/staline.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      event = "BufRead",
      config = "require('staline-config')"
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = "require('todo-config')"
    }
    use {
      'rcarriga/nvim-notify',
      config = function()
        require("notify").setup {
          stages = 'fade_in_slide_out',
          background_colour = 'FloatShadow',
          timeout = 3000
        }
        vim.notify = require('notify')
      end
    }
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      event = "BufWinEnter",
      config = "require('bufferline-config')"
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = "NvimTreeToggle",
      config = "require('nvim-tree-config')"
    }
    -- Old settings
    use {'nvim-lua/plenary.nvim'}
    use {'terryma/vim-multiple-cursors'} -- CTRL + N for multiple cursors
    use {'ap/vim-css-color'} -- CSS Color Preview
    use {'rafi/awesome-vim-colorschemes'} -- Color Schemes
    use {'tpope/vim-surround'} -- Surrounding ysw
    use {'mattn/emmet-vim'}
    use {'airblade/vim-gitgutter'}

    use {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter"}
    use {'p00f/nvim-ts-rainbow', after = "nvim-treesitter"}
    use {'windwp/nvim-autopairs', config = "require('autopairs-config')", after = "nvim-cmp"}
    use {'folke/which-key.nvim', event = "BufWinEnter", config = "require('whichkey-config')"}
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/plenary.nvim'}},
      cmd = "Telescope",
      config = "require('telescope-config')"
    }
    use {"williamboman/mason.nvim"}
    use {"williamboman/mason-lspconfig.nvim"}
    use {'neovim/nvim-lspconfig', config = "require('lsp')"}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/nvim-cmp'}
    -- use { 'williamboman/nvim-lsp-installer' }

    -- use { 'hrsh7th/cmp-vsnip' }
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'onsails/lspkind-nvim'}
    use {'norcalli/nvim-colorizer.lua', config = "require('colorizer-config')", event = "BufRead"}
    use {
      'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = function()
        require('gitsigns').setup {current_line_blame = true}
      end
    }
    use {
      'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = "require('dashboard-config')",
      requires = {'nvim-tree/nvim-web-devicons'}
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = "require('blankline-config')",
      event = "BufRead"
    }
    use {"akinsho/toggleterm.nvim", config = "require('toggleterm-config')"}
    use {"terrortylor/nvim-comment", config = "require('comment-config')"}
    use {'tami5/lspsaga.nvim', config = "require('lspsaga-config')"}
    use {'jose-elias-alvarez/null-ls.nvim', config = "require('null-ls-config')"}
    use {"folke/zen-mode.nvim", config = 'require("zen-mode-config")'}
    use {"folke/twilight.nvim", config = "require('twilight-config')"}
    use {'andweeb/presence.nvim', config = "require('presence-config')"}
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({border = 'single'})
      end
    }
  }
})
