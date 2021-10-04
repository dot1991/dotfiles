#!/usr/bin/env /usr/bin/bash
#
# 	A simple script to manage your backlight
#
# 	Usage: ./backlight.sh [cmd] [val]
#
# 	Commands:
# 	   set - Set the backlight to a predetermined value
# 	   inc - Increase the brightness by val
# 	   dec - Decrease the brightness by val
# 	no cmd - Get current brightness
#

backlight="/usr/bin/xbacklight"

min=85

get_brightness() {
	#$backlight -get
	qdbus-qt5 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightness
}

set_brightness() {
	#$backlight -set $1
	qdbus-qt5 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl setBrightness $1
}

get_steps() {
	#echo -n 5
	#qdbus-qt5 local.org_kde_powerdevil /org/kde/Solid/PowerManagement/Actions/BrightnessControl brightnessSteps
	echo -n 80
}

# $1 - amount to increase by
increase_by() {
	#$backlight -inc $1

	set_brightness $(($(get_brightness) + $1))
}

decrease_by() {
	local new=$(($(get_brightness) - $1))

	if [ $new -lt $min ]; then
		new=$min
	fi

	set_brightness $new
}

#
# $1 - inc, dec or empty
#

case "$1" in

	*"inc")
		increase_by $(get_steps)
	;;

	*"dec")
		decrease_by $(get_steps)
	;;

	*"set")
		set_brightness $2
	;;

	*)
		get_brightness
	;;
esac
