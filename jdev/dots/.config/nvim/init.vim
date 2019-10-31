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
set colorcolumn=80  " ruler at line 100
set wildmenu        " visual autocomplete
set showmatch       " highlight matching
set hlsearch        " highlight matching searches
set incsearch       " search as characters are entered
set ignorecase      " case insensitive search
set smartcase       " case sensitive only if searching capital letters
set splitbelow      " split pane to bottom
set splitright      " split pane to right
set updatetime=100
set background=dark

"""""""""""""""""""""""""" Custom Settings """"""""""""""""""""""""""""""""""""

" Format column ruler
highlight ColorColumn ctermbg=darkgray

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" Spell check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>

" Automatically deletes all tralling whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Tab Management
nnoremap ,t :tabnew<CR>
nnoremap ,w :tabclose<CR>
nnoremap ,, :tabnext<CR>
nnoremap ,. :tabprev<CR>

" Split management
nnoremap <Leader>h  :new<CR>
nnoremap <Leader>dh :sp<CR>
nnoremap <Leader>v  :vne<CR>
nnoremap <Leader>dv :vsplit<CR>
nnoremap <Leader>q  :q!<CR>
nnoremap <Leader>w  :wq<CR>
nnoremap <Leader>s  :w<CR>

" Split Navigation and Resizing
nnoremap <silent> <A-j> <C-W><C-J>
nnoremap <silent> <A-k> <C-W><C-K>
nnoremap <silent> <A-h> <C-W><C-H>
nnoremap <silent> <A-l> <C-W><C-L>
nnoremap <C-N> :res -5<CR>
nnoremap <C-M> :res +5<CR>
nnoremap <C-,> <C-w>5<
nnoremap <C-.> <C-w>5>

" Insert date-timestamp and break lines
map <Leader>r :put =strftime('%c')<CR>
map <Leader>R :put =strftime('%Y-%m-%d_%B-%d-%Y')<CR>
map <Leader>t :put =strftime('%m.%d.%Y')<CR>
imap <C-b> <br />
imap <Leader>i <br />

"""""""""""""""""""""""""""""" Plugins """"""""""""""""""""""""""""""""""""""""
" Joy: Set Escape Insert Mode to TAB key
let g:joy_pure = 1

" MarkdownComposer: Markdown file browser viewer
let g:instant_markdown_autostart     = 0
let g:markdown_composer_open_browser = 0
nmap <Leader>a :ComposerOpen<CR>

" IndentGuides: Customize look of indented spaces
let g:indent_guides_auto_color = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

" TComment: Plugin to shortcut toggling comments
map <c-_> :TComment<CR>

" Tabularize: Auto format = signs and variable:
nmap <C-h> :Tabularize /=<CR>
vmap <C-h> :Tabularize /=<CR>
nmap <C-j> :Tabularize /:\zs<CR>
vmap <C-j> :Tabularize /:\zs<CR>

" Template settings
let g:templates_no_autocmd = 1
let g:templates_directory  = '/home/jbustamante/.vim/bundle/vim-template/templates'
nmap <leader>tmp :Template<CR>

" Calendar: calendar management plugin [ alternative that syncs with Google Calendar ]
let g:calendar_first_day        = 'monday'
let g:calendar_google_calendar  = 1
let g:calendar_google_task      = 1
let g:calendar_event_start_time = 1
let g:calendar_date_month_name  = 1

" VimWiki: wikipedia-based personal journal
let g:vimwiki_list = [
    \{'path': '~/Documents/jbwiki/journal.wiki'},
    \{'path': '~/Documents/jbwiki/labnotes.wiki'},
 \]

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

:autocmd FileType vimwiki map c :call ToggleCalendar()<CR>
"let g:vimwiki_dir_link = 'diary'
let g:vimwiki_dir_link = 'index'
let g:wimwiki_table_mappings = 0
:nmap <Leader>wc :Vimwiki2HTML<CR>
:nmap <leader>wa :VimwikiAll2HTML<CR>
:nmap <leader>wg :VimwikiDiaryGenerateLinks<CR>

" LightLine: stylized statusline [ with hex color character ]
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
\ }

" TmuxLine: Statusline generator for tmux
let g:tmuxline_powerline_separators = 0
let g:Tmuxline                      = lightline

" Syntacstic: Syntax checking for python and bash [ more to come maybe ]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_ycm_show_diagnostics_ui  = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list            = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0
let g:syntastic_python_pylint_exe        = 'python3 -m pylint3'

nmap <Leader>l :SyntasticToggleMode<CR>

" YouCompleteMe: Code-completion engine
let g:ycm_key_list_select_completion = [';']
inoremap <expr> <Tab> pumvisible() ?"\<C-n>" ; "ᐅ"


" GitGutter: Live tracking of git changes
nmap <leader>g :GitGutterToggle<CR>
nmap <leader>G :GitGutterLineHighlightsToggle<CR>

" NERDtree: File system explorer within Vim
nmap <C-Space> :NERDTreeToggle<CR>

" VimLatexLivePreview: Live preview of LaTeX output
let g:livepreview_previewer            = 'zathura'
let g:livepreview_cursorhold_recompile = 0
nmap <C-l> :LLPStartPreview<CR>

" GoYo: Distraction-free editing
let g_goyo_width = 80
nmap <Leader>g :Goyo<CR>

" Ag: Silver Searcher for Vim
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

nmap <C-p> :Ack<space>

" FZF: Fuzzy Finder for Vim
"nmap <C-p> :Files<CR>

" Rainbow: colored parentheses
let g:rainbow_active = 1

" Illuminate: illuminate other uses of word under the cursor
let g:Illuminate_delay      = 500
let g:Illuminate_ftblacklit = ['nerdtree']

" SmoothScroll: more pleasant scrolling
nnoremap <silent> <C-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
nnoremap <silent> <C-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
nnoremap <silent> <C-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
nnoremap <silent> <C-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" SearchPulse: pulsing cursor after search
let g:vim_search_pulse_mode = 'pattern'




