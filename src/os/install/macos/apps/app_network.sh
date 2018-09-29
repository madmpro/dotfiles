#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Network Tools\n\n"

brew_install "WireShark" "wireshark" "caskroom/cask" "cask"

brew_install "Zenmap" "zenmap" "caskroom/cask" "cask"

brew_install "Angry IP Scanner" "angry-ip-scanner" "caskroom/cask" "cask"

brew_install "Transmission" "transmission" "caskroom/cask" "cask"

brew_install "TeamViewer" "teamviewer" "caskroom/cask" "cask"

brew_install "Tunnelblick" "tunnelblick" "caskroom/cask" "cask"

brew_install "FileZilla" "filezilla" "caskroom/cask" "cask"

brew_install "CyberDuck" "cyberduck" "caskroom/cask" "cask"

brew_install "Microsoft Remote Desktop Beta" "microsoft-remote-desktop-beta" "caskroom/versions" "cask"
