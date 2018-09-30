#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Editors & IDE\n\n"

brew_install "Atom" "atom" "caskroom/cask" "cask"

execute \
    "apm install 'markdown-writer' && \
     apm install 'markdown-preview-plus' && \
     apm install 'markdown-pdf' && \
     apm install 'language-powershell' && \
     apm install 'language-batchfile' && \
     apm install 'pretty-json' && \
     apm install 'xml-formatter' && \
     apm install 'split-diff' && \
     apm install 'pdf-view' && \
     apm install 'sublime-style-column-selection' && \
     apm install 'markdown-table-editor' && \
     apm install 'tool-bar' && \
     apm install 'tool-bar-markdown-writer' && \
     apm install 'language-vb' && \
     apm install 'language-vbscript' && \
     apm install 'language-csv' && \
     apm install 'pigments' && \
     apm install 'jekyll-syntax-highlighting'
     " \
    "Install Atom Plugins"

brew_install "TextMate" "textmate" "caskroom/cask" "cask"

brew_install "MacTex" "mactex" "caskroom/cask" "cask"
ln -s /Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin \
      /usr/texbin

brew_install "GitHub" "github" "caskroom/cask" "cask"

brew_install "GitKraken" "gitkraken" "caskroom/cask" "cask"

brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"

brew_install "Sublime Text" "sublime-text" "caskroom/cask" "cask"

brew_install "Sourcetree" "sourcetree" "caskroom/cask" "cask"

brew_install "MacDown" "macdown" "caskroom/cask" "cask"

brew_install "Calibre" "calibre" "caskroom/cask" "cask"

brew_install "Typora" "typora" "caskroom/cask" "cask"
