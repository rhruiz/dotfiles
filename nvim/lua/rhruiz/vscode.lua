local vscode = require("vscode")

local action = function (name)
	return function()
		vscode.action(name)
	end
end

vim.keymap.set({"n", "v"}, "<leader>b", action("workbench.action.showAllEditors"))
vim.keymap.set({"n", "v"}, "<leader>fp", action("workbench.action.quickOpen"))
vim.keymap.set({"n", "v"}, "<leader>ff", action("workbench.action.quickOpen"))
vim.keymap.set({"n", "v"}, "<leader>sp", action("workbench.action.quickTextSearch"))
vim.keymap.set({"n", "v"}, "<leader>fr", action("workbench.action.openRecent"))
