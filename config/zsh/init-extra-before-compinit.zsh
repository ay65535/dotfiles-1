# -*- mode: sh -*-

# zshrc
# author: Seong Yong-ju <sei40kr@gmail.com>

if [[ -z "$TMUX" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" && "$TERM" != dumb ]]; then
    export LC_ALL
    tmux new-session
    exit
fi

__main() {
    autoload -Uz \
             run-help-git \
             pyclean

    if [[ -n "$TMUX" || -n "$INSIDE_EMACS" || -n "$EMACS" || -n "$VIM" ]]; then
        export PAGER=cat
    fi
    if [[ "${+commands[vim]}" == 1 && -f "${HOME}/.vim/vimrc" ]]; then
        export MANPAGER='vim -c MANPAGER -'
    fi

    HISTFILE="${ZDOTDIR}/.zsh_history"

    setopt APPEND_HISTORY
    setopt AUTO_LIST
    setopt AUTO_MENU
    setopt AUTO_PUSHD
    setopt AUTO_PARAM_KEYS
    setopt AUTO_PARAM_SLASH
    setopt AUTO_RESUME
    setopt EQUALS
    setopt GLOB_DOTS
    setopt INTERACTIVE_COMMENTS
    setopt NO_BEEP
    setopt NUMERIC_GLOB_SORT
    setopt PRINT_EIGHT_BIT
    setopt PROMPT_SUBST
    setopt PUSHD_IGNORE_DUPS
    unsetopt LIST_BEEP

    bindkey -e

    is_macos() {
        [[ "$OSTYPE" == darwin* ]]
    }

    is_arch() {
        [[ -f /etc/arch-release ]]
    }

    if [[ "$INSIDE_EMACS" == vterm ]]; then
        alias clear='vterm_printf "51; Evterm-clear-scrollback"; tput clear'
    fi
    . "${ZDOTDIR}/secrets.zsh"
    . "${ZDOTDIR}/custom-history.zsh"

    . "${ZINIT[BIN_DIR]}/zinit.zsh"

    HYPHEN_INSENSITIVE=true
    zinit snippet OMZL::clipboard.zsh
    zinit snippet OMZL::completion.zsh

    zinit snippet OMZP::zsh_reload/zsh_reload.plugin.zsh

    zinit ice pick'' blockf wait''
    zinit light zsh-users/zsh-completions

    if is_macos; then
        zinit ice svn
        zinit snippet PZT::modules/gnu-utility
    fi
    zinit ice trigger-load'!cd-gitroot'
    zinit light mollifier/cd-gitroot
    zinit ice trigger-load'!extract;!x'
    zinit snippet OMZP::extract/extract.plugin.zsh
    zinit snippet OMZP::rsync/rsync.plugin.zsh
    zinit snippet OMZP::nmap/nmap.plugin.zsh

    GH_CLONE_WORKSPACE_DIR="$WORKSPACE_DIR"
    zinit ice trigger-load'!gh-clone' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-gh-clone"'
    zinit light sei40kr/zsh-gh-clone


    ## OS-specific Plugins

    if is_arch; then
        zinit snippet OMZP::archlinux/archlinux.plugin.zsh
    fi


    ## Git

    zinit snippet OMZP::git/git.plugin.zsh
    zinit snippet OMZP::git-flow/git-flow.plugin.zsh


    ## Rust

    zinit ice as'completion' wait''
    zinit snippet OMZP::rust/_rust


    ## Go

    # goenv
    zinit ice has'goenv' \
        atclone'goenv init - --no-rehash zsh >goenv-init.zsh' \
        atpull'%atclone' \
        id-as'goenv-init'
    zinit light zdharma/null

    zinit snippet OMZP::golang/golang.plugin.zsh


    ## Haskell

    zinit ice wait'' has'stack'
    zinit snippet OMZP::stack/stack.plugin.zsh
    zinit ice wait''
    zinit snippet OMZP::cabal/cabal.plugin.zsh


    ## Java

    # jenv
    zinit ice has'jenv' \
        atclone'jenv init - --no-rehash zsh >jenv-init.zsh' \
        atpull'%atclone' \
        id-as'jenv-init'
    zinit light zdharma/null

    zinit snippet OMZP::mvn/mvn.plugin.zsh
    zinit ice trigger-load'!gradle'
    zinit snippet OMZP::gradle/gradle.plugin.zsh


    ## Scala

    zinit ice as'completion' wait''
    zinit snippet OMZP::scala/_scala
    zinit ice svn
    zinit snippet OMZP::sbt


    ## Perl

    if [[ -n "$PERLBREW_ROOT" && -d "$PERLBREW_ROOT" ]]; then
        zinit ice wait''
        zinit snippet "${PERLBREW_ROOT}/etc/perlbrew-completion.bash"
    fi

    zinit snippet OMZP::perl/perl.plugin.zsh
    zinit ice as'completion' wait''
    zinit snippet OMZP::cpanm/_cpanm


    ## Python

    # pyenv
    zinit ice has'pyenv' \
        atclone'pyenv init - --no-rehash zsh >pyenv-init.zsh' \
        atpull'%atclone' \
        id-as'pyenv-init'
    zinit light zdharma/null
    zinit ice if'[[ -d "${PYENV_ROOT:-${HOME}/.pyenv}/plugins/pyenv-virtualenv" ]]' \
        atclone'pyenv virtualenv-init - --no-rehash zsh >pyenv-virtualenv-init.zsh' \
        atpull'%atclone' \
        id-as'pyenv-virtualenv-init'
    zinit light zdharma/null

    zinit ice as'completion' wait''
    zinit snippet OMZP::pip/_pip


    ## Ruby

    # rbenv
    zinit ice has'rbenv' \
        atclone'rbenv init - --no-rehash zsh >rbenv-init.zsh' \
        atpull'%atclone' \
        id-as'rbenv-init'
    zinit light zdharma/null

    zinit snippet OMZP::ruby/ruby.plugin.zsh
    zinit ice as'completion' wait''
    zinit snippet OMZP::gem/_gem
    zinit ice wait''
    zinit snippet OMZP::rake-fast/rake-fast.plugin.zsh

    # Rails
    zinit ice has'rails'
    zinit snippet OMZP::rails/rails.plugin.zsh


    ## PHP

    zinit snippet OMZP::composer/composer.plugin.zsh
    zinit snippet OMZP::laravel/laravel.plugin.zsh
    zinit snippet OMZP::laravel5/laravel5.plugin.zsh


    ## Web Frontend

    zinit ice atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-lazy-nvm"'
    zinit light sei40kr/zsh-lazy-nvm
    zinit snippet OMZP::yarn/yarn.plugin.zsh

    zinit ice wait''
    zinit snippet OMZP::gulp/gulp.plugin.zsh

    # Gatsby
    zinit ice as'completion' wait''
    zinit snippet OMZP::gatsby/_gatsby

    # React Native
    zinit ice svn
    zinit snippet OMZP::react-native

    # Flutter
    zinit ice svn
    zinit snippet OMZP::flutter


    ## Database

    # Redis
    zinit ice as'completion' wait''
    zinit snippet OMZP::redis-cli/_redis-cli


    ## Continuous Integration

    # Docker
    zinit snippet OMZP::docker-compose/docker-compose.plugin.zsh
    if is_macos && [[ -d '/Applications/Docker.app' ]]; then
        zinit ice as'completion' \
            wait'' \
            multisrc'{docker,docker-compose}.zsh-completion'
        zinit light '/Applications/Docker.app/Contents/Resources/etc'
    fi

    # Code Climate
    zinit ice as'completion' wait''
    zinit snippet OMZP::codeclimate/_codeclimate

    # Travis CI Client
    if [[ -f "${HOME}/.travis/travis.sh" ]]; then
        zinit ice wait''
        zinit snippet "${HOME}/.travis/travis.sh"
    fi


    ## Infrastructure

    zinit ice as'completion' wait''
    zinit snippet OMZP::vagrant/_vagrant
    zinit snippet OMZP::ansible/ansible.plugin.zsh
    zinit ice as'completion' wait''
    zinit snippet OMZP::terraform/_terraform
    zinit snippet OMZP::kubectl/kubectl.plugin.zsh

    # AWS
    # TODO Add support for Linux environment
    if [[ -f /usr/local/bin/aws_zsh_completer.sh ]]; then
        zinit ice wait''
        zinit snippet /usr/local/bin/aws_zsh_completer.sh
    fi

    # gcloud
    if [[ -n "$CLOUDSDK_ROOT_DIR" && -d "$CLOUDSDK_ROOT_DIR" ]]; then
        zinit ice wait''
        zinit snippet "${CLOUDSDK_ROOT_DIR}/completion.zsh.inc"
    fi


    #
    # Completions

    zinit wait'' lucid atpull'%atclone' as'completion' for \
        has'karma'   atclone'karma completion >_karma'             id-as'karma_completion'   zdharma/null \
        has'kubectl' atclone'kubectl completion zsh >_kubectl'     id-as'kubectl_completion' zdharma/null \
        has'poetry'  atclone'poetry completions zsh >_poetry'      id-as'poetry_completion'  zdharma/null \
        has'rustup'  atclone'rustup completions zsh >_rustup'      id-as'rustup_completion'  zdharma/null \
        has'cargo'   atclone'rustup completions zsh cargo >_cargo' id-as'cargo_completion'   zdharma/null


    ## Others

    zinit ice wait'0' atinit'zpcompinit; zpcdreplay' lucid
    zinit light zdharma/fast-syntax-highlighting

    zinit ice wait'0' lucid
    zinit light -b hlissner/zsh-autopair

    zinit ice wait'0' lucid
    zinit light -b zsh-users/zsh-autosuggestions

    zinit ice wait'0' lucid
    zinit light -b zdharma/history-search-multi-word

    if [[ "${+aliases[run-help]}" == 1 ]]; then
        unalias run-help
    fi
    zinit ice trigger-load'!run-help' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-run-help-collections"'
    zinit light sei40kr/zsh-run-help-collections

    zinit snippet OMZP::fancy-ctrl-z/fancy-ctrl-z.plugin.zsh

    zinit ice from'gh-r' \
        as'program' \
        mv'direnv* -> direnv' \
        atclone'./direnv hook zsh >zhook.zsh' \
        atpull'%atclone'
    zinit light direnv/direnv

    zinit ice trigger-load'!ranger-cd' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-ranger-cd"'
    zinit light sei40kr/zsh-ranger-cd
    bindkey '\ec' ranger-cd

    # FZF
    FZF_DEFAULT_OPTS='--height=15 --reverse --inline-info --color=dark --color=fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe --color=info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
    zinit ice has'fzf' bindmap'^R ->;\ec ->' multisrc'shell/{completion,key-bindings}.zsh'
    zinit light -b junegunn/fzf

    # FZF additional sources
    zinit ice has'fzf' trigger-load'!_fzf_complete_docker' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-fzf-docker"'
    zinit light sei40kr/zsh-fzf-docker
    zinit ice has'fzf' trigger-load'!_fzf_complete_cd' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-fzf-cd-dirs"'
    zinit light sei40kr/zsh-fzf-cd-dirs

    FZF_PROJECTS_WORKSPACE_DIRS=( "$WORKSPACE_DIR" )
    FZF_PROJECTS_PROJECT_DIR_MAX_DEPTH=2
    FZF_PROJECTS_KNOWN_PROJECTS=(
        "${HOME}/.dotfiles"
        "${HOME}/.emacs.d"
        "${HOME}/.doom.d"
    )
    zinit ice has'fzf' trigger-load'!fzf-projects' \
        atclone'mkdir -p "${WORKSPACE_DIR}/sei40kr"; ln -fs "$PWD" "${WORKSPACE_DIR}/sei40kr/zsh-fzf-projects"'
    zinit light sei40kr/zsh-fzf-projects
    zle -N fzf-projects
    bindkey '^xg' fzf-projects
    bindkey '^x^g' fzf-projects

    # Notification
    if is_macos; then
        zinit ice from'gh-r' as'program'
        zinit light julienXX/terminal-notifier
    fi
    zinit snippet OMZP::bgnotify/bgnotify.plugin.zsh

    # Other alias definitions
    . "${ZDOTDIR}/aliases.zsh"

    ## Theme & Appearance

    zinit ice from'gh-r' \
        src'zstarship.zsh' \
        atclone'./starship init zsh --print-full-init >zstarship.zsh' \
        atpull'%atclone' \
        atload'starship_precmd' \
        as'program' \
        nocompile'!'
    zinit light starship/starship

    export YSU_MESSAGE_FORMAT="💡 You should use: $(tput bold)%alias$(tput sgr0)"
    export YSU_HARDCORE=1
    zinit light MichaelAquilina/zsh-you-should-use
}

if [[ "$TERM" == dumb ]]; then
    HISTSIZE=0
    SAVEHIST=0
else
    __main
fi
