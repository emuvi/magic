;; On ~/.bashrc

if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
	tmux attach-session -t coder || tmux new-session -s coder
fi

export TERM=xterm-256color

;; On ~/.tmux.conf

set -g default-terminal "screen-256color"

