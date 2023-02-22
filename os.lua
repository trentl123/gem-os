ErrorHandler = {}
--[[
  The ErrorHandler class will handle and keep track of the operating system's errors.

  ]]
function ErrorHandler:start(errtype, errcode)
  local t = setmetable({}, { __index = ErrorHandler})
  t.type = errtype
  t.code = errcode
  return t
end


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
    remove (path)  - Removes whatever files are found at the path
  ]]
function FileExplorer:start(pointer, installDir)
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
  return false
end
function FileExplorer:getPointer()
  return pointer
end
function FileExplorer:mkDir(name, withPath)
  if (withPath == false) then
    fs.makedir(self.pointer+name)
    return true
  else
    fs.makeDir(name)
    return true
  end
  return false
end
function FileExplorer:remove(name, withPath)
  if (withPath == false) then
    fs.delete(self.pointer+name)
    return true
  else
    fs.delete(name)
    return true
  end
end
function FileExplorer:list(dir)
  if (fs.exists(dir)) then
    return fs.list
  end
  return false
end
