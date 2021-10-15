#!/bin/sh

picom -b --experimental-backends &!
feh --bg-scale ~/.local/share/wallpapers/current
polybar edp1 &!
dunst &!
lightcord &!
kbd-backlight default
xinput set-prop 'synps/2 synaptics touchpad' 'libinput disable while typing enabled' 0
kdeconnect-indicator &!


