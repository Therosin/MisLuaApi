---@class BaseBuildingSystem
--- Miscreated BaseBuilding Interface
local BaseBuildingSystem

--- Fetch all PlotSigns on Server
---@return table<number,entity>
function BaseBuildingSystem.GetPlotSigns() end

--- Fetch a specified PlotSign by Plotsign Id
---@param plotsignId entityId
---@return entity
function BaseBuildingSystem.GetPlotSign(plotsignId) end

_G["BaseBuildingSystem"] = {}