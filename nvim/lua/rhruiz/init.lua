require("rhruiz/settings")
pcall(function() require("rhruiz/local_settings") end)
require("rhruiz/lazy")
require("rhruiz/remap")
require("rhruiz/ruby")

if require("rhruiz/colors").inUtterDarkness() then
    vim.g.doom_one_terminal_colors = true
    vim.o.background = 'dark'
    vim.cmd [[colorscheme onehalfdark]]
else
    vim.o.background = 'light'
    vim.cmd [[colorscheme space_vim_theme]]
    vim.cmd [[hi Normal ctermbg=NONE guibg=NONE]]
    vim.cmd [[hi LineNr ctermbg=NONE guibg=NONE]]
    vim.cmd [[hi SignColumn ctermbg=NONE guibg=NONE]]
end
