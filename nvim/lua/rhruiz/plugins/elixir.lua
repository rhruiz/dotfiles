return {
   "elixir-tools/elixir-tools.nvim",
  tag = "stable",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function ()
    local elixir = require("elixir")

    elixir.setup({
      nextls = {
        enable = true, -- defaults to false
        init_options = {
          mix_env = "dev",
          mix_target = "host",
          experimental = {
            completions = {
              enable = true -- control if completions are enabled. defaults to false
            }
          },
        },
      },
      elixirls = {
        enable = true,
      }
    })
  end
}
