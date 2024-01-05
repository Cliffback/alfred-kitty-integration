# Custom Kitty integration for Alfred 5
Script to use kitty as the custom terminal with Alfred

My modified script is based on pyrhos guide
[Using Kitty as a custom terminal for Alfred](https://25.wf/posts/2020-03-23-alfred-kitty.html)

The difference is that with my script, the default behavior is to execute the command into the current window, instead of opening a new window.
Opening a new window can be done by typing "-n" before the command

First create a file called macos-launch-services-cmd-line in the kitty config folder, and with this line "--listen-on unix:/tmp/mykitty"
```bash
mkdir -p ~/.config/kitty && echo "--listen-on unix:/tmp/kittynyx.sock" > ~/.config/kitty/macos-launch-services-cmdline
```

Then in the Alfred Settings, under General > Terminal, change the Application dropdown to "Custom" and paste in the content of [alfred-kitty.applescript](alfred-kitty.applescript) and you should be good to go
