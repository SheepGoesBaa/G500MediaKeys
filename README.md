#G500 Media Keys Script

This script provides a function layer of media keys and QoL keys, allowing you have access to both normal mouse buttons and media buttons.

This script is compatible with the G500 and G500s, with some slight modifications, you can make this work on a G502 as well.

## Installation

1) Make sure you have [Logitech Gaming Software downloaded.](http://support.logitech.com/software/gaming-software)

2) Unbind all buttons except Left Click and Right Click (All others will be supported by the script).

![Bindings](http://i.imgur.com/F1dKe1X.png)

3) Select the drop down arrow on the Default Profile and click on "Scripting"

![Dropdown Menu](http://i.imgur.com/Ha9YV5P.png)

4) Copy and paste the contents of `MediaKeys.lua` into the text editor that pops up.

5) Save with `Ctrl + S` and close the window.

## Bindings

### Non-Function Layer

All bindings here are standard except the +/- dpi buttons. Those are now for switching between tabs in web browsers (`Ctrl + Tab` and `Ctrl + Shift + Tab`).

### Function Layer

Use the *Middle Side Button* to enter the function layer and access media keys. (Noted as Fn)

* `Fn + Forward`: Closes browser tab (`Ctrl + W`)
* `Fn + Backward`: Mutes sound
* `Fn + +/-Dpi`: Increase/Decrease volume
* `Fn + Left/Right Mousewheel`: Next/Previous Track in media players
* `Fn + Mousewheel Click`: Pause/Unpause in media players
