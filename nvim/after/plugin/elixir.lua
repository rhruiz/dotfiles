local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

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
            }
        },
    },
    credo = {
        enable = false, -- defaults to true
    },
    elixirls = {
        enable = false,
    }
})
