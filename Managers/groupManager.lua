Group = {
	
}

function sanaGetGroup()
	local groupType = IsInRaid() and "raid" or "party"
	for i=1, GetNumGroupMembers() do
		if groupType == "party" and i == GetNumGroupMembers() then
			table.insert(Group, {Unit = "player", Role = UnitGroupRolesAssigned("player")})
		else Unit = (groupType .. i)
			table.insert(Group, {Unit = Unit, Role = UnitGroupRolesAssigned(Unit)})
		end
	end
	return Group
end