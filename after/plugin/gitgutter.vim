try
  nnoremap <leader>za :GitGutterFold<cr>
  nmap ]c <Plug>(GitGutterNextHunk)
  nmap [c <Plug>(GitGutterPrevHunk)

  autocmd ColorScheme * hi GitGutterAdd guifg=green
  autocmd ColorScheme * hi GitGutterChange guifg=darkyellow
  autocmd ColorScheme * hi GitGutterDelete guifg=red
  autocmd ColorScheme * hi GitGutterChangeDelete guifg=darkyellow
catch
endtry
