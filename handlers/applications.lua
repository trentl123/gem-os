ApplicationHandler = {}

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

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
function ApplicationHandler:info(app)
  local manifest = fs.open("/gemos/applications/" .. app .. "/app.manifest", "r")
  manifest
end