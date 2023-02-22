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

Error = {}
--[[
  The Error class will handle and keep track of the operating system's errors.
  
  Methods:
    run (errcode)  - Creates a new error object.
    parseCode (errcode)  - Converts the code into a string error message.
  ]]
function Error:new(errcode)
  local t = setmetable({}, { __index = Error})
  t.code = errcode
  return t
end
function Error:parseCode(errcode)
  local errorCodes = {
    [1] = "That file/directory doesn't exist or cannot be found.",
    [2] = "That file/directory could not be created.",
    [3] = "That file/directory cannot be removed."
    [4] = "You cannot modify essential operating system files."
  }
  return errorCodes[errcode]
end

FileExplorer = {}
--[[
  The FileExplorer class is designed to create a new instance of a file explorer inside the operating system.
  
  Glossary:
    Pointer - The current directory of the explorer

  Methods:
    start (pointer) (installDir)  - Creates a new FileExplorer object
    setPointer (path)   - Sets the explorer's directory pointer
    getPointer  - Gets the explorer's directory pointer
    mkDir (path) (withPath)  - Make a directory
    remove (path)  - Removes whatever files are found at the path
  ]]
function FileExplorer:new(pointer, installDir)
  local t = setmetatable({}, { __index = FileExplorer })
  t.installdir = installDir
  t.pointer = pointer
  return t
end
function FileExplorer:setPointer(path)
  if (fs.exists(path)) then
    self.pointer = path
    return true
  end
    return Error:new(1)
end
function FileExplorer:getPointer()
  return pointer
end
function FileExplorer:mkDir(name, withPath)
  if (withPath == false) then
    fs.makedir(self.pointer .. name)
    return true
  else
    fs.makeDir(name)
    return true
  end
  return Error:new(2)
end
function FileExplorer:remove(name, withPath)
  if (withPath == false) then
    fs.delete(self.pointer .. name)
    return true
  else
    fs.delete(name)
    return true
  end
  return Error:new(3)
end
function FileExplorer:list(dir)
  if (fs.exists(dir)) then
    return fs.list
  end
  return Error:new(1)
end
function FileExplorer:getPathAbove(path)
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
