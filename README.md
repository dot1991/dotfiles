# dotfiles

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