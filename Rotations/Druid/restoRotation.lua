
function restoRotation()
	if sanaInCombat() then
		sanaUpdateThese()
		sanaCheckRejuv()
		sanaCheckLifebloom()	

--		Tank Healing Prio 1
		if shouldSanaCast(774, tankUnit) and not sanaMyBuff(tankUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and tankHealth and tankHealth <= 99 then
			CastSpellByID(774, tankUnit)
			sanaDebug("Rejuv on", UnitName(tankUnit))
		end
		if shouldSanaCast(33763, tankUnit) and not sanaMyBuff(tankUnit, "Lifebloom", "") and sanaCheckLifebloom() < 1 and tankHealth and tankHealth <= 80 then
			CastSpellByID(33763, tankUnit)
						sanaDebug("Lifebloom on", UnitName(tankUnit))
		end
		if shouldSanaCast(8936, tankUnit) and not sanaMyBuff(lowestUnit, "Regrowth", "") and tankHealth and tankHealth <= 90 then
			CastSpellByID(8936, tankUnit)
						sanaDebug("Regrowth on", UnitName(tankUnit))
		end
		if shouldSanaCast(5185, tankUnit) and tankHealth and tankHealth <= 65 then
			CastSpellByID(5185, tankUnit)
						sanaDebug("Healing Touch on", UnitName(tankUnit))
		end
		if shouldSanaCast(18562, tankUnit) and tankHealth and tankHealth <= 40 then
			CastSpellByID(18562, tankUnit)
						sanaDebug("Healing Touch on", UnitName(tankUnit))
		end

--		Healer Healing prio 2
		if shouldSanaCast(774, healerUnit) and not sanaMyBuff(healerUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and healerHealth and healerHealth <= 99 then
			CastSpellByID(774, healerUnit)
						sanaDebug("Rejuv on", UnitName(healerUnit))
		end
		if shouldSanaCast(33763, healerUnit) and not sanaMyBuff(tankUnit, "Lifebloom", "") and sanaCheckLifebloom() < 1 and healerHealth and healerHealth <= 70 then
			CastSpellByID(33763, healerUnit)
						sanaDebug("Lifebloom on", UnitName(healerUnit))
		end
		if shouldSanaCast(8936, healerUnit) and not sanaMyBuff(lowestUnit, "Regrowth", "") and healerHealth and healerHealth <= 90 then
			CastSpellByID(8936, healerUnit)
						sanaDebug("Regrowth on", UnitName(healerUnit))
		end
		if shouldSanaCast(5185, healerUnit) and healerHealth and healerHealth <= 65 then
			CastSpellByID(5185, healerUnit)
						sanaDebug("Healing Touch on", UnitName(healerUnit))
		end
		if shouldSanaCast(18562, healerUnit) and healerHealth and healerHealth <= 40 then
			CastSpellByID(18562, healerUnit)
						sanaDebug("Healing Touch on", UnitName(healerUnit))
		end

--		Lowest Target Healing Prio 3
		if shouldSanaCast(774, lowestUnit) and not sanaMyBuff(lowestUnit, "Rejuvenation", "") and sanaCheckRejuv() < 5 and lowestHealth and lowestHealth <= 95 then
			CastSpellByID(774, lowestUnit)
						sanaDebug("Rejuv on", UnitName(lowestUnit))
		end
		if shouldSanaCast(8936, lowestUnit) and not sanaMyBuff(lowestUnit, "Regrowth", "") and lowestHealth and lowestHealth <= 85 then
			CastSpellByID(8936, lowestUnit)
						sanaDebug("Regrowth on", UnitName(lowestUnit))
		end
		if shouldSanaCast(5185, lowestUnit) and lowestHealth and lowestHealth <= 50 then
			CastSpellByID(5185, lowestUnit)
						sanaDebug("Healing Touch on", UnitName(lowestUnit))
		end
		if shouldSanaCast(18562, lowestUnit) and lowestHealth and lowestHealth <= 30 then
			CastSpellByID(18562, lowestUnit)
						sanaDebug("Healing Touch on", UnitName(lowestUnit))
		end
--		Special Spells/ Situational
		if sanaWildGrowth() then
			CastSpellByID(48438, tankUnit)
						sanaDebug("Wild Growth on", UnitName(tankUnit))
		end

		sanaEfflorscence()




--		Handle Affanities
--if sanaAffanity == true then
--	if select(10, GetTalentInfoByID(Guardian_Affinity)) == true then
--
--	elseif select(10, GetTalentInfoByID(Feral_Affinity)) == true then
--
--	elseif select(10, GetTalentInfoByID(Balance_Affinity)) == true then
--		print("test")
--		if shouldSanaCast(197625, "player") and not sanaMyBuff("player", "Moonkin Form", "") then
--			CastSpellByID(197625)
--		end
--		if shouldSanaCast(5176, "target") and sanaMyBuff("player", "Moonkin Form", "") then
--			CastSpellByID(5176, "target")
--		end
--		if shouldSanaCast(93402, "target") and sanaMyBuff("player", "Moonkin Form", "") and not sanaMyBuff("target", "Sunfire", "") then
--			CastSpellByID(93402, "target")
--		end
--		if shouldSanaCast(8921, "target") and sanaMyBuff("player", "Moonkin Form", "") and not sanaMyBuff("target", "Moonfire", "") then
--			CastSpellByID(8921, "target")
--		end
--		if shouldSanaCast(93402, "target") and sanaMyBuff("player", "Moonkin Form", "") and not sanaMyBuff("target", "Sunfire", "") then
--			CastSpellByID(93402, "target")
--		end
--		if shouldSanaCast(197626, "target") and sanaMyBuff("player", "Moonkin Form", "") and not sanaMyBuff("player", "Lunar Empowerment", "") then
--			CastSpellByID(197626, "target")
--		end
--		if shouldSanaCast(197628, "target") and sanaMyBuff("player", "Moonkin Form", "") and sanaMyBuff("player", "Lunar Empowerment", "") then
--			CastSpellByID(197628, "target")
--		end
--	end
--else 
--end























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