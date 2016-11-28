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

--    Config
LoadFile("Config.lua")
LoadFile("raidConfig.lua")

--    Core
LoadFile("Core\\Core.lua")
LoadFile("Core\\backendFunctions.lua")

--    Managers
LoadFile("Managers\\groupManager.lua")
LoadFile("Managers\\rotationManager.lua")
LoadFile("Managers\\hotManager.lua")
LoadFile("Managers\\bossManager.lua")
LoadFile("Managers\\locationManager.lua")

--    Events
LoadFile("Events\\Events.lua")

--    UnitAuras
LoadFile("UnitAuras\\Buffs.lua")
LoadFile("UnitAuras\\DeBuffs.lua")
LoadFile("UnitAuras\\Dispellable.lua")
LoadFile("UnitAuras\\smartDispell.lua")

--    Rotations
LoadFile("Rotations\\Druid\\restoRotation.lua")
LoadFile("Rotations\\Druid\\restoRaid.lua")
LoadFile("Rotations\\backendRotation.lua")

--    Spells
LoadFile("Spells\\restoTalents.lua")
LoadFile("Spells\\restoSpells.lua")
LoadFile("Spells\\diSpells.lua")

--    UI
LoadFile("UI\\sanaUIHealer.lua")
LoadFile("UI\\sanaUITank.lua")
LoadFile("UI\\sanaUILowest.lua")
