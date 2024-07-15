local colors = {}

function colors.inUtterDarkness()
		if vim.env.KITTY_TERM == "1" then
				return false
		end
		if vim.env.COLORTERM == "truecolor" then
				return true
		end
		return vim.env.GNOME_TERMINAL_SCREEN ~= nil
				and vim.env.TERM_PROGRAM ~= "Apple_Terminal"
				and vim.env.ITERM_PROFILE ~= "Spacemacs light"
end

return colors