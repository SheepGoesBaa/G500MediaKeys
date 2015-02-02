local ModifierKeyDown = false

--Key bindings
local ModifierKey = 6

--Key constants
local MUTE_KEY          = 0x120
local NEXT_TRACK        = 0x119
local PREVIOUS_TRACK    = 0x110
local PLAY_PAUSE_TRACK  = 0x122

function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %s\n", event, arg)
	
	if event == "MOUSE_BUTTON_PRESSED" then
		if arg == ModifierKey then
			ModifierKeyDown = true
		end
	elseif event == "MOUSE_BUTTON_RELEASED" then
		if arg == ModifierKey then
			ModifierKeyDown = false
		end
	end
	OutputLogMessage("%s\n", tostring(ModifierKeyDown))
end