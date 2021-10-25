#!/bin/sh

# Wait until polybar has exited
killall -wq polybar

i3-msg -q restart

feh --bg-fill ~/.local/share/wallpapers/current

# Start polybar again
screens=($(xrandr | sed -nr 's|^(.*) connected.*$|\1|p'))

for screen in "${screens[@]}"; do
	polybar "$screen" >/dev/null 2>&1 &!
done
