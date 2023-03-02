--[[
  The OS stores temporary data with virtual memory
  Applications can also use this data to store data should they need to
  It's best not to mess with existing data but it's possible
  ]]

MemoryManager = {}

function MemoryManager:append(dataId, contents, overwrite)
  if fs.exists("/gemos/memory/." .. dataId) then
    if overwrite then
      fs.delete("/gemos/memory/." .. dataId)
      local toAppend = fs.open("/gemos/memory/." .. dataId, "w")
      toAppend.write(contents)
    else return
  local toAppend = fs.open("/gemos/memory/." .. dataId, "w")
  toAppend.write(contents)
