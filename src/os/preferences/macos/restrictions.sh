#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Restrictions Settings\n\n"

execute "sudo defaults write /Library/Preferences/com.apple.AppleFileServer guestAccess -bool NO && \
         sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server AllowGuestAccess -bool NO && \
         sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool NO" \
    "Disable guest access"

execute "chown $DEFAULT_USER ${HOME}/ && \
         chmod 700 ${HOME}/" \
    "Disabling access to main user folder access"
