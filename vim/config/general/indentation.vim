" auto remove Trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Autoindent
set autoindent

" Turn on smartindentation
set smartindent

" Default spaces
set ts=2 sts=2 sw=2 expandtab

" Spaces for filetypes
autocmd FileType makefile setlocal sts=4 sts=4 sw=4 noexpandtab
autocmd FileType markdown setlocal sts=4 sts=4 sw=4 expandtab
autocmd FileType python   setlocal sts=4 sts=4 sw=4 expandtab

" Load indent file for the current filetype
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins
