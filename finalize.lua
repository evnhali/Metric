-- Get addon-global namespace
local _, ns = ...

-- Localize variables
local Metric  = ns.Metric
local Private = ns.Private

function Metric:OnInitialize()
	-- TODO: Write code to run when addon is loaded
	Private:RunAllTests(true) --DEBUG
end

function Metric:OnEnable()
	--TODO: Write code to run when addon is enabled
end

function Metric:OnDisable()
	--TODO: Write code to run when addon is disabled
end