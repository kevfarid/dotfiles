# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"


# Brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

# alias
alias pip=pip3
alias ws="cd $HOME/workspace"
alias c=openCode
alias v=openNvim
alias vim=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#JAVA
export JAVA=/usr/java
export PATH=$PATH:$JAVA

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

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
    code ./
  else
    code $1
  fi
}

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"
