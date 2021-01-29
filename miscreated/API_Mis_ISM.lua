--- ItemSpawnerManager
---@class ISM
local ISM = {}

---* Give an item to a Player
---@param playerId entityId     `player to give item to`
---@param class string          `classname of item to give`
---@param tryToEquip boolean    `if true try to equip the item`
function ISM.GiveItem(playerId, class, tryToEquip) end

---* Spawn an item at the Given WorldPos
---@param class string          `classname of item to spawn`
---@param vSpawnPos vector3     `where to spawn item`
function ISM.SpawnItem(class, vSpawnPos) end

---* Spawn an item of Specified Catagory at the Given World Pos
---@param catagory string       `catagory to spawn from`
---@param vSpawnPos vector3     `where to spawn item`
function ISM.SpawnCategory(catagory, vSpawnPos) end

--
-- ────────────────────────────────────────────────────────────────── EXPORTS ─────
--
_G["ISM"] = ISM
