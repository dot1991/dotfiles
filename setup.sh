#!/bin/sh

INSTALL_SCRIPT="install"
UNINSTALL_SCRIPT="uninstall"

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SELF="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 || exit 1 ; pwd -P )"

exit 1

install_from() {
	for folder in "$@"; do
		[ -d "$folder" ] && \
		[ -x "$folder/$INSTALL_SCRIPT" ] && \
		printf "\nInstalling %s\n" "$(basename "$folder")" && \
		env -C "$folder" "ROOT=$SELF" "./$INSTALL_SCRIPT"
	done
}

uninstall_from() {
	for folder in "$@"; do
		[ -d "$folder" ] && \
		[ -x "$folder/$UNINSTALL_SCRIPT" ] && \
		printf "\nUninstalling %s\n" "$(basename "$folder")" && \
		env -C "$folder" "ROOT=$SELF" "./$UNINSTALL_SCRIPT"
	done
}

if [ $# -lt 2 ]; then
	cat << EOF
Usage: $0 [command] [selector/folder]

Commands:
---------
install   - Runs install.sh from each folder specified 
uninstall - Runs uninstall.sh from each folder specified

Selectors:
----------
all       - Everything
EOF
	exit 0
fi

cd "$SELF" || exit 1
case "$1" in
	"install")
		shift
		if [ "$1" = "all" ]; then
			install_from ./*
			exit 0
		fi

		install_from "$@"
	;;
	"uninstall")
		shift
		if [ "$1" = "all" ]; then
			uninstall_from ./*
			exit 0
		fi

		uninstall_from "$@"
	;;
	*)
		printf "Unknown command\n"
	;;
esac
