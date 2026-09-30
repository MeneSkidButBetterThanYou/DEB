-- Deobfuscated by deobf (dynamic trace)
-- source: KaitunGodMax.luau
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: Wrong game
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/WhiteX1208/WhiteX1208Output/KaitunGodMax.deobf.luau.harness.luau:5335
--   Script:3 function F8
--   Script:3
--   Script:3
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/WhiteX1208/WhiteX1208Output/KaitunGodMax.deobf.luau.harness.luau:5340
--   
-- 57 statements recorded in 1.89s

-- [deobf] removed 55 lines of the obfuscator's environment/anti-tamper probes
game:IsLoaded()

getgenv().KaitunConfig = {
	["Auto Chat"] = { Enabled = false, Message = "" },
	["Auto Join Team"] = { Enabled = true, Team = "Pirates" },
	["Auto Stats"] = { Cap = 2800, Enabled = true, Order = { "Melee", "Defense", "Sword" } },
	Farm = {
		["Double Quest"] = true,
		["Fragment Goal"] = 50000,
		Fragments = false,
		["Melee Mastery"] = false,
		["Random Fruit"] = true,
		["Redeem Codes"] = true,
		["Sword Mastery"] = false,
		["Triple Quest"] = false
	},
	Haki = { Enhancement = true, ["Flash Step"] = true, Observation = true, Skyjump = true },
	Items = {
		Bisento = true,
		["Cursed Dual Katana"] = true,
		Cutlass = true,
		["Dragon Trident"] = true,
		["Dual Katana"] = true,
		["Dual-Headed Blade"] = true,
		Godhuman = true,
		["Gravity Blade"] = true,
		["Iron Mace"] = true,
		Katana = true,
		["Mirror Fractal"] = true,
		Pipe = true,
		["Pole V1"] = true,
		Rengoku = true,
		Saber = true,
		["Shark Anchor"] = true,
		["Skull Guitar"] = true,
		["Soul Cane"] = true,
		["Triple Katana"] = true
	},
	Performance = {
		["Anti AFK"] = true,
		FPS = 60,
		["Fix Lag"] = true,
		["Hide Notifications"] = true,
		["Lock FPS"] = true,
		["White Screen"] = false
	},
	Progress = { ["Attack Rip Indra"] = true, ["Pull Lever"] = true, ["Race V2"] = true, ["Race V3"] = true },
	["Server Hop"] = {
		["Avoid Nearby Players"] = false,
		["Cake Queen"] = true,
		["Castle Raid"] = true,
		Darkbeard = true,
		["Dough King"] = true,
		["Mirage Island"] = true,
		["Nearby Range"] = 500,
		["Rip Indra"] = true,
		["Soul Reaper"] = true
	}
}

getgenv().AutoExecute = true
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser = game:GetService("VirtualUser")
