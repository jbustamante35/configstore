"
"                                      `++
":-`                                  .syys.                                  `-:
"-yyyo+:.`                           :yyyyyy:                           `.:+oyyy-
" +yyyyyyyso/-.              .      +yyyyyyyy+      .              .-/osyyyyyyy+
" `syyyyyyyyyyyys+/-`      :s`    ./++++++++++/.    `s:      `-/+syyyyyyyyyyyys`
"  -yyyyyyyyyyyyyyyyyyo+:-+y:    :ys.        .sy:    :y+-:+oyyyyyyyyyyyyyyyyyy-
"     `..-://+oosyyyyyyyyyyy`   +yyyy:      :yyyy+   `yyyyyyyyyyysoo+//:-..`
"                  `..-:/yyy  .syyyyyy+`  `+yyyyyys.  yyy/:-..`
"                 ``..--:yyy.-yyyyyyyyys..syyyyyyyyy:.yyy:--..``
"     -://++oossyyyyyyyyyyyyo-......................-oyyyyyyyyyyyyssoo++//:-
"     `syyyyyyyyyyyyyys+//yyyo.                    .oyyy//osyyyyyyyyyyyyyys`
"      `syyyyyyyys+:.`  `:syyyys/-`     //     `-/syyyys:`  `-:+syyyyyyyys`
"       `syyo/:.      .+yyyysyyyyyyo`  +yy/  `oyyyyyysyyyy+.      .:/oyys`
"        ``        `/syyyyo. +yyyyyy. oyyyyo .yyyyyy+ .oyyyys/`        ``
"               `:oyyyyys-  -yyy/--` +yyyyyy+ `--/yyy-  -syyyyyo:`
"             `+yyyyyys:   .yyys    /yyyyyyyy/    syyy.   :syyyyyy+`
"              `:oyyy/`   `syyy/   .:oyyyyyyo/.   /yyys`   `/yyyo:`
"                 .:`     oyyyy`   `` .syys. ``   .yyyyo     `:.
"                        ./++o+   +yy` /yy/ `yy+   +o++/.
"                                /ys. -yyyy- .sy/
"                        ```````/ys.  .yyyy.  .sy/```````
"                        :syy++++oyo`  :yy:  `oyo++++yys:
"                          -o/   :.     ++     .:   /o-
"                            `          ``          `
"
"                           _ __  __   _(_)_ __ ___
"                          | '_  \\ \ / / | '_ ` _ \
"                          | | | | \ V /| | | | | | |
"                          |_| |_|  \_/ |_|_| |_| |_|
"                                 _
"                          __   _(_)_ __ ___  _ __ ___
"                          \ \ / / | '_ ` _ \| '__/ __|
"                           \ V /| | | | | | | | | (__
"                            \_/ |_|_| |_| |_|_|  \___|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Main configs
" Pathogen: plugin manager
    execute pathogen#infect()
    execute pathogen#helptags()

" General settings
    colorscheme wal
    filetype plugin on
    syntax on

    set nocompatible
    set encoding=utf-8
    set number
    set tabstop=8
    set softtabstop=0
    set expandtab
    set shiftwidth=4
    set smarttab
    set cursorline
    set colorcolumn=80
    set foldlevelstart=20
    set autoread
    set wildmode=longest,list,full
    set wildmenu
    set splitbelow
    set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings and colors
" Set color of ruler at line 100
    highlight ColorColumn ctermbg=darkgray

" Insert date/timestamp and break line
    nnoremap <A-r> :put =strftime('%c')<CR>
    nnoremap <C-A-r> :put =strftime('%y%m%d_%B-%d-%Y')<CR>
    imap <C-b> <br />

" Replace all is aliased to S.
    nnoremap T :%s//g<Left><Left>

" Trigger `autoread` when files changes on disk and send notification after file change
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" C-t for new tab, C-n to close tab
    nnoremap <C-t>      :tabnew<cr>
    nnoremap <C-w>      :tabclose<cr>
    nnoremap <C-tab>    :tabnext<cr>
    nnoremap <C-S-tab>  :tabprev<cr>

" Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" Spell-check set to F6:
    map <F6> :setlocal spell! spelllang=en_us<CR>

" Get line, word and character counts with F3:
    map <F4> :!wc <C-R>%<CR>

" Toggle search highlighting
    nnoremap <F3> :set hlsearch!<CR>

" Split window navigation and resizing
    nmap <silent> <A-Up>    :wincmd k<CR>
    nmap <silent> <A-Down>  :wincmd j<CR>
    nmap <silent> <A-Left>  :wincmd h<CR>
    nmap <silent> <A-Right> :wincmd l<CR>
    nnoremap <C-m> :res +5<CR>
    nnoremap <C-s> :res -5<CR>
    nnoremap <S-,> :res >5<CR>
    nnoremap <S-.> :res <5<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Implementation
" Joy: change escape from Insert Mode to TAB key
    let g:joy_pure = 1

" Ag: ag-based search in vim
    let g:ackprg = 'ag --vimgrep --smart-case'

" Tabularize: align selected lines (or paragraph) by = character
    nmap <C-h> :Tabularize /=<CR>
    vmap <C-h> :Tabularize /=<CR>
    nmap <C-j> :Tabularize /:\zs<CR>
    vmap <C-j> :Tabularize /:\zs<CR>

" Wiki: interpret .md files, etc. as .markdown
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" InstantMarkdown: real-time markdown viewer
"let g:instant_markdown_autostart = 0
"nmap <C-a> :InstantMarkdownPreview<CR>

" MarkdownComposer: markdown viewer for neovim
let g:markdown_composer_open_browser = 0
nmap <C-a> :ComposerOpen<CR>

" VimWiki: vim-based personal wiki with markdown syntax
let g:vimwiki_list = [
    \ {'path': '~/Documents/jbwiki/journal.wiki'},
    \ {'path': '~/Documents/jbwiki/labnotes.wiki'},
    \ ]

au BufRead,BufNewFile *.wiki set filetype=vimwiki
:autocmd FileType vimwiki map di :VimwikiMakeDiaryNote

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

:autocmd FileType vimwiki map <leader>C :call ToggleCalendar()<CR>
let g:vimwiki_dir_link = 'diary'
let g:vimwiki_table_mappings = 0
map <leader>wg :VimwikiDiaryGenerateLinks<CR>
map <leader>wc :Vimwiki2HTML<CR>

" Calendar: sidebar calendar with vimwiki joural entries
"let g:calendar_monday           = 1
"let g:calendar_number_of_months = 6
"let g:calendar_weeknm           = 1 " WK01
"let g:calendar_weeknm           = 2 " WK 1
"let g:calendar_weeknm           = 3 " KW01
"let g:calendar_weeknm           = 4 " KW 1
"let g:calendar_weeknm           = 5 " 1

" Calendar: alternative calendar that syncs with Google
"let g:calendar_frame           = 'default'
let g:calendar_first_day       = 'monday'
let g:calendar_clock_12hour    = 0
let g:calendar_google_calendar = 1
let g:calendar_google_task     = 1


" Lightline: Setup lightline status bar
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'one',
    \ 'active': {
    \   'left': [ ['mode', 'paste' ],
    \             ['readonly', 'filename', 'modified', 'charvaluehex' ] ]
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
\ }


" Pandoc: LaTeX compiler and viewer [TODO]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" UNCATEGORIZED [ from Luke Smith voidrice ]

" Compile document
    map <leader>c :!compiler <c-r>%<CR>

" Make calcurse notes markdown compatible:
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Readmes autowrap text:
    autocmd BufRead,BufNewFile *.md,*.tex set tw=79

" Copy selected text to system clipboard (requires gvim installed):
    "vnoremap <C-c> "*Y :let @+=@*<CR>
    map <C-p> "+P

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


