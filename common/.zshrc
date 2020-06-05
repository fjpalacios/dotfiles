export ZSH=~/.oh-my-zsh
export EDITOR=nvim
export PATH=$PATH:$(go env GOPATH)/bin:$(go env GOROOT)/bin

ZSH_THEME="elessar"
HIST_STAMPS="dd/mm/yyyy"

plugins=(
    git django osx docker docker-compose zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias cat='bat'
alias mkd='mkd() { mkdir "$1" && cd "$1" }; mkd'
alias weather='wthr() { curl -H "Accept-Language: es" http://wttr.in/"$1" }; wthr'
alias co='cd ~/Code'
alias e='cd ~/Code/Ejercicios'
alias c='cd ~/Code/Ejercicios/C'
alias py='cd ~/Code/Ejercicios/Python'
alias ja='cd ~/Code/Ejercicios/Java'
alias sc='cd ~/Code/SargantanaCode'
alias scw='cd ~/Code/SargantanaCode/web-ror'
alias scwd='cd ~/Code/SargantanaCode/sargantanacode'
alias pyu='pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U'
alias pyd='pip3 freeze | xargs pip3 uninstall -y'
alias init='init() { npx license "$1" > LICENSE && npx gitignore "$2" && npx covgen "$3" }; init'
alias sassw='sass --watch scss:css --style compressed'
alias git='LANG=en_US git'
alias externalip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip='ip route get 1 | sed -n "s/^.*src \([0-9.]*\) .*$/\1/p"'
alias tls='tmux list-sessions'
alias ta='tmux attach -t'
alias tm='tmux attach || tmux new -s main'
alias tk='tmux kill-session -t'
alias tn='tmux new -s'
alias ts2='tmux split-window -v -p 30; tmux split-window -h -p 50'
alias ts3='tmux split-window -v -p 30; tmux split-window -h -p 66; tmux split-window -h -p 50'

alias webserver='python -m http.server 8000'

if [[ `uname` == "Linux" ]]
then
    alias pach='sudo pacman -Rns $(pacman -Qtdq)'
    alias update='sudo pacman -Syyu; yay -Syyu; pach; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup; pyu'
    alias pbcopy="xclip -selection c"
    alias pbpaste="xclip -selection c -o"
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [[ `uname` == "Darwin" ]]
then
    alias ctags="`brew --prefix`/bin/ctags"
    alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup; pyu'
fi

eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

chpwd() {
  ls -a
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if type ag &> /dev/null; then
    export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
