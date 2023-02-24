io.write("Loading...")
shell.run("pastebin get JXJ1yCVL button.lua")
os.loadAPI("button.lua")
shell.run("clear")
button.setMonitor(handler)
startButton = button.create("Begin Installation")
startButton.setPos(1,1)
startButton.onClick(function() print("Installation Starting!") end)
while true do button.await(startButton) end
function initialAccountCreation()
  io.write("Commencing initial account creation..\n")
  os.sleep(2)
  sys.run("clear")
  io.write("Username: ")
  local username = io.read()
  io.write("\nPassword: ")
  local password = io.read()
  io.write("\nAlias (optional, leave blank): ")
  local alias io.read()
  io.write("\nPreparing for account creation..")
  os.loadAPI("accounts.lua")
  os.sleep(0.6)
  io.write("\nPerforming account creation..")
  AccountHandler:createAccount(username, password, '/gemos/home/' .. string.lower(username), 3, {["theme"] = "ruby", ["alias"] = alias})
  os.sleep(3)
  io.write("\nAccount created!")
  os.sleep(1)
  sys.run("clear)
end

io.write([[
  
               Gem OS   
  
         Just getting things
          ready for you....
  
]])
