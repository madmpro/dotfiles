#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Setting privacy\n\n"

# hide a computer name on a network
sudo /usr/libexec/PlistBuddy -c "Add :ProgramArguments: string '-NoMulticastAdvertisements'" /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
# To turn back on:
# sudo /usr/libexec/PlistBuddy -c "Delete :ProgramArguments:2" /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl load /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
