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

FileHandler = {}
--[[
  The FileHandler class is designed to create a new instance of a file explorer inside the operating system.
  
  Glossary:
    Pointer - The current directory of the explorer

  Methods:
    start (pointer) (installDir)  - Creates a new FileHandler object
    setPointer (path)   - Sets the explorer's directory pointer
    getPointer  - Gets the explorer's directory pointer
    mkDir (path) (withPath)  - Make a directory
    remove (path)  - Removes whatever files are found at the path
  ]]
function FileHandler:new(pointer, installDir)
  local t = setmetatable({}, {__index = FileHandler})
  t.installdir = installDir
  t.pointer = pointer
  return t
end
function FileHandler:setPointer(path)
  if (fs.exists(path)) then
    self.pointer = path
    return true
  end
    return Error:new(1)
end
function FileHandler:getPointer()
  return pointer
end
function FileHandler:mkDir(name, withPath)
  if (withPath == false) then
    fs.makedir(self.pointer .. name)
    return true
  else
    fs.makeDir(name)
    return true
  end
  return Error:new(2)
end
function FileHandler:remove(name, withPath)
  if (withPath == false) then
    fs.delete(self.pointer .. name)
    return true
  else
    fs.delete(name)
    return true
  end
  return Error:new(3)
end
function FileHandler:list(dir)
  if (fs.exists(dir)) then
    return fs.list
  end
  return Error:new(1)
end
function FileHandler:getPathAbove(path)
  local result
  local count = 0
  for _ in pairs(splitPath(path)) do
    if (count ~= getTableLength) then
      result = result .. eachDirectory .. '/'
    end
    count = count + 1
  end
  return result
end
function FileHandler:copyFile(src, dst, withPath)
  if (withPath == false) then
    src = self.pointer .. src
    dst = self.pointer .. dst
  end
  if file.exists(src) then
    fs.copy(src, dst)
    return true
  end
  return Error:new(1)
end
function FileHandler:copyFile(src, dst, withPath)
  if (withPath == false) then
    src = self.pointer .. src
    dst = self.pointer .. dst
  end
  if file.exists(src) then
    fs.copy(src, dst)
    return true
  end
  return Error:new(1)
end
function FileHandler:moveFile(src, dst, withPath)
  if (withPath == false) then
    src = self.pointer .. src
    dst = self.pointer .. dst
  end
  if file.exists(src) then
    fs.move(src, dst)
    return true
  end
  return Error:new(1)
end
