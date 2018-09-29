#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Video Tools\n\n"

brew_install "FFmpeg" "ffmpeg --with-libvpx"
brew_install "VLC" "vlc" "caskroom/cask" "cask"

brew_install "FLAC" "flac"
brew_install "libMatroska" "libmatroska"

brew_install "MKVToolNix" "mkvtoolnix --with-qt5"

brew_install "HandBrake" "handbrake" "caskroom/cask" "cask"

brew_install "IINA" "iina" "caskroom/cask" "cask"

brew_install "FluidSynth" "fluidsynth" # midi player
