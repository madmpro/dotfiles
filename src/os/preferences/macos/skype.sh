#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Skype Settings\n\n"

execute "defaults write com.skype.skype AutoCollapseChatView -bool false && \
         defaults write com.skype.skype ChatViewIsCollapsed -bool false" \
    "Show Skype's chat view by default"

execute "defaults write com.skype.skype AutoCollapseSidebar -bool false && \
         defaults write com.skype.skype SidebarIsCollapsed -bool false" \
    "Show Skype's sidebar by default"

execute "defaults write com.skype.skype DialpadOpen -bool false && \
         defaults write com.skype.skype ShowDialpadOnLogin -bool false" \
    "Disable the Skype login dialpad"

## Enable the Skype WebKit Developer Tools
#defaults write com.skype.skype DisableWebKitDeveloperExtras -bool false
#defaults write com.skype.skype WebKitDeveloperExtras -bool true

## Enable the Skype Debug Menu
#defaults write com.skype.skype IncludeDebugMenu -bool true

## Disable smart dashes in Skype chat
#defaults write com.skype.skype SKChatInputAutomaticDashSubstitution -bool false

## Disable smart quotes in Skype chat
#defaults write com.skype.skype SKChatInputAutomaticQuoteSubstitution -bool false

execute "defaults write com.skype.skype SKChatInputAutomaticSpellingCorrection -bool false" \
    "Disable automatic spelling correction (auto-correct) in Skype chat"

## Do indicate when Contacts are typing to the user in Skype chat
#defaults write com.skype.skype SKChatReportContactsTyping -bool true

## Do not indicate when the user is typing to Contacts in Skype chat
#defaults write com.skype.skype SKChatReportMeTyping -bool false

## Disable the Skype watermark during calls
#defaults write com.skype.skype SKShowWatermark -bool false

execute "defaults write com.skype.skype SKDisableWelcomeTour -bool true && \
         defaults write com.skype.skype SKShowWelcomeTour -bool false" \
    "Disable the Skype startup welcome tour"

execute "defaults write com.skype.skype SKUseCompactChatStyle -bool true" \
    "Enable compact chat style in Skype chat"

execute "defaults write com.skype.skype SKUseLargeEmoticons -bool false" \
    "Disable large emoticons in Skype chat"

app_kill "Skype"
