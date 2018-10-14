execute pathogen#infect()
execute pathogen#helptags()

colorscheme ron
filetype plugin on
syntax on

set nocompatible
set encoding=utf-8
set showcmd	   " command in bottom bar
set number 	   " line numbers 
set wrap	   " word wrap for long lines
set ruler	   " no idea 
set expandtab 	   " tabs are spaces
set shiftwidth=4   " set tab = 4 spaces
set tabstop=4 	   " visual spaces per tab
set softtabstop=4  " spaces per tab when editing
set cursorline	   " underline current line
set wildmenu	   " visual autocomplete
set showmatch	   " highlight matching 
set hlsearch 	   " highlight matching searches
set incsearch 	   " search as characters are entered
set ignorecase     " case insensitive search
set smartcase      " case sensitive only if searching capital letters
"set background=dark

" Keymapping for TComment
map <c-_><c-_> :TComment

" Set Escape Insert Mode to TAB key 
let g:joy_pure = 1 

" Indent Guides
set ts=4 sw=4 noet
let g:indent_guides_auto_color = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 0

" Markdown Viewer
let g:instant_markdown_autostart = 0
nmap <C-a> :InstantMarkdownPreview<CR>

" Custom remapping
"nmap <c-a> <g><g><s-v><s-g>

" Spell check set to F6
map <F6> :setlocal spell! spelllang=en_us<CR>
