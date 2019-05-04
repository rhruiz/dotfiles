# vi: ft=ruby

cask_args appdir: "/Applications"

brew "bash"
brew "ripgrep"
brew "git"

tap "homebrew/cask"

tap "caskroom/fonts"
cask "font-hack"

tap "railwaycat/emacsmacport"
cask "emacs-mac"

cask "transmission"
cask "google-chrome"
cask "flux"
cask "kodi"

# keyboard/qmk
#
tap "osx-cross/avr"
tap "PX4/homebrew-px4"
brew "avr-gcc@7", link: true, conflicts_with: ["avr-gcc"]
brew "gcc-arm-none-eabi"
brew "dfu-programmer"
brew "avrdude"
brew "dfu-util"
