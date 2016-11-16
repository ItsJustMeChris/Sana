function restoRotation()
	if not sanaBuff("player","Rejuvenation","") then
		CastSpellByID(774, "player")
		sanaDebug("Rejuv casted on", UnitName("player"))
	end
end