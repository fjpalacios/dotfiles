export ZSH=~/.oh-my-zsh

ZSH_THEME="gitster"
HIST_STAMPS="dd/mm/yyyy"

plugins=(git rails django osx docker zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim='nvim'
alias cat='bat'
alias weather='wthr() { curl -H "Accept-Language: es" http://wttr.in/"$1" }; wthr'
alias pr='cd ~/Proyectos'
alias e='cd ~/Proyectos/Ejercicios'
alias c='cd ~/Proyectos/Ejercicios/C'
alias py='cd ~/Proyectos/Ejercicios/Python'
alias ja='cd ~/Proyectos/Ejercicios/Java'
alias sc='cd ~/Proyectos/SargantanaCode'
alias scw='cd ~/Proyectos/SargantanaCode/web-ror'
alias ve='venv() { source env/bin/activate }; venv'
alias pyu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'
alias init='init() { npx license "$1" > LICENSE && npx gitignore "$2" && npx covgen "$3" }; init'
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
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [[ `uname` == "Darwin" ]]
then
    alias ctags="`brew --prefix`/bin/ctags"
fi

eval "$(rbenv init -)"

chpwd() {
  ls
}
