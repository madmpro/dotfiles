#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Dock Settings\n\n"

#execute "defaults delete com.apple.dock && killall Dock" \
#     "Reset the Dock to its default state"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true" \
    "Enable spring loading for all Dock items"

execute "defaults write com.apple.dock expose-group-by-app -bool false" \
    "Do not group windows by application in Mission Control"

# Minimization effect: 'genie', 'scale', 'suck'
execute "defaults write com.apple.dock mineffect -string 'scale'" \
    "Change minimize/maximize window effect"

execute "defaults write com.apple.dock minimize-to-application -bool true" \
    "Reduce clutter by minimizing windows into their application icons"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock show-process-indicators -bool true" \
    "Show indicator lights for open applications"

execute "defaults write com.apple.dock showhidden -bool true" \
    "Make icons of hidden applications translucent"

execute "defaults write com.apple.dock tilesize -int 64" \
    "Set icon size"

execute "defaults write com.apple.dock magnification -bool true" \
        "Dock magnification"

# Prefer tabs when opening documents: 'always', 'fullscreen', 'manual'
execute "defaults write NSGlobalDomain AppleWindowTabbingMode -string 'always'" \
        "Prefer tabs when opening documents"

# Dock orientation: 'left', 'bottom', 'right'
execute "defaults write com.apple.dock 'orientation' -string 'bottom'" \
        "Dock orientation: bottom"

# Dock pinning: 'start', 'middle', 'end'
execute "defaults write com.apple.dock pinning -string 'middle'" \
        "Dock pinning: middle"

##== Hot Corners ==============================================================#

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

execute "defaults write com.apple.dock wvous-tl-corner -int 2 && \
         defaults write com.apple.dock wvous-tl-modifier -int 0" \
     "Top left screen corner → Mission Control"

execute "defaults write com.apple.dock wvous-tr-corner -int 4 && \
         defaults write com.apple.dock wvous-tr-modifier -int 0" \
     "Top right screen corner → Desktop"

execute "defaults write com.apple.dock wvous-bl-corner -int 5 && \
        defaults write com.apple.dock wvous-bl-modifier -int 0" \
    "Bottom left screen corner → Start screen saver"

#execute "defaults write com.apple.dock wvous-br-corner -int 10 && \
#         defaults write com.apple.dock wvous-br-modifier -int " \
#    "Bottom right of screen/Hot Corner => Put display to sleep"

##== Persistent Apps ==========================================================#

# Required for persistent apps
execute "defaults write com.apple.dock static-only -bool false" \
    "Show applications in Dock"

# Add special items to the Dock
# Keys:
#   persistent-apps: left side of the Dock
#   persistent-others: right side of the Dock
# Values:
#   Spacer Tile : '{tile-data={}; tile-type="spacer-tile";}'
#   Recent/Favorite items stack: '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'
# Add a spacer to the left of the Dock
# defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'

# Organize dock
execute "defaults write com.apple.dock persistent-apps -array && \
         killall 'Dock' &> /dev/null && \
         sleep 5 && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Launchpad.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/TextMate.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Atom.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>' && \
         defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
        " \
        "Set persistent apps"

execute "defaults write com.apple.dock contents-immutable -bool true" \
        "Lock the Dock contents"

app_kill "Dock"
