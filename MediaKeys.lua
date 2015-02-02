

--Key constants
local MUTE_KEY          = 0x120
local NEXT_TRACK        = 0x119
local PREVIOUS_TRACK    = 0x110
local PLAY_PAUSE_TRACK  = 0x122

function OnEvent(event, arg)
	OutputLogMessage("event = %s, arg = %s\n", event, arg)
end