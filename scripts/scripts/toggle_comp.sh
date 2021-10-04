#!/usr/bin/bash
#
# 	A script to toggle the compositor on and off. Useful for games
#
# 	Bind the execution of the script to a shortcut and it will do the rest
#

set -e

comp="picom"
cmd="$comp -b --experimental-backends"

if [[ -z "$(pgrep $comp)" ]]; then
	$cmd
	/usr/bin/notify-send 'Compositing' 'Enabled. Press Win+Shift+F10 to disable'
else
	pgrep $comp | xargs kill
	/usr/bin/notify-send 'Compositing' 'Disabled. Press Win+Shift+F10 to enable'
fi
