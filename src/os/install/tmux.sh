#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    declare -r TMUX_PLUG_DIR="$HOME/.tmux/plugins/tpm"
    declare -r TMUX_PLUG_REPO_URL="https://github.com/tmux-plugins/tpm"

    # Install plugins.
    execute \
        "rm -rf '$TMUX_PLUG_DIR' \
            && git clone --quiet '$TMUX_PLUG_REPO_URL' '$TMUX_PLUG_DIR' \
            && '$TMUX_PLUG_DIR/bin/install_plugins'" \
        "Install Тmux plugins"

}

update_plugins() {

    if [ -d "~/.tmux/plugins/tpm" ]; then
      execute \
          "~/.tmux/plugins/tpm/bin/install_plugins" \
          "Update Tmux plugins"
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    "./$(get_os)/tmux.sh"

    printf "\n"

    install_plugins
    update_plugins

}

main
