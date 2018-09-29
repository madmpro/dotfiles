#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


print_in_purple "\n   Adjusting Chrome Settings\n\n"

execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
    "Disable backswipe"

execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand print dialog by default"

execute "defaults write com.google.Chrome DisablePrintPreview -bool false" \
    "Use system-native print preview dialog"

execute "defaults write com.google.Chrome ExtensionInstallSources -array 'https://gist.githubusercontent.com/' 'http://userscripts.org/*'" \
      "Allow installing user scripts via GitHub Gist or Userscripts.org"

app_kill "Google Chrome"
