local runtime = require("rhruiz.runtime")

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = runtime.load_copilot,
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
  }
}
