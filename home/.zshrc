export EMAIL="xavier.maso@net-c.com"
export FULLNAME="Xavier Maso"

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"
EDITOR="subl -w"
COMPLETION_WAITING_DOTS="true"

plugins=(git python rails ruby grunt)

source $ZSH/oh-my-zsh.sh

# LOAD ALL ALIASES
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

export PATH=".bin:$PATH"
export PATH="/usr/local/lib/node:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"


# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# RVM Configuration: Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


# Custom search
search () {
  for i in "$@"; do
    ( find -iname "*$i*" | grep -i "$i" --color=auto ) 2> /dev/null;
  done
}

# Completion on ssh config's hosts
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
# if [[ -r ~/.ssh/known_hosts ]]; then
#   h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
# fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

# Force a reload of completion system if nothing matched; this fixes installing
# a program and then trying to tab-complete its name
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1 # Because we didn't really complete anything
}

# Always use menu completion, and make the colors pretty!
zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''

# Completers to use: rehash, general completion, then various magic stuff and
# spell-checking. Only allow two errors when correcting
zstyle ':completion:*' completer _force_rehash _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 2

# When looking for matches, first try exact matches, then case-insensiive, then
# partial word completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**'

# Turn on caching, which helps with e.g. apt
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Show titles for completion types and group by type
zstyle ':completion:*:descriptions' format "$fg_bold[black]» %d$reset_color"
zstyle ':completion:*' group-name ''

bindkey '^i' complete-word # tab to do menu
bindkey "\e[Z" reverse-menu-complete # shift-tab to reverse menu

unset -f work_in_progress

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
alias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.sh"
homeshick --quiet refresh

# Load nmv and enable nodejs 0.11
[ -s "/home/pamplemousse/.nvm/nvm.sh" ] && . "/home/pamplemousse/.nvm/nvm.sh"
nvm use 0.11
