#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

GR="\[$(tput setaf 150)\]"
RESET="\[$(tput sgr0)\]"
FIOLET2="\[$(tput setaf 221)\]"
YELLOW="\[$(tput setaf 217)\]"
ORANGE="\[$(tput setaf 223)\]"
BLUE="\[$(tput setab 12)\]"
OR="\[$(tput setaf 208)\]"

PS1="${GR}[\u@\h ${FIOLET2}\W${GR}]\$${RESET} "
