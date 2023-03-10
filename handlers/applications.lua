ApplicationHandler = {}

function ApplicationHandler:open(appname)
  local path = "/gemos/applications/" .. appname
  sys.execute(path .. "/main.lua")
end
function ApplicationHandler:list()
  return fs.list("/gemos/applications")
end
function ApplicationHandler:prlist()
  for x, _ in pairs(applist) do
    io.write("\n" .. x)
  end
end
