#!/bin/sh

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then

swaybg -m fill -i ~/.local/share/wallpapers/current

else

xinput set-prop 'synps/2 synaptics touchpad' 'libinput disable while typing enabled' 0
picom -b --experimental-backends &!
feh --bg-fill ~/.local/share/wallpapers/current

# Start polybar again
screens=($(xrandr | sed -nr 's|^(.*) connected.*$|\1|p'))

for screen in "${screens[@]}"; do
	polybar "$screen" >/dev/null 2>&1 &!
done

fi

dunst &!

discord &!

kbd-backlight default

kdeconnect-indicator &!


