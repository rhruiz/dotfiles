if vim.fn.has("termguicolors") and vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
    vim.opt.termguicolors = true

    if vim.env.ITERM_PROFILE ~= "Spacemacs light" then
        vim.g.doom_one_terminal_colors = true
        vim.o.background = 'dark'
        vim.cmd [[colorscheme onehalfdark]]
    end
else
    vim.o.background = 'light'
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
