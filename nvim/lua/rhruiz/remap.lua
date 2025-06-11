vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })


if not require("rhruiz.runtime").vscode then
	require('which-key').add({
		{ '<leader>f', group = 'file' },
		{ '<leader>b', group = 'buffer' },
		{ '<leader>bd', function() vim.cmd [[bd]] end, desc = 'Close buffer' },
		{ '<leader>bn', function() vim.cmd [[bn]] end, desc = 'Next buffer' },
		{ '<leader>bp', function() vim.cmd [[bp]] end, desc = 'Prev buffer' },
		{ '<leader>fy', function() vim.fn.setreg("", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end, desc = 'Yank file path' },
		{ '<leader>fY', function() vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.')) end,  desc = 'Yank file path to clipboard' },
	})
end
