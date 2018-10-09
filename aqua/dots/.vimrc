execute pathogen#infect()

colorscheme pablo
syntax on
filetype plugin indent on

set cursorline
set nocompatible
set number
set tabstop=4
set softtabstop=4
set expandtab
set updatetime=100

" Switch Escape from Insert Mode from <Esc> to <Tab>
let g:joy_pure = 1

" Automatically remove trailing whitespace from file
noremap <Leader>w :%s/\s*$//g<CR>
