local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
       'nvim-tree/nvim-web-devicons',
    }
  },
  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts = {
          ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'elixir', 'ruby' },
          auto_install = true,
          highlight = {
              enable = true,
              additional_vim_regex_highlighting = { 'ruby' },
          },
          indent = { enable = true, disable = { 'ruby' } },
      },
      config = function(_, opts)
          require('nvim-treesitter.install').prefer_git = true
          require('nvim-treesitter.configs').setup(opts)
      end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        max_lines = 5,
      })
    end,
  },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-vinegar',
  -- 'tpope/vim-surround',
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
    end,
  },
  'tpope/vim-repeat',
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        plugins = {
          marks = true,
          registers = true,
        },
      }
    end,
  },
  { 'HiPhish/rainbow-delimiters.nvim' },
  'mg979/vim-visual-multi',
  'bronson/vim-trailing-whitespace',
  'editorconfig/editorconfig-vim',
  'wakatime/vim-wakatime',
  { "elixir-tools/elixir-tools.nvim", tag = "stable", dependencies = { "nvim-lua/plenary.nvim" }},
  'github/copilot.vim',
  -- { "zbirenbaum/copilot.lua" },

  -- colorschemes,
  { 'joshdick/onedark.vim' },
  { 'folke/tokyonight.nvim' },
  { 'romgrk/doom-one.vim' },
  { 'sonph/onehalf', config = function(p) vim.opt.rtp:append(p.dir .. '/vim')  end},
  { 'rakr/vim-one' },
})
