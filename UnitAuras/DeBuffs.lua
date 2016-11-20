function sanaDeBuff(target, buff, rank)
	theDebuff = select(3, GetSpellnfo(buff))
	if UnitDebuff(target, theDebuff, rank) then
		return true
	end
end

function sanaMyDebuff(target, buff, rank)
	if select(8, UnitDebuff(target, buff, rank, "PLAYER")) == "player" then
		return true
	end
end