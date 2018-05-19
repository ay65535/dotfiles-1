# .zshrc
# author: Seong Yong-ju <sei40kr@gmail.com>

. "${ZDOTDIR}/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin

if [[ "${+_comps}" == 1 ]]; then
  _comps[zplugin]=_zplugin
fi

. "${ZDOTDIR}/zplugin_commands.zsh"
. "${ZDOTDIR}/zplugin_completions.zsh"
. "${ZDOTDIR}/zplugin_omz.zsh"
. "${ZDOTDIR}/zplugin_prezto.zsh"
. "${ZDOTDIR}/zplugin_others.zsh"

compinit
zplugin cdreplay -q

. "${ZDOTDIR}/custom.zsh"
. "${ZDOTDIR}/custom_prompt.zsh"
. "${ZDOTDIR}/custom_fzf.zsh"
. "${ZDOTDIR}/custom_emacs.zsh"
