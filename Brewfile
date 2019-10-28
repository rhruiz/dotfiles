# vi: ft=ruby

cask_args appdir: "/Applications"

brew "bash"
brew "ripgrep"
brew "git"
brew "wget"

tap "homebrew/cask"

tap "caskroom/fonts"
cask "font-hack"

tap "railwaycat/emacsmacport"
cask "emacs-mac"
cask "macvim"

cask "transmission"
cask "google-chrome"
cask "flux"
cask "kodi"

mas "Telephone", id: 406825478

# letsencrypt

brew "certbot"

# keyboard/qmk

tap "osx-cross/avr"
tap "PX4/homebrew-px4"
brew "avr-gcc@8", link: true, conflicts_with: ["avr-gcc"]
brew "gcc-arm-none-eabi"
brew "dfu-programmer"
brew "avrdude"
brew "dfu-util"
brew "clang-format"
brew "python3"

tap "homebrew/cask-drivers"
cask "qmk-toolbox"

