os.loadAPI("/handlers/accounts.lua")
os.loadAPI("/handlers/colour.lua")
function splitLines(str)
  local result = {}
  for line in str:gmatch '[^\n]+' do
    table.insert(result, line)
  end
  return result
end

function splitPath(path)
  local result = ""
  for eachDirectory in path:gmatch '[^/]+' do
    table.insert(result, eachDirectory)
  end
  return result
end

function getTableLength(table)
  local count = 0
  for _ in pairs(table) do
    count = count + 1
  end
  return count
end


