-- Configuration
local HOTKEY_MODS = { "cmd", "shift", "ctrl" }

-- Store cursor positions for each screen
local cursorPositions = {}

-- Helper functions
local function saveCursorPosition(screen)
  if not screen then return end
  
  local screenId = screen:getUUID()
  local currentPos = hs.mouse.absolutePosition()
  cursorPositions[screenId] = currentPos
end

local function restoreCursorPosition(screen)
  if not screen then return false end
  
  local screenId = screen:getUUID()
  local savedPos = cursorPositions[screenId]
  
  if savedPos then
    hs.mouse.setAbsolutePosition(savedPos)
    return true
  else
    local center = hs.geometry.rectMidPoint(screen:fullFrame())
    hs.mouse.setAbsolutePosition(center)
    return false
  end
end

local function activateLastAppOnScreen(screen)
  if not screen then return false end
  
  local windows = hs.window.orderedWindows()
  
  for _, window in ipairs(windows) do
    if window:screen() == screen and window:isVisible() and window:isStandard() then
      window:application():activate()
      window:focus()
      return true
    end
  end
  
  return false
end

local function moveToScreen(screen)
  if not screen then return false end
  
  local currentScreen = hs.mouse.getCurrentScreen()
  
  -- Save cursor position on current screen before moving
  if currentScreen and currentScreen ~= screen then
    saveCursorPosition(currentScreen)
  end
  
  -- Restore cursor position on target screen
  restoreCursorPosition(screen)
  
  activateLastAppOnScreen(screen)
  
  return true
end

local function moveToDisplay(displayNumber)
  local screens = hs.screen.allScreens()
  
  if displayNumber < 1 or displayNumber > #screens then
    return
  end
  
  local targetScreen = screens[displayNumber]
  local currentScreen = hs.mouse.getCurrentScreen()
  
  if currentScreen ~= targetScreen then
    moveToScreen(targetScreen)
  end
end

local function moveToNextDisplay()
  local current = hs.mouse.getCurrentScreen()
  local next = current:next()
  
  if next and next ~= current then
    moveToScreen(next)
  end
end

local function moveToPreviousDisplay()
  local current = hs.mouse.getCurrentScreen()
  local prev = current:previous()
  
  if prev and prev ~= current then
    moveToScreen(prev)
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