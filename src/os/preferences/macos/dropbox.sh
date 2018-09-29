#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "../../install/macos/scripts/add_login_item.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

with_askpass() {
  SUDO_ASKPASS="${SUDO_ASKPASS_SCRIPT}" "${@}"
}

defaults_dropbox() {

  # Dropbox
  add_login_item com.getdropbox.dropbox hidden

}

get_dropbox_dir() {
  /usr/bin/head -n 2 ~/.dropbox/host.db | /usr/bin/tail -n 1 | /usr/bin/base64 -D
}

# Create Symlinks for Dropbox folders.
link_to_dropbox() {

  # Also move hidden files.
  shopt -s dotglob

  local local_dir="${HOME}/${2-$1}"
  local dropbox_dir="$(get_dropbox_dir)"

  if test -d "${dropbox_dir}"; then

    dropbox_dir="${dropbox_dir}/Sync/~/${1}"

    local local_dirname="$(/usr/bin/sed "s|^${HOME}|~|" <<< "${local_dir}")"
    local dropbox_dirname="$(/usr/bin/sed "s|^${HOME}|~|" <<< "${dropbox_dir}")"

    if test -L "${dropbox_dir}"; then
      echo -g "${local_dirname} already linked to Dropbox."
    else
      echo -b "Linking ${local_dirname} to ${dropbox_dirname} …"

      /usr/bin/killall Dropbox &>/dev/null

      /bin/rm -f "${dropbox_dir}" "${local_dir}" 2>/dev/null
      /bin/mkdir -p "${local_dir}"

      if test -d "${dropbox_dir}"; then
        /bin/rm -f "${dropbox_dir}/.DS_Store"
        /usr/bin/find "${dropbox_dir}" -depth 1 -exec /bin/mv -f '{}' "${local_dir}/" \;
        /bin/rmdir "${dropbox_dir}"
      fi

      /bin/mkdir -p "$(dirname "${dropbox_dir}")"
      /bin/ln -sfn "${local_dir}" "${dropbox_dir}" || echo -r "Error linking ${local_dirname} to ${dropbox_dirname}."

    fi
  fi
}

dropbox_link_folders() {

  # Check if Dropbox has finished syncing.

  echo -b 'Waiting for Dropbox to finish syncing …'

  # Get Dropbox Localizations
  dropbox_garcon="$(/usr/bin/mdfind -onlyin / kMDItemCFBundleIdentifier==com.getdropbox.dropbox | /usr/bin/head -n 1)/Contents/PlugIns/garcon.appex/Contents/Resources"
  dropbox_localizations=''

  if [ -d "${dropbox_garcon}" ]; then
    for lang in "${dropbox_garcon}"/*.lproj; do
      if [ ! -z "${dropbox_localizations}" ]; then
        dropbox_localizations+='|'
      fi

      dropbox_localizations+="$(/usr/bin/plutil -convert json -o - "${lang}/garcon.strings" | /usr/bin/ruby -e "require 'json'; print JSON.parse(STDIN.read)['BadgeTooltipUptodate']")"
    done
  fi

  until test -f ~/.dropbox/host.db && \
        test -d "$(get_dropbox_dir)" && \
        /usr/bin/osascript -e 'tell application "System Events" to tell application process "Dropbox" to get help of menu bar item 1 of menu bar 2' 2>/dev/null | /usr/bin/tail -n 1 | /usr/bin/grep --quiet -E "${dropbox_localizations}"; do
    if ! /bin/launchctl list | /usr/bin/grep --quiet -E 'com.getdropbox.dropbox.\d+'; then
      /usr/bin/open -gjb com.getdropbox.dropbox 2>/dev/null || with_askpass brew cask install dropbox &>/dev/null
    fi

    /bin/sleep 5
  done

#  link_to_dropbox 'Desktop'

#  link_to_dropbox 'Library/Fonts'
  link_to_dropbox 'Documents/Arduino'
#  link_to_dropbox 'Documents/Scans'
  link_to_dropbox 'Documents/SketchUp'

  local favorites='Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.FavoriteItems.sfl'
  if [ -f "$(get_dropbox_dir)/Sync/~/${favorites}" ]; then
    /bin/rm -f "${HOME}/${favorites}"
    /bin/mv "$(get_dropbox_dir)/Sync/~/${favorites}" "${HOME}/${favorites}"
    /bin/ln -s "${HOME}/${favorites}" "$(get_dropbox_dir)/Sync/~/${favorites}"
  fi

  /usr/bin/open -gja Dropbox

}

print_in_purple "\n   Adjusting Dropbox Settings\n\n"

defaults_dropbox
dropbox_link_folders
