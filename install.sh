#!/usr/bin/env bash

export DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HOME/.config"

SCRIPTS_DIR="$DOTFILES/setup"

echo "Setting up dotfiles..."
echo ""

source "$SCRIPTS_DIR/symlinks.sh"

echo ""
echo "Done."
