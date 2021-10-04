banner() {
#	neofetch --kitty $_zshdir/logo/logo3/final.png --size 375px \
#		--gtk2 off --gtk3 off \
#		--gtk_shorthand on \
#		--speed_shorthand on \
#		--memory_unit gib \
#		--kernel_shorthand on \
#		--disable gpu \
#		$1
#	freshfetch
#	cat $_zshdir/logo
#	echo
	fetch
}

# Check if the variable BANNER is set,
# if yes then dont display the banner
# Useful for applications with integrated
# terminals, such as Visual Studio Code
test "${BANNER+x}" || banner
