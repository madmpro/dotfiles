#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

brew_install "ZSH" "zsh"
brew_install "ZSH Completions" "zsh-completions"
brew_install "ZSH Syntax" "zsh-syntax-highlighting"
