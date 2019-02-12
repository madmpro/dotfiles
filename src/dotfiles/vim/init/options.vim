"------------------------------------------------
" => General Settings
"------------------------------------------------

set nocompatible               " Don't make Vim vi-compatibile.

syntax on                      " Enable syntax highlighting.

if has("autocmd")
    filetype plugin indent on
    "           │     │    └──── Enable file type detection.
    "           │     └───────── Enable loading of indent file.
    "           └─────────────── Enable loading of plugin files.
endif

set timeoutlen=500             " Time to wait for a command.
set autoread                   " Set autoread when a file is changed outside.
set hidden                     " Allow hidden, unsaved buffers.

set modeline                   " Turn on modeline.

set completeopt+=longest       " Optimize auto complete.
set completeopt-=preview       " Optimize auto complete.
set complete=.,w,b,u,t,k
set autoindent                 " Copy indent to the new line.

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode.

set backupdir=~/.vim/backup   " Set directory for backup files.

set backupskip=/tmp/*          " ┐ Don't create backups
set backupskip+=/private/tmp/* " ┘ for certain files.

set clipboard=unnamed          " ┐
                               " │ Use the system clipboard
if has("unnamedplus")          " │ as the default register.
    set clipboard+=unnamedplus " │
endif                          " ┘

set cpoptions+=$               " When making a change, don't
                               " redisplay the line, and instead,
                               " put a `$` sign at the end of
                               " the changed text.

" draw the right-column and fill it in
execute "set colorcolumn=" . join(range(80,120), ',')
highlight ColorColumn ctermbg=darkgray

set cursorline                 " Highlight the current line.
set directory=~/.vim/swap      " Set directory for swap files.
set encoding=utf-8 nobomb      " Use UTF-8 without BOM.
set history=4096               " Increase command line history.
set hlsearch                   " Enable search highlighting.
set ignorecase                 " Ignore case in search patterns.

set incsearch                  " Highlight search pattern
                               " as it is being typed.

set laststatus=2               " Always show the status line.

set lazyredraw                 " Do not redraw the screen while
                               " executing macros, registers
                               " and other commands that have
                               " not been typed.

set listchars=tab:▸\           " ┐
set listchars+=trail:·         " │ Use custom symbols to
set listchars+=eol:↴           " │ represent invisible characters.
set listchars+=nbsp:_          " ┘

" make extraneous whitespace so, so pretty
set listchars=precedes:←,extends:→

if has("gui_running")
  set listchars=trail:·
else
  set listchars=trail:~
endif

set showmatch                  " Show matching brackets
set wildmode=list:longest      " Bash-like tab completion
set magic                      " Enable extended regexp.
set mousehide                  " Hide mouse pointer while typing.
set noerrorbells               " Disable error bells.

set nojoinspaces               " When using the join command,
                               " only insert a single space
                               " after a `.`, `?`, or `!`.

set nostartofline              " Kept the cursor on the same column.
set number                     " Show line number.

set numberwidth=5              " Increase the minimal number of
                               " columns used for the `line number`.

set report=0                   " Report the number of lines changed.
set ruler                      " Show cursor position.

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen.

set shortmess=aAItW            " Avoid all the hit-enter prompts.
set showcmd                    " Show typed command prefixes while waiting for operator.
set showmode                   " Show current mode.
set spelllang=en_us            " Set the spellchecking language.

set smartcase                  " Override `ignorecase` option
                               " if the search pattern contains
                               " uppercase characters.

set synmaxcol=2500             " Limit syntax highlighting (this
                               " avoids the very slow redrawing
                               " when files contain long lines).

set tabstop=4                  " ┐
set softtabstop=4              " │ Set global <TAB> settings.
set shiftwidth=4               " │
set expandtab                  " ┘ Use soft tabs

set smarttab                   " Be smart when using tabs ;)

set breakindent                " Better wrap
" set breakindentopt=shift:4

set ttyfast                    " Enable fast terminal connection.

try
  set undodir=~/.vim/undo        " Set directory for undo files.
    set undofile                   " Automatically save undo history.
catch
endtry

set undolevels=1000
set undoreload=10000

set virtualedit=all            " Allow cursor to be anywhere.

set visualbell                 " ┐
set noerrorbells               " │ Disable beeping and window flashing
set t_vb=                      " ┘ https://vim.wikia.com/wiki/Disable_beeping

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted).

set winminheight=0             " Allow windows to be squashed.

set autowrite                  " Save buffer on switch

" Automatically source the Vimrc file on save
augroup autosorcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC | :call RefreshUI()
	autocmd BufWritePost $MYVIMRC :call RefreshUI()
augroup END

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" source .vimrc file from local directory if present
set exrc
set secure

" fzf support (https://github.com/junegunn/fzf)
if executable("fzf")
  if isdirectory("/usr/local/opt/fzf")
    set rtp+=/usr/local/opt/fzf
  elseif isdirectory(expand("~/.fzf"))
    let fzfenabled="homedir"
    set rtp+=~/.fzf
  endif
endif

" Set directories
function! InitializeDirectories()
    let parent=$HOME
    let prefix='.vim'
    let dir_list={
                \ 'backup': 'backupdir',
                \ 'view': 'viewdir',
                \ 'swap': 'directory',
                \ 'undo': 'undodir',
                \ 'cache': '',
                \ 'session': ''}
    for [dirname, settingname] in items(dir_list)
        let directory=parent.'/'.prefix.'/'.dirname.'/'
        if !isdirectory(directory)
            if exists('*mkdir')
                let dir = substitute(directory, "/$", "", "")
                call mkdir(dir, 'p')
            else
                echo 'Warning: Unable to create directory: '.directory
            endif
        endif
        if settingname!=''
            exe 'set '.settingname.'='.directory
        endif
    endfor
endfunction
call InitializeDirectories()
