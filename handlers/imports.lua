Import = {}
function Import:accounts()
  return require("/gemos/sys/handlers/accounts")
end
function Import:applications()
  return require("/gemos/sys/handlers/applications")
end
function Import:colour()
  return require("/gemos/sys/handlers/colour")
end
function Import:errors()
  return require("/gemos/sys/handlers/errors")
end
function Import:fileexplorer()
  return require("/gemos/sys/handlers/fileexplorer")
end
function Import:notifications()
  return require("/gemos/sys/handlers/notifications")
end
function Import:themes()
  return require("/gemos/sys/handlers/themes")
end
function Import:memory()
  return require("/gemos/sys/handlers/memory")
end
