execute pathogen#infect()

colorscheme zellner
syntax on
filetype plugin indent on

set nocompatible
set showcmd	   "command in bottom bar
set number 	   "line numbers 
set wrap	   "word wrap for long lines
set ruler	   "no idea 
set tabpagemax=20 " Max number of tabs
set showtabline=1 " show tab number
set tabstop=4 	   "visual spaces per tab
set softtabstop=4  "spaces per tab when editing
set expandtab 	   "tabs are spaces
set cursorline	   "underline current line
set wildmenu	   "visual autocomplete
set showmatch	   "highlight matching 
set hlsearch 	   "highlight matching searches
set incsearch 	   "search as characters are entered
set ignorecase     " case insensitive search
set smartcase      " case sensitive only if searching capital letters
set background=dark

" Auto reload vim on save

" Set up vim-joy to set Escape from Insert Mode from <Esc> to <Tab>
let g:joy_pure = 1
imap <tab> <esc>
imap <S-tab> <C-V><Tab>

" Tab navigation
nmap ,t <Esc>:tabnew<CR>
nmap ,w <Esc>:tabclose<CR>
nmap ,. :tabnext<CR>
nmap ,, :tabprev<CR>
