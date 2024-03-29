--[[
  Settings application

  Note to developers:
    For consistency, it's recommended that you format application class names similarly to this example:

    net_trentdev_application (Usual format would be net.trentdev.application)

    Default applications are object oriented, but yours don't have to be.
  ]]
os.loadAPI("/gemos/apis/accounts.lua")

core_gemos_settings = {}

function core_gemos_settings:start(username)
  local t = setmetatable({}, {__index = core_gemos_settings})
  t.accTheme = AccountHandler:getAccountPreferences("theme")
  --[[
    Graphical display here (WIP)
    ]]
  return t
end
function core_gemos_settings:getSettings()
  --[[
    Return account settings in readable format (WIP)
    ]]
  return
end
function core_gemos_settings:setSettings(setting, newValue)
  --[[
    Set account setting for user (WIP)
    ]]
  return
end
function core_gemos_settings:_getSettingData(setting)
    if (setting == "theme") {
      local data = {
        ["path"] = "",
        ["current"] = "",

      }
    }
  return
end
