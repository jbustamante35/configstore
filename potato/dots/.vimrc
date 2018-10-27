execute pathogen#infect()
filetype plugin indent on

colorscheme ron
syntax on
set nocompatible 
set number
set cursorline
set tabstop=4
set softtabstop=4
set expandtab
set updatetime=100
set autoread

" Set exit insert mode to TAB key
:imap <tab> <esc>
let g:joy_pure = 1

" Set lightline colorscheme
set laststatus=2
let g:lightline = { 'colorscheme' : 'one' }

" Set up NERDtree
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR> " mapped to Control+n

" Set up gitgutter to track changes of files tracked by git
let g:gitgutter_max_signs = 56
let g:gitgutter_map_keys = 0

" Set up fzf for vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

" Set up EasyClip
let g:EasyClipAutoFormat = 1
let g:EasyClipYankHistorySize = 10
let g:EasyClipShareYanks = 1
let g:EasyClipUseSubstituteDefaults = 1

" Set up ctrlP 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

" Set up ag for vim
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack 

" Navigation settings
nmap ,t :tabnew<CR>
nmap ,w :tabclose<CR>
nmap ,, :tabnext<CR>
nmap ,. :tabprevious<CR>



