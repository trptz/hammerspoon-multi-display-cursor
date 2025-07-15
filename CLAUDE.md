# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hammerspoon configuration project that provides multi-display cursor movement functionality for macOS. Users can press Cmd+Ctrl+[1-9] to instantly move their cursor to the center of the corresponding display.

## Development Setup

1. **Installation**: Copy `init.lua` to `~/.hammerspoon/` directory
2. **Reload Configuration**: Use Hammerspoon's reload feature or restart the application
3. **Testing**: Connect multiple displays and test hotkeys Cmd+Ctrl+[1-9]

## Code Architecture

The project consists of a single `init.lua` file that:
- Creates 9 hotkey bindings (Cmd+Ctrl+1 through Cmd+Ctrl+9)
- Each hotkey moves the cursor to the center of the corresponding display number
- Validates display existence and skips movement if already on target display
- Shows user alerts for invalid display numbers

## Key Implementation Details

- Uses `hs.screen.allScreens()` to get all connected displays
- Uses `hs.mouse.getAbsolutePosition()` to get current cursor position
- Uses `hs.screen.find()` to identify current screen from cursor position
- Moves cursor with `hs.mouse.setAbsolutePosition()` to screen center

## Common Tasks

- **Add new hotkey combinations**: Modify the `hs.hotkey.bind` parameters in init.lua
- **Change cursor destination**: Modify the calculation in `targetScreen:absoluteToLocal(targetScreen:frame().center)`
- **Add more display support**: Extend the loop beyond 9 if needed