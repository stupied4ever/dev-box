" Check on open and save
let g:syntastic_check_on_open=1

" Errors symbols
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

" Show errors tab
noremap <leader>e :Errors<cr>

" Use PSR2
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
