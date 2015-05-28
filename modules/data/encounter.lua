-- Sub-module that stores information about an encounter.

-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric, Private = ns.Metric, ns.Private
local setmetatable = setmetatable

local Data = Metric:GetModule('Data')
local db = Data.db
db.char.encounters = db.char.encounters or {}
local encs = db.char.encounters

local Encounter = Data:NewModule('Encounter')

local curEnc

function Encounter:New()
	if curEnc then curEnc:Archive
	curEnc = {}
	setmetatable(curEnc, self)
	return curEnc
end

function Encounter:Archive()
	encs[#encs + 1] = Private.Lib.Compress.Compress(self)
end