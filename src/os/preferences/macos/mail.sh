#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting OS X Mail Settings\n\n"


execute "defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false" \
    "Stop full names from copying with email addresses in OS X Mail"

execute "defaults write ~/Library/Preferences/org.gpgtools.gpgmail SignNewEmailsByDefault -bool false" \
      "Disable signing emails by default"


app_kill "Mail"
