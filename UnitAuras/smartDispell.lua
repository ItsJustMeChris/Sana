function sanaDispell(target)
	for i=1, #Dispell do
		if sanaDispellable(target) and sanaTick >= .750 and sanaDeBuff(target, Dispell[i]) then
			return true
		end
	end
end