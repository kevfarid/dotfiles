#!/usr/bin/env bash
# fish (used only inside Ghostty): CLI deps, ~/.config/fish link, fisher plugins.

echo ""
echo "Setting up fish..."

if command -v brew >/dev/null; then
  brew install fish fzf fd bat eza zoxide fnm
fi

# fish creates a default ~/.config/fish on first run; back it up so we can link.
if [ -d "$CONFIG/fish" ] && [ ! -L "$CONFIG/fish" ]; then
  backup="$CONFIG/fish.backup.$(date +%Y%m%d%H%M%S)"
  mv "$CONFIG/fish" "$backup"
  echo "[backup] $CONFIG/fish -> $backup"
fi
link "$DOTFILES/fish" "$CONFIG/fish"

# Install fisher + everything listed in fish/fish_plugins.
fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update' </dev/null
