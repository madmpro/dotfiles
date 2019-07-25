#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   ZSH\n\n"
    ZPLUG_HOME="$HOME/.zsh/plugins/zplug"
    # Install zplug if it's doesn't exist
    if [ ! -d $ZPLUG_HOME ]; then
      git clone https://github.com/zplug/zplug.git $ZPLUG_HOME
    fi

    # Remove errors on loading zplug
    # https://github.com/robbyrussell/oh-my-zsh/issues/4607
    rm ~/.zcompdump*

    git clone https://github.com/zplug/zplug.git $HOME/.zsh/plugins/zplug

}

main
