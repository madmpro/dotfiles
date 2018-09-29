#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Custom Shortcuts\n\n"

# Safari
# * "Close Tab" = cmd-w (always)
defaults write com.apple.Safari NSUserKeyEquivalents '{
  "Close Tab" = "@w";
}'

# Finder
# * "Merge All Windows" - cmd-opt-ctrl-m
defaults write com.apple.Finder NSUserKeyEquivalents '{
  "Merge All Windows" = "@~^m";
}'

# Notes
# * Hide/Show Folders (sidebar) - cmd-shift-s
defaults write com.apple.Notes NSUserKeyEquivalents '{
    "Hide Folders" = "@$s";
    "Show Folders" = "@$s";
}'

# Preview
# * "Adjust Size..." - cmd-opt-ctrl-i
# * "Export" - cmd-opt-e
defaults write com.apple.Preview NSUserKeyEquivalents '{
  "Adjust Size..." = "@~^i";
  "Export..." = "@~e";
}'

# Keynote
# * "Rehearse Slideshow" - cmd-opt-x
defaults write com.apple.iWork.Keynote NSUserKeyEquivalents '{
  "Rehearse Slideshow" = "@~x";
}'

# VLC
# * "Float on Top" - cmd-opt-o
defaults write org.videolan.vlc NSUserKeyEquivalents '{
  "Float on Top" = "@~o";
}'

# WhatsApp
# * "Archive Chat" - cmd-shift-e
defaults write Whatsapp NSUserKeyEquivalents '{
  "Archive Chat" = "@$e";
}'
