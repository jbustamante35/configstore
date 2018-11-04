"
"                                 @
"                                 #
"                                 #
"                 ,@@             @
"                @:#              @
"          `   `@#:`              @
"         .##      #   ##@@@@@@@@@@@@@@
"          @@#     ,.  @@@@@#@@@#@#@@@@`
"          @@@:     @  @@@@@@..  #@@#@@ `
"          @@@@#`   ;@@@@@@@@,';;;@@@'' `
"     @; @@@':;@@#:;@#@@@@@@@;.   @#@;:
"     #@@# +`:@@ .@@ #@# ,@@##`,,,@@@,,
"      @: ##@@@@#: #@`@#+@@#@ ... ##@``
"       @@@#,``'@@# #'@@#@@@# @@@ @':
"       @@,#'`   #@` @,,.,,,,,,,,,@@,@@
"      ;@;,     , @@.@#@@@@@@@@@@@@@@@@
"     `@@   #@@` @'#@;@``````````` @```
"     ;@#  #@ :@ ` @; #          ,@@@'
"      @++`@,  #   @+ #         +@@@#@@
"      @@@`'@ +@  `@@           @@:  #@'
"     `@@:  #@@   #@.          #@  @.`@@
"      #@+@     @ @@           @@ ' @ #@
"       @@'  `+@`@@'           '@, ;  @@
"       :@##+,:@@@;             @@,  #@.
"           @` :                  +#@   `
"             _ __  __   _(_)_ __ ___
"            | '_  \\ \ / / | '_ ` _ \
"            | | | | \ V /| | | | | | |
"            |_| |_|  \_/ |_|_| |_| |_|
"
"            __   _(_)_ __ ___  _ __ ___
"            \ \ / / | '_ ` _ \| '__/ __|
"             \ V /| | | | | | | | | (__
"              \_/ |_|_| |_| |_|_|  \___|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect()
execute pathogen#helptags()

colorscheme wal
filetype plugin on
syntax on

set nocompatible
set encoding=utf-8
set showcmd         " command in bottom bar
set number          " line numbers
set wrap            " word wrap for long lines
set ruler           " no idea
set tabstop=8       " length to set tab key
set softtabstop=0   " spaces per tab when editing
set expandtab       " tabs are spaces
set shiftwidth=4    " set tab = 4 spaces
set smarttab        " contextual tab location
set cursorline      " underline current line
set colorcolumn=80 " ruler at line 100
set wildmenu        " visual autocomplete
set showmatch       " highlight matching
set hlsearch        " highlight matching searches
set incsearch       " search as characters are entered
set ignorecase      " case insensitive search
set smartcase       " case sensitive only if searching capital letters
set splitbelow      " split pane to bottom
set splitright      " split pane to right
"set background=dark

" Keymapping for TComment
map <c-_><c-_> :TComment

" Set Escape Insert Mode to TAB key
let g:joy_pure = 1

" Automatically deletes all tralling whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Indent Guides
"set ts=4 sw=4 noet
let g:indent_guides_auto_color = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

" Markdown Viewer
"let g:instant_markdown_autostart = 0
"nmap <C-a> :InstantMarkdownPreview<CR>
let g:markdown_composer_open_browser = 0
nmap <C-a> :ComposerOpen<CR>

" Spell check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" Auto format = signs and variable:
nmap <C-h> :Tabularize /=<CR>
vmap <C-h> :Tabularize /=<CR>
nmap <C-j> :Tabularize /:\zs<CR>
vmap <C-j> :Tabularize /:\zs<CR>

" Format column ruler
highlight ColorColumn ctermbg=darkgray

" Insert date-timestamp and break lines
nmap <C-r> :put =strftime('%c')<CR>
nmap <A-r> :put =strftime('%Y-%m-%d_%B-%d-%Y')<CR>
imap <C-b> <br />

" Calendar config
"let g:calendar_monday           = 1
"let g:calendar_number_of_months = 6
"let g:calendar_weeknm           = 1 " WK01
"let g:calendar_weeknm           = 2 " WKK 1
"let g:calendar_weeknm           = 3 " KW01
"let g:calendar_weeknm           = 4 " WK 1
"let g:calendar_weeknm           = 5 " 1
"let g:calendar_wruler           = 'Mo Tu We Th Fr Sa Su'

" Calendar.vim config [ alternative that syncs with Google Calendar ]
let g:calendar_first_day       = 'monday'
let g:calendar_google_calendar = 1
let g:calendar_google_task     = 1

" VimWiki bindings for my journal
let g:vimwiki_list = [
    \{'path': '~/Documents/jbwiki/journal.wiki'},
    \{'path': '~/Documents/jbwiki/labnotes.wiki'},
 \]
:nmap <Leader>wc <Plug>Vimwiki2HTML<CR>
map <leader>wg :VimwikiDiaryGenerateLinks<CR>

au BufRead,BufNewFile *.wiki set filetype=vimwiki
":autocmd FileType vimwiki map d :VimwikiMakeDiaryNote

function! ToggleCalendar()
     execute ":Calendar"
        if exists("g:calendar_open")
            if g:calendar_open == 1
                execute "q"
                unlet g:calendar_open
            else
                g:calendar_open = 1
            end
        else
            let g:calendar_open = 1
     end
endfunction

:autocmd FileType vimwiki map c :call ToggleCalendar()<CR>
"let g:wimwiki_table_mappings=0

" Split Navigation and Resizing
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-N> :res +5<CR>
nnoremap <C-M> :res -5<CR>
nnoremap <C-,> :res >5<CR>
nnoremap <C-,> :res <5<CR>

" Lightline stylized statusline [ with hex color character ]
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
\ }


" Syntax checking for python and bash [ more to come maybe ]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_python_pylint_exe        = 'python3 -m pylint3'





