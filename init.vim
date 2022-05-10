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

nnoremap <silent> <leader>l :Buffers<cr>
nnoremap <silent> <leader>p :Files<cr>
nnoremap <silent> <leader>t :BTags<cr>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <silent>  :Ag<cr>

nnoremap <silent> <C-n> :NvimTreeFindFile<CR>

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
Plug 'ggandor/lightspeed.nvim'
Plug 'tpope/vim-repeat'
Plug 'mbbill/undotree'

Plug 'wellle/targets.vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'

" UI
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'
Plug 'akinsho/bufferline.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'tversteeg/registers.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'folke/todo-comments.nvim'
Plug 'bennypowers/nvim-regexplainer'

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
Plug 'sainnhe/gruvbox-material'

" Language support
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sheerun/vim-polyglot'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fisadev/vim-isort'
Plug 'mattn/emmet-vim'
Plug 'cespare/vim-toml'
Plug 'robertbasic/vim-hugo-helper'
Plug 'neovim/nvim-lspconfig'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'

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
  autocmd FileType markdown setlocal textwidth=120
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

set termguicolors

let g:Illuminate_delay = 300

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_ui_contrast = 'high'
let g:gruvbox_material_statusline_style = 'mix'
let g:gruvbox_material_current_word = 'bold'

function! s:gruvbox_material_custom() abort
  highlight! IndentGuidesOdd  guibg=#2B2B2B guifg=#999999
  highlight! IndentGuidesEven guibg=#1B1D1E guifg=#999999
  highlight! Pmenu guifg=#EBDBB2 guibg=#000000
  highlight! Visual guibg=#665544
  highlight! LightspeedPendingOpArea guibg=#665544
  highlight! NormalFloat guifg=#EBDBB2 guibg=#000000
  highlight! VirtualTextError guifg=#F2594B
  highlight! VirtualTextWarning guifg=#E9B143
  highlight! VirtualTextHint guifg=gray
  highlight! ErrorFloat guibg=#000000
  highlight! InfoFloat guibg=#000000
  highlight! HintFloat guibg=#000000
  highlight! WarningFloat guibg=#000000
  highlight! HighlightedyankRegion gui=reverse
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

colorscheme gruvbox-material
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_default_mapping=0

let g:nvim_tree_show_icons = {
  \ 'git': 0,
  \ 'folders': 1,
  \ 'folder_arrows': 1,
  \ }

let g:coq_settings = {
  \'auto_start': 'shut-up',
  \'clients': { 'lsp': { 'weight_adjust': 0.5, 'resolve_timeout': 0.3, }, 'tmux': { 'enabled': v:false } },
  \'display': {'pum': { 'fast_close': v:false, }, },
  \}

let g:vim_svelte_plugin_use_typescript = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lua
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
local current_signature = function(width)
  local sig = require("lsp_signature").status_line(width)
  return sig.label .. " " .. sig.hint
end

require'lualine'.setup{
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    show_filename_only = false,
    path = 1,
  },
  sections = {
    lualine_c = {'filename', current_signature},
  },
}

require("bufferline").setup{
  options = {
    tab_size = 4,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    indicator_icon = '|',
    max_name_length = 24,
  },
}
require'nvim-tree'.setup { }
require'colorizer'.setup()
require'regexplainer'.setup { }

require("todo-comments").setup {
  signs = false,
  highlight = {
    keyword = "fg",
    after = ""
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg" },
    warning = { "DiagnosticWarn", "WarningMsg" },
    info = { "DiagnosticInfo", "orange" },
    hint = { "DiagnosticHint", "comment" },
    default = { "Identifier", "aqua" },
  },
}

require("indent_blankline").setup {
  char = "",
  char_highlight_list = { "IndentGuidesOdd", "IndentGuidesEven", },
  space_char_highlight_list = { "IndentGuidesOdd", "IndentGuidesEven", },
  show_trailing_blankline_indent = false,
}

local nvim_lsp = require('lspconfig')
local coq = require "coq"

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
  buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[k', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']k', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>Q', '<cmd>lua vim.lsp.diagnostic.set_qflist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'gopls', 'jsonls', 'golangci_lint_ls', 'sqls', 'cssls', 'tailwindcss', 'svelte' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }))
end
nvim_lsp.eslint.setup(coq.lsp_ensure_capabilities({
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte" },
  flags = {
    debounce_text_changes = 150,
  }
}))

EOF
