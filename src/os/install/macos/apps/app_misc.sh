#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Desktop Apps\n\n"

brew_install "Spectacle" "spectacle" "caskroom/cask" "cask"

brew_install "FIGlet" "figlet"
brew_install "f.lux" "flux" "caskroom/cask" "cask"
brew_install "SiteSucker" "sitesucker" "caskroom/cask" "cask"
brew_install "Gas Mask" "gas-mask" "caskroom/cask" "cask"

brew_install "1Password" "1password" "caskroom/cask" "cask"
brew_install "MacPass" "macpass" "caskroom/cask" "cask"

#brew_install "VeraCrypt" "veracrypt" "caskroom/cask" "cask"

#brew_install "yubikey-personalization-gui" "yubikey-personalization-gui" "caskroom/cask" "cask"
#brew_install "yubiswitch" "yubiswitch" "caskroom/cask" "cask"

brew_install "logitech-control-center" "logitech-control-center" "caskroom/drivers" "cask"

###############################################################################
# Übersicht                                                                   #
###############################################################################
brew_install "Übersicht" "ubersicht" "caskroom/cask" "cask"
brew_install "Keybase.io" "keybase" "caskroom/cask" "cask"

if [[ -d "$HOME/Library/Application Support/Übersicht" ]]; then
  rm -rf "$HOME/Library/Application Support/Übersicht"
fi

ln -sf "$HOME/Projects/dotfiles/src/dotfiles/Übersicht" "$HOME/Library/Application Support/"
