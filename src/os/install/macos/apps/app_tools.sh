#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Tools & Utilities\n\n"

brew_install "Android File Transfer" "android-file-transfer" "caskroom/cask" "cask"

brew_install "DropDMG" "dropdmg" "caskroom/cask" "cask"

brew_install "Unarchiver" "the-unarchiver" "caskroom/cask" "cask"

brew_install "Disk Inventory X" "disk-inventory-x" "caskroom/cask" "cask"

brew_install "Keka" "keka" "caskroom/cask" "cask"

brew_install "iTerm2" "iterm2" "caskroom/cask" "cask"

brew_install "Upterm" "upterm" "caskroom/cask" "cask"

brew_install "Cheat Sheet" "cheatsheet" "caskroom/cask" "cask"

# Bootable USB creator
brew_install "Etcher" "etcher" "caskroom/cask" "cask"

brew_install "UNetbootin" "unetbootin" "caskroom/cask" "cask"

brew_install "Bitwarden" "bitwarden" "caskroom/cask" "cask"

# VICE is a program that runs on a Unix, MS-DOS, Win32, OS/2, BeOS, QNX 4.x, QNX 6.x, Amiga,
# Syllable or Mac OS X machine and executes programs intended for the old 8-bit computers.
brew_install "Vice" "vice"

# USB Tethering driver
brew_install "HoRNDIS" "horndis" "caskroom/cask" "cask"
# Uninstall HoRNDIS
# Delete the HoRNDIS.kext under /System/Library/Extensions and /Library/Extensions folder
# Restart your computer
