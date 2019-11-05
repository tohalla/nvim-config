  try
  nnoremap <silent> <leader>gs :Gstatus<cr>
  nnoremap <silent> <leader>gc :Gcommit<cr>
  nnoremap <silent> <leader>gr :Grebase<cr>
  nnoremap <silent> <leader>gm :Gmerge<cr>
  nnoremap <silent> <leader>gp :Gpush<cr>
  nnoremap <silent> <leader><C-p> :Gpull<cr>
  nnoremap <silent> <leader>gl :Gclog<cr>
  nnoremap <silent> <leader>gf :Gfetch<cr>
  nnoremap <silent> <leader>gb :Gblame<cr>
  nnoremap <silent> <leader>gw :Gwrite<cr>
  nnoremap <silent> <leader>g<BS> :Gread<cr>
  nnoremap <silent> <leader>gg :Gdiffsplit<cr>

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
