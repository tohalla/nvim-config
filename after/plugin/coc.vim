try
  nmap <silent> Ö <Plug>(coc-diagnostic-prev)
  nmap <silent> ö <Plug>(coc-diagnostic-next)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

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

  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:coc_snippet_next = '<tab>'

  inoremap <silent><expr> <c-space> coc#refresh()

  function! s:check_back_space() abort "{{{
  let col=col('.') - 1
  return !col || getline('.')[col - 1]  =~? '\s'
  endfunction"}}}

  augroup Coc
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * :call CocActionAsync('highlight')
  augroup end

  " Show all diagnostics
  nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
  " Show all commands
  nnoremap <silent> <leader>P  :<C-u>CocList commands<cr>

  command! -nargs=0 Format :call CocAction('format')
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

  function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
  endfunction
catch
endtry
