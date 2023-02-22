FileExplorer = {}
--[[
  The FileExplorer class is designed to create a new instance of a file explorer inside the operating system.
  
  Glossary:
    Pointer - The current directory of the explorer

  Methods:
    start (pointer) (installDir)
    setPointer (path)   - Sets the explorer's directory pointer
    getPointer  - Gets the explorer's directory pointer
    mkDir (path) (withPath)  - Make a directory

  ]]
function FileExplorer:start(pointer, installDir)
  local t = setmetatable({}, { __index = FileExplorer })
  t.installdir = installDir
  t.pointer = pointer
  return t
end
function FileExplorer:setPointer(path)
  if fs.exists(path) == true then
    self.pointer = path
    return true
  return false
end
function FileExplorer:getPointer()
  return pointer
end
function FileExplorer:mkDir(name, withPath)
  if withPath == false then
    fs.makedir(self.pointer+name)
    return true
  else
    fs.makeDir(name)
    return true
  end
  return false
end
function FileExplorer:remove(name, withPath)
  if self.pointer+
  if withPath == false then
    fs.delete(self.pointer+name)
    return true
  else
    fs.delete(name)
    return true
  end
end
function FileExplorer:list(dir)
  
end
