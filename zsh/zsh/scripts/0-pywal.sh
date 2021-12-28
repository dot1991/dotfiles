apply_pywal_colors() {
	if tty | grep -q tty; then
		test -r "$HOME/.cache/wal/colors-tty.sh" && . "$HOME/.cache/wal/colors-tty.sh"
	else
		test -r "$HOME/.cache/wal/sequences" && /bin/cat "$HOME/.cache/wal/sequences"
	fi
}

test -z "${PYWAL}" && apply_pywal_colors
