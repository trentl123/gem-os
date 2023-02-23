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
  accountFile = io.open('/gemos/data/accounts', 'a')
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
