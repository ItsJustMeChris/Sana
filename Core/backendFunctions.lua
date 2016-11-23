SanaDBCheck = false
sanaAffanity = false
function sanaSay(args)
	print("|cffff69b4[Sana]|r", args)
end

function sanaDebug(action, thingy)
	if debugMode == true then
	print("|cffff69b4[Sana]|r", action, thingy)
	else
	end
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
			if lowestHealth ~= nil then
				return lowestHealth, lowestUnit
			end
		end
	end
end

function sanaGetSpecificUnitInfo(var)
	for i=1, #Group do
		if Group[var] ~= nil and (Group[var].Role == "DAMAGER" or "NONE") then
			specificHealth = sanaGetHealth(Group[var].Unit)
			specificUnit = Group[var].Unit
			if specificHealth ~= nil then
				return specificHealth, specificUnit
			end
		end
	end
end

function sanaTankHealth()
	for i=1, #Group do
		if Group[i] ~= nil and Group[i].Role == "TANK" then
			tankHealth = sanaGetHealth(Group[i].Unit)
			tankUnit = Group[i].Unit
			if tankHealth ~= nil then
				return tankHealth, tankUnit
			end
		end
	end
end

function sanaHealerHealth()
	for i=1, #Group do
		if Group[i] ~= nil and Group[i].Role == "HEALER" then
			healerHealth = sanaGetHealth(Group[i].Unit)
			healerUnit = Group[i].Unit
			if healerHealth ~= nil then
				return healerHealth, healerUnit
			end
		end
	end
end

function sanaGetRange(target, other)
	local x1,y1,z1 = ObjectPosition(target)
	local x2,y2,z2 = ObjectPosition(other)
	return math.floor(math.sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2))
end

function sanaGetMid(target, other)
	local x1,y1,z1 = ObjectPosition(target)
	local x2,y2,z2 = ObjectPosition(other)
	local clickX = (x1 + x2)/2
	local clickY = (y1 + y2)/2
	local clickZ = z2
	return clickX, clickY, clickZ
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

function sanaInCombat()
  for i=1, #Group do
    if UnitAffectingCombat(Group[i].Unit) then

      return true
      else
      	efflDown = false
        return false
    end
  end
end

function sanaUnitInRange(unit)
	if UnitInRange(unit) then
		return true
	end
end

function sanaEquipped(item, slot)
	if GetInventoryItemID("player", slot) == item then
		return true
	end
end

function sanaTalentTrue(talent)
	return select(10, GetTalentInfoByID(talent))
end
