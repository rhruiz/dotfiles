vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>fy", function()
    vim.fn.setreg("", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.'))
end)

vim.keymap.set("n", "<leader>fY", function()
    vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand('%:p'), ':p:~:.'))
end)
