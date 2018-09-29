#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Homebrew
# https://github.com/Homebrew/brew/

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get config file path)"
        return 1
    fi

}

install_homebrew() {
    # https://github.com/Homebrew/install
    if ! cmd_exists "brew"; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
        #  └─ simulate the ENTER keypress
    fi

    print_result $? "Homebrew"

}

homebrew_taps () {
    tap "caskroom/cask"
    tap "caskroom/versions"
    tap "caskroom/fonts"
    tap "caskroom/fdrivers"
    tap "homebrew/bundle"
    tap "homebrew/core"
    tap "homebrew/dupes"
    tap "homebrew/services"

    tap "homebrew/versions"
    tap "thoughtbot/formulae"
    tap "Goles/battery"     # Battery is a bash script to display your Laptop's battery status on the terminal.
    tap "buo/cask-upgrade"  # A command line tool for upgrading every outdated app installed by Homebrew Cask https://github.com/buo/homebrew-cask-upgrade
    tap "beeftornado/rmtree" # Remove a formula and its unused dependencies
    tap "neomutt/homebrew-neomutt"
    tap "tavianator/tap"
    tap "universal-ctags/universal-ctags"
}

opt_out_of_analytics() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Try to get the path of the `Homebrew` git config file.

    path="$(get_homebrew_git_config_file_path)" \
        || return 1

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Opt-out of Homebrew's analytics.
    # https://github.com/Homebrew/brew/blob/0c95c60511cc4d85d28f66b58d51d85f8186d941/share/doc/homebrew/Analytics.md#opting-out

    if [ "$(git config --file="$path" --get homebrew.analyticsdisabled)" != "true" ]; then
        git config --file="$path" --replace-all homebrew.analyticsdisabled true &> /dev/null
    fi

    print_result $? "Homebrew (opt-out of analytics)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Homebrew\n\n"

    install_homebrew
    opt_out_of_analytics

    brew_update
    brew_upgrade

}

main
