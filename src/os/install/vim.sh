#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    # Vundle
    declare -r VUNDLE_DIR="$HOME/.vim/plugins/Vundle.vim"
    declare -r VUNDLE_GIT_REPO_URL="https://github.com/VundleVim/Vundle.vim.git"

    # vim-plug
    declare -r BUNDLE_DIR="$HOME/.vim/plugins/vim-plug"
    declare -r BUNDLE_GIT_REPO_URL="https://github.com/jwhitley/vim-plug.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install plugins.

    execute \
        "rm -rf '$VUNDLE_DIR' \
            && rm -rf '$BUNDLE_DIR' \
            && git clone --quiet '$VUNDLE_GIT_REPO_URL' '$VUNDLE_DIR' \
            && git clone --quiet '$BUNDLE_GIT_REPO_URL' '$BUNDLE_DIR' \
            && printf '\n' | vim +PluginInstall +qall \
            && printf '\n' | vim +PlugInstall" \
        "Install plugins"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install additional things required by some plugins.

    execute \
        ". $HOME/.bashrc \
            && cd $HOME/.vim/plugins/tern_for_vim \
            && npm install" \
        "Install plugins (extra installs for 'tern_for_vim')"

}

update_plugins() {

    execute \
        "vim +PluginUpdate +qall" \
        "Update plugins"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"

    printf "\n"

    install_plugins
    update_plugins

}

main
