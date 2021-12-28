banner() {
	fetch
}

# Check if the variable BANNER is set,
# if yes then dont display the banner
# Useful for applications with integrated
# terminals, such as Visual Studio Code
test -z "${BANNER}" && banner
