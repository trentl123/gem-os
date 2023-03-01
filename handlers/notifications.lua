NotificationHandler = {}

--[[
  The NotificationHandler class is designed the manage the operating system's notifications.
  NotificationHandler can be accessed by any application or user.

  Methods:
    newNotification (appClass) (text) (displayTime) - Creates a new notification and adds it to the list
    clearNotifications  - Clears all currently visible notifications
  ]]

function NotificationHandler:newNotification(appClass, text, displayTime)
  -- Create a new notification here
end
function NotificationHandler:clearNotifications()
  -- Clear notifications here
end
