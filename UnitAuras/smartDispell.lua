function sanaDispell(target)
	for i=1, #Dispell do
		if sanaDispellable(Dispell[i], target) and sanaTick >= .750 then
			return true
		else
			return false
		end
	end
end
