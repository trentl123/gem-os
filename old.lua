function cls()
  shell.run("clear")
end
function splitLines(str)
  result = {}
  for line in str:gmatch '[^\n]+' do
    table.insert(result, line)
  end
  return result
end
function getAccount(str)
  result = {}
  for line in str:gmatch '[^\n]+' do
    for accountInfo in line:gmatch '[^:next:]+' do
      table.insert(result, {accountInfo[0], accountInfo[1], accountInfo[2]})
    end
  end
  return result
end

cls()
io.write([[
  
               Haze OS   
  
         Just getting things
          ready for you....
  
]])
local path -- Defines the path that the user is at in the operating system.
local prefixname -- The username of the logged in account (for theprefix).
local privileges -- The priviledges of the logged in user.
local loggedIn = false -- Checks if the user is actually logged in. Always defaults to false on startup.
os.sleep(1)
cls()
local x = true
while x == true do
  io.write([[
                  Welcome to Haze OS!

              Please enter your username.
                  > ]])
  username = io.read()
  for acc in getAccount(io.open('disk/haze.acc'):read()) do
    if acc[0] == username then
      local passwordAttempts = 0
      while passwordAttempts < 4 do
        io.write([[
                          /---\
                          |O O|
                          \ - /
                          /   \
                       ]])
        io.write(username)
        io.write([[
                Please enter your password.
                     Attempts: ]])
        io.write(passwordAttempts)
        io.write('/3')
        io.write([[
                    >]])
        password = io.read()
        if acc[1] == password then
          prefixname = username
          path = '/home/' .. username
          privileges = acc[2]
          loggedIn = true
        else
            passwordAttempts = passwordAttempts + 1
            cls()
            io.write('.          Incorrect password entered!')
        end
      end
      if passwordAttempts > 3 then
        cls()
        io.write('Account login failed. Shutting down in 3..\n')
        os.sleep(1)
        cls()
        io.write('Account login failed. Shutting down in 2..\n')
        os.sleep(1)
        cls()
        io.write('Account login failed. Shutting down in 1..\n')
        os.sleep(1)
        os.shutdown()
      else
        x = true
        break
      end
    end
  end
end
cls()
print("Username", username, "Password", password, "privileges", privileges)
