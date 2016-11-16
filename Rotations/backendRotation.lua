local lifebloomcount = 0
local rejuvcount = 0
local unitsnear = 0
function sanaEfflorescence()
	for g=1, #Group do
  for i=1, ObjectCount() do
    local name = ObjectName(ObjectWithIndex(i))
    local object = ObjectWithIndex(i)
    local efflunitname = Group[g].Name	
    local efllunitraw = Group[g].Unit
    if name == "Efflorescence" and ObjectExists(efllunitraw) and sanaGetRange(efllunitraw, object) <= 10 then
    	sanaUpdateEfflorescence(efllunitraw)
    end
    end
  end
end

function sanaCheckLifebloom()
  for i = 1, #hotTable do
    if hotTable[i].Lifebloom == true then
      lifebloomcount = lifebloomcount + 1
    end
  end
  return lifebloomcount
end

function sanaCheckRejuv()
  for i = 1, #hotTable do
    if hotTable[i].Rejuv == true then
      rejuvcount = rejuvcount + 1
    end
  end
  return rejuvcount
end

function sanaShouldIEffl()
	for i=1, #Group do
		if unitsnear == 3 then
			return true
		end
	end
end

function sanaHowManyNear(target, other)
	for i=1, #Group do
		if sanaGetRange(target, other) then
			unitsnear = unitsnear + 1
		end
	end return unitsnear
end