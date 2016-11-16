local WowAddon = GetWoWDirectory() .. "\\" .. "Interface" .. "\\" ..  "Addons" .. "\\"
local AddonName = "Sana"
local Root =  WowAddon .. AddonName .. "\\"




function LoadFile(FilePath,LoadMsg)
  lua = ReadFile(Root .. FilePath)
  
  if not lua then
    print(Root .. FilePath .. " Does not exist")
  end
  
  local func,err = loadstring(lua,Root .. "\\" .. FilePath)
  if err then
    error(err,0)
  end
  pcall(func)
  if LoadMsg then
    print(LoadMsg)
  end
end

--    Core
LoadFile("Core\\Core.lua")
LoadFile("Core\\backendFunctions.lua")

--    Managers
LoadFile("Managers\\groupManager.lua")
LoadFile("Managers\\rotationManager.lua")

--    Events
LoadFile("Events\\Events.lua")

--    UnitAuras
LoadFile("UnitAuras\\Buffs.lua")
LoadFile("UnitAuras\\DeBuffs.lua")
LoadFile("UnitAuras\\Dispellable.lua")

--    Rotations
LoadFile("Rotations\\Druid\\restoRotation.lua")