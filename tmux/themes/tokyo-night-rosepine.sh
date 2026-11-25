#!/usr/bin/env bash
# Rosé Pine palette mapped onto tokyo-night-tmux's THEME keys.
# Replaces the plugin's src/themes.sh via scripts/tokyo-night-rosepine.sh,
# so the layout is tokyo-night-tmux but the colors match Ghostty / nvim / borders.

declare -A THEME=(
  ["background"]="#0b0a10" # bar bg (same as Ghostty)
  ["foreground"]="#908caa" # subtle
  ["black"]="#26233a"      # overlay
  ["blue"]="#c4a7e7"       # iris: session block, active border
  ["cyan"]="#9ccfd8"       # foam
  ["green"]="#9ccfd8"      # foam: active window icon
  ["magenta"]="#c4a7e7"    # iris
  ["red"]="#eb6f92"        # love
  ["white"]="#e0def4"      # text
  ["yellow"]="#f6c177"     # gold

  ["bblack"]="#1f1d2e"     # surface: active window bg
  ["bblue"]="#c4a7e7"
  ["bcyan"]="#9ccfd8"
  ["bgreen"]="#31748f"     # pine
  ["bmagenta"]="#c4a7e7"
  ["bred"]="#eb6f92"
  ["bwhite"]="#6e6a86"     # muted
  ["byellow"]="#f6c177"
)

if [ "$(tmux show-option -gv @tokyo-night-tmux_transparent 2>/dev/null)" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']="#9ccfd8"
THEME['ghmagenta']="#c4a7e7"
THEME['ghred']="#eb6f92"
THEME['ghyellow']="#f6c177"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
