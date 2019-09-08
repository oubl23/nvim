" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sj :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sk :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sb <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

noremap so <C-w>o


" ===
" === Tab management
" ===
" Create a new tab with tu
map tu :tabe<CR>
" Move around tabs with tn and ti
map tn :-tabnext<CR>
map ti :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmn :-tabmove<CR>
map tmi :+tabmove<CR>
map t0 :set showtabline=0<CR>
map t1 :set showtabline=2<CR>

" Open Startify
map <LEADER>st :Startify<CR>
" Opening a terminal window
map <LEADER>/ :set splitbelow<CR>:sp<CR>:term<CR>



map <LEADER>rc :e ~/.config/nvim/init.vim<CR>
map <LEADER>r0 :e ~/.config/nvim/conf/00-default.vim<CR>
map <LEADER>r1 :e ~/.config/nvim/conf/01-plug.vim<CR>
map <LEADER>r2 :e ~/.config/nvim/conf/02-lsp.vim<CR>
map <LEADER>r3 :e ~/.config/nvim/conf/03-key.vim<CR>
map <LEADER>rd :e ~/.config/nvim/_machine_specific.vim<CR>
map R :source $MYVIMRC<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
map P "*p
nnoremap n nzz
nnoremap N Nzz

map <LEADER>gi :GoImport 
