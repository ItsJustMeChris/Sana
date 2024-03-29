function sanaCheckLifebloom()
  for i = 1, #hotTable do
    lifebloomcount = hotTable[i].Lifebloom + hotTable[i].Lifebloom
  end
  return lifebloomcount
end

function sanaCheckRejuv()
  for i = 1, #hotTable do
    rejuvcount = hotTable[i].Rejuv + hotTable[i].Rejuv
  end
  return rejuvcount
end

function sanaCheckEffl()
  for i = 1, #hotTable do
    efflcount = hotTable[i].Effl + hotTable[i].Effl
  end
  return efflcount
end

function sanaHowManyNear(target, other, distance)
local nearsana = 0
  for i=1, #Group do
    if other == any then
      if sanaGetRange(target, Group[i].Unit) < distance then
        nearsana = nearsana + 1
      end
    elseif sanaGetRange(target, other) < distance then
      nearsana = nearsana + 1
    end
  end return nearsana
end

function shouldSanaCast(spell, unit)
	spell = spell
    currentlyChanneling = select(1, UnitChannelInfo("player"))
	if unit == nil then return false end
	if sanaUnitInRange(unit) and sanaGetCooldown(spell) then
		if (select(4, GetSpellInfo(spell)) == 0) and UnitMovementFlags("player") <= 1 then
			return true
		elseif (select(4, GetSpellInfo(spell)) ~= 0 and UnitMovementFlags("player") == 0 ) then
			return true
			else return false
		end
	end
end

function sanaGetCooldown(spellID)
  RealCoolDown = GetSpellCooldown(spellID) + GetSpellCooldown(61304)
  if RealCoolDown == 0 then
    return true
  else
    return false
  end
end

function sanaWildGrowth()
	sanaGetSpecificUnitInfo(3)
	if shouldSanaCast(Wild_Growth, specificUnit) and not sanaMyBuff(specificUnit, "Wild Growth", "") and sanaHowManyNear("player", any, 30) >= 3 and specificHealth <= 75 then
		return true
		else return false
	end
end

function sanaTranquility()
	sanaGetSpecificUnitInfo(3)
	if shouldSanaCast(Tranquility, specificUnit) and sanaHowManyNear("player", any, 30) >= 3 and specificHealth <= 40 then
		return true
		else return false
	end
end

function sanaCentroid(x1,x2,x3,y1,y2,y3)
	centroidX = (x1 + x2 + x3)/3
	centroidY = (y1 + y2 + y3)/3
	return centroidX, centroidY
end

function sanaEfflorscence()
	for i=1, #Group do
		local x1, y1, z1 = ObjectPosition(Group[i].Unit)
		local x2, y2, z2 = ObjectPosition(Group[i].Unit)
		local x3, y3, z3 = ObjectPosition(Group[i].Unit)
		if (efflDown == false or efflDown == nil) and ObjectExists(Group[i].Unit) and sanaHowManyNear(Group[i].Unit, any, 20) >= 3 and sanaGetHealth(Group[i].Unit) <= 95 then
			CastSpellByID(145205)
			ClickPosition(sanaGetMid(Group[i].Unit, "player"))
			efflDown = true
		end
	end
end

function sanaNaturesCure()
    for i=1, #Group do
        if sanaDispell(Group[i].Unit) and shouldSanaCast(Natures_Cure, Group[i].Unit) then
            CastSpellByID(Natures_Cure, Group[i].Unit)
                sanaDebug("Casting Natures Cure on", UnitName(Group[i].Unit))
        end
    end
end
