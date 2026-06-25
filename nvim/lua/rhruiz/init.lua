require('vim._core.ui2').enable({
	enable = true,
	msg = {
		target = "cmd",
		pager = { height = 0.5 },
		dialog = { height = 0.5 },
		cmd = { height = 0.5 },
		msg = { height = 0.5, timeout = 4500 },
	}
})

local runtime = require("rhruiz.runtime")
require("rhruiz.settings")
pcall(function() require("rhruiz/local_settings") end)
require("rhruiz.lazy")
require("rhruiz.remap")
require("rhruiz.ruby")
local colors = require("rhruiz.colors")

if not runtime.vscode then
	if colors.is_dark_mode() then
		vim.g.doom_one_terminal_colors = true
		vim.o.background = 'dark'
		vim.cmd [[colorscheme onehalfdark]]
	else
		vim.o.background = 'light'
		vim.cmd [[colorscheme space_vim_theme]]
	end

	colors.transparent_bg()
else
	require("rhruiz.vscode")
end
