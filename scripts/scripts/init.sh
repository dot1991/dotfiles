#!/bin/sh

xinput set-prop 'synps/2 synaptics touchpad' 'libinput disable while typing enabled' 0
picom -b --experimental-backends &!
feh --bg-fill ~/.local/share/wallpapers/current

# Start polybar again
screens=($(xrandr | sed -nr 's|^(.*) connected.*$|\1|p'))

for screen in "${screens[@]}"; do
	polybar "$screen" >/dev/null 2>&1 &!
done

dunst &!

lightcord &!

kbd-backlight default

kdeconnect-indicator &!


