#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Web Font Tools\n\n"

brew_install "Web Font Tools: TTF/OTF → WOFF (Zopfli)" "sfnt2woff-zopfli" "bramstein/webfonttools"
brew_install "Web Font Tools: TTF/OTF → WOFF" "sfnt2woff" "bramstein/webfonttools"
brew_install "Web Font Tools: WOFF2" "woff2" "bramstein/webfonttools"

brew_install "FreeType" "freetype"      # FreeType, a popular font rendering engine
brew_install "Graphite2" "graphite2"    # Graphite2 is a rendering engine for graphite fonts.

brew_install "font-inconsolata" "font-inconsolata" "caskroom/fonts" "cask"
brew_install "font-anonymous-pro" "font-anonymous-pro" "caskroom/fonts" "cask"
brew_install "font-anonymice-powerline" "font-anonymice-powerline" "caskroom/fonts" "cask"
brew_install "font-courier-prime" "font-courier-prime" "caskroom/fonts" "cask"
brew_install "font-source-code-pro" "font-source-code-pro" "caskroom/fonts" "cask"
brew_install "font-source-code-pro-for-powerline" "font-source-code-pro-for-powerline" "caskroom/fonts" "cask"
brew_install "font-meslo-for-powerline" "font-meslo-for-powerline" "caskroom/fonts" "cask"
