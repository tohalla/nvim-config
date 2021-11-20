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
noremap <silent> <leader>bd :BD<cr>
noremap <silent> <leader>bw :w<cr>:BD<cr>
noremap <silent> <leader>wq :wq<cr>

nnoremap <silent> <leader>cc :cclose<cr>
nnoremap <silent> <leader>co :copen<cr>

noremap <silent> <leader>o :only<cr>

nnoremap <silent> <C-c> :bp\|bd #<CR>
nnoremap <silent> <C-k> :bn<CR>
noremap <silent> <C-j> :bp<CR>

nnoremap <silent> <BS><BS> :tabnew<cr>
nnoremap <silent> <leader><BS> :bd<cr>:tabclose<cr>

inoremap jk <ESC>

inoremap <F5> <Esc><F5>
inoremap <F6> <Esc><F6>

nnoremap Y y$

nnoremap j gj
nnoremap k gk

nnoremap <silent> <leader>l :Buffer<cr>
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>t :BTags<cr>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent>  :Ag<cr>

" Keep search results at the center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <silent> <leader>y "*y
nnoremap <silent> <leader>Y "*Y

" C-a used for tmux
nnoremap <C-X> <C-a>

" custom plugin mappings
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'godlygeek/tabular'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'

Plug 'wellle/targets.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'

" UI
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'

" Linting/formatting etc
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-grammarous'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Colorschemes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'

" Language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plug 'cespare/vim-toml'
Plug 'robertbasic/vim-hugo-helper'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'heavenshell/vim-jsdoc'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-test/vim-test'
call plug#end()

let g:sql_type_default = 'pgsql'
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

autocmd BufRead,BufNewFile *.hcl set filetype=terraform

augroup Quickfix
  autocmd!
  autocmd FileType qf setlocal norelativenumber
  autocmd FileType qf setlocal number
  autocmd FileType qf set nobuflisted
  au FileType qf call AdjustWindowHeight(1, 10)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction
augroup END

augroup BreakLine
  autocmd!
  autocmd FileType tex setlocal textwidth=100
  autocmd FileType markdown setlocal textwidth=80
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

let g:tcomment_mapleader1 = 'å'
" always show signcolumns
set signcolumn=yes

set conceallevel=0

" don't give |ins-completion-menu| messages.
set shortmess+=c

set updatetime=100

set numberwidth=1
set colorcolumn=+0
set noshowmode
set ignorecase
set smartcase
set wildignorecase
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

set scrolloff=1

set history=1000
set undolevels=1000
set title

set noerrorbells
set novisualbell

set list
set listchars=tab:\ \ ,extends:›,precedes:‹,nbsp:·,trail:·

let g:latex_viewer='mupdf'
set foldmethod=syntax
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
set lazyredraw

let g:highlightedyank_highlight_duration = 200

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo//
endif

let g:tex_flavor = 'latex'

let g:gruvbox_contrast_dark = 'hard'
let g:Illuminate_delay = 300
set termguicolors
colorscheme gruvbox
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'gitmessengerpopup', 'godoc']
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0
hi Pmenu ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#000000
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#2B2B2B guifg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1B1D1E guifg=0

let g:coq_settings = {
  \'auto_start': 'shut-up',
  \'clients': { 'buffers': { 'enabled': v:false, }, 'snippets': { 'enabled': v:false }, 'tmux': { 'enabled': v:false } },
  \'display': {'pum': { 'fast_close': v:false, }, },
  \'match': {'look_ahead': 0, },
  \'weights': { 'recency': 0.6, 'proximity': 0.3, },
  \}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'lualine'.setup{
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
}

local nvim_lsp = require('lspconfig')
local coq = require "coq"
local null_ls = require("null-ls")
null_ls.config {
  autostart = true,
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.golines,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.terraform_fmt,

    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.diagnostics.yamllint,

    null_ls.builtins.code_actions.eslint_d,
  }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  require 'illuminate'.on_attach(client)

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']k', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>Q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 1000)<CR>', opts)

end

-- Add additional capabilities supported by nvim-cmp

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls', 'null-ls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
  }))
end

EOF
