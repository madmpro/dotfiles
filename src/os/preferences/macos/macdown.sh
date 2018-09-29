m#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting MacDown Settings\n\n"


execute "defaults write com.uranusjr.macdown SUEnableAutomaticChecks -bool true" \
    "Enable automatic updates checks"

execute "defaults write com.uranusjr.macdown htmlStyleName -string 'GitHub2'" \
    "Set HTML Style"

app_kill "MacDown"
