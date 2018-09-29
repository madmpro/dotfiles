#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   WineHQ - devel\n\n"


brew_install "XQuartz" "xquartz" "caskroom/cask" "cask"
brew_install "WineHQ - Be patient, this may take long time" "wine --devel"
brew_install "winetricks" "winetricks"

brew_install "Wineskin" "wineskin-winery" "caskroom/cask" "cask"

brew_install "DOSBox" "dosbox" "caskroom/cask" "cask"
brew_install "Boxer" "boxer" "caskroom/cask" "cask"
