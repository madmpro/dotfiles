#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "dotfiles/config"
        "dotfiles/atom"
        "dotfiles/aria2"
        "dotfiles/bash"
        "dotfiles/bash/bashrc"
        "dotfiles/bash/bash.local"
        "dotfiles/bash/history"
        "dotfiles/cmus"
        "dotfiles/cron"
        "dotfiles/curl-format"
        "dotfiles/curlrc"
        "dotfiles/evernote"
        "dotfiles/git/gitattributes"
        "dotfiles/git/gitconfig"
        "dotfiles/git/gitignore"
        "dotfiles/inputrc"
        "dotfiles/iTerm"
        "dotfiles/nanorc"
        "dotfiles/ncdc"
        "dotfiles/newsboat"
        "dotfiles/now"
        "dotfiles/profile"
        "dotfiles/pyradio"
        "dotfiles/screenrc"
        "dotfiles/tmux"
        "dotfiles/tmux/tmux.conf"
        "dotfiles/tmux/tmux.conf.local"
        "dotfiles/todo"
        "dotfiles/vim"
        "dotfiles/vim/vimrc"
        "dotfiles/wgetrc"
        "dotfiles/zsh"
        "dotfiles/zsh/zshrc"
    )

    local i=""
    local sourceFile=""
    local targetFile=""
    local skipQuestions=false

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    skip_questions "$@" \
        && skipQuestions=true

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_SYMLINK[@]}"; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ ! -e "$targetFile" ] || $skipQuestions; then

            execute \
                "ln -fs $sourceFile $targetFile" \
                "$targetFile → $sourceFile"

        elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
            print_success "$targetFile → $sourceFile"
        else

            if ! $skipQuestions; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then

                    rm -rf "$targetFile"

                    execute \
                        "ln -fs $sourceFile $targetFile" \
                        "$targetFile → $sourceFile"

                else
                    print_error "$targetFile → $sourceFile"
                fi
            fi
        fi
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # ssh config
    if [ -f $HOME/.ssh/config ]; then
      if [ "$(get_os)"="macos" ]; then
        if ! grep -Fxq "### Dotfiles Begin ###" $HOME/.ssh/config; then
          echo  "$(cat $(cd .. && pwd)/dotfiles/ssh/macos/config)"$'\n\n'"$(cat $HOME/.ssh/config)" > $HOME/.ssh/config
        fi
      fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # link bin
    print_in_purple "\n • Installing user binaries...\n\n"
    ask_for_sudo

    FILES_TO_SYMLINK="$(cd .. && pwd)/bin/*"
    targetFolder="$HOME/bin"

    [[ ! -d "$targetFolder" ]] && mkdir $targetFolder

    for i in $FILES_TO_SYMLINK ; do
      # do not link .md files
      if [[ "$i" = *.md ]]; then
        continue
      fi

      chmod +x $i
      sourceFile="$i"
      targetFile="$targetFolder/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

      if [ ! -e "$targetFile" ] || $skipQuestions; then

          execute \
              "ln -fs $sourceFile $targetFile" \
              "$targetFile → $sourceFile"

      elif [ "$(readlink "$targetFile")" == "$sourceFile" ]; then
          print_success "$targetFile → $sourceFile"
      else

          if ! $skipQuestions; then

              ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
              if answer_is_yes; then

                  rm -rf "$targetFile"

                  execute \
                      "ln -fs $sourceFile $targetFile" \
                      "$targetFile → $sourceFile"

              else
                  print_error "$targetFile → $sourceFile"
              fi
          fi
      fi
    done

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Newsboat bookmarks
    if [ ! -e "$HOME/.newsboat/bookmarks.md" ]; then
      cp "$HOME/.newsboat/bookmarks.template.md" "$HOME/.newsboat/bookmarks.md"
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Übersicht
    if [[ -d "$HOME/Library/Application Support/Übersicht" ]]; then
      rm -rf "$HOME/Library/Application Support/Übersicht"
    fi

    ln -sf "$HOME/Projects/dotfiles/src/dotfiles/Übersicht" "$HOME/Library/Application Support/"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # MacTex
    if [[ -f "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin" ]]; then
      ln -s /Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin /usr/texbin
    fi

    # The dotnet crypto library must be able to find the openssl libraries in its
    # rpath, which by default includes /usr/local. If the 1.0.0 libs are not found,
    # dotnet does not work.
    ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/ &> /dev/null
    ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/ &> /dev/null


}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
}

main "$@"
