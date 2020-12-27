set fish_greeting ""

# Exports
set -gx EDITOR nvim
set -gx PYENV_ROOT "$HOME/.pyenv"
set -gx NVM_DIR "$HOME/.nvm"
set -xa fish_user_paths $HOME/.fzf/bin
set -xa fish_user_paths $PYENV_ROOT/bin
set -xa fish_user_paths (go env GOROOT)/bin
set -xa fish_user_paths (go env GOPATH)/bin
set -xa fish_user_paths $HOME/.rbenv/bin

# Binding
bind -M insert \ca beginning-of-line
bind -M insert \ce end-of-line

# Aliases
abbr vim "nvim"
abbr cat "bat"
abbr ls "exa"
abbr tree "exa -T"
abbr co "cd ~/Code"
abbr e "cd ~/Code/Ejercicios"
abbr c "cd ~/Code/Ejercicios/C"
abbr py "cd ~/Code/Ejercicios/Python"
abbr ja "cd ~/Code/Ejercicios/Java"
abbr sc "cd ~/Code/SargantanaCode"
abbr scw "cd ~/Code/SargantanaCode/web-ror"
abbr scwd "cd ~/Code/SargantanaCode/sargantanacode"
abbr pyu "pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U"
abbr pyd "pip3 freeze | xargs pip3 uninstall -y"
abbr sassw "sass --watch scss:css --style compressed"
abbr externalip "curl ifconfig.me"
abbr localip "ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*\$/\1/p'"
abbr tls "tmux list-sessions"
abbr ta "tmux attach -t"
abbr tm "tmux attach || tmux new -s main"
abbr tk "tmux kill-session -t"
abbr tn "tmux new -s"
abbr ts2 "tmux split-window -v -p 30; tmux split-window -h -p 50"
abbr ts3 "tmux split-window -v -p 30; tmux split-window -h -p 66; tmux split-window -h -p 50"
abbr - 'cd -'
abbr ... '../..'
abbr .... '../../..'
abbr ..... '../../../..'
abbr ...... '../../../../..'

switch (uname)
case Linux
    alias pach "sudo pacman -Rns (pacman -Qtdq)"
    alias update "sudo apt update; sudo apt upgrade; sudo apt autoremove; npm install npm -g; npm update -g; gem update --system; gem update; gem cleanup; pyu"
    alias pbcopy "xclip -selection c"
    alias pbpaste "xclip -selection c -o"
case Darwin
    alias ctags "`brew --prefix`/bin/ctags"
    alias update 'sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup; pyu'
end

# Themes
set -g theme_display_user no
set -g theme_hide_hostname yes
set SPACEFISH_PROMPT_ADD_NEWLINE false
set SPACEFISH_PROMPT_PREFIXES_SHOW false
set SPACEFISH_USER_SHOW never
set SPACEFISH_HOST_SHOW never
set SPACEFISH_PROMPT_ORDER time user host dir git package node ruby golang php rust haskell julia elixir docker aws venv conda pyenv dotnet kubecontext exec_time line_sep battery jobs exit_code char

# Config
function __ls_on_change_pwd --on-variable PWD --description 'Do ls on change PWD'
  status --is-command-substitution; and return
  ls -a
end

if type -q ag
    set -gx FZF_DEFAULT_COMMAND 'ag --hidden -g ""'
end

# Load tools
status --is-interactive; and rbenv init - | source
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
