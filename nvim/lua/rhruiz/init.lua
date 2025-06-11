require("rhruiz.settings")
pcall(function() require("rhruiz/local_settings") end)
require("rhruiz.lazy")
require("rhruiz.remap")
require("rhruiz.ruby")
local colors = require("rhruiz.colors")
local runtime = require("rhruiz.runtime")

if not runtime.vscode then
	if colors.is_dark_mode() then
		vim.g.doom_one_terminal_colors = true
		vim.o.background = 'dark'
		vim.cmd [[colorscheme onehalfdark]]
	else
		vim.o.background = 'light'
		vim.cmd [[colorscheme space_vim_theme]]
	end

	if colors.use_transparent_bg() then
		colors.transparent_bg()
	end
end
