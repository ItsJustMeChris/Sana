function sanaRotationStart()
	local playerSpec = GetSpecializationInfoByID()
	if playerSpec == 102 then
		balanceRotation()
	elseif playerSpec == 103 then
		feralRotation()
	elseif playerSpec == 104 then
		guardianRotation()
	elseif playerSpec == 105 then
		restoRotation()
	end
end