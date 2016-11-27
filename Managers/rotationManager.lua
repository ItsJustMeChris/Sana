function sanaRotationStart()
	local playerSpec = GetSpecializationInfo(GetSpecialization())
	if playerSpec == 102 then
		balanceRotation()
	elseif playerSpec == 103 then
		feralRotation()
	elseif playerSpec == 104 then
		guardianRotation()
	elseif playerSpec == 105 then
			if locationCheck("Emerald Nightmare") then
				restoRaid()
			else
			restoRotation()
		end
	end
end
