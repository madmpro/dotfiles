#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dropbox\n\n"

brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"

brew_install "MEGAsync" "megasync" "caskroom/cask" "cask"
