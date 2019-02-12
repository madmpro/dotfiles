#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting VLC settings\n\n"

execute "defaults write org.videolan.vlc SUHasLaunchedBefore -bool true && \
        defaults write org.videolan.vlc SUSendProfileInfo -bool false" \
    "Get the welcome screen out of the way"


execute "defaults write org.videolan.vlc NSRecentDocumentsLimit -int 0 && \
         defaults delete org.videolan.vlc recentlyPlayedMedia && \
         defaults delete org.videolan.vlc recentlyPlayedMediaList" \
    "Clear and disable recent documents in VLC"

execute "defaults write org.videolan.vlc SUEnableAutomaticChecks -bool false" \
    "Automatically check for updates"


execute "duti -s org.videolan.vlc .mp4 all" \
    "Open mp4 files in VLC"

app_kill "VLC"
