#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install "MySQL Workbench" "mysqlworkbench" "caskroom/cask" "cask"

brew_install "Sequel Pro" "sequel-pro"  "caskroom/cask" "cask"

brew_install "Arduino" "arduino"  "caskroom/cask" "cask"

brew_install "quicklook-json" "quicklook-json" "caskroom/cask" "cask"

brew_install "quicklook-csv" "quicklook-csv" "caskroom/cask" "cask"

brew_install "Hammerspoon" "hammerspoon" "caskroom/cask" "cask"

brew_install "PGAdmin3" "pgadmin3" "caskroom/cask" "cask"

brew_install "Kdiff3" "kdiff3" "caskroom/cask" "cask"

brew_install "now" "now" "caskroom/cask" "cask" # Native application for https://zeit.co/now

brew_install "Radare2" "radare2"
