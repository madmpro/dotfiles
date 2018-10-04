#!/bin/bash

[ "$#" -eq 0 ] && exit 1
if [ -n $(command -v curl) ]; then
  url=$(curl -sIL -o /dev/null -w '%{url_effective}' "$1")
else
  url="$1"
fi

url=$(echo "${url}" | perl -p -e 's/(\?|\&)?utm_[a-z]+=[^\&]+//g;' -e 's/(#|\&)?utm_[a-z]+=[^\&]+//g;')
title="$2"
description="$3"
feedtitle="$4"

#grep -q "${url}\t${title}\t${description}" $HOME/.newsboat/bookmarks.txt || echo -e "${url}\t${title}\t${description}" >> $HOME/.newsboat/bookmarks.txt

grep -q "${title}\t${description}\t${url}" $HOME/.newsboat/bookmarks.txt || echo -e "${title}\t${description}\t${url}" >> $HOME/.newsboat/bookmarks.txt
