-- Persistent settings.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private

local Data = Metric:NewModule('Data')

function Data:init()
	Data.db = Private.Lib.DB:New('MetricPerCharacterDB')
end