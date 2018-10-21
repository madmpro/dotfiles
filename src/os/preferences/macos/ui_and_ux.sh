#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting UI & UX Settings\n\n"

#execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO'" \
#    "Hide battery percentage from the menu bar"

execute "sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true" \
    "Show language menu in the top right corner of the boot screen"

execute "defaults write com.apple.menuextra.battery ShowPercent -string 'NO' && \
         defaults write com.apple.menuextra.battery ShowTime -string 'YES'" \
    "Menu bar: show remaining battery time (on pre-10.8); hide percentage"

execute "defaults write com.apple.CrashReporter UseUNC 1" \
    "Make crash reports appear as notifications"

execute "defaults write com.apple.CrashReporter DialogType -string \"none\"" \
    "Disable the crash reporter"

execute "sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName" \
    "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"

execute "defaults write /Library/Preferences/com.apple.loginwindow EnableExternalAccounts -bool false" \
    "Stop messages about accounts available on other disks"

execute "defaults write /Library/Preferences/.GlobalPreferences MultipleSessionEnabled -bool NO" \
    "Remove Fast User Switching option"

execute "defaults write /Library/Preferences/com.apple.loginwindow PasswordExpirationDays 15" \
    "Set time that login window warns about password expiry"

execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
    'Disable "Are you sure you want to open this application?" dialog'

execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
    "Automatically quit the printer app once the print jobs are completed"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0" \
     "Require password immediately after into sleep or screen saver mode"

execute "/usr/bin/defaults write /Library/Preferences/com.apple.loginwindow \ RetriesUntilHint -int 0" \
    "Restrict Password Hints"

execute "defaults write com.apple.screencapture location -string '${SCREENSHOTS_DIR}'" \
     "Save screenshots to the desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
execute "defaults write com.apple.screencapture type -string 'png'" \
     "Save screenshots in PNG format"

execute "defaults write com.apple.screencapture disable-shadow -bool true" \
     "Disable shadow in screenshots"

# Reference: https://github.com/kevinSuttle/macOS-Defaults/issues/17#issuecomment-266633501
execute "defaults write NSGlobalDomain AppleFontSmoothing -int 2" \
     "Enable subpixel font rendering on non-Apple LCDs"

#execute "sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true" \
#     "Enable HiDPI display modes (requires restart)"

execute "defaults write -g AppleFontSmoothing -int 2" \
    "Enable subpixel font rendering on non-Apple LCDs"

execute "defaults write -g NSDisableAutomaticTermination -bool true" \
    "Disable automatic termination of inactive apps"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write -g NSTableViewDefaultSizeMode -int 2" \
    "Set sidebar icon size to medium"

execute "defaults write -g NSUseAnimatedFocusRing -bool false" \
    "Disable the over-the-top focus ring animation"

execute "defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false" \
    "Disable resume system-wide"

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true && \
         defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true" \
    "Expand print panel by default"

# execute "sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string 'Laptop' && \
#         sudo scutil --set ComputerName 'laptop' && \
#         sudo scutil --set HostName 'laptop' && \
#         sudo scutil --set LocalHostName 'laptop'" \
#    "Set computer name"

execute "sudo systemsetup -setrestartfreeze on" \
    "Restart automatically if the computer freezes"

execute "systemsetup -setcomputersleep Off > /dev/null" \
    "Never go into computer sleep mode"


execute "sudo defaults write /Library/Preferences/com.apple.Bluetooth.plist ControllerPowerState 0 && \
         sudo launchctl unload /System/Library/LaunchDaemons/com.apple.blued.plist && \
         sudo launchctl load /System/Library/LaunchDaemons/com.apple.blued.plist" \
    "Turn Bluetooth off"

execute "for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
            sudo defaults write \"\${domain}\" dontAutoLoad -array \
                '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
                '/System/Library/CoreServices/Menu Extras/Volume.menu'
         done \
            && sudo defaults write com.apple.systemuiserver menuExtras -array \
                '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
                '/System/Library/CoreServices/Menu Extras/AirPort.menu' \
                '/System/Library/CoreServices/Menu Extras/Battery.menu' \
                '/System/Library/CoreServices/Menu Extras/Clock.menu'
        " \
    "Hide Time Machine and Volume icons from the menu bar"

execute "defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false" \
    "Save to disk (not to iCloud) by default"

execute "defaults write NSGlobalDomain NSWindowResizeTime -float 0.001" \
    "Increase window resize speed for Cocoa applications"

execute "defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false" \
    "Disable Resume system-wide"

execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'Automatic'" \
    "Always show scrollbars"

execute "sudo pmset -a standbydelay 86400" \
    "Deep sleep after 24 hours instead of the default 70 minutes"

execute "defaults write NSGlobalDomain NSNavRecentPlacesLimit -int 35" \
    "Set the recent places dropdown limit to thirty five destinations"

execute 'defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"' \
    "Set highlight color to green"


#execute "launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null" \
#     "Disable Notification Center and remove the menu bar icon"

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg


app_kill "SystemUIServer"
