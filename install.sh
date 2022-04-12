#!/usr/bin/env bash

# install .dotfiles of kevfarid
# install based: https://github.com/charliesbot/dotfiles/blob/main/install.sh

if [[ `uname` == "Linux"   ]]; then
  echo "Linux detected. Using Linux config..."
  echo "Installing zsh..."
  sudo apt install zsh
  echo "Changing shell to zsh"
  sudo chsh -s $(which zsh)
  # Adding homebrew to zprofile
  echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> #HOME/.zprofile
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  echo "Installing PyEnv"
  curl https://pyenv.run | bash
fi

if [ -f /etc/debian_version ] ; then
  DISTROBASIC="Debian"
  echo $DISTROBASIC as distro basic detected. Using 'apt' config...
fi

if [ -f /etc/redhat-release ] ; then
  DISTROBASIC="RedHat"
  echo $DISTROBASIC as distro basic detected. Using 'dnf' config...
fi

if [ -f /etc/debian_version ]; then
  echo "Installign Kitty with Terminal"
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  mkdir -p ~/.local/bin/
  cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
  sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
  echo "Scanning terminal"
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
  sudo update-alternatives --config x-terminal-emulator
fi

echo "Installing Oh my zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Removing existing dotfiles"
# remove files if they already exist
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim ~/.config/kitty 2> /dev/null

echo "Creating symlinks"
# Neovim expects some folders already exist
mkdir -p ~/.config ~/.config/nvim  ~/.config/kitty

echo "Installing Python 3"
# install python 3
pyenv install 3.9.5 #latest
pyenv global 3.9.5

# Symlinking files
ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sF ~/.dotfiles/kitty ~/.config/
ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sF ~/.dotfiles/nvim/lua/ ~/.config/nvim/

# Italics and true color profile for tmux
tic -x tmux.terminfo

echo "Installing brew"
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ripgrep
brew install tmux
brew install neovim
brew install ag
brew install fzf
brew install bat
brew install thefuck
brew install go
brew install gcc
brew install bazel
brew install cmake
brew install luarocks

# FORMATTERS
brew install shfmt
brew install clang-format
luarocks install --server=https://luarocks.org/dev luaformatter

if [[ `uname` == "Linux"   ]]; then
  echo "Linux detected. Using Linux config..."
  echo "Installing JetBrains Mono"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
  echo "Installing pyenv"
  if [ -f /etc/debian_version ] ; then
    sudo apt install -y fonts-firacode
  fi
fi

if [[ `uname` == "Darwin"   ]]; then
  echo "Mac detected. Using Mac config..."
  brew install pyenv

  # disable key repeat
  defaults write -g ApplePressAndHoldEnabled -bool false

  brew tap homebrew/cask-fonts

  # casks only work in mac
  brew install --cask kitty
  brew install --cask font-fira-code
  brew install --cask font-cascadia
  brew install --cask font-jetbrains-mono
  brew install --cask font-iosevka
  brew install --cask rectangle

  brew install deno # deno brew formula only works with mac
  brew install reattach-to-user-namespace
fi


# FZF shortcuts
$(brew --prefix)/opt/fzf/install

# install fnm
curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash

# install Paq - Neovim Plugin Manager
git clone https://github.com/savq/paq-nvim.git \
    "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim

pip3 install pynvim

# install theme oh my zsh
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

# spaceship prompt manual config
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# plugins Oh My Zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Go setup
mkdir -p $HOME/go/{bin,src,pkg}

# Writting vim will launch nvim
alias vim="nvim"

# Nodejs setup
fnm install

# mkdirs
mkdir ~/workspace

# Git Config
git config --global user.name "Kevin Cruz"
git config --global user.email "hi@kevfarid.dev"
