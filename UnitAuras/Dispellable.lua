function sanaDispellable(buffID, unit)
	local debuff = select(3, GetSpellInfo(buffID))
if sanaDeBuff(unit, buffID) then
dispellType = select(4, sanaDeBuff(unit, debuff))
if dispellType == "Curse" or "Magic" or "Poison" then
  return true;
end
else return false;
end
end
