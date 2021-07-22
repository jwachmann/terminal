" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set showcmd
set number		" show line numbers on left side of page
set relativenumber	" combined with above, makes line numbers relative to cursor
set shortmess-=S	" show search result count
set wildmenu		" tab suggestions on vim menu commands
set incsearch		" adjust highlight as you type in a search
filetype plugin indent on	" filetype-specific indentation
set autoindent		" automatic indenting

" fonts
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" colors and theme
syntax on
set termguicolors
set background=dark
colorscheme gruvbox

" fix search highlighting in gruvbox theme
nnoremap <silent> <Leader><Space> :call gruvbox#hls_toggle()<CR>
inoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>a
vnoremap <silent> <Leader><Space> <ESC>:call gruvbox#hls_toggle()<CR>gv
nnoremap <silent> <CR> :call gruvbox#hls_hide()<CR><CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" set cursor
" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[5 q"    " insert mode
let &t_SR = "\e[1 q"    " replace mode
let &t_EI = "\e[4 q"    " command mode

" reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[4 q"
augroup END

" restore cursor to iterm2 setting on exit
:autocmd VimLeave * call system('printf "\e[3 q" > $TTY')

" highlight line when in insert mode
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" Fix garbage characters in bottom screen buffer area on initial open
:autocmd VimEnter * redraw!
