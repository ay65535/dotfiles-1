#!/usr/bin/env zsh

# .zshenv
# author: Seong Yong-ju ( @sei40kr )

export XDG_DATA_HOME="${HOME}/local/share"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

export TERM='xterm-256color-italic'

export EDITOR="${commands[vim]:-$EDITOR}"
export PAGER="${commands[less]:-$PAGER}"
export KEYTIMEOUT=1

