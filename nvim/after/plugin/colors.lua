vim.opt.termguicolors = vim.env.TERM_PROGRAM ~= "Apple_Terminal"

if inUtterDarkness() then
    vim.g.doom_one_terminal_colors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme onehalfdark]]
else
    vim.g.space_nvim_transparent_bg = true
    vim.o.background = 'light'
    vim.cmd [[colorscheme space-nvim]]
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
