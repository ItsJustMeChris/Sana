SanaDBCheck = false

function sanaSay(args)
	print("|cffff69b4[Sana]|r", args)
end

function sanaDebug(action, thingy)
	print("|cffff69b4[Sana]|r", action, thingy)
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