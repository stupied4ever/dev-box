" Run the current file with rspec

map <leader>rb :call VimuxRunCommand("clear; bundle exec rspec ")<cr>

" Prompt for a command to run

map <leader>rp :VimuxPromptCommand<cr>

" Run last command executed by RunVimTmuxCommand

map <leader>rl :VimuxRunLastCommand<cr>

" Inspect runner pane

map <leader>ri :VimuxInspectRunner<cr>

" Close all other tmux panes in current window

map <leader>rx :VimuxClosePanes<cr>

" Interrupt any command running in the runner pane

map <leader>rS :VimuxInterruptRunner<cr>

" If text is selected, save it in the v buffer and send that buffer it to tmux

vmap <leader>as "vy :call VimuxRunCommand(@v)<cr>

" Use nearest pane (not used by vim) if found instead of running split-window

let VimuxUseNearestPane = 1

