"
"                                                                   :`                  
"                                                                  @@.                  
"                                                                  #                    
"                                                                 `@                    
"                                                                 `@                    
"                                                                 `@                    
"                                     :@@                         `@                    
"                                   ##@#@                         #@;                   
"                                 #@#.@#                          @#'                   
"                               '@#`#@;                           #@'                   
"                              @@`@@@                             @#'                   
"                             @@@@+.@.                            @@'                   
"                  `#@#.      ##:   @@        '+++++++++++++++++++@@#++++++.            
"                   @@@#+           `@,      #@@@@@@@@@@@@@@@@@@@@@##@#@@@@@`           
"                  `@@#@@'           @@      @@@@@@@@@@@@@@@@@@@@@@@@@@#@@@@`           
"                   #@@#@@`          `@,    `@@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@,           
"                   :@@@#@@           @@    @@@@#@@@@@@@@@@@@@@@@@@@@@@@@#@@#;          
"                    @@@@#@+           @;    +@@@#@@@@@@        `@@@@@@@@@@@:           
"                    @@@@@@@`          #@ `:+@@@@@#@@@@@@@@@@     @@@@@#@```            
"                    @@@@@@@@#:        .@@@@@@@@@@@@@@@@ `;:@:::;:+@@@@@@+++,           
"                 ,@@@@@@@@@@@@@@;    @@@@@@@@@@@@@@@@@@ .@@@##@@#@@@@@@@,,,`           
"          @@+  ,@@@@@##'::'#@@#@##; :@@@@@@@@@@@@@@@@@@ .# #     :@@@@@@,,,`           
"         `@@@ +@@@@:          ,@+++@` @@@@@@@@@@@@@@@@; .@ @     :@@@@@@'''.           
"          +@@@@@@.  ++ `,;@@@    #@##, #@@@@@    @@@@#@++@ +`````;@@@@@@```            
"          +;@#@+   @@@@@@#@@@#``  .@@#: @@@@@              ;@@@@@@@@@@@@###,           
"           ;@@'   @@@@@@@@@@@+##,,  @@#. @#@@ '@@@@@@+@+  `````` :@@@@@@               
"           `.+  ,@#@@@@@@@@@#@+@@@@  @#@ ,@@@ '@@@@@@#@@ :@@@@@@`:@@#++@@@@:           
"              @#@@@@@@:    ,'@@@@@@` `##@ @@@ '@@@@@@@+@ '@@@@@@`:@:;@ @               
"             '@@@@@#  +@@    `#@@@#'  ;@@,    .########; `+''''' :@`@# @@@@:           
"             #@@@@; @@#.       ,@@@@.  @@@.......................;@ @@ @@@@:           
"             @@@@: @#           ,@@@@  ,@@@@@@@@@@@@@@@@@@@@@##@@@@@`` @@@#:           
"            .#@@# `'          `@`'#@@@. @@@@@@@@#@@@@@@@@@@@@@@@@@@@@@@@@@@:           
"            @@@@       ,++:    ;@ @@@#@ +@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@@:           
"           '@@@'      @@@@@@`   @':@@@@ `@@                        +#@                 
"          .@@@@      @#@@@@#@   ,@ @@@;  #@.                       #@@.                
"          .@@@@     '@#,  `@@#   @ @@@#  @#'                    `@#@@@@@#              
"           @#@@     @@#    '@@   @`@@@@  @@+                   +@@@##@@@#@:            
"           #@@# @   @@'    ,@@   : @@@@  @##                  +@@@@##@@@@@@:           
"           +@@@ @   #@@    #@@     @@@@` ```                 ,@@@@#,  ;@@@@@           
"           ;@@@ @`  ,#@#  +@@'     @@@@'                     @@@@';     @@#@@          
"           ,#@@.#+   @@@@#@@@      @@@@,                    .@@@# '    .:@@@@          
"           @@#@@ @    +#@@@#      #@@@                      #@@#   +@@; `:@@@,         
"           #@@@@`'@     `         @@@#                      @@#@  `@ .@   @@@'         
"            #@@@@ #`          @; @@@@.                      @#@@  .@  @   #@@'         
"             +@@@#          .@@ +@@#@                      `#@@@   @@@#  `@@@:         
"              @@@@@`     +@@@: #@@@@@                       :@@@;@` :,   #@@@          
"               @@@@@'    ';` ;#@#+@@;                        @@@@`    .#:@@@@          
"              `@@#@@#@@+:;+@@#@@@#.+                         +@@@@;    +@@@@,          
"               ;@@@@@@@@@@@@#@+'+  `                          @@@@@@@@@@@@@#           
"                  ,@@#@@@@@@#@+;                               @#@@@@@@@@@#            
"                    `@@@@@@@#@@                                 +@@@@@@@@;             
"                     '@@`   ``                                    ;#@@#:               
"                                                                                         
"                            __   _(_)_ __ ___  _ __ ___
"                            \ \ / / | '_ ` _ \| '__/ __|
"                             \ V /| | | | | | | | | (__
"                              \_/ |_|_| |_| |_|_|  \___|
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
set colorcolumn=100 " ruler at line 100
set wildmenu        " visual autocomplete
set showmatch       " highlight matching 
set hlsearch        " highlight matching searches
set incsearch       " search as characters are entered
set ignorecase      " case insensitive search
set smartcase       " case sensitive only if searching capital letters
"set background=dark

" Keymapping for TComment
map <c-_><c-_> :TComment

" Set Escape Insert Mode to TAB key 
let g:joy_pure = 1 

" Indent Guides
"set ts=4 sw=4 noet
let g:indent_guides_auto_color = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

" Markdown Viewer
let g:instant_markdown_autostart = 0
nmap <C-a> :InstantMarkdownPreview<CR>

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
highlight ColorColumn ctermbg=gray


