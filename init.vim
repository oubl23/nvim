let mapleader = ' '

let s:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.s:curdir

for fpath in split(globpath(expand(s:curdir.'/conf'), '*.vim'), '\n')
  exe 'source' fpath
endfor

set termguicolors
colorscheme one
"set background=dark
"let g:space_vim_transp_bg = 1
"colorscheme space_vim_theme
"colorscheme space-vim-dark

set mouse=a
set nocompatible
set hidden
set encoding=UTF-8
set cursorcolumn
set cursorline
set maxmempattern=5000
set lazyredraw
set autoread
set hlsearch
set showmode
set tabstop=4
set shiftwidth=4
set noexpandtab

map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map R :source $MYVIMRC<CR>

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

