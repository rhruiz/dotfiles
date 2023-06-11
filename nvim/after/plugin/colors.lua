if inUtterDarkness() then
    vim.opt.termguicolors = true
    vim.g.doom_one_terminal_colors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme onehalfdark]]
else
    vim.o.background = 'light'
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
