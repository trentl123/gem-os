--[[
  formatColours() is a text translation function that returns the provided string with replaced colour codes.
  ]]
function formatColours(text)
  res, _ = string.gsub(text, "%&0", colors.black)
  res, _ = string.gsub(text, "%&1", colors.green)
  res, _ = string.gsub(text, "%&2", colors.blue)
  res, _ = string.gsub(text, "%&3", colors.cyan)
  res, _ = string.gsub(text, "%&4", colors.red)
  res, _ = string.gsub(text, "%&5", colors.purple)
  res, _ = string.gsub(text, "%&6", colors.orange)
  res, _ = string.gsub(text, "%&7", colors.lightGray)
  res, _ = string.gsub(text, "%&8", colors.gray)
  res, _ = string.gsub(text, "%&9", colors.magenta)
  res, _ = string.gsub(text, "%&a", colors.lime)
  res, _ = string.gsub(text, "%&b", colors.lightBlue)
  res, _ = string.gsub(text, "%&c", colors.brown)
  res, _ = string.gsub(text, "%&d", colors.pink)
  res, _ = string.gsub(text, "%&e", colors.yellow)
  res, _ = string.gsub(text, "%&f", colors.white)
  return res
end
