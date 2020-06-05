# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Enable full color support in tmux
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# powerlevel9k settings
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm virtualenv rbenv pyenv)
# Change the foreground colors across all possible folder paths
POWERLEVEL9K_DIR_HOME_FOREGROUND='015'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='015'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='015'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='076'
POWERLEVEL9K_PYENV_BACKGROUND='015'
# Truncate long paths like "/usr/share/plasma" to "/u/s/plasma"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_from_right'

# Disable the username prompt on the left side of the theme unless logged into a remote host
DEFAULT_USER="$(whoami)"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  pyenv
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Personal aliases
# For a full list of active aliases, run `alias`.
source $HOME/dotfiles/aliases.sh

# NVM (Node Version Manager - https://github.com/nvm-sh/nvm)
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# DVM (Deno Version Manager - https://github.com/imbsky/dvm)
export PATH="$PATH:$HOME/.dvm"
export PATH="$PATH:$HOME/.deno/bin"

