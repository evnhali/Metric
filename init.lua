-- Initialization script for Metric addon.
	-- Registers with the AceAddon framework and obtains a public namespace.
	-- Embeds embeddable libraries.
	-- Creates a private namespace for utility functions.
	-- Initializes non-embeddable libraries.
	-- Creates Ace databases from saved variables files.
	-- Shares public and private namespaces with other Metric files.

-- Get addon-global namespace
local _, ns   = ...

-- Localize globals
local LibStub = LibStub

-- Register with AceAddon
local Metric  = LibStub('AceAddon-3.0'):NewAddon('Metric',
                                                --embeds
                                                'AceBucket-3.0',
                                                'AceComm-3.0',
                                                'AceConsole-3.0',
                                                'AceEvent-3.0',
                                                'AceHook-3.0',
                                                'AceSerializer-3.0',
                                                'AceTimer-3.0')

-- Create private namespace for shared utility functions and libraries
local Private    = {}

-- Initialize non-embeddable libraries
Private.CompressLib = LibStub('LibCompress')
Private.SpellLib    = LibStub('LibPlayerSpells-1.0')
Private.MediaLib    = LibStub('LibSharedMedia-3.0')
Private.ConfigLib   = LibStub('AceConfig-3.0')
Private.GUILib      = LibStub('AceGUI-3.0')
Private.DBLib       = LibStub('AceDB-3.0')
Private.DBOptLib    = LibStub('AceDBOptions-3.0')
Private.LocaleLib   = LibStub('AceLocale-3.0')

-- Create databases


-- Share data with other Metric files
ns.Private   = Private       
ns.Metric = Metric