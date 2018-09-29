#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Language & Region\n\n"

execute "defaults write -g AppleLanguages -array 'ru'" \
    'Set language to "Russian"'

execute "defaults write -g AppleMeasurementUnits -string 'Centimeters'" \
    "Set measurement units"

execute "defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false" \
    "Disable auto-correct"

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
execute 'sudo systemsetup -settimezone "Europe/Moscow" > /dev/null' \
    'Set the timezone to "Europe/Moscow"'
