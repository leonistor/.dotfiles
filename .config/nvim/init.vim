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
" Plug 'SirVer/ultisnips'

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
" move forward one full screen
nnoremap <Leader><Space> <C-F>

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

" tile vertically
nmap <Leader>vs :vert ba<CR>
" no search highlights
nmap <Leader>h :nohls<CR>
" NerdTree
nmap <Leader>o :NERDTreeToggle<Enter>

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
" don't use here
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']

" NerdTree
let NERDTreeShowHidden=1  " always show dot files
let NERDTreeQuitOnOpen=1  " quit after open
let NERDTreeIgnore=['\.git$']

" NerdComments
let NERDSpaceDelims=1  " space after/before comment

" airline
let g:airline_theme='onedark'

" my cheatsheet
let g:cheatsheet#cheat_file = '~/.github/my-vim-cheatsheet.md'
let g:cheatsheet#float_window = 1
" you can change float window size.
let g:cheatsheet#float_window_width_ratio = 0.6
let g:cheatsheet#float_window_height_ratio = 0.6


"-vvv- coc.vim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
set signcolumn=yes


" completion keys
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


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

" coc-snippets

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" golang

" use https://hackernoon.com/my-neovim-setup-for-go-7f7b6e805876

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" Run goimports when running gofmt
let g:go_fmt_command = "goimports"
" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
" Show type information
let g:go_auto_type_info = 1
" Highlight variable uses
let g:go_auto_sameids = 1

"-vvv- Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}
colorscheme onedark
" let g:lightline.colorscheme='onehalfdark'
set background=dark
