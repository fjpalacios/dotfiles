export ZSH=~/.oh-my-zsh
export PATH="/usr/local/bin:${PATH}"
export PATH=~/.local/bin:$PATH
PATH=${PATH}:$(go env GOPATH)/bin
ZSH_THEME="elessar"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias cat='bat'
alias mkd='mkd() { mkdir "$1" && cd "$1" }; mkd'
alias weather='wthr() { curl -H "Accept-Language: es" http://wttr.in/"$1" }; wthr'
alias co='cd ~/Code'
alias on='cd ~/Code/onestic'

alias webserver='python3 -m http.server 8000'

alias tls='tmux list-sessions'
alias ta='tmux attach -t'
alias tm='tmux attach || tmux new -s main'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'
alias ts2='tmux split-window -v -p 30; tmux split-window -h -p 50'
alias ts3='tmux split-window -v -p 30; tmux split-window -h -p 66; tmux split-window -h -p 50'
alias csvview='csvv() { column -s, -t -n "$1" | less -F -S -X -K }; csvv'

alias gcmsg='comm() { git commit -m "$(getGitBranch) $1" }; comm'
alias gcb='gcb() { git checkout -b "$1"-"$(replaceSpacesWithUnderscores $2)" }; gcb'

replaceSpacesWithUnderscores() {
    echo $1 | tr " " "_"
}

getGitBranch() {
    git symbolic-ref HEAD | cut -d'/' -f3 | cut -d'-' -f1,2
}

chpwd() {
  ls
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [[ `uname` == "Linux" ]]
then
    alias pbcopy="xclip -selection c"
    alias pbpaste="xclip -selection c -o"
fi

if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(rbenv init -)"
