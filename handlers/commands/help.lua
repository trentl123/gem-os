function runCommand(arguments, flags)
  local commandDictionary = {
    ['adduser'] = 'adduser is used to add a new user on the system.',
    ['login'] = 'login is used to login to a different user account.',
    ['logout'] = 'logout is used to log out of the current user account.',
    ['cd'] = 'cd changes the current target directory.',
    ['ls'] = 'ls lists the contents of target directory.',
    ['mkdir'] = 'mkdir is used to create a new directory.',
    ['touch'] = "touch creates a new file. It will create provided directories if they don't exist.",
    ['sudo'] = 'sudo executes commands with artificially elevated privileges.',
    ['update'] = 'update checks for and updates the current os versio.n',
    ['gpm'] = "gpm (gemos package manager) is the OS' package manager." 
    }
  local argumentDictionary = {
    ['adduser'] = {"username   - The username of the account to add"},
    ['login'] = {"username   - The username of the account to log into"},
    ['echo'] = {"string   - The string to echo back to the user"},
    ['cd'] = {"target   - The path to change the target directory to"},
    ['rm'] = {"target   - The path of the file to be removed"},
    ['mkdir'] = {"target   - The path of the directory to be made"},
    ['touch'] = {"target   - The path of the file to be made"},
    ['sudo'] = {"command   - The command to be ran with elevated privileges"},
    }
  if #arguments == 1 then
    io.write("\n" .. arguments[1] .. "\n")
    for y=1,#arguments[1] do io.write("-") end
    io.write([[ 
    
Arguments
---------]])
    for _, x in pairs(argumentDictionary[arguments[1]]) do
      io.write("\n" .. x)
    end
    io.write([[
Description
-----------
]] .. commandDictionary[arguments[1]])
  else
    io.write([[
Help
----
    
- adduser <username>
- login <username>
- echo <string>
- logout
- cd <target>
- ls
- rm <target>
- mkdir <target>
- touch <target>
- sudo <command>
- update
- gpm <install/remove/run>
    
  ]])
  end
end
