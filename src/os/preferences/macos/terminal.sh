#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Terminal Settings\n\n"

execute "defaults write com.apple.terminal FocusFollowsMouse -string true" \
    "Make the focus automatically follow the mouse"

execute "defaults write com.apple.terminal SecureKeyboardEntry -bool true" \
    "Enable 'Secure Keyboard Entry'"

execute "defaults write com.apple.terminal ShowLineMarks -int 0" \
    "Hide line marks"

execute "defaults write com.apple.terminal StringEncodings -array 4" \
    "Only use UTF-8"

execute "./set_terminal_theme.applescript" \
    "Set custom terminal theme"

# Use a modified version of the Solarized Dark theme by default in Terminal.app
# TERM_PROFILE='Solarized Dark xterm-256color';
# CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
# if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
# 	open "${HOME}/init/${TERM_PROFILE}.terminal";
# 	sleep 1; # Wait a bit to make sure the theme is loaded
# 	defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
# 	defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
# fi;
