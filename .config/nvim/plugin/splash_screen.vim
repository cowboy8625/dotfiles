" Put description here!!!
" Last Change:  2020 Jan 31
" Maintainer:   Rafał Camlet <raf.camlet@gmail.com>
" License:      GNU General Public License v3.0

if exists('g:loaded_splash_screen') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

hi def link SplashScreenHeader      Number
hi def link SplashScreenSubHeader   Identifier
" hi WhidCursorLine ctermbg=238 cterm=none

command! SplashScreen lua require'splash_screen'.splash_screen()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_splash_screen = 1
