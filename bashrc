##########
# Exports
##########
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/bin:$HOME/.local/bin

##########
# Disable Ctrl+d
##########
set -o ignoreeof

##########
# Alias
##########
alias sshmemento="ssh warrentyexpired@192.168.88.111"
alias sshvaultnas="ssh warrentyexpired@192.168.88.100"
alias sshservarr="ssh warrentyexpired@192.168.88.101"
alias sshdockers="ssh warrentyexpired@192.168.88.102"
alias sshlive="ssh mementoadmin@uo-memento.com"
alias sshproxy="ssh 192.168.88.200"
alias sshvps="ssh 151.241.113.9"
alias grep="grep --color=auto"
alias rebuild="sudo nixos-rebuild switch --flake $HOME/NixOS/.#damagedProperty"

############
# App Checks
############
if command -v eza &>/dev/null; then
  alias la='eza -al --group-directories-first --icons' # all files and dirs
  alias ls='eza --color=always --group-directories-first --icons'  # preferred listing
  alias ll='eza -a --color=always --group-directories-first --icons'  # long format
  alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
  alias l.="eza -a | grep -e '^\.'"                                     # show only dotfiles
else
  echo "You may wanna install eza"
fi

if command -v pokeget &>/dev/null; then
  alias fastfetchp='pokeget random --hide-name | fastfetch --file-raw -'
else
  echo "You may wanna install pokeget"
fi

###########
# Functions
###########
###### Git Function ######
function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}

##########
# Prompt
##########
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1=${TITLEBAR}'\n┌─ [\[$(tput setaf 10)\]\u\[$(tput setaf 15)\]] @ [\[$(tput setaf 9)\]\H\[$(tput setaf 15)\]]
└─ [\[$(tput setaf 39)\]\w\[$(tput setaf 15)\]] ${PS1_CMD1} $(parse_git_dirty) 
\[$(tput setaf 15)\]└─ [$] '

###### MOVED TO THE BOTTOM SO ZOXIDE STOPS YELLING AT ME ######
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash --cmd cd)"
  #alias cd="z" #zoxide
else
  echo "You may wanna install Zoxide"
fi

if command -v fastfetch &>/dev/null; then
  fastfetch
else
  echo "You may wanna install fastfetch"
fi

##########
# For direnv
##########
if command -v direnv &>/dev/null; then
  eval "$(direnv hook bash)"
fi
##########
# For uvx
##########
if [ -d $HOME/.local/bin/env ]; then
  . "$HOME/.local/bin/env"
fi
