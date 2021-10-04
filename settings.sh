#!/bin/sh
#
#	Don't run this file directly
#	It is designed to be `source`d from other scripts
#

INSTALL_SCRIPT="install"
UNINSTALL_SCRIPT="uninstall"

# Link command
ln() {
	/bin/ln -Tfs "$1" "$2"
}
