call plug#begin('~/.vim/autoload/')
" Define bundles via Github repos
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ctags.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'stupied4ever/vimux-ruby-test'
Plug 'altercation/vim-colors-solarized'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'godlygeek/tabular'
Plug 'benmills/vimux'
Plug 'mileszs/ack.vim'
Plug 'evidens/vim-twig'

Plug 'compactcode/alternate.vim'
Plug 'compactcode/open.vim'
Plug 'ngmy/vim-rubocop'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'joonty/vdebug'
Plug 'rodjek/vim-puppet'

call plug#end()

" Drop Vdebug settings at the end of the file "
let g:vdebug_options = {
\ 'break_on_open': 1,
\ 'path_maps': {'/var/www/api': '/home/rafael/Workspace/easy/api'},
\ 'port': '18000',
\ 'watch_window_style': 'compact'
\ }
