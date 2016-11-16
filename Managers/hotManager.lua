hotTable = {
	
}

function sanaFillHotTable()
  local groupType = IsInRaid() and "raid" or "party"
	for i=1, GetNumGroupMembers() do
	  			local groupMem = (groupType .. i)
			table.insert(hotTable, {Unit = groupMem, Lifebloom = sanaBuff(groupMem, "Lifebloom", "", "PLAYER"), Rejuv = sanaBuff(groupMem, "Rejuvenation", "", "PLAYER"), Effl = false})
	end return hotTable
end

function sanaUpdateHotTable(target)
	for i=1, #hotTable do
		if hotTable[i].Unit ~= target then
			hotTable[i].Lifebloom = sanaHotIsTrueIsOne(target, "Lifebloom")
			hotTable[i].Rejuv = sanaHotIsTrueIsOne(target, "Rejuvenation")
		end
	end return hotTable
end

function sanaUpdateEfflorescence(target)
	for i=1, #hotTable do
		if hotTable[i].Unit ~= target then
			hotTable[i].Effl = sanaHotIsTrueIsOne(target, "Spring Blossoms")
		end
	end return hotTable
end

function sanaHotIsTrueIsOne(target, hot)
	if sanaBuff(target, hot, "", "PLAYER") then
		return 1
		else return 0
	end
end