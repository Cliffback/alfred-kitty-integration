on alfred_script(q)
    tell application "kitty" to activate
    tell application "System Events"
        repeat until (exists file "/tmp/kittynyx.sock")
            delay 6
        end repeat
    end tell

    -- Check and remove the first character if it's a space
    if q starts with " " then
        set q to text 2 through -1 of q
    end if

    -- If starting with -n, open a new window instead of the current
    if q starts with "-n " then
        set q to text 4 through -1 of q -- Remove '-n ' from the input
        do shell script "/Applications/kitty.app/Contents/MacOS/kitty @ --to unix:/tmp/kittynyx.sock new-window --new-tab"
            delay 1 -- Wait for the new tab to open
        tell application "System Events" to keystroke q
        tell application "System Events" to key code 36 -- enter key
    else
        do shell script "/Applications/kitty.app/Contents/MacOS/kitty @ --to unix:/tmp/kittynyx.sock focus-window"
        tell application "System Events" to keystroke q
        tell application "System Events"
            key code 36 -- enter key
        end tell
    end if
end alfred_script
