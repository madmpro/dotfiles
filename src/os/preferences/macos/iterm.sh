#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting iTerm2 Settings\n\n"

execute 'cp -Rf "${HOME}"/.iTerm/Launch\ iTerm.workflow /Library/Services/Launch\ iTerm.workflow' \
    "Copy over \"Launch iTerm\" Workflow"

## Use `[⌘]+[\]` to run the "Launch iTerm" Workflow as a Service
# $PLISTBUDDY -c "Delete :NSServicesStatus:\"(null) - Launch iTerm - runWorkflowAsService\"" "${HOME}/Library/Preferences/pbs.plist" 2>/dev/null
execute 'defaults write pbs NSServicesStatus -dict-add "\"(null) - Launch iTerm - runWorkflowAsService\"" "{key_equivalent = \"${COMMAND_KEY}${BACKSLASH_KEY}\";}"' \
    'Use `[⌘]+[\]` to run the "Launch iTerm" Workflow as a Service'

## Copy over iTerm2 preferences
## ¡¡¡TEMPORARY!!! ##
#cp custom-copy/files/com.googlecode.iterm2.plist "${HOME}"/Library/Preferences/com.googlecode.iterm2.plist

## Set font smoothing and anti-aliasing strength to Light in iTerm2
## (range: 0=Off–3=Heavy)
# defaults write com.googlecode.iterm2 AppleFontSmoothing -int 1

## Set iTerm's autocomplete entries maximum to one hundred seventy five
# defaults write com.googlecode.iterm2 AutocompleteMaxOptions -int 175

## Set iTerm's number of recently used coprocess commands remebered to fifty
# defaults write com.googlecode.iterm2 "Coprocess MRU" -int 50

execute "defaults write com.googlecode.iterm2 CopyLastNewline -bool false" \
    "Do not copy the trailing newline when text is copied in iTerm2"

execute "defaults write com.googlecode.iterm2 FocusFollowsMouse -bool true" \
    "Enable focus follows mouse for iTerm2"

execute "defaults write com.googlecode.iterm2 Hotkey -bool true && \
         defaults write com.googlecode.iterm2 HotkeyChar -int 92 && \
         defaults write com.googlecode.iterm2 HotkeyCode -int 42" \
    "Enable iTerm2's main hotkey (focus/show/hide iTerm2)"

execute "defaults write com.googlecode.iterm2 HotkeyModifiers -int 1048840" \
    "Use \`[⌘]+[\\]\` as iTerm2's main hotkey"

execute "defaults write com.googlecode.iterm2 PinchToChangeFontSizeDisabled -bool true" \
    "Disable pinch to change font size in iTerm2"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
    "Do not display the iTerm2 quitting dialog box"

execute "defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool false" \
    "Do not quit iTerm2 when all windows have closed"

## Do not trim trailing whitespace when copying text from iTerm2
# defaults write com.googlecode.iterm2 TrimWhitespaceOnCopy -bool false

## Use simple fullscreen mode, instead of fancy fullscreen mode in iTerm2
# defaults write com.googlecode.iterm2 UseLionStyleFullscreen -bool false

execute 'defaults write com.googlecode.iterm2 WordCharacters -string "/-+\~_."' \
    "Set the list of characters considered part of words iTerm2 word selection"

execute "open '${HOME}/.iTerm/solarized-dark.itermcolors'" \
    "Install the Solarized Dark theme for iTerm"
