#!/bin/sh

key='pzarganitis@gmail.com'
archive='tar.bz2'
tarflags='j'
ext='local'

# or load from config, if it exists
[ -r './config' ] && . "./config"

tar='/usr/bin/tar'
gpg='/usr/bin/gpg'

umask 077

out="$(basename "$PWD")"

files="$(find . -name "*.${ext}" -printf '%p ')"

encrypt() {
	if [ -z "$files" ]; then
		printf '\e[0;31m[x]\e[0m Cannot find files.\n'
		exit 1
	fi

	$tar -c${tarflags}f - -- $files | $gpg -er "${key}" -o "${out}.${archive}.gpg"
}

decrypt() {
	if [ ! -r "${out}.${archive}.gpg" ]; then
		printf '\e[0;31m[x]\e[0m Cannot find archive.\n'
		exit 1
	fi

	$gpg -d "${out}.${archive}.gpg" | $tar -x${tarflags}f -
}

usage() {
	printf "Usage: %s [command]\n" "$0"
	printf "\n"
	printf "Commands:\n"
	printf "=========\n"
	printf "e - Encrypt\n"
	printf "d - Decrypt\n"
}

case "$1" in
"e")
	encrypt
	;;
"d")
	decrypt
	;;
*)
	usage
	;;

esac
