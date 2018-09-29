#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
print_in_purple "\n   Patching /etc/sudoers backup goes to /etc/sudoers.backup  \n\n"

function patch_sudoers
{

	cp /etc/sudoers /tmp/sudoers.new
	cp /etc/sudoers /etc/sudoers.backup

  grep -q '/usr/local/bin/htop' /tmp/sudoers.new || echo -e "\nusername ALL = NOPASSWD: /usr/local/bin/htop" >> /tmp/sudoers.new

	cp /tmp/sudoers.new /etc/sudoers

}

function restore_sudoers
{
	cp /etc/sudoers.backup /etc/sudoers
}

patch_sudoers
