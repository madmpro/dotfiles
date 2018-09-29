#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Adjusting VirtualBox Settings\n\n"


# VirtualBox VM Directory
if which VBoxManage &>/dev/null; then
  VBoxManage setproperty machinefolder /Volumes/Data/Virtual/VirtualBox\ VMs/
fi
