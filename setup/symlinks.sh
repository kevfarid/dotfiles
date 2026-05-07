#!/usr/bin/env bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

link() {
  local src=$1
  local dest=$2

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo -e "${RED}[skip]${NC} $dest already exists (not a symlink)"
    return
  fi

  ln -sf "$src" "$dest"
  echo -e "${GREEN}[link]${NC} $dest -> $src"
}

config_dirs=(
  aerospace
  sketchybar
  yabai
  zed
  ghostty
)

standalone=(
  "starship.toml:$CONFIG/starship.toml"
  ".zshrc:$HOME/.zshrc"
)

for dir in "${config_dirs[@]}"; do
  link "$DOTFILES/$dir" "$CONFIG/$dir"
done

for entry in "${standalone[@]}"; do
  src="${entry%%:*}"
  dest="${entry##*:}"
  link "$DOTFILES/$src" "$dest"
done
