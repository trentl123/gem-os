local term = peripheral.wrap("top")

local function drawLoginScreen()
  term.clear()
  term.setCursorPos(1,1)
  term.write("Please log in to continue.")
  term.setCursorPos(1,3)
  term.write("Username: ")
  term.setCursorPos(11,3)
  term.write(string.rep("*", #username))
  term.setCursorPos(1,4)
  term.write("Password: ")
  term.setCursorPos(11,4)
  term.write(string.rep("*", #password))
  button.redraw()
end

local function handleTouch(x, y)
  if x >= 10 and x <= 19 and y == 7 then
    login(username, password)
  end
end

local function handleKeypress(char, code)
  if code == keys.enter then
    login(username, password)
  elseif code == keys.backspace then
    if #password > 0 then
      password = password:sub(1, #password-1)
    end
  else
    password = password .. char
  end
end

drawLoginScreen()
while true do
  local event, button, x, y = os.pullEvent("mouse_click")
  if button == 1 then
    handleTouch(x, y)
  end
end
