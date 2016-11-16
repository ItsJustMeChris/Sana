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

function sanaGetHealth(target)
	return math.floor((UnitHealth(target) / UnitHealthMax(target)) * 100)
end

function sanaLowestHealth()
	for i=1, #Group do
		if Group[i] ~= nil and (Group[i].Role == "DAMAGER" or "NONE") then
			lowestHealth = sanaGetHealth(Group[i].Unit)
			lowestUnit = Group[i].Unit
		end
	end
	return lowestHealth, lowestUnit
end

function sanaTankHealth()
	for i=1, #Group do
		if Group[i] ~= nil and (Group[i].Role == "TANK") then
			lowestHealth = sanaGetHealth(Group[i].Unit)
			lowestUnit = Group[i].Unit
		end
	end
	return tankHealth, tankUnit
end

function sanaHealerHealth()
	for i=1, #Group do
		if Group[i] ~= nil and (Group[i].Role == "HEALER") then
			lowestHealth = sanaGetHealth(Group[i].Unit)
			lowestUnit = Group[i].Unit
		end
	end
	return healerHealth, healerUnit
end