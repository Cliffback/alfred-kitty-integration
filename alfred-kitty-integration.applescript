on alfred_script(q)
    tell application "kitty" to activate
    tell application "System Events"
        repeat until (exists file "/tmp/mykitty")
            delay 6
        end repeat
    end tell

    -- Check and remove the first character if it's a space
    if q starts with " " then
        set q to text 2 through -1 of q
    end if

	set kitten to "/Applications/kitty.app/Contents/MacOS/kitty @ --to unix:/tmp/mykitty"

    -- If starting with -n, open a new window instead of the current
    if q starts with "-n " then
        set q to text 4 through -1 of q -- Remove '-n ' from the input
        do shell script kitten & " launch --type tab"
	else
		-- If the last focused kitty tab doesn't exist or is not at prompt (eg. vim), open a new tab
		do shell script "( " & kitten & " ls --match state:focused | jq -e '.[0].tabs[0].windows[0].at_prompt' ) || " & kitten & " launch --type tab"
	end

    do shell script kitten & " send-text --match state:focused " & quoted form of q & "\\\\n"
end alfred_script
