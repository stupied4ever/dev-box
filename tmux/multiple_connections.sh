#!/bin/bash
# ssh-multi
# D.Kovalov
# Based on http://linuxpixies.blogspot.jp/2011/06/tmux-copy-mode-and-how-to-control.html

# a script to ssh multiple servers over multiple tmux panes


starttmux() {
if [ -z "$HOSTS" ]; then
echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
read HOSTS
fi

local hosts=( $HOSTS )


tmux new-window "host=${hosts[0]} ssh live"
unset hosts[0];
for i in "${hosts[@]}"; do
tmux split-window -h "host=$i ssh live"
sleep 0.3
tmux select-layout tiled > /dev/null
done
tmux select-pane -t 0
tmux set-window-option synchronize-panes on > /dev/null
tmux set synchronize-panes on

}

HOSTS=${HOSTS:=$*}

starttmux
