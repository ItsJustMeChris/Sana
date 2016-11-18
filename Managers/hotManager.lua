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
			hotTable[i].Effl = sanaUnitInEffl(target)
			hotTable[i].Germination = sanaHotIsTrueIsOne(target, "Rejuvenation (Germination)")
		end
	end return hotTable
end


function sanaUnitInEffl(unit)
	for i=1, ObjectCount() do
		for g=1, #Group do
		local name = ObjectName(ObjectWithIndex(i))
		local object = ObjectWithIndex(i)
		local x,y,z = ObjectPosition(object)
		if name == "Efflorescence" and ObjectExists(object) then
			if sanaGetRange(object, unit) <= 10 then
			return 1
			else return 0
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