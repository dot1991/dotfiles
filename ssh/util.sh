#!/bin/sh
set -e

help() {
	cat << EOF
Usage: $0 [command] [key id] [files...]

Commands:
---------
enc - Encrypts the specified files
dec - Decrypts the specified files
EOF
}

encrypt() {
	tar jcvf "$temp/$out.tar.bz2" "$@"
	gpg -er "$keyid" "$temp/$out.tar.bz2"
	mv "$temp/$out.tar.bz2.gpg" .
}

decrypt() {
	gpg -do "$temp/$out.tar.bz2" "$out.tar.bz2.gpg"
	tar jxvf "$temp/$out.tar.bz2"
	rm -rf -- "$out.tar.bz2.gpg"
}

# u=rwx g= o=
umask 077




out="${OUT:=$(basename "$PWD")}"

command="$1"
shift

temp="$(mktemp -d)"
case "$command" in
	"enc")
		keyid="$1"
		shift
		encrypt "$@"
	;;
	"dec")
		decrypt "$@"
	;;
	*)
	;;
esac
rm -rf -- "$temp"
