#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./tools/tools_arch.sh
./tools/tools_gpg.sh
./tools/tools_git.sh
./tools/tools_font.sh
./tools/tools_net.sh
./tools/tools_bin.sh
./tools/tools_term.sh
./tools/tools_ruby.sh
./tools/tools_devel.sh
./tools/tools_powershell.sh
./tools/tools_ctf.sh
./tools/tools_comm.sh
./tools/tools_graphics.sh
./tools/tools_misc.sh
