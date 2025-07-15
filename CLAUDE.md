# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Hammerspoon configuration project that provides multi-display cursor movement functionality for macOS. Users can press Cmd+Shift+Ctrl+[1-9] to instantly move their cursor to the center of the corresponding display, or use arrow keys for sequential navigation.

## Development Setup

1. **Installation**: Create directory if needed and copy file: `mkdir -p ~/.hammerspoon && cp init.lua ~/.hammerspoon/`
2. **Reload Configuration**: Use Hammerspoon's reload feature or restart the application
3. **Testing**: Connect multiple displays and test hotkeys

## Code Architecture

The `init.lua` file follows a modular structure:

### Configuration
- `HOTKEY_MODS` constant defines the modifier keys (currently `{"cmd", "shift", "ctrl"}`)

### Helper Functions
- `moveToScreenCenter(screen)` - Moves cursor to center of given screen
- `moveToDisplay(displayNumber)` - Handles direct display selection with validation
- `moveToNextDisplay()` - Navigates to next display in sequence
- `moveToPreviousDisplay()` - Navigates to previous display in sequence

### Hotkey Bindings
- Number keys (1-9) for direct display selection
- Arrow keys (left/right) for sequential navigation

## Key Implementation Details

- Uses `hs.screen.allScreens()` to get all connected displays
- Uses `hs.mouse.getCurrentScreen()` to identify current screen
- Uses `hs.geometry.rectMidPoint()` for calculating screen centers
- Uses `screen:next()` and `screen:previous()` for sequential navigation
- Moves cursor with `hs.mouse.setAbsolutePosition()`

## Common Tasks

- **Change hotkey combination**: Modify the `HOTKEY_MODS` variable
- **Change cursor destination**: Modify the `moveToScreenCenter()` function
- **Add more display support**: Change the loop limit in hotkey bindings section
- **Add new navigation methods**: Create new helper functions and bind them to hotkeys