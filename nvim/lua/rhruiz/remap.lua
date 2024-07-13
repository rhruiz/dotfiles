vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

local wk = require('which-key')

wk.add({
	{ '<leader>f', group = 'file' },
	{ '<leader>fy', function() vim.fn.setreg("", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end, desc = 'Yank file path' },
	{ '<leader>fY', function() vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end,  desc = 'Yank file path to clipboard' },
})
