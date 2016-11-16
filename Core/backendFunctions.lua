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
function sanaGetPower(target)
	return math.floor((UnitPower(target) / UnitPowerMax(target)) * 100)
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

function sanaGetRange()
	local x1,y1,z1 = ObjectPosition(target)
	local x2,y2,z2 = ObjectPosition(other)
	return math.floor(math.sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2))
end

function sanaLOS(target)
  local sX, sY, sZ = ObjectPosition("player");
  local oX, oY, oZ = ObjectPosition(target);
  local losFlags =  bit.bor(0x10, 0x100, 0x1)
  return TraceLine(sX, sY, sZ + 2.25, oX, oY, oZ + 2.25, losFlags) == nil;
end

function sanaCooldown(spell)
	return GetSpellCooldown(spell)
end