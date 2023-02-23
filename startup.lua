io.write("Loading...")
shell.run("pastebin get JXJ1yCVL button.lua")
os.loadAPI("button.lua")
shell.run("clear")
button.setMonitor(handler)
startButton = button.create("Begin Installation")
startButton.setPos(1,1)
startButton.onClick(function() print("Installation Starting!") end)
while true do button.await(startButton) end
