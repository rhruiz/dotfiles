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
