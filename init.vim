"if empty(glob('~/.config/nvim/autoload/plug.vim'))
"  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
let mapleader = ' '

let s:curdir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &rtp.=','.s:curdir

for fpath in split(globpath(expand(s:curdir.'/conf'), '*.vim'), '\n')
  exe 'source' fpath
endfor

source ~/.config/nvim/_machine_specific.vim
