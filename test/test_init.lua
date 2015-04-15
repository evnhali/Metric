-- Get addon-global namespace
local _, ns = ...

-- Localize globals and addon-globals
local Metric = ns.Metric
local Util   = ns.Util

-- Check if namespaces were initialized correctly
assert(Metric, 'Metric namespace not found.')
assert(Util, 'Util namespace not found.')
assert(Metric.Print, 'AceConsole embed failed - printing not available.')

-- Initialize test suite
Util.TestSuite = {}
function Util:RunAllTests(verbose)
	for _, test in pairs(self.TestSuite) do
		test(verbose)
	end
end

local Tests = {}

-- List all embedded libraries here
local embeds = {
	-- Syntax: 'Name of Embedded Library' = 'Function Provided By Library'
	AceBucket     = 'RegisterBucketEvent',
	AceComm       = 'RegisterComm',
	AceEvent      = 'RegisterEvent',
	AceHook       = 'Hook',
	AceSerializer = 'Serialize',
	AceTimer      = 'ScheduleTimer'
}

local function embedTestResult(name, pass)
	return string.format('%s embed %s.', name, (pass and 'successful' or 'failed'))
end

local function isEmbedded(name, func, verbose)
	local pass = Metric[func] and true
	if verbose then
		Metric.Print(embedTestResult(name, pass))
	end
	return pass
end

local function groupTestResult(name, numberFailed)
	if numberFailed == 0 then
		return string.format('All %s tests passed.', name)
	else
		return string.format('%d %s %s failed.', numberFailed, name, numberFailed == 1 and 'test' or 'tests')
	end
end

-- Check if all embeds were successful
function Tests.EmbedsExist(verbose)
	local numberFailed = 0
	for name, func in pairs(embeds) do
		local pass = isEmbedded(name, func, verbose)
		numberFailed = numberFailed + (pass and 0 or 1)
	end
	Metric.Print(groupTestResult('embed', numberFailed))
	return numberFailed == 0
end

function Util.TestSuite.TestInit(verbose)
	local numberFailed = 0
	for _, test in pairs(Tests) do
		local pass = test(verbose)
		numberFailed = numberFailed + (pass and 0 or 1)
	end
	Metric.Print(groupTestResult('initialization', numberFailed))
	return numberFailed == 0
end