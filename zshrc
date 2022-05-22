# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export TERM=xterm

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

#Sonar-scanner
source /etc/profile.d/sonar-scanner.sh

# Brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  #zsh-syntax-highlighting
  zsh-autosuggestions
  F-Sy-H
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

workspacePath=$HOME/workspace

# alias
alias pip=pip3
alias ws="cd ${workspacePath}"
alias c=openCode
alias v=openNvim
alias vim=nvim
alias update=updateSystem
alias work="cd ${workspacePath}/bits"
alias me="cd ${workspacePath}/me"

alias t=tmux

alias reload-bluetooth="pactl load-module module-bluetooth-discover"

alias mysql="mysql -u root -p"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# GOLANG
export PATH=$PATH:/usr/local/go/bin

#JAVA
export JAVA_HOME=/usr/java/jre1.8.0_321/
export PATH=${PATH}:/usr/java/jre1.8.0_321/bin

# PHP
export PATH=$PATH:/usr/local/bin/composer
export PATH="$HOME/.config/composer/vendor/bin/:$PATH"

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Rust

export PATH=$PATH:~/.cargo/bin

# GitHub Credentials
GITHUB_USERNAME=kevfarid

export PATH="/usr/local/sbin:$PATH"

# Pyenv
if [[ $OSTYPE = (linux)* ]]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

# Functions Editors
function openNvim {
  if [ $# -eq 0 ]; then
    nvim ./
  else
    nvim $1
  fi
}

function openCode {
  if [ $# -eq 0 ]; then
    code .
  else
    code $1
  fi
}

# update system
function updateSystem {
  sudo apt update && sudo apt upgrade
}

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

eval "$(fnm env --use-on-cd)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
