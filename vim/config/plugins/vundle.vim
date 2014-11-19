set nocompatible
set modelines=0
set nomodeline

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

source ~/.vim/config/plugins.vim

filetype plugin indent on
