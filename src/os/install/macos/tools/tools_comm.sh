#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Communications\n\n"

# https://weechat.org/
brew_install "WeeChat" "weechat --with-lua --with-perl --with-python --with-ruby"

brew_install "mutt" "mutt"

brew_install "Newsbeuter" "newsbeuter"

# Geeknote needs a developer token
#brew install --HEAD https://raw.githubusercontent.com/jeffkowalski/geeknote/master/geeknote.rb
