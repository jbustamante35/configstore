" vimrc config for JDev
"
execute pathogen#infect()
execute pathogen#helptags()

colorscheme desert
filetype plugin on
syntax on

set nocompatible
set encoding=utf-8
set showcmd        " command in bottom bar
set number         " line numbers 
set wrap           " word wrap for long lines
set ruler          " no idea 
"set tabpagemax=20 " Max number of tabs
"set showtabline=1 " show tab number
set tabstop=8      " visual spaces per tab
set softtabstop=0  " spaces per tab when editing
set expandtab      " tabs are spaces
set shiftwidth=4   " set tab = 4 spaces
set smarttab       " contextual tab location
set cursorline	   " underline current line
set colorcolumn=80 " colored bar at column 80
set wildmenu	   " visual autocomplete
set showmatch	   " highlight matching 
set hlsearch 	   " highlight matching searches
set incsearch 	   " search as characters are entered
set ignorecase     " case insensitive search
set smartcase      " case sensitive only if searching capital letters
"set background=dark

" Set color of column ruler
highlight ColorColumn ctermbg=darkgray
     
" Auto reload vim on save

" Set up vim-joy to set Escape from Insert Mode from <Esc> to <Tab>
let g:joy_pure = 1
"imap <tab> <esc>
"imap <S-tab> <C-V><Tab>

" Tab navigation
nmap ,t <Esc>:tabnew<CR>
nmap ,w <Esc>:tabclose<CR>
nmap ,. :tabnext<CR>
nmap ,, :tabprev<CR>

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

