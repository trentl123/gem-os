commandInterpreter = {}

function commandInterpreter:run(commandString)
  local commandArgs = {}
  local flags = {}
  for word in commandString:gmatch("%S+") do
      if word:sub(1, 1) == "-" then
          table.insert(flags, word)
      else
          table.insert(commandArgs, word)
      end
  end
  local commandFilePath = "/gemos/sys/commands/" .. commandArgs[1] .. ".lua"
  local commandFile = io.open(commandFilePath, "r")
  if commandFile == nil then
      return false
  end
  commandFile:close()
  local commandModule = require(commandArgs[1])
  commandModule.runCommand(commandArgs, flags)
end
