export ZSH=~/.oh-my-zsh
export PATH="/usr/local/bin:${PATH}"
export PATH=~/.local/bin:$PATH
ZSH_THEME="elessar"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker docker-compose)
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias cat='bat'
alias mkd='mkd() { mkdir "$1" && cd "$1" }; mkd'
alias weather='wthr() { curl -H "Accept-Language: es" http://wttr.in/"$1" }; wthr'
alias co='cd ~/Code'
alias on='cd ~/Code/onestic'

alias webserver='python -m http.server 8000'

alias tls='tmux list-sessions'
alias ta='tmux attach -t'
alias tm='tmux attach || tmux new -s main'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'

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
