" ----------------------------------------------------------------------
" | PLUGINS SETTINGS                                                   |
" ----------------------------------------------------------------------


" ----------------------------------------------------------------------
" | Plugins - NERDTree                                                 |
" ----------------------------------------------------------------------

if exists("*NERDTree")

  " Enable nice colors
  " let NERDChristmasTree = 1

  " Supress caching a large dir
  let g:NERDTreeNotificationThreshold = 500
  let g:NERDTreeAutoDeleteBuffer=1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 0
  let g:WebDevIconsOS = 'Darwin'
  " Make it easy to see where we are
  let NERDTreeHighlightCursorline = 1
  let NERDTreeCascadeSingleChildDir=1
  " Make bookmarks visible
  " let NERDTreeShowBookmarks = 1
  let g:NERDTreeHeader = 'hello'
  let NERDTreeHijackNetrw = 0

  " Show hidden files
  let NERDTreeShowHidden = 1

  " Don't hijack NETRW
  "let NERDTreeHijackNetrw = 0

  let NERDTreeWinSize=30

  let NERDTreeWinPos = 'left'

  " https://github.com/dawaa/dotfiles-v2/blob/fbd90dedc962edcabd9923f8c7a9505bf3eb8b68/.vim/config/nerdtree.vim
  let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

  " Close Tree on open file
  "let NERDTreeQuitOnOpen = 1

  let NERDTreeIgnore = ['\.git$', '\.svn$', '\.bundle$', '\.DS_Store$', '\.xcodeproj', '\.dropbox']

  " Open a NERDTree automatically when vim starts up if no files were specified
  autocmd StdinReadPre * let s:std_in=1
  " Open NERDTree automatically when vim starts up
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  "Open NERDTree automatically when vim starts up on opening a directory
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

  " Close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

endif

" ----------------------------------------------------------------------
" | Plugins - vim-markdown-preview                                     |
" ----------------------------------------------------------------------

let vim_markdown_preview_github=1

" ----------------------------------------------------------------------
" | Plugins - Instant Markdown                                         |
" ----------------------------------------------------------------------

" Do not automatically launch the preview
" window when the markdown file is open.
" https://github.com/suan/vim-instant-markdown#ginstant_markdown_autostart

let g:instant_markdown_autostart = 0

" ----------------------------------------------------------------------
" | Plugins - Markdown                                                 |
" ----------------------------------------------------------------------

" Disable Folding.
" https://github.com/plasticboy/vim-markdown#disable-folding

let g:vim_markdown_folding_disabled=1

" ----------------------------------------------------------------------
" | Plugins - NeoComplCache                                            |
" ----------------------------------------------------------------------

" Enable `neocomplcache` by default.
" https://github.com/Shougo/neocomplcache.vim#installation

let g:neocomplcache_enable_at_startup=1

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Make `Tab` autocomplete.

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Make `Shift+Tab` insert `Tab` character.

inoremap <S-TAB> <C-V><TAB>

" ----------------------------------------------------------------------
" | Plugins - Signify                                                  |
" ----------------------------------------------------------------------

" Disable Signify by default.
" https://github.com/mhinz/vim-signify

let g:signify_disable_by_default=1

" ----------------------------------------------------------------------
" | Plugins - python-mode                                              |
" ----------------------------------------------------------------------

let g:pymode_breakpoint = 0
let g:pymode_folding = 0
let g:pymode_doc = 0
set completeopt=menu

" ----------------------------------------------------------------------
" | Plugins - vim-indent-guides                                        |
" ----------------------------------------------------------------------
if exists("*IndentGuidesEnable")

  " Toggle indent guides by default
  autocmd VimEnter * :IndentGuidesEnable
  " Change guide size
  let g:indent_guides_guide_size = 1

endif

" ----------------------------------------------------------------------
" | Plugins - Airline                                                  |
" ----------------------------------------------------------------------

" Show open buffers when there's only one tab
let g:airline#extensions#tabline#enabled = 1
" Always show the status bar
set laststatus=2
" Use powerline symbols
let g:airline_powerline_fonts = 1
" Use powerline theme
let g:airline_theme='solarized'
" Hide default mode (already shown in Powerline)
set noshowmode
" Disable mix-indent detection
let g:airline#extensions#whitespace#enabled = 0
let g:airline_solarized_bg='dark'

" ----------------------------------------------------------------------
" | Plugins - Syntastic                                                |
" ----------------------------------------------------------------------

" Inform Syntastic which checkers to use based on file types.
" https://github.com/scrooloose/syntastic#faq
let g:syntastic_javascript_checkers = [ 'eslint' ]


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Disable syntax checking by default.

let g:syntastic_mode_map = {
    \ "active_filetypes": [],
    \ "mode": "passive",
    \ "passive_filetypes": []
\}

" ----------------------------------------------------------------------
" | Plugins - Indent Guides                                            |
" ----------------------------------------------------------------------

" Set custom indent colors.
" https://github.com/nathanaelkane/vim-indent-guides#setting-custom-indent-colors

let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd
        \ guibg=#00323D
        \ ctermbg=Magenta

autocmd VimEnter,Colorscheme * :hi IndentGuidesEven
        \ guibg=#073642
        \ ctermbg=DarkMagenta

" ----------------------------------------------------------------------
" | Plugins - Emmet                                                    |
" ----------------------------------------------------------------------

" Redefine trigger key for Emmet.
" http://docs.emmet.io/cheat-sheet/

let g:user_emmet_leader_key="<C-E>"

"  " 1. Expand abbreviation *emmet-expand-abbr
"   nnoremap <leader>em, <C-y>,
"
" " 2. Expand abbreviation *emmet-expand-word* *<C-y>;*
"   nnoremap <leader>emt <C-y>;
"
" " 3. Update tag *emmet-update-tag* *<C-y>u*
"   nnoremap <leader>emu <c-y>u
"
" " 4. Wrap with abbreviation *emmet-wrap-with-abbreviation* *v_<C-y>,*
"   vnoremap <leader>em, v_<C-y>,
" Remapping <C-y>, just doesn't cut it.
function! s:expand_html_tab()
    " try to determine if we're within quotes or tags.
    " if so, assume we're in an emmet fill area.
    let line = getline('.')
    if col('.') < len(line)
        let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
        if len(line) >= 2
            return "\<C-n>"
        endif
    endif
    " expand anything emmet thinks is expandable.
    if emmet#isExpandable()
        return emmet#expandAbbrIntelligent("\<tab>")
        " return "\<C-y>,"
    endif
    " return a regular tab character
    return "\<tab>"
endfunction
" let g:user_emmet_expandabbr_key='<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

autocmd FileType html,css,scss imap <silent><buffer><expr><tab> <sid>expand_html_tab()
let g:user_emmet_mode='a'
let g:user_emmet_complete_tag = 0
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if exists("*webapi")
  " Load custom Emmet snippets.
  " http://docs.emmet.io/customization/snippets/

  let g:user_emmet_settings = webapi#json#decode(join(readfile(expand("~/.vim/snippets/emmet.json")), "\n"))

endif

" ----------------------------------------------------------------------
" | Plugins - Powerline                                                |
" ----------------------------------------------------------------------

"https://github.com/Lokaltog/vim-powerline

set guifont=Inconsolata\ for\ Powerline:h15
" I can't see the fancy symbols, what's wrong?
let g:Powerline_symbols = 'fancy'
" The statusline has a lot of ^ or underline characters in it!
set fillchars+=stl:\ ,stlnc:\
" OS X doesn't show the status bar
set laststatus=2

if exists("*denite")

  " ----------------------------------------------------------------------
  " | Denite                                                             |
  " ----------------------------------------------------------------------
  let g:webdevicons_enable_denite = 0
  let s:menus = {}

  call denite#custom#option('_', {
              \ 'prompt': '❯',
              \ 'winheight': 10,
              \ 'reversed': 1,
              \ 'highlight_matched_char': 'Underlined',
              \ 'highlight_mode_normal': 'CursorLine',
              \ 'updatetime': 1,
              \ 'auto_resize': 1,
              \})
  call denite#custom#option('TSDocumentSymbol', {
              \ 'prompt': ' @' ,
              \ 'reversed': 0,
              \})
  call denite#custom#var('file_rec', 'command',
              \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  call denite#custom#source('file_rec', 'vars', {
              \ 'command': [
              \ 'ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png'
              \] })

  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts',
              \ ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])


  " nnoremap <silent> <c-p> :Denite file_rec<CR>
  nnoremap <silent> <leader>j :Denite file_rec<CR>
  nnoremap <silent> <leader>h :Denite  help<CR>
  nnoremap <silent> <leader>th :Denite colorscheme<CR>
  nnoremap <silent> <leader>b :Denite buffer<CR>
  nnoremap <silent> <leader>a :Denite grep:::!<CR>
  nnoremap <silent> <leader>u :call dein#update()<CR>
  nnoremap <silent> <Leader>i :Denite menu:ionic <CR>
  call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
  call denite#custom#map('insert','<C-N>','<denite:move_to_previous_line>','noremap')
  call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
              \ [ '.git/', '.ropeproject/', '__pycache__/',
              \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
  call denite#custom#var('menu', 'menus', s:menus)
endif
