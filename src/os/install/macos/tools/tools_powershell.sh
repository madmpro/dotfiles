#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PowerShell\n\n"

brew_install "OpenSSL" "openssl" # Required

brew_install "PowerShell" "powershell" "caskroom/cask" "cask"

brew_install ".NET Core" "dotnet" "caskroom/cask" "cask"

# Note: this will work completely once homebrew-cask#23854 is merged. Until then,
# follow the part of instructions that link the 1.0.0 versions of openssl to your /usr/local/lib folder.
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/ &> /dev/null
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/ &> /dev/null
