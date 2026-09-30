-- Deobfuscated by deobf (dynamic trace)
-- source: input.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 58 statements recorded in 0.61s
-- URLs requested:
--   https://sirius.menu/gen2

task.spawn(function()
end)

task.spawn(function()
end)

task.delay(463, function()
	-- [envlog] cancelled before it ran
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 228, 0, 227)
Frame.Parent = ScreenGui
local Path2D = Instance.new("Path2D")
Path2D.Parent = Frame
Path2D:SetControlPoints({ Path2DControlPoint.new(UDim2.new(0.25, -1, 0.5, 3), UDim2.new(-0.125, 6, 0, -1), UDim2.new(0.0625, -7, 0, -7)), Path2DControlPoint.new(UDim2.new(0.25, -9, 0, 2), UDim2.new(0, 1, 0, -4), UDim2.new(-0.125, 1, 0, 7)), Path2DControlPoint.new(UDim2.new(0.4375, 1, 0.5, 8), UDim2.new(-0.0625, 2, -0.125, -8), UDim2.new(0, 0, 0, 0)), Path2DControlPoint.new(UDim2.new(0.0625, -1, 0.1875, 2), UDim2.new(0, -7, 0, -1), UDim2.new(0, 0, 0, 0)) })
Path2D:GetLength()
Path2D:GetPositionOnCurve(0.4285714328289032)
Path2D:GetPositionOnCurve(0.75)
Path2D:GetPositionOnCurve(0.071428574621677399)
Path2D:GetTangentOnCurve(0.15384615957736969)
Path2D:GetTangentOnCurve(0.89999997615814209)
Path2D:GetTangentOnCurve(0.2142857164144516)
Path2D:GetPositionOnCurveArcLength(0.8461538553237915)
Path2D:GetPositionOnCurveArcLength(0.66666668653488159)
Path2D:GetPositionOnCurveArcLength(0.5)
Path2D:GetTangentOnCurveArcLength(0.75)
Path2D:GetTangentOnCurveArcLength(0.1666666716337204)
ScreenGui:Destroy()

local connection = game.ChildRemoved:Connect(function(child)
end)

connection:Disconnect()

local connection2 = workspace.ChildRemoved:Connect(function(child2)
end)

connection2:Disconnect()
local Folder = Instance.new("Folder")

local connection3 = Folder.ChildRemoved:Connect(function(child3)
end)

connection3:Disconnect()
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)

local connection4 = Folder2.ChildRemoved:Connect(function(child4)
end)

connection4:Disconnect()
Folder2.Name = "1528152398"
Folder:WaitForChild("1528152398")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")

local connection5 = HttpService.ChildRemoved:Connect(function(child5)
end)

connection5:Disconnect()
local RunService = game:GetService("RunService")

local connection6 = RunService.ChildRemoved:Connect(function(child6)
end)

connection6:Disconnect()
-- loadstring() of 2436 bytes: " --[[\n\t\t\t\t .@%(/*,.......      ...,,*/(#%&@@.\n\t\t\t (*   ,/(#%%&&@@@@&%((////(((##%###((/**,,.     ,//(&.\n\t\t   /* .%@@@@@@@@%,  .(&@@@&&&&&&@@@@@@&#(*,........*%@@@(.  ,#.\n\t\t */ .&@@@@@@@*  (%,   *(&&@@"
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
game:IsLoaded()
local response = game:HttpGet("https://sirius.menu/gen2")
local gen2 = loadstring(response)()
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", { Text = "Rayfield is unreachable. Try again shortly.", Title = "rblxhub", Duration = 8 })
warn("[rblxhub] Rayfield failed to load: " .. tostring(gen2))
