#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Paragon Software Settings\n\n"

execute "defaults write com.paragon-software.ntfs.fsapp AnalyticsDisabled -int 1" \
    "Disable statistics"

execute "defaults write com.paragon-software.ntfs.fsapp AppTheme -string 'Dark'" \
    "Set App Theme to Dark"

execute "defaults write com.paragon-software.ntfs.FSMenuApp AppTheme -string 'Dark'" \
    "Set Menu App Theme to Dark"
