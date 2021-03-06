#!/bin/bash

if [ ! -d /Applications/Dash.app ]; then
  curl -Lo dash.zip https://kapeli.com/downloads/v3/Dash.zip
  unzip dash.zip 'Dash.app/*' -d /Applications

  LICENSE_FILE="$HOME/Dropbox/license.dash-license"

  if [ -f $LICENSE_FILE ]; then
    open $LICENSE_FILE
  else
    echo "No license file exists yet at $LICENSE_FILE"
    echo "Opening Dropbox and waiting for $LICENSE_FILE in background"
    open /Applications/Dropbox.app
    (
      fswatch -1 $LICENSE_FILE
      open $LICENSE_FILE
    ) &
  fi
fi
