require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "ruby", "c", "lua", "rust", "elixir" },

  sync_install = false,

  auto_install = false,

  additional_vim_regex_highlighting = false,

  highlight = {
    enable = true,
  },
}
