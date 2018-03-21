" Define <leader>
let mapleader=','

" Disable arrows
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" Map to avoid hold shift to every command
nnoremap ; :

" Move to alternatefile, faster nem control+6
nnoremap <space><space> <c-^>

" Fix common typos like :Q or :W
" (https://github.com/leafac/dotfiles/blob/master/vim/files/config/general/mappings.vim)
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Run rubocop with <leader> r
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
