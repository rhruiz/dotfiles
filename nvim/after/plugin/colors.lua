vim.opt.termguicolors = vim.env.TERM_PROGRAM ~= "Apple_Terminal"

if inUtterDarkness() then
    vim.g.doom_one_terminal_colors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme onehalfdark]]
else
    vim.o.background = 'light'
    vim.cmd [[colorscheme space_vim_theme]]
end
