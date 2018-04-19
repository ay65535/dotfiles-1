#!/usr/bin/env zsh

# .zshrc
# author: Seong Yong-ju ( @sei40kr )

. "${ZDOTDIR}/rc/exports.rc.zsh"

# source secrets
if [ -d "${HOME}/.secret" ]; then
    for f in ${HOME}/.secret/*.sh; do
        . "$f"
    done
fi

zmodload zsh/zpty

if [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then
  . "${HOME}/.sdkman/bin/sdkman-init.sh"
fi

autoload -Uz add-zsh-hook \
    cdr \
    chpwd_recent_dirs \
    compinit \
    _zplugin

local -A ZPLGM  # initial Zplugin's hash definition
ZPLGM[HOME_DIR]="${XDG_DATA_HOME}/zsh/.zplugin"
ZPLGM[BIN_DIR]="${ZPLGM[HOME_DIR]}/bin"
ZPLGM[PLUGINS_DIR]="${ZPLGM[HOME_DIR]}/plugins"
ZPLGM[SNIPPETS_DIR]="${ZPLGM[HOME_DIR]}/snippets"
ZPLGM[COMPLETIONS_DIR]="${ZPLGM[HOME_DIR]}/completions"
ZPLGM[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zsh/.zcompdump"

# Install zplugin if not installed
[[ -d "${ZPLGM[HOME_DIR]}" ]] || \
    git clone https://github.com/zdharma/zplugin.git ${ZPLGM[HOME_DIR]}/bin

# Load zplugin
. "${ZPLGM[BIN_DIR]}/zplugin.zsh"

if [[ "${+_comps}" == 1 ]]; then
  _comps[zplugin]=_zplugin
fi

## Environments
# Launch tmux if not running
if [[ "$VIM" == "" && "$EMACS" == "" && "$VSCODE_PID" == "" ]]; then
  #zstyle ':prezto:module:tmux:auto-start' local 'yes'
  zstyle ':prezto:module:tmux:session' name 'default'
  zplugin ice svn; zplugin snippet PZT::modules/tmux
fi

# Setup Oh My Zsh
ZSH="${ZDOTDIR}"
ZSH_CUSTOM="${ZSH}/custom"
ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zsh"
typeset -U fpath
fpath=( "${ZSH}/completions" "${ZSH}/functions" "${fpath[@]}" )
[[ -d "$ZSH_CACHE_DIR" ]] || mkdir -p "$ZSH_CACHE_DIR"

# Setup Prezto
zplugin ice svn; zplugin snippet PZT::modules/helper

zplugin snippet PZT::modules/environment/init.zsh

zplugin snippet PZT::modules/directory/init.zsh
zplugin snippet PZT::modules/history/init.zsh
export HISTFILE="${XDG_DATA_HOME}/zsh/history"
export HISTSIZE=100000
export SAVEHIST=200000
zplugin snippet PZT::modules/gnu-utility/init.zsh

## Completions and aliases
zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
# Remove unwanted aliases
unalias rm cp mv

zstyle ':prezto:module:completion:*:hosts' etc-host-ignores \
    '0.0.0.0' '127.0.0.1'
zplugin ice blockf; zplugin snippet PZT::modules/completion/init.zsh

zstyle ':prezto:module:editor' key-bindings emacs
zstyle ':prezto:module:editor' dot-expansion yes
zplugin snippet PZT::modules/editor/init.zsh

zplugin ice svn pick'init.zsh'; zplugin snippet PZT::modules/docker
zplugin ice svn pick'init.zsh'; zplugin snippet PZT::modules/python
zplugin ice svn pick'init.zsh'; zplugin snippet PZT::modules/ssh
zplugin snippet PZT::modules/rsync/init.zsh
zplugin snippet PZT::modules/homebrew/init.zsh

zplugin ice svn; zplugin snippet OMZ::plugins/rails
# Remove unwanted alias
unalias rg

zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
unalias k

zplugin snippet OMZ::plugins/tig/tig.plugin.zsh
alias tig='env TERM=screen-256color tig'

zplugin ice svn; zplugin snippet OMZ::plugins/asdf
zplugin ice svn; zplugin snippet OMZ::plugins/autopep8
zplugin ice svn; zplugin snippet OMZ::plugins/bundler
zplugin ice svn; zplugin snippet OMZ::plugins/capistrano
zplugin ice svn; zplugin snippet OMZ::plugins/docker-compose
zplugin ice svn; zplugin snippet OMZ::plugins/extract
zplugin ice svn; zplugin snippet OMZ::plugins/gem
zplugin ice svn; zplugin snippet OMZ::plugins/golang
zplugin ice svn; zplugin snippet OMZ::plugins/pip
zplugin ice svn; zplugin snippet OMZ::plugins/python
zplugin ice svn; zplugin snippet OMZ::plugins/react-native
zplugin ice svn; zplugin snippet OMZ::plugins/sbt
zplugin snippet OMZ::plugins/ant/ant.plugin.zsh
# Disable composer plugin because it invokes composer to locate binary dir
# and it's very slow.
# zplugin snippet OMZ::plugins/composer/composer.plugin.zsh
zplugin snippet OMZ::plugins/dircycle/dircycle.plugin.zsh
zplugin snippet OMZ::plugins/dotenv/dotenv.plugin.zsh
zplugin snippet OMZ::plugins/fancy-ctrl-z/fancy-ctrl-z.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/gradle/gradle.plugin.zsh
zplugin snippet OMZ::plugins/mosh/mosh.plugin.zsh
zplugin snippet OMZ::plugins/mvn/mvn.plugin.zsh
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh
zplugin snippet OMZ::plugins/postgres/postgres.plugin.zsh
zplugin snippet OMZ::plugins/rake/rake.plugin.zsh
zplugin snippet OMZ::plugins/ruby/ruby.plugin.zsh
zplugin snippet OMZ::plugins/stack/stack.plugin.zsh
zplugin snippet OMZ::plugins/yarn/yarn.plugin.zsh
zplugin snippet OMZ::plugins/zsh_reload/zsh_reload.plugin.zsh

zplugin ice blockf; zplugin light zsh-users/zsh-completions

if [[ "$OSTYPE" == darwin* ]]; then
  # macOS
  zplugin ice svn; zplugin snippet PZT::modules/osx
elif [[ "${+commands[apt]}" == 1 ]] && [[ "${+commands[lsb_release]}" == 1 ]]; then
  LSB_RELEASE="$(lsb_release -is)"

  # Debian
  zplugin ice if'[[ "$LSB_RELEASE" == "Debian" ]]'
  zplugin snippet OMZ::plugins/debian/debian.plugin.zsh

  # Ubuntu
  zplugin ice if'[[ "$LSB_RELEASE" =~ ^(Ubuntu|elementary)$ ]]'
  zplugin snippet OMZ::plugins/ubuntu/ubuntu.plugin.zsh
fi

## Commands and UI widgets
export TMUXIFIER_LAYOUT_PATH="${HOME}/.tmux-layouts"
zplugin ice pick'init.sh' atinit'ln -sf "$PWD" "${HOME}/.tmuxifier"'
zplugin light jimeh/tmuxifier

zplugin ice pick'k.sh'; zplugin light supercrabtree/k
alias k='k -Ah --no-vcs'

zplugin light mollifier/anyframe
bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history
bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history
bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

zplugin light mollifier/cd-gitroot
alias U='cd-gitroot'

FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*" --glob "!*/node_modules/*"'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
zplugin snippet \
    'https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh'

## Executables
zplugin ice from'gh-r' as'command' mv'gotcha_* -> gotcha'
zplugin light b4b4r07/gotcha

zplugin ice cp'httpstat.sh -> httpstat'
zplugin snippet --command \
    'https://raw.githubusercontent.com/b4b4r07/httpstat/master/httpstat.sh'

zplugin ice svn make'diff-highlight' pick'diff-highlight'
zplugin snippet --command \
    'https://github.com/git/git/trunk/contrib/diff-highlight'

zplugin snippet --command \
    'https://raw.githubusercontent.com/jonas/tig/master/contrib/tig-pick'

zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/moshrc'
zplugin snippet --command \
    'https://raw.githubusercontent.com/Russell91/sshrc/master/sshrc'

## Lazy plugins
export ZSH_PLUGINS_ALIAS_TIPS_TEXT='alias-tips: '
zplugin ice wait'1'; zplugin light djui/alias-tips

zplugin ice wait'1'
zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait'1'
zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait'1' if'[[ -n "$TMUX" ]]'
zplugin light sei40kr/zsh-tmux-rename

## Theme
zplugin light mafredri/zsh-async
zplugin ice pick'pure.zsh' wait'!0'; zplugin light sindresorhus/pure

compinit
zplugin cdreplay -q

# Define aliases
alias u='cd ..'

#setopt APPEND_HISTORY  # dup: PZT::modules/history
setopt AUTO_PARAM_KEYS
#setopt AUTO_RESUME  # dup: PZT::modules/environment
setopt EQUALS
#setopt EXTENDED_HISTORY  # dup: PZT::modules/history
setopt GLOB_DOTS
setopt HIST_REDUCE_BLANKS
#setopt INTERACTIVE_COMMENTS  # dup: PZT::modules/environment, zdharma/fast-syntax-highlighting
setopt NO_BEEP
setopt NUMERIC_GLOB_SORT
setopt PRINT_EIGHT_BIT
setopt PROMPT_SUBST
#setopt SHARE_HISTORY  # dup: PZT::modules/history
unsetopt LIST_BEEP
