-- Get addon-global namespace
local _, ns = ...

-- Localize globals
local LibStub = LibStub

-- Create addon with AceAddon
local Metric = LibStub('AceAddon-3.0'):NewAddon('Metric',
                                                --mixins
                                                'AceBucket-3.0',
                                                'AceComm-3.0',
                                                'AceConfig-3.0',
                                                'AceConsole-3.0',
                                                'AceDB-3.0',
                                                'AceDBOptions-3.0',
                                                'AceEvent-3.0',
                                                'AceGUI-3.0',
                                                'AceHook-3.0',
                                                'AceLocale-3.0',
                                                'AceSerializer-3.0',
                                                'AceTab-3.0',
                                                'AceTimer-3.0')

-- Register non-mixin libraries
Metric.CompressLib = LibStub:GetLibrary('LibCompress')
Metric.SpellLib    = LibStub:GetLibrary('LibPlayerSpells-1.0')
Metric.MediaLib    = LibStub:GetLibrary('LibSharedMedia-3.0')

-- Share data with other Metric files
ns.Util = {}       -- namespace for utility functions
ns.Metric = Metric