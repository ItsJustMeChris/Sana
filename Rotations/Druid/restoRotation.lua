
function restoRotation()
	if sanaInCombat() then
		sanaUpdateThese()
		sanaCheckRejuv()
		sanaCheckLifebloom()	

		if shouldSanaCast(774, tankUnit) and not sanaMyBuff(tankUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and tankHealth and tankHealth <= 99 then
			CastSpellByID(774, tankUnit)
			sanaDebug("Rejuv on", UnitName(tankUnit))
		end
		if shouldSanaCast(33763, tankUnit) and not sanaMyBuff(tankUnit, "Lifebloom", "") and sanaCheckLifebloom() < 1 and tankHealth and tankHealth <= 70 then
			CastSpellByID(33763, tankUnit)
						sanaDebug("Lifebloom on", UnitName(tankUnit))
		end
		if shouldSanaCast(8936, tankUnit) and tankHealth and tankHealth <= 90 then
			CastSpellByID(8936, tankUnit)
						sanaDebug("Regrowth on", UnitName(tankUnit))
		end
		if shouldSanaCast(774, healerUnit) and not sanaMyBuff(healerUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and healerHealth and healerHealth <= 99 then
			CastSpellByID(774, healerUnit)
						sanaDebug("Rejuv on", UnitName(healerUnit))
		end
		if shouldSanaCast(33763, healerUnit) and not sanaMyBuff(tankUnit, "Lifebloom", "") and sanaCheckLifebloom() < 1 and healerHealth and healerHealth <= 70 then
			CastSpellByID(33763, healerUnit)
						sanaDebug("Lifebloom on", UnitName(healerUnit))
		end
		if shouldSanaCast(8936, healerUnit) and healerHealth and healerHealth <= 90 then
			CastSpellByID(8936, healerUnit)
						sanaDebug("Regrowth on", UnitName(healerUnit))
		end
		if shouldSanaCast(774, lowestUnit) and not sanaMyBuff(lowestUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and lowestHealth and lowestHealth <= 95 then
			CastSpellByID(774, lowestUnit)
						sanaDebug("Rejuv on", UnitName(lowestUnit))
		end
		if shouldSanaCast(33763, lowestUnit) and not sanaMyBuff(lowestUnit, "Lifebloom", "") and sanaCheckLifebloom() < 1 and lowestHealth and lowestHealth <= 60 then
			CastSpellByID(33763, lowestUnit)
						sanaDebug("Lifebloom on", UnitName(lowestUnit))
		end
		if shouldSanaCast(8936, lowestUnit) and lowestHealth and lowestHealth <= 85 then
			CastSpellByID(8936, lowestUnit)
						sanaDebug("Regrowth on", UnitName(lowestUnit))
		end

























	end
	table.sort(Group, function(a,b)
		if UnitIsDeadOrGhost(a.Unit) then 
	 		return false 
		elseif UnitIsDeadOrGhost(b.Unit) then 
	 		return true 
		else 
	 		return sanaGetHealth(a.Unit) < sanaGetHealth(b.Unit) 
		end 
	end)
	sanaUpdateThese()
end