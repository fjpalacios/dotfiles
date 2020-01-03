export ZSH="/Users/jpalacios/.oh-my-zsh"
export PATH="/usr/local/bin:${PATH}"
ZSH_THEME="elessar"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias cat='bat'
alias mkd='mkd() { mkdir "$1" && cd "$1" }; mkd'
alias weather='wthr() { curl -H "Accept-Language: es" http://wttr.in/"$1" }; wthr'

alias tls='tmux list-sessions'
alias ta='tmux attach -t'
alias tm='tmux attach || tmux new -s main'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'

chpwd() {
  ls
}

alias gcmsg='comm() { git commit -m "$(getGitBranch) | $1" }; comm'
alias gcmsgnv='comm() { git commit -m "$(getGitBranch) | $1" --no-verify }; comm'
alias ggpushf='ggpush --force'
alias gcd='gco development || gco develop'
alias grbd='git rebase development || git rebase develop'
alias gcbd='gcbd() { gcd && ggpull && git checkout -b $1 development && ggpush }; gcbd'

getGitBranch() {
  git symbolic-ref HEAD | cut -d'/' -f3
}

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source ~/.iterm2_shell_integration.zsh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
