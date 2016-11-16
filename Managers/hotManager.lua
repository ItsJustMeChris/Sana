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
			hotTable[i].Lifebloom = sanaBuff(target, "Lifebloom", "", "PLAYER")
			hotTable[i].Rejuv = sanaBuff(target, "Rejuvenation", "", "PLAYER")
		end
	end return hotTable
end

function sanaUpdateEfflorescence(target)
	for i=1, #hotTable do
		if hotTable[i].Unit ~= target then
			hotTable[i].Effl = sanaBuff(target, "Spring Blossoms", "", "PLAYER")
		end
	end return hotTable
end