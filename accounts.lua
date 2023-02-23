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
    setAccountPreferences (preference) (newValue)  - Set a preference or setting on the user's account.
    getAccountPreferences (preference)  - Returns a preference of the user's account.
    loginAccount  - 
    logoutAccount  - 
    setAccountPrivileges  - 
    getAccountPrivileges  - 
]]
function AccountHandler:createAccount(username, password, homePath, privileges, preferences)
  if (self.instanceAlive == true) then return false end
  local t = setmetable({}, { __index = AccountHandler})
  t.instanceAlive = false
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
  return t
end
function AccountHandler:translatePreferenceCode(title)
  if (self.instanceAlive == true) then return false end
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
  if (self.instanceAlive == true) then return false end
  local filepath = '/gemos/data/.accounts/' .. username
  fs.delete(filepath())
  fs.delete('/gemos/home/' .. homePath)
  self.instanceAlive = true
end
function AccountHandler:setAccountPreferences(preference, newValue)
  if (self.instanceAlive == true) then return false end
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
function AccountHandler:getAccountPreferences(preference)
  if (self.instanceAlive == true) then return false end
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
  
