export ZSH=~/.oh-my-zsh

ZSH_THEME="gitster"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ `uname` == "Darwin" ]]
then
    alias vim='/usr/local/bin/vim'
fi

alias python='python3.6'
alias pip='python -m pip $1'
alias pr='cd ~/Proyectos'
alias e='cd ~/Proyectos/Ejercicios'
alias c='cd ~/Proyectos/Ejercicios/C'
alias py='cd ~/Proyectos/Ejercicios/Python'
alias ja='cd ~/Proyectos/Ejercicios/Java'
alias dam='cd ~/Proyectos/DAM'
alias sc='cd ~/Proyectos/SargantanaCode'
alias scw='cd ~/Proyectos/SargantanaCode/web'
alias sassw='sass --watch scss:css --style compressed'
alias git='LANG=en_US git'

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
