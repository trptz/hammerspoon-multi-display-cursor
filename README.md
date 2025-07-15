# hammerspoon-multi-display-cursor

Move cursor across multiple displays using keyboard shortcuts.

## Features

- `Cmd+Shift+Ctrl+[1-9]` to jump to display 1-9
- `Cmd+Shift+Ctrl+←/→` to navigate between displays sequentially
- Cursor moves to center of target display
- Skips if already on target display
- Shows alert for non-existent displays

## Installation

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

## License

MIT License

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.