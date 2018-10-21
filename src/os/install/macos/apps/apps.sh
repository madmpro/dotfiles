#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Desktop Apps\n"

./apps/app_browsers.sh
./apps/app_comm.sh
#./apps/app_dash.sh
./apps/app_editors.sh
./apps/app_fileshare.sh
./apps/app_images.sh
#./apps/app_mas.sh
./apps/app_misc.sh
./apps/app_multimedia.sh
./apps/app_network.sh
./apps/app_office.sh
./apps/app_paragon.sh
./apps/app_tools.sh
./apps/app_virtual.sh
./apps/apps_wine.sh
