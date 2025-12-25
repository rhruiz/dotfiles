local colors = {}

local runtime = require("rhruiz.runtime")

function colors.transparent_bg()
	vim.cmd [[hi Normal ctermbg=NONE guibg=NONE]]
	vim.cmd [[hi LineNr ctermbg=NONE guibg=NONE]]
	vim.cmd [[hi SignColumn ctermbg=NONE guibg=NONE]]
end

function colors.is_dark_mode()
	if vim.env.TERMINAL_BG == "dark" then
		return true
	end

	if vim.env.TERMINAL_BG == "light" then
		return false
	end

	if runtime.is_kitty() or runtime.is_terminal_app() then
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
