export ZSH=~/.oh-my-zsh

ZSH_THEME="gitster"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias python='python3.6'
alias pip='python -m pip $1'
alias c='cd /Volumes/media/programación/C'
alias pr='cd /Volumes/media/programación'
alias py='cd /Volumes/media/programación/Python'
alias ja='cd /Volumes/media/programación/Java'
alias ph='cd /var/www/PHP'
alias sy='cd /var/www/Symfony'
alias sassw='sass --watch scss:css --style compressed'

# Launch a tmux session automatically
if [[ -z "$TMUX" ]]
then
    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
    if [[ -z "$ID" ]]
    then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi
