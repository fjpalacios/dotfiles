# Thanks to @mathiasbynens for shell prompt and Git repository details
# You can find his job on GitHub: https://github.com/mathiasbynens/dotfiles

prompt_git() {
    local s='';
    local branchName='';
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then
            git update-index --really-refresh -q &>/dev/null;
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;
        fi;
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
                git rev-parse --short HEAD 2> /dev/null || \
                echo '(unknown)')";
        [ -n "${s}" ] && s=" [${s}]";
        echo -e "${1}${branchName}${2}${s}";
    else
        return;
    fi;
}

bold='';
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM="xterm-256color"

PS1="\[${bold}\]\n"; # newline
PS1+="\[${red}\]\u"; # username
PS1+="\[${white}\] at ";
PS1+="\[${cyan}\]\h"; # host
PS1+="\[${white}\] in ";
PS1+="\[${yellow}\]\w"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details
PS1+="\n";
PS1+="\[${white}\]\$ \[${reset}\]"; # `$` (and reset color)
export PS1;

export PS2="\[${yellow}\]â \[${reset}\]";

alias python='python3.6'
alias pip3='python -m pip $1'
alias c='cd ~/Desktop/programación/C'
alias py='cd ~/Desktop/programación/Python'
alias ja='cd ~/Desktop/programación/Java'
alias ph='cd ~/Sites/PHP'
alias httpdconf='vim /usr/local/etc/apache2/2.4/httpd.conf'
alias httpdstart='sudo apachectl start'
alias httpdstop='sudo apachectl stop'
alias httpdrestart='sudo apachectl -k restart'
alias sassw='sass --watch scss:css --style compressed'

export PATH=$PATH:~/.nexustools
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH="/usr/local/opt/gettext/bin:$PATH"
