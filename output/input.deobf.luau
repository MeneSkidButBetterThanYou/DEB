-- Deobfuscated by deobf (dynamic trace)
-- source: input.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: FlowAuth: no verified native SHA-256, SHA-384, or BLAKE2b is available; runtime 3.9-private-transport
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/output/input.deobf.luau.harness.luau:5334
--   Script:3 function aL
--   Script:3
--   Script:3
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/output/input.deobf.luau.harness.luau:5339
--   
-- 47 statements recorded in 1.02s
-- non-standard globals touched: syn, hash, sha256, sha384, blake2b256, blake2b512

-- [deobf] folded 6 repeated calls into 1 helper functions and 0 unrolled runs into loops
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
Folder2.Name = "1365538855"
Folder:WaitForChild("1365538855")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")
onAttributeChanged(HttpService)
local RunService = game:GetService("RunService")
onAttributeChanged(RunService)
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
