location = nil

function locationCheck(loc)
    if location ~= nil then
        if string.find(location, loc) then
            return true
        else
            return false
        end
    end
end
