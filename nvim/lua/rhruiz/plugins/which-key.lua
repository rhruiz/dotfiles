return {
  'folke/which-key.nvim',
  cond = not require("rhruiz.runtime").vscode,
  config = function()
    local wk = require("which-key")
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.setup({
      spec = {
        { "<leader>?",
          wk.show,
          desc = "Buffer local keymaps"
        },
      },
    })
  end
}
