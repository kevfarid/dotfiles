#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh"

# Add aerospace workspace event
sketchybar --add event aerospace_workspace_change

# Add spacer
sketchybar --add item spacer.1 left \
	--set spacer.1 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=10

# Add workspace items keeping AeroSpace order from your bindings.
preferred_order=(terminal dev web media others design work chat)
all_workspaces="$(aerospace list-workspaces --all)"
ordered_workspaces=()

for ws in "${preferred_order[@]}"; do
	if printf '%s\n' "$all_workspaces" | grep -Fxq "$ws"; then
		ordered_workspaces+=("$ws")
	fi
done

while IFS= read -r ws; do
	if [ -z "$ws" ]; then
		continue
	fi
	if [[ ! " ${ordered_workspaces[*]} " =~ " ${ws} " ]]; then
		ordered_workspaces+=("$ws")
	fi
done <<< "$all_workspaces"

for sid in "${ordered_workspaces[@]}"; do
	sketchybar --add item space.$sid left \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		label.font="$FONT:Bold:16.0" \
		background.color=0x44ffffff \
		background.corner_radius=5 \
		background.height=20 \
		background.drawing=off \
		label="$sid" \
		click_script="aerospace workspace $sid" \
		script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add item spacer.2 left \
	--set spacer.2 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=5

sketchybar --add bracket spaces '/space.*/' \
	--set spaces background.border_width="$BORDER_WIDTH" \
	background.border_color="$RED" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

sketchybar --add item separator left \
	\
	icon.font="$FONT:Regular:16.0" \
	background.padding_left=26 \
	background.padding_right=15 \
	label.drawing=off \
	associated_display=active \
	icon.color="$YELLOW"
