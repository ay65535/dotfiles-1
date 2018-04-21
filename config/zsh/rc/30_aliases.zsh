alias o=open
alias q=exit

# enable color support of ls and also add handy aliases
DIRCOLORS_PATH='/usr/local/bin/gdircolors'
if [ -x $DIRCOLORS_PATH ]; then
  DIRCOLORS_NAME=${DIRCOLORS_PATH##*/}
  test -r ~/.dircolors && eval "$($DIRCOLORS_NAME -b ~/.dircolors)" || eval "$($DIRCOLORS_NAME -b)"
fi

GNU_PREFIX='g'
alias ls="${GNU_PREFIX}ls --color=auto"
#alias ls='ls -G'
#alias dir="${GNU_PREFIX}dir --color=auto"
#alias vdir="${GNU_PREFIX}vdir --color=auto"

alias grep="${GNU_PREFIX}grep --color=auto"
alias fgrep="${GNU_PREFIX}fgrep --color=auto"
alias egrep="${GNU_PREFIX}egrep --color=auto"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias l.='l -d .*'
alias ll.='ll -d .*'
alias md5='openssl md5'
type code-insiders >/dev/null 2>&1 && alias code=code-insiders
