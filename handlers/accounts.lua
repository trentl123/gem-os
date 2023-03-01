function splitBy(str, splitBy)
  local result = {}
  local regex = '[^' .. splitBy .. ']+'
  for line in str:gmatch(regex) do
    table.insert(result, line)
  end
  return result
end

AccountHandler = {}
--[[
  The AccountHandler class is designed to handle the management of user accounts on the OS.

  Methods:
    createAccount (username) (password) (homePath) (priviliges) (preferences)  - Create a new user account on the OS.
    removeAccount (username)  - Remove the user account from the OS.
    setAccountPreferences (username) (preference) (newValue)  - Set a preference or setting on the user's account.
    getAccountPreferences (username) (preference)  - Returns a preference of the user's account.
    loginAccount (username) (password)  - Attempts an account login and returns true/false.
]]
function AccountHandler:createAccount(username, password, homePath, privileges, preferences)
  local filepath = '/gemos/data/.accounts/' .. username
  accountFile = io.open(filepath, 'a')
  accountFile.write("usr¬" .. username .. "¬sep¬")
  accountFile.write("pss¬" .. password .. "¬sep¬")
  accountFile.write("hmp¬" .. homePath .. "¬sep¬")
  accountFile.write("prv¬" .. privileges .. "¬sep¬")
  accountFile.write("thm¬" .. preferences["theme"] .. "¬sep¬")
  accountFile.write("als¬" .. preferences["alias"] .. "¬sep¬")
  accountFile.write("\n")
  accountFile.close()
  fs.makeDir('/gemos/home/' .. homePath .. '/Documents/')
  fs.makeDir('/gemos/home/' .. homePath .. '/Downloads/')
  fs.makeDir('/gemos/home/' .. homePath .. '/Recycle Bin/')
end
function AccountHandler:translatePreferenceCode(title)
  local codes = {
    ["username"] = "usr¬",
    ["password"] = "pss¬",
    ["homepath"] = "hmp¬",
    ["privileges"] = "prv¬",
    ["theme"] = "thm¬",
    ["alias"] = "als¬",
  }
  return codes[title]
end
function AccountHandker:removeAccount(username)
  local filepath = '/gemos/data/.accounts/' .. username
  fs.delete(filepath())
  fs.delete('/gemos/home/' .. homePath)
end
function AccountHandler:setAccountPreferences(username, preference, newValue)
  filepath = '/gemos/data/.accounts/' .. username
  local contents = fs.open(filepath, 'r')
  contents = splitBy(contents, '¬sep¬')
  finalString = ""
  for _, eachValue in pairs(contents) do
    if splitBy(eachValue, '¬')[0] == preference then
      finalString = finalString .. newValue .. "¬sep¬"
    else
      finalString = finalString .. eachValue .. "¬sep¬"
    end
  end
end
function AccountHandler:getAccountPreferences(username, preference)
  filepath = '/gemos/data/.accounts/' .. username
  local contents = fs.open(filepath, 'r')
  contents = splitBy(contents, '¬sep¬')
  finalString = ""
  for _, eachValue in pairs(contents) do
    if splitBy(eachValue, '¬')[0] == preference then
      return splitBy(eachValue, '¬')[1]
    end
  end
end
function AccountHandler:loginAccount(username, password)
  filepath = '/gemos/data/.accounts/' .. username
  if fs.exists(filepath) == false then return false end
  if AccountHandler:getAccountPreferences("pss") == password then return true end
  return false
end
