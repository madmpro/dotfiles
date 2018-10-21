#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Time Machine Settings\n\n"

execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
    "Prevent Time Machine from prompting to use new hard drives as backup volume"

# Disable local Time Machine backups
#hash tmutil &> /dev/null && sudo tmutil disablelocal


# Limit Time Machine total backup size to 500 GB (=1024*512)
# Source: http://www.defaults-write.com/time-machine-setup-a-size-limit-for-backup-volumes/
execute "sudo defaults write com.apple.TimeMachine MaxSize -integer 524288" \
    "Limit Time Machine total backup size to 500 GB"

execute "sudo tmutil addexclusion $HOME/Downloads && \
         sudo tmutil addexclusion $HOME/Library/Application\ Support/Steam/steamapps/ && \
         sudo tmutil addexclusion $HOME/Movies && \
         sudo tmutil addexclusion $HOME/Dropbox" \
    "Add common exclusions"
