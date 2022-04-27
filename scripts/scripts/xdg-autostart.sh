#!/bin/bash

declare -a commands

for i in /etc/xdg/autostart/* ~/.config/autostart/*; do
	commands+=("$(sed -nr 's/^Exec=(.*)$/\1/p' "$i")")
done

for i in "${commands[@]}"; do
	echo "[*] Launching: $i"
	$i &!
done
