#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Map workspace names/numbers to icons.
workspace_icon() {
    local ws="$1"
    local ws_lower

    ws_lower="$(printf '%s' "$ws" | tr '[:upper:]' '[:lower:]')"

    case "$ws_lower" in
        terminal) echo "󰊠" ;;
        dev) echo "󰅩" ;;
        web) echo "󰖟" ;;
        media) echo "󰝚" ;;
        others) echo "" ;;
        design) echo "󰸌" ;;
        work) echo "󰌢" ;;
        chat) echo "󰭹" ;;
        *) echo "•" ;;
    esac
}

ICON="$(workspace_icon "$1")"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" \
        icon.drawing=off \
        label="$ICON" \
        label.color=0xfff5f5f5 \
        background.drawing=off
else
    sketchybar --set "$NAME" \
        icon.drawing=off \
        label="$ICON" \
        label.color=0xff7f8490 \
        background.drawing=off
fi
