function runCommand(arguments, flags)
  if #arguments < 2 then
    return false -- Error return here
  end
  fs.delete("/gemos/" .. arguments[2])
end
