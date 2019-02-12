" ----------------------------------------------------------------------
" | Color Scheme                                                       |
" ----------------------------------------------------------------------

set t_Co=256                   " Enable full-color support.

set background=dark            " Use colors that look good
                               " on a dark background.

" Set custom configurations for when the
" Solarized theme is used from Vim's Terminal mode.
"
" http://ethanschoonover.com/solarized/vim-colors-solarized#advanced-configuration

if !has("gui_running")
    let g:solarized_contrast = "high"
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    let g:solarized_visibility = "high"
endif

colorscheme solarized          " Use custom color scheme.
