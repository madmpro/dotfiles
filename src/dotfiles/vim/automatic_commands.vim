" ----------------------------------------------------------------------
" | Automatic Commands                                                 |
" ----------------------------------------------------------------------

if has("autocmd")

    " Autocommand Groups.
    " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically reload the configurations from
    " the `~/.vimrc` file whenever they are changed.

    augroup auto_reload_vim_configs

        autocmd!
        autocmd BufWritePost vimrc source $MYVIMRC

    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Use relative line numbers.
    " http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/

    augroup relative_line_numbers

        autocmd!

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to absolute
        " line numbers when Vim loses focus.

        autocmd FocusLost * :set number

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to relative
        " line numbers when Vim gains focus.

        autocmd FocusGained * :set relativenumber

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to absolute
        " line numbers when Vim is in insert mode.

        autocmd InsertEnter * :set number

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Automatically switch to relative
        " line numbers when Vim is in normal mode.

        autocmd InsertLeave * :set relativenumber


    augroup END

    " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    " Automatically strip the trailing
    " whitespaces when files are saved.

    augroup strip_trailing_whitespaces

        " List of file types for which the trailing whitespaces
        " should not be removed:

        let excludedFileTypes = []

        " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

        " Only strip the trailing whitespaces if
        " the file type is not in the excluded list.

        autocmd!
        autocmd BufWritePre * if index(excludedFileTypes, &ft) < 0 | :call StripTrailingWhitespaces()

    augroup END

      " Remember cursor position between vim sessions
      autocmd BufReadPost *
                  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                  \   exe "normal! g'\"" |
                  \ endif
      " center buffer around cursor when opening files
      autocmd BufRead * normal zz

endif
