-- Data collection.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private

local Data = Metric:GetModule('Data')
local db = Data.db

local function printEvent(event, ...)
	if event == 'COMBAT_LOG_EVENT_UNFILTERED' then
		Data:Print(...)
	end
end

data:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED', printEvent)