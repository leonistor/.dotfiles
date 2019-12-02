" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" color themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" language packs
Plug 'sheerun/vim-polyglot'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" automatic closing
Plug 'raimondi/delimitmate'

" lightline
Plug 'itchyny/lightline.vim'

" nerdtree
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

