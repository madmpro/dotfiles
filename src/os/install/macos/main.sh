#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./homebrew.sh

./bash.sh
./../vim.sh
./../nvm.sh
./../npm.sh
./../tmux.sh
./xcode.sh

brew_cleanup
