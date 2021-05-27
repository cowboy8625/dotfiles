" ▞▀▖       ▌        ▞▀▖▞▀▖▞▀▖▛▀▘
" ▌  ▞▀▖▌  ▌▛▀▖▞▀▖▌ ▌▚▄▘▙▄  ▗▘▙▄
" ▌ ▖▌ ▌▐▐▐ ▌ ▌▌ ▌▚▄▌▌ ▌▌ ▌▗▘ ▖ ▌
" ▝▀ ▝▀  ▘▘ ▀▀ ▝▀ ▗▄▘▝▀ ▝▀ ▀▀▘▝▀
" Email: cowboy8625@protonmail.com
" Youtube: youtube.com/cowboy8625




if has('win32')
    let g:python3_host_prog = '~/appdata/local/programs/python/python39/python.exe'
    let plugin_path = '~/.vim/plugged'
elseif  has('unix')
    let plugin_path = '~/.local/share/nvim/plugged'
endif

let g:netrw_winsize = 20

set relativenumber
set number
set incsearch
set spell spelllang=en_us
set tabstop=4 shiftwidth=4 expandtab
syntax on
syntax enable
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f= "\<Esc>[38;2;%lu;%lu;&lum"
    let &t_8b= "\<Esc>[48;2;%lu;%lu;&lum"
endif

let g:gruvbox_invert_selection='0'


filetype plugin indent on

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

"autocmd BufWritePre *.py execute ':Black'
"nnoremap <silent> env :exe 'edit '.stdpath('config').'/init.vim'<CR>
nnoremap <silent> gf :Lex <CR>
" tnoremap <silent> <ESC> <C-\><C-N>
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

autocmd FileType makrdown let b:sleuth_automatic=0
autocmd FileType makrdown set conceallevel=0
autocmd FileType markdown normal zR

let g:vim_markdown_frontmatter=1

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/cowboy/.local/lib/github-markdown-css/github-markdown.css'

call plug#begin(plugin_path)
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'cespare/vim-toml'
Plug 'calviken/vim-gdscript3'
Plug 'jremmen/vim-ripgrep'
Plug 'tomtom/tcomment_vim'
Plug 'kannokanno/previm'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang-nursery/rustfmt'
Plug 'kassio/neoterm'
" Plug 'ambv/black'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomtom/tcomment_vim'
" Plug 'glepnir/dashboard-nvim'
call plug#end()

filetype plugin indent on

let g:airline_theme="gruvbox"
colorscheme gruvbox

nmap <F7> gg=G<C-o><C-o>
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" nmap <Up> :echo "To move up use k"<CR>
" imap <Up> <ESC><CR>
" nmap <Down> :echo "To move down use j"<CR>
" imap <Down> <ESC><CR>
" nmap <Left> :echo "To move left use h"<CR>
" imap <Left> <ESC><CR>
" nmap <Right> :echo "To move right use l"<CR>
" imap <Right> <ESC><CR>

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set norelativenumber
  set nonumber
  set scrolloff=999
  Limelight
  CocCommand rust-analyzer.toggleInlayHints
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set number
  set relativenumber
  set scrolloff=5
  Limelight!
  CocCommand rust-analyzer.toggleInlayHints
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


set listchars=tab:>~,nbsp:_,trail:●
set list

" highlight ColorColum ctermbg=magenta
" call matchadd('ColorColum', '\%99v', 100)

function! Osc52Yank()
    let buffer=system('base64 -w0', @0) " -w0 to disable 76 char line wrapping
    let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction

nnoremap <leader>y :call Osc52Yank()<CR>

if has('win32') || has('win64')
    so ~\AppData\Local\nvim\coc.vim
else
    so ~/.config/nvim/coc.vim
endif
