#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Paragon Software\n"

brew_install "Paragon NTFS for Mac" "paragon-ntfs" "caskroom/cask" "cask"

brew_install "Paragon VMDK Mounter" "paragon-vmdk-mounter" "caskroom/cask" "cask"
