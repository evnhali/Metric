-- Framework for modules.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private
local setmetatable = setmetatable

-- Prepare Metric as metatable for modules
Metric.__index = Metric

-- Create namespace for modules
Metric.Modules = {}

-- Modules implemented as classes
function Metric:NewModule(name)
	assert(type(name) == 'string', 'Invalid argument to NewModule')
	assert(not Metric.Modules[name], 'Module already exists: ' .. name)
	Metric.Modules[name] = {}
	setmetatable(Metric.Modules[name], Metric)
	return Metric.Modules[name]
end