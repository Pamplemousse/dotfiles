setopt no_beep
setopt interactive_comments   # escape commands so i can use them later (allow comments after commands)
setopt rm_star_wait           # if `rm *` wait 10 seconds before performing it!
setopt list_types             # show types in completion
setopt auto_cd                # if a command is not in the hash table, and there exists an executable directory by that name, perform the cd command to that directory.
setopt cd_able_vars           # if the argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory.
setopt no_auto_name_dirs      # see: http://www.neactar.com/shell/fix-for-wrong-prompt-dir-when-using-zsh-project-rvmrc-and-oh-my-zsh
setopt hist_ignore_dups       # ignore duplication command history list
setopt hist_verify            # expand history onto the current line instead of executing it
setopt hist_expire_dups_first # remove oldest duplicate commands from the history first
setopt hist_ignore_space      # don't save commands beginning with spaces to history
setopt extended_history       # save beginning time and elapsed time before commands in history
setopt append_history         # append to the end of the history file
setopt inc_append_history     # always be saving history (not just when the shell exits)
setopt magic_equal_subst      # all unquoted arguments of the form identifier=expression appearing after the command name have file expansion
setopt auto_menu              # show completion menu on successive tab press
setopt auto_pushd             # make cd push the old directory onto the directory stack
setopt glob_complete          # complete globs instead of expanding
setopt complete_in_word
setopt always_to_end

export EMAIL="xavier.maso@net-c.com"
export FULLNAME="Xavier Maso"

plugins=(git python bundler rails ruby rvm tmux nvm grunt docker)

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="candy"
EDITOR="subl -w"
COMPLETION_WAITING_DOTS="true"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=false

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
alias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.sh"
homeshick --quiet refresh

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
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:$HOME/.rvm/bin

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

# Load nmv and enable iojs
source ~/.nvm/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
nvm use iojs

# RVM Configuration: Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Compile the .ssh/config file
`cat $HOME/.ssh/conf.d/* > $HOME/.ssh/config`
