#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_npm_package() {

    execute \
        ". $HOME/.bash.local \
            && npm install --global --silent $2" \
        "$1"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   npm\n\n"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # https://docs.npmjs.com/getting-started/installing-node
    install_npm_package "npm (update)" "npm"
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    printf "\n"

    install_npm_package "!nstant-markdown-d" "instant-markdown-d"
    install_npm_package "Babel" "babel-cli"
    install_npm_package "JSHint" "jshint"
    install_npm_package "SVGExport" "svgexport"
    install_npm_package "ImageOptim" "imageoptim-cli"
    install_npm_package "git-commander" "git-commander"
    install_npm_package "create-dmg" "create-dmg"
    install_npm_package "now" "now" # The command-line interface for Now https://zeit.co/now

}

main
