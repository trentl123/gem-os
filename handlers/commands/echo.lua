function runCommand(arguments, flags)
  local printout = "\n"
  for _, x in pairs(arguments) do
    printout = printout .. x
  end
  io.write(printout)
end
