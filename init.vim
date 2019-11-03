scriptencoding utf-8

let mapleader='å'
let maplocalleader='ä'

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
noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><rigHt>
noremap <M-right> <C-w>>
noremap <M-left> <C-w><
noremap <M-up> <C-w>+
noremap <M-down> <C-w>-
noremap <silent> <leader><Leader> :bd<cr>

noremap <silent> <leader>ö :only<cr>

nnoremap <silent> <C-j> :bn<cr>
nnoremap <silent> <C-k> :bp<cr>

nnoremap <silent> <BS><BS> :tabnew<cr>
nnoremap <silent> <leader><BS> :bd<cr>:tabclose<cr>

inoremap jk <ESC>

inoremap <F5> <Esc><F5>
inoremap <F6> <Esc><F6>

nnoremap Y y$

nnoremap j gj
nnoremap k gk

nnoremap <space> /

nnoremap § :Buffer<cr>
nnoremap <silent> <leader>p :GFiles --cached --others --exclude-standard<cr>
nnoremap <silent> <leader><space> :BTags<cr>
nnoremap <silent> <C-Space> :Ag<cr>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

noremap <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'

Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'
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
Plug 'neoclide/coc-snippets', {'do': 'npm i'}
Plug 'neoclide/coc-tsserver', {'do': 'npm i'}
Plug 'neoclide/coc-prettier', {'do': 'npm i'}
Plug 'neoclide/coc-json', {'do': 'npm i'}
Plug 'neoclide/coc-yaml', {'do': 'npm i'}
Plug 'neoclide/coc-eslint', {'do': 'npm i'}
Plug 'neoclide/coc-tslint', {'do': 'npm i'}
Plug 'neoclide/coc-css', {'do': 'npm i'}
Plug 'neoclide/coc-sources', {'do': 'npm i'}

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
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm i'  }

Plug 'lervag/vimtex'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'python-mode/python-mode', { 'branch': 'develop' }
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

set completeopt+=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%#warningmsg#
set statusline+=%*

filetype plugin indent on

augroup git
  autocmd!
  au FileType gitcommit,gitrebase,vim let g:gutentags_enabled=0
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
set ruler
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
set autoread

set hidden
set backspace=indent,eol,start
set showmatch

"search
set hlsearch
set incsearch
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

