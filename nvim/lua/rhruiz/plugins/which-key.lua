return {
  'folke/which-key.nvim',
  keys = {
    {
      "<leader>?",
      function () require("which-key").show() end,
      desc = "Buffef local keymaps"
    },
  },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end
}
