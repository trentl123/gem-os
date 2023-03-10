ApplicationHandler = {}

function ApplicationHandler:open(appname)
  path = "/gemos/applications/" .. appname
  sys.execute(path .. "/main.lua")
end
