#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Graphics Manipulation Tools\n\n"

declare -a FORMULAS=(
    "netpbm"               # Netpbm is a toolkit for manipulation of graphic images, including conversion of images between a variety of different formats
    "pngcheck"             # pngcheck verifies the integrity of PNG, JNG and MNG files

)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done
