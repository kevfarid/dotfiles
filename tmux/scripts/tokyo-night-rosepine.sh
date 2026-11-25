#!/usr/bin/env bash
# Runs tokyo-night-tmux with our Rosé Pine palette, without editing the plugin
# (so `prefix + U` updates keep working).
#
# Builds ~/.cache/tmux/tokyo-night-rosepine/ (outside plugins/ so tpm clean keeps it) as a mirror of the plugin where:
#   - src/themes.sh  -> themes/tokyo-night-rosepine.sh
#   - src/*.sh       -> copies using Homebrew bash (needs bash 4+) and with the
#                       hardcoded tokyo bg (#15161e) swapped for ours
#   - lib/, tokyo-night.tmux -> symlinks
# Then appends CPU/RAM (tmux-cpu) to the right side of the bar.

TMUX_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PLUGIN="$TMUX_DIR/plugins/tokyo-night-tmux"
WRAP="${XDG_CACHE_HOME:-$HOME/.cache}/tmux/tokyo-night-rosepine"
BASH_BIN="$(command -v /opt/homebrew/bin/bash || command -v /usr/local/bin/bash || echo bash)"
BG="#0b0a10"

[ -d "$PLUGIN" ] || exit 0

# tmux-continuum auto-saves via a #() hook in status-right; keep it.
continuum="$(tmux show -gv status-right | grep -o '#([^)]*continuum_save.sh)')"

rm -rf "$WRAP"
mkdir -p "$WRAP/src"
ln -s "$PLUGIN/lib" "$WRAP/lib"
ln -s "$PLUGIN/tokyo-night.tmux" "$WRAP/tokyo-night.tmux"

for f in "$PLUGIN"/src/*.sh; do
  name="$(basename "$f")"
  [ "$name" = "themes.sh" ] && continue
  sed -e "1s|^#!.*bash.*|#!$BASH_BIN|" -e "s/#15161e/$BG/g" "$f" >"$WRAP/src/$name"
  chmod +x "$WRAP/src/$name"
done
cp "$TMUX_DIR/themes/tokyo-night-rosepine.sh" "$WRAP/src/themes.sh"

"$BASH_BIN" "$WRAP/tokyo-night.tmux"

# CPU / RAM before the tokyo widgets (tmux-cpu interpolates these afterwards)
cpu="#[bg=$BG]#{cpu_fg_color} \uf4bc #{cpu_percentage} #{ram_fg_color}\U000f035b #{ram_percentage} "
tmux set -g status-right "$(printf "$cpu")$(tmux show -gv status-right)$continuum"
