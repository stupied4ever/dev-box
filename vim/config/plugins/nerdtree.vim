" Shortcuts to open NERDTree
nnoremap <C-f> :NERDTreeToggle<cr>
vnoremap <C-f> :NERDTreeToggle<cr>

" Auto-open if Vim is called without parameters
autocmd vimenter * if !argc() | NERDTree | endif
