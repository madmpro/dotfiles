#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Image Editors & Tools\n\n"


brew_install "ImageAlpha" "imagealpha" "caskroom/cask" "cask"
brew_install "ImageMagick" "imagemagick --with-webp"
brew_install "Tesseract OCR" "tesseract --all-languages"

brew_install "ImageOptim" "imageoptim" "caskroom/cask" "cask"
brew_install "LICEcap" "licecap" "caskroom/cask" "cask"

brew_install "GIMP" "lisanet-gimp" "caskroom/cask" "cask"
brew_install "Inkscape" "inkscape" "caskroom/cask" "cask"

brew_install "XnViewMP" "xnviewmp" "caskroom/cask" "cask"

brew_install "Adobe Creative Cloud" "adobe-creative-cloud" "caskroom/cask" "cask"

print_in_purple "\n   Quick Look plugins\n\n"
# List of useful Quick Look plugins for developers
brew_install "Quick Look plugins" "qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize webpquicklook suspicious-package quicklookase qlvideo" "caskroom/cask" "cask"

brew_install "Adobe Creative Cloud" "adobe-creative-cloud" "caskroom/cask" "cask"


# brew_install "Google Nik Collection" "google-nik-collection" "caskroom/cask" "cask"
