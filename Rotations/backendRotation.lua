local lifebloomcount = 0
local rejuvcount = 0
function sanaEfflorescence()
	for g=1, #Group do
  for i=1, ObjectCount() do
    local name = ObjectName(ObjectWithIndex(i))
    local object = ObjectWithIndex(i)
    if name == "Efflorescence" and sanaGetRange(units, object) <= 10 then
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