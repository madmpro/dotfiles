#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Virtualization\n"


brew_install "Oracle VirtualBox" "virtualbox" "caskroom/cask" "cask"

brew_install "Oracle VirtualBox Extension Pack" "virtualbox-extension-pack" "caskroom/cask" "cask"

brew_install "VMWare Fusion" "vmware-fusion" "caskroom/cask" "cask"

brew_install "GNS3" "gns3" "caskroom/cask" "cask"

# To do: docker
