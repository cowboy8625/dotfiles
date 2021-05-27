" Python Repr is a file type ipython plugin
" Last Change:  2021 May 19
" Maintainer:   cowboy8625 <cowboy8625@protonmail.com>
" License:      GNU General Public License v3.0

if exists('g:loaded_python_repr') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

command! PythonReprLua lua require'python_repr'.python_repr()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_python_repr = 1
