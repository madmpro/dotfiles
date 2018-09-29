#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {

    declare -a FILES_TO_SYMLINK=(

        "config"
        "dotfiles/aria2"
        "dotfiles/todo"
        "dotfiles/cmus"
        "dotfiles/cron"
        "dotfiles/curl-format"
        "dotfiles/curlrc"
        "git/gitattributes"
        "git/gitconfig"
        "git/gitignore"
        "dotfiles/inputrc"
        "dotfiles/iTerm"
        "dotfiles/nanorc"
        "dotfiles/ncdc"
        "dotfiles/newsboat"
        "dotfiles/now"
        "dotfiles/pyradio"
        "dotfiles/screenrc"
        "dotfiles/tmux"
        "dotfiles/tmux/tmux.conf"
        "dotfiles/tmux/tmux.conf.local"
        "dotfiles/vim"
        "dotfiles/vim/vimrc"
        "dotfiles/wgetrc"
        "shell/bash"
        "shell/bashrc"
        "shell/bash/bash.local"
        "shell/bash/bash_history"
        "shell/profile"
        "shell/zsh"
        "shell/zshrc"
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


    # link bin
    print_in_purple "\n • Installing user binaries...\n\n"
    ask_for_sudo

    FILES_TO_SYMLINK="$(cd .. && pwd)/bin/*"
    targetFolder="$HOME/bin"

    [[ ! -d "$targetFolder" ]] && mkdir $targetFolder

    for i in $FILES_TO_SYMLINK ; do
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

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    print_in_purple "\n • Create symbolic links\n\n"
    create_symlinks "$@"
}

main "$@"
