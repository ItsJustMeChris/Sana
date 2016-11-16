function sanaBuff(target, buff, rank)
	if UnitBuff(target, buff, rank, "PLAYER") then
		return true
	end
end

function sanaMyBuff(target, buff, rank)
	if sanaBuff(target, buff, rank, "PLAYER") then
		return select(8, UnitBuff(target, buff, rank, "PLAYER")) == "player" 
	end
	return false
end

function sanaBuffRemaining (unit, SpellID)
	if sanaMyBuff(unit, SpellID, "", "PLAYER") then
    	return math.floor(select(7,UnitBuff(unit, "Lifebloom")) - GetTime())
    end
end

