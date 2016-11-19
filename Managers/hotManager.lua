hotTable = {
	
}

function sanaFillHotTable()
  local groupType = IsInRaid() and "raid" or "party"
	for i=1, GetNumGroupMembers() do
	  			local groupMem = (groupType .. i)
			table.insert(hotTable, {Unit = groupMem, Lifebloom = sanaHotIsTrueIsOne(groupMem, "Lifebloom"), Rejuv = sanaHotIsTrueIsOne(groupMem, "Rejuvenation"), Effl = 0,})
	end return hotTable
end

function sanaUpdateHotTable(target)
	for i=1, #hotTable do
		if hotTable[i].Unit ~= target or hotTable[i].Unit ~= nil then
			hotTable[i].Lifebloom = sanaHotIsTrueIsOne(target, "Lifebloom")
			hotTable[i].Rejuv = sanaHotIsTrueIsOne(target, "Rejuvenation")
			hotTable[i].Germination = sanaHotIsTrueIsOne(target, "Rejuvenation (Germination)")
		end
	end return hotTable
end


function sanaUnitInEffl()
	for i=1, ObjectCount() do
		for g=1, #Group do
			for h=1, #hotTable do
		local name = ObjectName(ObjectWithIndex(i))
		local object = ObjectWithIndex(i)
		local x,y,z = ObjectPosition(object)
		if name == "Efflorescence" and ObjectExists(object) then
			if sanaGetRange(object, Group[g].Name) <= 10 then
				hotTable[h].Effl = 1
				else hotTable[h].Effl = 0
			end
			end
		end
		end
	end
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