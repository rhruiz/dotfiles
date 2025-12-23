return {
  'mistricky/codesnap.nvim',
  tag = "v1.6.3",
  build = 'make',
  cond = not require('rhruiz.runtime').vscode,
  config = function()
    require('codesnap').setup({
      code_font_family = "Hack Nerd Font",
      bg_x_margin = 10,
      bg_y_margin = 10,
      bg_margin = nil,
      bg_theme = "grape",
      save_path = "~/Desktop/",
      watermark = "",
    })
  end,
}
