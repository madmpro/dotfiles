#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   App Store Programs\n\n"

# https://github.com/mas-cli/mas
brew_install "Mac App Store command line interface" "mas" # Required

execute "mas install 715768417" \
    "Microsoft Remote Desktop"

execute "mas install 639968404" \
    "Parcel"

execute "mas install 402592703" \
    "Dejal timeout"
