#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh" # Loads all defined colors

# SPACE_CLICK_SCRIPT="yabai -m space --focus $SID 2>/dev/null"

# if [ "$SELECTED" = "true" ]; then
# 	sketchybar --animate tanh 5 --set "$NAME" \
# 		icon.color="$RED" \
# 		icon="${SPACE_ICONS[$SID - 1]}" \
# 		click_script="$SPACE_CLICK_SCRIPT"
# else
# 	sketchybar --animate tanh 5 --set "$NAME" \
# 		icon.color="$COMMENT" \
# 		icon="${SPACE_ICONS[$SID - 1]}" \
# 		click_script="$SPACE_CLICK_SCRIPT"
# fi


sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=0x44ffffff \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="./aerospace.sh $sid"
done
