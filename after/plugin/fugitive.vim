  try
  nnoremap <silent> <leader>gs :Gstatus<cr>
  nnoremap <silent> <leader>gc :Gcommit<cr>
  nnoremap <silent> <leader>gm :Git mergetool<cr>
  nnoremap <silent> <leader>gM :Gmerge<cr>
  nnoremap <silent> <leader>gp :Gpush<cr>
  nnoremap <silent> <leader><C-p> :Gpull<cr>
  nnoremap <silent> <leader>gl :Gclog<cr>
  nnoremap <silent> <leader>gf :Gfetch<cr>
  nnoremap <silent> <leader>gb :Gblame<cr>
  nnoremap <silent> <leader>gw :Gwrite<cr>
  nnoremap <silent> <leader>g<BS> :Gread<cr>
  nnoremap <silent> <leader>gg :Gdiffsplit!<cr>

  let g:git_messenger_no_default_mappings=0
  nmap <silent> <C-g> <Plug>(git-messenger)

  augroup CloseLoclistWindowGroup
    autocmd!
    autocmd BufReadPost fugitive://* set bufhidden=delete
    autocmd autocmd User fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif
  augroup END
catch
endtry
