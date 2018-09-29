#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Transmission Settings\n\n"

#execute "defaults delete org.m0k.transmission AutoUpdateBeta" \
#    "Do not include beta releases when updating software in Transmission"

execute "defaults write org.m0k.transmission BadgeDownloadRate -bool true" \
    "Enable Transmission's \"total download rate\" Dock icon badge"

execute "defaults write org.m0k.transmission BadgeUploadRate -bool true" \
    "Enable Transmission's \"total upload rate\" Dock icon badge"

execute "defaults delete org.m0k.transmission SUEnableAutomaticChecks" \
    "Automatically check for updates"

execute "defaults write org.m0k.transmission DisplayProgressBarAvailable -bool true" \
    "Enable availability progress bar in Transmission"

execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
    "Delete the original torrent files"

# Don’t prompt for confirmation before downloading
execute "defaults write org.m0k.transmission DownloadAsk -bool false" \
    "Don’t prompt for confirmation before downloading"

execute "defaults write org.m0k.transmission MagnetOpenAsk -bool false" \
    "Don’t prompt for confirmation before downloading for magnet links"

execute "defaults write org.m0k.transmission DownloadAskManual -bool true" \
    "Display a window when opening a torrent only when adding manually"

execute  "defaults write org.m0k.transmission DownloadAskMulti -bool true" \
    "Display a window when opening a torrent only when there are multiple files"

# Don’t prompt for confirmation before removing non-downloading active transfers
execute "defaults write org.m0k.transmission CheckRemoveDownloading -bool true" \
    "Don’t prompt for confirmation before removing non-downloading active transfers"

# # Use `~/Downloads` to store completed downloads
execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' && \
         defaults write org.m0k.transmission DownloadFolder -string '${TORRENTS_DIR}' && \
         defaults write org.m0k.transmission DownloadLocationConstant -bool true" \
    "Use '~/Downloads' to store complete downloads"

execute "defaults write org.m0k.transmission AutoImport -bool true && \
         defaults write org.m0k.transmission AutoImportDirectory -string '${TORRENTS_IMPORT_DIR}'" \
    "Watch for Transmission torrents in the torrent import directory"

execute "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true && \
         defaults write org.m0k.transmission IncompleteDownloadFolder -string '${TORRENTS_INCOMP_DIR}'" \
    "Use \"~/Downloads/torrents\" to store incomplete downloads"

# IP block list.
## @source https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
execute "defaults write org.m0k.transmission BlocklistNew -bool true && \
         defaults write org.m0k.transmission BlocklistURL -string \"http://john.bitsurge.net/public/biglist.p2p.gz\" && \
         defaults write org.m0k.transmission BlocklistAutoUpdate -bool true" \
    "Add blocklist that updates weekly in Transmission"

execute "defaults write org.m0k.transmission EncryptionRequire -bool true" \
    "Ignore unencrypted peers in Transmission"

execute "defaults write org.m0k.transmission FilterBar -bool true" \
    "Show filter bar in Transmission"

## Do not show pieces bar in Transmission
# defaults write org.m0k.transmission PiecesBar -bool false

## Transmission completion sound values:
  ## "Basso"
  ## "Blow"
  ## "Bottle"
  ## "Frog"
  ## "Funk"
  ## "Glass"
  ## "Hero"
  ## "Morse"
  ## "Ping"
  ## "Pop"
  ## "Purr"
  ## "Sosumi"
  ## "Submarine"
  ## "Tink"

execute 'defaults write org.m0k.transmission DownloadSound -string "Pop" && \
         defaults write org.m0k.transmission PlayDownloadSound -bool true' \
    "Transmission download complete sound => Pop"

execute 'defaults write org.m0k.transmission PlaySeedingSound -bool true && \
         defaults write org.m0k.transmission SeedingSound -string "Tink"' \
    "Transmission seeding complete sound => Tink"

execute "defaults write org.m0k.transmission SmallView -bool false" \
    "Disable compact view in Transmission"

execute "defaults write org.m0k.transmission StatusBar -bool true" \
    "Show status bar in Transmission"

execute "defaults write org.m0k.transmission AutoSize -bool true" \
    "Automatically size window to fit all transfers"

execute "defaults write org.m0k.transmission WarningDonate -bool false" \
    "Hide the donate message"

execute "defaults write org.m0k.transmission WarningLegal -bool false" \
    "Hide the legal disclaimer"

execute "defaults write org.m0k.transmission RandomPort -bool true" \
    "Randomize port on launch"

execute "defaults write org.m0k.transmission SleepPrevent -bool false" \
    "Do not prevent computer from sleeping with active transfer"

execute "defaults write org.m0k.transmission CheckQuitDownloading -bool false" \
    "Do not prompt for quit with active transfers only when transfers are downloading"

execute "defaults write org.m0k.transmission CheckQuit -bool false" \
    "Do not prompt for quit"

app_kill "Transmission"
