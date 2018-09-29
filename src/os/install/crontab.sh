#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Set Crontab\n\n"

# el capitan makes crontab really hard.
#   http://stackoverflow.com/questions/32781884/is-crontab-broken-on-osx-el-capitan
#
# env EDITOR=nano crontab -e
#
# see cron/ folder
#    chmod +x *.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

cron_tmp_file="/tmp/cron.$(date '+%s')"
cron_file="$HOME/.cron/crontab"

function delete_entries_found {
  if ( egrep -q "^### CRONTAB BEGIN ###$" "${cron_tmp_file}" )
  then
    if ( ! egrep -q "^### CRONTAB END ###$" "${cron_tmp_file}" )
    then
      echo "You have a 'CRONTAB BEGIN' marker in your hosts file, but no 'CRONTAB END' marker - bogus, man! Please fix to continue."
      exit 1
    fi
    echo "Deleting old CRONTAB entries. Hope you didn't manually change them."
    echo "...need elevated privileges to do this - may prompt for sudo password"
    sudo sed -i '/^### CRONTAB BEGIN ###$/,/^### CRONTAB END ###$/ d' "${cron_tmp_file}"
    echo "OK, hopefully I removed the old ones..."
  fi
}

echo "Adding new entries!"
# Write out current crontab
#crontab -l > mycron
crontab -l > "${cron_tmp_file}"

delete_entries_found

echo "### CRONTAB BEGIN ###" | tee -a "${cron_tmp_file}" >/dev/null
cat "${cron_file}" | tee -a "${cron_tmp_file}" >/dev/null
echo "### CRONTAB END ###" | tee -a "${cron_tmp_file}" >/dev/null

# Install new cron file
crontab "${cron_tmp_file}"
rm "${cron_tmp_file}"

echo "Allright. I hope this went well. Happy working!"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
