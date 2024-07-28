local colors = {}

local runtime = require("rhruiz.runtime")

function colors.transparent_bg()
	vim.cmd [[hi Normal ctermbg=NONE guibg=NONE]]
	vim.cmd [[hi LineNr ctermbg=NONE guibg=NONE]]
	vim.cmd [[hi SignColumn ctermbg=NONE guibg=NONE]]
end

function colors.is_dark_mode()
	if runtime.is_kitty() then
		return false
	end

	if runtime.is_truecolor() then
		return true
	end

	return not runtime.is_terminal_app()
		and vim.env.ITERM_PROFILE ~= "Spacemacs light"
end

function colors.use_transparent_bg()
	return not colors.is_dark_mode() or
		(runtime.is_wezterm() and runtime.is_mac())
end

return colors
