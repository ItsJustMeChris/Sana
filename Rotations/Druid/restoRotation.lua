
function restoRotation()
	if sanaInCombat() then
		sanaUpdateThese()
		sanaCheckRejuv()
		sanaCheckLifebloom()	
		

										--+------------+--
										--|Tank Healing|--
										--+------------+--


--		Rejuvenation on tank
		if shouldSanaCast(Rejuvenation, tankUnit) and not sanaMyBuff(tankUnit, "Rejuvenation", "") 
			and sanaCheckRejuv() <= Config.Rejuvenation_Active_Hots 
				and tankHealth >= Config.Tank_Rejuvenation_Min and tankHealth <= Config.Tank_Rejuvenation_Max 
					then
						CastSpellByID(Rejuvenation, tankUnit)
							sanaDebug("Rejuvenation on", UnitName(tankUnit))
		end

--		Lifebloom on tank
		if shouldSanaCast(Lifebloom, tankUnit) and not sanaMyBuff(tankUnit, "Lifebloom", "")
			and sanaCheckLifebloom() <= Config.Lifebloom_Active_Hots
				and tankHealth >= Config.Tank_Lifebloom_Min and tankHealth <= Config.Tank_Lifebloom_Max
					then
						CastSpellByID(Lifebloom, tankUnit)
							sanaDebug("Lifebloom on", UnitName(tankUnit))
		end

--		Regrowth on tank if not have buff
		if shouldSanaCast(Regrowth, tankUnit) and not sanaMyBuff(tankUnit, "Regrowth", "")
			and tankHealth >= Config.Tank_Regrowth_Buff_Min and tankHealth <= Config.Tank_Regrowth_Buff_Max
				then
					CastSpellByID(Regrowth, tankUnit)
						sanaDebug("Regrowth for buff on", UnitName(tankUnit))
		end

--		Regrowth on tank
		if shouldSanaCast(Regrowth, tankUnit)
			and tankHealth >= Config.Tank_Regrowth_Min and tankHealth <= Config.Tank_Regrowth_Max
				then
					CastSpellByID(Regrowth, tankUnit)
						sanaDebug("Regrowth to heal on", UnitName(tankUnit))
		end

--		Healing touch on tank
		if shouldSanaCast(Healing_Touch, tankUnit)
			and tankHealth >= Config.Tank_Healing_Touch_Min and tankHealth <= Config.Tank_Healing_Touch_Max
				then
					CastSpellByID(Healing_Touch, tankUnit)
						sanaDebug("Healing touch on", UnitName(tankUnit))
		end

--		Swiftmend on tank
		if shouldSanaCast(Swiftmend, tankUnit)
			and tankHealth >= Config.Tank_Swift_Mend_Min and tankHealth <= Config.Tank_Swift_Mend_Max
				then
					CastSpellByID(Swiftmend, tankUnit)
						sanaDebug("Swiftmend on", UnitName(tankUnit))
		end

--		Essence of Ghanir on tank
		if sanaEquipped(128306, 16) and shouldSanaCast(Essence_Of_Ghanir, tankUnit)
			and tankHealth >= Config.Tank_Essence_Of_Ghanir_Min and tankHealth <= Config.Tank_Essence_Of_Ghanir_Max
				then
					CastSpellByID(Essence_Of_Ghanir, tankUnit)
						sanaDebug("Essence Of Ghanir on", UnitName(tankUnit))
		end

--		Cenarion Ward on tank
		if sanaTalentTrue(Cenarion_Ward_Talent) and shouldSanaCast(Cenarion_Ward, tankUnit)
			and tankHealth >= Config.Tank_Cenarion_Ward_Min and tankHealth <= Config.Tank_Cenarion_Ward_Max
				then
					CastSpellByID(Cenarion_Ward, tankUnit)
						sanaDebug("Cenarion Ward on", UnitName(tankUnit))
		end

--		Incarnation Tree if tank under X%
		if sanaTalentTrue(Incarnation_Tree_of_Life_Talent) and shouldSanaCast(Incarnation_Tree_Of_Life, tankUnit)
			and tankHealth >= Config.Tank_Incarnation_Tree_Of_Life_Min and tankHealth <= Config.Tank_Incarnation_Tree_Of_Life_Max
				then
					CastSpellByID(Incarnation_Tree_Of_Life)
						sanaDebug("Incarnation: Tree Of Life caused by", UnitName(tankUnit))
		end

--		Ironbark on tank
		if shouldSanaCast(Ironbark, tankUnit)
			and tankHealth >= Config.Tank_Ironbark_Min and tankHealth <= Config.Tank_Ironbark_Max
				then
					CastSpellByID(Ironbark, tankUnit)
						sanaDebug("Ironbark on", UnitName(tankUnit))
		end


										--+--------------+--
										--|Healer Healing|--
										--+--------------+--


--		Rejuvenation on healer
		if shouldSanaCast(Rejuvenation, healerUnit) and not sanaMyBuff(healerUnit, "Rejuvenation", "") 
			and sanaCheckRejuv() <= Config.Rejuvenation_Active_Hots 
				and healerHealth >= Config.Healer_Rejuvenation_Min and healerHealth <= Config.Healer_Rejuvenation_Max 
					then
						CastSpellByID(Rejuvenation, healerUnit)
							sanaDebug("Rejuvenation on", UnitName(healerUnit))
		end

--		Lifebloom on healer
		if shouldSanaCast(Lifebloom, healerUnit) and not sanaMyBuff(healerUnit, "Lifebloom", "")
			and sanaCheckLifebloom() <= Config.Lifebloom_Active_Hots
				and healerHealth >= Config.Healer_Rejuvenation_Min and healerHealth <= Config.Healer_Rejuvenation_Max
					then
						CastSpellByID(Lifebloom, healerUnit)
							sanaDebug("Lifebloom on", UnitName(healerUnit))
		end

--		Regrowth on healer if not have buff
		if shouldSanaCast(Regrowth, healerUnit) and not sanaMyBuff(healerUnit, "Regrowth", "")
			and healerHealth >= Config.Healer_Regrowth_Buff_Min and healerHealth <= Config.Healer_Regrowth_Buff_Max
				then
					CastSpellByID(Regrowth, healerUnit)
						sanaDebug("Regrowth for buff on", UnitName(healerUnit))
		end

--		Regrowth on healer
		if shouldSanaCast(Regrowth, healerUnit)
			and healerHealth >= Config.Healer_Regrowth_Min and healerHealth <= Config.Healer_Regrowth_Max
				then
					CastSpellByID(Regrowth, healerUnit)
						sanaDebug("Regrowth to heal on", UnitName(healerUnit))
		end

--		Healing touch on healer
		if shouldSanaCast(Healing_Touch, healerUnit)
			and healerHealth >= Config.Healer_Healing_Touch_Min and healerHealth <= Config.Healer_Healing_Touch_Max
				then
					CastSpellByID(Healing_Touch, healerUnit)
						sanaDebug("Healing touch on", UnitName(healerUnit))
		end

--		Swiftmend on healer
		if shouldSanaCast(Swiftmend, healerUnit)
			and healerHealth >= Config.Healer_Swift_Mend_Min and healerHealth <= Config.Healer_Swift_Mend_Max
				then
					CastSpellByID(Swiftmend, healerUnit)
						sanaDebug("Swiftmend on", UnitName(healerUnit))
		end

--		Essence of Ghanir on healer
		if sanaEquipped(128306, 16) and shouldSanaCast(Essence_Of_Ghanir, healerUnit)
			and healerHealth >= Config.Healer_Essence_Of_Ghanir_Max and healerHealth <= Config.Healer_Essence_Of_Ghanir_Max
				then
					CastSpellByID(Essence_Of_Ghanir, healerUnit)
						sanaDebug("Essence Of Ghanir on", UnitName(healerUnit))
		end

--		Cenarion Ward on healer
		if sanaTalentTrue(Cenarion_Ward_Talent) and shouldSanaCast(Cenarion_Ward, healerUnit)
			and healerHealth >= Config.Healer_Cenarion_Ward_Min and healerHealth <= Config.Healer_Cenarion_Ward_Max
				then
					CastSpellByID(Cenarion_Ward, healerUnit)
						sanaDebug("Cenarion Ward on", UnitName(healerUnit))
		end

--		Incarnation tree of life if healer under X%
		if sanaTalentTrue(Incarnation_Tree_of_Life_Talent) and shouldSanaCast(Incarnation_Tree_Of_Life, healerUnit)
			and healerHealth >= Config.Healer_Incarnation_Tree_Of_Life_Min and healerHealth <= Config.Healer_Incarnation_Tree_Of_Life_Max
				then
					CastSpellByID(Incarnation_Tree_Of_Life)
						sanaDebug("Incarnation: Tree Of Life caused by", UnitName(healerUnit))
		end

--		Ironbark on healer
		if shouldSanaCast(Ironbark, healerUnit)
			and healerHealth >= Config.Healer_Ironbark_Min and healerHealth <= Config.Healer_Ironbark_Max
				then
					CastSpellByID(Ironbark, healerUnit)
						sanaDebug("Ironbark on", UnitName(healerUnit))
		end

										--+--------------+--
										--|Lowest Healing|--
										--+--------------+--

--		Rejuvenation on lowest
		if shouldSanaCast(Rejuvenation, lowestUnit) and not sanaMyBuff(lowestUnit, "Rejuvenation", "") 
			and sanaCheckRejuv() <= Config.Rejuvenation_Active_Hots 
				and lowestHealth >= Config.Lowest_Rejuvenation_Min and lowestHealth <= Config.Lowest_Rejuvenation_Max 
					then
						CastSpellByID(Rejuvenation, lowestUnit)
							sanaDebug("Rejuvenation on", UnitName(lowestUnit))
		end

--		Lifebloom on lowest
		if shouldSanaCast(Lifebloom, lowestUnit) and not sanaMyBuff(lowestUnit, "Lifebloom", "")
			and sanaCheckLifebloom() <= Config.Lifebloom_Active_Hots
				and lowestHealth >= Config.Lowest_Rejuvenation_Min and lowestHealth <= Config.Lowest_Rejuvenation_Max
					then
						CastSpellByID(Lifebloom, lowestUnit)
							sanaDebug("Lifebloom on", UnitName(lowestUnit))
		end

--		Regrowth on lowest if not have buff
		if shouldSanaCast(Regrowth, lowestUnit) and not sanaMyBuff(lowestUnit, "Regrowth", "")
			and lowestHealth >= Config.Lowest_Regrowth_Buff_Min and lowestHealth <= Config.Lowest_Regrowth_Buff_Max
				then
					CastSpellByID(Regrowth, lowestUnit)
						sanaDebug("Regrowth for buff on", UnitName(lowestUnit))
		end

--		Regrowth on lowest
		if shouldSanaCast(Regrowth, lowestUnit)
			and lowestHealth >= Config.Lowest_Regrowth_Min and lowestHealth <= Config.Lowest_Regrowth_Max
				then
					CastSpellByID(Regrowth, lowestUnit)
						sanaDebug("Regrowth to heal on", UnitName(lowestUnit))
		end

--		Healing touch on lowest
		if shouldSanaCast(Healing_Touch, lowestUnit)
			and lowestHealth >= Config.Lowest_Healing_Touch_Min and lowestHealth <= Config.Lowest_Healing_Touch_Max
				then
					CastSpellByID(Healing_Touch, lowestUnit)
						sanaDebug("Healing touch on", UnitName(lowestUnit))
		end

--		Swiftmend on lowest
		if shouldSanaCast(Swiftmend, lowestUnit)
			and lowestHealth >= Config.Lowest_Swift_Mend_Min and lowestHealth <= Config.Lowest_Swift_Mend_Max
				then
					CastSpellByID(Swiftmend, lowestUnit)
						sanaDebug("Swiftmend on", UnitName(lowestUnit))
		end

--		Essence of ghanir on lowest
		if sanaEquipped(128306, 16) and shouldSanaCast(Essence_Of_Ghanir, lowestUnit)
			and lowestHealth >= Config.Lowest_Essence_Of_Ghanir_Max and lowestHealth <= Config.Lowest_Essence_Of_Ghanir_Max
				then
					CastSpellByID(Essence_Of_Ghanir, lowestUnit)
						sanaDebug("Essence Of Ghanir on", UnitName(lowestUnit))
		end

--		Cenarion Ward on lowest
		if sanaTalentTrue(Cenarion_Ward_Talent) and shouldSanaCast(Cenarion_Ward, lowestUnit)
			and lowestHealth >= Config.Lowest_Cenarion_Ward_Min and lowestHealth <= Config.Lowest_Cenarion_Ward_Max
				then
					CastSpellByID(Cenarion_Ward, lowestUnit)
						sanaDebug("Cenarion Ward on", UnitName(lowestUnit))
		end

--		Incarnation tree of life on lowest
		if sanaTalentTrue(Incarnation_Tree_of_Life_Talent) and shouldSanaCast(Incarnation_Tree_Of_Life, lowestUnit)
			and lowestHealth >= Config.Lowest_Incarnation_Tree_Of_Life_Min and lowestHealth <= Config.Lowest_Incarnation_Tree_Of_Life_Max
				then
					CastSpellByID(Incarnation_Tree_Of_Life)
						sanaDebug("Incarnation: Tree Of Life caused by", UnitName(lowestUnit))
		end

--		Ironbark on lowest
		if shouldSanaCast(Ironbark, lowestUnit)
			and lowestHealth >= Config.Lowest_Ironbark_Min and lowestHealth <= Config.Lowest_Ironbark_Max
				then
					CastSpellByID(Ironbark, lowestUnit)
						sanaDebug("Ironbark on", UnitName(lowestUnit))
		end

		--sanaEfflorscence()




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