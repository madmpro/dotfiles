#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Office\n"

brew_install "Evernote" "evernote" "caskroom/cask" "cask"
brew_install "Skitch" "skitch" "caskroom/cask" "cask"

brew_install "LibreOffice" "libreoffice" "caskroom/cask" "cask"

brew_install "MacDjView" "macdjview" "caskroom/cask" "cask"

brew_install "Adobe Acrobat Reader DC" "adobe-acrobat-reader" "caskroom/cask" "cask"
