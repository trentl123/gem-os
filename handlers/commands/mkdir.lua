function runCommand(arguments, flags)
  if #arguments > 1 then
    fs.makedir('/gemos/' .. arguments[2])
  else
    return false -- Error return here
  end
end
