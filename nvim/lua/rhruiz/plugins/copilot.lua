local runtime = require("rhruiz.runtime")

return {
  {
    "zbirenbaum/copilot-cmp",
    cond = runtime.load_copilot,
    config = function ()
      require("copilot_cmp").setup()
    end
  },
  {
    -- 'github/copilot.vim',
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    cond = runtime.load_copilot,
    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
          auto_refresh = true,
          -- keymap = {
          --   jump_prev = "[[",
          --   jump_next = "]]",
          --   accept = "<CR>",
          --   refresh = "gr",
          --   open = "<M-CR>"
          -- },
          -- layout = {
          --   position = "bottom", -- | top | left | right
          --   ratio = 0.4
          -- },
        },
        suggestion = {
          enabled = false,
          -- auto_trigger = true
          -- debounce = 75,
          -- keymap = {
          --   accept = "<Tab>",
          --   accept_word = false,
          --   accept_line = false,
          --   next = "<M-]>",
          --   prev = "<M-[>",
          --   dismiss = "<C-]>",
          -- },
        },
        filetypes = {
          yaml = false,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = runtime.load_copilot,
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
