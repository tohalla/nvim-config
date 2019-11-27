scriptencoding utf-8

let mapleader=' '
let maplocalleader=' '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap   <space>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <esc> <nop>

" Window mappings
noremap <silent> <leader>bd :bd<cr>
noremap <silent> <leader>bw :w<cr>:bd<cr>

nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [q :cprev<cr>
nnoremap <silent> ]Q :cfirst<cr>
nnoremap <silent> ]Q :clast<cr>
nnoremap <silent> ]a :next<cr>
nnoremap <silent> [a :prev<cr>
nnoremap <silent> ]A :first<cr>
nnoremap <silent> ]A :last<cr>

noremap <silent> <leader>o :only<cr>

nnoremap <silent> <C-j> :bp<cr>
nnoremap <silent> <C-k> :bn<cr>

nnoremap <silent> <BS><BS> :tabnew<cr>
nnoremap <silent> <leader><BS> :bd<cr>:tabclose<cr>

inoremap jk <ESC>

inoremap <F5> <Esc><F5>
inoremap <F6> <Esc><F6>

nnoremap <silent> [t :tprev
nnoremap <silent> ]t :tnext
nnoremap <silent> [T :tfirst
nnoremap <silent> ]T :tlast

nnoremap Y y$

nnoremap j gj
nnoremap k gk

nnoremap § :Buffer<cr>
nnoremap <silent> <leader>p :GFiles --cached --others --exclude-standard<cr>
nnoremap <silent> <leader>t :BTags<cr>
nnoremap <silent>  :Ag<cr>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'

Plug 'tpope/vim-abolish'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'majutsushi/tagbar'

Plug 'SirVer/ultisnips'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tslint-plugin', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}

" Linting/formatting etc
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-grammarous'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Colorschemes
Plug 'tomasr/molokai'

" Language support
Plug 'ekalinin/Dockerfile.vim'

Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm i'  }

Plug 'lervag/vimtex'

Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'python-mode/python-mode', { 'branch': 'develop' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=2
set softtabstop=2

set smartindent

set linebreak
set textwidth=500

set wrap "Wrap lines

set completeopt+=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup Quickfix
  autocmd!
  autocmd FileType qf setlocal norelativenumber
  autocmd FileType qf setlocal number
  autocmd FileType qf set nobuflisted
augroup END

augroup BreakLine
  autocmd!
  autocmd FileType tex setlocal tw=80
  autocmd FileType tex setlocal wrap linebreak nolist
augroup END

" close loclist when buffer is closed
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

augroup CheckTime
  autocmd!
  autocmd CursorHold,CursorHoldI * if buffer_name("%") != "[Command Line]" | checktime | endif
augroup END

let g:pymode_python='python3'

augroup filetype_python
  autocmd!
  autocmd FileType python noremap <buffer> <F5> :w <cr>:exec '!python' shellescape(@%, 1)<cr>
augroup END

augroup git
  autocmd!
  au Colorscheme * :hi Git2Add ctermfg=70 ctermbg=237
augroup END

" create dir if does not exists on save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" jump to previous position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" always show signcolumns
set signcolumn=yes

set conceallevel=0

" don't give |ins-completion-menu| messages.
set shortmess+=c

set updatetime=100

set background=dark

set numberwidth=1
set colorcolumn=80
set noshowmode
set ignorecase
set smartcase
set number
set relativenumber

set nopaste

set nobackup
set nowritebackup
set noswapfile

set hidden
set backspace=indent,eol,start
set showmatch

"search
set hlsearch
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

set scrolloff=1

set history=1000
set undolevels=1000
set title

set noerrorbells
set novisualbell

set list
set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:·,trail:·

let g:latex_viewer='mupdf'
set nofoldenable

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

let g:indent_guides_guide_size=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0

