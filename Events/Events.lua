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
		end
	end
end)