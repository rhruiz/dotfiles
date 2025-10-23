vim.opt.guicursor = "i:block"
vim.opt.termguicolors = vim.env.TERM_PROGRAM ~= "Apple_Terminal"

vim.opt.nu = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.linespace = 2

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.backspace = "indent,eol,start"

vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.wildmenu = true

vim.opt.colorcolumn = "80,100,120"
vim.opt.title = true
vim.opt.updatetime = 250
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
