-- Framework for modules.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private
local setmetatable = setmetatable

-- Prepare Metric as metatable for modules
Metric.__index = Metric

-- Create namespace for modules
Metric._modules = {}

-- Module constructor. Modules inherit from the object on which the constructor is called.
function Metric:NewModule(name)
	assert(type(name) == 'string', 'Invalid argument to NewModule')
	assert(not self._modules[name], string.format('Error in NewModule: Module already exists: %s', name))
	local mod = {}
	mod.__index = mod
	mod._modules = {}
	setmetatable(mod, self)
	self._modules[name] = mod
	return mod
end

function Metric:GetModule(name)
	assert(type(name) == 'string', 'Invalid argument to GetModule')
	assert(self._modules[name], string.format('Error in GetModule: Module does not exist: %s', name))
	return self._modules[name]
end