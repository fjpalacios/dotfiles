export ZSH=~/.oh-my-zsh

ZSH_THEME="gitster"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git rails django osx)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

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
alias tls='tmux list-sessions'
alias ta='tmux attach -t'
alias tm='tmux attach || tmux new -s main'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'

if [[ `uname` == "Linux" ]]
then
    alias pach='sudo pacman -Rns $(pacman -Qtdq)'
fi

if [[ `uname` == "Darwin" ]]
then
    alias ctags="`brew --prefix`/bin/ctags"
fi
