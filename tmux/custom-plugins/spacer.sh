show_spacer() {
  [[ "$(uname -s)" == "Darwin" ]] && ([ "$TERM" = "alacritty" ] || [ "$TERM_PROGRAM" = "WezTerm" ]) && echo "#[fg=black]      "
}
