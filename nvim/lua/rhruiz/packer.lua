vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'HiPhish/nvim-ts-rainbow2' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'mg979/vim-visual-multi'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'
  use 'kien/rainbow_parentheses.vim'
  use 'bronson/vim-trailing-whitespace'
  use 'editorconfig/editorconfig-vim'
  use 'wakatime/vim-wakatime'
  use { 'junegunn/fzf', run = './install --bin' }
  use 'junegunn/fzf.vim'
  use 'pbogut/fzf-mru.vim'
  use({ "elixir-tools/elixir-tools.nvim", tag = "stable", requires = { "nvim-lua/plenary.nvim" }})
  use 'github/copilot.vim'

  -- colorschemes
  use 'joshdick/onedark.vim'
  use 'romgrk/doom-one.vim'
  use  { 'sonph/onehalf', rtp = 'vim' }
  use 'rakr/vim-one'
end)
