"-vvv- = section separator
" TODO: remember or setup :PlugUpdate

"-vvv- Plugins
call plug#begin('~/.vim/plugged')

" color themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" language packs
Plug 'sheerun/vim-polyglot'

" snippets
Plug 'SirVer/ultisnips'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Text object targets
Plug 'wellle/targets.vim'

" Auto expands current split
Plug 'roman/golden-ratio'

" automatic closing
Plug 'raimondi/delimitmate'

" align
Plug 'junegunn/vim-easy-align'

" trailing spaces and newlines
Plug 'ntpeters/vim-better-whitespace'

" comments
Plug 'scrooloose/nerdcommenter'

" airline
Plug 'vim-airline/vim-airline'

" TODO: workspace
" Plug 'thaerkh/vim-workspace'

" git
Plug 'tpope/vim-fugitive'

" nerdtree
Plug 'scrooloose/nerdtree'

" my cheatsheet
Plug 'reireias/vim-cheatsheet'

" za shit: coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"-vvv- Config

set showcmd " display incomplete commands
set showmode " display current mode
set backspace=indent,eol,start " intuitive backspacing

set hidden " handle multiple buffers better
set wildmenu " enhanced command line completion
set wildmode=list:longest " complete files like a shell

set ignorecase " case insensiyive searching
set smartcase " but case sensitive if expression contains capital letter

set number " show line numbers
set relativenumber " relative numbers
set ruler " show cursor position

set incsearch " highlight matches as typing
set nohlsearch " no highlight matches, use <Leader-h> to highlight

" set wrap " turn on line wrapping
set scrolloff=4 " show 3 lines of context around cursor

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" don't make a backup before overwriting a file
set nobackup
set nowritebackup

" splits
set splitbelow  " open a new vertical split below
set splitright  " open a new horizontal split on the right


"-vvv- Key maps

" space key as leader
let mapleader = "\<Space>"
" upperleft key on magic keyboard
nmap § $
nmap <Leader>j  20j " jump down
nmap <Leader>k -20k " jump up

" Ctrl-S write file
nmap <C-S> :w<CR>
imap <C-S> <esc>:w<CR>
" quick and dirty exit insert mode
imap jk <esc>
imap kj <esc>
" navigate splits
nnoremap <C-h> <C-w>h  " Ctrl-h move to left split
nnoremap <C-l> <C-w>l  " Ctrl-l move to right split
" `q` to close the buffer for help files, just current <buffer>
autocmd Filetype help nnoremap <buffer> q :q<CR>
" no search highlights
nmap <Leader>h :nohls<CR>
" NerdTree
nmap <Leader>o :NERDTree<CR>
" cheatsheet
nmap ? :Cheat<CR>


"-vvv- Neovim

" python3
let g:python3_host_prog = '/usr/local/bin/python3'


"-vvv- Plugins config

" markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

" whitespace
" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" strip white lines at the end of the file when stripping whitespace
let g:strip_whitelines_at_eof=1

" NerdTree
let NERDTreeShowHidden=1  " always show dot files
let NERDTreeQuitOnOpen=1  " quit after open

" airline
let g:airline_theme='onedark'

" my cheatsheet
let g:cheatsheet#cheat_file = '~/.github/my-vim-cheatsheet.md'
let g:cheatsheet#float_window = 1
" you can change float window size.
let g:cheatsheet#float_window_width_ratio = 0.6
let g:cheatsheet#float_window_height_ratio = 0.6


"-vvv- coc.vim

" using: https://octetz.com/posts/vim-as-go-ide

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" golang
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0




"-vvv- Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}
colorscheme onedark
" let g:lightline.colorscheme='onehalfdark'
set background=dark
