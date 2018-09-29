#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Ruby\n\n"

brew_install "Ruby" "ruby"

sudo mkdir -p /opt/local/include/
sudo ln -s /usr/include/libxml2 /opt/local/include/libxml2

declare -a RUBY_GEMS=(
    "bundler"
    "filewatcher"
    "cocoapods"
    "mechanize"
    "colorize"
    "json"
    "reverse_markdown"
    "net-scp"
    "highline"
    "jekill"
)

for i in "${RUBY_GEMS[@]}"; do
  execute "gem install --force $i" \
        "$i"
done
