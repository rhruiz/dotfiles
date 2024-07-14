return {
  { 'liuchengxu/space-vim-theme', priority = 1000 },
  { 'joshdick/onedark.vim', priority = 1000 },
  { 'folke/tokyonight.nvim', priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { 'romgrk/doom-one.vim', priority = 1000 },
  { 'sonph/onehalf', priority = 1000, config = function(p) vim.opt.rtp:append(p.dir .. '/vim')  end},
  { 'rakr/vim-one', priority = 1000 },
}
