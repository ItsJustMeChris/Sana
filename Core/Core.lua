SanaToggle = false
sanaTick = 0
function sanaStart()
	MainFrame = CreateFrame("FRAME", nil, UIParent)
	MainFrame:SetScript("OnUpdate", sanaUpdate)
end

function sanaUpdate(self, elapsed)
	sanaTick = sanaTick + elapsed
	if SanaToggle and sanaTick <= .250 then
		sanaRotationStart()
		elseif sanaTick >= 1 then
		sanaCheckRejuv()
		sanaCheckLifebloom()	
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

function sanaDebugToggle()
	if debugMode ~= true then
		debugMode = true
		sanaSay("Debugger Enabled")
	else
		debugMode = false
		sanaSay("Debugger Disabled")
	end
end

function sanaHelp()
  sanaSay("---Available Commands---")
  sanaSay("Help:  Reveals this list")
  sanaSay("Toggle:  Enables and disables the rotation")
  sanaSay("Debug:  Enables and disables debug chat spam")
  sanaSay("Your healing, made easy")
end

SLASH_SANA1 = '/sana'
function handler(msg, editbox)
	if msg == string.lower("toggle") then
		sanaToggle()
	elseif msg == string.lower("debug") then
		sanaDebugToggle()
	elseif msg == string.lower("help") then
		sanaHelp()
	else
		sanaSay("Error")
	end
end
SlashCmdList["SANA"] = handler

sanaStart()