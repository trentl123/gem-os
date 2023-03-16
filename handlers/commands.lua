commandInterpreter = {}

function commandInterpreter:getArguments(cmd)
  local arguments = {}
  for x in cmd:gmatch("%S+") do table.insert(arguments, x)
  return arguments
end
