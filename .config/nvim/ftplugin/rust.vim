setl relativenumber
setl number
"set foldmethod=syntax
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8

let g:formatdef_rustfmt = '"rustfmt"'
let g:formatters_rust = ['rustfmt']
au BufWrite * :Autoformat

nnoremap <silent> ;; :!cargo run --release<CR>
nnoremap <silent> ;w :!cargo test --release --workspace<CR>
nnoremap <silent> ;t :!cargo test --release<CR>
nnoremap <silent> ;c :!cargo check --release<CR>
nnoremap <silent> ;d :!cargo doc<CR>
nnoremap <silent> ;e :!cargo run --release --example %:t:r<CR>

highlight ColorColum ctermbg=magenta
call matchadd('ColorColum', '\%99v', 100)


function GetFileName()
    name = call expand("%:t")
    echo name
endfunction

