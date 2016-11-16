function sanaDispellable(target)
	for i=1,40 do
		if select(5, UnitDebuff(target, i)) == ("Magic" or "Curse" or "Poison") then
			return true
		end
	end
end