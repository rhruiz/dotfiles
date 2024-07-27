require("rhruiz.settings")
pcall(function() require("rhruiz/local_settings") end)
require("rhruiz.lazy")
require("rhruiz.remap")
require("rhruiz.ruby")
local runtime = require("rhruiz.runtime")
local colors = require("rhruiz.colors")

if require("rhruiz.colors").is_dark_mode() then
	vim.g.doom_one_terminal_colors = true
	vim.o.background = 'dark'
	vim.cmd [[colorscheme onehalfdark]]

	if runtime.is_wezterm() and runtime.is_mac() then
		colors.transparent_bg()
	end
else
	vim.o.background = 'light'
	vim.cmd [[colorscheme space_vim_theme]]
	colors.transparent_bg()
end
