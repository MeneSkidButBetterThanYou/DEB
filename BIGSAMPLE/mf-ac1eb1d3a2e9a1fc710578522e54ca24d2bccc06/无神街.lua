print("ok")
local Players=game:GetService("Players")
local Workspace=game:GetService("Workspace")
local LocalPlayer=Players.LocalPlayer
local Camera=workspace.CurrentCamera
local function wushenjieSCRIPT()
local character=LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart=character:FindFirstChild("HumanoidRootPart")
if not humanoidRootPart then return end
local originalCFrame=humanoidRootPart.CFrame
local originalCameraCFrame=Camera.CFrame
local treasureHunt=Workspace:FindFirstChild("TreasureHunt")
if not treasureHunt then return end
local treasures={}
local function ScanFolder(folder)
for _,child in ipairs(folder:GetChildren())do
if child:IsA("Folder")then
ScanFolder(child)
elseif child:IsA("MeshPart")and string.find(child.Name,"Treasure")and child.CanCollide==true then
table.insert(treasures,child)
end
end
end
ScanFolder(treasureHunt)
if #treasures==0 then return end
for _,treasure in ipairs(treasures)do
local prompt=treasure:FindFirstChild("TreasurePrompt")
if prompt and prompt:IsA("ProximityPrompt")then
local pos=treasure.Position+Vector3.new(0,3,0)
humanoidRootPart.CFrame=CFrame.new(pos)
Camera.CFrame=CFrame.new(pos+Vector3.new(0,2,5),pos)
task.wait(0.3)
fireproximityprompt(prompt)
task.wait(1)
end
end
humanoidRootPart.CFrame=originalCFrame
Camera.CFrame=originalCameraCFrame
end
wushenjieSCRIPT()
