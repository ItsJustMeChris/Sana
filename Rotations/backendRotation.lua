 function sanaEfflorescence()
	for g=1, #Group do
  for i=1, ObjectCount() do
    local name = ObjectName(ObjectWithIndex(i))
    local object = ObjectWithIndex(i)
    local efflunitname = Group[g].Name	
    local efllunitraw = Group[g].Unit
    if name == "Efflorescence" and ObjectExists(efllunitraw) and sanaGetRange(efllunitraw, object) <= 10 then
    	sanaUpdateEfflorescence(efllunitraw)
    end
    end
  end
end

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

function sanaShouldIEffl()
	for i=1, #Group do
		if unitsnear == 3 then
			return true
		end
	end
end

function sanaHowManyNear(target, other)
	for i=1, #Group do
		if sanaGetRange(target, other) then
			unitsnear = unitsnear + 1
		end
	end return unitsnear
end

function shouldSanaCast(spell, unit)
	spell = spell
	if unit == nil then return false end
	if sanaUnitInRange(unit) and sanaGetCooldown(spell) then
		if (select(4, GetSpellInfo(spell)) == 0) and UnitMovementFlags("player") <= 1 then 
			return true
		elseif (select(4, GetSpellInfo(spell)) ~= 0 and UnitMovementFlags("player") == 0) then
			return true
			else print("castThrow") return false
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