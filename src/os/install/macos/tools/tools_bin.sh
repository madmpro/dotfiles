#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous Tools\n\n"

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew_install "coreutils" "coreutils"

# FUSE for macOS allows you to extend macOS's native file handling capabilities via third-party file systems.
brew_install "FUSE" "osxfuse" "caskroom/cask" "cask"

declare -a FORMULAS=(
        "mycli"            # MyCLI is a command line interface for MySQL
        "shellcheck"       # ShellCheck. finds bugs in your shell scripts
        "sqlmap"           # Automatic SQL injection and database takeover tool
        "alure"            # ALURE is a utility library to help manage common tasks with OpenAL applications
        "ifstat"           # Ifstat is a little tool to report interface activity
        "mc"               # Midnight Commander is a visual file manager
        "htop-osx"         # An interactive process viewer for Unix systems
        "moreutils"        # moreutils is a growing collection of the unix tools
        "zenity"           # Zenity enables you to create the various types of simple dialog.
        "tree"             # Tree is a recursive directory listing program that produces a depth indented listing of files.
        "m-cli"            # Swiss Army Knife for macOS https://github.com/rgcr/m-cli
        "jq"               # jq is like sed for JSON data
        "screenfetch"      # Fetches system/theme information in terminal for Linux desktop screenshots
        "logcheck"         # Logcheck is a simple utility which is designed to allow a system administrator to view the logfiles
        "lnav"             # LNAV - The Log File Navigator
        "fdupes"           # fdupes scan directories for duplicate files
        "winexe"           # Remote Windows-command executor
        "wakeonlan"
        "rsync"
        "trash"            # Secure delete files
        "thefuck"          # Magnificent app which corrects your previous console command.
#        "findutils"        # GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done
