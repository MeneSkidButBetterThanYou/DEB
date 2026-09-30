-- Deobfuscated by deobf (dynamic trace)
-- source: mobile_20260927_150331.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: script error: Maru loader: script compilation failed.
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/mobile_20260927_150331.deobf.luau.harness.luau:5366
--   Script:1
--   Script:1
--   Script:1
--   Script:1
--   C:/Users/User/Desktop/EGO/ravel0.7/Deobfuscator/newout/mobile_20260927_150331.deobf.luau.harness.luau:5371
--   
-- 50 statements recorded in 0.39s
-- HTTP was not contacted; response values are symbolic harness proxies
-- URLs requested:
--   https://api.luarmor.net/files/v4/loaders/59126981ee2bb1f95e67943dbece43d0.lua

task.spawn(function()
end)

task.spawn(function()
end)

task.delay(715, function()
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 113, 0, 290)
Frame.Parent = ScreenGui
local Path2D = Instance.new("Path2D")
Path2D.Parent = Frame
Path2D:SetControlPoints({ Path2DControlPoint.new(UDim2.new(0.25, 3, 0.25, 4), UDim2.new(0, -6, 0.0625, 6), UDim2.new(0, 0, 0, 0)), Path2DControlPoint.new(UDim2.new(0.5, 3, 0.25, 4), UDim2.new(0, 3, 0, 7), UDim2.new(0, 7, -0.125, -6)), Path2DControlPoint.new(UDim2.new(0.5, 1, 0.125, 5), UDim2.new(-0.125, 3, -0.125, 0), UDim2.new(-0.125, 2, 0, 2)), Path2DControlPoint.new(UDim2.new(0.5, 7, 0.5, 5), UDim2.new(0, 0, 0, 0), UDim2.new(0, 0, 0, 0)) })
Path2D:GetLength()
Path2D:GetPositionOnCurve(0.40000000596046448)
Path2D:GetPositionOnCurve(0.1428571492433548)
Path2D:GetPositionOnCurve(0.53333336114883423)
Path2D:GetTangentOnCurve(0.5)
Path2D:GetTangentOnCurve(0.20000000298023224)
Path2D:GetTangentOnCurve(0.66666668653488159)
Path2D:GetTangentOnCurve(0.6428571343421936)
Path2D:GetPositionOnCurveArcLength(0.5)
Path2D:GetPositionOnCurveArcLength(0.80000001192092896)
Path2D:GetPositionOnCurveArcLength(0.57142859697341919)
Path2D:GetTangentOnCurveArcLength(0.9375)
Path2D:GetTangentOnCurveArcLength(0.5)
Path2D:GetTangentOnCurveArcLength(0.76923078298568726)
ScreenGui:Destroy()

local connection = game.DescendantAdded:Connect(function(descendant)
end)

connection:Disconnect()

local connection2 = workspace.DescendantAdded:Connect(function(descendant2)
end)

connection2:Disconnect()
local Folder = Instance.new("Folder")

local connection3 = Folder.DescendantAdded:Connect(function(descendant3)
end)

connection3:Disconnect()
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)

local connection4 = Folder2.DescendantAdded:Connect(function(descendant4)
end)

connection4:Disconnect()
Folder2.Name = "633042759"
Folder:WaitForChild("633042759")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")

local connection5 = HttpService.DescendantAdded:Connect(function(descendant5)
end)

connection5:Disconnect()
local RunService = game:GetService("RunService")

local connection6 = RunService.DescendantAdded:Connect(function(descendant6)
end)

connection6:Disconnect()
-- loadstring() of 2438 bytes: " --[[\n\t\t\t\t .@%(/*,.......      ...,,*/(#%&@@.\n\t\t\t (*   ,/(#%%&&@@@@&%((////(((##%###((/**,,.     ,//(&.\n\t\t   /* .%@@@@@@@@%,  .(&@@@&&&&&&@@@@@@&#(*,........*%@@@(.  ,#.\n\t\t */ .&@@@@@@@*  (%,   *(&&@@"
game:HttpGet("https://api.luarmor.net/files/v4/loaders/59126981ee2bb1f95e67943dbece43d0.lua")
