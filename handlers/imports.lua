import = {}
function import:accounts()
  return require("handlers/accounts.lua")
end
function import:applications()
  return require("handlers/applications.lua")
end
function import:colour()
  return require("handlers/colour.lua")
end
function import:errors()
  return require("handlers/errors.lua")
end
function import:fileexplorer()
  return require("handlers/fileexplorer.lua")
end
function import:notifications()
  return require("handlers/notifications.lua")
end
function import:themes()
  return require("handlers/themes.lua")
end
function import:memory()
  return require("handlers/memory.lua")
end
