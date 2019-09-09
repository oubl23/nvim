call plug#begin('~/.vim/plugged')

" LanguageClient ============================================================={{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
silent! au BufEnter * silent! unmap if
"au TextChangedI * GitGutter
" Installing plugins
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-snippets', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vetur']
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Useful commands
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)


"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"let g:lsp_diagnostics_enabled = 0
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"function! s:check_back_space() abort
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction

"inoremap <silent><expr> <TAB>
"\ pumvisible() ? "\<C-n>" :
"\ <SID>check_back_space() ? "\<TAB>" :
"\ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <c-c> <ESC>
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}

" fzf nerdtree ============================================================={{{
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
nnoremap <silent> <C-f> :Ag<CR>
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

" }}}

" color ============================================================{{{
Plug 'liaoishere/vim-one'        " Fix comment color of 'rakr/vim-one'
let g:one_allow_italics = 1
Plug 'mhinz/vim-startify'

let g:startify_lists = [
	  \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
	  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	  \ { 'type': 'commands',  'header': ['   Commands']       },
	  \ ]

" }}}

" Status line =============================================================0={{{

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
set laststatus=2
set noshowmode

" Show readonly
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

" Show git branch
function! LightlineFugitive()
	if exists('*fugitive#head')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

" Git blame message
function! LightlineGitBlame() abort
	let blame = get(b:, 'coc_git_blame', '')
	" return blame
	return winwidth(0) > 120 ? blame : ''
endfunction

" Get current funtion symbol
function! CocCurrentFunction()
	let currentFunctionSymbol = get(b:, 'coc_current_function', '')
	return currentFunctionSymbol !=# '' ? " " .currentFunctionSymbol : ''
endfunction

let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch'],
			\             [ 'readonly', 'relativepath', 'modified' ],
			\             ['cocstatus', 'currentfunction' ] ],
			\   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
			\              [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'fileformat', 'fileencoding', 'filetype' ], ['blame'] ]
			\ },
			\ 'component_function': {
			\   'readonly': 'LightlineReadonly',
			\   'gitbranch': 'LightlineFugitive',
			\   'cocstatus': 'coc#status',
			\   'blame': 'LightlineGitBlame',
			\   'currentfunction': 'CocCurrentFunction',
			\ },
			\ }

" seperator
"let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }

" ALE linter info
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline.component_expand = {
			\   'linter_checking': 'lightline#ale#checking',
			\   'linter_warnings': 'lightline#ale#warnings',
			\   'linter_errors': 'lightline#ale#errors',
			\   'linter_ok': 'lightline#ale#ok',
			\ }
let g:lightline.component_type = {
			\   'linter_checking': 'left',
			\   'linter_warnings': 'warning',
			\   'linter_errors': 'error',
			\   'linter_ok': 'left',
			\ }


" tabline
set showtabline=2  " Show tabline
let g:lightline.tabline = {
			\   'left': [ ['tabs'] ],
			\   'right': [ ['close'] ]
			\ }
let g:lightline.tab_component_function = {
			\   'shortpath': 'ShortPath',
			\}
let g:lightline.tab = {
			\ 'active': [ 'tabnum', 'shortpath', 'modified' ],
			\ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

function! ShortPath(n) abort
	let buflist = tabpagebuflist(a:n)
	let winnr = tabpagewinnr(a:n)
	let filename = expand('#'.buflist[winnr - 1].':t')
	if filename ==# ''
		return '[No Name]'
	endif

	let exclude_files = ['gitcommit', 'defx']
	for ft in exclude_files
		if ft ==# &filetype
			return filename
		endif
	endfor

	" Check if buffer is a terminal
	if &buftype ==# 'terminal'
		return filename
	endif

	let dirsep = has('win32') && ! &shellslash ? '\' : '/'
	let filepath = expand('%:p')
	if empty(filepath)
		return filename
	endif
	let mod = (exists('+acd') && &acd) ? ':~:h' : ':~:.:h'
	let fpath = split(fnamemodify(filepath, mod), dirsep)
	let fpath_shortparts = map(fpath[1:], 'v:val[0]')
	let short_path = join(extend([fpath[0]], fpath_shortparts), dirsep) . dirsep
	if short_path == ('.' . dirsep)
		let short_path = ''
	endif
	return short_path . filename
endfunction
" }}}

" Git ======================================================================={{{ Git wrapper, show git blame, git branch, etc.
Plug 'tpope/vim-fugitive'

" Show git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>
" }}}


" advance================================================================{{{
Plug 'tmhedberg/SimpylFold'

Plug 'godlygeek/tabular'
"marks
Plug 'kshenoy/vim-signature'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
"}}}

" Code ======================================================================={{{

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dense-analysis/ale'
"备注
Plug 'scrooloose/nerdcommenter'
" golang
Plug 'fatih/vim-go'


"Plug 'numirias/semshi'

"vue
Plug 'posva/vim-vue'
Plug 'mattn/emmet-vim'
"let g:vue_pre_processors = ['pug', 'scss']
"let g:vue_pre_processors = []
let g:vue_pre_processors = 'detect_on_enter'
" }}}
call plug#end()

"" vue
au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix
autocmd FileType vue syntax sync fromstart

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

colorscheme one
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chrome'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
set background=dark
