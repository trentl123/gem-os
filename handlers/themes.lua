require('/gemos/sys/imports')
Import:errors()
ThemeHandler = {}
--[[
  The ThemeHandler class is designed to handle the OS' colour codes.


  Methods:
    getTheme  - Get the current theme installed on the OS.
    setTheme  - Set a new theme for the OS.
    getColours  - Get the colours of the current theme.
  ]]

function ThemeHandler:getTheme()
  if (fs.exists('/gemos/data/theme')) then
    local themeFile = fs.open('/gemos/data/theme', 'r')
    return themeFile.readAll()
  else
    return Error:new(5)
  end
end
function ThemeHandler:setTheme(newTheme)
  if (fs.exists('/gemos/data/theme')) then
    local themeFile = fs.open('/gemos/data/theme', 'w')
    themeFile.write(newTheme)
    return true
  else
    return Error:new(5)
  end
end
function ThemeHandler:getColours()
  local ThemeCodes = {
    -- [PRIMARY, SECONDARY, WARNING, INFORMATION]
    [1] = {"red", "dark_red", "orange", "yellow"}, -- Ruby Theme
    [2] = {"light_blue", "blue", "red", "yellow"} -- Sapphire theme
  }
  if (ThemeHandler:getTheme() == "ruby") then return ThemeCodes[1] end
  if (ThemeHandler:getTheme() == "sapphire") then return ThemeCodes[2] end
end
