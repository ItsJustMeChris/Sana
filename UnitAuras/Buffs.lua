function sanaBuff(target, buff, rank)
	if UnitBuff(target, buff, rank, "PLAYER") then
		return true
	end
end

function sanaMyBuff(target, buff, rank)
	if select(8, UnitBuff(target, buff, rank, "PLAYER")) == "player" then
		return true
	end
end