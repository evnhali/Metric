-- Get addon-global namespace
local _, ns   = ...

-- Localize globals
local LibStub = LibStub

-- Create addon with AceAddon
local Metric  = LibStub('AceAddon-3.0'):NewAddon('Metric',
                                                --embeds
                                                'AceBucket-3.0',
                                                'AceComm-3.0',
                                                'AceConsole-3.0',
                                                'AceEvent-3.0',
                                                'AceHook-3.0',
                                                'AceSerializer-3.0',
                                                'AceTimer-3.0')

-- Create namespace for shared utility functions and libraries
local Util    = {}

-- Register non-embeddable libraries
Util.CompressLib = LibStub('LibCompress')
Util.SpellLib    = LibStub('LibPlayerSpells-1.0')
Util.MediaLib    = LibStub('LibSharedMedia-3.0')
Util.ConfigLib   = LibStub('AceConfig-3.0')
Util.GUILib      = LibStub('AceGUI-3.0')
Util.DBLib       = LibStub('AceDB-3.0')
Util.DBOptLib    = LibStub('AceDBOptions-3.0')
Util.LocaleLib   = LibStub('AceLocale-3.0')

-- Share data with other Metric files
ns.Util   = Util       
ns.Metric = Metric