#!/bin/sh

launch() {
	sway --my-next-gpu-wont-be-nvidia
}

[ "$(tty)" = "/dev/tty1" ] && launch
