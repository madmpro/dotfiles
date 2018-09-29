#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Misc tools\n\n"

brew_install "Spark" "spark"
brew_install "Battery" "battery" "Goles/battery"
brew_install "1Password-cli" "1password-cli"   "caskroom/cask" "cask"

declare -a FORMULAS=(
        "cmus"        # terminal music player
        "cowsay"
        "fortune"
        "lolcat"
        "pandoc"
        "ddgr"        #DuckDuckGo from the terminal
                      # ddgr --num 5 querry
        "todo-txt"
        "mpv"
        "1password-cli"
)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done

# Solving error for ddgr
# [ERROR] <urlopen error [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:777)>
# No results.
# /Applications/Python\ 3.6/Install\ Certificates.command
