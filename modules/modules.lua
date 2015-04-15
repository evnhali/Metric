-- Loosely OOP implementation of modules.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private
local setmetatable, getmetatable = setmetatable, getmetatable

-- Search function for multiple inheritance
local function search(key, parents)
	local n = #parents
	for i = 1, n do
		local val = parents[i][key]
		if val then return val end
	end
end

-- Basic class implementation.
-- Accepts a list of Lua objects and returns a class that inherits from all of them in the order listed.
function Private.Utils.NewClass(...)
	local parents = { ... }
	local class = {}
	class.__index = class

	for i = 1, #parents do
		assert(type(parents[i]) == 'table', 'Invalid argument to NewClass.')
	end
	
	-- Inheritance
	setmetatable(class, {
		__index = function(t,k)
			return search(k, parents)
		end
	})

	-- Constructor
	function class:new(obj)
		obj = obj or {}
		setmetatable(obj, class)
		return obj
	end

	-- Add Inheritance
	function class:inherit(obj)
		arg[#arg + 1] = obj
	end

	return class
end


-- Create namespace for modules
Metric.Modules = {}

-- Modules implemented as classes
function Metric:NewModule(name, ...)
	assert(type(name) == 'string', 'Invalid argument to NewModule')
	assert(not Metric.Modules[name], 'Module already exists: ' .. name)
	Metric.Modules[name] = Private.Utils.NewClass(self, ...)
	return Metric.Modules[name]
end