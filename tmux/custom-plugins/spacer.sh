show_spacer() {
  [[ "$(uname -s)" == "Darwin" ]] && [ "$TERM" = "alacritty" ] && echo "#[fg=black]      "
}
