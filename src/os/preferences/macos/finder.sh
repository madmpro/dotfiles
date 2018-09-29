#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Finder Settings\n\n"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
         defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.frameworks.diskimages skip-verify -bool true && \
         defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && \
         defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true" \
    "Disable disk image verification"

execute "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true" \
    "Use full POSIX path as window title"

execute "defaults write com.apple.finder DisableAllAnimations -bool true" \
    "Disable all animations"

execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

#execute "defaults write com.apple.finder EmptyTrashSecurely -bool true" \
#    "Empty Trash securely by default"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

# Four-letter codes for all view modes: `icnv`, `Nlsv`, `clmv`, `Flwv`
execute "defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'" \
    "Use list view in all Finder windows by default"

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/Desktop/'" \
    "Set \"Desktop\" as the default location for new Finder windows"

execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
    "Show icons for hard drives, servers, and removable media on the desktop"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
    "Do not show recent tags"

execute "defaults write com.apple.finder AppleShowAllFiles -bool true" \
    "Show hidden files by default"

execute "defaults write -g AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

execute "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false" \
    "Disable warning when changing a file extension"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:iconSize 72' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:gridSpacing 1' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon grid spacing size"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 13' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label text size"

## Display icon info on the Bottom in the desktop and Finder's icon view
## (alternative: false=Right Side)
execute "/usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
    "Set icon label position in standart views"

execute "/usr/libexec/PlistBuddy -c 'Set DesktopViewSettings:IconViewSettings:labelOnBottom true' ~/Library/Preferences/com.apple.finder.plist" \
     "Show item info to the right of the icons on the desktop"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:showItemInfo false' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:showItemInfo false' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:showItemInfo false' ~/Library/Preferences/com.apple.finder.plist" \
    "Show item info near icons on the desktop and in other icon views"

execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist && \
         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy grid' ~/Library/Preferences/com.apple.finder.plist" \
    "Enable snap-to-grid for icons on the desktop and in other icon views"

#execute "/usr/libexec/PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist && \
#         /usr/libexec/PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy none' ~/Library/Preferences/com.apple.finder.plist" \
#    "Set sort method"

# Increase grid spacing for icons on the desktop and in other icon views
#/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
#/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
#/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
execute "defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true" \
    "Expand the File Info panes"

## Remove duplicates from the "Open With" menu
execute "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user" \
    "Remove duplicates from the \"Open With\" menu"

execute "defaults write com.apple.finder ShowStatusBar -bool false" \
    "Hide the status bar"

execute "defaults write com.apple.finder ShowPathbar -bool false" \
    "Hide the path bar"

execute "defaults write com.apple.finder QLEnableTextSelection -bool true" \
     "Allow text selection in Quick Look"

execute "chflags nohidden ~/Library" \
    "Show \"~/Library\" folder"

execute "defaults write com.apple.finder _FXSortFoldersFirst -bool true" \
    "Folders at top when sorting by the name"


## Sort Finder file values:
      ## "ascd": Date Created
      ## "dnam": Name
      ## "kipl": Kind
      ## "labl": Tags
      ## "logs": Size
      ## "ludt": Date Last Opened
      ## "modd": Date Modified
      ## "pAdd": Date Added
execute '/usr/libexec/PlistBuddy -c "Set :StandardViewOptions:ColumnViewOptions:ArrangeBy kipl" "${HOME}"/Library/Preferences/com.apple.finder.plist' \
    "Sort Finder files in column view => Kind"

execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true && \
         defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true" \
    "Avoid creating '.DS_Store' files on network or USB volumes"

execute "defaults write com.apple.finder QuitMenuItem -bool true" \
    "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"


app_kill "Finder"

# Starting with Mac OS X Mavericks preferences are cached,
# so in order for things to get properly set using `PlistBuddy`,
# the `cfprefsd` process also needs to be killed.
#
# https://github.com/alrra/dotfiles/commit/035dda057ddc6013ba21db3d2c30eeb51ba8f200

app_kill "cfprefsd"
