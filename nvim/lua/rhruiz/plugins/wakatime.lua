return {
  {
    "wakatime/vim-wakatime",
    opts = { status_bar_enabled = false },
    cond = not require("rhruiz.runtime").vscode
  }
}
