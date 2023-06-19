require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "c", "lua", "rust", "elixir" },

  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { 'jsx', 'vue' },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  },

  sync_install = false,

  auto_install = false,

  additional_vim_regex_highlighting = false,

  highlight = {
    enable = true,
  },
}
