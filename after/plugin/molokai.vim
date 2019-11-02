try
  autocmd ColorScheme * hi clear SignColumn
  autocmd ColorScheme * hi GitGutterAdd guifg=green
  autocmd ColorScheme * hi GitGutterChange guifg=darkyellow
  autocmd ColorScheme * hi GitGutterDelete guifg=red
  autocmd ColorScheme * hi GitGutterChangeDelete guifg=darkyellow

  set background=dark
  set termguicolors
  set syntax=1
  colorscheme molokai
catch
endtry
