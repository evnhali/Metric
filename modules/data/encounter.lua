-- Sub-module that stores information about an encounter.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private

local Data = Metric:GetModule('Data')
local db = Data.db

local Encounter = Data:NewModule('Encounter')

