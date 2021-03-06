--
-- ─── COMMON TYPES ───────────────────────────────────────────────────────────────
--

-- Entity aliases
---@alias entityId userdata|number

-- basic entity class
---@class CE3.entity
---@field id entityId - entityId of the current entity
---@field GetRawId fun(self:entity):string - Get This Entities RawId (entityId in Hex)
---@field GetName fun(self:entity):string - Get this Entities Name
---@field GetPos fun(self:entity):vector3 - Get this Entities Current Position
---@field GetWorldPos fun(self:entity):vector3 - Get this Entities Current WorldPosition

--- basic player class
---@class CE3.player : CE3.entity
---@field player CE3.playerInstance
---@field actor table

--- playerInstance wrapper class
---@class CE3.playerInstance
---@field GetSteam64Id fun(self:player):string `Get This Players Steam64Id`

---@alias entity CE3.entity
---@alias player CE3.player


local Player ---@type player
local player

--- local player - only on client
_G['g_localActor'] = setmetatable(player,{__index = Player})

--- local playerId - only on client
_G['g_localActorId'] = player.id

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

---* Checks the current players list.
---@return table<number,player>
function CryAction.GetPlayerList() end
--
-- ─── SYSTEM ─────────────────────────────────────────────────────────────────────
--
--- CE3 System Interface
---| Essential CE Methods eg Entities,CVars
---@class System
local System = System

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

---* Execute a console command
---@param command string `command to execute`
function System.ExecuteCommand(command) end

---* Checks if Running in Editor
---@return boolean `true if running in editor else false`
function System.IsEditor() end

---* Gets the Value of a Cvar
---@param key string `cvar key to get`
---@return nil|number|string
function System.GetCVar(key) end

---* Sets the Value of a Cvar
---@param key string `cvar key to set`
---@param value string|number `value to set`
function System.SetCVar(key, value) end

---* Spawn an Entity
--- spawnParams is a table defining at least
---{ class = "applefresh", pos = { x = 123, y=123, z=123 } }
---@param spawnParams table
function System.SpawnEntity(spawnParams) end

---Register a Console Commmand
-- sCommand should be the string name of a function to call passing assigned parameters,eg
-- myCommand(%1,%2)
---@param sCCommandName string `C command name.`
---@param sCommand string `Command string`
---@param sHelp string `Help for the command usage.`
function System.AddCCommand(sCCommandName, sCommand, sHelp) end

--
-- ─── SCRIPT ─────────────────────────────────────────────────────────────────────
--
--- CE3 Script Interface
---@class Script
local Script = Script
---* Reload a Script Folder
---@param path string
function Script.LoadScriptFolder(path) end

---* Reload a Script
---@param path string
function Script.ReloadScript(path) end

---* call a function after specified timer
---@param  milli    number      miliseconds, timer
---@param  f        function    function, to run
---@return userdata timerId
function Script.SetTimer(milli, f, ...) end

---* call a function after specified timer
---@param  milli    number      miliseconds, timer
---@param  f        function    function, to run
---@vararg any                  any further params
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
_G['CryAction'] = CryAction
_G['System'] = System
_G['Script'] = Script
_G['g_gameRules'] = {game = GameRules}
