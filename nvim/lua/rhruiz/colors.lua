local colors = {}

local runtime = require("rhruiz.runtime")

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

return colors
