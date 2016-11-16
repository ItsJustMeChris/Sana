local SanaToggle
local sanaTick
function sanaStart()
	MainFrame = CreateFrame("FRAME", nil, UIParent)
	MainFrame = SetScript("OnUpdate", sanaUpdate)
end

function sanaUpdate(self, elapsed)
	sanaTick = sanaTick + elapsed
	if SanaToggle and sanaTick <= .250 then
		sanaRotationStart()
		elseif sanaTick >= 1 then
		sanaTick = 0
	end
end






















function sanaToggle()
	if SanaToggle ~= true then
		SanaToggle = true
		sanaSay("Enabled")
	else 
		SanaToggle = false
		sanaSay("Disabled")
	end
end

function sanaSay(args)
	print("|cffff69b4[Sana]|r", args)
end

SLASH_SANA1 = '/sana'
function handler(msg, editbox)
	if msg == string.lower("toggle") then
		sanaToggle()
	else 
		sanaSay("Error")
	end
end
SlashCmdList["SANA"] = handler