#!/usr/bin/env bash
# Dependencies for the Lua (SbarLua) SketchyBar config in this repo.
# Not run automatically — review and run it yourself.
set -euo pipefail

# Packages
brew install lua
brew install nowplaying-cli
brew tap FelixKratz/formulae
brew install sketchybar
brew install borders
brew install --cask nikitabobko/tap/aerospace

# helpers/init.lua compiles helpers/menus and helpers/event_providers on every
# sketchybar start (native Apple-menu popup + an unused network_load provider
# kept for parity with upstream). Needs a C toolchain:
xcode-select --install 2>/dev/null || true

# Fonts
brew install --cask font-jetbrains-mono-nerd-font

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.5/sketchybar-app-font.ttf \
	-o "$HOME/Library/Fonts/sketchybar-app-font.ttf"

# SbarLua — the Lua bindings sketchybarrc/init.lua require() at startup
(
	git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua
	cd /tmp/SbarLua
	make install
	rm -rf /tmp/SbarLua
)

echo "Done. Run '../install.sh' from the repo root to symlink configs, then:"
echo "  brew services start sketchybar"
echo "  brew services start borders"
echo "  open -a AeroSpace"
