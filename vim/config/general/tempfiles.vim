" Backup is always nice
set backup

" Undo available even after buffer close
set undofile

" Maximum number of changes that can be undone
set undolevels=1000

" Maximum number lines to save for undo on a buffer reload
set undoreload=10000

" Create those directories if they don't exist already
silent execute '!mkdir -p ~/.vim/{backup_files,swap_files,undo_files}'

set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//
