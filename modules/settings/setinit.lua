-- Persistent settings.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private

local defaults = {
	profile = {
	-- TODO: Add default settings
	}
}

local Settings = Metric:NewModule('Settings')

function Settings:init()
	local db = Private.Lib.DB:New('MetricDB', defaults, true)
	Settings:inherit(db)
end