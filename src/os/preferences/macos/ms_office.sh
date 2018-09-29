#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Microsoft\n\n"


echo "Delete user level preference for all existing users."
localUsers=$( dscl . list /Users UniqueID | awk '$2 >= 501 {print $1}' )

echo "$localUsers" | while read userName; do
    defaults delete /Users/$userName/Library/Preferences/com.microsoft.autoupdate2.plist HowToCheck
done

execute "defaults write com.microsoft.Office SendPersonalInformationToMotherShip NO" \
    "Disable send personal information to Microsoft"

execute "defaults write com.microsoft.autoupdate2 DisableInsiderCheckbox –bool TRUE" \
    "Disable the Insider check box"

execute "defaults write com.microsoft.autoupdate2 HowToCheck \"Manual\"" \
    "Setting autoupdates to manual"

execute "defaults delete com.microsoft.Word kSubUIAppCompletedFirstRunSetup1507 && \
         defaults delete com.microsoft.Outlook kSubUIAppCompletedFirstRunSetup1507 && \
         defaults delete com.microsoft.PowerPoint kSubUIAppCompletedFirstRunSetup1507 && \
         defaults delete com.microsoft.Excel kSubUIAppCompletedFirstRunSetup1507 && \
         defaults delete com.microsoft.onenote.mac kSubUIAppCompletedFirstRunSetup1507" \
    "Disabling First Run dialog for all Office applications"

execute "defaults write /Users/username/Library/Preferences/com.microsoft.autoupdate2 WhenToCheck 0" \
    "Disable Auto Update"


app_kill "cfprefsd"
