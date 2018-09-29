#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting f.lux Settings\n\n"

execute "defaults write org.herf.Flux startAtLogin -bool true" \
    "Load f.lux on startup"

execute "defaults write org.herf.Flux sleepLate -bool true" \
    "Enable sleep in on weekends in f.lux"

# (alternative: 1=Disable)
execute "defaults write org.herf.Flux wakeNotifyDisable -int 0" \
    "Enable backwards alarm clock in f.lux"

## Enable fast transitions in f.lux
# defaults write org.herf.Flux transitionSpeed -bool false


app_kill "Flux"
