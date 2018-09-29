#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock" \
    "Reset Launchpad Layout in OS X"
