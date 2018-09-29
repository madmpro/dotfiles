#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   TOR Browser\n\n"

brew_install "TOR Browser" "tor"

sudo cp scripts/tor_launch.sh /usr/local/bin/tor.sh
chmod +x /usr/local/bin/tor.sh
