#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Photos Settings\n\n"

execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
    "Prevent Photos from opening automatically when devices are plugged in"

app_kill "Photos"
