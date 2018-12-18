execute pathogen#infect()
execute pathogen#helptags()

filetype plugin on
colorscheme ron
syntax on

set nocompatible
set encoding=utf-8
set showcmd
set number
set wrap
set ruler
set tabstop=8
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab
set cursorline
set colorcolumn=80
set updatetime=100
set autoread
set hlsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set wildmenu
set showmatch

"""""""""""""""""""""""""""" Custom Settings """""""""""""""""""""""""""""""""

" Column ruler color
highlight ColorColumn ctermbg=darkgray
 
" Toggle Search Highlighting
nnoremap <Leader>3 :set hlsearch!<CR>

" Toggle Spellcheck
map <Leader>6 :setlocal spell! spelllang=en_us<CR>

" Automatically remove trailing whitespace from file
noremap <Leader>w :%s/\s*$//g<CR>

" Set timestamps and break lines
nmap <Leader>r  :put =strftime('%c')<CR>
nmap <Leader>R :put =strftime('%Y-%m-%d_%B-%d-%Y')<CR>
nmap <Leader>t :put =strftime('%m.%d.%Y')<CR>
imap <C-b>     <br />

" Tab mangement and navigation
nmap ,t :tabnew<CR>
nmap ,w :tabclose<CR>
nmap ,, :tabnext<CR>
nmap ,. :tabprevious<CR>

" Split management
nmap <Leader>v :vne<CR>
nmap <Leader>h :new<CR>
nmap <Leader>w :wq<CR>
nmap <Leader>q :q!<CR>

" Split navigation and resizing
nnoremap <silent> <A-Down>  <C-W><C-J>
nnoremap <silent> <A-Up>    <C-W><C-K>
nnoremap <silent> <A-Right> <C-W><C-L>
nnoremap <silent> <A-Left>  <C-W><C-H>
nnoremap <C-N>     :res -5<CR>
nnoremap <C-M>     :res +5<CR>
nnoremap <C-.>     :res >5<CR>
nnoremap <C-,>     :res <5<CR>

""""""""""""""""""""""""""""""""" Plugins """"""""""""""""""""""""""""""""""""

" Joy: Switch Escape from Insert Mode from <Esc> to <Tab>
let g:joy_pure = 1

" Wiki: vim-based pesonal wiki
let g:vimwiki_list = [
    \{'path': '~/Documents/jbwiki/journal.wiki'},
    \{'path': '~/Documents/jbwiki/labnotes.wiki'},
\]
let g:vimwiki_dir_link = 'index'

nmap <Leader>wc :Vimwiki2HTML<CR>
nmap <Leader>wg :VimwikiDiaryGenerateLinks<CR>
nmap <Leader>wa :VimwikiAll2HTML<CR>

au BufRead,BufNewFile *.wiki set filetype=vimwiki

" LightLine: statusline colorscheme
set laststatus=2
let g:lightline = { 'colorscheme' : 'PaperColor' }

" GitGutter: Visualize changes tracked by git
let g:gitgutter_max_signs = 56
let g:gitgutter_map_keys  = 0

" NERDtree: File system management for vim
map <C-n> :NERDTreeToggle<CR>

