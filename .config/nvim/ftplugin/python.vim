setl relativenumber
setl number
"setlocal iskeyword+=matchstr("self"
setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
"set foldmethod=syntax
set filetype=python

au BufNewFile,BufRead *.py

nnoremap <silent> ;; :!python3 %<CR>
nnoremap ;p :PythonReprLua<CR>

function IsComment()
  let char=matchstr(getline('.'), '\%' . col('.') . 'c.')
  if char != "#"
    return 1
  else
    return 0
  endif
endfunction

function CommentUnComment()
  normal!mm^
  if IsComment()
    normal!i# 
    normal!`mll
  else
    normal!xx`m
  endif
endfunction

function RunInPython()
        write
        :exec("! clear; python3 % ")
endfunction
