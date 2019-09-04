set termguicolors
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
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileformat=unix
set fileformats=unix,dos
set autochdir
"autocmd TermOpen term://* startinsert
set backspace=indent,eol,start
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
