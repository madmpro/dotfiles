#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Development Tools\n\n"

#brew_install "gcc - Be patient, this may take long time" "gcc"
brew_install "GNU \"sed\", overwriting the built-in \"sed\"" "gnu-sed --with-default-names"

# Cask mou depends on macOS release <= 10.11
# brew_install "Markdown editor for developers" "mou" "caskroom/fonts" "cask"

brew_install "Java 8" "java8" "caskroom/versions" "cask"
java -version

declare -a FORMULAS=(
    "autoconf"
    "automake"
    "binutils"
    "binwalk"
    "cmake"
    "dex2jar"
    "fontconfig"
    "goaccess"      # fast, terminal-based log analyzer
    "html-xml-utils"
    "hub"
    "libtool"
    "llvm"
    "lua"
    "nano"
    "numpy"
    "openssl"
    "perl"
    "plenv"
    "perl-build"
    "pkg-config"
    "pipenv"
    "qt"
    "readline"
    "shtool"
    "s-lang"
    "scipy"
    "shfmt"
    "sphinx-doc"
    "watchman"      # Watches files and records, or triggers actions, when they change.


)

for i in "${FORMULAS[@]}"; do
   brew_install "$i" "$i"
done

# llvm
# To use the bundled libc++ please add the following LDFLAGS:
#  LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"

#This formula is keg-only, which means it was not symlinked into /usr/local,
#because macOS already provides this software and installing another version in
#parallel can cause all kinds of trouble.

#If you need to have this software first in your PATH run:
#  echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile

#For compilers to find this software you may need to set:
#    LDFLAGS:  -L/usr/local/opt/llvm/lib
#    CPPFLAGS: -I/usr/local/opt/llvm/include
