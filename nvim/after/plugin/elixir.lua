local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
    elixirls = {
        enable = true,
        settings = elixirls.settings({
            enableTestLenses = true,
            suggestSpecs = true,
        })
    }
})
