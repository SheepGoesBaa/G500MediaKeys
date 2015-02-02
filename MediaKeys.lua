local ModifierKeyDown = false

--Key constants
local MUTE_KEY          = 0x120
local NEXT_TRACK        = 0x119
local PREVIOUS_TRACK    = 0x110
local PLAY_PAUSE_TRACK  = 0x122

--Key bindings
local ModifierKey = 6

local ModifiedDownFunctions = {
	[3] = PressAndReleaseKey,
	[4] = PressAndReleaseKey,
	[7] = PressAndReleaseKey,
	[8] = PressAndReleaseKey
}
local ModifiedDownArgs = {
	[3] = PLAY_PAUSE_TRACK,
	[4] = MUTE_KEY,
	[7] = PREVIOUS_TRACK,
	[8] = NEXT_TRACK
}

function OnEvent(event, key)
	OutputLogMessage("event = %s, key = %s\n", event, key)
	
	if event == "MOUSE_BUTTON_PRESSED" then
		if key == ModifierKey then --user pressed modifier key 
			ModifierKeyDown = true
		elseif ModifierKeyDown and ModifiedDownFunctions[key] then --access modified key bindings
			ModifiedDownFunctions[key](ModifiedDownArgs[key])
		else --access vanilla key bindings
			--TODO
		end
	elseif event == "MOUSE_BUTTON_RELEASED" then
		if key == ModifierKey then --user released modifier key
			ModifierKeyDown = false
		end
	end
	OutputLogMessage("%s\n", tostring(ModifierKeyDown))
end