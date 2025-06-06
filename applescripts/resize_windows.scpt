on run argv
   if (count of argv) ≠ 1 then
      error "Usage: osascript resize_windows.scpt <iTerm2_width_percent>"
   end if

   set itermWidthPercent to item 1 of argv as integer
   if itermWidthPercent < 1 or itermWidthPercent > 100 then
      error "Width percentage must be between 1 and 100"
   end if

   -- Get main screen resolution using shell command
   --set screenResolution to do shell script "system_profiler SPDisplaysDataType | awk '/Resolution/{print $2, $3, $4}' | head -n 1"
   set screenResolution to do shell script "system_profiler SPDisplaysDataType | sed -nE 's/.*Resolution: ([0-9]+ x [0-9]+).*/\\1/p' | sed -n 2p"
   -- screenResolution will be like "2560 x 1440"

   -- Parse width and height
   set AppleScript's text item delimiters to " "
   set resParts to text items of screenResolution
   set screenWidth to item 1 of resParts as integer
   set screenHeight to item 3 of resParts as integer

   set dockWidth to 50 -- right of screen # TODO: adjust based on varying setups
   set screenWidth to ( screenWidth - dockWidth )

   -- Calculate widths in pixels
   set itermWidth to (screenWidth * itermWidthPercent) / 100
   set chromeWidth to screenWidth - itermWidth

   -- Set iTerm2 window bounds {x, y, x2, y2}
   set menuBarOffset to 22 -- top of screen
   tell application "iTerm2"
      activate
      set bounds of front window to {0, menuBarOffset, itermWidth, screenHeight}
   end tell

   tell application "Google Chrome"
      activate
      set bounds of front window to {itermWidth, menuBarOffset, screenWidth, screenHeight}
   end tell
end run
