#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting VLC settings\n\n"

execute "defaults write org.videolan.vlc NSRecentDocumentsLimit -int 0 && \
         defaults delete org.videolan.vlc.LSSharedFileList RecentDocuments && \
         defaults write org.videolan.vlc.LSSharedFileList RecentDocuments -dict-add \"MaxAmount\" -int 0" \
    "Clear and disable recent documents in VLC"

execute "defaults write org.videolan.vlc SUEnableAutomaticChecks -bool true" \
    "Automatically check for updates"

app_kill "VLC"
