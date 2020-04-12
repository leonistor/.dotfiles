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

" dart
" Plug 'dart-lang/dart-vim-plugin'

" snippets
" Plug 'SirVer/ultisnips'

" elixir
Plug 'elixir-editors/vim-elixir'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" rust doc
Plug 'rhysd/rust-doc.vim'

" LSP outline
" Plug 'liuchengxu/vista.vim'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" show changes in buffer
Plug 'chrisbra/changesPlugin'

" Text object targets
Plug 'wellle/targets.vim'

" Auto expands current split
Plug 'roman/golden-ratio'

" automatic closing
Plug 'raimondi/delimitmate'

" marks
Plug 'kshenoy/vim-signature'

" tags and quotes
Plug 'tpope/vim-surround'

" align
Plug 'junegunn/vim-easy-align'

" trailing spaces and newlines
Plug 'ntpeters/vim-better-whitespace'

" comments
Plug 'scrooloose/nerdcommenter'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" airline
Plug 'vim-airline/vim-airline'

" TODO: workspace
" Plug 'thaerkh/vim-workspace'

" TODO: tmux
" Plug 'jgdavey/tslime.vim'
" Plug 'christoomey/vim-tmux-runner'

" git
Plug 'tpope/vim-fugitive'

" nerdtree
Plug 'scrooloose/nerdtree'

" my cheatsheet
" Plug 'reireias/vim-cheatsheet'

" scroll motion
Plug 'yuttie/comfortable-motion.vim'

" za shit: coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"-vvv- Config

set showcmd " display incomplete commands
set showmode " display current mode
set backspace=indent,eol,start " intuitive backspacing

syntax on
filetype plugin indent on " enable filetype detection
set autoindent

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
" dart
autocmd Filetype dart setlocal ts=2 sw=2 expandtab

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
nmap d§ d$
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
" toggle search highlights
nmap <Leader>h :set hls!<CR>
" NerdTree
nmap <silent> <Leader>o :NERDTreeToggle<Enter>

" navigate buffers
" nnoremap <Leader>/ :ls<CR>:b<Space>
nnoremap <silent> <Leader>/ :bnext<CR>
" insert line after in normal mode, blanked if autocomment on
nmap <Leader><CR> o<Esc>d$k
" zoom pane/window
" see https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40
" zoom +
nnoremap <Leader>z <C-W>_ \| <C-W>\|
" equal size
nnoremap <Leader>Z <C-W>=

"-vvv- Neovim

" python3
let g:python3_host_prog = '/usr/local/bin/python3'


"-vvv- Plugins config

" fzf
" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf.vim
" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'
" fix keys in tmux
let g:fzf_prefer_tmux = 1
nnoremap <silent> <Leader>. :FzfBuffers<CR>
nnoremap <silent> <Leader>? :FzfMaps!<CR>
" :History " v:oldfiles and open buffers
" :History: " Command history
" :History/ " Search history
" :Snippets " Snippets (UltiSnips)
" :Commands " Commands
" :Maps " Normal mode mappings
" :Helptags " Help tags


" markdown
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=2

" whitespace
" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" strip white lines at the end of the file when stripping whitespace
let g:strip_whitelines_at_eof=1
" don't use here
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
" colors
let g:better_whitespace_ctermcolor='LightYellow'
let g:better_whitespace_guicolor='#FFFACD'


" NerdTree
let NERDTreeShowHidden=1  " always show dot files
let NERDTreeQuitOnOpen=1  " quit after open
let NERDTreeIgnore=['\.git$']

" NerdComments
let NERDSpaceDelims=1  " space after/before comment

" airline
let g:airline_powerline_fonts = 1
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

" show doc floating window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use ? to show documentation in preview window
nnoremap <silent> ? :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" outline
nmap <silent> <Leader>l :CocList outline<CR>

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

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" elixir html templates
au BufRead,BufNewFile *.html.eex set filetype=html

"-vvv- vista
" Executive used when opening vista sidebar without specifying it.
" let g:vista_default_executive = 'coc'
" icons
" let g:vista_icon_indent = ["▸ ", ""]


"-vvv- golang

" use https://github.com/fatih/vim-go-tutorial/blob/master/vimrc
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
" let g:go_auto_sameids = 1

" Build and run
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <Leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Jump to next error with Ctrl-] and previous error with Ctrl-[. Close the
" quickfix window with <leader>a
let g:go_list_type = 'quickfix'
autocmd FileType go nnoremap <Leader>] :cnext<CR>
autocmd FileType go nnoremap <Leader>[ :cprevious<CR>
nnoremap <Leader>a :cclose<CR>
" declarations file
autocmd FileType go nnoremap <Leader>d :GoDecls<CR>
" declarations folder
autocmd FileType go nnoremap <Leader>dd :GoDeclsDir<CR>

" rust-doc
let g:rust_doc#downloaded_rust_doc_dir = '~/.rustup/toolchains/stable-x86_64-apple-darwin/share/doc/rust'

"-vvv- Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}

set background=dark
colorscheme onedark
