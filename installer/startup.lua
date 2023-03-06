io.write("Loading...")
io.write("\nDownloading version manifest..")
sys.run("pastebin get dyBEWDFa /manifest.info")
os.sleep(1)
if fs.exists("/manifest.info") then
  io.write("Manifest downloaded, validating..")
  os.sleep(0.5)
  io.write("\nChecking for updates..")
  -- Compare to builtin version
else
  io.write("Manifest cannot be downloaded, do you have an internet connection?")
  io.write("Update checking failed, ignoring.")
  os.sleep(0.5)
end

shell.run("pastebin get JXJ1yCVL button.lua")
os.loadAPI("button.lua")
shell.run("clear")
button.setMonitor(handler)
startButton = button.create("Begin Installation")
startButton.setPos(1,1)
startButton.onClick(function() io.write("\nInstallation Starting!") end)
while true do button.await(startButton) end
function initialAccountCreation()
  io.write("\nCommencing initial account creation..\n")
  os.sleep(2)
  sys.run("clear")
  io.write("Username: ")
  local username = io.read()
  io.write("\nPassword: ")
  local password = io.read()
  io.write("\nAlias (optional, leave blank): ")
  local alias io.read()
  io.write("\nSelect your theme")
  local selectedTheme = 1
  local themeSelect = {"Ruby Theme", "Sapphire Theme"}
  while true do
    keyPressed = False
    for x, _ in pairs(themeSelect) do
      if x == selectedTheme-1 then
        start = ">"
      else
        start = " "
      end
      io.write("\n" .. start .. themeSelect[x])
    end
    local event, key, isHeld = os.pullEvent("key")

    if key == keys.down and selectedTheme ~>1 then
      selectedTheme = selectedTheme + 1
    elseif key == keys.up and selectedTheme ~< 0 then
      selectedTheme = selectedTheme - 1
    elseif key == keys.enter then
      local translation = {
        [1] = "ruby",
        [2] = "sapphire"
      }
      local theme = translation[selectedTheme]
      break
     end
    break
    end
  end
  
  io.write("\nPreparing for account creation..")
  os.loadAPI("accounts.lua")
  os.sleep(0.6)
  io.write("\nPerforming account creation..")
  AccountHandler:createAccount(username, password, '/gemos/home/' .. string.lower(username), 3, {["theme"] = theme, ["alias"] = alias})
  os.sleep(3)
  io.write("\nAccount created!")
  os.sleep(1)
  sys.run("clear")
end

function versionSelect()
  local selectedTheme = 1
  local verSelect = {"Terminal Only", "Graphical"}
  while true do
    keyPressed = False
    for x, _ in pairs(selectedVer) do
      if x == selectedVer-1 then
        start = ">"
      else
        start = " "
      end
      io.write("\n" .. start .. verSelect[x])
    end
    local event, key, isHeld = os.pullEvent("key")

    if key == keys.down and selectedVer ~>1 then
      selectedVer = selectedVer + 1
    elseif key == keys.up and selectedVer ~< 0 then
      selectedVer = selectedVer - 1
    elseif key == keys.enter then
      local translation = {
        [1] = "terminal",
        [2] = "graphical"
      }
      globalVer = translation[selectedVer]
      break
    end
  break
  end
end

--[[
  File Structure
  (with /gemos/ infront)

  - data   (Directory for application data)
  - home   (Directory for user's directories)
    |_ - <username>
      |_ - Documents
         - Downloads
         - Recycle Bin
  - memory   (Virtual memory storage)
  - applications   (Stores application executables)
  - logs   (Stores error logs)



  ]]





io.write([[
  
               Gem OS   
  
         Just getting things
          ready for you....
  
]])
