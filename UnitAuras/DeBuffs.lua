function sanaDeBuff(target, buff, rank)
	if UnitDebuff(target, buff, rank, "PLAYER") then
		return true
	end
end

function sanaMyDebuff(target, buff, rank)
	if select(8, UnitDebuff(target, buff, rank, "PLAYER")) == "player" then
		return true
	end
end