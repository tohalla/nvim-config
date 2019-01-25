let mapleader='å'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>

" local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>

inoremap ⁱ <esc>i
inoremap ² <esc>gja
inoremap ³ <esc>gka
inoremap ⁴ <esc>la

" Window mappings
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>p <C-w><C-w>
noremap <leader><leader> <C-w>q
noremap <leader>` :split<cr>
noremap <leader>~ :vsplit<cr>

noremap <leader>o :only<cr>

nnoremap <leader>l :bn<cr>
nnoremap <leader>k :bp<cr>
noremap <esc> :bd<cr>
inoremap jk <Esc>

inoremap <F5> <Esc><F5>
inoremap <F6> <Esc><F6>

nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <space> /
nnoremap ä $
nnoremap ö ^

nnoremap <leader>t :TagbarToggle<CR>

noremap <C-n> :NERDTreeToggle<cr>

nnoremap <leader>0 :ALENext<cr>
nnoremap <leader>9 :ALEPrevious<cr>
noremap <C-f> :ALEFix<cr>

noremap § :Buffer<cr>
noremap <leader>§ :Files<cr>
noremap <leader><space> :BTags<cr>
noremap ° :Ag<cr>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <leader>d "_d

noremap <silent> <leader><cr> :noh<cr>

let g:UltiSnipsExpandTrigger='<leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<leader>w'
let g:UltiSnipsJumpBackwardTrigger='<leader>q'
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'

" UI
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/echodoc.vim'
Plug 'majutsushi/tagbar'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" Linting/formatting etc
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-grammarous'
Plug 'w0rp/ale'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'reedes/vim-colors-pencil'

Plug 'junegunn/goyo.vim'

" Language support
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'rust-lang/rust.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'lervag/vimtex'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set softtabstop=2

set autoindent
set smartindent

set linebreak
set textwidth=500

set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => linters, ui
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline={
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'fugitive#head'
\ },
\ }

let g:ale_linters={
\ 'python': ['flake8', 'pylint'] ,
\ 'go': ['golint', 'gofmt']
\ }
let g:ale_fixers={
\ 'python': ['autopep8', 'yapf'],
\ 'go': ['gofmt', 'goimports']
\ }

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

let g:ale_lint_on_text_changed='never'
let g:ale_list_window_size=5
let g:ale_enabled=1
let g:ale_sign_error='>'
let g:ale_sign_warning='.'
let g:ale_set_highlights=0

" vim-go
let g:go_fmt_command = 'goimports'
let g:go_autodetect_gopath = 1
let g:go_list_type = 'quickfix'
let g:go_term_mode = 'new'

let g:pymode_python='python3'

let g:rust_clip_command = 'pbcopy'

augroup general
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python map <buffer> <F5> :w <cr>:exec '!python' shellescape(@%, 1)<cr>
augroup END

augroup filetype_go
  autocmd!
  autocmd FileType go map <buffer> <F5> :w<cr><Plug>(go-run)
  autocmd FileType go map <buffer> <F6> :w<cr><Plug>(go-test)
  nnoremap <leader>. :vs<cr>:exe "GoDef"<cr>
augroup END

function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme gruvbox
endfunction

augroup goyo
  autocmd!
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

augroup goyo
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete<Paste>
augroup END

set runtimepath+=~/.config/nvim/plugged/deoplete.nvim
let g:deoplete#enable_at_startup=1
let g:deoplete#max_list=15

let g:indent_guides_color_change_percent=1
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup=1

let g:indent_guides_auto_colors = 0
augroup guides
  autocmd!
  au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
  au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
augroup END

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

filetype plugin indent on
syntax enable

augroup git
  autocmd!
  au FileType gitcommit,gitrebase let g:gutentags_enabled=0
augroup END

set background=dark

set numberwidth=1
set ruler
set colorcolumn=80
set noshowmode "lightline
set ignorecase
set number
set relativenumber

set nobackup
set nowritebackup
set noswapfile
set autoread

set hidden
set backspace=indent,eol,start
set showmatch
set hlsearch
set incsearch
set scrolloff=1

set history=1000
set undolevels=1000
set title

set noerrorbells
set novisualbell

set list
set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:·,trail:·

let g:vim_markdown_math=1
let g:latex_viewer='mupdf'

set diffopt+=vertical

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tabs, windows etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitright
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif
