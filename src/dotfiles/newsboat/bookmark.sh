#!/bin/bash

[ "$#" -eq 0 ] && exit 1
if [ -n $(command -v curl) ]; then
  url=$(curl -sIL -o /dev/null -w '%{url_effective}' "$1")
else
  url="$1"
fi

url=$(echo "${url}" | perl -p -e 's/(\?|\&)?utm_[a-z]+=[^\&]+//g;' -e 's/(#|\&)?utm_[a-z]+=[^\&]+//g;')

baseurl=$(echo "${url}" | awk -F[/:] '{print $4}')
title="$2"
description="$3"
feedtitle="$4"

grep -Fxq "${title} | [${baseurl}](${url})" $HOME/.newsboat/bookmarks.md || echo -e "${title} | [${baseurl}](${url})" >> $HOME/.newsboat/bookmarks.md
