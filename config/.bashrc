# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias e=vim
alias ebrc='e ~/.bashrc'
alias evrc='e ~/.vimrc'
alias gpush='git add . && git commit && git push'
alias hgrep='history | grep -i'
alias lsgi='ls | grep -i'
alias lsl='ls -l'
alias sbrc='source ~/.bashrc'

alias cdp='cd ~/public_html'
alias notes='cd ~/public_html/notes && vit ~/public_html/notes/jotter.md && cd -'
alias what='find ~/public_html/notes/ -type f -exec cat {} + | less -i --pattern='
alias jan='cal -n 01'
alias feb='cal -n 02'
alias mar='cal -n 03'
alias apr='cal -n 04'
alias may='cal -n 05'
alias jun='cal -n 06'
alias jul='cal -n 07'
alias aug='cal -n 08'
alias sep='cal -n 09'
alias oct='cal -n 10'
alias nov='cal -n 11'
alias dec='cal -n 12'

alias gb='cat ~/.gb'

set -o vi
function vit { e "$1" && git add -i && git commit && git push origin main ;}

export -f vit
DISABLE_AUTO_TITLE=true
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. "$HOME/.cargo/env"

# To make manpages easier to read with colour-coding
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# as per AID/4403
alias nix-enter='~/bin/nix-enter'
export NIX_IGNORE_SYMLINK_STORE=1
