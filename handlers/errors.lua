Error = {}
--[[
  The Error class will handle and keep track of the operating system's errors.
  
  Methods:
    run (errcode)  - Creates a new error object.
    parseCode (errcode)  - Converts the code into a string error message.
  ]]
function Error:new(errcode)
  local t = setmetatable({}, { __index = Error})
  t.code = errcode
  return t
end
function Error:parseCode(errcode)
  local errorCodes = {
    [1] = "That file/directory doesn't exist or cannot be found.",
    [2] = "That file/directory could not be created.",
    [3] = "That file/directory cannot be removed.",
    [4] = "You cannot modify essential operating system files.",
    [5] = "Your OS installation has become corrupt! Please exit to shell, load the installation disk and type '/disk/repair.lua'.",
  }
  return errorCodes[errcode]
end
