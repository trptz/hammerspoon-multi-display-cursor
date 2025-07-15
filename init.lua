-- Configuration
local HOTKEY_MODS = { "cmd", "shift", "ctrl" }

-- Helper functions
local function moveToScreenCenter(screen)
  if not screen then return false end
  
  local center = hs.geometry.rectMidPoint(screen:fullFrame())
  hs.mouse.setAbsolutePosition(center)
  return true
end

local function moveToDisplay(displayNumber)
  local screens = hs.screen.allScreens()
  
  if displayNumber > #screens then
    hs.alert.show("Display " .. displayNumber .. " not found")
    return
  end
  
  local targetScreen = screens[displayNumber]
  local currentScreen = hs.mouse.getCurrentScreen()
  
  if currentScreen ~= targetScreen then
    moveToScreenCenter(targetScreen)
  end
end

local function moveToNextDisplay()
  local current = hs.mouse.getCurrentScreen()
  local next = current:next()
  
  if next and next ~= current then
    moveToScreenCenter(next)
  end
end

local function moveToPreviousDisplay()
  local current = hs.mouse.getCurrentScreen()
  local prev = current:previous()
  
  if prev and prev ~= current then
    moveToScreenCenter(prev)
  end
end

-- Hotkey bindings
-- Number keys for direct display selection
for i = 1, 9 do
  hs.hotkey.bind(HOTKEY_MODS, tostring(i), function()
    moveToDisplay(i)
  end)
end

-- Arrow keys for sequential navigation
hs.hotkey.bind(HOTKEY_MODS, "right", moveToNextDisplay)
hs.hotkey.bind(HOTKEY_MODS, "left", moveToPreviousDisplay)