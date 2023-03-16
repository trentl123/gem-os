function runCommand(arguments, flags)
  if #arguments < 2 then return false end -- Error return here
  local username = arguments[2]
  local a = require('/gemos/handlers/accounts.lua')
  if a.AccountHandler:exists(username) then return false end -- Error return here
  io.write("\nPlease enter a valid password (Minimum 5 characters)")
  while true do
    local password = io.read("\nPassword: ")
    local confirmPassword = io.read("\nConfirm: ")
    if password == confirmPassword and #password >= 5 then
      break
    end
  end
  local alias = io.read("\nEnter an alias (Optional, leave blank if not.)\nAlias: ")
  if #alias < 1 then
    alias = "-NOALIAS"
  local homePath = '/gemos/home/' .. username
  local privileges = 1
  local selectedTheme = 1
  local themeSelect = {"Ruby Theme", "Sapphire Theme"}
  while true do
    keyPressed = False
    for x, _ in pairs(themeSelect) do
      if x == selectedTheme-1 then
        start = ">"
      else
        start = " "
      end
      io.write("\n" .. start .. themeSelect[x])
    end
    local event, key, isHeld = os.pullEvent("key")

    if key == keys.down and selectedTheme ~>1 then
      selectedTheme = selectedTheme + 1
    elseif key == keys.up and selectedTheme ~< 0 then
      selectedTheme = selectedTheme - 1
    elseif key == keys.enter then
      local translation = {
        [1] = "ruby",
        [2] = "sapphire"
      }
      local theme = translation[selectedTheme]
      break
     end
    break
    end
  end
  local preferences = {["theme"] = theme, ["alias"] = alias}
  a.AccountHandler:createAccount(username, password, homePath, privileges, preferences)
  io.write("\nAccount Created.")
end
