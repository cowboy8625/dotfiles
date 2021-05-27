setl relativenumber
setl number
au BufNewFile,BufRead *.md set filetype=mkd
au BufNewFile,BufRead *.markdown set filetype=mkd
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8

highlight ColorColum ctermbg=magenta
call matchadd('ColorColum', '\%99v', 100)

highlight ColorColum ctermbg=magenta
call matchadd('ColorColum', '\%99v', 80)

