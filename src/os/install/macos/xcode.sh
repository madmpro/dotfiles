#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

agree_with_xcode_licence() {

    # Automatically agree to the terms of the `Xcode` license.
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license accept &> /dev/null
    print_result $? "Agree to the terms of the Xcode licence"

}

are_xcode_command_line_tools_installed() {
    xcode-select --print-path &> /dev/null
}

install_xcode() {

    # If necessary, prompt user to install `Xcode`.

    if ! is_xcode_installed; then
        open "macappstores://itunes.apple.com/en/app/xcode/id497799835"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until `Xcode` is installed.

    execute \
        "until is_xcode_installed; do \
            sleep 5; \
         done" \
        "Xcode.app"

}

install_xcode_command_line_tools() {

    # If necessary, prompt user to install
    # the `Xcode Command Line Tools`.
    # See http://apple.stackexchange.com/questions/107307/how-can-i-install-the-command-line-tools-completely-from-the-command-line
    # Only run if the tools are not installed yet
    # To check that try to print the SDK path
    xcode-select -p &> /dev/null
    if [ $? -ne 0 ]; then
      touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
      PROD=$(softwareupdate -l |
        grep "\*.*Command Line" |
        head -n 1 | awk -F"*" '{print $2}' |
        sed -e 's/^ *//' |
        tr -d '\n')
      softwareupdate -i "$PROD" -v;
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the `Xcode Command Line Tools` are installed.

    execute \
        "until are_xcode_command_line_tools_installed; do \
            sleep 5; \
         done" \
        "Xcode Command Line Tools"

}

is_xcode_installed() {
    [ -d "/Applications/Xcode.app" ]
}

set_xcode_developer_directory() {

    # Point the `xcode-select` developer directory to
    # the appropriate directory from within `Xcode.app`.
    #
    # https://github.com/alrra/dotfiles/issues/13

    sudo xcode-select -switch "/Applications/Xcode.app/Contents/Developer" &> /dev/null
    print_result $? "Make 'xcode-select' developer directory point to the appropriate directory from within Xcode.app"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "   Xcode\n\n"

    install_xcode_command_line_tools
#    install_xcode
    set_xcode_developer_directory
    agree_with_xcode_licence

}

main
