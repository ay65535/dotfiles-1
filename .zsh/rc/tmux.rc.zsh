#!/usr/bin/env zsh

# tmux.rc.zsh
# author: Seong Yong-ju ( @sei40kr )

# Launch tmux
# -----------

if [[ "${+commands[tmux]}" == 1 ]]
then
  tmux has-session -t global 2>/dev/null || tmux new-session -ds global \
      && tmux attach-session -t global
  exit
elif [[ "${commands[screen]}" == 1 ]]
then
  screen -rx || screen -D -RR
  exit
fi

# vi: et sw=2 cc=80
