execute pathogen#infect()
execute pathogen#helptags()

colorscheme ron
filetype plugin on
syntax on

set nocompatible
set encoding=utf-8
set showcmd
set number
set wrap
set ruler
set cursorline
set colorcolumn=80
set tabstop=8
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab
set updatetime=100
set autoread
set hlsearch
set ignorecase
set smartcase
set splitbelow
set splitright
set wildmenu
set showmatch
set background=dark

""""""""""""""""""""""""""""""" Custom Settings """"""""""""""""""""""""""""""

" Column ruler color
highlight ColorColumn ctermbg=darkgray

" Tab management and navigation
nmap ,t :tabnew<CR>
nmap ,w :tabclose<CR>
nmap ,, :tabnext<CR>
nmap ,. :tabprevious<CR>

" Split management
nmap <Leader>v :vne<CR>
nmap <Leader>h :new<CR>
nmap <Leader>w :wq<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>s :w<CR>

" Split navigation and resizing
nnoremap <silent> <A-j> <C-W><C-J>
nnoremap <silent> <A-k> <C-W><C-K>
nnoremap <silent> <A-h> <C-W><C-H>
nnoremap <silent> <A-l> <C-W><C-L>
nnoremap <C-m>  :res -5<CR>
nnoremap <C-s>  :res +5<CR>
nnoremap <C-,>  :res >5<CR>
nnoremap <C-.>  :res <5<CR>

" Automatically remove trailing whitespace
noremap <Leader>a :%s/\s*$//g<CR>

" Toggle search highlighting
nnoremap <Leader>3 :set hlsearch!<CR>

" Toggle spellcheck
map <Leader>6 :setlocal spell! spelllang=en_us<CR>

" Set timestamps and break lines
nmap <Leader>r :put =strftime('%c')<CR>
nmap <Leader>R :put =strftime('%Y-%m-%d_%B-%d-%Y')<CR>
nmap <Leader>t :put =strftime('%m.%d.%Y')<CR>
imap <C-b>     <br />

""""""""""""""""""""""""""""""" Plugins """"""""""""""""""""""""""""""""""""""
" Joy: Set exit insert mode to TAB key
let g:joy_pure = 1

" Lightline: Set statusbar colorscheme
set laststatus=2
let g:lightline = { 'colorscheme' : 'one' }

" VimWiki: vim-based personal wiki
let g:vimwiki_lists = [
    \{'path': '~/Documents/jbwiki/journal.wiki'},
    \{'path': '~/Documents/jbwiki/labnotes.wiki'},
\]
let g:vimwiki_dir_link = 'index'
nmap <Leader>wc :Vimwiki2HTML<CR>
nmap <Leader>wg :VimwikiDiaryGenerateLinks<CR>
nmap <Leader>wa :VimwikiAll2HTML<CR>

au BufRead,BufNewFile *.wiki set filetype=vimwiki

" NERDtree: Show filesystem plugin
"autocmd vimenter * NERDTree
map <C-Space> :NERDTreeToggle<CR>

" GitGutter: Track changes of files tracked by git
let g:gitgutter_max_signs = 56
let g:gitgutter_map_keys = 0

" FZF: Set up FuzzyFinder for vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }

" Ack/Ag: SilverSearcher plugin
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" EasyClip: Set up clipboard management plugin
let g:EasyClipAutoFormat = 1
let g:EasyClipYankHistorySize = 10
let g:EasyClipShareYanks = 1
let g:EasyClipUseSubstituteDefaults = 1

" CtrlP: file-finder plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Template: automated template for specific filetypes
let g:templates_no_autocmd = 0
nmap <Leader>tmp :Template<CR>




