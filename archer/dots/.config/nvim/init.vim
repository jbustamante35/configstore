"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"      "      "      "      "      "      "      "      "      "      "       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        _
"                           _ __  __   _(_)_ __ ___
"                          | '_  \\ \ / / | '_ ` _ \
"                          | | | | \ V /| | | | | | |
"                          |_| |_|  \_/ |_|_| |_| |_|
"
"                          __   _(_)_ __ ___  _ __ ___
"                          \ \ / / | '_ ` _ \| '__/ __|
"                           \ V /| | | | | | | | | (__
"                            \_/ |_|_| |_| |_|_|  \___|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
    set ignorecase
    set smartcase
    set splitbelow
    set splitright
    set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Settings and colors
" Set color of ruler at line 80
    highlight ColorColumn ctermbg=darkgray

" Insert date/timestamp and break line
    nnoremap <Leader>r  :put =strftime('%c')<CR>
    nnoremap <Leader>R  :put =strftime('%Y-%m-%d_%B-%d-%Y')<CR>
    nnoremap <Leader>t  :put =strftime('%m.%d.%Y')<CR>
    imap <C-b> <br />

" Replace all
    nnoremap T :%s//g<Left><Left>

" File management
    nmap <Leader>q :q!<CR>
    nmap <Leader>w :wq<CR>
    nmap <Leader>s :w<CR>

" Init `autoread` when files changes on disk; send notification after change
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Automatically deletes all tralling whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e

" Spell-check set to F6:
    map <F6> :setlocal spell! spelllang=en_us<CR>

" Get line, word and character counts
    map <F4> :!wc <C-R>%<CR>

" Toggle search highlighting
    nnoremap <F3> :set hlsearch!<CR>

" Tab navigation
    nnoremap ,t :tabnew<cr>
    nnoremap ,w :tabclose<cr>
    nnoremap ,, :tabnext<cr>
    nnoremap ,. :tabprev<cr>

" Split window creation and destruction
    nmap <Leader>v :vne<CR>
    nmap <Leader>h :new<CR>
    nmap <A-v>     :vsp<CR>
    nmap <A-h>     :sp<CR>

" Split window navigation and resizing
    nmap <silent> <A-k> :wincmd k<CR>
    nmap <silent> <A-j> :wincmd j<CR>
    nmap <silent> <A-h> :wincmd h<CR>
    nmap <silent> <A-l> :wincmd l<CR>
    nnoremap <C-m> :res +5<CR>
    nnoremap <C-s> :res -5<CR>
    nnoremap <C-,> CTRL-W_<<CR>
    nnoremap <C-.> CTRL-W_><CR>

" Copy-Paste from clipboard [ from Luke Smith; check out video ]
    "vnoremap <C-c> "+Y :let @+=@*<CR>
    "map      <C-p> "+P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin Implementation
" Joy: change escape from Insert Mode to TAB key
    let g:joy_pure = 1

" Ag: ag-based search in vim
    let g:ackprg       = 'ag --vimgrep --smart-case'
    let g:ackhighlight = 1

" Tabularize: align selected lines (or paragraph) by = character
    nmap <C-h> :Tabularize /=<CR>
    vmap <C-h> :Tabularize /=<CR>
    nmap <C-j> :Tabularize /:\zs<CR>
    vmap <C-j> :Tabularize /:\zs<CR>

" InstantMarkdown: real-time markdown viewer
let g:instant_markdown_autostart = 0

" MarkdownComposer: markdown viewer for neovim
let g:markdown_composer_browser = 'qutebrowser'
let g:markdown_composer_open_browser = 0
nmap <C-a> :ComposerOpen<CR>

" Wiki: interpret .md files, etc. as .markdown
    let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" VimWiki: vim-based personal wiki with markdown syntax
let g:vimwiki_list = [
    \ {'path': '~/Documents/jbwiki/journal.wiki'},
    \ {'path': '~/Documents/jbwiki/labnotes.wiki'},
    \ ]

au BufRead,BufNewFile *.wiki set filetype=vimwiki

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
let g:vimwiki_dir_link = 'index'
let g:vimwiki_table_mappings = 0
map <leader>wc :Vimwiki2HTML<CR>
map <leader>wa :VimwikiAll2HTML<CR>
map <leader>wg :VimwikiDiaryGenerateLinks<CR>

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

" Template: Automated template plugin
let g:templates_directory = '~/.vim/bundle/vim-templates/templates'
let g:templates_no_autocmd = 1
nmap <leader>tmp :TemplateHere<CR>

" YouCompleteMe: code-completion engine
let g:ycm_key_list_select_completion = [';']
inoremap <expr> <Tab> pumvisible() ?"\<C-n>" : "ᐅ"

" GitGutter: vim plugin for in-file git diff
let g:gitgutter_max_signs = 56
let g:gitgutter_map_keys  = 0

" NERDtree: File system management for vim
map <C-Space> :NERDTreeToggle<CR>

" GoYo: Distraction free mode
nmap <C-g> :Goyo 80<CR>
nmap <Leader>g :Goyo<CR>

" LimeLight: Focus on paragraph
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span = 0
nmap <Leader>ll :Limelight<CR>

" VimLaTeXLivePreview: Live previewing of LaTeX PDF
"let g:livepreview_previewer            = 'okular'
let g:livepreview_previewer            = 'zathura'
let g:livepreview_cursorhold_recompile = 0
nmap <C-l> :LLPStartPreview<CR>

" SmoothScroll: more pleasant scrollinng
noremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"noremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Pandoc: LaTeX compiler and viewer [TODO]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" UNCATEGORIZED [ from Luke Smith voidrice ]

" Compile document
    map <leader>c :!compiler <c-r>%<CR>

" Make calcurse notes markdown compatible:
    autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Readmes autowrap text:
    autocmd BufRead,BufNewFile *.md,*.tex set tw=80

" Copy selected text to system clipboard (requires gvim installed):
    "vnoremap <C-c> "*Y :let @+=@*<CR>
    map <C-p> "+P

" Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


