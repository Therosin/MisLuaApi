---@class Global
---@field g_localActorId entityId 
---@field g_localActor entity `only on client`
local G = _G

--- local playerId - only on client
G.g_localActorId = nil

--- local Player - only on client
G.g_localActor = setmetatable(player,{__index = Player})

--
-- ─── COMMON TYPES ───────────────────────────────────────────────────────────────
--

-- Entity aliases
---@alias entity table
---@alias entityId userdata|number

-- Vector aliases
---@alias X_AXIS number|nil `X Axis`
---@alias Y_AXIS number|nil `Y Axis`
---@alias Z_AXIS number|nil `Z Axis`

--- vector - point = { x-axis, y-axis }
---@class vector
---@field x X_AXIS
---@field y Y_AXIS
local vector = {x = nil, y = nil}

--- vector3 - point = { x-axis, y-axis, z-axis }
---@class vector3
---@field x X_AXIS
---@field y Y_AXIS
---@field z Z_AXIS
local vector3 = {x = nil, y = nil, z = nil}

--
-- ─── CRYACTION ──────────────────────────────────────────────────────────────────
--
--- CE3 CryAction Interface
---| Contains basic Engine methods
---@class CryAction
local CryAction = CryAction

---* Are we Running onClient
---@return boolean
function CryAction.IsClient() end

---* Are we Running onServer
---@return boolean
function CryAction.IsDedicatedServer() end

--
-- ─── SYSTEM ─────────────────────────────────────────────────────────────────────
--
--- CE3 System Interface
---| Essential CE Methods eg Entities,CVars
---@class System
local System

---* Fetch All Entities
---@return table
function System.GetEntities() end

---* Fetch All Entities of a Specified Class
---@param class string
---@return table
function System.GetEntitiesByClass(class) end

---* Fetch an Entity using its entityId
---@param entityId userdata
---@return entity
function System.GetEntity(entityId) end

---* Fetch an Entity using its Name
---@param name string
---@return entity
function System.GetEntityByName(name) end

---* Returns the Class of an Entity by its entityId
---@param entityId userdata
---@return string
function System.GetEntityClass(entityId) end

---* Fetch All Entities
---@return table
function System.GetEntities() end

---* Fetch All Entities of a Specified Class
---@param class string
---@return table
function System.GetEntitiesByClass(class) end

--
-- ─── SCRIPT ─────────────────────────────────────────────────────────────────────
--
--- CE3 Script Interface
---@class Script
local Script
---* Reload a Script Folder
---@param path string
function Script.LoadScriptFolder(path) end

---* Reload a Script
---@param path string
function Script.ReloadScript(path) end

---* call a function after specified timer
---@param milli number miliseconds, timer
---@param f function function, to run
---@return userdata timerId
function Script.SetTimer(milli, f, ...) end

---* call a function after specified timer
---@param milli number miliseconds, timer
---@param f function function, to run
---@return userdata timerId
function Script.SetTimerForFunction(milli, f, ...) end

---* Use SafeKillTimer(timerId) instead, Kill an Active timer by timerId
---@param timerId userdata
function Script.KillTimer(timerId) end

--- CE3 GameRules Interface
---@class GameRules
local GameRules

---* Send a Message to a Player.
---| msgtype can be either 0 or 4 
---@param msgtype number
---@param playerId entityId
---@param message string

function GameRules:SendTextMessage(msgtype, playerId, message) end

--
-- ────────────────────────────────────────────────────────────────── EXPORTS ─────
--
_G["_G"] = G
_G["CryAction"] = CryAction
_G["System"] = System
_G["Script"] = Script
_G["g_gameRules"] = {game = GameRules}
