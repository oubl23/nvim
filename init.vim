call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'vue': ['/usr/local/bin/vls'],
    \ 'go': ['/home/dabao/go/bin/gopls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"Plug 'Shougo/echodoc.vim'

"set cmdheight=2
"let g:echodoc#enable_at_startup = 1
"let g:echodoc#type = 'signature'
set signcolumn=yes

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Ag grep
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Rg grep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bf :Buffers<CR>
Plug 'scrooloose/nerdtree'
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
Plug 'Xuyuanp/nerdtree-git-plugin'
" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

Plug 'flazz/vim-colorschemes'
Plug 'liaoishere/vim-one'        " Fix comment color of 'rakr/vim-one'
let g:one_allow_italics = 1
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'colepeters/spacemacs-theme.vim'
Plug 'fatih/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

set background=dark


Plug 'fatih/vim-go'
Plug 'posva/vim-vue'
"let g:vue_pre_processors = ['pug', 'scss']
"let g:vue_pre_processors = []
let g:vue_pre_processors = 'detect_on_enter'

call plug#end()

let mapleader = ' '
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map R :source $MYVIMRC<CR>
colorscheme one
set mouse=a
set nocompatible
set hidden
set encoding=UTF-8
set termguicolors
" Highlight curcur
set cursorcolumn
set cursorline
" Max pattern match memory
set maxmempattern=5000
set lazyredraw
set autoread
set hlsearch
set showmode


if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

