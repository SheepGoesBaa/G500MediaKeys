local ModifierKeyDown = false
local IsMidOperation = false

--settings
local VolumeIncrement = 5

--Key constants
local MUTE_KEY          = 0x120
local NEXT_TRACK        = 0x119
local PREVIOUS_TRACK    = 0x110
local PLAY_PAUSE_TRACK  = 0x122
local VOLUME_UP			= 0x130
local VOLUME_DOWN		= 0x12E

--key functions
function CloseWindow()
	if IsMidOperation then
		return
	end
	IsMidOperation = true
	PressKey("lctrl")
	PressAndReleaseKey("w")
	ReleaseKey("lctrl")
	IsMidOperation = false
end
function ChangeVolume(direction)
	if IsMidOperation then
		return
	end
	IsMidOperation = true
	local VolumeKey
	if direction == 1 then
		VolumeKey = VOLUME_UP
	else
		VolumeKey = VOLUME_DOWN
	end
	for i = 1, VolumeIncrement do
		PressAndReleaseKey(VolumeKey)
	end
	IsMidOperation = false
end
function NextTab()
	if IsMidOperation then
		return
	end
	IsMidOperation = true
	PressKey("lctrl")
	PressAndReleaseKey("tab")
	ReleaseKey("lctrl")
	IsMidOperation = false
end
function PreviousTab()
	if IsMidOperation then
		return
	end
	IsMidOperation = true
	PressKey("lctrl")
	PressKey("lshift")
	PressAndReleaseKey("tab")
	ReleaseKey("lshift")
	ReleaseKey("lctrl")
	IsMidOperation = false
end

--Key bindings
local ModifierKey = 6

local ModifiedDownFunctions = {
	[3] = PressAndReleaseKey,
	[4] = PressAndReleaseKey,
	[5] = CloseWindow,
	[7] = PressAndReleaseKey,
	[8] = PressAndReleaseKey,
	[9] = ChangeVolume,
	[10]= ChangeVolume
}
local ModifiedDownArgs = {
	[3] = PLAY_PAUSE_TRACK,
	[4] = MUTE_KEY,
	[5] = nil,
	[7] = PREVIOUS_TRACK,
	[8] = NEXT_TRACK,
	[9] = 1,
	[10]= -1
}
local VanillaDownFunctions = {
	[3] = PressMouseButton,
	[4] = PressMouseButton,
	[5] = PressMouseButton,
	[7] = PressKey,
	[8] = PressKey,
	[9] = NextTab,
	[10]= PreviousTab
}
local VanillaDownArgs = {
	[3] = 2,
	[4] = 4,
	[5] = 5,
	[7] = "left",
	[8] = "right",
	[9] = nil,
	[10]= nil
}
local VanillaUpFunctions = {
	[3] = ReleaseMouseButton,
	[4] = ReleaseMouseButton,
	[5] = ReleaseMouseButton,
	[7] = ReleaseKey,
	[8] = ReleaseKey,
	[9] = nil,
	[10]= nil
}
local VanillaUpArgs = {
	[3] = 2,
	[4] = 4,
	[5] = 5,
	[7] = "left",
	[8] = "right",
	[9] = nil,
	[10]= nil
}

function OnEvent(event, key)
	OutputLogMessage("event = %s, key = %s\n", event, key)
	
	if event == "MOUSE_BUTTON_PRESSED" then
		if key == ModifierKey then --user pressed modifier key 
			ModifierKeyDown = true
		elseif ModifierKeyDown and ModifiedDownFunctions[key] then --access modified key bindings
			ModifiedDownFunctions[key](ModifiedDownArgs[key])
		elseif VanillaDownFunctions[key] then --access vanilla key bindings
			VanillaDownFunctions[key](VanillaDownArgs[key])
		end
	elseif event == "MOUSE_BUTTON_RELEASED" then
		if key == ModifierKey then --user released modifier key
			ModifierKeyDown = false
		elseif VanillaUpFunctions[key] then --vanilla up even if modifier key is down to prevent key sticks
			VanillaUpFunctions[key](VanillaUpArgs[key])
		end
	end
	OutputLogMessage("%s\n", tostring(ModifierKeyDown))
end

