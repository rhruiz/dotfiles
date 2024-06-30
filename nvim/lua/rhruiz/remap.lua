vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

local wk = require('which-key')

wk.register({
	["<leader>f"] = {
		name = "+file",
		y = { function() vim.fn.setreg("", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end, 'Yank file path' },
		Y = { function() vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end, 'Yank file path to clipboard' },
	},
})
