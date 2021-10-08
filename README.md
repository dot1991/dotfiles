# dotfiles

### How to install

Run:
```
$ ./run.sh install [specific folder]
```

For example:
```
$ ./run.sh install nvim
```
would only install the configuration files for neovim

### How to uninstall
Same as the install process, except instead of `./run.sh install` you do `./run.sh uninstall`

### Module example
```bash
module folder
	|
	|____ install # installer script
	|
	|____ uninstall # uninstall script
	|
	|
	|____ other files...
```

Installer/Uninstaller script template
```bash
#!/bin/sh
set -e
. "$ROOT/settings.sh"
```
