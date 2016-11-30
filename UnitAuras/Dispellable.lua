function sanaDispellable(buffID, unit)
	local debuff = select(3, GetSpellInfo(buffID))
    if sanaDeBuff(unit, buffID) then
        local dispellType = select(4, sanaDeBuff(unit, debuff))
            if dispellType == "Curse" or "Magic" or "Poison" then
                return true;
                    else
                return false;
            end
    end
end