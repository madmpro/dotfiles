#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Setup Visual Studio Code\n\n"

if [[ ! -d "$HOME/Library/Application Support/Code/User" ]]; then
  mkdir -p "$HOME/Library/Application Support/Code/User"
fi

VSCODE_CONFIGS=(
  keybindings
  settings
)

for file in ${VSCODE_CONFIGS[@]}; do
  ln -sf \
    "$HOME/Projects/dotfiles/src/Visual Studio Code/User/$file.json" \
    "$HOME/Library/Application Support/Code/User"
done

VSCODE_EXTENSIONS=(
      alefragnani.pascal
      christian-kohler.npm-intellisense
      dbaeumer.vscode-eslint
      donjayamanne.githistory
      EditorConfig.EditorConfig
      eg2.vscode-npm-script
      fallenwood.vimL
      felipecaputo.git-project-manager
      formulahendry.code-runner
      formulahendry.terminal
      formulahendry.iot-extension-pack
      hoangnc.io-run
      kondratiev.sshextension
      lukehoban.Go
      minhthai.vscode-todo-parser
      ms-mssql.mssql
      ms-vscode.azure-account
      ms-vscode.csharp
      ms-vscode.powershell
      ms-iot.windowsiot
      PKief.material-icon-theme
      PeterJausovec.vscode-docker
      shakram02.bash-beautify
      timonwong.shellcheck
      vscodevim.vim
      wayou.vscode-todo-highlight
      zhuangtongfa.Material-theme
    )

for EXTENSION in ${VSCODE_EXTENSIONS[@]}; do
      code --install-extension $EXTENSION
done


execute "defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false" \
    "Fix Key Repeat"
