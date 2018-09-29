#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Close any open `System Preferences` panes in order to
# avoid overriding the preferences that are being changed.

./close_system_preferences_panes.applescript

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./app_store.sh
./actmonitor.sh
./iterm.sh
./chrome.sh
./dashboard.sh
./dock.sh
./finder.sh
./firefox.sh
./flux.sh
./keyboard.sh
./language_and_region.
#./launchpad.sh
./maps.sh
./macdown.sh
./mail.sh
#./network.sh
./paragon.sh
./photos.sh
./privacy.sh
./restrictions.sh
./safari.sh
./skype.sh
./spectacle.sh
./spotlight.sh
#./system.sh
./shortcuts.sh
./terminal.sh
./textedit.sh
./trackpad.sh
./timemachine.sh
./transmission.sh
./twitter.sh
./ui_and_ux.sh
./vlc.sh
./VSCode.sh
./sudoers.sh

print_in_purple "\n • Done. Note that some of these changes require a logout/restart to take effect.\n\n"
