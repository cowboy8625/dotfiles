setl relativenumber
setl number
"set foldmethod=syntax
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8

nnoremap <silent> ;; :!cargo run --release<CR>
nnoremap <silent> ;t :!cargo test<CR>
nnoremap <silent> ;c :!cargo check<CR>
nnoremap <silent> ;d :!cargo doc<CR>

highlight ColorColum ctermbg=magenta
call matchadd('ColorColum', '\%99v', 100)
