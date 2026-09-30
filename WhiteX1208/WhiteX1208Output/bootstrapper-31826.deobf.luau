-- Deobfuscated by deobf (dynamic trace)
-- source: bootstrapper-31826.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: [string "Luraph"]:1: invalid argument #1 to 'create' (size out of range)
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/WhiteX1208/WhiteX1208Output/bootstrapper-31826.deobf.luau.harness.luau:5337
--   [string "Luraph"]:1
--   [string "Luraph"]:1
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/WhiteX1208/WhiteX1208Output/bootstrapper-31826.deobf.luau.harness.luau:5342
--   
-- 48 statements recorded in 2.27s
-- non-standard globals touched: LUAW_DATA, ACTIVE_KEY

-- [deobf] folded 6 repeated calls into 1 helper functions and 0 unrolled runs into loops
-- loadstring() of 198890 bytes: "return setmetatable({Ff=function(N,p,y,W,b,H,s)if W<=116 then if W<=115 then local I=H-128+128*s;return 80,2+y,I;else return not not(s~=242)and 152 or 119,y,H;end;elseif W<=117 then return not(170<s)a"
-- [deobf] removed 27 lines of the obfuscator's environment/anti-tamper probes
local function onAncestryChanged(value)
	local connection = value.AncestryChanged:Connect(function(child, parent)
	end)

	connection:Disconnect()
end

onAncestryChanged(game)
onAncestryChanged(workspace)
local Folder = Instance.new("Folder")
onAncestryChanged(Folder)
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)
onAncestryChanged(Folder2)
Folder2.Name = "1911494601"
Folder:WaitForChild("1911494601")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")
onAncestryChanged(HttpService)
local RunService = game:GetService("RunService")
onAncestryChanged(RunService)
http_request({ Method = "GET", Url = "https://api.imt-hub.xyz/gate?v=b&s=" .. LUAW_DATA[8] .. "&k=" .. ACTIVE_KEY })
