#!/usr/bin/zsh

# custom_prompt.zsh
# author: Seong Yong-ju <sei40kr@gmail.com>

print_toggl_duration() {
  toggl --cache --csv current | \
    awk -F',' '$1 == "Duration" { split($2, t, ":"); print (t[1] + 0) "h " (t[2] + 0) "m " (t[3] + 0) "s" }'
}

ZLE_RPROMPT_INDENT=0
RPROMPT='%F{yellow}$(print_toggl_duration)%f'

TMOUT=1
TRAPALRM() {
  zle reset-prompt
}
