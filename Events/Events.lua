AddEventCallback("GROUP_ROSTER_UPDATE", function()
	table.wipe(Group)
	sanaGetGroup()
	table.wipe(hotTable)
	sanaFillHotTable()
end)

AddEventCallback("GROUP_JOINED", function()
	table.wipe(Group)
	sanaGetGroup()
	table.wipe(hotTable)
	sanaFillHotTable()
end)

AddEventCallback("UNIT_AURA", function(unitID)
	for i=1, #Group do
		if unitID == Group[i].Unit then
			sanaUpdateHotTable(unitID)
			return true
		end
		return true
	end
end)

AddEventCallback("ZONE_CHANGED_NEW_AREA", function()
print("We are in", GetRealZoneText())
location = GetRealZoneText()

end)
