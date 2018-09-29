#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Games\n\n"

brew_install "Steam" "steam" "caskroom/cask" "cask"
brew_install "Bink Player" "bink-player" "caskroom/cask" "cask"
