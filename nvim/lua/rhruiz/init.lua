
local colors = require("rhruiz/colors")
require("rhruiz/settings")
pcall(function() require("rhruiz/local_settings") end)
require("rhruiz/lazy")
require("rhruiz/remap")
require("rhruiz/ruby")

vim.opt.termguicolors = vim.env.TERM_PROGRAM ~= "Apple_Terminal"

if colors.inUtterDarkness() then
    vim.g.doom_one_terminal_colors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme onehalfdark]]
else
    vim.o.background = 'light'
    vim.cmd [[colorscheme space_vim_theme]]
end
