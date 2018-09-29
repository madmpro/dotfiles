#!/usr/bin/env bash
#
# Install or uninstall the text replacements

# https://github.com/warpling/Macmoji/blob/55d58d5842e745ab5d6778c3e788d469be5e105e/scripts/macmoji

cd "$(dirname "$(realpath "$0")")";

DATE=`date +%s`
USER=`id -un`
USER_DICTIONARY_FOLDER=`ls -td -- ~/Library/Dictionaries/CoreDataUbiquitySupport/"${USER}"~*/UserDictionary/* | head -n 1`
USER_DICTIONARY="${USER_DICTIONARY_FOLDER}/store/UserDictionary.db"
GLOBAL_PREFERENCES="/Users/${USER}/Library/Preferences/.GlobalPreferences.plist"
PLIST_BUDDY="/usr/libexec/PlistBuddy"
SQLITE="/usr/bin/sqlite3"
EMOJI_SUBSTITUTIONS="NSUserDictionaryReplacementItems.plist"
COUNT=`${PLIST_BUDDY} -c 'Print' "${EMOJI_SUBSTITUTIONS}" | grep 'Dict' | wc -l`

contains () {
  local e
  local i=0
  declare -a arr=("${@:3}")
  for e in "${arr[@]}"; do
    if [[ "$e" == "$1" ]]; then
      if [[ "${arr[$(($i + 1))]}" == "$2" ]]; then
        return 0
      fi
    fi
    ((i+=1))
  done
  return 1
}

install() {
  echo "Installing Macmoji text replacements..."

  PK_LAST=`${SQLITE} "${USER_DICTIONARY}" "SELECT Z_PK FROM ZUSERDICTIONARYENTRY ORDER BY Z_PK DESC LIMIT 1;"`

  echo $PK_LAST

  pk=$(($PK_LAST))
  cnt=`echo -e "${COUNT}" | tr -d '[[:space:]]'`
  plist=''
  sql=''

  while [ $cnt -gt 0 ]; do
    let cnt-=1
    let pk+=1
    replace=`${PLIST_BUDDY} -c "Print :${cnt}:replace" "${EMOJI_SUBSTITUTIONS}"`
    with=`${PLIST_BUDDY} -c "Print :${cnt}:with" "${EMOJI_SUBSTITUTIONS}"`
    plist+="{on=1;replace=\"${replace}\";with=\"${with}\";},"
    sql+="INSERT INTO 'ZUSERDICTIONARYENTRY' VALUES($((${pk})),1,1,0,0,0,0,${DATE},NULL,NULL,NULL,NULL,NULL,\"${with}\",\"${replace}\",NULL);"
  done


  $SQLITE "${USER_DICTIONARY}" "${sql}"
  defaults write -g NSUserDictionaryReplacementItems "(${plist%?})"
}

uninstall() {
  echo "Uninstalling Macmoji text replacements..."

  seen=()
  cnt=`echo -e "${COUNT}" | tr -d '[[:space:]]'`

  while [ $cnt -gt 0 ]; do
    let cnt-=1
    let pk+=1
    replace=`${PLIST_BUDDY} -c "Print :${cnt}:replace" "${EMOJI_SUBSTITUTIONS}"`
    with=`${PLIST_BUDDY} -c "Print :${cnt}:with" "${EMOJI_SUBSTITUTIONS}"`
    arr=("$replace" "$with")
    seen+=("${arr[@]}")
    sql+="DELETE FROM 'ZUSERDICTIONARYENTRY' WHERE ZPHRASE = \"${with}\" AND ZSHORTCUT = \"${replace}\";"
  done
  $SQLITE "${USER_DICTIONARY}" "${sql}"

  EXISTING_COUNT=`${PLIST_BUDDY} -c 'Print :NSUserDictionaryReplacementItems' "${GLOBAL_PREFERENCES}" | grep 'Dict' | wc -l`
  existing_cnt=`echo -e "${EXISTING_COUNT}" | tr -d '[[:space:]]'`

  while [ $existing_cnt -gt 0 ]; do
    let existing_cnt-=1
    replace=`${PLIST_BUDDY} -c "Print :NSUserDictionaryReplacementItems:$(($existing_cnt)):replace" "${GLOBAL_PREFERENCES}"`
    with=`${PLIST_BUDDY} -c "Print :NSUserDictionaryReplacementItems:$(($existing_cnt)):with" "${GLOBAL_PREFERENCES}"`
    if contains $replace $with "${seen[@]}"; then
      ${PLIST_BUDDY} -c "Delete :NSUserDictionaryReplacementItems:$(($existing_cnt))" "${GLOBAL_PREFERENCES}"
    fi
  done
}

# Backup Localization.prefPane text substitution rules.
backup() {
  local prefs=$HOME/Library/Preferences/.GlobalPreferences.plist
  local backup=$HOME/NSUserDictionaryReplacementItems.plist
  /usr/libexec/PlistBuddy -x -c "Print NSUserDictionaryReplacementItems" "$prefs" > "$backup" &&
  echo "File ${backup} written."
}

# Backup Localization.prefPane text substitution rules.
dotfile() {
  local prefs=$HOME/Library/Preferences/.GlobalPreferences.plist
  local backup=$HOME/Projects/dotfiles/src/os/preferences/macos/NSUserDictionaryReplacementItems.plist
  /usr/libexec/PlistBuddy -x -c "Print NSUserDictionaryReplacementItems" "$prefs" > "$backup" &&
  echo "File ${backup} written."
}

# Restore Localization.prefPane text substitution rules.
restore() {

  EMOJI_SUBSTITUTIONS=$HOME/NSUserDictionaryReplacementItems.plist

  if [ -f $EMOJI_SUBSTITUTIONS ]; then
    uninstall
    install
    echo "File ${EMOJI_SUBSTITUTIONS} restored."
  else
    echo "File ${EMOJI_SUBSTITUTIONS} not found!"
  fi

}

if [[ $1 == 'install' ]]; then
  backup
  uninstall
  install
elif [[ $1 == 'uninstall' ]]; then
  uninstall
elif [[ $1 == 'backup' ]]; then
  backup
elif [[ $1 == 'restore' ]]; then
  backup
  restore
elif [[ $1 == 'dotfile' ]]; then
  dotfile
else
  echo "Valid commands are: 'install', 'uninstall', 'backup', 'restore'"
fi
