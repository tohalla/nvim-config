scriptencoding utf-8

let mapleader='å'
let maplocalleader='ä'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap   <space>
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
noremap <leader><BS> <C-w>q
noremap <leader><Leader> :bd<cr>
noremap <leader>` :split<cr>
noremap <leader>~ :vsplit<cr>

noremap <leader>ö :only<cr>

nnoremap <leader>o :bn<cr>
nnoremap <leader>i :bp<cr>
inoremap jk <ESC>

inoremap <F5> <Esc><F5>
inoremap <F6> <Esc><F6>

nnoremap Y y$
nnoremap j gj
nnoremap k gk
nnoremap <space> /
nnoremap ö %

nnoremap TT :TagbarToggle<CR>

nnoremap <C-n> :NERDTreeToggle<cr>

nnoremap § :Buffer<cr>
nnoremap <leader>§ :Files<cr>
nnoremap <leader><space> :BTags<cr>
nnoremap <C-Space> :Ag<cr>

" GIT
nnoremap <leader>za :GitGutterFold<cr>
nnoremap <leader>c :!Git commit -m ""<left>
nmap ä <Plug>(GitGutterNextHunk)
nmap Ä <Plug>(GitGutterPrevHunk)

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <leader>x "_x

noremap <silent> <leader><cr> :noh<cr>

nnoremap <leader>u :UndotreeToggle<cr>

""coc
nmap <silent> <leader>9 <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>0 <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>R <Plug>(coc-references)

nmap <silent> <leader>d <Plug>(coc-range-select)
xmap <silent> <leader>d <Plug>(coc-range-select)

" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

imap <silent><leader><TAB> <Plug>(coc-snippets-expand)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort "{{{
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
endfunction"}}}

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/echodoc.vim'
Plug 'majutsushi/tagbar'

Plug 'mbbill/undotree'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'

" Linting/formatting etc
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-grammarous'

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
Plug 'fisadev/vim-isort'
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'quramy/tsuquyomi'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ternjs/tern_for_vim'
Plug 'derekwyatt/vim-scala'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'rust-lang/rust.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'lervag/vimtex'
Plug 'OmniSharp/omnisharp-vim'
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
let g:echodoc#enable_at_startup=1

set completeopt-=preview

let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#enabled=1

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" close loclist when buffer is closed
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" emmet
let g:user_emmet_leader_key='ä'

" js
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

" R
let R_r_console_height=10
let R_rconsole_width=0
let R_assign_map = ''
let R_nvimpager='horizontal'

" vim-go
let g:go_fmt_command='goimports'
let g:go_metalinter_autosave=1
let g:go_metalinter_autosave_enabled=['vet', 'golint']
let g:go_list_type='quickfix'
let g:go_term_mode='new'
let g:go_snippet_case_type='camelcase'
let g:go_gocode_unimported_packages=1
let g:go_auto_type_info=1

let g:pymode_python='python3'

let g:rust_clip_command='pbcopy'

augroup filetype_python
  autocmd!
  autocmd FileType python noremap <buffer> <F5> :w <cr>:exec '!python' shellescape(@%, 1)<cr>
augroup END

augroup filetype_go
  autocmd!
  autocmd FileType go noremap <buffer> <F5> :w<cr><Plug>(go-run)
  autocmd FileType go noremap <leader><space> :GoDecls<cr>
  autocmd FileType go noremap <leader>c :GoCoverageToggle<cr>
  autocmd FileType go nnoremap tt :GoTest<cr>
augroup END

let g:tsuquyomi_auto_open = 1
augroup filetype_typescript
  autocmd!
  autocmd FileType typescript noremap <buffer> gd :TsuDefinition<CR>
  autocmd FileType typescript TsuStartServer
augroup END

let g:indent_guides_color_change_percent=1
let g:indent_guides_guide_size=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0

let g:indent_guides_auto_colors=0
augroup guides
  autocmd!
  au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
  au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=235
augroup END

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

filetype plugin indent on
syntax enable

augroup git
  autocmd!
  au FileType gitcommit,gitrebase,vim let g:gutentags_enabled=0
  au Colorscheme * :hi Git2Add ctermfg=70 ctermbg=237
augroup END

au CursorHold,CursorHoldI * checktime

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
set noshowmode "lightline
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

let g:vim_markdown_new_list_item_indent=2
let g:vim_markdown_math=1
let g:vim_markdown_folding_disabled = 1
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
