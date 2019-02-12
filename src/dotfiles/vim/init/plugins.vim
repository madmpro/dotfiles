" ----------------------------------------------------------------------
" | PLUGINS                                                            |
" ----------------------------------------------------------------------

set nocompatible              " be iMproved, required
" Disable file type detection (this is required by Vundle).
filetype off

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if !isdirectory(expand("~/.vim/plugins/Vundle.vim"))
  " Install Vundle
  echo 'Installing Vundle'
  let cmd = system('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/plugins/Vundle.vim')
endif

if !isdirectory(expand("~/.vim/plugins/vim-plug"))

  " install vim-plug
  echo 'Installing vim-plug'
  let cmd = system('git clone https://github.com/jwhitley/vim-plug.git ~/.vim/plugins/vim-plug')

endif

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Use Vundle to manage the Vim plugins.
" https://github.com/VundleVim/Vundle.vim
" :PluginInstall - to install plugins
" vim +PluginInstall +qall - to install plugins from terminal

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/plugins/Vundle.vim

" Initialize Vundle and specify the path
" where the plugins should be installed.
call vundle#begin("~/.vim/plugins")

    "Plugin Managers"-----------{{{
        Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
        Plugin 'jwhitley/vim-plug' " Bundle-vim
     "}}}

     " SYNTAX"---------------------------------{{{
        " Javascript"------------{{{
            Plugin 'elzr/vim-json'
            Plugin 'prettier/vim-prettier'
            Plugin 'othree/yajs.vim' " Yet Another Javascript Syntax
            Plugin 'flowtype/vim-flow' " A vim plugin for Flow
            Plugin 'carlitux/deoplete-ternjs' "deoplete.nvim source for javascript{'build': ' sudo yarn global add tern '}
            Plugin '1995eaton/vim-better-javascript-completion' "An expansion of Vim's current JavaScript syntax file.
            Plugin 'jelera/vim-javascript-syntax'
            Plugin 'isRuslan/vim-es6' "List of JavaScript ES6 snippets and syntax highlighting for vim.
            " Plugin 'HerringtonDarkholme/yats.vim' "YATS: Yet Another TypeScript Syntax
        "}}}
        "HTML"------------{{{
            Plugin 'digitaltoad/vim-pug'
            Plugin 'mattn/emmet-vim'
            Plugin 'othree/html5.vim' " HTML5 omnicomplete and syntax
            Plugin 'skwp/vim-html-escape'
            Plugin 'vingorius/pug-beautifier' " Pug(formerly jade) beautify CLI
        "}}}
        "CSS"------------{{{
            Plugin 'hail2u/vim-css3-syntax'
            Plugin 'ap/vim-css-color'
            Plugin 'groenewege/vim-less' " vim syntax for LESS (dynamic CSS)
        "}}}
        "English"------------{{{
            Plugin 'rhysd/vim-grammarous' "vim-grammarous is a powerful grammar checker for Vim. Simply do :GrammarousCheck
        "}}}
        "Java"---------------------------------{{{
            Plugin 'artur-shaik/vim-javacomplete2' "Updated javacomplete plugin for vim.
        "}}}
        "Docker"---------------------------------{{{
            Plugin 'ekalinin/Dockerfile.vim' " Docker syntx highlisting
        "}}}
        "R(lang)"---------------------------------{{{
            Plugin 'jalvesaq/Nvim-R' " Vim plugin to work with R
        "}}}
        "GO"---------------------------------{{{
            Plugin 'fatih/vim-go' " Go development plugin for Vim
        "}}}

     "}}}

     " BOLT-ON PLUGINS"---------------------------------{{{
        " Add-on Features"-----------{{{
            Plugin 'tmux-plugins/vim-tmux'
            Plugin 'tpope/vim-surround'  " Surround.vim is all about 'surroundings': parentheses, brackets, quotes, XML tags, and more
            Plugin 'sbdchd/neoformat'
            Plugin 'majutsushi/tagbar' " Vim plugin that displays tags in a window, ordered by scope
            Plugin 'tomtom/tcomment_vim' " An extensible & file-type sensible & universal comment vim-plugin
            Plugin 'rizzatti/dash.vim' " Search Dash.app from Vim
            Plugin 'mattn/gist-vim' " This is a vimscript for creating gists
            Plugin 'mattn/webapi-vim' " vim interface to Web API
            Plugin 'danro/rename.vim' " Rename the current file in the vim buffer + retain relative path.
            Plugin 'ctrlpvim/ctrlp.vim'
            Plugin 'pbrisbin/vim-mkdir' " Automatically create any non-existent directories before writing the buffer.
            " Plugin 'justinmk/vim-sneak'
            Plugin 'jeetsukumaran/vim-buffergator' " Vim plugin to list, select and switch between buffers.
            Plugin 'JamshedVesuna/vim-markdown-preview' " A light Vim plugin for previewing markdown files in a browser - without having to leave Vim.
            Plugin 'shougo/vimproc.vim' " Interactive command execution in Vim.
            Plugin 'suan/vim-instant-markdown'
            Plugin 'tpope/vim-commentary'
            Plugin 'tpope/vim-sleuth' " sleuth.vim: Heuristically set buffer options
            Plugin 'klen/python-mode' " Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box.

         "}}}
         "Movement"-----------{{{
            Plugin 'christoomey/vim-tmux-navigator'
            Plugin 'terryma/vim-multiple-cursors' " Multiple Cursors as described (miltiple selction feature)
            Plugin 'itmammoth/doorboy.vim' "Vim plugin for auto closing brackets ( => (|) and quotations
            Plugin 'sjl/vitality.vim' " (Vit)ality is a plugin that makes (V)im play nicely with (i)Term 2 and (t)mux.
         "}}}
         "Formatting"-----------{{{
            Plugin 'tpope/vim-unimpaired' " Pairs of handy bracket mappings
            Plugin 'dhruvasagar/vim-table-mode' "An awesome automatic table creator & formatter allowing one to create neat tables as you type.
            Plugin 'godlygeek/tabular' " Vim script for text filtering and alignment
            Plugin 'AndrewRadev/switch.vim'
            Plugin 'vim-scripts/SyntaxRange' "Define a different filetype syntax on regions of a buffer
            "Plugin 'vim-scripts/Align' " Help folks to align text, eqns, declarations, tables, etc
            Plugin 'nathanaelkane/vim-indent-guides' " Show indentation guides
            Plugin 'mhinz/vim-signify'  "Show a diff using Vim its sign column.
            Plugin 'ntpeters/vim-better-whitespace' " Highlight all trailing whitespaces characters

         "}}}
         "Default Behavior Modifiers"-----------{{{
            Plugin 'editorconfig/editorconfig-vim'
            Plugin 'jremmen/vim-ripgrep'
            Plugin 'tpope/vim-repeat' "Repeat.vim remaps . in a way that plugins can tap into it.
            Plugin 'junegunn/limelight.vim' "Dim text code blocks not being focused upon by cursor
            Plugin 'Konfekt/FastFold' "Speed up Vim by updating folds only when called-for.
            Plugin 'mhinz/vim-sayonara' " Basically you don't have to think in terms of :bdelete, :close, :quit etc. anymore.
            Plugin 'MartinLafreniere/vim-PairTools' "Pairing Punctuationa and grammer pairs
         "}}}
         "NERDTree"-----------{{{
            Plugin 'scrooloose/nerdtree'  " The NERDTree is a file system explorer for the Vim editor
            Plugin 'Xuyuanp/nerdtree-git-plugin' "A plugin of NERDTree showing git status flags.
            Plugin 'ryanoasis/vim-devicons' " Adds file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, and more
            Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " Extra syntax and highlight for nerdtree files
         "}}}
        "AirLine"-----------{{{
            Plugin 'vim-airline/vim-airline' " lean & mean status/tabline for vim that's light as air
            Plugin 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
         "}}}
         "Git"-----------{{{
            Plugin 'tpope/vim-fugitive' " fugitive.vim may very well be the best Git wrapper of all time
            Plugin 'tpope/vim-rhubarb'
            Plugin 'chemzqm/vim-easygit'
            Plugin 'sgeb/vim-diff-fold'
            Plugin 'airblade/vim-gitgutter' " A Vim plugin which shows a git diff in the 'gutter' (sign column)
            Plugin 'junegunn/gv.vim' "A git commit browser. ':GV'
            Plugin 'lambdalisue/gina.vim' "Asynchronously control git repositories in Neovim/Vim 8
            Plugin 'gregsexton/gitv' " gitv is a repository viewer similar to gitk
         "}}}
         " deoplete stuff"-----------{{{
            Plugin 'Shougo/deoplete.nvim'
            Plugin 'Shougo/deol.nvim'
         "}}}
         "Denite stuff"-----------{{{
            Plugin 'Shougo/denite.nvim' " Denite is a dark powered plugin for Neovim/Vim to unite all interfaces
            Plugin 'Shougo/neomru.vim' " MRU plugin includes unite.vim/denite.nvim MRU sources
            Plugin 'Shougo/context_filetype.vim' " Context filetype library for Vim script
            Plugin 'chemzqm/denite-git' " gitlog, gitstatus and gitchanged source for denite.nvim
            Plugin 'pocari/vim-denite-gists' " denite.nvim plugin for show and browse Gist
            Plugin 'Shougo/vimfiler.vim' " Powerful file explorer implemented by Vim script
            Plugin 'Shougo/unite.vim' " Unite and create user interfaces
         "}}}
         "Snippet and Completions"-----------{{{
            Plugin 'Shougo/neco-vim' "The vim source for neocomplete/deoplete
            Plugin 'Shougo/neoinclude.vim' "Include completion framework for neocomplete/deoplete
            Plugin 'Shougo/neosnippet.vim' "The Neosnippet plug-In adds snippet support to Vim. Snippets
            Plugin 'Shougo/neosnippet-snippets' " The standard snippets repository for neosnippet
            Plugin 'Shougo/echodoc.vim' " Displays function signatures from completions in the command line.
            Plugin 'Shougo/neocomplcache.vim'
            Plugin 'honza/vim-snippets' " vim-snipmate default snippets (Previously snipmate-snippets)
            Plugin 'chrisbra/unicode.vim' " A Vim plugin that provides a completion function for Unicode glyphs
         "}}}
     "}}}

     "Git"-----------{{{
         Plugin 'jreybert/vimagit', {'on_cmd': ['Magit', 'MagitOnly']}
     "}}}

  " Split windows and the project drawer go together like oil and vinegar.
  Plugin 'tpope/vim-vinegar'
  " Solarized Colorscheme for Vim
  Plugin 'altercation/vim-colors-solarized'

  Plugin 'moll/vim-node'

  Plugin 'raimondi/delimitmate'

  Plugin 'mtscout6/syntastic-local-eslint.vim'
  Plugin 'scrooloose/syntastic' " Syntastic is a syntax checking plugin for Vim
  Plugin 'sheerun/vim-polyglot' "A solid language pack for Vim.
  Plugin 'wellle/targets.vim'
  Plugin 'shutnik/jshint2.vim'

  Plugin 'leafgarland/typescript-vim' " Typescript syntax files for Vim
  Plugin 'quramy/tsuquyomi' " A Vim plugin for TypeScript
  Plugin 'wavded/vim-stylus' " Syntax highlighting for Stylus (http://stylus-lang.com/)
  " Plugin 'Valloric/YouCompleteMe' "A code-completion engine for Vim
  Plugin 'gburca/vim-firewall' " Vim syntax file for Linux ULOG/NFLOG firewall log files

call vundle#end()            " required



" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Minimalist Vim Plugin Manager
" https://github.com/jwhitley/vim-plug
" :PlugInstall - to install plugins
" vim +PlugInstall  - to install plugins from terminal

"set rtp+=~/.vim/plugins/vim-plug
" Plugins managed by vim-plug
call plug#begin("~/.vim/plugins")

    " Powerline is a statusline plugin for vim, and provides statuslines
    " and prompts for several other applications, including zsh, bash, tmux,
    " IPython, Awesome and Qtile.
    " https://github.com/powerline/powerline
    Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

    Plug 'neomake/neomake', {'on_cmd': 'Neomake'}

    " SYNTAX"---------------------------------{{{
      " Javascript"------------{{{
        Plug 'heavenshell/vim-jsdoc', {'on_ft': 'javscript'} " Generate JSDoc to your JavaScript code.
        Plug 'othree/jsdoc-syntax.vim', {'on_ft': 'javscript'}
        Plug 'pangloss/vim-javascript',  {'on_ft': 'javascript'} " Vastly improved Javascript indentation and syntax support in Vim.
        Plug 'ternjs/tern_for_vim', { 'build': 'yarn install'} " This is a Vim plugin that provides Tern-based JavaScript editing support.
      "}}}
      "HTML"------------{{{
        Plug 'valloric/MatchTagAlways', {'on_ft': 'html'} "A Vim plugin that always highlights the enclosing html/xml tags
      "}}}
      "Markdown"------------{{{
        Plug 'tpope/vim-markdown', {'on_ft': 'markdown'}
        Plug 'nelstrom/vim-markdown-folding', {'on_ft': 'markdown'}
        Plug 'JamshedVesuna/vim-markdown-preview' " Preview Markdown File in Browser
      "}}}

      "Python"------------{{{
        Plug 'tmhedberg/SimpylFold', {'on_ft': 'python'} "No-BS Python code folding for Vim
        Plug 'davidhalter/jedi-vim', {'on_ft': 'python'} "Python autocompletion with VIM
        Plug 'zchee/deoplete-jedi' "deoplete.nvim source for Python
      "}}}
      "GO"-------------{{{
        Plug 'zchee/deoplete-go', {'build': 'make'} "deoplete.nvim source for Go. Asynchronous Go completion for Neovim
        " Plug 'zchee/nvim-go', {'build': 'gb build', 'on_ft': 'go'} " Go development plugin for Neovim written in pure Go
      "}}}
      "Brewfile"-------------{{{
        Plug 'bfontaine/Brewfile.vim'
      "}}}

    "}}}

    " Unmanaged plugin (manually installed and updated) - for plugin developers
    " Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Re-enable file type detection (disabling it was required by Vundle).
filetype on
