import = {}
function import:accounts()
  return require("/gemos/sys/handlers/accounts.lua")
end
function import:applications()
  return require("/gemos/sys/handlers/applications.lua")
end
function import:colour()
  return require("/gemos/sys/handlers/colour.lua")
end
function import:errors()
  return require("/gemos/sys/handlers/errors.lua")
end
function import:fileexplorer()
  return require("/gemos/sys/handlers/fileexplorer.lua")
end
function import:notifications()
  return require("/gemos/sys/handlers/notifications.lua")
end
function import:themes()
  return require("/gemos/sys/handlers/themes.lua")
end
function import:memory()
  return require("/gemos/sys/handlers/memory.lua")
end
