execute pathogen#infect()
filetype plugin indent on

colorscheme ron
syntax on

set nocompatible
set number
set cursorline
set tabstop=8
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab
set updatetime=100
set autoread

" Switch Escape from Insert Mode from <Esc> to <Tab>
let g:joy_pure = 1

" Automatically remove trailing whitespace from file
noremap <Leader>w :%s/\s*$//g<CR>
