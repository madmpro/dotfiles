#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting Network Settings\n\n"

# Disable Unused Network Services
execute "if networksetup -getnetworkserviceenabled \"FireWire\" | grep \"Enabled\" ;then \
            networksetup -setnetworkserviceenabled \"FireWire\" off \
         fi" \
    "Disable FireWire network service"

execute "if networksetup -getnetworkserviceenabled \"Bluetooth PAN\" | grep \"Enabled\" ;then \
            networksetup -setnetworkserviceenabled \"Bluetooth PAN\" off \
         fi" \
    "Disable Bluetooth PAN network service"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
