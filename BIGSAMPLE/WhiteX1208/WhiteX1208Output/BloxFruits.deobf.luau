-- Deobfuscated by deobf (dynamic trace)
-- source: BloxFruits.luau
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 437 statements recorded in 1.50s
-- non-standard globals touched: Loader, LocalPlayer, syn

-- [deobf] folded 49 repeated calls into 12 helper functions and 0 unrolled runs into loops
-- [deobf] removed 55 lines of the obfuscator's environment/anti-tamper probes
wait()
game:IsLoaded()
wait()
local Players = game:GetService("Players")
wait()
wait()
game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
game:IsLoaded()

Loader.CheckAndJoinTeam = function()
end

local TweenService = game:GetService("TweenService")

local function destroyNightHub()
	local hui = gethui()
	local NightHub = hui:FindFirstChild("Night Hub")
	NightHub:Destroy()
end

getgenv().NightHubAuthRewrite = {
	Valid = false,
	Stop = function()
		destroyNightHub()
	end
}

destroyNightHub()
-- isfile("NightHub/key.txt") -> false
-- isfile("Noctelis/key.txt") -> false
local hui3 = gethui()
local NightHub3 = Instance.new("ScreenGui")
NightHub3.Name = "Night Hub"
NightHub3.DisplayOrder = 10
NightHub3.ResetOnSpawn = false
NightHub3.IgnoreGuiInset = true
NightHub3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
NightHub3.Parent = hui3
syn.protect_gui(NightHub3)
local Scrim = Instance.new("Frame")
Scrim.BackgroundTransparency = 1
Scrim.Name = "Scrim"
Scrim.Active = true
Scrim.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Scrim.ZIndex = 1
Scrim.BorderSizePixel = 0
Scrim.Size = UDim2.fromScale(1, 1)
Scrim.Parent = NightHub3
local Root = Instance.new("CanvasGroup")
Root.AnchorPoint = Vector2.new(0.5, 0.5)
Root.Name = "Root"
Root.Position = UDim2.new(0.5, 0, 0.5, 0)
Root.GroupTransparency = 1
Root.ZIndex = 2
Root.BackgroundTransparency = 1
Root.Size = UDim2.fromOffset(460, 370)
Root.Parent = NightHub3

local function createFrame(name, xOffset)
	local Aura4 = Instance.new("Frame")
	Aura4.AnchorPoint = Vector2.new(0.5, 0.5)
	Aura4.Name = name
	Aura4.Position = UDim2.fromScale(0.5, 0.5)
	Aura4.BackgroundColor3 = Color3.fromRGB(111, 140, 208)
	Aura4.BackgroundTransparency = 0.83
	Aura4.BorderSizePixel = 0
	Aura4.Size = UDim2.new(1, -xOffset, 1, -xOffset)
	Aura4.Parent = Root
	return Aura4
end

local Aura4 = createFrame("Aura4", 4)

local function createUICorner(name, offset, parent)
	local AuraCorner = Instance.new("UICorner")
	AuraCorner.Name = name
	AuraCorner.CornerRadius = UDim.new(0, offset)
	AuraCorner.Parent = parent
end

createUICorner("AuraCorner", 20, Aura4)
local Aura3 = createFrame("Aura3", 8)
createUICorner("AuraCorner", 18, Aura3)
local Aura2 = createFrame("Aura2", 12)
createUICorner("AuraCorner", 16, Aura2)
local Aura1 = createFrame("Aura1", 16)
createUICorner("AuraCorner", 14, Aura1)
local Panel = Instance.new("Frame")
Panel.AnchorPoint = Vector2.new(0.5, 0.5)
Panel.Name = "Panel"
Panel.Position = UDim2.fromScale(0.5, 0.5)
Panel.BackgroundColor3 = Color3.fromRGB(24, 24, 26)
Panel.BorderSizePixel = 0
Panel.Size = UDim2.new(1, -20, 1, -20)
Panel.Parent = Root
createUICorner("PanelCorner", 12, Panel)

local function createUIStroke(name, parent)
	local PanelStroke = Instance.new("UIStroke")
	PanelStroke.Thickness = 1
	PanelStroke.Transparency = 0.65
	PanelStroke.Name = name
	PanelStroke.Color = Color3.fromRGB(255, 255, 255)
	PanelStroke.LineJoinMode = Enum.LineJoinMode.Round
	PanelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	PanelStroke.Parent = parent
	return PanelStroke
end

local PanelStroke = createUIStroke("PanelStroke", Panel)
local Body = Instance.new("CanvasGroup")
Body.BackgroundTransparency = 1
Body.Name = "Body"
Body.Size = UDim2.fromScale(1, 1)
Body.Parent = Panel

local function createTextLabel(r, g, b, text, name, yOffset, textSize, xOffset, yOffset2, parent)
	local Title = Instance.new("TextLabel")
	Title.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
	Title.TextColor3 = Color3.fromRGB(r, g, b)
	Title.Text = text
	Title.Name = name
	Title.Position = UDim2.new(0, 22, 0, yOffset)
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.BackgroundTransparency = 1
	Title.TextSize = textSize
	Title.Size = UDim2.new(0, xOffset, 0, yOffset2)
	Title.Parent = parent
	return Title
end

local Title = createTextLabel(237, 237, 235, "Night Hub", "Title", 22, 20, 340, 24, Body)
Title.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Bold)
local Hint = createTextLabel(150, 150, 146, "Enter your key to continue", "Hint", 52, 13, 340, 16, Body)
local Close = Instance.new("TextButton")
Close.AnchorPoint = Vector2.new(1, 0)
Close.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
Close.Name = "Close"
Close.Position = UDim2.new(1, -12, 0, 18)
Close.AutoButtonColor = false
Close.Text = ""
Close.BackgroundTransparency = 1
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Parent = Body
local Bar1 = Instance.new("Frame")
Bar1.AnchorPoint = Vector2.new(0.5, 0.5)
Bar1.Name = "Bar1"
Bar1.Position = UDim2.fromScale(0.5, 0.5)
Bar1.BackgroundColor3 = Color3.fromRGB(143, 143, 139)
Bar1.Rotation = 45
Bar1.BorderSizePixel = 0
Bar1.Size = UDim2.new(0, 13, 0, 1)
Bar1.Parent = Close
local Bar2 = Instance.new("Frame")
Bar2.AnchorPoint = Vector2.new(0.5, 0.5)
Bar2.Name = "Bar2"
Bar2.Position = UDim2.fromScale(0.5, 0.5)
Bar2.BackgroundColor3 = Color3.fromRGB(143, 143, 139)
Bar2.Rotation = -45
Bar2.BorderSizePixel = 0
Bar2.Size = UDim2.new(0, 13, 0, 1)
Bar2.Parent = Close

local function createFrame2(name, yOffset, backgroundTransparency, yOffset2, parent)
	local Divider = Instance.new("Frame")
	Divider.Name = name
	Divider.Position = UDim2.new(0, 22, 0, yOffset)
	Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Divider.BackgroundTransparency = backgroundTransparency
	Divider.BorderSizePixel = 0
	Divider.Size = UDim2.new(1, -44, 0, yOffset2)
	Divider.Parent = parent
	return Divider
end

local Divider = createFrame2("Divider", 88, 0.86, 1, Body)
local Label = createTextLabel(150, 150, 146, "License key", "Label", 108, 13, 220, 16, Body)
local Field = Instance.new("Frame")
Field.Name = "Field"
Field.Position = UDim2.new(0, 22, 0, 130)
Field.BackgroundColor3 = Color3.fromRGB(18, 18, 20)
Field.BorderSizePixel = 0
Field.Size = UDim2.new(1, -44, 0, 50)
Field.Parent = Body
createUICorner("FieldCorner", 8, Field)
local FieldStroke = createUIStroke("FieldStroke", Field)
local Box = Instance.new("TextBox")
Box.MultiLine = false
Box.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
Box.TextColor3 = Color3.fromRGB(237, 237, 235)
Box.Text = ""
Box.ClearTextOnFocus = false
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.Name = "Box"
Box.BackgroundTransparency = 1
Box.Position = UDim2.new(0, 16, 0, 0)
Box.PlaceholderColor3 = Color3.fromRGB(143, 143, 139)
Box.PlaceholderText = "Paste your key here"
Box.TextSize = 16
Box.Size = UDim2.new(1, -32, 1, 0)
Box.Parent = Field
local Err = createTextLabel(214, 90, 74, "", "Err", 192, 13, 400, 16, Body)

local function createTextButton(name, yOffset)
	local Submit = Instance.new("TextButton")
	Submit.BackgroundColor3 = Color3.fromRGB(111, 140, 208)
	Submit.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
	Submit.Name = name
	Submit.Position = UDim2.new(0, 22, 0, yOffset)
	Submit.AutoButtonColor = false
	Submit.Text = ""
	Submit.BorderSizePixel = 0
	Submit.Size = UDim2.new(1, -44, 0, 50)
	Submit.Parent = Body
	return Submit
end

local Submit = createTextButton("Submit", 218)
createUICorner("SubmitCorner", 8, Submit)

local function createTextLabel2(name, text, parent)
	local SubmitTitle = Instance.new("TextLabel")
	SubmitTitle.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
	SubmitTitle.Name = name
	SubmitTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	SubmitTitle.BackgroundTransparency = 1
	SubmitTitle.Text = text
	SubmitTitle.TextSize = 18
	SubmitTitle.Size = UDim2.fromScale(1, 1)
	SubmitTitle.Parent = parent
end

createTextLabel2("SubmitTitle", "Submit Key", Submit)
local GetKey = createTextButton("GetKey", 278)
createUICorner("GetKeyCorner", 8, GetKey)
createTextLabel2("GetKeyTitle", "GET KEY", GetKey)
local Load = Instance.new("CanvasGroup")
Load.Visible = false
Load.Name = "Load"
Load.GroupTransparency = 1
Load.BackgroundTransparency = 1
Load.Size = UDim2.fromScale(1, 1)
Load.Parent = Panel
local Step = createTextLabel(237, 237, 235, "", "Step", 28, 14, 190, 17, Load)
local Pct = Instance.new("TextLabel")
Pct.FontFace = Font.new("rbxasset://fonts/families/RobotoMono.json", Enum.FontWeight.Regular)
Pct.TextColor3 = Color3.fromRGB(150, 150, 146)
Pct.Text = "0%"
Pct.Name = "Pct"
Pct.Position = UDim2.new(1, -22, 0, 29)
Pct.TextXAlignment = Enum.TextXAlignment.Left
Pct.BackgroundTransparency = 1
Pct.TextSize = 13
Pct.Size = UDim2.new(0, 60, 0, 16)
Pct.Parent = Load
Pct.AnchorPoint = Vector2.new(1, 0)
Pct.TextXAlignment = Enum.TextXAlignment.Right
local Track = createFrame2("Track", 60, 0.88, 2, Load)
local Fill = Instance.new("Frame")
Fill.BorderSizePixel = 0
Fill.BackgroundColor3 = Color3.fromRGB(111, 140, 208)
Fill.Name = "Fill"
Fill.Size = UDim2.fromScale(0, 1)
Fill.Parent = Track
local tween = TweenService:Create(Scrim, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.45 })
tween:Play()
local tween2 = TweenService:Create(Root, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { GroupTransparency = 0 })
tween2:Play()
local changedSignal = Box:GetPropertyChangedSignal("Text")

changedSignal:Connect(function()
end)

local function tweenFieldStroke(r, g, b, thickness, transparency)
	local tween3 = TweenService:Create(FieldStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Color = Color3.fromRGB(r, g, b), Thickness = thickness, Transparency = transparency })
	tween3:Play()
end

Box.Focused:Connect(function()
	tweenFieldStroke(111, 140, 208, 2, 0)
end)

local function setErrText()
	Err.Text = "Enter your key first"
	Err.TextColor3 = Color3.fromRGB(214, 90, 74)
	tweenFieldStroke(214, 90, 74, 2, 0)
end

Box.FocusLost:Connect(function(enterPressed, inputObject)
	tweenFieldStroke(255, 255, 255, 1, 0.65)
	setErrText()
end)

local function tweenSubmit(submit, r, g, b)
	local tween6 = TweenService:Create(submit, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(r, g, b) })
	tween6:Play()
end

Submit.MouseEnter:Connect(function()
	tweenSubmit(Submit, 128, 156, 220)
end)

Submit.MouseLeave:Connect(function()
	tweenSubmit(Submit, 111, 140, 208)
end)

Submit.MouseButton1Down:Connect(function(x, y)
	tweenSubmit(Submit, 92, 117, 175)
end)

Submit.MouseButton1Click:Connect(function()
	setErrText()
end)

GetKey.MouseEnter:Connect(function()
	tweenSubmit(GetKey, 128, 156, 220)
end)

GetKey.MouseLeave:Connect(function()
	tweenSubmit(GetKey, 111, 140, 208)
end)

GetKey.MouseButton1Down:Connect(function(x2, y2)
	tweenSubmit(GetKey, 92, 117, 175)
end)

GetKey.MouseButton1Click:Connect(function()
	setclipboard("https://103.69.96.168/key?ver=NightHub")
	Err.Text = "Get Key link copied"
	Err.TextColor3 = Color3.fromRGB(122, 190, 128)
	tweenSubmit(GetKey, 128, 156, 220)
end)

local function helper(r, g, b)
	tweenSubmit(Bar1, r, g, b)
	tweenSubmit(Bar2, r, g, b)
end

Close.MouseEnter:Connect(function()
	helper(237, 237, 235)
end)

Close.MouseLeave:Connect(function()
	helper(143, 143, 139)
end)

Close.MouseButton1Click:Connect(function()
	Err.Text = "Click the cross again to close"
	Err.TextColor3 = Color3.fromRGB(150, 150, 146)
	helper(214, 90, 74)

	task.delay(10, function()
	end)
end)
