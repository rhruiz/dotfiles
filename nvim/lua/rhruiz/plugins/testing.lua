if require('rhruiz.runtime').vscode then
  return {}
end

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir",
    "nvim-neotest/neotest-plenary",
  },
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir"),
        require("neotest-plenary"),
      }
    })

    local run = require("neotest").run.run

    require('which-key').add({
      { '<leader>tr', run, desc = '[T]est: [R]un' },
      { '<leader>tf', function() run(vim.fn.expand("%")) end, desc = '[T]est: Run [F]ile' },
    })
  end
}
