#!/usr/bin/env zsh

# .zshrc
# author: Seong Yong-ju <sei40kr@gmail.com>
#         ay65535 <ay65535@icloud.com>

local -A ZPLGM  # initial Zplugin's hash definition, then:
ZPLGM[HOME_DIR]="${XDG_DATA_HOME}/zsh/.zplugin"
ZPLGM[BIN_DIR]="${ZPLGM[HOME_DIR]}/bin"
ZPLGM[PLUGINS_DIR]="${ZPLGM[HOME_DIR]}/plugins"
ZPLGM[SNIPPETS_DIR]="${ZPLGM[HOME_DIR]}/snippets"
ZPLGM[COMPLETIONS_DIR]="${ZPLGM[HOME_DIR]}/completions"
ZPLGM[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME}/zsh/.zplugin/zcompdump"

. "${ZPLGM[BIN_DIR]}/zplugin.zsh"
autoload -Uz _zplugin

if [[ "${+_comps}" == 1 ]]; then
    _comps[zplugin]=_zplugin
fi

. "${ZDOTDIR}/30_aliases.zsh"
. "${ZDOTDIR}/50_options.zsh"
. "${ZDOTDIR}/80_custom.zsh"
. "${ZDOTDIR}/zplugin.zsh"

compinit
zplugin cdreplay -q

# SDKMAN!
if [[ -n "$SDKMAN_DIR" ]]; then
  . "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi
