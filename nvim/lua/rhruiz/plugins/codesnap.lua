return {
  'mistricky/codesnap.nvim',
  build = 'make',
  cond = not require('rhruiz.runtime').vscode,
  config = function()
    require('codesnap').setup({
      code_font_family = "Hack Nerd Font",
      bg_theme = "grape",
      save_path = "~/Desktop/"
    })
  end,
}
