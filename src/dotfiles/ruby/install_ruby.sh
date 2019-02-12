#!/bin/bash

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
  gem install --force $i
done
