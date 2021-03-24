# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Enable full color support in tmux
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable the username prompt on the left side of the theme unless logged into a remote host
DEFAULT_USER="$(whoami)"

# NVM (Node Version Manager - https://github.com/nvm-sh/nvm)
export NVM_DIR="$HOME/.nvm"
# zsh-nvm (https://github.com/lukechilds/zsh-nvm)
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  pyenv
  nvm
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Personal aliases
# For a full list of active aliases, run `alias`.
source $HOME/dotfiles/aliases.sh

# DVM (Deno Version Manager - https://github.com/imbsky/dvm)
export PATH="$PATH:$HOME/.dvm"
export PATH="$PATH:$HOME/.deno/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/dotfiles/.p10k.zsh ]] || source $HOME/dotfiles/.p10k.zsh
