" After a yank keep in the end of selection
vnoremap y ygv<esc>

" Copy and paste to system clipboard
set clipboard=unnamedplus

" Toggle paste mode
set pastetoggle=<leader>p

" Make pasting in visual-mode sane, by not replacing the register content with
" the erased one
vnoremap p pgvy

" Y act like C and D. Yank from the cursor to the end of the line,
" (https://github.com/leafac/dotfiles/blob/master/vim/files/config/general/mappings.vim)
nnoremap Y y$
