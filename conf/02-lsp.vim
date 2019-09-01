" pip install pip install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" go get golang.org/x/tools/gopls@latest
" or MO111MODULE=on go get golang.org/x/tools/gopls@latest
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
"    autocmd BufWritePre *.go LspDocumentFormatSync
endif


" npm install -g vscode-css-languageserver-bin
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif


" npm install vue-language-server -g
if executable('vls')
  augroup LspVls
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vue-language-server',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ 'initialization_options': {
        \         'config': {
        \             'html': {},
        \              'vetur': {
        \                  'validation': {}
        \              }
        \         }
        \     }
        \ })

    " omnifunc
    au FileType vue setlocal omnifunc=lsp#complete
    " map
    au FileType vue nnoremap <buffer><silent> gd :<C-u>LspDefinition<CR>
    au FileType vue nnoremap <buffer><silent> gD :<C-u>LspReferences<CR>
    au FileType vue nnoremap <buffer><silent> gs :<C-u>LspDocumentSymbol<CR>
    au FileType vue nnoremap <buffer><silent> gS :<C-u>LspWorkspaceSymbol<CR>
    au FileType vue nnoremap <buffer><silent> gQ :<C-u>LspDocumentFormat<CR>
    au FileType vue vnoremap <buffer><silent> gQ :LspDocumentRangeFormat<CR>
    au FileType vue nnoremap <buffer><silent> K :<C-u>LspHover<CR>
    au FileType vue nnoremap <buffer><silent> <F1> :<C-u>LspImplementation<CR>
    au FileType vue nnoremap <buffer><silent> <F2> :<C-u>LspRename<CR>
  augroup end
endif

if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif
