#!/usr/bin/env bash
# tmux: deps, tpm bootstrap and plugin install (config is linked by symlinks.sh).

echo ""
echo "Setting up tmux..."

if command -v brew >/dev/null; then
  brew install tmux bash fzf
  brew tap morantron/tmux-fingers && brew install tmux-fingers
fi

TPM="$DOTFILES/tmux/plugins/tpm"
[ -d "$TPM" ] || git clone --depth 1 https://github.com/tmux-plugins/tpm "$TPM"

# Install every @plugin from tmux.conf (and drop ones no longer listed).
"$TPM/bin/install_plugins"
"$TPM/bin/clean_plugins"
