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
    getAccountPreferences  - 
    loginAccount  - 
    logoutAccount  - 
    setAccountPrivileges  - 
    getAccountPrivileges  - 
]]
function AccountHandler:createAccount(username, password, homePath, privileges, preferences)
  local filepath = '/gemos/data/.accounts/' .. username
  accountFile = io.open(filepath, 'a')
  accountFile.write(username .. "¬sep¬")
  accountFile.write(password .. "¬sep¬")
  accountFile.write(homePath .. "¬sep¬")
  accountFile.write(privileges .. "¬sep¬")
  accountFile.write(preferences["theme"] .. "¬sep¬")
  accountFile.write(preferences["alias"] .. "¬sep¬")
  accountFile.write("\n")
  accountFile.close()
  fs.makeDir('/gemos/home/' .. homePath .. '/Documents/')
  fs.makeDir('/gemos/home/' .. homePath .. '/Downloads/')
  fs.makeDir('/gemos/home/' .. homePath .. '/Recycle Bin/')
end
function AccountHandker:removeAccount(username)
  local filepath = '/gemos/data/.accounts/' .. username
  fs.delete(filepath())
  fs.delete('/gemos/home/' .. homePath)
end
function AccountHandler:setAccountPreferences(preference, newValue)
  filepath = '/gemos/data/.accounts/ .. username
  local contents = fs.open(filepath, 'r')
  contents = splitBy(contents, '¬sep¬')
  for 
