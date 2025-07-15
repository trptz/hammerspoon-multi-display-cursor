# hammerspoon-multi-display-cursor &middot; [![Lua](https://img.shields.io/badge/Lua-%232C2D72.svg?logo=lua&logoColor=white)](https://www.lua.org/) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/trptz/hammerspoon-multi-display-cursor/issues)

Move cursor across multiple displays using keyboard shortcuts.

For Hammerspoon installation and usage, please refer to: https://github.com/Hammerspoon/hammerspoon

## Features

- `Cmd+Shift+Ctrl+[1-9]` to jump to display 1-9
- `Cmd+Shift+Ctrl+←/→` to navigate between displays sequentially
- Cursor moves to center of target display
- Skips if already on target display
- Shows alert for non-existent displays

## Installation

First, install Hammerspoon from https://github.com/Hammerspoon/hammerspoon

Then install this script:
```bash
mkdir -p ~/.hammerspoon
cp init.lua ~/.hammerspoon/
```

## Usage

### Direct Display Selection
- `Cmd+Shift+Ctrl+1` → Display 1
- `Cmd+Shift+Ctrl+2` → Display 2
- `Cmd+Shift+Ctrl+3` → Display 3
- ... up to Display 9

### Sequential Navigation
- `Cmd+Shift+Ctrl+→` → Next display
- `Cmd+Shift+Ctrl+←` → Previous display

## Customization

Edit `init.lua` to:
- Change hotkey combination (modify `HOTKEY_MODS` variable)
- Change cursor target position
- Support more than 9 displays

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.