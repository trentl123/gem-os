-- Display the startup screen
function startupScreen()
  local w, h = term.getSize()
  local countdown = 10
  
  -- Clear the screen
  term.clear()
  term.setCursorPos(1, 1)
  
  -- Display the countdown message
  term.setTextColor(colors.yellow)
  term.write("Starting up in ")
  term.setTextColor(colors.red)
  term.write(tostring(countdown))
  term.setTextColor(colors.yellow)
  term.write(" seconds...")
  
  -- Display the update message
  term.setCursorPos(1, h - 1)
  term.setTextColor(colors.white)
  term.write("Press ")
  term.setTextColor(colors.lime)
  term.write("up/down arrows")
  term.setTextColor(colors.white)
  term.write(" to select, ")
  term.setTextColor(colors.lime)
  term.write("enter")
  term.setTextColor(colors.white)
  term.write(" to confirm.")
  
  -- Display the update options
  term.setCursorPos(1, h)
  term.setTextColor(colors.yellow)
  term.write("[Check Update]")
  term.setCursorPos(w - 15, h)
  term.write("[Do Not Check Update]")
  
  -- Wait for user input or countdown to expire
  while countdown > 0 do
    local event, key = os.pullEvent("key")
    
    -- Handle arrow keys
    if key == keys.up or key == keys.down then
      -- Switch between the two options
      term.setTextColor(colors.yellow)
      term.setCursorPos(1, h)
      if key == keys.up then
        term.write("[Check Update]")
      else
        term.write("[Do Not Check Update]")
      end
      term.setTextColor(colors.white)
      term.setCursorPos(1, h - 1)
      term.write("                             ")
    end
    
    -- Handle enter key
    if key == keys.enter then
      if term.getCursorPos() == w then
        -- User selected "Do Not Check Update"
        return false
      else
        -- User selected "Check Update"
        return checkUpdate()
      end
    end
    
    -- Update the countdown message
    countdown = countdown - 1
    term.setTextColor(colors.red)
    term.setCursorPos(21, 1)
    term.write(tostring(countdown))
  end
  
  -- Countdown expired, check for update
  return checkUpdate()
end
