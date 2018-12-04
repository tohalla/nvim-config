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

inoremap ⁱ <esc>i
inoremap ² <esc>gja
inoremap ³ <esc>gka
inoremap ⁴ <esc>la

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>o :only<cr>

inoremap <esc> <nop>
inoremap jk <Esc>

inoremap <F5> <Esc><F5>

nnoremap j gj
nnoremap k gk
nnoremap <space> /
nnoremap ä $
nnoremap ö ^

noremap <C-n> :NERDTreeToggle<CR>
noremap <C-f> :ALEFix<CR>
noremap § :Buffer<CR>
noremap <leader>§ :GitFiles<CR>
noremap ¶ :Snippets<CR>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <leader>d "_d

noremap <silent> <leader><cr> :noh<cr>

let g:UltiSnipsExpandTrigger='<c-v>'
let g:UltiSnipsJumpForwardTrigger='<c-b>'
let g:UltiSnipsJumpBackwardTrigger='<c-z>'
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

Plug 'godlygeek/tabular'

" UI
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/echodoc.vim'

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

" Language support
Plug 'plasticboy/vim-markdown'
Plug 'derekwyatt/vim-scala'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

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
\ }
let g:ale_fixers={
\ 'python': ['autopep8', 'yapf'],
\ }

let g:ale_lint_on_text_changed='never'
let g:ale_list_window_size=5
let g:ale_enabled=1
let g:ale_sign_error='>'
let g:ale_sign_warning='.'
let g:ale_set_highlights=0

let g:pymode_python='python3'

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

augroup general
  autocmd!
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END
augroup filetype_python
  autocmd!
  autocmd FileType python map <buffer> <F5> :w <cr>:exec '!python' shellescape(@%, 1)<cr>
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

filetype plugin indent on
syntax enable

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

let g:vim_markdown_math=1

set diffopt+=vertical

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

