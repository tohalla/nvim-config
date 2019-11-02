try
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * hi IndentGuidesOdd  guibg=#2B2B2B
  autocmd VimEnter,Colorscheme * hi IndentGuidesEven guibg=#1B1D1E
catch
endtry

