#!/usr/bin/env sh

yabai --stop-service
brew services stop sketchybar
skhd --stop-service

echo "yabai, sketchybar and skhd stopped."
