#!/bin/sh

launch() {
	export GBM_BACKEND=nvidia-drm
	export __GLX_VENDOR_LIBRARY_NAME=nvidia
	sway --unsupported-gpu
}

