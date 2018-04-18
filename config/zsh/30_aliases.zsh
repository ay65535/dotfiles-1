alias u='builtin cd ..'

# Emacs
# cf https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/emacs/emacs.plugin.zsh

EMACS_PLUGIN_LAUNCHER="${ZDOTDIR}/plugins/emacs/emacsclient.sh"

alias emacs='LC_CTYPE=ja-JP.UTF-8 ${EMACS_PLUGIN_LAUNCHER} -n'
alias e=emacs
# open terminal ${EMACS_PLUGIN_LAUNCHER}
alias te='${EMACS_PLUGIN_LAUNCHER} -nw'
# same than M-x eval but from outside Emacs.
alias eeval='${EMACS_PLUGIN_LAUNCHER} -e'
# create a new X frame
alias eframe='emacsclient -a "" -c'

alias ekill='emacsclient -e "(kill-emacs)"'

alias q=exit
alias o=open

case $OSTYPE in
    'darwin'*)
        DIRCOLORS_PATH='/usr/local/bin/gdircolors'
        GNU_PREFIX='g'
    ;;
    'msys'*|*)
        DIRCOLORS_PATH='/usr/bin/dircolors'
        GNU_PREFIX=''
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x $DIRCOLORS_PATH ]; then
    DIRCOLORS_NAME=${DIRCOLORS_PATH##*/}
    test -r ~/.dircolors && eval "$($DIRCOLORS_NAME -b ~/.dircolors)" || eval "$($DIRCOLORS_NAME -b)"
    alias ls="${GNU_PREFIX}ls --color=auto"
    #alias ls='ls -G'
    #alias dir="${GNU_PREFIX}dir --color=auto"
    #alias vdir="${GNU_PREFIX}vdir --color=auto"

    alias grep="${GNU_PREFIX}grep --color=auto"
    alias fgrep="${GNU_PREFIX}fgrep --color=auto"
    alias egrep="${GNU_PREFIX}egrep --color=auto"
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias l.='l -d .*'
alias ll.='ll -d .*'
alias md5='openssl md5'
#alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
type code-insiders >/dev/null 2>&1 && alias code=code-insiders
