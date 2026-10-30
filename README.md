# Dotfiles

Minimal yet powerful dotfiles setup for macOS, tailored to supercharge your
daily workflow.

## 🛠 Stack

### 🖥️ Window management
- [AeroSpace](https://github.com/nikitabobko/AeroSpace) – i3-like tiling window manager. Workspaces are numbered `1..9,0`.
- [SketchyBar](https://github.com/FelixKratz/SketchyBar) – status bar, configured in Lua (SbarLua). Shows the focused AeroSpace workspace and the apps open in it.
- [JankyBorders](https://github.com/FelixKratz/JankyBorders) – colored border around the focused window.

### 🖥️ Shell & Terminal
- [Ghostty](https://ghostty.org/) – GPU-accelerated terminal.
- [tmux](https://github.com/tmux/tmux) – terminal multiplexer. Ghostty forwards its window-switching keys (`cmd+t`, `ctrl+tab`, `ctrl+shift+tab`) to tmux's prefix table.
- [Fish](https://fishshell.com/) / [Zsh](https://www.zsh.org/) – shells.
- [Starship](https://starship.rs/) – minimal, blazing-fast, cross-shell prompt.

### 💻 Editors
- [Neovim](https://neovim.io/) ([LazyVim](https://www.lazyvim.org/)-based).
- [Zed](https://zed.dev/)

## Installation

```bash
git clone https://github.com/kevfarid/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`install.sh` symlinks each tool's config directory into `~/.config/<tool>`
(see `setup/symlinks.sh` for the full list) plus `starship.toml` and `.zshrc`.

SketchyBar's Lua config additionally needs its own dependencies (Lua,
SbarLua, fonts) — see `sketchybar/helpers/install.sh` before starting it.
