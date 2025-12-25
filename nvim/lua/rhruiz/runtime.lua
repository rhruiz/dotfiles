local runtime = {}

function runtime.is_wezterm() return vim.env.TERM_PROGRAM == "WezTerm" end

function runtime.is_ghostty() return vim.env.TERM_PROGRAM == "ghostty" end

function runtime.is_mac() return vim.loop.os_uname().sysname == "Darwin" end

function runtime.is_kitty() return vim.env.KITTY_TERM == "1" end

function runtime.is_truecolor() return vim.env.COLORTERM == "truecolor" end

function runtime.is_terminal_app()
	return vim.env.TERM_PROGRAM == "Apple_Terminal"
end

runtime.vscode = vim.g.vscode ~= nil

runtime.load_copilot = false

return runtime
