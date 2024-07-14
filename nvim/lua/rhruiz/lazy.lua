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
  { 'numToStr/Comment.nvim', opts = {} },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-vinegar',
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
    keys = {
      {
        "<leader>?",
        function () require("which-key").show() end,
        desc = "Buffef local keymaps"
      },
    },
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup {
        plugins = {
          marks = true,
          registers = true,
        }
      }
    end,
  },
  'mg979/vim-visual-multi',
  'bronson/vim-trailing-whitespace',
  'editorconfig/editorconfig-vim',
  'wakatime/vim-wakatime',
  {
    'mistricky/codesnap.nvim',
    build = 'make',
    config = function()
      require('codesnap').setup({
        code_font_family = "Hack Nerd Font",
        bg_theme = "grape",
      })
    end,
  },

  -- colorschemes,
  { 'liuchengxu/space-vim-theme', priority = 1000 },
  { 'joshdick/onedark.vim', priority = 1000 },
  { 'folke/tokyonight.nvim', priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'romgrk/doom-one.vim', priority = 1000 },
  { 'sonph/onehalf', priority = 1000, config = function(p) vim.opt.rtp:append(p.dir .. '/vim')  end},
  { 'rakr/vim-one', priority = 1000 },
  { import = 'rhruiz.plugins' },
})
