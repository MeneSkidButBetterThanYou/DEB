-- Deobfuscated by deobf (dynamic trace)
-- source: ruz.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 17756 statements recorded in 8.38s
-- remotes fired/invoked:
--   Remote
--   Remote2
--   Remote3
--   Remote4
-- non-standard globals touched: comboBtnRefs, closeChList, grabGunWatcher, chListOpen, chList

-- [deobf] folded 369 repeated calls into 49 helper functions and 63 unrolled runs into loops
local function tweenFrame2(frame, frame2, uiStroke)
	local tween120 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) })
	tween120:Play()
	local tween121 = TweenService:Create(frame2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 3, 0.5, 0) })
	tween121:Play()
	uiStroke.Color = Color3.fromRGB(60, 60, 60)
	uiStroke.Transparency = 0.4
end

local function createTextLabel2(layoutOrder, parent, name, text, textLabelText)
	local Toggle_MurdererESP, UIStroke121 = createFrame(36, layoutOrder, parent)
	Toggle_MurdererESP.Name = name
	local TextLabel147 = Instance.new("TextLabel")
	TextLabel147.Size = UDim2.new(1, -72, 0, 14)
	TextLabel147.Position = UDim2.new(0, 10, 0, 5)
	TextLabel147.BackgroundTransparency = 1
	TextLabel147.Text = text
	TextLabel147.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel147.TextSize = 11
	TextLabel147.Font = Enum.Font.ArialBold
	TextLabel147.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel147.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel147.Parent = Toggle_MurdererESP
	local TextLabel148 = Instance.new("TextLabel")
	TextLabel148.Size = UDim2.new(1, -72, 0, 11)
	TextLabel148.Position = UDim2.new(0, 10, 0, 20)
	TextLabel148.BackgroundTransparency = 1
	TextLabel148.Text = textLabelText
	TextLabel148.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel148.TextSize = 9
	TextLabel148.Font = Enum.Font.Arial
	TextLabel148.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel148.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel148.Parent = Toggle_MurdererESP
	local Frame221 = Instance.new("Frame")
	Frame221.Size = UDim2.new(0, 34, 0, 18)
	Frame221.Position = UDim2.new(1, -44, 0.5, 0)
	Frame221.AnchorPoint = Vector2.new(1, 0.5)
	Frame221.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	Frame221.BorderSizePixel = 0
	Frame221.Parent = Toggle_MurdererESP
	local UICorner238 = Instance.new("UICorner")
	UICorner238.CornerRadius = UDim.new(1, 0)
	UICorner238.Parent = Frame221
	local Frame222 = Instance.new("Frame")
	Frame222.Size = UDim2.new(0, 12, 0, 12)
	Frame222.Position = UDim2.new(1, -14, 0.5, 0)
	Frame222.AnchorPoint = Vector2.new(0, 0.5)
	Frame222.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame222.BorderSizePixel = 0
	Frame222.Parent = Frame221
	local UICorner239 = Instance.new("UICorner")
	UICorner239.CornerRadius = UDim.new(1, 0)
	UICorner239.Parent = Frame222
	local UIStroke122 = Instance.new("UIStroke")
	UIStroke122.Color = Color3.fromRGB(170, 20, 40)
	UIStroke122.Thickness = 1.2
	UIStroke122.Transparency = 0.3
	UIStroke122.Parent = Frame222
	local TextButton133 = Instance.new("TextButton")
	TextButton133.Size = UDim2.new(1, 0, 1, 0)
	TextButton133.BackgroundTransparency = 1
	TextButton133.Text = ""
	TextButton133.Parent = Toggle_MurdererESP

	TextButton133.MouseButton1Click:Connect(function()
		Sound:Play()
		tweenFrame2(Frame221, Frame222, UIStroke121)
	end)

	UIStroke121.Color = Color3.fromRGB(255, 0, 0)
	UIStroke121.Transparency = 0.25
end

local function createTextLabel3(layoutOrder, parent, name, text, textLabelText)
	local Toggle_SelfESP, UIStroke127 = createFrame(36, layoutOrder, parent)
	Toggle_SelfESP.Name = name
	local TextLabel153 = Instance.new("TextLabel")
	TextLabel153.Size = UDim2.new(1, -72, 0, 14)
	TextLabel153.Position = UDim2.new(0, 10, 0, 5)
	TextLabel153.BackgroundTransparency = 1
	TextLabel153.Text = text
	TextLabel153.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel153.TextSize = 11
	TextLabel153.Font = Enum.Font.ArialBold
	TextLabel153.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel153.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel153.Parent = Toggle_SelfESP
	local TextLabel154 = Instance.new("TextLabel")
	TextLabel154.Size = UDim2.new(1, -72, 0, 11)
	TextLabel154.Position = UDim2.new(0, 10, 0, 20)
	TextLabel154.BackgroundTransparency = 1
	TextLabel154.Text = textLabelText
	TextLabel154.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel154.TextSize = 9
	TextLabel154.Font = Enum.Font.Arial
	TextLabel154.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel154.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel154.Parent = Toggle_SelfESP
	local Frame230 = Instance.new("Frame")
	Frame230.Size = UDim2.new(0, 34, 0, 18)
	Frame230.Position = UDim2.new(1, -44, 0.5, 0)
	Frame230.AnchorPoint = Vector2.new(1, 0.5)
	Frame230.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Frame230.BorderSizePixel = 0
	Frame230.Parent = Toggle_SelfESP
	local UICorner247 = Instance.new("UICorner")
	UICorner247.CornerRadius = UDim.new(1, 0)
	UICorner247.Parent = Frame230
	local Frame231 = Instance.new("Frame")
	Frame231.Size = UDim2.new(0, 12, 0, 12)
	Frame231.Position = UDim2.new(0, 3, 0.5, 0)
	Frame231.AnchorPoint = Vector2.new(0, 0.5)
	Frame231.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame231.BorderSizePixel = 0
	Frame231.Parent = Frame230
	local UICorner248 = Instance.new("UICorner")
	UICorner248.CornerRadius = UDim.new(1, 0)
	UICorner248.Parent = Frame231
	local UIStroke128 = Instance.new("UIStroke")
	UIStroke128.Color = Color3.fromRGB(170, 20, 40)
	UIStroke128.Thickness = 1.2
	UIStroke128.Transparency = 0.3
	UIStroke128.Parent = Frame231
	local TextButton136 = Instance.new("TextButton")
	TextButton136.Size = UDim2.new(1, 0, 1, 0)
	TextButton136.BackgroundTransparency = 1
	TextButton136.Text = ""
	TextButton136.Parent = Toggle_SelfESP

	TextButton136.MouseButton1Click:Connect(function()
		Sound:Play()
		tweenFrame(Frame230, Frame231, UIStroke127)
	end)
end

-- [deobf] removed 53 lines of the obfuscator's environment/anti-tamper probes
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:FindFirstChild("CustomPanelGui")
PlayerGui.CustomPanelGui:Destroy()
local CustomPanelGui = Instance.new("ScreenGui")
CustomPanelGui.Name = "CustomPanelGui"
CustomPanelGui.ResetOnSpawn = false
CustomPanelGui.Parent = PlayerGui
local RuzHubNotifs = Instance.new("ScreenGui")
RuzHubNotifs.Name = "RuzHubNotifs"
RuzHubNotifs.ResetOnSpawn = false
RuzHubNotifs.DisplayOrder = 999
RuzHubNotifs.Parent = PlayerGui
-- isfolder("RuzConfigs") -> false
makefolder("RuzConfigs")
local contents = readfile("RuzConfigs/_visits.txt")
writefile("RuzConfigs/_visits.txt", tostring(tonumber(contents) + 1))

task.defer(function()
	task.wait(1.2)
end)

local MainPanel = Instance.new("Frame")
MainPanel.Name = "MainPanel"
MainPanel.Size = UDim2.new(0, 460, 0, 290)
MainPanel.Position = UDim2.new(0.5, 0, 0.5, 0)
MainPanel.AnchorPoint = Vector2.new(0.5, 0.5)
MainPanel.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
MainPanel.BackgroundTransparency = 0.25
MainPanel.BorderSizePixel = 0
MainPanel.Parent = CustomPanelGui
local UIScale = Instance.new("UIScale")
UIScale.Scale = 1
UIScale.Parent = MainPanel
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = MainPanel
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.25
UIStroke.Parent = MainPanel
local UISizeConstraint = Instance.new("UISizeConstraint")
UISizeConstraint.MinSize = Vector2.new(340, 220)
UISizeConstraint.MaxSize = Vector2.new(520, 330)
UISizeConstraint.Parent = MainPanel

MainPanel.InputBegan:Connect(function(input, gameProcessed)
end)

MainPanel.InputChanged:Connect(function(input2, gameProcessed2)
end)

UserInputService.InputChanged:Connect(function(input3, gameProcessed3)
end)

local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://12948391899"
Sound.Volume = 0.5
Sound.Parent = SoundService
local Frame3 = Instance.new("Frame")
Frame3.Size = UDim2.new(1, 0, 0, 42)
Frame3.Position = UDim2.new(0, 0, 0, 0)
Frame3.BackgroundTransparency = 1
Frame3.BorderSizePixel = 0
Frame3.Parent = MainPanel
local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(0, 200, 1, 0)
TextLabel.Position = UDim2.new(0, 16, 0, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "RuzHub"
TextLabel.TextColor3 = Color3.fromRGB(240, 30, 50)
TextLabel.TextSize = 21
TextLabel.Font = Enum.Font.ArialBold
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.Parent = Frame3
local TextLabel2 = Instance.new("TextLabel")
TextLabel2.Size = UDim2.new(0, 100, 1, 0)
TextLabel2.Position = UDim2.new(0, 95, 0, 1)
TextLabel2.BackgroundTransparency = 1
TextLabel2.Text = "v1.0"
TextLabel2.TextColor3 = Color3.fromRGB(140, 140, 140)
TextLabel2.TextSize = 12
TextLabel2.Font = Enum.Font.Arial
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.Parent = Frame3
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 28, 0, 28)
CloseButton.Position = UDim2.new(1, -10, 0.5, 0)
CloseButton.AnchorPoint = Vector2.new(1, 0.5)
CloseButton.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
CloseButton.BackgroundTransparency = 0.3
CloseButton.BorderSizePixel = 0
CloseButton.Text = ""
CloseButton.Parent = Frame3
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 6)
UICorner2.Parent = CloseButton
local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.fromRGB(255, 40, 60)
UIStroke2.Thickness = 1.2
UIStroke2.Transparency = 0.3
UIStroke2.Parent = CloseButton
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0, 16, 0, 16)
ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel.BackgroundTransparency = 1
ImageLabel.ScaleType = Enum.ScaleType.Fit
ImageLabel.Image = "rbxassetid://116396312853810"
ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.Parent = CloseButton
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 28, 0, 28)
MinimizeButton.Position = UDim2.new(1, -44, 0.5, 0)
MinimizeButton.AnchorPoint = Vector2.new(1, 0.5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
MinimizeButton.BackgroundTransparency = 0.3
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = ""
MinimizeButton.Parent = Frame3
local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 6)
UICorner3.Parent = MinimizeButton
local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Color = Color3.fromRGB(220, 20, 40)
UIStroke3.Thickness = 1.2
UIStroke3.Transparency = 0.4
UIStroke3.Parent = MinimizeButton
local ImageLabel2 = Instance.new("ImageLabel")
ImageLabel2.Size = UDim2.new(0, 16, 0, 16)
ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel2.BackgroundTransparency = 1
ImageLabel2.ScaleType = Enum.ScaleType.Fit
ImageLabel2.Image = "rbxassetid://95555494586098"
ImageLabel2.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel2.Parent = MinimizeButton
local Frame4 = Instance.new("Frame")
Frame4.Size = UDim2.new(1, -24, 0, 1)
Frame4.Position = UDim2.new(0.5, 0, 0, 42)
Frame4.AnchorPoint = Vector2.new(0.5, 0)
Frame4.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame4.BackgroundTransparency = 0.6
Frame4.BorderSizePixel = 0
Frame4.Parent = MainPanel

local function setupTextButton(textButton, r, g, b, r2, g2, b2)
	textButton.MouseEnter:Connect(function()
		textButton.BackgroundColor3 = Color3.fromRGB(r, g, b)
		textButton.BackgroundTransparency = 0.1
	end)

	textButton.MouseLeave:Connect(function()
		textButton.BackgroundColor3 = Color3.fromRGB(r2, g2, b2)
		textButton.BackgroundTransparency = 0.3
	end)
end

setupTextButton(CloseButton, 220, 20, 35, 180, 15, 25)
setupTextButton(MinimizeButton, 160, 15, 30, 120, 10, 20)
local ContentArea = Instance.new("Frame")
ContentArea.Name = "ContentArea"
ContentArea.Size = UDim2.new(1, -149, 1, -58)
ContentArea.Position = UDim2.new(0, 135, 0, 50)
ContentArea.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ContentArea.BackgroundTransparency = 0.15
ContentArea.BorderSizePixel = 0
ContentArea.ClipsDescendants = true
ContentArea.Parent = MainPanel
local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(0, 10)
UICorner4.Parent = ContentArea
local UIStroke4 = Instance.new("UIStroke")
UIStroke4.Color = Color3.fromRGB(255, 0, 0)
UIStroke4.Thickness = 1
UIStroke4.Transparency = 0.35
UIStroke4.Parent = ContentArea
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(0, 115, 1, -58)
TabBar.Position = UDim2.new(0, 12, 0, 50)
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabBar.BackgroundTransparency = 0.4
TabBar.BorderSizePixel = 0
TabBar.Parent = MainPanel
local UICorner5 = Instance.new("UICorner")
UICorner5.CornerRadius = UDim.new(0, 12)
UICorner5.Parent = TabBar
local UIStroke5 = Instance.new("UIStroke")
UIStroke5.Color = Color3.fromRGB(255, 0, 0)
UIStroke5.Thickness = 1.5
UIStroke5.Transparency = 0.4
UIStroke5.Parent = TabBar
local PlayerContent = Instance.new("Frame")
PlayerContent.Name = "PlayerContent"
PlayerContent.Size = UDim2.new(1, 0, 1, 0)
PlayerContent.BackgroundTransparency = 1
PlayerContent.Visible = true
PlayerContent.Parent = ContentArea
local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "Scroll"
Scroll.Size = UDim2.new(1, -4, 1, -4)
Scroll.Position = UDim2.new(0, 2, 0, 4)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll.ScrollBarImageTransparency = 0.3
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll.Parent = PlayerContent
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 3)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Scroll
local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 10)
UIPadding.PaddingTop = UDim.new(0, 3)
UIPadding.PaddingBottom = UDim.new(0, 6)
UIPadding.Parent = Scroll
local VisualContent = Instance.new("Frame")
VisualContent.Name = "VisualContent"
VisualContent.Size = UDim2.new(1, 0, 1, 0)
VisualContent.BackgroundTransparency = 1
VisualContent.Visible = false
VisualContent.Parent = ContentArea
local Scroll2 = Instance.new("ScrollingFrame")
Scroll2.Name = "Scroll"
Scroll2.Size = UDim2.new(1, -4, 1, -4)
Scroll2.Position = UDim2.new(0, 2, 0, 4)
Scroll2.BackgroundTransparency = 1
Scroll2.BorderSizePixel = 0
Scroll2.ScrollBarThickness = 3
Scroll2.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll2.ScrollBarImageTransparency = 0.3
Scroll2.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll2.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll2.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll2.Parent = VisualContent
local UIListLayout2 = Instance.new("UIListLayout")
UIListLayout2.Padding = UDim.new(0, 3)
UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout2.Parent = Scroll2
local UIPadding2 = Instance.new("UIPadding")
UIPadding2.PaddingLeft = UDim.new(0, 5)
UIPadding2.PaddingRight = UDim.new(0, 10)
UIPadding2.PaddingTop = UDim.new(0, 3)
UIPadding2.PaddingBottom = UDim.new(0, 6)
UIPadding2.Parent = Scroll2
local ESPContent = Instance.new("Frame")
ESPContent.Name = "ESPContent"
ESPContent.Size = UDim2.new(1, 0, 1, 0)
ESPContent.BackgroundTransparency = 1
ESPContent.Visible = false
ESPContent.Parent = ContentArea
local Scroll3 = Instance.new("ScrollingFrame")
Scroll3.Name = "Scroll"
Scroll3.Size = UDim2.new(1, -4, 1, -4)
Scroll3.Position = UDim2.new(0, 2, 0, 4)
Scroll3.BackgroundTransparency = 1
Scroll3.BorderSizePixel = 0
Scroll3.ScrollBarThickness = 3
Scroll3.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll3.ScrollBarImageTransparency = 0.3
Scroll3.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll3.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll3.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll3.Parent = ESPContent
local UIListLayout3 = Instance.new("UIListLayout")
UIListLayout3.Padding = UDim.new(0, 3)
UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout3.Parent = Scroll3
local UIPadding3 = Instance.new("UIPadding")
UIPadding3.PaddingLeft = UDim.new(0, 5)
UIPadding3.PaddingRight = UDim.new(0, 10)
UIPadding3.PaddingTop = UDim.new(0, 3)
UIPadding3.PaddingBottom = UDim.new(0, 6)
UIPadding3.Parent = Scroll3
local CombatContent = Instance.new("Frame")
CombatContent.Name = "CombatContent"
CombatContent.Size = UDim2.new(1, 0, 1, 0)
CombatContent.BackgroundTransparency = 1
CombatContent.Visible = false
CombatContent.Parent = ContentArea
local Scroll4 = Instance.new("ScrollingFrame")
Scroll4.Name = "Scroll"
Scroll4.Size = UDim2.new(1, -4, 1, -4)
Scroll4.Position = UDim2.new(0, 2, 0, 4)
Scroll4.BackgroundTransparency = 1
Scroll4.BorderSizePixel = 0
Scroll4.ScrollBarThickness = 3
Scroll4.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll4.ScrollBarImageTransparency = 0.3
Scroll4.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll4.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll4.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll4.Parent = CombatContent
local UIListLayout4 = Instance.new("UIListLayout")
UIListLayout4.Padding = UDim.new(0, 3)
UIListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout4.Parent = Scroll4
local UIPadding4 = Instance.new("UIPadding")
UIPadding4.PaddingLeft = UDim.new(0, 5)
UIPadding4.PaddingRight = UDim.new(0, 10)
UIPadding4.PaddingTop = UDim.new(0, 3)
UIPadding4.PaddingBottom = UDim.new(0, 6)
UIPadding4.Parent = Scroll4
local SkillsContent = Instance.new("Frame")
SkillsContent.Name = "SkillsContent"
SkillsContent.Size = UDim2.new(1, 0, 1, 0)
SkillsContent.BackgroundTransparency = 1
SkillsContent.Visible = false
SkillsContent.Parent = ContentArea
local Scroll5 = Instance.new("ScrollingFrame")
Scroll5.Name = "Scroll"
Scroll5.Size = UDim2.new(1, -4, 1, -4)
Scroll5.Position = UDim2.new(0, 2, 0, 4)
Scroll5.BackgroundTransparency = 1
Scroll5.BorderSizePixel = 0
Scroll5.ScrollBarThickness = 3
Scroll5.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll5.ScrollBarImageTransparency = 0.3
Scroll5.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll5.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll5.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll5.Parent = SkillsContent
local UIListLayout5 = Instance.new("UIListLayout")
UIListLayout5.Padding = UDim.new(0, 3)
UIListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout5.Parent = Scroll5
local UIPadding5 = Instance.new("UIPadding")
UIPadding5.PaddingLeft = UDim.new(0, 5)
UIPadding5.PaddingRight = UDim.new(0, 10)
UIPadding5.PaddingTop = UDim.new(0, 3)
UIPadding5.PaddingBottom = UDim.new(0, 6)
UIPadding5.Parent = Scroll5
local UtilitiesContent = Instance.new("Frame")
UtilitiesContent.Name = "UtilitiesContent"
UtilitiesContent.Size = UDim2.new(1, 0, 1, 0)
UtilitiesContent.BackgroundTransparency = 1
UtilitiesContent.Visible = false
UtilitiesContent.Parent = ContentArea
local Scroll6 = Instance.new("ScrollingFrame")
Scroll6.Name = "Scroll"
Scroll6.Size = UDim2.new(1, -4, 1, -4)
Scroll6.Position = UDim2.new(0, 2, 0, 4)
Scroll6.BackgroundTransparency = 1
Scroll6.BorderSizePixel = 0
Scroll6.ScrollBarThickness = 3
Scroll6.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll6.ScrollBarImageTransparency = 0.3
Scroll6.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll6.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll6.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll6.Parent = UtilitiesContent
local UIListLayout6 = Instance.new("UIListLayout")
UIListLayout6.Padding = UDim.new(0, 3)
UIListLayout6.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout6.Parent = Scroll6
local UIPadding6 = Instance.new("UIPadding")
UIPadding6.PaddingLeft = UDim.new(0, 5)
UIPadding6.PaddingRight = UDim.new(0, 10)
UIPadding6.PaddingTop = UDim.new(0, 3)
UIPadding6.PaddingBottom = UDim.new(0, 6)
UIPadding6.Parent = Scroll6
local ConfigContent = Instance.new("Frame")
ConfigContent.Name = "ConfigContent"
ConfigContent.Size = UDim2.new(1, 0, 1, 0)
ConfigContent.BackgroundTransparency = 1
ConfigContent.Visible = false
ConfigContent.Parent = ContentArea
local Scroll7 = Instance.new("ScrollingFrame")
Scroll7.Name = "Scroll"
Scroll7.Size = UDim2.new(1, -4, 1, -4)
Scroll7.Position = UDim2.new(0, 2, 0, 4)
Scroll7.BackgroundTransparency = 1
Scroll7.BorderSizePixel = 0
Scroll7.ScrollBarThickness = 3
Scroll7.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
Scroll7.ScrollBarImageTransparency = 0.3
Scroll7.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll7.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll7.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll7.Parent = ConfigContent
local UIListLayout7 = Instance.new("UIListLayout")
UIListLayout7.Padding = UDim.new(0, 3)
UIListLayout7.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout7.Parent = Scroll7
local UIPadding7 = Instance.new("UIPadding")
UIPadding7.PaddingLeft = UDim.new(0, 5)
UIPadding7.PaddingRight = UDim.new(0, 10)
UIPadding7.PaddingTop = UDim.new(0, 3)
UIPadding7.PaddingBottom = UDim.new(0, 6)
UIPadding7.Parent = Scroll7
local PlayerButton = Instance.new("TextButton")
PlayerButton.Name = "PlayerButton"
PlayerButton.Size = UDim2.new(1, -12, 0, 27)
PlayerButton.Position = UDim2.new(0.5, 0, 0, 8)
PlayerButton.AnchorPoint = Vector2.new(0.5, 0)
PlayerButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
PlayerButton.BackgroundTransparency = 0.55
PlayerButton.BorderSizePixel = 0
PlayerButton.Text = ""
PlayerButton.Parent = TabBar
local UICorner6 = Instance.new("UICorner")
UICorner6.CornerRadius = UDim.new(0, 7)
UICorner6.Parent = PlayerButton
local UIStroke6 = Instance.new("UIStroke")
UIStroke6.Color = Color3.fromRGB(220, 20, 40)
UIStroke6.Thickness = 1.2
UIStroke6.Transparency = 0.4
UIStroke6.Parent = PlayerButton
local TabIcon = Instance.new("ImageLabel")
TabIcon.Name = "TabIcon"
TabIcon.Size = UDim2.new(0, 18, 0, 18)
TabIcon.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon.AnchorPoint = Vector2.new(0, 0.5)
TabIcon.BackgroundTransparency = 1
TabIcon.ScaleType = Enum.ScaleType.Fit
TabIcon.Image = "rbxassetid://114567720540659"
TabIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon.Parent = PlayerButton
local TabName = Instance.new("TextLabel")
TabName.Name = "TabName"
TabName.Size = UDim2.new(1, -36, 1, 0)
TabName.Position = UDim2.new(0, 33, 0, 0)
TabName.BackgroundTransparency = 1
TabName.Text = "Player"
TabName.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName.TextSize = 13
TabName.Font = Enum.Font.ArialBold
TabName.TextXAlignment = Enum.TextXAlignment.Left
TabName.TextYAlignment = Enum.TextYAlignment.Center
TabName.TextTruncate = Enum.TextTruncate.AtEnd
TabName.Parent = PlayerButton
PlayerButton.BackgroundColor3 = Color3.fromRGB(160, 15, 30)
PlayerButton.BackgroundTransparency = 0.2
UIStroke6.Transparency = 0.1
UIStroke6.Thickness = 1.8
TabIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
local tween = TweenService:Create(PlayerButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween2 = TweenService:Create(PlayerButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

PlayerButton.MouseEnter:Connect(function()
	tween:Play()
end)

PlayerButton.MouseLeave:Connect(function()
	tween2:Play()
end)

PlayerButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween2:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = PlayerButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon, r2 = 255, textLabel = TabName },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke222 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke222.Transparency = item.transparency
		UIStroke222.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	PlayerContent.Visible = true
end)

local VisualButton = Instance.new("TextButton")
VisualButton.Name = "VisualButton"
VisualButton.Size = UDim2.new(1, -12, 0, 27)
VisualButton.Position = UDim2.new(0.5, 0, 0, 40)
VisualButton.AnchorPoint = Vector2.new(0.5, 0)
VisualButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
VisualButton.BackgroundTransparency = 0.55
VisualButton.BorderSizePixel = 0
VisualButton.Text = ""
VisualButton.Parent = TabBar
local UICorner7 = Instance.new("UICorner")
UICorner7.CornerRadius = UDim.new(0, 7)
UICorner7.Parent = VisualButton
local UIStroke7 = Instance.new("UIStroke")
UIStroke7.Color = Color3.fromRGB(220, 20, 40)
UIStroke7.Thickness = 1.2
UIStroke7.Transparency = 0.4
UIStroke7.Parent = VisualButton
local TabIcon2 = Instance.new("ImageLabel")
TabIcon2.Name = "TabIcon"
TabIcon2.Size = UDim2.new(0, 18, 0, 18)
TabIcon2.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon2.AnchorPoint = Vector2.new(0, 0.5)
TabIcon2.BackgroundTransparency = 1
TabIcon2.ScaleType = Enum.ScaleType.Fit
TabIcon2.Image = "rbxassetid://128162112866809"
TabIcon2.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon2.Parent = VisualButton
local TabName2 = Instance.new("TextLabel")
TabName2.Name = "TabName"
TabName2.Size = UDim2.new(1, -36, 1, 0)
TabName2.Position = UDim2.new(0, 33, 0, 0)
TabName2.BackgroundTransparency = 1
TabName2.Text = "Visual"
TabName2.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName2.TextSize = 13
TabName2.Font = Enum.Font.ArialBold
TabName2.TextXAlignment = Enum.TextXAlignment.Left
TabName2.TextYAlignment = Enum.TextYAlignment.Center
TabName2.TextTruncate = Enum.TextTruncate.AtEnd
TabName2.Parent = VisualButton
local tween3 = TweenService:Create(VisualButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween4 = TweenService:Create(VisualButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

VisualButton.MouseEnter:Connect(function()
	VisualButton.BackgroundTransparency = 0.35
	tween3:Play()
end)

VisualButton.MouseLeave:Connect(function()
	VisualButton.BackgroundTransparency = 0.55
	tween4:Play()
end)

VisualButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween4:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = VisualButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon2, r2 = 255, textLabel = TabName2 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke230 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke230.Transparency = item.transparency
		UIStroke230.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	VisualContent.Visible = true
end)

local ESPButton = Instance.new("TextButton")
ESPButton.Name = "ESPButton"
ESPButton.Size = UDim2.new(1, -12, 0, 27)
ESPButton.Position = UDim2.new(0.5, 0, 0, 72)
ESPButton.AnchorPoint = Vector2.new(0.5, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
ESPButton.BackgroundTransparency = 0.55
ESPButton.BorderSizePixel = 0
ESPButton.Text = ""
ESPButton.Parent = TabBar
local UICorner8 = Instance.new("UICorner")
UICorner8.CornerRadius = UDim.new(0, 7)
UICorner8.Parent = ESPButton
local UIStroke8 = Instance.new("UIStroke")
UIStroke8.Color = Color3.fromRGB(220, 20, 40)
UIStroke8.Thickness = 1.2
UIStroke8.Transparency = 0.4
UIStroke8.Parent = ESPButton
local TabIcon3 = Instance.new("ImageLabel")
TabIcon3.Name = "TabIcon"
TabIcon3.Size = UDim2.new(0, 18, 0, 18)
TabIcon3.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon3.AnchorPoint = Vector2.new(0, 0.5)
TabIcon3.BackgroundTransparency = 1
TabIcon3.ScaleType = Enum.ScaleType.Fit
TabIcon3.Image = "rbxassetid://127234874352422"
TabIcon3.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon3.Parent = ESPButton
local TabName3 = Instance.new("TextLabel")
TabName3.Name = "TabName"
TabName3.Size = UDim2.new(1, -36, 1, 0)
TabName3.Position = UDim2.new(0, 33, 0, 0)
TabName3.BackgroundTransparency = 1
TabName3.Text = "ESP"
TabName3.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName3.TextSize = 13
TabName3.Font = Enum.Font.ArialBold
TabName3.TextXAlignment = Enum.TextXAlignment.Left
TabName3.TextYAlignment = Enum.TextYAlignment.Center
TabName3.TextTruncate = Enum.TextTruncate.AtEnd
TabName3.Parent = ESPButton
local tween5 = TweenService:Create(ESPButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween6 = TweenService:Create(ESPButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

ESPButton.MouseEnter:Connect(function()
	ESPButton.BackgroundTransparency = 0.35
	tween5:Play()
end)

ESPButton.MouseLeave:Connect(function()
	ESPButton.BackgroundTransparency = 0.55
	tween6:Play()
end)

ESPButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween6:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = ESPButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon3, r2 = 255, textLabel = TabName3 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke238 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke238.Transparency = item.transparency
		UIStroke238.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	ESPContent.Visible = true
end)

local CombatButton = Instance.new("TextButton")
CombatButton.Name = "CombatButton"
CombatButton.Size = UDim2.new(1, -12, 0, 27)
CombatButton.Position = UDim2.new(0.5, 0, 0, 104)
CombatButton.AnchorPoint = Vector2.new(0.5, 0)
CombatButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
CombatButton.BackgroundTransparency = 0.55
CombatButton.BorderSizePixel = 0
CombatButton.Text = ""
CombatButton.Parent = TabBar
local UICorner9 = Instance.new("UICorner")
UICorner9.CornerRadius = UDim.new(0, 7)
UICorner9.Parent = CombatButton
local UIStroke9 = Instance.new("UIStroke")
UIStroke9.Color = Color3.fromRGB(220, 20, 40)
UIStroke9.Thickness = 1.2
UIStroke9.Transparency = 0.4
UIStroke9.Parent = CombatButton
local TabIcon4 = Instance.new("ImageLabel")
TabIcon4.Name = "TabIcon"
TabIcon4.Size = UDim2.new(0, 18, 0, 18)
TabIcon4.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon4.AnchorPoint = Vector2.new(0, 0.5)
TabIcon4.BackgroundTransparency = 1
TabIcon4.ScaleType = Enum.ScaleType.Fit
TabIcon4.Image = "rbxassetid://83752373575368"
TabIcon4.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon4.Parent = CombatButton
local TabName4 = Instance.new("TextLabel")
TabName4.Name = "TabName"
TabName4.Size = UDim2.new(1, -36, 1, 0)
TabName4.Position = UDim2.new(0, 33, 0, 0)
TabName4.BackgroundTransparency = 1
TabName4.Text = "Combat"
TabName4.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName4.TextSize = 13
TabName4.Font = Enum.Font.ArialBold
TabName4.TextXAlignment = Enum.TextXAlignment.Left
TabName4.TextYAlignment = Enum.TextYAlignment.Center
TabName4.TextTruncate = Enum.TextTruncate.AtEnd
TabName4.Parent = CombatButton
local tween7 = TweenService:Create(CombatButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween8 = TweenService:Create(CombatButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

CombatButton.MouseEnter:Connect(function()
	CombatButton.BackgroundTransparency = 0.35
	tween7:Play()
end)

CombatButton.MouseLeave:Connect(function()
	CombatButton.BackgroundTransparency = 0.55
	tween8:Play()
end)

CombatButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween8:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = CombatButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon4, r2 = 255, textLabel = TabName4 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke246 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke246.Transparency = item.transparency
		UIStroke246.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	CombatContent.Visible = true
end)

local SkillsButton = Instance.new("TextButton")
SkillsButton.Name = "SkillsButton"
SkillsButton.Size = UDim2.new(1, -12, 0, 27)
SkillsButton.Position = UDim2.new(0.5, 0, 0, 136)
SkillsButton.AnchorPoint = Vector2.new(0.5, 0)
SkillsButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
SkillsButton.BackgroundTransparency = 0.55
SkillsButton.BorderSizePixel = 0
SkillsButton.Text = ""
SkillsButton.Parent = TabBar
local UICorner10 = Instance.new("UICorner")
UICorner10.CornerRadius = UDim.new(0, 7)
UICorner10.Parent = SkillsButton
local UIStroke10 = Instance.new("UIStroke")
UIStroke10.Color = Color3.fromRGB(220, 20, 40)
UIStroke10.Thickness = 1.2
UIStroke10.Transparency = 0.4
UIStroke10.Parent = SkillsButton
local TabIcon5 = Instance.new("ImageLabel")
TabIcon5.Name = "TabIcon"
TabIcon5.Size = UDim2.new(0, 18, 0, 18)
TabIcon5.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon5.AnchorPoint = Vector2.new(0, 0.5)
TabIcon5.BackgroundTransparency = 1
TabIcon5.ScaleType = Enum.ScaleType.Fit
TabIcon5.Image = "rbxassetid://110164536607343"
TabIcon5.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon5.Parent = SkillsButton
local TabName5 = Instance.new("TextLabel")
TabName5.Name = "TabName"
TabName5.Size = UDim2.new(1, -36, 1, 0)
TabName5.Position = UDim2.new(0, 33, 0, 0)
TabName5.BackgroundTransparency = 1
TabName5.Text = "Skills"
TabName5.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName5.TextSize = 13
TabName5.Font = Enum.Font.ArialBold
TabName5.TextXAlignment = Enum.TextXAlignment.Left
TabName5.TextYAlignment = Enum.TextYAlignment.Center
TabName5.TextTruncate = Enum.TextTruncate.AtEnd
TabName5.Parent = SkillsButton
local tween9 = TweenService:Create(SkillsButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween10 = TweenService:Create(SkillsButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

SkillsButton.MouseEnter:Connect(function()
	SkillsButton.BackgroundTransparency = 0.35
	tween9:Play()
end)

SkillsButton.MouseLeave:Connect(function()
	SkillsButton.BackgroundTransparency = 0.55
	tween10:Play()
end)

SkillsButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween10:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = SkillsButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon5, r2 = 255, textLabel = TabName5 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke254 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke254.Transparency = item.transparency
		UIStroke254.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	SkillsContent.Visible = true
end)

local UtilitiesButton = Instance.new("TextButton")
UtilitiesButton.Name = "UtilitiesButton"
UtilitiesButton.Size = UDim2.new(1, -12, 0, 27)
UtilitiesButton.Position = UDim2.new(0.5, 0, 0, 168)
UtilitiesButton.AnchorPoint = Vector2.new(0.5, 0)
UtilitiesButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
UtilitiesButton.BackgroundTransparency = 0.55
UtilitiesButton.BorderSizePixel = 0
UtilitiesButton.Text = ""
UtilitiesButton.Parent = TabBar
local UICorner11 = Instance.new("UICorner")
UICorner11.CornerRadius = UDim.new(0, 7)
UICorner11.Parent = UtilitiesButton
local UIStroke11 = Instance.new("UIStroke")
UIStroke11.Color = Color3.fromRGB(220, 20, 40)
UIStroke11.Thickness = 1.2
UIStroke11.Transparency = 0.4
UIStroke11.Parent = UtilitiesButton
local TabIcon6 = Instance.new("ImageLabel")
TabIcon6.Name = "TabIcon"
TabIcon6.Size = UDim2.new(0, 18, 0, 18)
TabIcon6.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon6.AnchorPoint = Vector2.new(0, 0.5)
TabIcon6.BackgroundTransparency = 1
TabIcon6.ScaleType = Enum.ScaleType.Fit
TabIcon6.Image = "rbxassetid://117371753006597"
TabIcon6.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon6.Parent = UtilitiesButton
local TabName6 = Instance.new("TextLabel")
TabName6.Name = "TabName"
TabName6.Size = UDim2.new(1, -36, 1, 0)
TabName6.Position = UDim2.new(0, 33, 0, 0)
TabName6.BackgroundTransparency = 1
TabName6.Text = "Utilities"
TabName6.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName6.TextSize = 13
TabName6.Font = Enum.Font.ArialBold
TabName6.TextXAlignment = Enum.TextXAlignment.Left
TabName6.TextYAlignment = Enum.TextYAlignment.Center
TabName6.TextTruncate = Enum.TextTruncate.AtEnd
TabName6.Parent = UtilitiesButton
local tween11 = TweenService:Create(UtilitiesButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween12 = TweenService:Create(UtilitiesButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

UtilitiesButton.MouseEnter:Connect(function()
	UtilitiesButton.BackgroundTransparency = 0.35
	tween11:Play()
end)

UtilitiesButton.MouseLeave:Connect(function()
	UtilitiesButton.BackgroundTransparency = 0.55
	tween12:Play()
end)

UtilitiesButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween12:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = UtilitiesButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon6, r2 = 255, textLabel = TabName6 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke262 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke262.Transparency = item.transparency
		UIStroke262.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	UtilitiesContent.Visible = true
end)

local ConfigButton = Instance.new("TextButton")
ConfigButton.Name = "ConfigButton"
ConfigButton.Size = UDim2.new(1, -12, 0, 27)
ConfigButton.Position = UDim2.new(0.5, 0, 0, 200)
ConfigButton.AnchorPoint = Vector2.new(0.5, 0)
ConfigButton.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
ConfigButton.BackgroundTransparency = 0.55
ConfigButton.BorderSizePixel = 0
ConfigButton.Text = ""
ConfigButton.Parent = TabBar
local UICorner12 = Instance.new("UICorner")
UICorner12.CornerRadius = UDim.new(0, 7)
UICorner12.Parent = ConfigButton
local UIStroke12 = Instance.new("UIStroke")
UIStroke12.Color = Color3.fromRGB(220, 20, 40)
UIStroke12.Thickness = 1.2
UIStroke12.Transparency = 0.4
UIStroke12.Parent = ConfigButton
local TabIcon7 = Instance.new("ImageLabel")
TabIcon7.Name = "TabIcon"
TabIcon7.Size = UDim2.new(0, 18, 0, 18)
TabIcon7.Position = UDim2.new(0, 10, 0.5, 0)
TabIcon7.AnchorPoint = Vector2.new(0, 0.5)
TabIcon7.BackgroundTransparency = 1
TabIcon7.ScaleType = Enum.ScaleType.Fit
TabIcon7.Image = "rbxassetid://77937190465422"
TabIcon7.ImageColor3 = Color3.fromRGB(180, 180, 180)
TabIcon7.Parent = ConfigButton
local TabName7 = Instance.new("TextLabel")
TabName7.Name = "TabName"
TabName7.Size = UDim2.new(1, -36, 1, 0)
TabName7.Position = UDim2.new(0, 33, 0, 0)
TabName7.BackgroundTransparency = 1
TabName7.Text = "Config"
TabName7.TextColor3 = Color3.fromRGB(180, 180, 180)
TabName7.TextSize = 13
TabName7.Font = Enum.Font.ArialBold
TabName7.TextXAlignment = Enum.TextXAlignment.Left
TabName7.TextYAlignment = Enum.TextYAlignment.Center
TabName7.TextTruncate = Enum.TextTruncate.AtEnd
TabName7.Parent = ConfigButton
local tween13 = TweenService:Create(ConfigButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, -6, 0, 30) })
local tween14 = TweenService:Create(ConfigButton, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { Size = UDim2.new(1, -12, 0, 27) })

ConfigButton.MouseEnter:Connect(function()
	ConfigButton.BackgroundTransparency = 0.35
	tween13:Play()
end)

ConfigButton.MouseLeave:Connect(function()
	ConfigButton.BackgroundTransparency = 0.55
	tween14:Play()
end)

ConfigButton.MouseButton1Click:Connect(function()
	Sound:Play()
	tween14:Play()

	for _, item in ipairs({
		{ textButton = PlayerButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon, r2 = 180, textLabel = TabName },
		{ textButton = VisualButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon2, r2 = 180, textLabel = TabName2 },
		{ textButton = ESPButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon3, r2 = 180, textLabel = TabName3 },
		{ textButton = CombatButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon4, r2 = 180, textLabel = TabName4 },
		{ textButton = SkillsButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon5, r2 = 180, textLabel = TabName5 },
		{ textButton = UtilitiesButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon6, r2 = 180, textLabel = TabName6 },
		{ textButton = ConfigButton, r = 120, g = 10, b = 20, backgroundTransparency = 0.55, transparency = 0.4, thickness = 1.2, imageLabel = TabIcon7, r2 = 180, textLabel = TabName7 },
		{ textButton = ConfigButton, r = 160, g = 15, b = 30, backgroundTransparency = 0.2, transparency = 0.1, thickness = 1.8, imageLabel = TabIcon7, r2 = 255, textLabel = TabName7 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		local UIStroke270 = item.textButton:FindFirstChildWhichIsA("UIStroke")
		UIStroke270.Transparency = item.transparency
		UIStroke270.Thickness = item.thickness
		item.textButton:FindFirstChild("TabIcon")
		item.imageLabel.ImageColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
		item.textButton:FindFirstChild("TabName")
		item.textLabel.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	VisualContent.Visible = false
	PlayerContent.Visible = false
	CombatContent.Visible = false
	ESPContent.Visible = false
	SkillsContent.Visible = false
	ConfigContent.Visible = false
	UtilitiesContent.Visible = false
	ConfigContent.Visible = true
end)

local BindableButtons = Instance.new("Frame")
BindableButtons.Name = "BindableButtons"
BindableButtons.Size = UDim2.new(0, 160, 1, -20)
BindableButtons.Position = UDim2.new(1, -170, 0, 10)
BindableButtons.BackgroundTransparency = 1
BindableButtons.AnchorPoint = Vector2.new(0, 0)
BindableButtons.ZIndex = 15
BindableButtons.Parent = CustomPanelGui
local UIListLayout8 = Instance.new("UIListLayout")
UIListLayout8.FillDirection = Enum.FillDirection.Vertical
UIListLayout8.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout8.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout8.Padding = UDim.new(0, 6)
UIListLayout8.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout8.Parent = BindableButtons
local RuzScreenBtns = Instance.new("ScreenGui")
RuzScreenBtns.Name = "RuzScreenBtns"
RuzScreenBtns.ResetOnSpawn = false
RuzScreenBtns.DisplayOrder = 99
RuzScreenBtns.IgnoreGuiInset = true
RuzScreenBtns.Parent = game.CoreGui

RunService.RenderStepped:Connect(function(deltaTime)
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character)
end)

UserInputService.InputBegan:Connect(function(input4, gameProcessed4)
end)

local function createDivider(layoutOrder, parent, text)
	local Divider = Instance.new("Frame")
	Divider.Name = "Divider"
	Divider.Size = UDim2.new(1, 0, 0, 14)
	Divider.BackgroundTransparency = 1
	Divider.LayoutOrder = layoutOrder
	Divider.Parent = parent
	local Frame16 = Instance.new("Frame")
	Frame16.Size = UDim2.new(0, 10, 0, 1)
	Frame16.Position = UDim2.new(0, 0, 0.5, 0)
	Frame16.AnchorPoint = Vector2.new(0, 0.5)
	Frame16.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Frame16.BackgroundTransparency = 0.5
	Frame16.BorderSizePixel = 0
	Frame16.Parent = Divider
	local TextLabel10 = Instance.new("TextLabel")
	TextLabel10.Size = UDim2.new(0, 0, 1, 0)
	TextLabel10.AutomaticSize = Enum.AutomaticSize.X
	TextLabel10.Position = UDim2.new(0, 16, 0, 0)
	TextLabel10.BackgroundTransparency = 1
	TextLabel10.Text = text
	TextLabel10.TextColor3 = Color3.fromRGB(220, 20, 40)
	TextLabel10.TextSize = 10
	TextLabel10.Font = Enum.Font.ArialBold
	TextLabel10.Parent = Divider
	local Frame17 = Instance.new("Frame")
	Frame17.Size = UDim2.new(1, -28, 0, 1)
	Frame17.Position = UDim2.new(0, 24, 0.5, 0)
	Frame17.AnchorPoint = Vector2.new(0, 0.5)
	Frame17.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Frame17.BackgroundTransparency = 0.5
	Frame17.BorderSizePixel = 0
	Frame17.Parent = Divider

	task.defer(function()
		Frame17.Position = UDim2.new(0, 22, 0.5, 0)
		Frame17.Size = UDim2.new(1, -24, 0, 1)
	end)
end

createDivider(1, Scroll, "Walk Speed")

local function createFrame(yOffset, layoutOrder, parent)
	local Toggle_WalkSpeedEnabled = Instance.new("Frame")
	Toggle_WalkSpeedEnabled.Size = UDim2.new(1, 0, 0, yOffset)
	Toggle_WalkSpeedEnabled.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Toggle_WalkSpeedEnabled.BackgroundTransparency = 0.3
	Toggle_WalkSpeedEnabled.BorderSizePixel = 0
	Toggle_WalkSpeedEnabled.LayoutOrder = layoutOrder
	Toggle_WalkSpeedEnabled.Parent = parent
	local UICorner13 = Instance.new("UICorner")
	UICorner13.CornerRadius = UDim.new(0, 8)
	UICorner13.Parent = Toggle_WalkSpeedEnabled
	local UIStroke13 = Instance.new("UIStroke")
	UIStroke13.Color = Color3.fromRGB(60, 60, 60)
	UIStroke13.Thickness = 1
	UIStroke13.Transparency = 0.4
	UIStroke13.Parent = Toggle_WalkSpeedEnabled
	return Toggle_WalkSpeedEnabled, UIStroke13
end

local Toggle_WalkSpeedEnabled, UIStroke13 = createFrame(36, 2, Scroll)
Toggle_WalkSpeedEnabled.Name = "Toggle_Walk Speed Enabled"
local TextLabel11 = Instance.new("TextLabel")
TextLabel11.Size = UDim2.new(1, -72, 0, 14)
TextLabel11.Position = UDim2.new(0, 10, 0, 5)
TextLabel11.BackgroundTransparency = 1
TextLabel11.Text = "Walk Speed Enabled"
TextLabel11.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel11.TextSize = 11
TextLabel11.Font = Enum.Font.ArialBold
TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
TextLabel11.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel11.Parent = Toggle_WalkSpeedEnabled
local TextLabel12 = Instance.new("TextLabel")
TextLabel12.Size = UDim2.new(1, -72, 0, 11)
TextLabel12.Position = UDim2.new(0, 10, 0, 20)
TextLabel12.BackgroundTransparency = 1
TextLabel12.Text = "Auto-enforced every frame"
TextLabel12.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel12.TextSize = 9
TextLabel12.Font = Enum.Font.Arial
TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
TextLabel12.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel12.Parent = Toggle_WalkSpeedEnabled
local Frame19 = Instance.new("Frame")
Frame19.Size = UDim2.new(0, 34, 0, 18)
Frame19.Position = UDim2.new(1, -44, 0.5, 0)
Frame19.AnchorPoint = Vector2.new(1, 0.5)
Frame19.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame19.BorderSizePixel = 0
Frame19.Parent = Toggle_WalkSpeedEnabled
local UICorner14 = Instance.new("UICorner")
UICorner14.CornerRadius = UDim.new(1, 0)
UICorner14.Parent = Frame19
local Frame20 = Instance.new("Frame")
Frame20.Size = UDim2.new(0, 12, 0, 12)
Frame20.Position = UDim2.new(0, 3, 0.5, 0)
Frame20.AnchorPoint = Vector2.new(0, 0.5)
Frame20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame20.BorderSizePixel = 0
Frame20.Parent = Frame19
local UICorner15 = Instance.new("UICorner")
UICorner15.CornerRadius = UDim.new(1, 0)
UICorner15.Parent = Frame20
local UIStroke14 = Instance.new("UIStroke")
UIStroke14.Color = Color3.fromRGB(170, 20, 40)
UIStroke14.Thickness = 1.2
UIStroke14.Transparency = 0.3
UIStroke14.Parent = Frame20
local TextButton10 = Instance.new("TextButton")
TextButton10.Size = UDim2.new(1, 0, 1, 0)
TextButton10.BackgroundTransparency = 1
TextButton10.Text = ""
TextButton10.Parent = Toggle_WalkSpeedEnabled

TextButton10.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween15 = TweenService:Create(Frame19, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween15:Play()
	local tween16 = TweenService:Create(Frame20, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween16:Play()
	UIStroke13.Color = Color3.fromRGB(255, 0, 0)
	UIStroke13.Transparency = 0.25

	RunService.RenderStepped:Connect(function(deltaTime6)
		local Humanoid4 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		Humanoid4.WalkSpeed = 30
	end)
end)

local function createTextLabel(layoutOrder, parent, name, text, textLabelText, textLabelText2, xScale)
	local Slider_WalkSpeed, UIStroke15 = createFrame(44, layoutOrder, parent)
	Slider_WalkSpeed.Name = name
	local TextLabel13 = Instance.new("TextLabel")
	TextLabel13.Size = UDim2.new(0.62, 0, 0, 14)
	TextLabel13.Position = UDim2.new(0, 10, 0, 5)
	TextLabel13.BackgroundTransparency = 1
	TextLabel13.Text = text
	TextLabel13.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel13.TextSize = 11
	TextLabel13.Font = Enum.Font.ArialBold
	TextLabel13.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel13.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel13.Parent = Slider_WalkSpeed
	local TextLabel14 = Instance.new("TextLabel")
	TextLabel14.Size = UDim2.new(0.34, 0, 0, 14)
	TextLabel14.Position = UDim2.new(0.64, 0, 0, 5)
	TextLabel14.BackgroundTransparency = 1
	TextLabel14.Text = textLabelText
	TextLabel14.TextColor3 = Color3.fromRGB(220, 20, 40)
	TextLabel14.TextSize = 10
	TextLabel14.Font = Enum.Font.ArialBold
	TextLabel14.TextXAlignment = Enum.TextXAlignment.Right
	TextLabel14.Parent = Slider_WalkSpeed
	local TextLabel15 = Instance.new("TextLabel")
	TextLabel15.Size = UDim2.new(1, -20, 0, 10)
	TextLabel15.Position = UDim2.new(0, 10, 0, 19)
	TextLabel15.BackgroundTransparency = 1
	TextLabel15.Text = textLabelText2
	TextLabel15.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel15.TextSize = 9
	TextLabel15.Font = Enum.Font.Arial
	TextLabel15.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel15.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel15.Parent = Slider_WalkSpeed
	local Frame22 = Instance.new("Frame")
	Frame22.Size = UDim2.new(1, -20, 0, 5)
	Frame22.Position = UDim2.new(0, 10, 1, -10)
	Frame22.AnchorPoint = Vector2.new(0, 1)
	Frame22.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Frame22.BorderSizePixel = 0
	Frame22.Parent = Slider_WalkSpeed
	local UICorner17 = Instance.new("UICorner")
	UICorner17.CornerRadius = UDim.new(1, 0)
	UICorner17.Parent = Frame22
	local Frame23 = Instance.new("Frame")
	Frame23.Size = UDim2.new(xScale, 0, 1, 0)
	Frame23.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	Frame23.BorderSizePixel = 0
	Frame23.Parent = Frame22
	local UICorner18 = Instance.new("UICorner")
	UICorner18.CornerRadius = UDim.new(1, 0)
	UICorner18.Parent = Frame23
	local Frame24 = Instance.new("Frame")
	Frame24.Size = UDim2.new(0, 11, 0, 11)
	Frame24.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame24.Position = UDim2.new(xScale, 0, 0.5, 0)
	Frame24.BackgroundColor3 = Color3.fromRGB(170, 20, 40)
	Frame24.BorderSizePixel = 0
	Frame24.ZIndex = 2
	Frame24.Parent = Frame22
	local UICorner19 = Instance.new("UICorner")
	UICorner19.CornerRadius = UDim.new(1, 0)
	UICorner19.Parent = Frame24
	local UIStroke16 = Instance.new("UIStroke")
	UIStroke16.Color = Color3.fromRGB(220, 50, 70)
	UIStroke16.Thickness = 1.5
	UIStroke16.Parent = Frame24
	local TextButton11 = Instance.new("TextButton")
	TextButton11.Size = UDim2.new(1, 0, 1, 24)
	TextButton11.Position = UDim2.new(0, 0, 0.5, 0)
	TextButton11.AnchorPoint = Vector2.new(0, 0.5)
	TextButton11.BackgroundTransparency = 1
	TextButton11.Text = ""
	TextButton11.ZIndex = 3
	TextButton11.Parent = Frame22

	TextButton11.InputBegan:Connect(function(input5, gameProcessed5)
	end)

	TextButton11.InputEnded:Connect(function(input6, gameProcessed6)
	end)

	UserInputService.InputChanged:Connect(function(input7, gameProcessed7)
	end)

	TextButton11.InputBegan:Connect(function(input8, gameProcessed8)
	end)
end

createTextLabel(3, Scroll, "Slider_Walk Speed", "Walk Speed", "30 stud/s", "Default: 16 stud/s", 0.076086956521739135)

local function createDivider2(layoutOrder)
	local Divider2 = Instance.new("Frame")
	Divider2.Name = "Divider"
	Divider2.Size = UDim2.new(1, 0, 0, 14)
	Divider2.BackgroundTransparency = 1
	Divider2.LayoutOrder = layoutOrder
	Divider2.Parent = Scroll
	local Frame26 = Instance.new("Frame")
	Frame26.Size = UDim2.new(1, 0, 0, 1)
	Frame26.Position = UDim2.new(0, 0, 0.5, 0)
	Frame26.AnchorPoint = Vector2.new(0, 0.5)
	Frame26.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Frame26.BackgroundTransparency = 0.65
	Frame26.BorderSizePixel = 0
	Frame26.Parent = Divider2
end

createDivider2(4)
createDivider(5, Scroll, "Jump Power")
local Toggle_JumpPowerEnabled, UIStroke17 = createFrame(36, 6, Scroll)
Toggle_JumpPowerEnabled.Name = "Toggle_Jump Power Enabled"
local TextLabel17 = Instance.new("TextLabel")
TextLabel17.Size = UDim2.new(1, -72, 0, 14)
TextLabel17.Position = UDim2.new(0, 10, 0, 5)
TextLabel17.BackgroundTransparency = 1
TextLabel17.Text = "Jump Power Enabled"
TextLabel17.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel17.TextSize = 11
TextLabel17.Font = Enum.Font.ArialBold
TextLabel17.TextXAlignment = Enum.TextXAlignment.Left
TextLabel17.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel17.Parent = Toggle_JumpPowerEnabled
local TextLabel18 = Instance.new("TextLabel")
TextLabel18.Size = UDim2.new(1, -72, 0, 11)
TextLabel18.Position = UDim2.new(0, 10, 0, 20)
TextLabel18.BackgroundTransparency = 1
TextLabel18.Text = "Auto-enforced every frame"
TextLabel18.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel18.TextSize = 9
TextLabel18.Font = Enum.Font.Arial
TextLabel18.TextXAlignment = Enum.TextXAlignment.Left
TextLabel18.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel18.Parent = Toggle_JumpPowerEnabled
local Frame31 = Instance.new("Frame")
Frame31.Size = UDim2.new(0, 34, 0, 18)
Frame31.Position = UDim2.new(1, -44, 0.5, 0)
Frame31.AnchorPoint = Vector2.new(1, 0.5)
Frame31.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame31.BorderSizePixel = 0
Frame31.Parent = Toggle_JumpPowerEnabled
local UICorner21 = Instance.new("UICorner")
UICorner21.CornerRadius = UDim.new(1, 0)
UICorner21.Parent = Frame31
local Frame32 = Instance.new("Frame")
Frame32.Size = UDim2.new(0, 12, 0, 12)
Frame32.Position = UDim2.new(0, 3, 0.5, 0)
Frame32.AnchorPoint = Vector2.new(0, 0.5)
Frame32.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame32.BorderSizePixel = 0
Frame32.Parent = Frame31
local UICorner22 = Instance.new("UICorner")
UICorner22.CornerRadius = UDim.new(1, 0)
UICorner22.Parent = Frame32
local UIStroke18 = Instance.new("UIStroke")
UIStroke18.Color = Color3.fromRGB(170, 20, 40)
UIStroke18.Thickness = 1.2
UIStroke18.Transparency = 0.3
UIStroke18.Parent = Frame32
local TextButton12 = Instance.new("TextButton")
TextButton12.Size = UDim2.new(1, 0, 1, 0)
TextButton12.BackgroundTransparency = 1
TextButton12.Text = ""
TextButton12.Parent = Toggle_JumpPowerEnabled

TextButton12.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween17 = TweenService:Create(Frame31, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween17:Play()
	local tween18 = TweenService:Create(Frame32, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween18:Play()
	UIStroke17.Color = Color3.fromRGB(255, 0, 0)
	UIStroke17.Transparency = 0.25

	RunService.RenderStepped:Connect(function(deltaTime7)
		local Humanoid5 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		Humanoid5.JumpPower = 100
	end)
end)

createTextLabel(7, Scroll, "Slider_Jump Power", "Jump Power", "100 pow", "Default: 50", 0.18367346938775511)
createDivider2(8)
createDivider(9, Scroll, "NoClip")
local Toggle_NoClipEnabled, UIStroke21 = createFrame(36, 10, Scroll)
Toggle_NoClipEnabled.Name = "Toggle_NoClip Enabled"
local TextLabel23 = Instance.new("TextLabel")
TextLabel23.Size = UDim2.new(1, -72, 0, 14)
TextLabel23.Position = UDim2.new(0, 10, 0, 5)
TextLabel23.BackgroundTransparency = 1
TextLabel23.Text = "NoClip Enabled"
TextLabel23.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel23.TextSize = 11
TextLabel23.Font = Enum.Font.ArialBold
TextLabel23.TextXAlignment = Enum.TextXAlignment.Left
TextLabel23.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel23.Parent = Toggle_NoClipEnabled
local TextLabel24 = Instance.new("TextLabel")
TextLabel24.Size = UDim2.new(1, -72, 0, 11)
TextLabel24.Position = UDim2.new(0, 10, 0, 20)
TextLabel24.BackgroundTransparency = 1
TextLabel24.Text = "Walk through walls"
TextLabel24.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel24.TextSize = 9
TextLabel24.Font = Enum.Font.Arial
TextLabel24.TextXAlignment = Enum.TextXAlignment.Left
TextLabel24.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel24.Parent = Toggle_NoClipEnabled
local Frame43 = Instance.new("Frame")
Frame43.Size = UDim2.new(0, 34, 0, 18)
Frame43.Position = UDim2.new(1, -44, 0.5, 0)
Frame43.AnchorPoint = Vector2.new(1, 0.5)
Frame43.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame43.BorderSizePixel = 0
Frame43.Parent = Toggle_NoClipEnabled
local UICorner28 = Instance.new("UICorner")
UICorner28.CornerRadius = UDim.new(1, 0)
UICorner28.Parent = Frame43
local Frame44 = Instance.new("Frame")
Frame44.Size = UDim2.new(0, 12, 0, 12)
Frame44.Position = UDim2.new(0, 3, 0.5, 0)
Frame44.AnchorPoint = Vector2.new(0, 0.5)
Frame44.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame44.BorderSizePixel = 0
Frame44.Parent = Frame43
local UICorner29 = Instance.new("UICorner")
UICorner29.CornerRadius = UDim.new(1, 0)
UICorner29.Parent = Frame44
local UIStroke22 = Instance.new("UIStroke")
UIStroke22.Color = Color3.fromRGB(170, 20, 40)
UIStroke22.Thickness = 1.2
UIStroke22.Transparency = 0.3
UIStroke22.Parent = Frame44
local TextButton14 = Instance.new("TextButton")
TextButton14.Size = UDim2.new(1, 0, 1, 0)
TextButton14.BackgroundTransparency = 1
TextButton14.Text = ""
TextButton14.Parent = Toggle_NoClipEnabled

TextButton14.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween19 = TweenService:Create(Frame43, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween19:Play()
	local tween20 = TweenService:Create(Frame44, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween20:Play()
	UIStroke21.Color = Color3.fromRGB(255, 0, 0)
	UIStroke21.Transparency = 0.25

	RunService.Stepped:Connect(function(time, deltaTime8)
		local descendants31 = Players.LocalPlayer.Character:GetDescendants()

		for i57, v59 in ipairs(descendants31) do
		end
	end)

	comboBtnRefs.Noclip.lbl.Text = "NoClip\nON"
end)

local function setupTextButton2(textButton)
	textButton.InputBegan:Connect(function(input89, gameProcessed89)
	end)

	UserInputService.InputChanged:Connect(function(input90, gameProcessed90)
	end)

	UserInputService.InputEnded:Connect(function(input91, gameProcessed91)
	end)
end

local function createUIGradient(ruzHub_ComboBtns, name, yOffset, text)
	local RuzBtn_Noclip = Instance.new("TextButton", ruzHub_ComboBtns)
	RuzBtn_Noclip.Name = name
	RuzBtn_Noclip.Size = UDim2.new(0, 56, 0, 56)
	RuzBtn_Noclip.Position = UDim2.new(0, 20, 0.5, -yOffset)
	RuzBtn_Noclip.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
	RuzBtn_Noclip.BackgroundTransparency = 0.45
	RuzBtn_Noclip.Text = ""
	RuzBtn_Noclip.AutoButtonColor = false
	RuzBtn_Noclip.BorderSizePixel = 0
	local UICorner389 = Instance.new("UICorner", RuzBtn_Noclip)
	UICorner389.CornerRadius = UDim.new(0, 12)
	local UIStroke278 = Instance.new("UIStroke", RuzBtn_Noclip)
	UIStroke278.Thickness = 2.5
	UIStroke278.Color = Color3.fromRGB(255, 255, 255)
	UIStroke278.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	local UIGradient = Instance.new("UIGradient", UIStroke278)
	UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
	local Lbl = Instance.new("TextLabel", RuzBtn_Noclip)
	Lbl.Name = "Lbl"
	Lbl.Size = UDim2.new(1, 0, 1, 0)
	Lbl.BackgroundTransparency = 1
	Lbl.Text = text
	Lbl.Font = Enum.Font.GothamBold
	Lbl.TextSize = 10
	Lbl.TextYAlignment = Enum.TextYAlignment.Center
	Lbl.TextXAlignment = Enum.TextXAlignment.Center
	Lbl.TextStrokeTransparency = 0.5
	Lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	local UIGradient2 = Instance.new("UIGradient", Lbl)
	UIGradient2.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 0)) })
	UIGradient2.Rotation = 90
	setupTextButton2(RuzBtn_Noclip)
	return UIGradient, Lbl
end

local function tweenFrame4(frame, frame2, uiStroke, ruzHub_ComboBtns, name, yOffset, text)
	local tween21 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween21:Play()
	local tween22 = TweenService:Create(frame2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween22:Play()
	uiStroke.Color = Color3.fromRGB(255, 0, 0)
	uiStroke.Transparency = 0.25
	local UIGradient, Lbl = createUIGradient(ruzHub_ComboBtns, name, yOffset, text)
	return UIGradient, Lbl
end

local function createTextLabel7(layoutOrder, name, text, ruzHub_ComboBtns, name2, yOffset, text2)
	local Toggle_LoadNoClipButton, UIStroke23 = createFrame(36, layoutOrder, Scroll)
	Toggle_LoadNoClipButton.Name = name
	local TextLabel25 = Instance.new("TextLabel")
	TextLabel25.Size = UDim2.new(1, -72, 0, 14)
	TextLabel25.Position = UDim2.new(0, 10, 0, 5)
	TextLabel25.BackgroundTransparency = 1
	TextLabel25.Text = text
	TextLabel25.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel25.TextSize = 11
	TextLabel25.Font = Enum.Font.ArialBold
	TextLabel25.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel25.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel25.Parent = Toggle_LoadNoClipButton
	local TextLabel26 = Instance.new("TextLabel")
	TextLabel26.Size = UDim2.new(1, -72, 0, 11)
	TextLabel26.Position = UDim2.new(0, 10, 0, 20)
	TextLabel26.BackgroundTransparency = 1
	TextLabel26.Text = "Loads button on screen"
	TextLabel26.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel26.TextSize = 9
	TextLabel26.Font = Enum.Font.Arial
	TextLabel26.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel26.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel26.Parent = Toggle_LoadNoClipButton
	local Frame46 = Instance.new("Frame")
	Frame46.Size = UDim2.new(0, 34, 0, 18)
	Frame46.Position = UDim2.new(1, -44, 0.5, 0)
	Frame46.AnchorPoint = Vector2.new(1, 0.5)
	Frame46.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Frame46.BorderSizePixel = 0
	Frame46.Parent = Toggle_LoadNoClipButton
	local UICorner31 = Instance.new("UICorner")
	UICorner31.CornerRadius = UDim.new(1, 0)
	UICorner31.Parent = Frame46
	local Frame47 = Instance.new("Frame")
	Frame47.Size = UDim2.new(0, 12, 0, 12)
	Frame47.Position = UDim2.new(0, 3, 0.5, 0)
	Frame47.AnchorPoint = Vector2.new(0, 0.5)
	Frame47.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame47.BorderSizePixel = 0
	Frame47.Parent = Frame46
	local UICorner32 = Instance.new("UICorner")
	UICorner32.CornerRadius = UDim.new(1, 0)
	UICorner32.Parent = Frame47
	local UIStroke24 = Instance.new("UIStroke")
	UIStroke24.Color = Color3.fromRGB(170, 20, 40)
	UIStroke24.Thickness = 1.2
	UIStroke24.Transparency = 0.3
	UIStroke24.Parent = Frame47
	local TextButton15 = Instance.new("TextButton")
	TextButton15.Size = UDim2.new(1, 0, 1, 0)
	TextButton15.BackgroundTransparency = 1
	TextButton15.Text = ""
	TextButton15.Parent = Toggle_LoadNoClipButton

	TextButton15.MouseButton1Click:Connect(function()
		Sound:Play()
		local UIGradient, Lbl = tweenFrame4(Frame46, Frame47, UIStroke23, ruzHub_ComboBtns, name2, yOffset, text2)
	end)
end

createTextLabel7(11, "Toggle_Load NoClip Button", "Load NoClip Button", RuzHub_ComboBtns2, "RuzBtn_Noclip", 62, "NoClip\nON")

local function setupTextButton3(textButton, uiStroke, uiStroke2)
	textButton.Text = "Press key..."
	local tween25 = TweenService:Create(textButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(180, 15, 25), BackgroundTransparency = 0 })
	tween25:Play()
	textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	uiStroke.Color = Color3.fromRGB(220, 20, 40)
	uiStroke.Transparency = 0.1
	uiStroke2.Color = Color3.fromRGB(220, 20, 40)
end

local function createKeybindRow(layoutOrder, parent)
	local KeybindRow, UIStroke25 = createFrame(38, layoutOrder, parent)
	KeybindRow.Name = "KeybindRow"
	local TextLabel27 = Instance.new("TextLabel")
	TextLabel27.Size = UDim2.new(0, 80, 1, 0)
	TextLabel27.Position = UDim2.new(0, 12, 0, 0)
	TextLabel27.BackgroundTransparency = 1
	TextLabel27.Text = "Keybind"
	TextLabel27.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel27.TextSize = 13
	TextLabel27.Font = Enum.Font.ArialBold
	TextLabel27.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel27.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel27.Parent = KeybindRow
	local Frame49 = Instance.new("Frame")
	Frame49.Size = UDim2.new(0, 60, 0, 24)
	Frame49.Position = UDim2.new(1, -148, 0.5, 0)
	Frame49.AnchorPoint = Vector2.new(1, 0.5)
	Frame49.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	Frame49.BackgroundTransparency = 0.1
	Frame49.BorderSizePixel = 0
	Frame49.Parent = KeybindRow
	local UICorner34 = Instance.new("UICorner")
	UICorner34.CornerRadius = UDim.new(0, 6)
	UICorner34.Parent = Frame49
	local UIStroke26 = Instance.new("UIStroke")
	UIStroke26.Color = Color3.fromRGB(60, 60, 60)
	UIStroke26.Thickness = 1
	UIStroke26.Transparency = 0.3
	UIStroke26.Parent = Frame49
	local TextLabel28 = Instance.new("TextLabel")
	TextLabel28.Size = UDim2.new(1, 0, 1, 0)
	TextLabel28.BackgroundTransparency = 1
	TextLabel28.Text = "None"
	TextLabel28.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel28.TextSize = 11
	TextLabel28.Font = Enum.Font.ArialBold
	TextLabel28.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel28.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel28.Parent = Frame49
	local TextButton16 = Instance.new("TextButton")
	TextButton16.Size = UDim2.new(0, 80, 0, 26)
	TextButton16.Position = UDim2.new(1, -10, 0.5, 0)
	TextButton16.AnchorPoint = Vector2.new(1, 0.5)
	TextButton16.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton16.BackgroundTransparency = 0.15
	TextButton16.BorderSizePixel = 0
	TextButton16.Text = "Attach"
	TextButton16.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton16.TextSize = 12
	TextButton16.Font = Enum.Font.ArialBold
	TextButton16.AutoButtonColor = false
	TextButton16.Parent = KeybindRow
	local UICorner35 = Instance.new("UICorner")
	UICorner35.CornerRadius = UDim.new(0, 6)
	UICorner35.Parent = TextButton16
	local UIStroke27 = Instance.new("UIStroke")
	UIStroke27.Color = Color3.fromRGB(255, 40, 60)
	UIStroke27.Thickness = 1
	UIStroke27.Transparency = 0.3
	UIStroke27.Parent = TextButton16

	TextButton16.MouseEnter:Connect(function()
		local tween23 = TweenService:Create(TextButton16, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
		tween23:Play()
	end)

	TextButton16.MouseLeave:Connect(function()
		local tween24 = TweenService:Create(TextButton16, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.15 })
		tween24:Play()
	end)

	TextButton16.MouseButton1Click:Connect(function()
		Sound:Play()
		setupTextButton3(TextButton16, UIStroke25, UIStroke26)

		task.spawn(function()
			task.wait(0.1)
			task.wait(0.1)
			-- [envlog] the statements above repeat forever (loop)
		end)
	end)
end

createKeybindRow(12, Scroll)
createDivider2(13)
local Toggle_InfiniteJumpEnabled, UIStroke28 = createFrame(36, 14, Scroll)
Toggle_InfiniteJumpEnabled.Name = "Toggle_Infinite Jump Enabled"
local TextLabel29 = Instance.new("TextLabel")
TextLabel29.Size = UDim2.new(1, -72, 0, 14)
TextLabel29.Position = UDim2.new(0, 10, 0, 5)
TextLabel29.BackgroundTransparency = 1
TextLabel29.Text = "Infinite Jump Enabled"
TextLabel29.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel29.TextSize = 11
TextLabel29.Font = Enum.Font.ArialBold
TextLabel29.TextXAlignment = Enum.TextXAlignment.Left
TextLabel29.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel29.Parent = Toggle_InfiniteJumpEnabled
local TextLabel30 = Instance.new("TextLabel")
TextLabel30.Size = UDim2.new(1, -72, 0, 11)
TextLabel30.Position = UDim2.new(0, 10, 0, 20)
TextLabel30.BackgroundTransparency = 1
TextLabel30.Text = "Jump from mid-air"
TextLabel30.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel30.TextSize = 9
TextLabel30.Font = Enum.Font.Arial
TextLabel30.TextXAlignment = Enum.TextXAlignment.Left
TextLabel30.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel30.Parent = Toggle_InfiniteJumpEnabled
local Frame53 = Instance.new("Frame")
Frame53.Size = UDim2.new(0, 34, 0, 18)
Frame53.Position = UDim2.new(1, -44, 0.5, 0)
Frame53.AnchorPoint = Vector2.new(1, 0.5)
Frame53.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame53.BorderSizePixel = 0
Frame53.Parent = Toggle_InfiniteJumpEnabled
local UICorner37 = Instance.new("UICorner")
UICorner37.CornerRadius = UDim.new(1, 0)
UICorner37.Parent = Frame53
local Frame54 = Instance.new("Frame")
Frame54.Size = UDim2.new(0, 12, 0, 12)
Frame54.Position = UDim2.new(0, 3, 0.5, 0)
Frame54.AnchorPoint = Vector2.new(0, 0.5)
Frame54.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame54.BorderSizePixel = 0
Frame54.Parent = Frame53
local UICorner38 = Instance.new("UICorner")
UICorner38.CornerRadius = UDim.new(1, 0)
UICorner38.Parent = Frame54
local UIStroke29 = Instance.new("UIStroke")
UIStroke29.Color = Color3.fromRGB(170, 20, 40)
UIStroke29.Thickness = 1.2
UIStroke29.Transparency = 0.3
UIStroke29.Parent = Frame54
local TextButton17 = Instance.new("TextButton")
TextButton17.Size = UDim2.new(1, 0, 1, 0)
TextButton17.BackgroundTransparency = 1
TextButton17.Text = ""
TextButton17.Parent = Toggle_InfiniteJumpEnabled

TextButton17.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween26 = TweenService:Create(Frame53, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween26:Play()
	local tween27 = TweenService:Create(Frame54, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween27:Play()
	UIStroke28.Color = Color3.fromRGB(255, 0, 0)
	UIStroke28.Transparency = 0.25

	UserInputService.JumpRequest:Connect(function()
		local Humanoid6 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		Humanoid6:GetState()
		Humanoid6:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
end)

createDivider(15, Scroll, "Fly")
local Toggle_FlyEnabled, UIStroke30 = createFrame(36, 16, Scroll)
Toggle_FlyEnabled.Name = "Toggle_Fly Enabled"
local TextLabel32 = Instance.new("TextLabel")
TextLabel32.Size = UDim2.new(1, -72, 0, 14)
TextLabel32.Position = UDim2.new(0, 10, 0, 5)
TextLabel32.BackgroundTransparency = 1
TextLabel32.Text = "Fly Enabled"
TextLabel32.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel32.TextSize = 11
TextLabel32.Font = Enum.Font.ArialBold
TextLabel32.TextXAlignment = Enum.TextXAlignment.Left
TextLabel32.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel32.Parent = Toggle_FlyEnabled
local TextLabel33 = Instance.new("TextLabel")
TextLabel33.Size = UDim2.new(1, -72, 0, 11)
TextLabel33.Position = UDim2.new(0, 10, 0, 20)
TextLabel33.BackgroundTransparency = 1
TextLabel33.Text = "WASD · Space to rise · LCtrl to descend"
TextLabel33.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel33.TextSize = 9
TextLabel33.Font = Enum.Font.Arial
TextLabel33.TextXAlignment = Enum.TextXAlignment.Left
TextLabel33.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel33.Parent = Toggle_FlyEnabled
local Frame59 = Instance.new("Frame")
Frame59.Size = UDim2.new(0, 34, 0, 18)
Frame59.Position = UDim2.new(1, -44, 0.5, 0)
Frame59.AnchorPoint = Vector2.new(1, 0.5)
Frame59.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame59.BorderSizePixel = 0
Frame59.Parent = Toggle_FlyEnabled
local UICorner40 = Instance.new("UICorner")
UICorner40.CornerRadius = UDim.new(1, 0)
UICorner40.Parent = Frame59
local Frame60 = Instance.new("Frame")
Frame60.Size = UDim2.new(0, 12, 0, 12)
Frame60.Position = UDim2.new(0, 3, 0.5, 0)
Frame60.AnchorPoint = Vector2.new(0, 0.5)
Frame60.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame60.BorderSizePixel = 0
Frame60.Parent = Frame59
local UICorner41 = Instance.new("UICorner")
UICorner41.CornerRadius = UDim.new(1, 0)
UICorner41.Parent = Frame60
local UIStroke31 = Instance.new("UIStroke")
UIStroke31.Color = Color3.fromRGB(170, 20, 40)
UIStroke31.Thickness = 1.2
UIStroke31.Transparency = 0.3
UIStroke31.Parent = Frame60
local TextButton18 = Instance.new("TextButton")
TextButton18.Size = UDim2.new(1, 0, 1, 0)
TextButton18.BackgroundTransparency = 1
TextButton18.Text = ""
TextButton18.Parent = Toggle_FlyEnabled

TextButton18.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween28 = TweenService:Create(Frame59, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween28:Play()
	local tween29 = TweenService:Create(Frame60, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween29:Play()
	UIStroke30.Color = Color3.fromRGB(255, 0, 0)
	UIStroke30.Transparency = 0.25
	local HumanoidRootPart = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local Humanoid = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	Humanoid.PlatformStand = true
	local BodyVelocity = Instance.new("BodyVelocity")
	BodyVelocity.MaxForce = Vector3.new(99999, 99999, 99999)
	BodyVelocity.Velocity = Vector3.new(0, 0, 0)
	BodyVelocity.Parent = HumanoidRootPart
	local BodyGyro = Instance.new("BodyGyro")
	BodyGyro.MaxTorque = Vector3.new(99999, 99999, 99999)
	BodyGyro.P = 12500
	BodyGyro.Parent = HumanoidRootPart

	RunService.RenderStepped:Connect(function(deltaTime9)
		local PlayerModule = Players.LocalPlayer.PlayerScripts:FindFirstChild("PlayerModule")
		local ControlModule = PlayerModule:FindFirstChild("ControlModule")
		local module = require(ControlModule)
		module:GetMoveVector()
		UserInputService:IsKeyDown(Enum.KeyCode.Space)
		UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
		BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		BodyGyro.CFrame = workspace.CurrentCamera.CFrame
	end)

	comboBtnRefs.Fly.lbl.Text = "Fly\nON"
end)

createTextLabel(17, Scroll, "Slider_Fly Speed", "Fly Speed", "80 stud/s", "Speed while flying", 0.2413793103448276)
createTextLabel7(18, "Toggle_Load Fly Button", "Load Fly Button", RuzHub_ComboBtns2, "RuzBtn_Fly", 4, "Fly\nON")
createKeybindRow(19, Scroll)
createDivider(20, Scroll, "Camera")
local Toggle_FOVEnabled, UIStroke39 = createFrame(36, 21, Scroll)
Toggle_FOVEnabled.Name = "Toggle_FOV Enabled"
local TextLabel42 = Instance.new("TextLabel")
TextLabel42.Size = UDim2.new(1, -72, 0, 14)
TextLabel42.Position = UDim2.new(0, 10, 0, 5)
TextLabel42.BackgroundTransparency = 1
TextLabel42.Text = "FOV Enabled"
TextLabel42.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel42.TextSize = 11
TextLabel42.Font = Enum.Font.ArialBold
TextLabel42.TextXAlignment = Enum.TextXAlignment.Left
TextLabel42.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel42.Parent = Toggle_FOVEnabled
local TextLabel43 = Instance.new("TextLabel")
TextLabel43.Size = UDim2.new(1, -72, 0, 11)
TextLabel43.Position = UDim2.new(0, 10, 0, 20)
TextLabel43.BackgroundTransparency = 1
TextLabel43.Text = "Override camera field of view"
TextLabel43.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel43.TextSize = 9
TextLabel43.Font = Enum.Font.Arial
TextLabel43.TextXAlignment = Enum.TextXAlignment.Left
TextLabel43.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel43.Parent = Toggle_FOVEnabled
local Frame74 = Instance.new("Frame")
Frame74.Size = UDim2.new(0, 34, 0, 18)
Frame74.Position = UDim2.new(1, -44, 0.5, 0)
Frame74.AnchorPoint = Vector2.new(1, 0.5)
Frame74.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame74.BorderSizePixel = 0
Frame74.Parent = Toggle_FOVEnabled
local UICorner53 = Instance.new("UICorner")
UICorner53.CornerRadius = UDim.new(1, 0)
UICorner53.Parent = Frame74
local Frame75 = Instance.new("Frame")
Frame75.Size = UDim2.new(0, 12, 0, 12)
Frame75.Position = UDim2.new(0, 3, 0.5, 0)
Frame75.AnchorPoint = Vector2.new(0, 0.5)
Frame75.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame75.BorderSizePixel = 0
Frame75.Parent = Frame74
local UICorner54 = Instance.new("UICorner")
UICorner54.CornerRadius = UDim.new(1, 0)
UICorner54.Parent = Frame75
local UIStroke40 = Instance.new("UIStroke")
UIStroke40.Color = Color3.fromRGB(170, 20, 40)
UIStroke40.Thickness = 1.2
UIStroke40.Transparency = 0.3
UIStroke40.Parent = Frame75
local TextButton22 = Instance.new("TextButton")
TextButton22.Size = UDim2.new(1, 0, 1, 0)
TextButton22.BackgroundTransparency = 1
TextButton22.Text = ""
TextButton22.Parent = Toggle_FOVEnabled

TextButton22.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween35 = TweenService:Create(Frame74, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween35:Play()
	local tween36 = TweenService:Create(Frame75, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween36:Play()
	UIStroke39.Color = Color3.fromRGB(255, 0, 0)
	UIStroke39.Transparency = 0.25
	workspace.CurrentCamera.FieldOfView = 100
end)

createTextLabel(22, Scroll, "Slider_Field of View", "Field of View", "100°", "Default: 70°", 0.77777777777777779)
createDivider(1, Scroll2, "Crosshair")
local Toggle_CustomCrosshair, UIStroke43 = createFrame(36, 2, Scroll2)
Toggle_CustomCrosshair.Name = "Toggle_Custom Crosshair"
local TextLabel48 = Instance.new("TextLabel")
TextLabel48.Size = UDim2.new(1, -72, 0, 14)
TextLabel48.Position = UDim2.new(0, 10, 0, 5)
TextLabel48.BackgroundTransparency = 1
TextLabel48.Text = "Custom Crosshair"
TextLabel48.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel48.TextSize = 11
TextLabel48.Font = Enum.Font.ArialBold
TextLabel48.TextXAlignment = Enum.TextXAlignment.Left
TextLabel48.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel48.Parent = Toggle_CustomCrosshair
local TextLabel49 = Instance.new("TextLabel")
TextLabel49.Size = UDim2.new(1, -72, 0, 11)
TextLabel49.Position = UDim2.new(0, 10, 0, 20)
TextLabel49.BackgroundTransparency = 1
TextLabel49.Text = "Replace default cursor (ShiftLock required)"
TextLabel49.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel49.TextSize = 9
TextLabel49.Font = Enum.Font.Arial
TextLabel49.TextXAlignment = Enum.TextXAlignment.Left
TextLabel49.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel49.Parent = Toggle_CustomCrosshair
local Frame84 = Instance.new("Frame")
Frame84.Size = UDim2.new(0, 34, 0, 18)
Frame84.Position = UDim2.new(1, -44, 0.5, 0)
Frame84.AnchorPoint = Vector2.new(1, 0.5)
Frame84.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame84.BorderSizePixel = 0
Frame84.Parent = Toggle_CustomCrosshair
local UICorner60 = Instance.new("UICorner")
UICorner60.CornerRadius = UDim.new(1, 0)
UICorner60.Parent = Frame84
local Frame85 = Instance.new("Frame")
Frame85.Size = UDim2.new(0, 12, 0, 12)
Frame85.Position = UDim2.new(0, 3, 0.5, 0)
Frame85.AnchorPoint = Vector2.new(0, 0.5)
Frame85.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame85.BorderSizePixel = 0
Frame85.Parent = Frame84
local UICorner61 = Instance.new("UICorner")
UICorner61.CornerRadius = UDim.new(1, 0)
UICorner61.Parent = Frame85
local UIStroke44 = Instance.new("UIStroke")
UIStroke44.Color = Color3.fromRGB(170, 20, 40)
UIStroke44.Thickness = 1.2
UIStroke44.Transparency = 0.3
UIStroke44.Parent = Frame85
local TextButton24 = Instance.new("TextButton")
TextButton24.Size = UDim2.new(1, 0, 1, 0)
TextButton24.BackgroundTransparency = 1
TextButton24.Text = ""
TextButton24.Parent = Toggle_CustomCrosshair

local function setupV(v, image)
	v.Image = image
	v.Size = UDim2.new(0, 30, 0, 30)
end

local function setupV2(v)
	v.Image = v.Image
	v.Size = v.Size
	v.Rotation = 0
end

TextButton24.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween37 = TweenService:Create(Frame84, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween37:Play()
	local tween38 = TweenService:Create(Frame85, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween38:Play()
	UIStroke43.Color = Color3.fromRGB(255, 0, 0)
	UIStroke43.Transparency = 0.25
	local RuzCrosshairDisplay = game.CoreGui:FindFirstChild("RuzCrosshairDisplay")
	RuzCrosshairDisplay:Destroy()
	local RuzCrosshairDisplay2 = Instance.new("ScreenGui", game.CoreGui)
	RuzCrosshairDisplay2.Name = "RuzCrosshairDisplay"
	RuzCrosshairDisplay2.ResetOnSpawn = false
	RuzCrosshairDisplay2.DisplayOrder = 25
	RuzCrosshairDisplay2.IgnoreGuiInset = true
	local ImageLabel46 = Instance.new("ImageLabel", RuzCrosshairDisplay2)
	ImageLabel46.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel46.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel46.Size = UDim2.new(0, 30, 0, 30)
	ImageLabel46.BackgroundTransparency = 1
	ImageLabel46.Image = "rbxassetid://5341007131"
	ImageLabel46.ZIndex = 10
	ImageLabel46.Visible = false
	ImageLabel46.Rotation = 0

	RunService.RenderStepped:Connect(function(deltaTime10)
	end)

	_G.RuzApplyCrosshair = function()
		_G.RuzSavedDecals = nil
		local PlayerGui2 = Players.LocalPlayer:FindFirstChild("PlayerGui")
		local descendants = PlayerGui2:GetDescendants()

		for i3, v3 in ipairs(descendants) do
			local result3 = v3.Name:lower()
			result3:find("crosshair")
		end

		game.CoreGui:GetDescendants()
		ImageLabel46.Visible = false
		setupV(v3, "rbxassetid://5341007131")
		_G.RuzSavedDecals = { { obj = v3, origImage = v3.Image, origSize = v3.Size } }
	end

	ImageLabel46.Rotation = 0
	v3.Rotation = 0
	setupV2(v3)
	_G.RuzSavedDecals = nil
	local PlayerGui3 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants2 = PlayerGui3:GetDescendants()

	for i4, v4 in ipairs(descendants2) do
		local result4 = v4.Name:lower()
		result4:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v4, "rbxassetid://5341007131")
	_G.RuzSavedDecals = { { obj = v4, origImage = v4.Image, origSize = v4.Size } }
end)

local CrosshairStyleRow, UIStroke45 = createFrame(46, 3, Scroll2)
CrosshairStyleRow.Name = "CrosshairStyleRow"
local TextLabel50 = Instance.new("TextLabel")
TextLabel50.Size = UDim2.new(0, 140, 0, 18)
TextLabel50.Position = UDim2.new(0, 12, 0.5, 0)
TextLabel50.AnchorPoint = Vector2.new(0, 0.5)
TextLabel50.BackgroundTransparency = 1
TextLabel50.Text = "Select Crosshair"
TextLabel50.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel50.TextSize = 13
TextLabel50.Font = Enum.Font.ArialBold
TextLabel50.TextXAlignment = Enum.TextXAlignment.Left
TextLabel50.Parent = CrosshairStyleRow
local TextButton25 = Instance.new("TextButton")
TextButton25.Size = UDim2.new(0, 32, 0, 26)
TextButton25.Position = UDim2.new(0, 160, 0.5, 0)
TextButton25.AnchorPoint = Vector2.new(0, 0.5)
TextButton25.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton25.BackgroundTransparency = 0.1
TextButton25.BorderSizePixel = 0
TextButton25.Text = ""
TextButton25.Parent = CrosshairStyleRow
local UICorner63 = Instance.new("UICorner")
UICorner63.CornerRadius = UDim.new(0, 6)
UICorner63.Parent = TextButton25
local UIStroke46 = Instance.new("UIStroke")
UIStroke46.Color = Color3.fromRGB(60, 60, 60)
UIStroke46.Thickness = 1
UIStroke46.Transparency = 0.2
UIStroke46.Parent = TextButton25
local ImageLabel10 = Instance.new("ImageLabel")
ImageLabel10.Size = UDim2.new(0, 20, 0, 20)
ImageLabel10.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel10.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel10.BackgroundTransparency = 1
ImageLabel10.ScaleType = Enum.ScaleType.Fit
ImageLabel10.Image = "rbxassetid://71046418862578"
ImageLabel10.ImageColor3 = Color3.fromRGB(220, 20, 40)
ImageLabel10.Parent = TextButton25
local Frame87 = Instance.new("Frame")
Frame87.Size = UDim2.new(0, 26, 0, 26)
Frame87.Position = UDim2.new(0, 202, 0.5, 0)
Frame87.AnchorPoint = Vector2.new(0, 0.5)
Frame87.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame87.BackgroundTransparency = 0.3
Frame87.BorderSizePixel = 0
Frame87.ClipsDescendants = true
Frame87.Parent = CrosshairStyleRow
local UICorner64 = Instance.new("UICorner")
UICorner64.CornerRadius = UDim.new(0, 6)
UICorner64.Parent = Frame87
local UIStroke47 = Instance.new("UIStroke")
UIStroke47.Color = Color3.fromRGB(60, 60, 60)
UIStroke47.Thickness = 1
UIStroke47.Transparency = 0.3
UIStroke47.Parent = Frame87
local ImageLabel11 = Instance.new("ImageLabel")
ImageLabel11.Size = UDim2.new(1, -4, 1, -4)
ImageLabel11.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel11.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel11.BackgroundTransparency = 1
ImageLabel11.ScaleType = Enum.ScaleType.Fit
ImageLabel11.Image = "rbxassetid://5341007131"
ImageLabel11.Parent = Frame87
local CrosshairList = Instance.new("Frame")
CrosshairList.Name = "CrosshairList"
CrosshairList.Size = UDim2.new(0, 220, 0, 214)
CrosshairList.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
CrosshairList.BackgroundTransparency = 0.04
CrosshairList.BorderSizePixel = 0
CrosshairList.Visible = false
CrosshairList.ZIndex = 60
CrosshairList.Parent = CustomPanelGui
local UICorner65 = Instance.new("UICorner")
UICorner65.CornerRadius = UDim.new(0, 8)
UICorner65.Parent = CrosshairList
local UIStroke48 = Instance.new("UIStroke")
UIStroke48.Color = Color3.fromRGB(255, 0, 0)
UIStroke48.Thickness = 1.2
UIStroke48.Transparency = 0.2
UIStroke48.Parent = CrosshairList
local Frame89 = Instance.new("Frame")
Frame89.Size = UDim2.new(1, 0, 0, 28)
Frame89.BackgroundTransparency = 1
Frame89.ZIndex = 61
Frame89.Parent = CrosshairList
local TextLabel51 = Instance.new("TextLabel")
TextLabel51.Size = UDim2.new(1, -32, 1, 0)
TextLabel51.Position = UDim2.new(0, 8, 0, 0)
TextLabel51.BackgroundTransparency = 1
TextLabel51.Text = "Select Crosshair"
TextLabel51.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel51.TextSize = 10
TextLabel51.Font = Enum.Font.ArialBold
TextLabel51.TextXAlignment = Enum.TextXAlignment.Left
TextLabel51.ZIndex = 61
TextLabel51.Parent = Frame89
local TextButton26 = Instance.new("TextButton")
TextButton26.Size = UDim2.new(0, 28, 0, 28)
TextButton26.Position = UDim2.new(1, -8, 0.5, 0)
TextButton26.AnchorPoint = Vector2.new(1, 0.5)
TextButton26.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton26.BackgroundTransparency = 0.3
TextButton26.BorderSizePixel = 0
TextButton26.Text = ""
TextButton26.ZIndex = 62
TextButton26.Parent = Frame89
local UICorner66 = Instance.new("UICorner")
UICorner66.CornerRadius = UDim.new(0, 6)
UICorner66.Parent = TextButton26
local UIStroke49 = Instance.new("UIStroke")
UIStroke49.Color = Color3.fromRGB(255, 40, 60)
UIStroke49.Thickness = 1.2
UIStroke49.Transparency = 0.3
UIStroke49.Parent = TextButton26
local ImageLabel12 = Instance.new("ImageLabel")
ImageLabel12.Size = UDim2.new(0, 16, 0, 16)
ImageLabel12.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel12.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel12.BackgroundTransparency = 1
ImageLabel12.ScaleType = Enum.ScaleType.Fit
ImageLabel12.Image = "rbxassetid://116396312853810"
ImageLabel12.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel12.ZIndex = 63
ImageLabel12.Parent = TextButton26

TextButton26.MouseEnter:Connect(function()
	TextButton26.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton26.BackgroundTransparency = 0.1
end)

TextButton26.MouseLeave:Connect(function()
	TextButton26.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton26.BackgroundTransparency = 0.3
end)

local Frame90 = Instance.new("Frame")
Frame90.Size = UDim2.new(1, -8, 0, 1)
Frame90.Position = UDim2.new(0.5, 0, 0, 28)
Frame90.AnchorPoint = Vector2.new(0.5, 0)
Frame90.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame90.BackgroundTransparency = 0.6
Frame90.BorderSizePixel = 0
Frame90.ZIndex = 61
Frame90.Parent = CrosshairList
local ScrollingFrame8 = Instance.new("ScrollingFrame")
ScrollingFrame8.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame8.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame8.BackgroundTransparency = 1
ScrollingFrame8.BorderSizePixel = 0
ScrollingFrame8.ScrollBarThickness = 2
ScrollingFrame8.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame8.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame8.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame8.ZIndex = 61
ScrollingFrame8.Parent = CrosshairList
local UIListLayout9 = Instance.new("UIListLayout")
UIListLayout9.Padding = UDim.new(0, 2)
UIListLayout9.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout9.Parent = ScrollingFrame8
local UIPadding8 = Instance.new("UIPadding")
UIPadding8.PaddingLeft = UDim.new(0, 4)
UIPadding8.PaddingRight = UDim.new(0, 4)
UIPadding8.PaddingTop = UDim.new(0, 3)
UIPadding8.Parent = ScrollingFrame8
local TextButton27 = Instance.new("TextButton")
TextButton27.Size = UDim2.new(1, 0, 0, 28)
TextButton27.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton27.BackgroundTransparency = 0.3
TextButton27.BorderSizePixel = 0
TextButton27.Text = ""
TextButton27.ZIndex = 62
TextButton27.LayoutOrder = 1
TextButton27.Parent = ScrollingFrame8
local UICorner67 = Instance.new("UICorner")
UICorner67.CornerRadius = UDim.new(0, 5)
UICorner67.Parent = TextButton27
local ImageLabel13 = Instance.new("ImageLabel")
ImageLabel13.Size = UDim2.new(0, 20, 0, 20)
ImageLabel13.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel13.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel13.BackgroundTransparency = 1
ImageLabel13.ScaleType = Enum.ScaleType.Fit
ImageLabel13.Image = "rbxassetid://5341007131"
ImageLabel13.ZIndex = 63
ImageLabel13.Parent = TextButton27
local TextLabel52 = Instance.new("TextLabel")
TextLabel52.Size = UDim2.new(1, -32, 1, 0)
TextLabel52.Position = UDim2.new(0, 30, 0, 0)
TextLabel52.BackgroundTransparency = 1
TextLabel52.Text = "Red Crosshair"
TextLabel52.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel52.TextSize = 11
TextLabel52.Font = Enum.Font.ArialBold
TextLabel52.TextXAlignment = Enum.TextXAlignment.Left
TextLabel52.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel52.ZIndex = 63
TextLabel52.Parent = TextButton27

TextButton27.MouseEnter:Connect(function()
end)

TextButton27.MouseLeave:Connect(function()
end)

TextButton27.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://5341007131"
	ImageLabel46.Image = "rbxassetid://5341007131"
	setupV2(v4)
	_G.RuzSavedDecals = nil
	local PlayerGui4 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants3 = PlayerGui4:GetDescendants()

	for i5, v5 in ipairs(descendants3) do
		local result5 = v5.Name:lower()
		result5:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v5, "rbxassetid://5341007131")
	_G.RuzSavedDecals = { { obj = v5, origImage = v5.Image, origSize = v5.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel262 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel262.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton27.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton27.BackgroundTransparency = 0.3
	TextLabel52.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton28 = Instance.new("TextButton")
TextButton28.Size = UDim2.new(1, 0, 0, 28)
TextButton28.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton28.BackgroundTransparency = 0.65
TextButton28.BorderSizePixel = 0
TextButton28.Text = ""
TextButton28.ZIndex = 62
TextButton28.LayoutOrder = 2
TextButton28.Parent = ScrollingFrame8
local UICorner68 = Instance.new("UICorner")
UICorner68.CornerRadius = UDim.new(0, 5)
UICorner68.Parent = TextButton28
local ImageLabel14 = Instance.new("ImageLabel")
ImageLabel14.Size = UDim2.new(0, 20, 0, 20)
ImageLabel14.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel14.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel14.BackgroundTransparency = 1
ImageLabel14.ScaleType = Enum.ScaleType.Fit
ImageLabel14.Image = "rbxassetid://118814636385112"
ImageLabel14.ZIndex = 63
ImageLabel14.Parent = TextButton28
local TextLabel53 = Instance.new("TextLabel")
TextLabel53.Size = UDim2.new(1, -32, 1, 0)
TextLabel53.Position = UDim2.new(0, 30, 0, 0)
TextLabel53.BackgroundTransparency = 1
TextLabel53.Text = "Red Crosshair 2"
TextLabel53.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel53.TextSize = 11
TextLabel53.Font = Enum.Font.ArialBold
TextLabel53.TextXAlignment = Enum.TextXAlignment.Left
TextLabel53.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel53.ZIndex = 63
TextLabel53.Parent = TextButton28

TextButton28.MouseEnter:Connect(function()
	TextButton28.BackgroundTransparency = 0.4
	TextLabel53.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton28.MouseLeave:Connect(function()
	TextButton28.BackgroundTransparency = 0.65
	TextLabel53.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton28.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://118814636385112"
	ImageLabel46.Image = "rbxassetid://118814636385112"
	setupV2(v5)
	_G.RuzSavedDecals = nil
	local PlayerGui5 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants4 = PlayerGui5:GetDescendants()

	for i6, v6 in ipairs(descendants4) do
		local result6 = v6.Name:lower()
		result6:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v6, "rbxassetid://118814636385112")
	_G.RuzSavedDecals = { { obj = v6, origImage = v6.Image, origSize = v6.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel283 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel283.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton28.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton28.BackgroundTransparency = 0.3
	TextLabel53.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton29 = Instance.new("TextButton")
TextButton29.Size = UDim2.new(1, 0, 0, 28)
TextButton29.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton29.BackgroundTransparency = 0.65
TextButton29.BorderSizePixel = 0
TextButton29.Text = ""
TextButton29.ZIndex = 62
TextButton29.LayoutOrder = 3
TextButton29.Parent = ScrollingFrame8
local UICorner69 = Instance.new("UICorner")
UICorner69.CornerRadius = UDim.new(0, 5)
UICorner69.Parent = TextButton29
local ImageLabel15 = Instance.new("ImageLabel")
ImageLabel15.Size = UDim2.new(0, 20, 0, 20)
ImageLabel15.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel15.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel15.BackgroundTransparency = 1
ImageLabel15.ScaleType = Enum.ScaleType.Fit
ImageLabel15.Image = "rbxassetid://11770691141"
ImageLabel15.ZIndex = 63
ImageLabel15.Parent = TextButton29
local TextLabel54 = Instance.new("TextLabel")
TextLabel54.Size = UDim2.new(1, -32, 1, 0)
TextLabel54.Position = UDim2.new(0, 30, 0, 0)
TextLabel54.BackgroundTransparency = 1
TextLabel54.Text = "Red Dot"
TextLabel54.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel54.TextSize = 11
TextLabel54.Font = Enum.Font.ArialBold
TextLabel54.TextXAlignment = Enum.TextXAlignment.Left
TextLabel54.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel54.ZIndex = 63
TextLabel54.Parent = TextButton29

TextButton29.MouseEnter:Connect(function()
	TextButton29.BackgroundTransparency = 0.4
	TextLabel54.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton29.MouseLeave:Connect(function()
	TextButton29.BackgroundTransparency = 0.65
	TextLabel54.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton29.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://11770691141"
	ImageLabel46.Image = "rbxassetid://11770691141"
	setupV2(v6)
	_G.RuzSavedDecals = nil
	local PlayerGui6 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants5 = PlayerGui6:GetDescendants()

	for i7, v7 in ipairs(descendants5) do
		local result7 = v7.Name:lower()
		result7:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v7, "rbxassetid://11770691141")
	_G.RuzSavedDecals = { { obj = v7, origImage = v7.Image, origSize = v7.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel304 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel304.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton29.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton29.BackgroundTransparency = 0.3
	TextLabel54.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton30 = Instance.new("TextButton")
TextButton30.Size = UDim2.new(1, 0, 0, 28)
TextButton30.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton30.BackgroundTransparency = 0.65
TextButton30.BorderSizePixel = 0
TextButton30.Text = ""
TextButton30.ZIndex = 62
TextButton30.LayoutOrder = 4
TextButton30.Parent = ScrollingFrame8
local UICorner70 = Instance.new("UICorner")
UICorner70.CornerRadius = UDim.new(0, 5)
UICorner70.Parent = TextButton30
local ImageLabel16 = Instance.new("ImageLabel")
ImageLabel16.Size = UDim2.new(0, 20, 0, 20)
ImageLabel16.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel16.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel16.BackgroundTransparency = 1
ImageLabel16.ScaleType = Enum.ScaleType.Fit
ImageLabel16.Image = "rbxassetid://10891594349"
ImageLabel16.ZIndex = 63
ImageLabel16.Parent = TextButton30
local TextLabel55 = Instance.new("TextLabel")
TextLabel55.Size = UDim2.new(1, -32, 1, 0)
TextLabel55.Position = UDim2.new(0, 30, 0, 0)
TextLabel55.BackgroundTransparency = 1
TextLabel55.Text = "Blue Dot"
TextLabel55.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel55.TextSize = 11
TextLabel55.Font = Enum.Font.ArialBold
TextLabel55.TextXAlignment = Enum.TextXAlignment.Left
TextLabel55.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel55.ZIndex = 63
TextLabel55.Parent = TextButton30

TextButton30.MouseEnter:Connect(function()
	TextButton30.BackgroundTransparency = 0.4
	TextLabel55.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton30.MouseLeave:Connect(function()
	TextButton30.BackgroundTransparency = 0.65
	TextLabel55.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton30.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://10891594349"
	ImageLabel46.Image = "rbxassetid://10891594349"
	setupV2(v7)
	_G.RuzSavedDecals = nil
	local PlayerGui7 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants6 = PlayerGui7:GetDescendants()

	for i8, v8 in ipairs(descendants6) do
		local result8 = v8.Name:lower()
		result8:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v8, "rbxassetid://10891594349")
	_G.RuzSavedDecals = { { obj = v8, origImage = v8.Image, origSize = v8.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel325 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel325.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton30.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton30.BackgroundTransparency = 0.3
	TextLabel55.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton31 = Instance.new("TextButton")
TextButton31.Size = UDim2.new(1, 0, 0, 28)
TextButton31.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton31.BackgroundTransparency = 0.65
TextButton31.BorderSizePixel = 0
TextButton31.Text = ""
TextButton31.ZIndex = 62
TextButton31.LayoutOrder = 5
TextButton31.Parent = ScrollingFrame8
local UICorner71 = Instance.new("UICorner")
UICorner71.CornerRadius = UDim.new(0, 5)
UICorner71.Parent = TextButton31
local ImageLabel17 = Instance.new("ImageLabel")
ImageLabel17.Size = UDim2.new(0, 20, 0, 20)
ImageLabel17.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel17.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel17.BackgroundTransparency = 1
ImageLabel17.ScaleType = Enum.ScaleType.Fit
ImageLabel17.Image = "rbxassetid://11720475063"
ImageLabel17.ZIndex = 63
ImageLabel17.Parent = TextButton31
local TextLabel56 = Instance.new("TextLabel")
TextLabel56.Size = UDim2.new(1, -32, 1, 0)
TextLabel56.Position = UDim2.new(0, 30, 0, 0)
TextLabel56.BackgroundTransparency = 1
TextLabel56.Text = "Sanrio Crosshair"
TextLabel56.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel56.TextSize = 11
TextLabel56.Font = Enum.Font.ArialBold
TextLabel56.TextXAlignment = Enum.TextXAlignment.Left
TextLabel56.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel56.ZIndex = 63
TextLabel56.Parent = TextButton31

TextButton31.MouseEnter:Connect(function()
	TextButton31.BackgroundTransparency = 0.4
	TextLabel56.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton31.MouseLeave:Connect(function()
	TextButton31.BackgroundTransparency = 0.65
	TextLabel56.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton31.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://11720475063"
	ImageLabel46.Image = "rbxassetid://11720475063"
	setupV2(v8)
	_G.RuzSavedDecals = nil
	local PlayerGui8 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants7 = PlayerGui8:GetDescendants()

	for i9, v9 in ipairs(descendants7) do
		local result9 = v9.Name:lower()
		result9:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v9, "rbxassetid://11720475063")
	_G.RuzSavedDecals = { { obj = v9, origImage = v9.Image, origSize = v9.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel346 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel346.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton31.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton31.BackgroundTransparency = 0.3
	TextLabel56.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton32 = Instance.new("TextButton")
TextButton32.Size = UDim2.new(1, 0, 0, 28)
TextButton32.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton32.BackgroundTransparency = 0.65
TextButton32.BorderSizePixel = 0
TextButton32.Text = ""
TextButton32.ZIndex = 62
TextButton32.LayoutOrder = 6
TextButton32.Parent = ScrollingFrame8
local UICorner72 = Instance.new("UICorner")
UICorner72.CornerRadius = UDim.new(0, 5)
UICorner72.Parent = TextButton32
local ImageLabel18 = Instance.new("ImageLabel")
ImageLabel18.Size = UDim2.new(0, 20, 0, 20)
ImageLabel18.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel18.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel18.BackgroundTransparency = 1
ImageLabel18.ScaleType = Enum.ScaleType.Fit
ImageLabel18.Image = "rbxassetid://104359094015436"
ImageLabel18.ZIndex = 63
ImageLabel18.Parent = TextButton32
local TextLabel57 = Instance.new("TextLabel")
TextLabel57.Size = UDim2.new(1, -32, 1, 0)
TextLabel57.Position = UDim2.new(0, 30, 0, 0)
TextLabel57.BackgroundTransparency = 1
TextLabel57.Text = "Triple T"
TextLabel57.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel57.TextSize = 11
TextLabel57.Font = Enum.Font.ArialBold
TextLabel57.TextXAlignment = Enum.TextXAlignment.Left
TextLabel57.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel57.ZIndex = 63
TextLabel57.Parent = TextButton32

TextButton32.MouseEnter:Connect(function()
	TextButton32.BackgroundTransparency = 0.4
	TextLabel57.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton32.MouseLeave:Connect(function()
	TextButton32.BackgroundTransparency = 0.65
	TextLabel57.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton32.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://104359094015436"
	ImageLabel46.Image = "rbxassetid://104359094015436"
	setupV2(v9)
	_G.RuzSavedDecals = nil
	local PlayerGui9 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants8 = PlayerGui9:GetDescendants()

	for i10, v10 in ipairs(descendants8) do
		local result10 = v10.Name:lower()
		result10:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v10, "rbxassetid://104359094015436")
	_G.RuzSavedDecals = { { obj = v10, origImage = v10.Image, origSize = v10.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel367 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel367.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton32.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton32.BackgroundTransparency = 0.3
	TextLabel57.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton33 = Instance.new("TextButton")
TextButton33.Size = UDim2.new(1, 0, 0, 28)
TextButton33.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton33.BackgroundTransparency = 0.65
TextButton33.BorderSizePixel = 0
TextButton33.Text = ""
TextButton33.ZIndex = 62
TextButton33.LayoutOrder = 7
TextButton33.Parent = ScrollingFrame8
local UICorner73 = Instance.new("UICorner")
UICorner73.CornerRadius = UDim.new(0, 5)
UICorner73.Parent = TextButton33
local ImageLabel19 = Instance.new("ImageLabel")
ImageLabel19.Size = UDim2.new(0, 20, 0, 20)
ImageLabel19.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel19.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel19.BackgroundTransparency = 1
ImageLabel19.ScaleType = Enum.ScaleType.Fit
ImageLabel19.Image = "rbxassetid://98322941706613"
ImageLabel19.ZIndex = 63
ImageLabel19.Parent = TextButton33
local TextLabel58 = Instance.new("TextLabel")
TextLabel58.Size = UDim2.new(1, -32, 1, 0)
TextLabel58.Position = UDim2.new(0, 30, 0, 0)
TextLabel58.BackgroundTransparency = 1
TextLabel58.Text = "Hollow Circle"
TextLabel58.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel58.TextSize = 11
TextLabel58.Font = Enum.Font.ArialBold
TextLabel58.TextXAlignment = Enum.TextXAlignment.Left
TextLabel58.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel58.ZIndex = 63
TextLabel58.Parent = TextButton33

TextButton33.MouseEnter:Connect(function()
	TextButton33.BackgroundTransparency = 0.4
	TextLabel58.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton33.MouseLeave:Connect(function()
	TextButton33.BackgroundTransparency = 0.65
	TextLabel58.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton33.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://98322941706613"
	ImageLabel46.Image = "rbxassetid://98322941706613"
	setupV2(v10)
	_G.RuzSavedDecals = nil
	local PlayerGui10 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants9 = PlayerGui10:GetDescendants()

	for i11, v11 in ipairs(descendants9) do
		local result11 = v11.Name:lower()
		result11:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v11, "rbxassetid://98322941706613")
	_G.RuzSavedDecals = { { obj = v11, origImage = v11.Image, origSize = v11.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel388 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel388.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton33.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton33.BackgroundTransparency = 0.3
	TextLabel58.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton34 = Instance.new("TextButton")
TextButton34.Size = UDim2.new(1, 0, 0, 28)
TextButton34.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton34.BackgroundTransparency = 0.65
TextButton34.BorderSizePixel = 0
TextButton34.Text = ""
TextButton34.ZIndex = 62
TextButton34.LayoutOrder = 8
TextButton34.Parent = ScrollingFrame8
local UICorner74 = Instance.new("UICorner")
UICorner74.CornerRadius = UDim.new(0, 5)
UICorner74.Parent = TextButton34
local ImageLabel20 = Instance.new("ImageLabel")
ImageLabel20.Size = UDim2.new(0, 20, 0, 20)
ImageLabel20.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel20.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel20.BackgroundTransparency = 1
ImageLabel20.ScaleType = Enum.ScaleType.Fit
ImageLabel20.Image = "rbxassetid://128878142732909"
ImageLabel20.ZIndex = 63
ImageLabel20.Parent = TextButton34
local TextLabel59 = Instance.new("TextLabel")
TextLabel59.Size = UDim2.new(1, -32, 1, 0)
TextLabel59.Position = UDim2.new(0, 30, 0, 0)
TextLabel59.BackgroundTransparency = 1
TextLabel59.Text = "Angel Triple T"
TextLabel59.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel59.TextSize = 11
TextLabel59.Font = Enum.Font.ArialBold
TextLabel59.TextXAlignment = Enum.TextXAlignment.Left
TextLabel59.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel59.ZIndex = 63
TextLabel59.Parent = TextButton34

TextButton34.MouseEnter:Connect(function()
	TextButton34.BackgroundTransparency = 0.4
	TextLabel59.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton34.MouseLeave:Connect(function()
	TextButton34.BackgroundTransparency = 0.65
	TextLabel59.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton34.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://128878142732909"
	ImageLabel46.Image = "rbxassetid://128878142732909"
	setupV2(v11)
	_G.RuzSavedDecals = nil
	local PlayerGui11 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants10 = PlayerGui11:GetDescendants()

	for i12, v12 in ipairs(descendants10) do
		local result12 = v12.Name:lower()
		result12:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v12, "rbxassetid://128878142732909")
	_G.RuzSavedDecals = { { obj = v12, origImage = v12.Image, origSize = v12.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel409 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel409.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton34.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton34.BackgroundTransparency = 0.3
	TextLabel59.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton35 = Instance.new("TextButton")
TextButton35.Size = UDim2.new(1, 0, 0, 28)
TextButton35.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton35.BackgroundTransparency = 0.65
TextButton35.BorderSizePixel = 0
TextButton35.Text = ""
TextButton35.ZIndex = 62
TextButton35.LayoutOrder = 9
TextButton35.Parent = ScrollingFrame8
local UICorner75 = Instance.new("UICorner")
UICorner75.CornerRadius = UDim.new(0, 5)
UICorner75.Parent = TextButton35
local ImageLabel21 = Instance.new("ImageLabel")
ImageLabel21.Size = UDim2.new(0, 20, 0, 20)
ImageLabel21.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel21.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel21.BackgroundTransparency = 1
ImageLabel21.ScaleType = Enum.ScaleType.Fit
ImageLabel21.Image = "rbxassetid://11770890197"
ImageLabel21.ZIndex = 63
ImageLabel21.Parent = TextButton35
local TextLabel60 = Instance.new("TextLabel")
TextLabel60.Size = UDim2.new(1, -32, 1, 0)
TextLabel60.Position = UDim2.new(0, 30, 0, 0)
TextLabel60.BackgroundTransparency = 1
TextLabel60.Text = "Naruto Thingy 2"
TextLabel60.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel60.TextSize = 11
TextLabel60.Font = Enum.Font.ArialBold
TextLabel60.TextXAlignment = Enum.TextXAlignment.Left
TextLabel60.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel60.ZIndex = 63
TextLabel60.Parent = TextButton35

TextButton35.MouseEnter:Connect(function()
	TextButton35.BackgroundTransparency = 0.4
	TextLabel60.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton35.MouseLeave:Connect(function()
	TextButton35.BackgroundTransparency = 0.65
	TextLabel60.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton35.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://11770890197"
	ImageLabel46.Image = "rbxassetid://11770890197"
	setupV2(v12)
	_G.RuzSavedDecals = nil
	local PlayerGui12 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants11 = PlayerGui12:GetDescendants()

	for i13, v13 in ipairs(descendants11) do
		local result13 = v13.Name:lower()
		result13:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v13, "rbxassetid://11770890197")
	_G.RuzSavedDecals = { { obj = v13, origImage = v13.Image, origSize = v13.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel430 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel430.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton35.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton35.BackgroundTransparency = 0.3
	TextLabel60.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton36 = Instance.new("TextButton")
TextButton36.Size = UDim2.new(1, 0, 0, 28)
TextButton36.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton36.BackgroundTransparency = 0.65
TextButton36.BorderSizePixel = 0
TextButton36.Text = ""
TextButton36.ZIndex = 62
TextButton36.LayoutOrder = 10
TextButton36.Parent = ScrollingFrame8
local UICorner76 = Instance.new("UICorner")
UICorner76.CornerRadius = UDim.new(0, 5)
UICorner76.Parent = TextButton36
local ImageLabel22 = Instance.new("ImageLabel")
ImageLabel22.Size = UDim2.new(0, 20, 0, 20)
ImageLabel22.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel22.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel22.BackgroundTransparency = 1
ImageLabel22.ScaleType = Enum.ScaleType.Fit
ImageLabel22.Image = "rbxassetid://11767039725"
ImageLabel22.ZIndex = 63
ImageLabel22.Parent = TextButton36
local TextLabel61 = Instance.new("TextLabel")
TextLabel61.Size = UDim2.new(1, -32, 1, 0)
TextLabel61.Position = UDim2.new(0, 30, 0, 0)
TextLabel61.BackgroundTransparency = 1
TextLabel61.Text = "Heart Pink Glow"
TextLabel61.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel61.TextSize = 11
TextLabel61.Font = Enum.Font.ArialBold
TextLabel61.TextXAlignment = Enum.TextXAlignment.Left
TextLabel61.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel61.ZIndex = 63
TextLabel61.Parent = TextButton36

TextButton36.MouseEnter:Connect(function()
	TextButton36.BackgroundTransparency = 0.4
	TextLabel61.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton36.MouseLeave:Connect(function()
	TextButton36.BackgroundTransparency = 0.65
	TextLabel61.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton36.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://11767039725"
	ImageLabel46.Image = "rbxassetid://11767039725"
	setupV2(v13)
	_G.RuzSavedDecals = nil
	local PlayerGui13 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants12 = PlayerGui13:GetDescendants()

	for i14, v14 in ipairs(descendants12) do
		local result14 = v14.Name:lower()
		result14:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v14, "rbxassetid://11767039725")
	_G.RuzSavedDecals = { { obj = v14, origImage = v14.Image, origSize = v14.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel451 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel451.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton36.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton36.BackgroundTransparency = 0.3
	TextLabel61.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton37 = Instance.new("TextButton")
TextButton37.Size = UDim2.new(1, 0, 0, 28)
TextButton37.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton37.BackgroundTransparency = 0.65
TextButton37.BorderSizePixel = 0
TextButton37.Text = ""
TextButton37.ZIndex = 62
TextButton37.LayoutOrder = 11
TextButton37.Parent = ScrollingFrame8
local UICorner77 = Instance.new("UICorner")
UICorner77.CornerRadius = UDim.new(0, 5)
UICorner77.Parent = TextButton37
local ImageLabel23 = Instance.new("ImageLabel")
ImageLabel23.Size = UDim2.new(0, 20, 0, 20)
ImageLabel23.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel23.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel23.BackgroundTransparency = 1
ImageLabel23.ScaleType = Enum.ScaleType.Fit
ImageLabel23.Image = "rbxassetid://17200988910"
ImageLabel23.ZIndex = 63
ImageLabel23.Parent = TextButton37
local TextLabel62 = Instance.new("TextLabel")
TextLabel62.Size = UDim2.new(1, -32, 1, 0)
TextLabel62.Position = UDim2.new(0, 30, 0, 0)
TextLabel62.BackgroundTransparency = 1
TextLabel62.Text = "White Crosshair"
TextLabel62.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel62.TextSize = 11
TextLabel62.Font = Enum.Font.ArialBold
TextLabel62.TextXAlignment = Enum.TextXAlignment.Left
TextLabel62.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel62.ZIndex = 63
TextLabel62.Parent = TextButton37

TextButton37.MouseEnter:Connect(function()
	TextButton37.BackgroundTransparency = 0.4
	TextLabel62.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton37.MouseLeave:Connect(function()
	TextButton37.BackgroundTransparency = 0.65
	TextLabel62.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton37.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://17200988910"
	ImageLabel46.Image = "rbxassetid://17200988910"
	setupV2(v14)
	_G.RuzSavedDecals = nil
	local PlayerGui14 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants13 = PlayerGui14:GetDescendants()

	for i15, v15 in ipairs(descendants13) do
		local result15 = v15.Name:lower()
		result15:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v15, "rbxassetid://17200988910")
	_G.RuzSavedDecals = { { obj = v15, origImage = v15.Image, origSize = v15.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel472 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel472.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton37.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton37.BackgroundTransparency = 0.3
	TextLabel62.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton38 = Instance.new("TextButton")
TextButton38.Size = UDim2.new(1, 0, 0, 28)
TextButton38.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton38.BackgroundTransparency = 0.65
TextButton38.BorderSizePixel = 0
TextButton38.Text = ""
TextButton38.ZIndex = 62
TextButton38.LayoutOrder = 12
TextButton38.Parent = ScrollingFrame8
local UICorner78 = Instance.new("UICorner")
UICorner78.CornerRadius = UDim.new(0, 5)
UICorner78.Parent = TextButton38
local ImageLabel24 = Instance.new("ImageLabel")
ImageLabel24.Size = UDim2.new(0, 20, 0, 20)
ImageLabel24.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel24.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel24.BackgroundTransparency = 1
ImageLabel24.ScaleType = Enum.ScaleType.Fit
ImageLabel24.Image = "rbxassetid://12902947168"
ImageLabel24.ZIndex = 63
ImageLabel24.Parent = TextButton38
local TextLabel63 = Instance.new("TextLabel")
TextLabel63.Size = UDim2.new(1, -32, 1, 0)
TextLabel63.Position = UDim2.new(0, 30, 0, 0)
TextLabel63.BackgroundTransparency = 1
TextLabel63.Text = "White Wings"
TextLabel63.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel63.TextSize = 11
TextLabel63.Font = Enum.Font.ArialBold
TextLabel63.TextXAlignment = Enum.TextXAlignment.Left
TextLabel63.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel63.ZIndex = 63
TextLabel63.Parent = TextButton38

TextButton38.MouseEnter:Connect(function()
	TextButton38.BackgroundTransparency = 0.4
	TextLabel63.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton38.MouseLeave:Connect(function()
	TextButton38.BackgroundTransparency = 0.65
	TextLabel63.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton38.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://12902947168"
	ImageLabel46.Image = "rbxassetid://12902947168"
	setupV2(v15)
	_G.RuzSavedDecals = nil
	local PlayerGui15 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants14 = PlayerGui15:GetDescendants()

	for i16, v16 in ipairs(descendants14) do
		local result16 = v16.Name:lower()
		result16:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v16, "rbxassetid://12902947168")
	_G.RuzSavedDecals = { { obj = v16, origImage = v16.Image, origSize = v16.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel493 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel493.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton38.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton38.BackgroundTransparency = 0.3
	TextLabel63.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton39 = Instance.new("TextButton")
TextButton39.Size = UDim2.new(1, 0, 0, 28)
TextButton39.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton39.BackgroundTransparency = 0.65
TextButton39.BorderSizePixel = 0
TextButton39.Text = ""
TextButton39.ZIndex = 62
TextButton39.LayoutOrder = 13
TextButton39.Parent = ScrollingFrame8
local UICorner79 = Instance.new("UICorner")
UICorner79.CornerRadius = UDim.new(0, 5)
UICorner79.Parent = TextButton39
local ImageLabel25 = Instance.new("ImageLabel")
ImageLabel25.Size = UDim2.new(0, 20, 0, 20)
ImageLabel25.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel25.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel25.BackgroundTransparency = 1
ImageLabel25.ScaleType = Enum.ScaleType.Fit
ImageLabel25.Image = "rbxassetid://9214055123"
ImageLabel25.ZIndex = 63
ImageLabel25.Parent = TextButton39
local TextLabel64 = Instance.new("TextLabel")
TextLabel64.Size = UDim2.new(1, -32, 1, 0)
TextLabel64.Position = UDim2.new(0, 30, 0, 0)
TextLabel64.BackgroundTransparency = 1
TextLabel64.Text = "Purple Crosshair"
TextLabel64.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel64.TextSize = 11
TextLabel64.Font = Enum.Font.ArialBold
TextLabel64.TextXAlignment = Enum.TextXAlignment.Left
TextLabel64.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel64.ZIndex = 63
TextLabel64.Parent = TextButton39

TextButton39.MouseEnter:Connect(function()
	TextButton39.BackgroundTransparency = 0.4
	TextLabel64.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton39.MouseLeave:Connect(function()
	TextButton39.BackgroundTransparency = 0.65
	TextLabel64.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton39.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://9214055123"
	ImageLabel46.Image = "rbxassetid://9214055123"
	setupV2(v16)
	_G.RuzSavedDecals = nil
	local PlayerGui16 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants15 = PlayerGui16:GetDescendants()

	for i17, v17 in ipairs(descendants15) do
		local result17 = v17.Name:lower()
		result17:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v17, "rbxassetid://9214055123")
	_G.RuzSavedDecals = { { obj = v17, origImage = v17.Image, origSize = v17.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel514 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel514.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton39.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton39.BackgroundTransparency = 0.3
	TextLabel64.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton40 = Instance.new("TextButton")
TextButton40.Size = UDim2.new(1, 0, 0, 28)
TextButton40.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton40.BackgroundTransparency = 0.65
TextButton40.BorderSizePixel = 0
TextButton40.Text = ""
TextButton40.ZIndex = 62
TextButton40.LayoutOrder = 14
TextButton40.Parent = ScrollingFrame8
local UICorner80 = Instance.new("UICorner")
UICorner80.CornerRadius = UDim.new(0, 5)
UICorner80.Parent = TextButton40
local ImageLabel26 = Instance.new("ImageLabel")
ImageLabel26.Size = UDim2.new(0, 20, 0, 20)
ImageLabel26.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel26.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel26.BackgroundTransparency = 1
ImageLabel26.ScaleType = Enum.ScaleType.Fit
ImageLabel26.Image = "rbxassetid://13318660422"
ImageLabel26.ZIndex = 63
ImageLabel26.Parent = TextButton40
local TextLabel65 = Instance.new("TextLabel")
TextLabel65.Size = UDim2.new(1, -32, 1, 0)
TextLabel65.Position = UDim2.new(0, 30, 0, 0)
TextLabel65.BackgroundTransparency = 1
TextLabel65.Text = "Purple Crosshair 2"
TextLabel65.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel65.TextSize = 11
TextLabel65.Font = Enum.Font.ArialBold
TextLabel65.TextXAlignment = Enum.TextXAlignment.Left
TextLabel65.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel65.ZIndex = 63
TextLabel65.Parent = TextButton40

TextButton40.MouseEnter:Connect(function()
	TextButton40.BackgroundTransparency = 0.4
	TextLabel65.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton40.MouseLeave:Connect(function()
	TextButton40.BackgroundTransparency = 0.65
	TextLabel65.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton40.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://13318660422"
	ImageLabel46.Image = "rbxassetid://13318660422"
	setupV2(v17)
	_G.RuzSavedDecals = nil
	local PlayerGui17 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants16 = PlayerGui17:GetDescendants()

	for i18, v18 in ipairs(descendants16) do
		local result18 = v18.Name:lower()
		result18:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v18, "rbxassetid://13318660422")
	_G.RuzSavedDecals = { { obj = v18, origImage = v18.Image, origSize = v18.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel535 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel535.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton40.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton40.BackgroundTransparency = 0.3
	TextLabel65.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton41 = Instance.new("TextButton")
TextButton41.Size = UDim2.new(1, 0, 0, 28)
TextButton41.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton41.BackgroundTransparency = 0.65
TextButton41.BorderSizePixel = 0
TextButton41.Text = ""
TextButton41.ZIndex = 62
TextButton41.LayoutOrder = 15
TextButton41.Parent = ScrollingFrame8
local UICorner81 = Instance.new("UICorner")
UICorner81.CornerRadius = UDim.new(0, 5)
UICorner81.Parent = TextButton41
local ImageLabel27 = Instance.new("ImageLabel")
ImageLabel27.Size = UDim2.new(0, 20, 0, 20)
ImageLabel27.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel27.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel27.BackgroundTransparency = 1
ImageLabel27.ScaleType = Enum.ScaleType.Fit
ImageLabel27.Image = "rbxassetid://13318885193"
ImageLabel27.ZIndex = 63
ImageLabel27.Parent = TextButton41
local TextLabel66 = Instance.new("TextLabel")
TextLabel66.Size = UDim2.new(1, -32, 1, 0)
TextLabel66.Position = UDim2.new(0, 30, 0, 0)
TextLabel66.BackgroundTransparency = 1
TextLabel66.Text = "Heart Crosshair 2"
TextLabel66.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel66.TextSize = 11
TextLabel66.Font = Enum.Font.ArialBold
TextLabel66.TextXAlignment = Enum.TextXAlignment.Left
TextLabel66.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel66.ZIndex = 63
TextLabel66.Parent = TextButton41

TextButton41.MouseEnter:Connect(function()
	TextButton41.BackgroundTransparency = 0.4
	TextLabel66.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton41.MouseLeave:Connect(function()
	TextButton41.BackgroundTransparency = 0.65
	TextLabel66.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton41.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://13318885193"
	ImageLabel46.Image = "rbxassetid://13318885193"
	setupV2(v18)
	_G.RuzSavedDecals = nil
	local PlayerGui18 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants17 = PlayerGui18:GetDescendants()

	for i19, v19 in ipairs(descendants17) do
		local result19 = v19.Name:lower()
		result19:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v19, "rbxassetid://13318885193")
	_G.RuzSavedDecals = { { obj = v19, origImage = v19.Image, origSize = v19.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel556 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel556.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton41.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton41.BackgroundTransparency = 0.3
	TextLabel66.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton42 = Instance.new("TextButton")
TextButton42.Size = UDim2.new(1, 0, 0, 28)
TextButton42.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton42.BackgroundTransparency = 0.65
TextButton42.BorderSizePixel = 0
TextButton42.Text = ""
TextButton42.ZIndex = 62
TextButton42.LayoutOrder = 16
TextButton42.Parent = ScrollingFrame8
local UICorner82 = Instance.new("UICorner")
UICorner82.CornerRadius = UDim.new(0, 5)
UICorner82.Parent = TextButton42
local ImageLabel28 = Instance.new("ImageLabel")
ImageLabel28.Size = UDim2.new(0, 20, 0, 20)
ImageLabel28.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel28.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel28.BackgroundTransparency = 1
ImageLabel28.ScaleType = Enum.ScaleType.Fit
ImageLabel28.Image = "rbxassetid://101366086866631"
ImageLabel28.ZIndex = 63
ImageLabel28.Parent = TextButton42
local TextLabel67 = Instance.new("TextLabel")
TextLabel67.Size = UDim2.new(1, -32, 1, 0)
TextLabel67.Position = UDim2.new(0, 30, 0, 0)
TextLabel67.BackgroundTransparency = 1
TextLabel67.Text = "Purple Dabi"
TextLabel67.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel67.TextSize = 11
TextLabel67.Font = Enum.Font.ArialBold
TextLabel67.TextXAlignment = Enum.TextXAlignment.Left
TextLabel67.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel67.ZIndex = 63
TextLabel67.Parent = TextButton42

TextButton42.MouseEnter:Connect(function()
	TextButton42.BackgroundTransparency = 0.4
	TextLabel67.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton42.MouseLeave:Connect(function()
	TextButton42.BackgroundTransparency = 0.65
	TextLabel67.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton42.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://101366086866631"
	ImageLabel46.Image = "rbxassetid://101366086866631"
	setupV2(v19)
	_G.RuzSavedDecals = nil
	local PlayerGui19 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants18 = PlayerGui19:GetDescendants()

	for i20, v20 in ipairs(descendants18) do
		local result20 = v20.Name:lower()
		result20:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v20, "rbxassetid://101366086866631")
	_G.RuzSavedDecals = { { obj = v20, origImage = v20.Image, origSize = v20.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel577 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel577.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton42.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton42.BackgroundTransparency = 0.3
	TextLabel67.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton43 = Instance.new("TextButton")
TextButton43.Size = UDim2.new(1, 0, 0, 28)
TextButton43.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton43.BackgroundTransparency = 0.65
TextButton43.BorderSizePixel = 0
TextButton43.Text = ""
TextButton43.ZIndex = 62
TextButton43.LayoutOrder = 17
TextButton43.Parent = ScrollingFrame8
local UICorner83 = Instance.new("UICorner")
UICorner83.CornerRadius = UDim.new(0, 5)
UICorner83.Parent = TextButton43
local ImageLabel29 = Instance.new("ImageLabel")
ImageLabel29.Size = UDim2.new(0, 20, 0, 20)
ImageLabel29.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel29.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel29.BackgroundTransparency = 1
ImageLabel29.ScaleType = Enum.ScaleType.Fit
ImageLabel29.Image = "rbxassetid://83387422212665"
ImageLabel29.ZIndex = 63
ImageLabel29.Parent = TextButton43
local TextLabel68 = Instance.new("TextLabel")
TextLabel68.Size = UDim2.new(1, -32, 1, 0)
TextLabel68.Position = UDim2.new(0, 30, 0, 0)
TextLabel68.BackgroundTransparency = 1
TextLabel68.Text = "Arrow Crosshair"
TextLabel68.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel68.TextSize = 11
TextLabel68.Font = Enum.Font.ArialBold
TextLabel68.TextXAlignment = Enum.TextXAlignment.Left
TextLabel68.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel68.ZIndex = 63
TextLabel68.Parent = TextButton43

TextButton43.MouseEnter:Connect(function()
	TextButton43.BackgroundTransparency = 0.4
	TextLabel68.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton43.MouseLeave:Connect(function()
	TextButton43.BackgroundTransparency = 0.65
	TextLabel68.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton43.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://83387422212665"
	ImageLabel46.Image = "rbxassetid://83387422212665"
	setupV2(v20)
	_G.RuzSavedDecals = nil
	local PlayerGui20 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants19 = PlayerGui20:GetDescendants()

	for i21, v21 in ipairs(descendants19) do
		local result21 = v21.Name:lower()
		result21:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v21, "rbxassetid://83387422212665")
	_G.RuzSavedDecals = { { obj = v21, origImage = v21.Image, origSize = v21.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel598 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel598.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton43.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton43.BackgroundTransparency = 0.3
	TextLabel68.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton44 = Instance.new("TextButton")
TextButton44.Size = UDim2.new(1, 0, 0, 28)
TextButton44.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton44.BackgroundTransparency = 0.65
TextButton44.BorderSizePixel = 0
TextButton44.Text = ""
TextButton44.ZIndex = 62
TextButton44.LayoutOrder = 18
TextButton44.Parent = ScrollingFrame8
local UICorner84 = Instance.new("UICorner")
UICorner84.CornerRadius = UDim.new(0, 5)
UICorner84.Parent = TextButton44
local ImageLabel30 = Instance.new("ImageLabel")
ImageLabel30.Size = UDim2.new(0, 20, 0, 20)
ImageLabel30.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel30.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel30.BackgroundTransparency = 1
ImageLabel30.ScaleType = Enum.ScaleType.Fit
ImageLabel30.Image = "rbxassetid://76324162026923"
ImageLabel30.ZIndex = 63
ImageLabel30.Parent = TextButton44
local TextLabel69 = Instance.new("TextLabel")
TextLabel69.Size = UDim2.new(1, -32, 1, 0)
TextLabel69.Position = UDim2.new(0, 30, 0, 0)
TextLabel69.BackgroundTransparency = 1
TextLabel69.Text = "Arrows 2"
TextLabel69.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel69.TextSize = 11
TextLabel69.Font = Enum.Font.ArialBold
TextLabel69.TextXAlignment = Enum.TextXAlignment.Left
TextLabel69.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel69.ZIndex = 63
TextLabel69.Parent = TextButton44

TextButton44.MouseEnter:Connect(function()
	TextButton44.BackgroundTransparency = 0.4
	TextLabel69.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton44.MouseLeave:Connect(function()
	TextButton44.BackgroundTransparency = 0.65
	TextLabel69.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton44.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://76324162026923"
	ImageLabel46.Image = "rbxassetid://76324162026923"
	setupV2(v21)
	_G.RuzSavedDecals = nil
	local PlayerGui21 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants20 = PlayerGui21:GetDescendants()

	for i22, v22 in ipairs(descendants20) do
		local result22 = v22.Name:lower()
		result22:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v22, "rbxassetid://76324162026923")
	_G.RuzSavedDecals = { { obj = v22, origImage = v22.Image, origSize = v22.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel619 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel619.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton44.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton44.BackgroundTransparency = 0.3
	TextLabel69.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton45 = Instance.new("TextButton")
TextButton45.Size = UDim2.new(1, 0, 0, 28)
TextButton45.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton45.BackgroundTransparency = 0.65
TextButton45.BorderSizePixel = 0
TextButton45.Text = ""
TextButton45.ZIndex = 62
TextButton45.LayoutOrder = 19
TextButton45.Parent = ScrollingFrame8
local UICorner85 = Instance.new("UICorner")
UICorner85.CornerRadius = UDim.new(0, 5)
UICorner85.Parent = TextButton45
local ImageLabel31 = Instance.new("ImageLabel")
ImageLabel31.Size = UDim2.new(0, 20, 0, 20)
ImageLabel31.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel31.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel31.BackgroundTransparency = 1
ImageLabel31.ScaleType = Enum.ScaleType.Fit
ImageLabel31.Image = "rbxassetid://10878218308"
ImageLabel31.ZIndex = 63
ImageLabel31.Parent = TextButton45
local TextLabel70 = Instance.new("TextLabel")
TextLabel70.Size = UDim2.new(1, -32, 1, 0)
TextLabel70.Position = UDim2.new(0, 30, 0, 0)
TextLabel70.BackgroundTransparency = 1
TextLabel70.Text = "Pixel Heart"
TextLabel70.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel70.TextSize = 11
TextLabel70.Font = Enum.Font.ArialBold
TextLabel70.TextXAlignment = Enum.TextXAlignment.Left
TextLabel70.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel70.ZIndex = 63
TextLabel70.Parent = TextButton45

TextButton45.MouseEnter:Connect(function()
	TextButton45.BackgroundTransparency = 0.4
	TextLabel70.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton45.MouseLeave:Connect(function()
	TextButton45.BackgroundTransparency = 0.65
	TextLabel70.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton45.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://10878218308"
	ImageLabel46.Image = "rbxassetid://10878218308"
	setupV2(v22)
	_G.RuzSavedDecals = nil
	local PlayerGui22 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants21 = PlayerGui22:GetDescendants()

	for i23, v23 in ipairs(descendants21) do
		local result23 = v23.Name:lower()
		result23:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v23, "rbxassetid://10878218308")
	_G.RuzSavedDecals = { { obj = v23, origImage = v23.Image, origSize = v23.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel640 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel640.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton45.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton45.BackgroundTransparency = 0.3
	TextLabel70.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton46 = Instance.new("TextButton")
TextButton46.Size = UDim2.new(1, 0, 0, 28)
TextButton46.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton46.BackgroundTransparency = 0.65
TextButton46.BorderSizePixel = 0
TextButton46.Text = ""
TextButton46.ZIndex = 62
TextButton46.LayoutOrder = 20
TextButton46.Parent = ScrollingFrame8
local UICorner86 = Instance.new("UICorner")
UICorner86.CornerRadius = UDim.new(0, 5)
UICorner86.Parent = TextButton46
local ImageLabel32 = Instance.new("ImageLabel")
ImageLabel32.Size = UDim2.new(0, 20, 0, 20)
ImageLabel32.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel32.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel32.BackgroundTransparency = 1
ImageLabel32.ScaleType = Enum.ScaleType.Fit
ImageLabel32.Image = "rbxassetid://10831379335"
ImageLabel32.ZIndex = 63
ImageLabel32.Parent = TextButton46
local TextLabel71 = Instance.new("TextLabel")
TextLabel71.Size = UDim2.new(1, -32, 1, 0)
TextLabel71.Position = UDim2.new(0, 30, 0, 0)
TextLabel71.BackgroundTransparency = 1
TextLabel71.Text = "White Cross IDK"
TextLabel71.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel71.TextSize = 11
TextLabel71.Font = Enum.Font.ArialBold
TextLabel71.TextXAlignment = Enum.TextXAlignment.Left
TextLabel71.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel71.ZIndex = 63
TextLabel71.Parent = TextButton46

TextButton46.MouseEnter:Connect(function()
	TextButton46.BackgroundTransparency = 0.4
	TextLabel71.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton46.MouseLeave:Connect(function()
	TextButton46.BackgroundTransparency = 0.65
	TextLabel71.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton46.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://10831379335"
	ImageLabel46.Image = "rbxassetid://10831379335"
	setupV2(v23)
	_G.RuzSavedDecals = nil
	local PlayerGui23 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants22 = PlayerGui23:GetDescendants()

	for i24, v24 in ipairs(descendants22) do
		local result24 = v24.Name:lower()
		result24:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v24, "rbxassetid://10831379335")
	_G.RuzSavedDecals = { { obj = v24, origImage = v24.Image, origSize = v24.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel661 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel661.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton46.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton46.BackgroundTransparency = 0.3
	TextLabel71.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local TextButton47 = Instance.new("TextButton")
TextButton47.Size = UDim2.new(1, 0, 0, 28)
TextButton47.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton47.BackgroundTransparency = 0.65
TextButton47.BorderSizePixel = 0
TextButton47.Text = ""
TextButton47.ZIndex = 62
TextButton47.LayoutOrder = 21
TextButton47.Parent = ScrollingFrame8
local UICorner87 = Instance.new("UICorner")
UICorner87.CornerRadius = UDim.new(0, 5)
UICorner87.Parent = TextButton47
local ImageLabel33 = Instance.new("ImageLabel")
ImageLabel33.Size = UDim2.new(0, 20, 0, 20)
ImageLabel33.Position = UDim2.new(0, 6, 0.5, 0)
ImageLabel33.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel33.BackgroundTransparency = 1
ImageLabel33.ScaleType = Enum.ScaleType.Fit
ImageLabel33.Image = "rbxassetid://8375241602"
ImageLabel33.ZIndex = 63
ImageLabel33.Parent = TextButton47
local TextLabel72 = Instance.new("TextLabel")
TextLabel72.Size = UDim2.new(1, -32, 1, 0)
TextLabel72.Position = UDim2.new(0, 30, 0, 0)
TextLabel72.BackgroundTransparency = 1
TextLabel72.Text = "White Dot Line"
TextLabel72.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel72.TextSize = 11
TextLabel72.Font = Enum.Font.ArialBold
TextLabel72.TextXAlignment = Enum.TextXAlignment.Left
TextLabel72.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel72.ZIndex = 63
TextLabel72.Parent = TextButton47

TextButton47.MouseEnter:Connect(function()
	TextButton47.BackgroundTransparency = 0.4
	TextLabel72.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton47.MouseLeave:Connect(function()
	TextButton47.BackgroundTransparency = 0.65
	TextLabel72.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton47.MouseButton1Click:Connect(function()
	Sound:Play()
	ImageLabel11.Image = "rbxassetid://8375241602"
	ImageLabel46.Image = "rbxassetid://8375241602"
	setupV2(v24)
	_G.RuzSavedDecals = nil
	local PlayerGui24 = Players.LocalPlayer:FindFirstChild("PlayerGui")
	local descendants23 = PlayerGui24:GetDescendants()

	for i25, v25 in ipairs(descendants23) do
		local result25 = v25.Name:lower()
		result25:find("crosshair")
	end

	game.CoreGui:GetDescendants()
	ImageLabel46.Visible = false
	setupV(v25, "rbxassetid://8375241602")
	_G.RuzSavedDecals = { { obj = v25, origImage = v25.Image, origSize = v25.Size } }

	for _, textButton in ipairs({
		TextButton27, TextButton28, TextButton29, TextButton30, TextButton31, TextButton32,
		TextButton33, TextButton34, TextButton35, TextButton36, TextButton37, TextButton38,
		TextButton39, TextButton40, TextButton41, TextButton42, TextButton43, TextButton44,
		TextButton45, TextButton46, TextButton47,
	}) do
		textButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		textButton.BackgroundTransparency = 0.65
		local TextLabel682 = textButton:FindFirstChildWhichIsA("TextLabel")
		TextLabel682.TextColor3 = Color3.fromRGB(160, 160, 160)
	end

	TextButton47.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton47.BackgroundTransparency = 0.3
	TextLabel72.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeChList()
end)

local Frame91 = Instance.new("Frame")
Frame91.Size = UDim2.new(0, 220, 0, 1)
Frame91.BackgroundTransparency = 1
Frame91.ZIndex = 0
Frame91.Parent = CustomPanelGui

TextButton26.MouseButton1Click:Connect(function()
	Sound:Play()
end)

TextButton25.MouseButton1Click:Connect(function()
	Sound:Play()
	CrosshairList.Position = UDim2.new(0, -100, 0, -218)
	CrosshairList.Size = UDim2.new(0, 220, 0, 0)
	CrosshairList.Visible = true
	local tween39 = TweenService:Create(CrosshairList, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 220, 0, 214) })
	tween39:Play()
end)

createTextLabel(4, Scroll2, "Slider_Crosshair Size", "Crosshair Size", "30 px", "Default: 30px", 0.14285714285714285)
local Toggle_CrosshairSpin, UIStroke52 = createFrame(36, 5, Scroll2)
Toggle_CrosshairSpin.Name = "Toggle_Crosshair Spin"
local TextLabel76 = Instance.new("TextLabel")
TextLabel76.Size = UDim2.new(1, -72, 0, 14)
TextLabel76.Position = UDim2.new(0, 10, 0, 5)
TextLabel76.BackgroundTransparency = 1
TextLabel76.Text = "Crosshair Spin"
TextLabel76.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel76.TextSize = 11
TextLabel76.Font = Enum.Font.ArialBold
TextLabel76.TextXAlignment = Enum.TextXAlignment.Left
TextLabel76.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel76.Parent = Toggle_CrosshairSpin
local TextLabel77 = Instance.new("TextLabel")
TextLabel77.Size = UDim2.new(1, -72, 0, 11)
TextLabel77.Position = UDim2.new(0, 10, 0, 20)
TextLabel77.BackgroundTransparency = 1
TextLabel77.Text = "Rotate crosshair continuously"
TextLabel77.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel77.TextSize = 9
TextLabel77.Font = Enum.Font.Arial
TextLabel77.TextXAlignment = Enum.TextXAlignment.Left
TextLabel77.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel77.Parent = Toggle_CrosshairSpin
local Frame97 = Instance.new("Frame")
Frame97.Size = UDim2.new(0, 34, 0, 18)
Frame97.Position = UDim2.new(1, -44, 0.5, 0)
Frame97.AnchorPoint = Vector2.new(1, 0.5)
Frame97.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame97.BorderSizePixel = 0
Frame97.Parent = Toggle_CrosshairSpin
local UICorner93 = Instance.new("UICorner")
UICorner93.CornerRadius = UDim.new(1, 0)
UICorner93.Parent = Frame97
local Frame98 = Instance.new("Frame")
Frame98.Size = UDim2.new(0, 12, 0, 12)
Frame98.Position = UDim2.new(0, 3, 0.5, 0)
Frame98.AnchorPoint = Vector2.new(0, 0.5)
Frame98.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame98.BorderSizePixel = 0
Frame98.Parent = Frame97
local UICorner94 = Instance.new("UICorner")
UICorner94.CornerRadius = UDim.new(1, 0)
UICorner94.Parent = Frame98
local UIStroke53 = Instance.new("UIStroke")
UIStroke53.Color = Color3.fromRGB(170, 20, 40)
UIStroke53.Thickness = 1.2
UIStroke53.Transparency = 0.3
UIStroke53.Parent = Frame98
local TextButton49 = Instance.new("TextButton")
TextButton49.Size = UDim2.new(1, 0, 1, 0)
TextButton49.BackgroundTransparency = 1
TextButton49.Text = ""
TextButton49.Parent = Toggle_CrosshairSpin

TextButton49.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween40 = TweenService:Create(Frame97, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween40:Play()
	local tween41 = TweenService:Create(Frame98, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween41:Play()
	UIStroke52.Color = Color3.fromRGB(255, 0, 0)
	UIStroke52.Transparency = 0.25

	local connection7 = RunService.RenderStepped:Connect(function(deltaTime11)
		v25.Rotation = ((v25.Rotation + 4) % 360)
	end)
end)

local SpinSpeedRow, UIStroke54 = createFrame(38, 6, Scroll2)
SpinSpeedRow.Name = "SpinSpeedRow"
local TextLabel78 = Instance.new("TextLabel")
TextLabel78.Size = UDim2.new(0.5, 0, 0, 18)
TextLabel78.Position = UDim2.new(0, 12, 0, 10)
TextLabel78.BackgroundTransparency = 1
TextLabel78.Text = "Spin Speed"
TextLabel78.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel78.TextSize = 13
TextLabel78.Font = Enum.Font.ArialBold
TextLabel78.TextXAlignment = Enum.TextXAlignment.Left
TextLabel78.Parent = SpinSpeedRow
local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 60, 0, 26)
TextBox.Position = UDim2.new(1, -10, 0.5, 0)
TextBox.AnchorPoint = Vector2.new(1, 0.5)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.BackgroundTransparency = 0.1
TextBox.BorderSizePixel = 0
TextBox.Text = "1.0"
TextBox.TextColor3 = Color3.fromRGB(240, 240, 240)
TextBox.TextSize = 12
TextBox.Font = Enum.Font.ArialBold
TextBox.TextXAlignment = Enum.TextXAlignment.Center
TextBox.Parent = SpinSpeedRow
local UICorner96 = Instance.new("UICorner")
UICorner96.CornerRadius = UDim.new(0, 6)
UICorner96.Parent = TextBox
local UIStroke55 = Instance.new("UIStroke")
UIStroke55.Color = Color3.fromRGB(60, 60, 60)
UIStroke55.Thickness = 1
UIStroke55.Transparency = 0.2
UIStroke55.Parent = TextBox

TextBox.FocusLost:Connect(function(enterPressed, inputObject)
	TextBox.Text = "1"
	connection7:Disconnect()

	RunService.RenderStepped:Connect(function(deltaTime12)
		v25.Rotation = ((((v25.Rotation + 4) % 360) + 4) % 360)
	end)
end)

local CustomIDRow, UIStroke56 = createFrame(38, 7, Scroll2)
CustomIDRow.Name = "CustomIDRow"
local TextLabel79 = Instance.new("TextLabel")
TextLabel79.Size = UDim2.new(0.45, 0, 0, 18)
TextLabel79.Position = UDim2.new(0, 12, 0, 10)
TextLabel79.BackgroundTransparency = 1
TextLabel79.Text = "Custom Texture ID"
TextLabel79.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel79.TextSize = 12
TextLabel79.Font = Enum.Font.ArialBold
TextLabel79.TextXAlignment = Enum.TextXAlignment.Left
TextLabel79.Parent = CustomIDRow
local Frame101 = Instance.new("Frame")
Frame101.Size = UDim2.new(0, 170, 0, 26)
Frame101.Position = UDim2.new(1, -10, 0.5, 0)
Frame101.AnchorPoint = Vector2.new(1, 0.5)
Frame101.BackgroundTransparency = 1
Frame101.Parent = CustomIDRow
local TextBox2 = Instance.new("TextBox")
TextBox2.Size = UDim2.new(1, -46, 1, 0)
TextBox2.Position = UDim2.new(0, 0, 0, 0)
TextBox2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox2.BackgroundTransparency = 0.1
TextBox2.BorderSizePixel = 0
TextBox2.PlaceholderText = "Enter ID..."
TextBox2.Text = ""
TextBox2.TextColor3 = Color3.fromRGB(240, 240, 240)
TextBox2.TextSize = 11
TextBox2.Font = Enum.Font.Arial
TextBox2.TextXAlignment = Enum.TextXAlignment.Center
TextBox2.Parent = Frame101
local UICorner98 = Instance.new("UICorner")
UICorner98.CornerRadius = UDim.new(0, 6)
UICorner98.Parent = TextBox2
local UIStroke57 = Instance.new("UIStroke")
UIStroke57.Color = Color3.fromRGB(60, 60, 60)
UIStroke57.Thickness = 1
UIStroke57.Transparency = 0.2
UIStroke57.Parent = TextBox2
local TextButton50 = Instance.new("TextButton")
TextButton50.Size = UDim2.new(0, 40, 1, 0)
TextButton50.Position = UDim2.new(1, 0, 0, 0)
TextButton50.AnchorPoint = Vector2.new(1, 0)
TextButton50.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton50.BackgroundTransparency = 0.1
TextButton50.BorderSizePixel = 0
TextButton50.Text = "Apply"
TextButton50.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton50.TextSize = 10
TextButton50.Font = Enum.Font.ArialBold
TextButton50.Parent = Frame101
local UICorner99 = Instance.new("UICorner")
UICorner99.CornerRadius = UDim.new(0, 6)
UICorner99.Parent = TextButton50
local UIStroke58 = Instance.new("UIStroke")
UIStroke58.Color = Color3.fromRGB(255, 40, 60)
UIStroke58.Thickness = 1
UIStroke58.Transparency = 0.3
UIStroke58.Parent = TextButton50

TextButton50.MouseButton1Click:Connect(function()
	Sound:Play()
end)

createDivider(8, Scroll2, "Custom Skybox")
local Toggle_CustomSkybox, UIStroke59 = createFrame(28, 9, Scroll2)
Toggle_CustomSkybox.Name = "Toggle_Custom Skybox"
local TextLabel81 = Instance.new("TextLabel")
TextLabel81.Size = UDim2.new(1, -72, 0, 14)
TextLabel81.Position = UDim2.new(0, 10, 0, 7)
TextLabel81.BackgroundTransparency = 1
TextLabel81.Text = "Custom Skybox"
TextLabel81.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel81.TextSize = 11
TextLabel81.Font = Enum.Font.ArialBold
TextLabel81.TextXAlignment = Enum.TextXAlignment.Left
TextLabel81.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel81.Parent = Toggle_CustomSkybox
local Frame106 = Instance.new("Frame")
Frame106.Size = UDim2.new(0, 34, 0, 18)
Frame106.Position = UDim2.new(1, -44, 0.5, 0)
Frame106.AnchorPoint = Vector2.new(1, 0.5)
Frame106.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame106.BorderSizePixel = 0
Frame106.Parent = Toggle_CustomSkybox
local UICorner101 = Instance.new("UICorner")
UICorner101.CornerRadius = UDim.new(1, 0)
UICorner101.Parent = Frame106
local Frame107 = Instance.new("Frame")
Frame107.Size = UDim2.new(0, 12, 0, 12)
Frame107.Position = UDim2.new(0, 3, 0.5, 0)
Frame107.AnchorPoint = Vector2.new(0, 0.5)
Frame107.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame107.BorderSizePixel = 0
Frame107.Parent = Frame106
local UICorner102 = Instance.new("UICorner")
UICorner102.CornerRadius = UDim.new(1, 0)
UICorner102.Parent = Frame107
local UIStroke60 = Instance.new("UIStroke")
UIStroke60.Color = Color3.fromRGB(170, 20, 40)
UIStroke60.Thickness = 1.2
UIStroke60.Transparency = 0.3
UIStroke60.Parent = Frame107
local TextButton51 = Instance.new("TextButton")
TextButton51.Size = UDim2.new(1, 0, 1, 0)
TextButton51.BackgroundTransparency = 1
TextButton51.Text = ""
TextButton51.Parent = Toggle_CustomSkybox

local function createSky(skyboxBk, parent)
	local Sky = Instance.new("Sky")
	Sky.SkyboxBk = skyboxBk
	Sky.SkyboxDn = skyboxBk
	Sky.SkyboxFt = skyboxBk
	Sky.SkyboxLf = skyboxBk
	Sky.SkyboxRt = skyboxBk
	Sky.SkyboxUp = skyboxBk
	Sky.SkyboxOrientation = Vector3.new(0, 0, 0)
	Sky.Parent = parent
	return Sky
end

TextButton51.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween42 = TweenService:Create(Frame106, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween42:Play()
	local tween43 = TweenService:Create(Frame107, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween43:Play()
	UIStroke59.Color = Color3.fromRGB(255, 0, 0)
	UIStroke59.Transparency = 0.25
	local Lighting = game:GetService("Lighting")
	local children2 = Lighting:GetChildren()

	for k, v26 in children2 do
		v26:Destroy()
	end

	local Sky = createSky("rbxassetid://10318000595", Lighting)
end)

local Dropdown_SelectSkybox, UIStroke61 = createFrame(28, 10, Scroll2)
Dropdown_SelectSkybox.Name = "Dropdown_Select Skybox"
Dropdown_SelectSkybox.ClipsDescendants = false
local TextLabel82 = Instance.new("TextLabel")
TextLabel82.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel82.Position = UDim2.new(0, 10, 0, 7)
TextLabel82.BackgroundTransparency = 1
TextLabel82.Text = "Select Skybox"
TextLabel82.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel82.TextSize = 11
TextLabel82.Font = Enum.Font.ArialBold
TextLabel82.TextXAlignment = Enum.TextXAlignment.Left
TextLabel82.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel82.Parent = Dropdown_SelectSkybox
local TextButton52 = Instance.new("TextButton")
TextButton52.Size = UDim2.new(0, 100, 0, 20)
TextButton52.Position = UDim2.new(1, -8, 0.5, 0)
TextButton52.AnchorPoint = Vector2.new(1, 0.5)
TextButton52.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton52.BackgroundTransparency = 0.1
TextButton52.BorderSizePixel = 0
TextButton52.Text = ""
TextButton52.Parent = Dropdown_SelectSkybox
local UICorner104 = Instance.new("UICorner")
UICorner104.CornerRadius = UDim.new(0, 6)
UICorner104.Parent = TextButton52
local UIStroke62 = Instance.new("UIStroke")
UIStroke62.Color = Color3.fromRGB(60, 60, 60)
UIStroke62.Thickness = 1
UIStroke62.Transparency = 0.2
UIStroke62.Parent = TextButton52
local TextLabel83 = Instance.new("TextLabel")
TextLabel83.Size = UDim2.new(1, -24, 1, 0)
TextLabel83.Position = UDim2.new(0, 8, 0, 0)
TextLabel83.BackgroundTransparency = 1
TextLabel83.Text = "Red Skybox"
TextLabel83.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel83.TextSize = 11
TextLabel83.Font = Enum.Font.ArialBold
TextLabel83.TextXAlignment = Enum.TextXAlignment.Left
TextLabel83.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel83.Parent = TextButton52
local TextLabel84 = Instance.new("TextLabel")
TextLabel84.Size = UDim2.new(0, 16, 1, 0)
TextLabel84.Position = UDim2.new(1, -18, 0, 0)
TextLabel84.BackgroundTransparency = 1
TextLabel84.Text = "▾"
TextLabel84.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel84.TextSize = 12
TextLabel84.Font = Enum.Font.Arial
TextLabel84.Parent = TextButton52
local DropList_SelectSkybox = Instance.new("Frame")
DropList_SelectSkybox.Name = "DropList_Select Skybox"
DropList_SelectSkybox.Size = UDim2.new(0, 100, 0, 136)
DropList_SelectSkybox.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_SelectSkybox.BackgroundTransparency = 0.04
DropList_SelectSkybox.BorderSizePixel = 0
DropList_SelectSkybox.Visible = false
DropList_SelectSkybox.ZIndex = 60
DropList_SelectSkybox.Parent = CustomPanelGui
local UICorner105 = Instance.new("UICorner")
UICorner105.CornerRadius = UDim.new(0, 8)
UICorner105.Parent = DropList_SelectSkybox
local UIStroke63 = Instance.new("UIStroke")
UIStroke63.Color = Color3.fromRGB(255, 0, 0)
UIStroke63.Thickness = 1.2
UIStroke63.Transparency = 0.2
UIStroke63.Parent = DropList_SelectSkybox
local Frame110 = Instance.new("Frame")
Frame110.Size = UDim2.new(1, 0, 0, 28)
Frame110.BackgroundTransparency = 1
Frame110.ZIndex = 61
Frame110.Parent = DropList_SelectSkybox
local TextLabel85 = Instance.new("TextLabel")
TextLabel85.Size = UDim2.new(1, -32, 1, 0)
TextLabel85.Position = UDim2.new(0, 8, 0, 0)
TextLabel85.BackgroundTransparency = 1
TextLabel85.Text = "Select Skybox"
TextLabel85.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel85.TextSize = 10
TextLabel85.Font = Enum.Font.ArialBold
TextLabel85.TextXAlignment = Enum.TextXAlignment.Left
TextLabel85.ZIndex = 61
TextLabel85.Parent = Frame110
local TextButton53 = Instance.new("TextButton")
TextButton53.Size = UDim2.new(0, 28, 0, 28)
TextButton53.Position = UDim2.new(1, -8, 0.5, 0)
TextButton53.AnchorPoint = Vector2.new(1, 0.5)
TextButton53.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton53.BackgroundTransparency = 0.3
TextButton53.BorderSizePixel = 0
TextButton53.Text = ""
TextButton53.ZIndex = 62
TextButton53.Parent = Frame110
local UICorner106 = Instance.new("UICorner")
UICorner106.CornerRadius = UDim.new(0, 6)
UICorner106.Parent = TextButton53
local UIStroke64 = Instance.new("UIStroke")
UIStroke64.Color = Color3.fromRGB(255, 40, 60)
UIStroke64.Thickness = 1.2
UIStroke64.Transparency = 0.3
UIStroke64.Parent = TextButton53
local ImageLabel34 = Instance.new("ImageLabel")
ImageLabel34.Size = UDim2.new(0, 16, 0, 16)
ImageLabel34.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel34.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel34.BackgroundTransparency = 1
ImageLabel34.ScaleType = Enum.ScaleType.Fit
ImageLabel34.Image = "rbxassetid://116396312853810"
ImageLabel34.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel34.ZIndex = 63
ImageLabel34.Parent = TextButton53

TextButton53.MouseEnter:Connect(function()
	TextButton53.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton53.BackgroundTransparency = 0.1
end)

TextButton53.MouseLeave:Connect(function()
	TextButton53.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton53.BackgroundTransparency = 0.3
end)

local Frame111 = Instance.new("Frame")
Frame111.Size = UDim2.new(1, -8, 0, 1)
Frame111.Position = UDim2.new(0.5, 0, 0, 28)
Frame111.AnchorPoint = Vector2.new(0.5, 0)
Frame111.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame111.BackgroundTransparency = 0.6
Frame111.BorderSizePixel = 0
Frame111.ZIndex = 61
Frame111.Parent = DropList_SelectSkybox
local ScrollingFrame9 = Instance.new("ScrollingFrame")
ScrollingFrame9.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame9.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame9.BackgroundTransparency = 1
ScrollingFrame9.BorderSizePixel = 0
ScrollingFrame9.ScrollBarThickness = 2
ScrollingFrame9.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame9.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame9.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame9.ZIndex = 61
ScrollingFrame9.Parent = DropList_SelectSkybox
local UIListLayout10 = Instance.new("UIListLayout")
UIListLayout10.Padding = UDim.new(0, 2)
UIListLayout10.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout10.Parent = ScrollingFrame9
local UIPadding9 = Instance.new("UIPadding")
UIPadding9.PaddingLeft = UDim.new(0, 4)
UIPadding9.PaddingRight = UDim.new(0, 4)
UIPadding9.PaddingTop = UDim.new(0, 3)
UIPadding9.Parent = ScrollingFrame9
local TextButton54 = Instance.new("TextButton")
TextButton54.Size = UDim2.new(1, 0, 0, 20)
TextButton54.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton54.BackgroundTransparency = 0.3
TextButton54.BorderSizePixel = 0
TextButton54.Text = "Red Skybox"
TextButton54.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton54.TextSize = 11
TextButton54.Font = Enum.Font.ArialBold
TextButton54.TextTruncate = Enum.TextTruncate.AtEnd
TextButton54.ZIndex = 62
TextButton54.LayoutOrder = 1
TextButton54.Parent = ScrollingFrame9
local UICorner107 = Instance.new("UICorner")
UICorner107.CornerRadius = UDim.new(0, 5)
UICorner107.Parent = TextButton54

TextButton54.MouseEnter:Connect(function()
end)

TextButton54.MouseLeave:Connect(function()
end)

local function setupSky(sky, lighting, skyboxBk)
	sky:Destroy()
	lighting:GetChildren()
	local Sky2 = createSky(skyboxBk, lighting)
	return Sky2
end

TextButton54.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Red Skybox"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky2 = setupSky(Sky, Lighting, "rbxassetid://10318000595")
	TextLabel84.Text = "▾"
	local tween44 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween44:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton55 = Instance.new("TextButton")
TextButton55.Size = UDim2.new(1, 0, 0, 20)
TextButton55.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton55.BackgroundTransparency = 0.65
TextButton55.BorderSizePixel = 0
TextButton55.Text = "Black Breath"
TextButton55.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton55.TextSize = 11
TextButton55.Font = Enum.Font.ArialBold
TextButton55.TextTruncate = Enum.TextTruncate.AtEnd
TextButton55.ZIndex = 62
TextButton55.LayoutOrder = 2
TextButton55.Parent = ScrollingFrame9
local UICorner108 = Instance.new("UICorner")
UICorner108.CornerRadius = UDim.new(0, 5)
UICorner108.Parent = TextButton55

TextButton55.MouseEnter:Connect(function()
	TextButton55.BackgroundTransparency = 0.4
	TextButton55.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton55.MouseLeave:Connect(function()
	TextButton55.BackgroundTransparency = 0.65
	TextButton55.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton55.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Black Breath"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky3 = setupSky(Sky2, Lighting, "rbxassetid://129826851998944")
	TextLabel84.Text = "▾"
	local tween45 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween45:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton56 = Instance.new("TextButton")
TextButton56.Size = UDim2.new(1, 0, 0, 20)
TextButton56.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton56.BackgroundTransparency = 0.65
TextButton56.BorderSizePixel = 0
TextButton56.Text = "Skything"
TextButton56.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton56.TextSize = 11
TextButton56.Font = Enum.Font.ArialBold
TextButton56.TextTruncate = Enum.TextTruncate.AtEnd
TextButton56.ZIndex = 62
TextButton56.LayoutOrder = 3
TextButton56.Parent = ScrollingFrame9
local UICorner109 = Instance.new("UICorner")
UICorner109.CornerRadius = UDim.new(0, 5)
UICorner109.Parent = TextButton56

TextButton56.MouseEnter:Connect(function()
	TextButton56.BackgroundTransparency = 0.4
	TextButton56.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton56.MouseLeave:Connect(function()
	TextButton56.BackgroundTransparency = 0.65
	TextButton56.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton56.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Skything"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky4 = setupSky(Sky3, Lighting, "rbxassetid://90246620946502")
	TextLabel84.Text = "▾"
	local tween46 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween46:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton57 = Instance.new("TextButton")
TextButton57.Size = UDim2.new(1, 0, 0, 20)
TextButton57.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton57.BackgroundTransparency = 0.65
TextButton57.BorderSizePixel = 0
TextButton57.Text = "SON goku"
TextButton57.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton57.TextSize = 11
TextButton57.Font = Enum.Font.ArialBold
TextButton57.TextTruncate = Enum.TextTruncate.AtEnd
TextButton57.ZIndex = 62
TextButton57.LayoutOrder = 4
TextButton57.Parent = ScrollingFrame9
local UICorner110 = Instance.new("UICorner")
UICorner110.CornerRadius = UDim.new(0, 5)
UICorner110.Parent = TextButton57

TextButton57.MouseEnter:Connect(function()
	TextButton57.BackgroundTransparency = 0.4
	TextButton57.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton57.MouseLeave:Connect(function()
	TextButton57.BackgroundTransparency = 0.65
	TextButton57.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton57.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "SON goku"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky5 = setupSky(Sky4, Lighting, "rbxassetid://76338167951386")
	TextLabel84.Text = "▾"
	local tween47 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween47:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton58 = Instance.new("TextButton")
TextButton58.Size = UDim2.new(1, 0, 0, 20)
TextButton58.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton58.BackgroundTransparency = 0.65
TextButton58.BorderSizePixel = 0
TextButton58.Text = "pink 1"
TextButton58.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton58.TextSize = 11
TextButton58.Font = Enum.Font.ArialBold
TextButton58.TextTruncate = Enum.TextTruncate.AtEnd
TextButton58.ZIndex = 62
TextButton58.LayoutOrder = 5
TextButton58.Parent = ScrollingFrame9
local UICorner111 = Instance.new("UICorner")
UICorner111.CornerRadius = UDim.new(0, 5)
UICorner111.Parent = TextButton58

TextButton58.MouseEnter:Connect(function()
	TextButton58.BackgroundTransparency = 0.4
	TextButton58.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton58.MouseLeave:Connect(function()
	TextButton58.BackgroundTransparency = 0.65
	TextButton58.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton58.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "pink 1"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky6 = setupSky(Sky5, Lighting, "rbxassetid://95000769820905")
	TextLabel84.Text = "▾"
	local tween48 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween48:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton59 = Instance.new("TextButton")
TextButton59.Size = UDim2.new(1, 0, 0, 20)
TextButton59.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton59.BackgroundTransparency = 0.65
TextButton59.BorderSizePixel = 0
TextButton59.Text = "pink 2"
TextButton59.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton59.TextSize = 11
TextButton59.Font = Enum.Font.ArialBold
TextButton59.TextTruncate = Enum.TextTruncate.AtEnd
TextButton59.ZIndex = 62
TextButton59.LayoutOrder = 6
TextButton59.Parent = ScrollingFrame9
local UICorner112 = Instance.new("UICorner")
UICorner112.CornerRadius = UDim.new(0, 5)
UICorner112.Parent = TextButton59

TextButton59.MouseEnter:Connect(function()
	TextButton59.BackgroundTransparency = 0.4
	TextButton59.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton59.MouseLeave:Connect(function()
	TextButton59.BackgroundTransparency = 0.65
	TextButton59.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton59.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "pink 2"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky7 = setupSky(Sky6, Lighting, "rbxassetid://79734717339224")
	TextLabel84.Text = "▾"
	local tween49 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween49:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton60 = Instance.new("TextButton")
TextButton60.Size = UDim2.new(1, 0, 0, 20)
TextButton60.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton60.BackgroundTransparency = 0.65
TextButton60.BorderSizePixel = 0
TextButton60.Text = "Aurora"
TextButton60.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton60.TextSize = 11
TextButton60.Font = Enum.Font.ArialBold
TextButton60.TextTruncate = Enum.TextTruncate.AtEnd
TextButton60.ZIndex = 62
TextButton60.LayoutOrder = 7
TextButton60.Parent = ScrollingFrame9
local UICorner113 = Instance.new("UICorner")
UICorner113.CornerRadius = UDim.new(0, 5)
UICorner113.Parent = TextButton60

TextButton60.MouseEnter:Connect(function()
	TextButton60.BackgroundTransparency = 0.4
	TextButton60.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton60.MouseLeave:Connect(function()
	TextButton60.BackgroundTransparency = 0.65
	TextButton60.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton60.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Aurora"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky8 = setupSky(Sky7, Lighting, "rbxassetid://11915636055")
	TextLabel84.Text = "▾"
	local tween50 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween50:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton61 = Instance.new("TextButton")
TextButton61.Size = UDim2.new(1, 0, 0, 20)
TextButton61.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton61.BackgroundTransparency = 0.65
TextButton61.BorderSizePixel = 0
TextButton61.Text = "white blue aura men"
TextButton61.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton61.TextSize = 11
TextButton61.Font = Enum.Font.ArialBold
TextButton61.TextTruncate = Enum.TextTruncate.AtEnd
TextButton61.ZIndex = 62
TextButton61.LayoutOrder = 8
TextButton61.Parent = ScrollingFrame9
local UICorner114 = Instance.new("UICorner")
UICorner114.CornerRadius = UDim.new(0, 5)
UICorner114.Parent = TextButton61

TextButton61.MouseEnter:Connect(function()
	TextButton61.BackgroundTransparency = 0.4
	TextButton61.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton61.MouseLeave:Connect(function()
	TextButton61.BackgroundTransparency = 0.65
	TextButton61.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton61.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "white blue aura men"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky9 = setupSky(Sky8, Lighting, "rbxassetid://18899181786")
	TextLabel84.Text = "▾"
	local tween51 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween51:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton62 = Instance.new("TextButton")
TextButton62.Size = UDim2.new(1, 0, 0, 20)
TextButton62.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton62.BackgroundTransparency = 0.65
TextButton62.BorderSizePixel = 0
TextButton62.Text = "Green"
TextButton62.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton62.TextSize = 11
TextButton62.Font = Enum.Font.ArialBold
TextButton62.TextTruncate = Enum.TextTruncate.AtEnd
TextButton62.ZIndex = 62
TextButton62.LayoutOrder = 9
TextButton62.Parent = ScrollingFrame9
local UICorner115 = Instance.new("UICorner")
UICorner115.CornerRadius = UDim.new(0, 5)
UICorner115.Parent = TextButton62

TextButton62.MouseEnter:Connect(function()
	TextButton62.BackgroundTransparency = 0.4
	TextButton62.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton62.MouseLeave:Connect(function()
	TextButton62.BackgroundTransparency = 0.65
	TextButton62.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton62.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Green"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky10 = setupSky(Sky9, Lighting, "rbxassetid://5036205687")
	TextLabel84.Text = "▾"
	local tween52 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween52:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton63 = Instance.new("TextButton")
TextButton63.Size = UDim2.new(1, 0, 0, 20)
TextButton63.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton63.BackgroundTransparency = 0.65
TextButton63.BorderSizePixel = 0
TextButton63.Text = "Creepy"
TextButton63.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton63.TextSize = 11
TextButton63.Font = Enum.Font.ArialBold
TextButton63.TextTruncate = Enum.TextTruncate.AtEnd
TextButton63.ZIndex = 62
TextButton63.LayoutOrder = 10
TextButton63.Parent = ScrollingFrame9
local UICorner116 = Instance.new("UICorner")
UICorner116.CornerRadius = UDim.new(0, 5)
UICorner116.Parent = TextButton63

TextButton63.MouseEnter:Connect(function()
	TextButton63.BackgroundTransparency = 0.4
	TextButton63.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton63.MouseLeave:Connect(function()
	TextButton63.BackgroundTransparency = 0.65
	TextButton63.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton63.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "Creepy"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky11 = setupSky(Sky10, Lighting, "rbxassetid://6986847642")
	TextLabel84.Text = "▾"
	local tween53 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween53:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton64 = Instance.new("TextButton")
TextButton64.Size = UDim2.new(1, 0, 0, 20)
TextButton64.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton64.BackgroundTransparency = 0.65
TextButton64.BorderSizePixel = 0
TextButton64.Text = "midnight blue"
TextButton64.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton64.TextSize = 11
TextButton64.Font = Enum.Font.ArialBold
TextButton64.TextTruncate = Enum.TextTruncate.AtEnd
TextButton64.ZIndex = 62
TextButton64.LayoutOrder = 11
TextButton64.Parent = ScrollingFrame9
local UICorner117 = Instance.new("UICorner")
UICorner117.CornerRadius = UDim.new(0, 5)
UICorner117.Parent = TextButton64

TextButton64.MouseEnter:Connect(function()
	TextButton64.BackgroundTransparency = 0.4
	TextButton64.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton64.MouseLeave:Connect(function()
	TextButton64.BackgroundTransparency = 0.65
	TextButton64.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton64.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "midnight blue"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky12 = setupSky(Sky11, Lighting, "rbxassetid://109118817560710")
	TextLabel84.Text = "▾"
	local tween54 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween54:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton65 = Instance.new("TextButton")
TextButton65.Size = UDim2.new(1, 0, 0, 20)
TextButton65.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton65.BackgroundTransparency = 0.65
TextButton65.BorderSizePixel = 0
TextButton65.Text = "purple sky"
TextButton65.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton65.TextSize = 11
TextButton65.Font = Enum.Font.ArialBold
TextButton65.TextTruncate = Enum.TextTruncate.AtEnd
TextButton65.ZIndex = 62
TextButton65.LayoutOrder = 12
TextButton65.Parent = ScrollingFrame9
local UICorner118 = Instance.new("UICorner")
UICorner118.CornerRadius = UDim.new(0, 5)
UICorner118.Parent = TextButton65

TextButton65.MouseEnter:Connect(function()
	TextButton65.BackgroundTransparency = 0.4
	TextButton65.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton65.MouseLeave:Connect(function()
	TextButton65.BackgroundTransparency = 0.65
	TextButton65.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton65.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "purple sky"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky13 = setupSky(Sky12, Lighting, "rbxassetid://136428068532091")
	TextLabel84.Text = "▾"
	local tween55 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween55:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton66 = Instance.new("TextButton")
TextButton66.Size = UDim2.new(1, 0, 0, 20)
TextButton66.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton66.BackgroundTransparency = 0.65
TextButton66.BorderSizePixel = 0
TextButton66.Text = "purple sky 2"
TextButton66.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton66.TextSize = 11
TextButton66.Font = Enum.Font.ArialBold
TextButton66.TextTruncate = Enum.TextTruncate.AtEnd
TextButton66.ZIndex = 62
TextButton66.LayoutOrder = 13
TextButton66.Parent = ScrollingFrame9
local UICorner119 = Instance.new("UICorner")
UICorner119.CornerRadius = UDim.new(0, 5)
UICorner119.Parent = TextButton66

TextButton66.MouseEnter:Connect(function()
	TextButton66.BackgroundTransparency = 0.4
	TextButton66.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton66.MouseLeave:Connect(function()
	TextButton66.BackgroundTransparency = 0.65
	TextButton66.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton66.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "purple sky 2"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky14 = setupSky(Sky13, Lighting, "rbxassetid://10206626164")
	TextLabel84.Text = "▾"
	local tween56 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween56:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton67 = Instance.new("TextButton")
TextButton67.Size = UDim2.new(1, 0, 0, 20)
TextButton67.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton67.BackgroundTransparency = 0.65
TextButton67.BorderSizePixel = 0
TextButton67.Text = "yellow peak"
TextButton67.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton67.TextSize = 11
TextButton67.Font = Enum.Font.ArialBold
TextButton67.TextTruncate = Enum.TextTruncate.AtEnd
TextButton67.ZIndex = 62
TextButton67.LayoutOrder = 14
TextButton67.Parent = ScrollingFrame9
local UICorner120 = Instance.new("UICorner")
UICorner120.CornerRadius = UDim.new(0, 5)
UICorner120.Parent = TextButton67

TextButton67.MouseEnter:Connect(function()
	TextButton67.BackgroundTransparency = 0.4
	TextButton67.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton67.MouseLeave:Connect(function()
	TextButton67.BackgroundTransparency = 0.65
	TextButton67.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton67.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "yellow peak"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton68, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky15 = setupSky(Sky14, Lighting, "rbxassetid://5694322014")
	TextLabel84.Text = "▾"
	local tween57 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween57:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

local TextButton68 = Instance.new("TextButton")
TextButton68.Size = UDim2.new(1, 0, 0, 20)
TextButton68.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton68.BackgroundTransparency = 0.65
TextButton68.BorderSizePixel = 0
TextButton68.Text = "turkiye peak"
TextButton68.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton68.TextSize = 11
TextButton68.Font = Enum.Font.ArialBold
TextButton68.TextTruncate = Enum.TextTruncate.AtEnd
TextButton68.ZIndex = 62
TextButton68.LayoutOrder = 15
TextButton68.Parent = ScrollingFrame9
local UICorner121 = Instance.new("UICorner")
UICorner121.CornerRadius = UDim.new(0, 5)
UICorner121.Parent = TextButton68

TextButton68.MouseEnter:Connect(function()
	TextButton68.BackgroundTransparency = 0.4
	TextButton68.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton68.MouseLeave:Connect(function()
	TextButton68.BackgroundTransparency = 0.65
	TextButton68.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton68.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel83.Text = "turkiye peak"

	for _, item in ipairs({
		{ textButton = TextButton54, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton55, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton56, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton57, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton58, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton59, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton60, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton61, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton62, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton63, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton64, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton65, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton66, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton67, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton68, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local Sky16 = setupSky(Sky15, Lighting, "rbxassetid://12373010210")
	TextLabel84.Text = "▾"
	local tween58 = TweenService:Create(DropList_SelectSkybox, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween58:Play()
	task.wait(0.15)
	DropList_SelectSkybox.Visible = false
end)

Dropdown_SelectSkybox.Destroying:Connect(function()
	DropList_SelectSkybox:Destroy()
end)

local function setupTextLabel(textLabel, frame)
	textLabel.Text = "▾"
	local tween59 = TweenService:Create(frame, TweenInfo.new(0.14), { Size = UDim2.new(0, 116, 0, 0) })
	tween59:Play()
	task.wait(0.15)
	frame.Visible = false
end

TextButton53.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel84, DropList_SelectSkybox)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child7, parent)
end)

local function setupFrame(frame, yOffset, textLabel, yOffset2)
	frame.Position = UDim2.new(0, 0, 0, -yOffset)
	frame.Size = UDim2.new(0, 116, 0, 0)
	frame.Visible = true
	textLabel.Text = "▴"
	local tween60 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 116, 0, yOffset2) })
	tween60:Play()
end

TextButton52.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_SelectSkybox, 140, TextLabel84, 136)
end)

createDivider(11, Scroll2, "VFX Aura")

local function tweenFrame(frame, frame2, uiStroke)
	local tween61 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween61:Play()
	local tween62 = TweenService:Create(frame2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween62:Play()
	uiStroke.Color = Color3.fromRGB(255, 0, 0)
	uiStroke.Transparency = 0.25
end

local function createFrame3(layoutOrder, parent, name, text)
	local Toggle_AuraEnabled, UIStroke65 = createFrame(28, layoutOrder, parent)
	Toggle_AuraEnabled.Name = name
	local TextLabel87 = Instance.new("TextLabel")
	TextLabel87.Size = UDim2.new(1, -72, 0, 14)
	TextLabel87.Position = UDim2.new(0, 10, 0, 7)
	TextLabel87.BackgroundTransparency = 1
	TextLabel87.Text = text
	TextLabel87.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel87.TextSize = 11
	TextLabel87.Font = Enum.Font.ArialBold
	TextLabel87.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel87.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel87.Parent = Toggle_AuraEnabled
	local Frame116 = Instance.new("Frame")
	Frame116.Size = UDim2.new(0, 34, 0, 18)
	Frame116.Position = UDim2.new(1, -44, 0.5, 0)
	Frame116.AnchorPoint = Vector2.new(1, 0.5)
	Frame116.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Frame116.BorderSizePixel = 0
	Frame116.Parent = Toggle_AuraEnabled
	local UICorner123 = Instance.new("UICorner")
	UICorner123.CornerRadius = UDim.new(1, 0)
	UICorner123.Parent = Frame116
	local Frame117 = Instance.new("Frame")
	Frame117.Size = UDim2.new(0, 12, 0, 12)
	Frame117.Position = UDim2.new(0, 3, 0.5, 0)
	Frame117.AnchorPoint = Vector2.new(0, 0.5)
	Frame117.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame117.BorderSizePixel = 0
	Frame117.Parent = Frame116
	local UICorner124 = Instance.new("UICorner")
	UICorner124.CornerRadius = UDim.new(1, 0)
	UICorner124.Parent = Frame117
	local UIStroke66 = Instance.new("UIStroke")
	UIStroke66.Color = Color3.fromRGB(170, 20, 40)
	UIStroke66.Thickness = 1.2
	UIStroke66.Transparency = 0.3
	UIStroke66.Parent = Frame117
	local TextButton69 = Instance.new("TextButton")
	TextButton69.Size = UDim2.new(1, 0, 1, 0)
	TextButton69.BackgroundTransparency = 1
	TextButton69.Text = ""
	TextButton69.Parent = Toggle_AuraEnabled

	TextButton69.MouseButton1Click:Connect(function()
		Sound:Play()
		tweenFrame(Frame116, Frame117, UIStroke65)
	end)
end

createFrame3(12, Scroll2, "Toggle_Aura Enabled", "Aura Enabled")
local Dropdown_AuraType, UIStroke67 = createFrame(28, 13, Scroll2)
Dropdown_AuraType.Name = "Dropdown_Aura Type"
Dropdown_AuraType.ClipsDescendants = false
local TextLabel88 = Instance.new("TextLabel")
TextLabel88.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel88.Position = UDim2.new(0, 10, 0, 7)
TextLabel88.BackgroundTransparency = 1
TextLabel88.Text = "Aura Type"
TextLabel88.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel88.TextSize = 11
TextLabel88.Font = Enum.Font.ArialBold
TextLabel88.TextXAlignment = Enum.TextXAlignment.Left
TextLabel88.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel88.Parent = Dropdown_AuraType
local TextButton70 = Instance.new("TextButton")
TextButton70.Size = UDim2.new(0, 100, 0, 20)
TextButton70.Position = UDim2.new(1, -8, 0.5, 0)
TextButton70.AnchorPoint = Vector2.new(1, 0.5)
TextButton70.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton70.BackgroundTransparency = 0.1
TextButton70.BorderSizePixel = 0
TextButton70.Text = ""
TextButton70.Parent = Dropdown_AuraType
local UICorner126 = Instance.new("UICorner")
UICorner126.CornerRadius = UDim.new(0, 6)
UICorner126.Parent = TextButton70
local UIStroke68 = Instance.new("UIStroke")
UIStroke68.Color = Color3.fromRGB(60, 60, 60)
UIStroke68.Thickness = 1
UIStroke68.Transparency = 0.2
UIStroke68.Parent = TextButton70
local TextLabel89 = Instance.new("TextLabel")
TextLabel89.Size = UDim2.new(1, -24, 1, 0)
TextLabel89.Position = UDim2.new(0, 8, 0, 0)
TextLabel89.BackgroundTransparency = 1
TextLabel89.Text = "None"
TextLabel89.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel89.TextSize = 11
TextLabel89.Font = Enum.Font.ArialBold
TextLabel89.TextXAlignment = Enum.TextXAlignment.Left
TextLabel89.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel89.Parent = TextButton70
local TextLabel90 = Instance.new("TextLabel")
TextLabel90.Size = UDim2.new(0, 16, 1, 0)
TextLabel90.Position = UDim2.new(1, -18, 0, 0)
TextLabel90.BackgroundTransparency = 1
TextLabel90.Text = "▾"
TextLabel90.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel90.TextSize = 12
TextLabel90.Font = Enum.Font.Arial
TextLabel90.Parent = TextButton70
local DropList_AuraType = Instance.new("Frame")
DropList_AuraType.Name = "DropList_Aura Type"
DropList_AuraType.Size = UDim2.new(0, 100, 0, 136)
DropList_AuraType.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_AuraType.BackgroundTransparency = 0.04
DropList_AuraType.BorderSizePixel = 0
DropList_AuraType.Visible = false
DropList_AuraType.ZIndex = 60
DropList_AuraType.Parent = CustomPanelGui
local UICorner127 = Instance.new("UICorner")
UICorner127.CornerRadius = UDim.new(0, 8)
UICorner127.Parent = DropList_AuraType
local UIStroke69 = Instance.new("UIStroke")
UIStroke69.Color = Color3.fromRGB(255, 0, 0)
UIStroke69.Thickness = 1.2
UIStroke69.Transparency = 0.2
UIStroke69.Parent = DropList_AuraType
local Frame120 = Instance.new("Frame")
Frame120.Size = UDim2.new(1, 0, 0, 28)
Frame120.BackgroundTransparency = 1
Frame120.ZIndex = 61
Frame120.Parent = DropList_AuraType
local TextLabel91 = Instance.new("TextLabel")
TextLabel91.Size = UDim2.new(1, -32, 1, 0)
TextLabel91.Position = UDim2.new(0, 8, 0, 0)
TextLabel91.BackgroundTransparency = 1
TextLabel91.Text = "Aura Type"
TextLabel91.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel91.TextSize = 10
TextLabel91.Font = Enum.Font.ArialBold
TextLabel91.TextXAlignment = Enum.TextXAlignment.Left
TextLabel91.ZIndex = 61
TextLabel91.Parent = Frame120
local TextButton71 = Instance.new("TextButton")
TextButton71.Size = UDim2.new(0, 28, 0, 28)
TextButton71.Position = UDim2.new(1, -8, 0.5, 0)
TextButton71.AnchorPoint = Vector2.new(1, 0.5)
TextButton71.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton71.BackgroundTransparency = 0.3
TextButton71.BorderSizePixel = 0
TextButton71.Text = ""
TextButton71.ZIndex = 62
TextButton71.Parent = Frame120
local UICorner128 = Instance.new("UICorner")
UICorner128.CornerRadius = UDim.new(0, 6)
UICorner128.Parent = TextButton71
local UIStroke70 = Instance.new("UIStroke")
UIStroke70.Color = Color3.fromRGB(255, 40, 60)
UIStroke70.Thickness = 1.2
UIStroke70.Transparency = 0.3
UIStroke70.Parent = TextButton71
local ImageLabel35 = Instance.new("ImageLabel")
ImageLabel35.Size = UDim2.new(0, 16, 0, 16)
ImageLabel35.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel35.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel35.BackgroundTransparency = 1
ImageLabel35.ScaleType = Enum.ScaleType.Fit
ImageLabel35.Image = "rbxassetid://116396312853810"
ImageLabel35.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel35.ZIndex = 63
ImageLabel35.Parent = TextButton71

TextButton71.MouseEnter:Connect(function()
	TextButton71.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton71.BackgroundTransparency = 0.1
end)

TextButton71.MouseLeave:Connect(function()
	TextButton71.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton71.BackgroundTransparency = 0.3
end)

local Frame121 = Instance.new("Frame")
Frame121.Size = UDim2.new(1, -8, 0, 1)
Frame121.Position = UDim2.new(0.5, 0, 0, 28)
Frame121.AnchorPoint = Vector2.new(0.5, 0)
Frame121.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame121.BackgroundTransparency = 0.6
Frame121.BorderSizePixel = 0
Frame121.ZIndex = 61
Frame121.Parent = DropList_AuraType
local ScrollingFrame10 = Instance.new("ScrollingFrame")
ScrollingFrame10.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame10.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame10.BackgroundTransparency = 1
ScrollingFrame10.BorderSizePixel = 0
ScrollingFrame10.ScrollBarThickness = 2
ScrollingFrame10.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame10.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame10.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame10.ZIndex = 61
ScrollingFrame10.Parent = DropList_AuraType
local UIListLayout11 = Instance.new("UIListLayout")
UIListLayout11.Padding = UDim.new(0, 2)
UIListLayout11.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout11.Parent = ScrollingFrame10
local UIPadding10 = Instance.new("UIPadding")
UIPadding10.PaddingLeft = UDim.new(0, 4)
UIPadding10.PaddingRight = UDim.new(0, 4)
UIPadding10.PaddingTop = UDim.new(0, 3)
UIPadding10.Parent = ScrollingFrame10
local TextButton72 = Instance.new("TextButton")
TextButton72.Size = UDim2.new(1, 0, 0, 20)
TextButton72.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton72.BackgroundTransparency = 0.3
TextButton72.BorderSizePixel = 0
TextButton72.Text = "None"
TextButton72.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton72.TextSize = 11
TextButton72.Font = Enum.Font.ArialBold
TextButton72.TextTruncate = Enum.TextTruncate.AtEnd
TextButton72.ZIndex = 62
TextButton72.LayoutOrder = 1
TextButton72.Parent = ScrollingFrame10
local UICorner129 = Instance.new("UICorner")
UICorner129.CornerRadius = UDim.new(0, 5)
UICorner129.Parent = TextButton72

TextButton72.MouseEnter:Connect(function()
end)

TextButton72.MouseLeave:Connect(function()
end)

TextButton72.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "None"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	TextLabel90.Text = "▾"
	local tween63 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween63:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton73 = Instance.new("TextButton")
TextButton73.Size = UDim2.new(1, 0, 0, 20)
TextButton73.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton73.BackgroundTransparency = 0.65
TextButton73.BorderSizePixel = 0
TextButton73.Text = "Angel Wings"
TextButton73.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton73.TextSize = 11
TextButton73.Font = Enum.Font.ArialBold
TextButton73.TextTruncate = Enum.TextTruncate.AtEnd
TextButton73.ZIndex = 62
TextButton73.LayoutOrder = 2
TextButton73.Parent = ScrollingFrame10
local UICorner130 = Instance.new("UICorner")
UICorner130.CornerRadius = UDim.new(0, 5)
UICorner130.Parent = TextButton73

TextButton73.MouseEnter:Connect(function()
	TextButton73.BackgroundTransparency = 0.4
	TextButton73.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton73.MouseLeave:Connect(function()
	TextButton73.BackgroundTransparency = 0.65
	TextButton73.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton73.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Angel Wings"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects = game:GetObjects("rbxassetid://97658130917593")
	local children3 = Players.LocalPlayer.Character:GetChildren()

	for i26, v27 in ipairs(children3) do
	end

	local clone = objects[1]:Clone()
	local children4 = clone:GetChildren()

	for i27, v28 in ipairs(children4) do
	end

	clone:Destroy()

	local connection8 = Players.LocalPlayer.CharacterAdded:Connect(function(character11)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween64 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween64:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton74 = Instance.new("TextButton")
TextButton74.Size = UDim2.new(1, 0, 0, 20)
TextButton74.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton74.BackgroundTransparency = 0.65
TextButton74.BorderSizePixel = 0
TextButton74.Text = "Starlight"
TextButton74.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton74.TextSize = 11
TextButton74.Font = Enum.Font.ArialBold
TextButton74.TextTruncate = Enum.TextTruncate.AtEnd
TextButton74.ZIndex = 62
TextButton74.LayoutOrder = 3
TextButton74.Parent = ScrollingFrame10
local UICorner131 = Instance.new("UICorner")
UICorner131.CornerRadius = UDim.new(0, 5)
UICorner131.Parent = TextButton74

TextButton74.MouseEnter:Connect(function()
	TextButton74.BackgroundTransparency = 0.4
	TextButton74.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton74.MouseLeave:Connect(function()
	TextButton74.BackgroundTransparency = 0.65
	TextButton74.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

local function setupConnection(connection, text)
	connection:Disconnect()
	local objects2 = game:GetObjects(text)
	local children5 = Players.LocalPlayer.Character:GetChildren()
	return objects2, children5
end

TextButton74.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Starlight"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects2, children5 = setupConnection(connection8, "rbxassetid://134645216613107")

	for i28, v29 in ipairs(children5) do
	end

	local clone2 = objects2[1]:Clone()
	local children6 = clone2:GetChildren()

	for i29, v30 in ipairs(children6) do
	end

	clone2:Destroy()

	local connection9 = Players.LocalPlayer.CharacterAdded:Connect(function(character12)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween65 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween65:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton75 = Instance.new("TextButton")
TextButton75.Size = UDim2.new(1, 0, 0, 20)
TextButton75.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton75.BackgroundTransparency = 0.65
TextButton75.BorderSizePixel = 0
TextButton75.Text = "Heavenly"
TextButton75.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton75.TextSize = 11
TextButton75.Font = Enum.Font.ArialBold
TextButton75.TextTruncate = Enum.TextTruncate.AtEnd
TextButton75.ZIndex = 62
TextButton75.LayoutOrder = 4
TextButton75.Parent = ScrollingFrame10
local UICorner132 = Instance.new("UICorner")
UICorner132.CornerRadius = UDim.new(0, 5)
UICorner132.Parent = TextButton75

TextButton75.MouseEnter:Connect(function()
	TextButton75.BackgroundTransparency = 0.4
	TextButton75.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton75.MouseLeave:Connect(function()
	TextButton75.BackgroundTransparency = 0.65
	TextButton75.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton75.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Heavenly"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects3, children7 = setupConnection(connection9, "rbxassetid://139300897520961")

	for i30, v31 in ipairs(children7) do
	end

	local clone3 = objects3[1]:Clone()
	local children8 = clone3:GetChildren()

	for i31, v32 in ipairs(children8) do
	end

	clone3:Destroy()

	local connection10 = Players.LocalPlayer.CharacterAdded:Connect(function(character13)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween66 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween66:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton76 = Instance.new("TextButton")
TextButton76.Size = UDim2.new(1, 0, 0, 20)
TextButton76.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton76.BackgroundTransparency = 0.65
TextButton76.BorderSizePixel = 0
TextButton76.Text = "Ribbon"
TextButton76.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton76.TextSize = 11
TextButton76.Font = Enum.Font.ArialBold
TextButton76.TextTruncate = Enum.TextTruncate.AtEnd
TextButton76.ZIndex = 62
TextButton76.LayoutOrder = 5
TextButton76.Parent = ScrollingFrame10
local UICorner133 = Instance.new("UICorner")
UICorner133.CornerRadius = UDim.new(0, 5)
UICorner133.Parent = TextButton76

TextButton76.MouseEnter:Connect(function()
	TextButton76.BackgroundTransparency = 0.4
	TextButton76.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton76.MouseLeave:Connect(function()
	TextButton76.BackgroundTransparency = 0.65
	TextButton76.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton76.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Ribbon"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects4, children9 = setupConnection(connection10, "rbxassetid://132069507632161")

	for i32, v33 in ipairs(children9) do
	end

	local clone4 = objects4[1]:Clone()
	local children10 = clone4:GetChildren()

	for i33, v34 in ipairs(children10) do
	end

	clone4:Destroy()

	local connection11 = Players.LocalPlayer.CharacterAdded:Connect(function(character14)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween67 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween67:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton77 = Instance.new("TextButton")
TextButton77.Size = UDim2.new(1, 0, 0, 20)
TextButton77.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton77.BackgroundTransparency = 0.65
TextButton77.BorderSizePixel = 0
TextButton77.Text = "Sakura"
TextButton77.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton77.TextSize = 11
TextButton77.Font = Enum.Font.ArialBold
TextButton77.TextTruncate = Enum.TextTruncate.AtEnd
TextButton77.ZIndex = 62
TextButton77.LayoutOrder = 6
TextButton77.Parent = ScrollingFrame10
local UICorner134 = Instance.new("UICorner")
UICorner134.CornerRadius = UDim.new(0, 5)
UICorner134.Parent = TextButton77

TextButton77.MouseEnter:Connect(function()
	TextButton77.BackgroundTransparency = 0.4
	TextButton77.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton77.MouseLeave:Connect(function()
	TextButton77.BackgroundTransparency = 0.65
	TextButton77.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton77.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Sakura"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects5, children11 = setupConnection(connection11, "rbxassetid://81755778619404")

	for i34, v35 in ipairs(children11) do
	end

	local clone5 = objects5[1]:Clone()
	local children12 = clone5:GetChildren()

	for i35, v36 in ipairs(children12) do
	end

	clone5:Destroy()

	local connection12 = Players.LocalPlayer.CharacterAdded:Connect(function(character15)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween68 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween68:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton78 = Instance.new("TextButton")
TextButton78.Size = UDim2.new(1, 0, 0, 20)
TextButton78.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton78.BackgroundTransparency = 0.65
TextButton78.BorderSizePixel = 0
TextButton78.Text = "Wind"
TextButton78.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton78.TextSize = 11
TextButton78.Font = Enum.Font.ArialBold
TextButton78.TextTruncate = Enum.TextTruncate.AtEnd
TextButton78.ZIndex = 62
TextButton78.LayoutOrder = 7
TextButton78.Parent = ScrollingFrame10
local UICorner135 = Instance.new("UICorner")
UICorner135.CornerRadius = UDim.new(0, 5)
UICorner135.Parent = TextButton78

TextButton78.MouseEnter:Connect(function()
	TextButton78.BackgroundTransparency = 0.4
	TextButton78.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton78.MouseLeave:Connect(function()
	TextButton78.BackgroundTransparency = 0.65
	TextButton78.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton78.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Wind"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects6, children13 = setupConnection(connection12, "rbxassetid://80694081850877")

	for i36, v37 in ipairs(children13) do
	end

	local clone6 = objects6[1]:Clone()
	local children14 = clone6:GetChildren()

	for i37, v38 in ipairs(children14) do
	end

	clone6:Destroy()

	local connection13 = Players.LocalPlayer.CharacterAdded:Connect(function(character16)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween69 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween69:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton79 = Instance.new("TextButton")
TextButton79.Size = UDim2.new(1, 0, 0, 20)
TextButton79.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton79.BackgroundTransparency = 0.65
TextButton79.BorderSizePixel = 0
TextButton79.Text = "Flow"
TextButton79.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton79.TextSize = 11
TextButton79.Font = Enum.Font.ArialBold
TextButton79.TextTruncate = Enum.TextTruncate.AtEnd
TextButton79.ZIndex = 62
TextButton79.LayoutOrder = 8
TextButton79.Parent = ScrollingFrame10
local UICorner136 = Instance.new("UICorner")
UICorner136.CornerRadius = UDim.new(0, 5)
UICorner136.Parent = TextButton79

TextButton79.MouseEnter:Connect(function()
	TextButton79.BackgroundTransparency = 0.4
	TextButton79.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton79.MouseLeave:Connect(function()
	TextButton79.BackgroundTransparency = 0.65
	TextButton79.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton79.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Flow"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
		{ textButton = TextButton80, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects7, children15 = setupConnection(connection13, "rbxassetid://119913533725648")

	for i38, v39 in ipairs(children15) do
	end

	local clone7 = objects7[1]:Clone()
	local children16 = clone7:GetChildren()

	for i39, v40 in ipairs(children16) do
	end

	clone7:Destroy()

	local connection14 = Players.LocalPlayer.CharacterAdded:Connect(function(character17)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween70 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween70:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

local TextButton80 = Instance.new("TextButton")
TextButton80.Size = UDim2.new(1, 0, 0, 20)
TextButton80.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton80.BackgroundTransparency = 0.65
TextButton80.BorderSizePixel = 0
TextButton80.Text = "Star"
TextButton80.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton80.TextSize = 11
TextButton80.Font = Enum.Font.ArialBold
TextButton80.TextTruncate = Enum.TextTruncate.AtEnd
TextButton80.ZIndex = 62
TextButton80.LayoutOrder = 9
TextButton80.Parent = ScrollingFrame10
local UICorner137 = Instance.new("UICorner")
UICorner137.CornerRadius = UDim.new(0, 5)
UICorner137.Parent = TextButton80

TextButton80.MouseEnter:Connect(function()
	TextButton80.BackgroundTransparency = 0.4
	TextButton80.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton80.MouseLeave:Connect(function()
	TextButton80.BackgroundTransparency = 0.65
	TextButton80.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton80.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel89.Text = "Star"

	for _, item in ipairs({
		{ textButton = TextButton72, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton73, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton74, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton75, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton76, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton77, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton78, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton79, r = 30, g = 30, b = 30, backgroundTransparency = 0.65, r2 = 160 },
		{ textButton = TextButton80, r = 220, g = 20, b = 40, backgroundTransparency = 0.3, r2 = 255 },
	}) do
		item.textButton.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
		item.textButton.BackgroundTransparency = item.backgroundTransparency
		item.textButton.TextColor3 = Color3.fromRGB(item.r2, item.r2, item.r2)
	end

	local objects8, children17 = setupConnection(connection14, "rbxassetid://73754563740680")

	for i40, v41 in ipairs(children17) do
	end

	local clone8 = objects8[1]:Clone()
	local children18 = clone8:GetChildren()

	for i41, v42 in ipairs(children18) do
	end

	clone8:Destroy()

	local connection15 = Players.LocalPlayer.CharacterAdded:Connect(function(character18)
		task.delay(0.8, function()
		end)
	end)

	TextLabel90.Text = "▾"
	local tween71 = TweenService:Create(DropList_AuraType, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween71:Play()
	task.wait(0.15)
	DropList_AuraType.Visible = false
end)

Dropdown_AuraType.Destroying:Connect(function()
	DropList_AuraType:Destroy()
end)

TextButton71.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel90, DropList_AuraType)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child8, parent2)
end)

TextButton70.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_AuraType, 140, TextLabel90, 136)
end)

local function createFrame2(layoutOrder, parent, text, r, g, b, textLabelText, xScale)
	local Frame129 = Instance.new("Frame")
	Frame129.Size = UDim2.new(1, 0, 0, 24)
	Frame129.BackgroundTransparency = 1
	Frame129.LayoutOrder = layoutOrder
	Frame129.ZIndex = 56
	Frame129.Parent = parent
	local TextLabel96 = Instance.new("TextLabel")
	TextLabel96.Size = UDim2.new(0, 12, 1, 0)
	TextLabel96.BackgroundTransparency = 1
	TextLabel96.Text = text
	TextLabel96.TextColor3 = Color3.fromRGB(r, g, b)
	TextLabel96.TextSize = 10
	TextLabel96.Font = Enum.Font.ArialBold
	TextLabel96.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel96.ZIndex = 56
	TextLabel96.Parent = Frame129
	local TextLabel97 = Instance.new("TextLabel")
	TextLabel97.Size = UDim2.new(0, 26, 1, 0)
	TextLabel97.Position = UDim2.new(1, 0, 0, 0)
	TextLabel97.AnchorPoint = Vector2.new(1, 0)
	TextLabel97.BackgroundTransparency = 1
	TextLabel97.Text = textLabelText
	TextLabel97.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel97.TextSize = 10
	TextLabel97.Font = Enum.Font.Code
	TextLabel97.TextXAlignment = Enum.TextXAlignment.Right
	TextLabel97.ZIndex = 56
	TextLabel97.Parent = Frame129
	local Frame130 = Instance.new("Frame")
	Frame130.Size = UDim2.new(1, -44, 0, 6)
	Frame130.Position = UDim2.new(0, 18, 0.5, 0)
	Frame130.AnchorPoint = Vector2.new(0, 0.5)
	Frame130.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Frame130.BorderSizePixel = 0
	Frame130.ZIndex = 56
	Frame130.Parent = Frame129
	local UICorner142 = Instance.new("UICorner")
	UICorner142.CornerRadius = UDim.new(1, 0)
	UICorner142.Parent = Frame130
	local Frame131 = Instance.new("Frame")
	Frame131.Size = UDim2.new(xScale, 0, 1, 0)
	Frame131.BackgroundColor3 = Color3.fromRGB(r, g, b)
	Frame131.BorderSizePixel = 0
	Frame131.ZIndex = 57
	Frame131.Parent = Frame130
	local UICorner143 = Instance.new("UICorner")
	UICorner143.CornerRadius = UDim.new(1, 0)
	UICorner143.Parent = Frame131
	local Frame132 = Instance.new("Frame")
	Frame132.Size = UDim2.new(0, 12, 0, 12)
	Frame132.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame132.Position = UDim2.new(xScale, 0, 0.5, 0)
	Frame132.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame132.BorderSizePixel = 0
	Frame132.ZIndex = 58
	Frame132.Parent = Frame130
	local UICorner144 = Instance.new("UICorner")
	UICorner144.CornerRadius = UDim.new(1, 0)
	UICorner144.Parent = Frame132
	local UIStroke75 = Instance.new("UIStroke")
	UIStroke75.Color = Color3.fromRGB(r, g, b)
	UIStroke75.Thickness = 1.5
	UIStroke75.Parent = Frame132
	local TextButton83 = Instance.new("TextButton")
	TextButton83.Size = UDim2.new(1, 0, 1, 16)
	TextButton83.Position = UDim2.new(0, 0, 0.5, 0)
	TextButton83.AnchorPoint = Vector2.new(0, 0.5)
	TextButton83.BackgroundTransparency = 1
	TextButton83.Text = ""
	TextButton83.ZIndex = 59
	TextButton83.Parent = Frame130

	TextButton83.InputBegan:Connect(function(input25, gameProcessed25)
	end)

	TextButton83.InputEnded:Connect(function(input26, gameProcessed26)
	end)

	UserInputService.InputChanged:Connect(function(input27, gameProcessed27)
	end)

	TextButton83.InputBegan:Connect(function(input28, gameProcessed28)
	end)
end

local function setupFrame2(frame, r, g, b, textLabel, text)
	frame.BackgroundColor3 = Color3.fromRGB(r, g, b)
	textLabel.Text = text
end

local function setupTextLabel2(textLabel, uiStroke, frame)
	textLabel.Text = "▴"
	uiStroke.Color = Color3.fromRGB(255, 0, 0)
	uiStroke.Transparency = 0.2
	frame.Size = UDim2.new(0, 200, 0, 0)
	frame.Position = UDim2.new(0, -200, 0, 4)
	frame.Visible = true
	local tween74 = TweenService:Create(frame, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(0, 200, 0, 142) })
	tween74:Play()
end

local function setupTextLabel3(textLabel, uiStroke, frame)
	textLabel.Text = "▾"
	uiStroke.Color = Color3.fromRGB(60, 60, 60)
	uiStroke.Transparency = 0.4
	local tween75 = TweenService:Create(frame, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 200, 0, 0) })
	tween75:Play()
	task.wait(0.17)
	frame.Visible = false
end

local function createUICorner(layoutOrder, name, text, r, g, b, textLabelText, cpPanel_AuraColorName, textLabelText2, xScale, textLabelText3, xScale2, textLabelText4, xScale3)
	local ColorPicker_AuraColor, UIStroke71 = createFrame(28, layoutOrder, Scroll2)
	ColorPicker_AuraColor.Name = name
	ColorPicker_AuraColor.ClipsDescendants = false
	local TextLabel92 = Instance.new("TextLabel")
	TextLabel92.Size = UDim2.new(0.52, 0, 0, 14)
	TextLabel92.Position = UDim2.new(0, 10, 0, 7)
	TextLabel92.BackgroundTransparency = 1
	TextLabel92.Text = text
	TextLabel92.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel92.TextSize = 11
	TextLabel92.Font = Enum.Font.ArialBold
	TextLabel92.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel92.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel92.Parent = ColorPicker_AuraColor
	local Frame123 = Instance.new("Frame")
	Frame123.Size = UDim2.new(0, 100, 0, 20)
	Frame123.Position = UDim2.new(1, -8, 0.5, 0)
	Frame123.AnchorPoint = Vector2.new(1, 0.5)
	Frame123.BackgroundTransparency = 1
	Frame123.Parent = ColorPicker_AuraColor
	local TextButton81 = Instance.new("TextButton")
	TextButton81.Size = UDim2.new(1, 0, 1, 0)
	TextButton81.BackgroundTransparency = 1
	TextButton81.Text = ""
	TextButton81.ZIndex = 3
	TextButton81.Parent = Frame123
	local Frame124 = Instance.new("Frame")
	Frame124.Size = UDim2.new(0, 26, 0, 26)
	Frame124.Position = UDim2.new(0, 0, 0, 0)
	Frame124.BackgroundColor3 = Color3.fromRGB(r, g, b)
	Frame124.BorderSizePixel = 0
	Frame124.ZIndex = 2
	Frame124.Parent = Frame123
	local UICorner139 = Instance.new("UICorner")
	UICorner139.CornerRadius = UDim.new(0, 6)
	UICorner139.Parent = Frame124
	local UIStroke72 = Instance.new("UIStroke")
	UIStroke72.Color = Color3.fromRGB(255, 255, 255)
	UIStroke72.Thickness = 1.5
	UIStroke72.Transparency = 0.4
	UIStroke72.Parent = Frame124
	local TextLabel93 = Instance.new("TextLabel")
	TextLabel93.Size = UDim2.new(0, 68, 1, 0)
	TextLabel93.Position = UDim2.new(0, 32, 0, 0)
	TextLabel93.BackgroundTransparency = 1
	TextLabel93.Text = textLabelText
	TextLabel93.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel93.TextSize = 11
	TextLabel93.Font = Enum.Font.Code
	TextLabel93.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel93.ZIndex = 2
	TextLabel93.Parent = Frame123
	local TextLabel94 = Instance.new("TextLabel")
	TextLabel94.Size = UDim2.new(0, 14, 1, 0)
	TextLabel94.Position = UDim2.new(1, -14, 0, 0)
	TextLabel94.BackgroundTransparency = 1
	TextLabel94.Text = "▾"
	TextLabel94.TextColor3 = Color3.fromRGB(220, 20, 40)
	TextLabel94.TextSize = 12
	TextLabel94.Font = Enum.Font.Arial
	TextLabel94.ZIndex = 2
	TextLabel94.Parent = Frame123
	local CPPanel_AuraColor = Instance.new("Frame")
	CPPanel_AuraColor.Name = cpPanel_AuraColorName
	CPPanel_AuraColor.Size = UDim2.new(0, 0, 0, 0)
	CPPanel_AuraColor.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
	CPPanel_AuraColor.BackgroundTransparency = 0.06
	CPPanel_AuraColor.BorderSizePixel = 0
	CPPanel_AuraColor.ClipsDescendants = true
	CPPanel_AuraColor.Visible = false
	CPPanel_AuraColor.ZIndex = 55
	CPPanel_AuraColor.Parent = CustomPanelGui
	local UICorner140 = Instance.new("UICorner")
	UICorner140.CornerRadius = UDim.new(0, 8)
	UICorner140.Parent = CPPanel_AuraColor
	local UIStroke73 = Instance.new("UIStroke")
	UIStroke73.Color = Color3.fromRGB(255, 0, 0)
	UIStroke73.Thickness = 1.2
	UIStroke73.Transparency = 0.25
	UIStroke73.Parent = CPPanel_AuraColor
	local Frame126 = Instance.new("Frame")
	Frame126.Size = UDim2.new(1, 0, 0, 28)
	Frame126.BackgroundTransparency = 1
	Frame126.ZIndex = 56
	Frame126.Parent = CPPanel_AuraColor
	local TextLabel95 = Instance.new("TextLabel")
	TextLabel95.Size = UDim2.new(1, -32, 1, 0)
	TextLabel95.Position = UDim2.new(0, 8, 0, 0)
	TextLabel95.BackgroundTransparency = 1
	TextLabel95.Text = text
	TextLabel95.TextColor3 = Color3.fromRGB(220, 20, 40)
	TextLabel95.TextSize = 10
	TextLabel95.Font = Enum.Font.ArialBold
	TextLabel95.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel95.ZIndex = 56
	TextLabel95.Parent = Frame126
	local TextButton82 = Instance.new("TextButton")
	TextButton82.Size = UDim2.new(0, 28, 0, 28)
	TextButton82.Position = UDim2.new(1, -8, 0.5, 0)
	TextButton82.AnchorPoint = Vector2.new(1, 0.5)
	TextButton82.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton82.BackgroundTransparency = 0.3
	TextButton82.BorderSizePixel = 0
	TextButton82.Text = ""
	TextButton82.ZIndex = 57
	TextButton82.Parent = Frame126
	local UICorner141 = Instance.new("UICorner")
	UICorner141.CornerRadius = UDim.new(0, 6)
	UICorner141.Parent = TextButton82
	local UIStroke74 = Instance.new("UIStroke")
	UIStroke74.Color = Color3.fromRGB(255, 40, 60)
	UIStroke74.Thickness = 1.2
	UIStroke74.Transparency = 0.3
	UIStroke74.Parent = TextButton82
	local ImageLabel36 = Instance.new("ImageLabel")
	ImageLabel36.Size = UDim2.new(0, 16, 0, 16)
	ImageLabel36.Position = UDim2.new(0.5, 0, 0.5, 0)
	ImageLabel36.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel36.BackgroundTransparency = 1
	ImageLabel36.ScaleType = Enum.ScaleType.Fit
	ImageLabel36.Image = "rbxassetid://116396312853810"
	ImageLabel36.ImageColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel36.ZIndex = 57
	ImageLabel36.Parent = TextButton82
	local Frame127 = Instance.new("Frame")
	Frame127.Size = UDim2.new(1, -8, 0, 1)
	Frame127.Position = UDim2.new(0.5, 0, 0, 28)
	Frame127.AnchorPoint = Vector2.new(0.5, 0)
	Frame127.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Frame127.BackgroundTransparency = 0.6
	Frame127.BorderSizePixel = 0
	Frame127.ZIndex = 56
	Frame127.Parent = CPPanel_AuraColor
	local Frame128 = Instance.new("Frame")
	Frame128.Size = UDim2.new(1, 0, 1, -28)
	Frame128.Position = UDim2.new(0, 0, 0, 28)
	Frame128.BackgroundTransparency = 1
	Frame128.ZIndex = 56
	Frame128.Parent = CPPanel_AuraColor
	local UIListLayout12 = Instance.new("UIListLayout")
	UIListLayout12.Padding = UDim.new(0, 3)
	UIListLayout12.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout12.Parent = Frame128
	local UIPadding11 = Instance.new("UIPadding")
	UIPadding11.PaddingLeft = UDim.new(0, 8)
	UIPadding11.PaddingRight = UDim.new(0, 8)
	UIPadding11.PaddingTop = UDim.new(0, 5)
	UIPadding11.PaddingBottom = UDim.new(0, 5)
	UIPadding11.Parent = Frame128
	createFrame2(1, Frame128, "R", 220, 60, 60, textLabelText2, xScale)
	createFrame2(2, Frame128, "G", 60, 200, 80, textLabelText3, xScale2)
	createFrame2(3, Frame128, "B", 60, 120, 220, textLabelText4, xScale3)
	local Frame141 = Instance.new("Frame")
	Frame141.Size = UDim2.new(1, 0, 0, 20)
	Frame141.BackgroundTransparency = 1
	Frame141.LayoutOrder = 4
	Frame141.ZIndex = 56
	Frame141.Parent = Frame128
	local UIListLayout13 = Instance.new("UIListLayout")
	UIListLayout13.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout13.Padding = UDim.new(0, 4)
	UIListLayout13.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout13.Parent = Frame141
	local TextButton86 = Instance.new("TextButton")
	TextButton86.Size = UDim2.new(0, 18, 0, 18)
	TextButton86.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton86.BorderSizePixel = 0
	TextButton86.Text = ""
	TextButton86.LayoutOrder = 1
	TextButton86.ZIndex = 57
	TextButton86.Parent = Frame141
	local UICorner151 = Instance.new("UICorner")
	UICorner151.CornerRadius = UDim.new(0, 4)
	UICorner151.Parent = TextButton86

	TextButton86.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 220, 20, 40, TextLabel93, "#DC1428")
	end)

	local TextButton87 = Instance.new("TextButton")
	TextButton87.Size = UDim2.new(0, 18, 0, 18)
	TextButton87.BackgroundColor3 = Color3.fromRGB(255, 120, 0)
	TextButton87.BorderSizePixel = 0
	TextButton87.Text = ""
	TextButton87.LayoutOrder = 2
	TextButton87.ZIndex = 57
	TextButton87.Parent = Frame141
	local UICorner152 = Instance.new("UICorner")
	UICorner152.CornerRadius = UDim.new(0, 4)
	UICorner152.Parent = TextButton87

	TextButton87.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 255, 120, 0, TextLabel93, "#FF7800")
	end)

	local TextButton88 = Instance.new("TextButton")
	TextButton88.Size = UDim2.new(0, 18, 0, 18)
	TextButton88.BackgroundColor3 = Color3.fromRGB(240, 200, 0)
	TextButton88.BorderSizePixel = 0
	TextButton88.Text = ""
	TextButton88.LayoutOrder = 3
	TextButton88.ZIndex = 57
	TextButton88.Parent = Frame141
	local UICorner153 = Instance.new("UICorner")
	UICorner153.CornerRadius = UDim.new(0, 4)
	UICorner153.Parent = TextButton88

	TextButton88.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 240, 200, 0, TextLabel93, "#F0C800")
	end)

	local TextButton89 = Instance.new("TextButton")
	TextButton89.Size = UDim2.new(0, 18, 0, 18)
	TextButton89.BackgroundColor3 = Color3.fromRGB(40, 200, 80)
	TextButton89.BorderSizePixel = 0
	TextButton89.Text = ""
	TextButton89.LayoutOrder = 4
	TextButton89.ZIndex = 57
	TextButton89.Parent = Frame141
	local UICorner154 = Instance.new("UICorner")
	UICorner154.CornerRadius = UDim.new(0, 4)
	UICorner154.Parent = TextButton89

	TextButton89.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 40, 200, 80, TextLabel93, "#28C850")
	end)

	local TextButton90 = Instance.new("TextButton")
	TextButton90.Size = UDim2.new(0, 18, 0, 18)
	TextButton90.BackgroundColor3 = Color3.fromRGB(0, 140, 240)
	TextButton90.BorderSizePixel = 0
	TextButton90.Text = ""
	TextButton90.LayoutOrder = 5
	TextButton90.ZIndex = 57
	TextButton90.Parent = Frame141
	local UICorner155 = Instance.new("UICorner")
	UICorner155.CornerRadius = UDim.new(0, 4)
	UICorner155.Parent = TextButton90

	TextButton90.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 0, 140, 240, TextLabel93, "#008CF0")
	end)

	local TextButton91 = Instance.new("TextButton")
	TextButton91.Size = UDim2.new(0, 18, 0, 18)
	TextButton91.BackgroundColor3 = Color3.fromRGB(150, 60, 230)
	TextButton91.BorderSizePixel = 0
	TextButton91.Text = ""
	TextButton91.LayoutOrder = 6
	TextButton91.ZIndex = 57
	TextButton91.Parent = Frame141
	local UICorner156 = Instance.new("UICorner")
	UICorner156.CornerRadius = UDim.new(0, 4)
	UICorner156.Parent = TextButton91

	TextButton91.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 150, 60, 230, TextLabel93, "#963CE6")
	end)

	local TextButton92 = Instance.new("TextButton")
	TextButton92.Size = UDim2.new(0, 18, 0, 18)
	TextButton92.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
	TextButton92.BorderSizePixel = 0
	TextButton92.Text = ""
	TextButton92.LayoutOrder = 7
	TextButton92.ZIndex = 57
	TextButton92.Parent = Frame141
	local UICorner157 = Instance.new("UICorner")
	UICorner157.CornerRadius = UDim.new(0, 4)
	UICorner157.Parent = TextButton92

	TextButton92.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 240, 240, 240, TextLabel93, "#F0F0F0")
	end)

	local TextButton93 = Instance.new("TextButton")
	TextButton93.Size = UDim2.new(0, 18, 0, 18)
	TextButton93.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	TextButton93.BorderSizePixel = 0
	TextButton93.Text = ""
	TextButton93.LayoutOrder = 8
	TextButton93.ZIndex = 57
	TextButton93.Parent = Frame141
	local UICorner158 = Instance.new("UICorner")
	UICorner158.CornerRadius = UDim.new(0, 4)
	UICorner158.Parent = TextButton93

	TextButton93.MouseButton1Click:Connect(function()
		setupFrame2(Frame124, 60, 60, 60, TextLabel93, "#3C3C3C")
	end)

	TextButton81.MouseButton1Click:Connect(function()
		Sound:Play()
		setupTextLabel2(TextLabel94, UIStroke71, CPPanel_AuraColor)
	end)

	TextButton82.MouseButton1Click:Connect(function()
		Sound:Play()
		setupTextLabel3(TextLabel94, UIStroke71, CPPanel_AuraColor)
	end)

	TextButton82.MouseEnter:Connect(function()
		TextButton82.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
		TextButton82.BackgroundTransparency = 0.1
	end)

	TextButton82.MouseLeave:Connect(function()
		TextButton82.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
		TextButton82.BackgroundTransparency = 0.3
	end)
end

createUICorner(14, "ColorPicker_Aura Color", "Aura Color", 133, 220, 255, "#85DCFF", "CPPanel_Aura Color", "133", 0.52156862745098043, "220", 0.86274509803921573, "255", 1)

local function createTextLabel4(layoutOrder, name, text)
	local Button_ResetAuraColor, UIStroke78 = createFrame(28, layoutOrder, Scroll2)
	Button_ResetAuraColor.Name = name
	local TextLabel102 = Instance.new("TextLabel")
	TextLabel102.Size = UDim2.new(1, -74, 0, 14)
	TextLabel102.Position = UDim2.new(0, 10, 0, 7)
	TextLabel102.BackgroundTransparency = 1
	TextLabel102.Text = text
	TextLabel102.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel102.TextSize = 11
	TextLabel102.Font = Enum.Font.ArialBold
	TextLabel102.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel102.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel102.Parent = Button_ResetAuraColor
	local TextButton94 = Instance.new("TextButton")
	TextButton94.Size = UDim2.new(0, 52, 0, 20)
	TextButton94.Position = UDim2.new(1, -8, 0.5, 0)
	TextButton94.AnchorPoint = Vector2.new(1, 0.5)
	TextButton94.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton94.BackgroundTransparency = 0.1
	TextButton94.BorderSizePixel = 0
	TextButton94.Text = "Run"
	TextButton94.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton94.TextSize = 10
	TextButton94.Font = Enum.Font.ArialBold
	TextButton94.Parent = Button_ResetAuraColor
	local UICorner160 = Instance.new("UICorner")
	UICorner160.CornerRadius = UDim.new(0, 5)
	UICorner160.Parent = TextButton94
	local UIStroke79 = Instance.new("UIStroke")
	UIStroke79.Color = Color3.fromRGB(255, 40, 60)
	UIStroke79.Thickness = 1
	UIStroke79.Transparency = 0.3
	UIStroke79.Parent = TextButton94

	TextButton94.MouseEnter:Connect(function()
		local tween76 = TweenService:Create(TextButton94, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
		tween76:Play()
	end)

	TextButton94.MouseLeave:Connect(function()
		local tween77 = TweenService:Create(TextButton94, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
		tween77:Play()
	end)

	TextButton94.MouseButton1Down:Connect(function(x, y)
		local tween78 = TweenService:Create(TextButton94, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
		tween78:Play()
	end)

	TextButton94.MouseButton1Up:Connect(function()
		local tween79 = TweenService:Create(TextButton94, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
		tween79:Play()
	end)

	TextButton94.MouseButton1Click:Connect(function()
		Sound:Play()
	end)
end

createTextLabel4(13, "Button_Reset Aura Color", "Reset Aura Color")
local Button_RefreshAura, UIStroke80 = createFrame(28, 14, Scroll2)
Button_RefreshAura.Name = "Button_Refresh Aura"
local TextLabel103 = Instance.new("TextLabel")
TextLabel103.Size = UDim2.new(1, -74, 0, 14)
TextLabel103.Position = UDim2.new(0, 10, 0, 7)
TextLabel103.BackgroundTransparency = 1
TextLabel103.Text = "Refresh Aura"
TextLabel103.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel103.TextSize = 11
TextLabel103.Font = Enum.Font.ArialBold
TextLabel103.TextXAlignment = Enum.TextXAlignment.Left
TextLabel103.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel103.Parent = Button_RefreshAura
local TextButton95 = Instance.new("TextButton")
TextButton95.Size = UDim2.new(0, 52, 0, 20)
TextButton95.Position = UDim2.new(1, -8, 0.5, 0)
TextButton95.AnchorPoint = Vector2.new(1, 0.5)
TextButton95.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton95.BackgroundTransparency = 0.1
TextButton95.BorderSizePixel = 0
TextButton95.Text = "Run"
TextButton95.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton95.TextSize = 10
TextButton95.Font = Enum.Font.ArialBold
TextButton95.Parent = Button_RefreshAura
local UICorner162 = Instance.new("UICorner")
UICorner162.CornerRadius = UDim.new(0, 5)
UICorner162.Parent = TextButton95
local UIStroke81 = Instance.new("UIStroke")
UIStroke81.Color = Color3.fromRGB(255, 40, 60)
UIStroke81.Thickness = 1
UIStroke81.Transparency = 0.3
UIStroke81.Parent = TextButton95

TextButton95.MouseEnter:Connect(function()
	local tween80 = TweenService:Create(TextButton95, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
	tween80:Play()
end)

TextButton95.MouseLeave:Connect(function()
	local tween81 = TweenService:Create(TextButton95, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
	tween81:Play()
end)

TextButton95.MouseButton1Down:Connect(function(x2, y2)
	local tween82 = TweenService:Create(TextButton95, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
	tween82:Play()
end)

TextButton95.MouseButton1Up:Connect(function()
	local tween83 = TweenService:Create(TextButton95, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
	tween83:Play()
end)

TextButton95.MouseButton1Click:Connect(function()
	Sound:Play()
	connection15:Disconnect()
	local children19 = Players.LocalPlayer.Character:GetChildren()

	for i42, v43 in ipairs(children19) do
	end

	local clone9 = objects8[1]:Clone()
	local children20 = clone9:GetChildren()

	for i43, v44 in ipairs(children20) do
	end

	clone9:Destroy()

	Players.LocalPlayer.CharacterAdded:Connect(function(character19)
		task.delay(0.8, function()
		end)
	end)
end)

createDivider(15, Scroll2, "Gun Visuals")
local RuzBeamHits = Instance.new("Folder")
RuzBeamHits.Name = "RuzBeamHits"
RuzBeamHits.Parent = workspace

Players.LocalPlayer.CharacterAdded:Connect(function(character2)
	task.delay(0.8, function()
	end)
end)

local Toggle_BeamColorChanger, UIStroke82 = createFrame(28, 16, Scroll2)
Toggle_BeamColorChanger.Name = "Toggle_Beam Color Changer"
local TextLabel105 = Instance.new("TextLabel")
TextLabel105.Size = UDim2.new(1, -72, 0, 14)
TextLabel105.Position = UDim2.new(0, 10, 0, 7)
TextLabel105.BackgroundTransparency = 1
TextLabel105.Text = "Beam Color Changer"
TextLabel105.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel105.TextSize = 11
TextLabel105.Font = Enum.Font.ArialBold
TextLabel105.TextXAlignment = Enum.TextXAlignment.Left
TextLabel105.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel105.Parent = Toggle_BeamColorChanger
local Frame148 = Instance.new("Frame")
Frame148.Size = UDim2.new(0, 34, 0, 18)
Frame148.Position = UDim2.new(1, -44, 0.5, 0)
Frame148.AnchorPoint = Vector2.new(1, 0.5)
Frame148.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame148.BorderSizePixel = 0
Frame148.Parent = Toggle_BeamColorChanger
local UICorner164 = Instance.new("UICorner")
UICorner164.CornerRadius = UDim.new(1, 0)
UICorner164.Parent = Frame148
local Frame149 = Instance.new("Frame")
Frame149.Size = UDim2.new(0, 12, 0, 12)
Frame149.Position = UDim2.new(0, 3, 0.5, 0)
Frame149.AnchorPoint = Vector2.new(0, 0.5)
Frame149.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame149.BorderSizePixel = 0
Frame149.Parent = Frame148
local UICorner165 = Instance.new("UICorner")
UICorner165.CornerRadius = UDim.new(1, 0)
UICorner165.Parent = Frame149
local UIStroke83 = Instance.new("UIStroke")
UIStroke83.Color = Color3.fromRGB(170, 20, 40)
UIStroke83.Thickness = 1.2
UIStroke83.Transparency = 0.3
UIStroke83.Parent = Frame149
local TextButton96 = Instance.new("TextButton")
TextButton96.Size = UDim2.new(1, 0, 1, 0)
TextButton96.BackgroundTransparency = 1
TextButton96.Text = ""
TextButton96.Parent = Toggle_BeamColorChanger

TextButton96.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween84 = TweenService:Create(Frame148, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween84:Play()
	local tween85 = TweenService:Create(Frame149, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween85:Play()
	UIStroke82.Color = Color3.fromRGB(255, 0, 0)
	UIStroke82.Transparency = 0.25

	workspace.DescendantAdded:Connect(function(descendant)
		task.defer(function()
		end)
	end)

	workspace:GetDescendants()
end)

createUICorner(17, "ColorPicker_Beam Color", "Beam Color", 255, 50, 50, "#FF3232", "CPPanel_Beam Color", "255", 1, "50", 0.19607843137254902, "50", 0.19607843137254902)
createFrame3(20, Scroll2, "Toggle_Beam VFX", "Beam VFX")
createTextLabel4(18, "Button_Reset Beam Color", "Reset Beam Color")
local Slider_BeamWidth, UIStroke95 = createFrame(36, 19, Scroll2)
Slider_BeamWidth.Name = "Slider_Beam Width"
local TextLabel118 = Instance.new("TextLabel")
TextLabel118.Size = UDim2.new(0.62, 0, 0, 14)
TextLabel118.Position = UDim2.new(0, 10, 0, 5)
TextLabel118.BackgroundTransparency = 1
TextLabel118.Text = "Beam Width"
TextLabel118.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel118.TextSize = 11
TextLabel118.Font = Enum.Font.ArialBold
TextLabel118.TextXAlignment = Enum.TextXAlignment.Left
TextLabel118.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel118.Parent = Slider_BeamWidth
local TextLabel119 = Instance.new("TextLabel")
TextLabel119.Size = UDim2.new(0.34, 0, 0, 14)
TextLabel119.Position = UDim2.new(0.64, 0, 0, 5)
TextLabel119.BackgroundTransparency = 1
TextLabel119.Text = "10x"
TextLabel119.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel119.TextSize = 10
TextLabel119.Font = Enum.Font.ArialBold
TextLabel119.TextXAlignment = Enum.TextXAlignment.Right
TextLabel119.Parent = Slider_BeamWidth
local Frame175 = Instance.new("Frame")
Frame175.Size = UDim2.new(1, -20, 0, 5)
Frame175.Position = UDim2.new(0, 10, 1, -10)
Frame175.AnchorPoint = Vector2.new(0, 1)
Frame175.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame175.BorderSizePixel = 0
Frame175.Parent = Slider_BeamWidth
local UICorner193 = Instance.new("UICorner")
UICorner193.CornerRadius = UDim.new(1, 0)
UICorner193.Parent = Frame175
local Frame176 = Instance.new("Frame")
Frame176.Size = UDim2.new(0.47368421052631576, 0, 1, 0)
Frame176.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
Frame176.BorderSizePixel = 0
Frame176.Parent = Frame175
local UICorner194 = Instance.new("UICorner")
UICorner194.CornerRadius = UDim.new(1, 0)
UICorner194.Parent = Frame176
local lastFrame2 = Instance.new("Frame")
lastFrame2.Size = UDim2.new(0, 11, 0, 11)
lastFrame2.AnchorPoint = Vector2.new(0.5, 0.5)
lastFrame2.Position = UDim2.new(0.47368421052631576, 0, 0.5, 0)
lastFrame2.BackgroundColor3 = Color3.fromRGB(170, 20, 40)
lastFrame2.BorderSizePixel = 0
lastFrame2.ZIndex = 2
lastFrame2.Parent = Frame175
local UICorner195 = Instance.new("UICorner")
UICorner195.CornerRadius = UDim.new(1, 0)
UICorner195.Parent = lastFrame2
local UIStroke96 = Instance.new("UIStroke")
UIStroke96.Color = Color3.fromRGB(220, 50, 70)
UIStroke96.Thickness = 1.5
UIStroke96.Parent = lastFrame2
local TextButton112 = Instance.new("TextButton")
TextButton112.Size = UDim2.new(1, 0, 1, 24)
TextButton112.Position = UDim2.new(0, 0, 0.5, 0)
TextButton112.AnchorPoint = Vector2.new(0, 0.5)
TextButton112.BackgroundTransparency = 1
TextButton112.Text = ""
TextButton112.ZIndex = 3
TextButton112.Parent = Frame175

TextButton112.InputBegan:Connect(function(input49, gameProcessed49)
end)

TextButton112.InputEnded:Connect(function(input50, gameProcessed50)
end)

UserInputService.InputChanged:Connect(function(input51, gameProcessed51)
end)

TextButton112.InputBegan:Connect(function(input52, gameProcessed52)
end)

local Dropdown_BeamVFXPreset, UIStroke97 = createFrame(28, 21, Scroll2)
Dropdown_BeamVFXPreset.Name = "Dropdown_Beam VFX Preset"
Dropdown_BeamVFXPreset.ClipsDescendants = false
local TextLabel120 = Instance.new("TextLabel")
TextLabel120.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel120.Position = UDim2.new(0, 10, 0, 7)
TextLabel120.BackgroundTransparency = 1
TextLabel120.Text = "Beam VFX Preset"
TextLabel120.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel120.TextSize = 11
TextLabel120.Font = Enum.Font.ArialBold
TextLabel120.TextXAlignment = Enum.TextXAlignment.Left
TextLabel120.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel120.Parent = Dropdown_BeamVFXPreset
local TextButton113 = Instance.new("TextButton")
TextButton113.Size = UDim2.new(0, 100, 0, 20)
TextButton113.Position = UDim2.new(1, -8, 0.5, 0)
TextButton113.AnchorPoint = Vector2.new(1, 0.5)
TextButton113.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton113.BackgroundTransparency = 0.1
TextButton113.BorderSizePixel = 0
TextButton113.Text = ""
TextButton113.Parent = Dropdown_BeamVFXPreset
local UICorner197 = Instance.new("UICorner")
UICorner197.CornerRadius = UDim.new(0, 6)
UICorner197.Parent = TextButton113
local UIStroke98 = Instance.new("UIStroke")
UIStroke98.Color = Color3.fromRGB(60, 60, 60)
UIStroke98.Thickness = 1
UIStroke98.Transparency = 0.2
UIStroke98.Parent = TextButton113
local TextLabel121 = Instance.new("TextLabel")
TextLabel121.Size = UDim2.new(1, -24, 1, 0)
TextLabel121.Position = UDim2.new(0, 8, 0, 0)
TextLabel121.BackgroundTransparency = 1
TextLabel121.Text = "None"
TextLabel121.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel121.TextSize = 11
TextLabel121.Font = Enum.Font.ArialBold
TextLabel121.TextXAlignment = Enum.TextXAlignment.Left
TextLabel121.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel121.Parent = TextButton113
local TextLabel122 = Instance.new("TextLabel")
TextLabel122.Size = UDim2.new(0, 16, 1, 0)
TextLabel122.Position = UDim2.new(1, -18, 0, 0)
TextLabel122.BackgroundTransparency = 1
TextLabel122.Text = "▾"
TextLabel122.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel122.TextSize = 12
TextLabel122.Font = Enum.Font.Arial
TextLabel122.Parent = TextButton113
local DropList_BeamVFXPreset = Instance.new("Frame")
DropList_BeamVFXPreset.Name = "DropList_Beam VFX Preset"
DropList_BeamVFXPreset.Size = UDim2.new(0, 100, 0, 114)
DropList_BeamVFXPreset.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_BeamVFXPreset.BackgroundTransparency = 0.04
DropList_BeamVFXPreset.BorderSizePixel = 0
DropList_BeamVFXPreset.Visible = false
DropList_BeamVFXPreset.ZIndex = 60
DropList_BeamVFXPreset.Parent = CustomPanelGui
local UICorner198 = Instance.new("UICorner")
UICorner198.CornerRadius = UDim.new(0, 8)
UICorner198.Parent = DropList_BeamVFXPreset
local UIStroke99 = Instance.new("UIStroke")
UIStroke99.Color = Color3.fromRGB(255, 0, 0)
UIStroke99.Thickness = 1.2
UIStroke99.Transparency = 0.2
UIStroke99.Parent = DropList_BeamVFXPreset
local Frame180 = Instance.new("Frame")
Frame180.Size = UDim2.new(1, 0, 0, 28)
Frame180.BackgroundTransparency = 1
Frame180.ZIndex = 61
Frame180.Parent = DropList_BeamVFXPreset
local TextLabel123 = Instance.new("TextLabel")
TextLabel123.Size = UDim2.new(1, -32, 1, 0)
TextLabel123.Position = UDim2.new(0, 8, 0, 0)
TextLabel123.BackgroundTransparency = 1
TextLabel123.Text = "Beam VFX Preset"
TextLabel123.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel123.TextSize = 10
TextLabel123.Font = Enum.Font.ArialBold
TextLabel123.TextXAlignment = Enum.TextXAlignment.Left
TextLabel123.ZIndex = 61
TextLabel123.Parent = Frame180
local TextButton114 = Instance.new("TextButton")
TextButton114.Size = UDim2.new(0, 28, 0, 28)
TextButton114.Position = UDim2.new(1, -8, 0.5, 0)
TextButton114.AnchorPoint = Vector2.new(1, 0.5)
TextButton114.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton114.BackgroundTransparency = 0.3
TextButton114.BorderSizePixel = 0
TextButton114.Text = ""
TextButton114.ZIndex = 62
TextButton114.Parent = Frame180
local UICorner199 = Instance.new("UICorner")
UICorner199.CornerRadius = UDim.new(0, 6)
UICorner199.Parent = TextButton114
local UIStroke100 = Instance.new("UIStroke")
UIStroke100.Color = Color3.fromRGB(255, 40, 60)
UIStroke100.Thickness = 1.2
UIStroke100.Transparency = 0.3
UIStroke100.Parent = TextButton114
local ImageLabel38 = Instance.new("ImageLabel")
ImageLabel38.Size = UDim2.new(0, 16, 0, 16)
ImageLabel38.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel38.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel38.BackgroundTransparency = 1
ImageLabel38.ScaleType = Enum.ScaleType.Fit
ImageLabel38.Image = "rbxassetid://116396312853810"
ImageLabel38.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel38.ZIndex = 63
ImageLabel38.Parent = TextButton114

TextButton114.MouseEnter:Connect(function()
	TextButton114.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton114.BackgroundTransparency = 0.1
end)

TextButton114.MouseLeave:Connect(function()
	TextButton114.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton114.BackgroundTransparency = 0.3
end)

local Frame181 = Instance.new("Frame")
Frame181.Size = UDim2.new(1, -8, 0, 1)
Frame181.Position = UDim2.new(0.5, 0, 0, 28)
Frame181.AnchorPoint = Vector2.new(0.5, 0)
Frame181.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame181.BackgroundTransparency = 0.6
Frame181.BorderSizePixel = 0
Frame181.ZIndex = 61
Frame181.Parent = DropList_BeamVFXPreset
local ScrollingFrame11 = Instance.new("ScrollingFrame")
ScrollingFrame11.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame11.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame11.BackgroundTransparency = 1
ScrollingFrame11.BorderSizePixel = 0
ScrollingFrame11.ScrollBarThickness = 2
ScrollingFrame11.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame11.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame11.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame11.ZIndex = 61
ScrollingFrame11.Parent = DropList_BeamVFXPreset
local UIListLayout16 = Instance.new("UIListLayout")
UIListLayout16.Padding = UDim.new(0, 2)
UIListLayout16.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout16.Parent = ScrollingFrame11
local UIPadding13 = Instance.new("UIPadding")
UIPadding13.PaddingLeft = UDim.new(0, 4)
UIPadding13.PaddingRight = UDim.new(0, 4)
UIPadding13.PaddingTop = UDim.new(0, 3)
UIPadding13.Parent = ScrollingFrame11
local TextButton115 = Instance.new("TextButton")
TextButton115.Size = UDim2.new(1, 0, 0, 20)
TextButton115.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton115.BackgroundTransparency = 0.3
TextButton115.BorderSizePixel = 0
TextButton115.Text = "None"
TextButton115.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton115.TextSize = 11
TextButton115.Font = Enum.Font.ArialBold
TextButton115.TextTruncate = Enum.TextTruncate.AtEnd
TextButton115.ZIndex = 62
TextButton115.LayoutOrder = 1
TextButton115.Parent = ScrollingFrame11
local UICorner200 = Instance.new("UICorner")
UICorner200.CornerRadius = UDim.new(0, 5)
UICorner200.Parent = TextButton115

TextButton115.MouseEnter:Connect(function()
end)

TextButton115.MouseLeave:Connect(function()
end)

TextButton115.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel121.Text = "None"
	TextButton115.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton115.BackgroundTransparency = 0.3
	TextButton115.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton116.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton116.BackgroundTransparency = 0.65
	TextButton116.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton117.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton117.BackgroundTransparency = 0.65
	TextButton117.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton118.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton118.BackgroundTransparency = 0.65
	TextButton118.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel122.Text = "▾"
	local tween94 = TweenService:Create(DropList_BeamVFXPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween94:Play()
	task.wait(0.15)
	DropList_BeamVFXPreset.Visible = false
end)

local TextButton116 = Instance.new("TextButton")
TextButton116.Size = UDim2.new(1, 0, 0, 20)
TextButton116.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton116.BackgroundTransparency = 0.65
TextButton116.BorderSizePixel = 0
TextButton116.Text = "Beam 1"
TextButton116.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton116.TextSize = 11
TextButton116.Font = Enum.Font.ArialBold
TextButton116.TextTruncate = Enum.TextTruncate.AtEnd
TextButton116.ZIndex = 62
TextButton116.LayoutOrder = 2
TextButton116.Parent = ScrollingFrame11
local UICorner201 = Instance.new("UICorner")
UICorner201.CornerRadius = UDim.new(0, 5)
UICorner201.Parent = TextButton116

TextButton116.MouseEnter:Connect(function()
	TextButton116.BackgroundTransparency = 0.4
	TextButton116.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton116.MouseLeave:Connect(function()
	TextButton116.BackgroundTransparency = 0.65
	TextButton116.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton116.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel121.Text = "Beam 1"
	TextButton115.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton115.BackgroundTransparency = 0.65
	TextButton115.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton116.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton116.BackgroundTransparency = 0.3
	TextButton116.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton117.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton117.BackgroundTransparency = 0.65
	TextButton117.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton118.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton118.BackgroundTransparency = 0.65
	TextButton118.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel122.Text = "▾"
	local tween95 = TweenService:Create(DropList_BeamVFXPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween95:Play()
	task.wait(0.15)
	DropList_BeamVFXPreset.Visible = false
end)

local TextButton117 = Instance.new("TextButton")
TextButton117.Size = UDim2.new(1, 0, 0, 20)
TextButton117.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton117.BackgroundTransparency = 0.65
TextButton117.BorderSizePixel = 0
TextButton117.Text = "Beam 2"
TextButton117.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton117.TextSize = 11
TextButton117.Font = Enum.Font.ArialBold
TextButton117.TextTruncate = Enum.TextTruncate.AtEnd
TextButton117.ZIndex = 62
TextButton117.LayoutOrder = 3
TextButton117.Parent = ScrollingFrame11
local UICorner202 = Instance.new("UICorner")
UICorner202.CornerRadius = UDim.new(0, 5)
UICorner202.Parent = TextButton117

TextButton117.MouseEnter:Connect(function()
	TextButton117.BackgroundTransparency = 0.4
	TextButton117.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton117.MouseLeave:Connect(function()
	TextButton117.BackgroundTransparency = 0.65
	TextButton117.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton117.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel121.Text = "Beam 2"
	TextButton115.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton115.BackgroundTransparency = 0.65
	TextButton115.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton116.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton116.BackgroundTransparency = 0.65
	TextButton116.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton117.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton117.BackgroundTransparency = 0.3
	TextButton117.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton118.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton118.BackgroundTransparency = 0.65
	TextButton118.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel122.Text = "▾"
	local tween96 = TweenService:Create(DropList_BeamVFXPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween96:Play()
	task.wait(0.15)
	DropList_BeamVFXPreset.Visible = false
end)

local TextButton118 = Instance.new("TextButton")
TextButton118.Size = UDim2.new(1, 0, 0, 20)
TextButton118.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton118.BackgroundTransparency = 0.65
TextButton118.BorderSizePixel = 0
TextButton118.Text = "Beam 3"
TextButton118.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton118.TextSize = 11
TextButton118.Font = Enum.Font.ArialBold
TextButton118.TextTruncate = Enum.TextTruncate.AtEnd
TextButton118.ZIndex = 62
TextButton118.LayoutOrder = 4
TextButton118.Parent = ScrollingFrame11
local UICorner203 = Instance.new("UICorner")
UICorner203.CornerRadius = UDim.new(0, 5)
UICorner203.Parent = TextButton118

TextButton118.MouseEnter:Connect(function()
	TextButton118.BackgroundTransparency = 0.4
	TextButton118.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton118.MouseLeave:Connect(function()
	TextButton118.BackgroundTransparency = 0.65
	TextButton118.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton118.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel121.Text = "Beam 3"
	TextButton115.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton115.BackgroundTransparency = 0.65
	TextButton115.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton116.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton116.BackgroundTransparency = 0.65
	TextButton116.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton117.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton117.BackgroundTransparency = 0.65
	TextButton117.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton118.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton118.BackgroundTransparency = 0.3
	TextButton118.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel122.Text = "▾"
	local tween97 = TweenService:Create(DropList_BeamVFXPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween97:Play()
	task.wait(0.15)
	DropList_BeamVFXPreset.Visible = false
end)

Dropdown_BeamVFXPreset.Destroying:Connect(function()
	DropList_BeamVFXPreset:Destroy()
end)

TextButton114.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel122, DropList_BeamVFXPreset)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child9, parent3)
end)

TextButton113.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_BeamVFXPreset, 118, TextLabel122, 114)
end)

createDivider(22, Scroll2, "Knife Visuals")
local Backpack = Players.LocalPlayer:WaitForChild("Backpack", 5)

Backpack.ChildAdded:Connect(function(child10)
end)

Players.LocalPlayer.ChildAdded:Connect(function(child11)
end)

Players.LocalPlayer.Character.ChildAdded:Connect(function(child12)
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character3)
	local FakeDual = Players.LocalPlayer.Character:FindFirstChild("FakeDual")
	FakeDual:Destroy()

	character3.ChildAdded:Connect(function(child19)
	end)

	task.wait(0.5)
end)

local function tweenFrame3(frame, frame2, uiStroke, childName)
	local tween100 = TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween100:Play()
	local tween101 = TweenService:Create(frame2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween101:Play()
	uiStroke.Color = Color3.fromRGB(255, 0, 0)
	uiStroke.Transparency = 0.25
	local Backpack2 = Players.LocalPlayer:FindFirstChild("Backpack")
	Players.LocalPlayer.Character:FindFirstChild(childName)
	Backpack2:FindFirstChild(childName)
end

local function createTextLabel6(layoutOrder, name, text, textLabelText, childName)
	local Toggle_TwoHandedKnife, UIStroke101 = createFrame(36, layoutOrder, Scroll2)
	Toggle_TwoHandedKnife.Name = name
	local TextLabel125 = Instance.new("TextLabel")
	TextLabel125.Size = UDim2.new(1, -72, 0, 14)
	TextLabel125.Position = UDim2.new(0, 10, 0, 5)
	TextLabel125.BackgroundTransparency = 1
	TextLabel125.Text = text
	TextLabel125.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel125.TextSize = 11
	TextLabel125.Font = Enum.Font.ArialBold
	TextLabel125.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel125.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel125.Parent = Toggle_TwoHandedKnife
	local TextLabel126 = Instance.new("TextLabel")
	TextLabel126.Size = UDim2.new(1, -72, 0, 11)
	TextLabel126.Position = UDim2.new(0, 10, 0, 20)
	TextLabel126.BackgroundTransparency = 1
	TextLabel126.Text = textLabelText
	TextLabel126.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel126.TextSize = 9
	TextLabel126.Font = Enum.Font.Arial
	TextLabel126.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel126.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel126.Parent = Toggle_TwoHandedKnife
	local Frame186 = Instance.new("Frame")
	Frame186.Size = UDim2.new(0, 34, 0, 18)
	Frame186.Position = UDim2.new(1, -44, 0.5, 0)
	Frame186.AnchorPoint = Vector2.new(1, 0.5)
	Frame186.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Frame186.BorderSizePixel = 0
	Frame186.Parent = Toggle_TwoHandedKnife
	local UICorner205 = Instance.new("UICorner")
	UICorner205.CornerRadius = UDim.new(1, 0)
	UICorner205.Parent = Frame186
	local Frame187 = Instance.new("Frame")
	Frame187.Size = UDim2.new(0, 12, 0, 12)
	Frame187.Position = UDim2.new(0, 3, 0.5, 0)
	Frame187.AnchorPoint = Vector2.new(0, 0.5)
	Frame187.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame187.BorderSizePixel = 0
	Frame187.Parent = Frame186
	local UICorner206 = Instance.new("UICorner")
	UICorner206.CornerRadius = UDim.new(1, 0)
	UICorner206.Parent = Frame187
	local UIStroke102 = Instance.new("UIStroke")
	UIStroke102.Color = Color3.fromRGB(170, 20, 40)
	UIStroke102.Thickness = 1.2
	UIStroke102.Transparency = 0.3
	UIStroke102.Parent = Frame187
	local TextButton119 = Instance.new("TextButton")
	TextButton119.Size = UDim2.new(1, 0, 1, 0)
	TextButton119.BackgroundTransparency = 1
	TextButton119.Text = ""
	TextButton119.Parent = Toggle_TwoHandedKnife

	TextButton119.MouseButton1Click:Connect(function()
		Sound:Play()
		tweenFrame3(Frame186, Frame187, UIStroke101, childName)
	end)
end

createTextLabel6(23, "Toggle_Two-Handed Knife", "Two-Handed Knife", "Hold knife with both hands — visual only", "Knife")

Players.LocalPlayer.CharacterAdded:Connect(function(character4)
	local FakeDualGun = Players.LocalPlayer.Character:FindFirstChild("FakeDualGun")
	FakeDualGun:Destroy()

	character4.ChildAdded:Connect(function(child20)
	end)

	task.wait(0.5)
end)

Players.LocalPlayer.Character.ChildAdded:Connect(function(child13)
end)

createTextLabel6(24, "Toggle_Two-Handed Gun", "Two-Handed Gun", "Hold gun with both hands — visual only", "Gun")
createFrame3(25, Scroll2, "Toggle_Custom Shoot Sound", "Custom Shoot Sound")
local Dropdown_ShootSoundPreset, UIStroke107 = createFrame(28, 26, Scroll2)
Dropdown_ShootSoundPreset.Name = "Dropdown_Shoot Sound Preset"
Dropdown_ShootSoundPreset.ClipsDescendants = false
local TextLabel130 = Instance.new("TextLabel")
TextLabel130.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel130.Position = UDim2.new(0, 10, 0, 7)
TextLabel130.BackgroundTransparency = 1
TextLabel130.Text = "Shoot Sound Preset"
TextLabel130.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel130.TextSize = 11
TextLabel130.Font = Enum.Font.ArialBold
TextLabel130.TextXAlignment = Enum.TextXAlignment.Left
TextLabel130.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel130.Parent = Dropdown_ShootSoundPreset
local TextButton122 = Instance.new("TextButton")
TextButton122.Size = UDim2.new(0, 100, 0, 20)
TextButton122.Position = UDim2.new(1, -8, 0.5, 0)
TextButton122.AnchorPoint = Vector2.new(1, 0.5)
TextButton122.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton122.BackgroundTransparency = 0.1
TextButton122.BorderSizePixel = 0
TextButton122.Text = ""
TextButton122.Parent = Dropdown_ShootSoundPreset
local UICorner214 = Instance.new("UICorner")
UICorner214.CornerRadius = UDim.new(0, 6)
UICorner214.Parent = TextButton122
local UIStroke108 = Instance.new("UIStroke")
UIStroke108.Color = Color3.fromRGB(60, 60, 60)
UIStroke108.Thickness = 1
UIStroke108.Transparency = 0.2
UIStroke108.Parent = TextButton122
local TextLabel131 = Instance.new("TextLabel")
TextLabel131.Size = UDim2.new(1, -24, 1, 0)
TextLabel131.Position = UDim2.new(0, 8, 0, 0)
TextLabel131.BackgroundTransparency = 1
TextLabel131.Text = "None"
TextLabel131.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel131.TextSize = 11
TextLabel131.Font = Enum.Font.ArialBold
TextLabel131.TextXAlignment = Enum.TextXAlignment.Left
TextLabel131.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel131.Parent = TextButton122
local TextLabel132 = Instance.new("TextLabel")
TextLabel132.Size = UDim2.new(0, 16, 1, 0)
TextLabel132.Position = UDim2.new(1, -18, 0, 0)
TextLabel132.BackgroundTransparency = 1
TextLabel132.Text = "▾"
TextLabel132.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel132.TextSize = 12
TextLabel132.Font = Enum.Font.Arial
TextLabel132.Parent = TextButton122
local DropList_ShootSoundPreset = Instance.new("Frame")
DropList_ShootSoundPreset.Name = "DropList_Shoot Sound Preset"
DropList_ShootSoundPreset.Size = UDim2.new(0, 100, 0, 114)
DropList_ShootSoundPreset.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_ShootSoundPreset.BackgroundTransparency = 0.04
DropList_ShootSoundPreset.BorderSizePixel = 0
DropList_ShootSoundPreset.Visible = false
DropList_ShootSoundPreset.ZIndex = 60
DropList_ShootSoundPreset.Parent = CustomPanelGui
local UICorner215 = Instance.new("UICorner")
UICorner215.CornerRadius = UDim.new(0, 8)
UICorner215.Parent = DropList_ShootSoundPreset
local UIStroke109 = Instance.new("UIStroke")
UIStroke109.Color = Color3.fromRGB(255, 0, 0)
UIStroke109.Thickness = 1.2
UIStroke109.Transparency = 0.2
UIStroke109.Parent = DropList_ShootSoundPreset
local Frame196 = Instance.new("Frame")
Frame196.Size = UDim2.new(1, 0, 0, 28)
Frame196.BackgroundTransparency = 1
Frame196.ZIndex = 61
Frame196.Parent = DropList_ShootSoundPreset
local TextLabel133 = Instance.new("TextLabel")
TextLabel133.Size = UDim2.new(1, -32, 1, 0)
TextLabel133.Position = UDim2.new(0, 8, 0, 0)
TextLabel133.BackgroundTransparency = 1
TextLabel133.Text = "Shoot Sound Preset"
TextLabel133.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel133.TextSize = 10
TextLabel133.Font = Enum.Font.ArialBold
TextLabel133.TextXAlignment = Enum.TextXAlignment.Left
TextLabel133.ZIndex = 61
TextLabel133.Parent = Frame196
local TextButton123 = Instance.new("TextButton")
TextButton123.Size = UDim2.new(0, 28, 0, 28)
TextButton123.Position = UDim2.new(1, -8, 0.5, 0)
TextButton123.AnchorPoint = Vector2.new(1, 0.5)
TextButton123.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton123.BackgroundTransparency = 0.3
TextButton123.BorderSizePixel = 0
TextButton123.Text = ""
TextButton123.ZIndex = 62
TextButton123.Parent = Frame196
local UICorner216 = Instance.new("UICorner")
UICorner216.CornerRadius = UDim.new(0, 6)
UICorner216.Parent = TextButton123
local UIStroke110 = Instance.new("UIStroke")
UIStroke110.Color = Color3.fromRGB(255, 40, 60)
UIStroke110.Thickness = 1.2
UIStroke110.Transparency = 0.3
UIStroke110.Parent = TextButton123
local ImageLabel39 = Instance.new("ImageLabel")
ImageLabel39.Size = UDim2.new(0, 16, 0, 16)
ImageLabel39.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel39.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel39.BackgroundTransparency = 1
ImageLabel39.ScaleType = Enum.ScaleType.Fit
ImageLabel39.Image = "rbxassetid://116396312853810"
ImageLabel39.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel39.ZIndex = 63
ImageLabel39.Parent = TextButton123

TextButton123.MouseEnter:Connect(function()
	TextButton123.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton123.BackgroundTransparency = 0.1
end)

TextButton123.MouseLeave:Connect(function()
	TextButton123.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton123.BackgroundTransparency = 0.3
end)

local Frame197 = Instance.new("Frame")
Frame197.Size = UDim2.new(1, -8, 0, 1)
Frame197.Position = UDim2.new(0.5, 0, 0, 28)
Frame197.AnchorPoint = Vector2.new(0.5, 0)
Frame197.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame197.BackgroundTransparency = 0.6
Frame197.BorderSizePixel = 0
Frame197.ZIndex = 61
Frame197.Parent = DropList_ShootSoundPreset
local ScrollingFrame12 = Instance.new("ScrollingFrame")
ScrollingFrame12.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame12.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame12.BackgroundTransparency = 1
ScrollingFrame12.BorderSizePixel = 0
ScrollingFrame12.ScrollBarThickness = 2
ScrollingFrame12.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame12.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame12.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame12.ZIndex = 61
ScrollingFrame12.Parent = DropList_ShootSoundPreset
local UIListLayout17 = Instance.new("UIListLayout")
UIListLayout17.Padding = UDim.new(0, 2)
UIListLayout17.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout17.Parent = ScrollingFrame12
local UIPadding14 = Instance.new("UIPadding")
UIPadding14.PaddingLeft = UDim.new(0, 4)
UIPadding14.PaddingRight = UDim.new(0, 4)
UIPadding14.PaddingTop = UDim.new(0, 3)
UIPadding14.Parent = ScrollingFrame12
local TextButton124 = Instance.new("TextButton")
TextButton124.Size = UDim2.new(1, 0, 0, 20)
TextButton124.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton124.BackgroundTransparency = 0.3
TextButton124.BorderSizePixel = 0
TextButton124.Text = "None"
TextButton124.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton124.TextSize = 11
TextButton124.Font = Enum.Font.ArialBold
TextButton124.TextTruncate = Enum.TextTruncate.AtEnd
TextButton124.ZIndex = 62
TextButton124.LayoutOrder = 1
TextButton124.Parent = ScrollingFrame12
local UICorner217 = Instance.new("UICorner")
UICorner217.CornerRadius = UDim.new(0, 5)
UICorner217.Parent = TextButton124

TextButton124.MouseEnter:Connect(function()
end)

TextButton124.MouseLeave:Connect(function()
end)

TextButton124.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel131.Text = "None"
	TextButton124.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton124.BackgroundTransparency = 0.3
	TextButton124.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton125.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton125.BackgroundTransparency = 0.65
	TextButton125.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton126.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton126.BackgroundTransparency = 0.65
	TextButton126.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton127.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton127.BackgroundTransparency = 0.65
	TextButton127.TextColor3 = Color3.fromRGB(160, 160, 160)
	task.wait(0.1)
	TextLabel132.Text = "▾"
	local tween106 = TweenService:Create(DropList_ShootSoundPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween106:Play()
	task.wait(0.15)
	DropList_ShootSoundPreset.Visible = false
end)

local TextButton125 = Instance.new("TextButton")
TextButton125.Size = UDim2.new(1, 0, 0, 20)
TextButton125.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton125.BackgroundTransparency = 0.65
TextButton125.BorderSizePixel = 0
TextButton125.Text = "Raygun"
TextButton125.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton125.TextSize = 11
TextButton125.Font = Enum.Font.ArialBold
TextButton125.TextTruncate = Enum.TextTruncate.AtEnd
TextButton125.ZIndex = 62
TextButton125.LayoutOrder = 2
TextButton125.Parent = ScrollingFrame12
local UICorner218 = Instance.new("UICorner")
UICorner218.CornerRadius = UDim.new(0, 5)
UICorner218.Parent = TextButton125

TextButton125.MouseEnter:Connect(function()
	TextButton125.BackgroundTransparency = 0.4
	TextButton125.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton125.MouseLeave:Connect(function()
	TextButton125.BackgroundTransparency = 0.65
	TextButton125.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

local function helper(v)
	local result26 = v.Name:lower()
	result26:find("reload")
end

local function onDescendantAdded()
	SoundService:GetDescendants()

	local connection16 = workspace.DescendantAdded:Connect(function(descendant2)
		helper(descendant2)
		descendant2.Volume = 0
	end)

	return connection16
end

TextButton125.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel131.Text = "Raygun"
	TextButton124.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton124.BackgroundTransparency = 0.65
	TextButton124.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton125.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton125.BackgroundTransparency = 0.3
	TextButton125.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton126.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton126.BackgroundTransparency = 0.65
	TextButton126.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton127.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton127.BackgroundTransparency = 0.65
	TextButton127.TextColor3 = Color3.fromRGB(160, 160, 160)
	task.wait(0.1)
	workspace:GetDescendants()
	local descendants24 = Players.LocalPlayer.Character:GetDescendants()

	for i44, v45 in ipairs(descendants24) do
		helper(v45)
		v45.Volume = 0
	end

	local descendants25 = Players.LocalPlayer.PlayerGui:GetDescendants()

	for i45, v46 in ipairs(descendants25) do
		helper(v46)
		v46.Volume = 0
	end

	local connection16 = onDescendantAdded()
	TextLabel132.Text = "▾"
	local tween107 = TweenService:Create(DropList_ShootSoundPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween107:Play()
	task.wait(0.15)
	DropList_ShootSoundPreset.Visible = false
end)

local TextButton126 = Instance.new("TextButton")
TextButton126.Size = UDim2.new(1, 0, 0, 20)
TextButton126.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton126.BackgroundTransparency = 0.65
TextButton126.BorderSizePixel = 0
TextButton126.Text = "Magical"
TextButton126.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton126.TextSize = 11
TextButton126.Font = Enum.Font.ArialBold
TextButton126.TextTruncate = Enum.TextTruncate.AtEnd
TextButton126.ZIndex = 62
TextButton126.LayoutOrder = 3
TextButton126.Parent = ScrollingFrame12
local UICorner219 = Instance.new("UICorner")
UICorner219.CornerRadius = UDim.new(0, 5)
UICorner219.Parent = TextButton126

TextButton126.MouseEnter:Connect(function()
	TextButton126.BackgroundTransparency = 0.4
	TextButton126.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton126.MouseLeave:Connect(function()
	TextButton126.BackgroundTransparency = 0.65
	TextButton126.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

local function setupV5(v, v2, connection)
	v.Volume = v.Volume
	v2.Volume = v2.Volume
	connection:Disconnect()
end

TextButton126.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel131.Text = "Magical"
	TextButton124.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton124.BackgroundTransparency = 0.65
	TextButton124.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton125.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton125.BackgroundTransparency = 0.65
	TextButton125.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton126.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton126.BackgroundTransparency = 0.3
	TextButton126.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton127.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton127.BackgroundTransparency = 0.65
	TextButton127.TextColor3 = Color3.fromRGB(160, 160, 160)
	setupV5(v46, v45, connection16)
	task.wait(0.1)
	workspace:GetDescendants()
	local descendants26 = Players.LocalPlayer.Character:GetDescendants()

	for i46, v47 in ipairs(descendants26) do
		helper(v47)
		v47.Volume = 0
	end

	local descendants27 = Players.LocalPlayer.PlayerGui:GetDescendants()

	for i47, v48 in ipairs(descendants27) do
		helper(v48)
		v48.Volume = 0
	end

	local connection17 = onDescendantAdded()
	TextLabel132.Text = "▾"
	local tween108 = TweenService:Create(DropList_ShootSoundPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween108:Play()
	task.wait(0.15)
	DropList_ShootSoundPreset.Visible = false
end)

local TextButton127 = Instance.new("TextButton")
TextButton127.Size = UDim2.new(1, 0, 0, 20)
TextButton127.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton127.BackgroundTransparency = 0.65
TextButton127.BorderSizePixel = 0
TextButton127.Text = "GingerScope"
TextButton127.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton127.TextSize = 11
TextButton127.Font = Enum.Font.ArialBold
TextButton127.TextTruncate = Enum.TextTruncate.AtEnd
TextButton127.ZIndex = 62
TextButton127.LayoutOrder = 4
TextButton127.Parent = ScrollingFrame12
local UICorner220 = Instance.new("UICorner")
UICorner220.CornerRadius = UDim.new(0, 5)
UICorner220.Parent = TextButton127

TextButton127.MouseEnter:Connect(function()
	TextButton127.BackgroundTransparency = 0.4
	TextButton127.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton127.MouseLeave:Connect(function()
	TextButton127.BackgroundTransparency = 0.65
	TextButton127.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton127.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel131.Text = "GingerScope"
	TextButton124.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton124.BackgroundTransparency = 0.65
	TextButton124.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton125.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton125.BackgroundTransparency = 0.65
	TextButton125.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton126.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton126.BackgroundTransparency = 0.65
	TextButton126.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton127.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton127.BackgroundTransparency = 0.3
	TextButton127.TextColor3 = Color3.fromRGB(255, 255, 255)
	setupV5(v47, v48, connection17)
	task.wait(0.1)
	workspace:GetDescendants()
	local descendants28 = Players.LocalPlayer.Character:GetDescendants()

	for i48, v49 in ipairs(descendants28) do
		helper(v49)
		v49.Volume = 0
	end

	local descendants29 = Players.LocalPlayer.PlayerGui:GetDescendants()

	for i49, v50 in ipairs(descendants29) do
		helper(v50)
		v50.Volume = 0
	end

	SoundService:GetDescendants()

	workspace.DescendantAdded:Connect(function(descendant4)
		helper(descendant4)
		descendant4.Volume = 0
	end)

	TextLabel132.Text = "▾"
	local tween109 = TweenService:Create(DropList_ShootSoundPreset, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween109:Play()
	task.wait(0.15)
	DropList_ShootSoundPreset.Visible = false
end)

Dropdown_ShootSoundPreset.Destroying:Connect(function()
	DropList_ShootSoundPreset:Destroy()
end)

TextButton123.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel132, DropList_ShootSoundPreset)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child14, parent4)
end)

TextButton122.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_ShootSoundPreset, 118, TextLabel132, 114)
end)

local Toggle_OldGunEquipSound, UIStroke111 = createFrame(36, 27, Scroll2)
Toggle_OldGunEquipSound.Name = "Toggle_Old Gun Equip Sound"
local TextLabel134 = Instance.new("TextLabel")
TextLabel134.Size = UDim2.new(1, -72, 0, 14)
TextLabel134.Position = UDim2.new(0, 10, 0, 5)
TextLabel134.BackgroundTransparency = 1
TextLabel134.Text = "Old Gun Equip Sound"
TextLabel134.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel134.TextSize = 11
TextLabel134.Font = Enum.Font.ArialBold
TextLabel134.TextXAlignment = Enum.TextXAlignment.Left
TextLabel134.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel134.Parent = Toggle_OldGunEquipSound
local TextLabel135 = Instance.new("TextLabel")
TextLabel135.Size = UDim2.new(1, -72, 0, 11)
TextLabel135.Position = UDim2.new(0, 10, 0, 20)
TextLabel135.BackgroundTransparency = 1
TextLabel135.Text = "Play classic equip sound on tool equip"
TextLabel135.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel135.TextSize = 9
TextLabel135.Font = Enum.Font.Arial
TextLabel135.TextXAlignment = Enum.TextXAlignment.Left
TextLabel135.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel135.Parent = Toggle_OldGunEquipSound
local Frame199 = Instance.new("Frame")
Frame199.Size = UDim2.new(0, 34, 0, 18)
Frame199.Position = UDim2.new(1, -44, 0.5, 0)
Frame199.AnchorPoint = Vector2.new(1, 0.5)
Frame199.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame199.BorderSizePixel = 0
Frame199.Parent = Toggle_OldGunEquipSound
local UICorner222 = Instance.new("UICorner")
UICorner222.CornerRadius = UDim.new(1, 0)
UICorner222.Parent = Frame199
local Frame200 = Instance.new("Frame")
Frame200.Size = UDim2.new(0, 12, 0, 12)
Frame200.Position = UDim2.new(0, 3, 0.5, 0)
Frame200.AnchorPoint = Vector2.new(0, 0.5)
Frame200.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame200.BorderSizePixel = 0
Frame200.Parent = Frame199
local UICorner223 = Instance.new("UICorner")
UICorner223.CornerRadius = UDim.new(1, 0)
UICorner223.Parent = Frame200
local UIStroke112 = Instance.new("UIStroke")
UIStroke112.Color = Color3.fromRGB(170, 20, 40)
UIStroke112.Thickness = 1.2
UIStroke112.Transparency = 0.3
UIStroke112.Parent = Frame200
local TextButton128 = Instance.new("TextButton")
TextButton128.Size = UDim2.new(1, 0, 1, 0)
TextButton128.BackgroundTransparency = 1
TextButton128.Text = ""
TextButton128.Parent = Toggle_OldGunEquipSound

local function onEquipped(v, sound)
	local connection18 = v.Equipped:Connect(function()
		sound:Play()
	end)

	return connection18
end

local function setupV3(v, sound)
	v.Equipped:Connect(function()
		sound:Play()
	end)
end

TextButton128.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween112 = TweenService:Create(Frame199, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween112:Play()
	local tween113 = TweenService:Create(Frame200, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween113:Play()
	UIStroke111.Color = Color3.fromRGB(255, 0, 0)
	UIStroke111.Transparency = 0.25
	local HumanoidRootPart2 = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart", 5)
	local Sound4 = Instance.new("Sound")
	Sound4.SoundId = "rbxassetid://99050406637477"
	Sound4.Volume = 0.8
	Sound4.RollOffMaxDistance = 60
	Sound4.Parent = HumanoidRootPart2
	local Backpack4 = Players.LocalPlayer:FindFirstChild("Backpack")
	local children21 = Backpack4:GetChildren()

	for i50, v51 in ipairs(children21) do
		local connection18 = onEquipped(v51, Sound4)
	end

	local connection19 = Backpack4.ChildAdded:Connect(function(child21)
		local connection24 = onEquipped(child21, Sound5)
	end)

	local connection20 = Players.LocalPlayer.Character.ChildAdded:Connect(function(child22)
		local connection25 = onEquipped(child22, Sound5)
	end)

	Players.LocalPlayer.CharacterAdded:Connect(function(character20)
		task.wait(0.5)
		connection18:Disconnect()
		connection19:Disconnect()
		connection20:Disconnect()
		connection24:Disconnect()
		connection25:Disconnect()
		Sound4:Destroy()
		local HumanoidRootPart4 = character20:WaitForChild("HumanoidRootPart", 5)
		local Sound5 = Instance.new("Sound")
		Sound5.SoundId = "rbxassetid://99050406637477"
		Sound5.Volume = 0.8
		Sound5.RollOffMaxDistance = 60
		Sound5.Parent = HumanoidRootPart4
		local Backpack5 = Players.LocalPlayer:FindFirstChild("Backpack")
		local children25 = Backpack5:GetChildren()

		for i58, v60 in ipairs(children25) do
			setupV3(v60, Sound5)
		end

		Backpack5.ChildAdded:Connect(function(child27)
			setupV3(child27, Sound5)
		end)

		character20.ChildAdded:Connect(function(child28)
			setupV3(child28, Sound5)
		end)
	end)
end)

local Toggle_NoReloadAnimation, UIStroke113 = createFrame(36, 28, Scroll2)
Toggle_NoReloadAnimation.Name = "Toggle_No Reload Animation"
local TextLabel136 = Instance.new("TextLabel")
TextLabel136.Size = UDim2.new(1, -72, 0, 14)
TextLabel136.Position = UDim2.new(0, 10, 0, 5)
TextLabel136.BackgroundTransparency = 1
TextLabel136.Text = "No Reload Animation"
TextLabel136.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel136.TextSize = 11
TextLabel136.Font = Enum.Font.ArialBold
TextLabel136.TextXAlignment = Enum.TextXAlignment.Left
TextLabel136.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel136.Parent = Toggle_NoReloadAnimation
local TextLabel137 = Instance.new("TextLabel")
TextLabel137.Size = UDim2.new(1, -72, 0, 11)
TextLabel137.Position = UDim2.new(0, 10, 0, 20)
TextLabel137.BackgroundTransparency = 1
TextLabel137.Text = "Block weapon reload/equip animations"
TextLabel137.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel137.TextSize = 9
TextLabel137.Font = Enum.Font.Arial
TextLabel137.TextXAlignment = Enum.TextXAlignment.Left
TextLabel137.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel137.Parent = Toggle_NoReloadAnimation
local Frame202 = Instance.new("Frame")
Frame202.Size = UDim2.new(0, 34, 0, 18)
Frame202.Position = UDim2.new(1, -44, 0.5, 0)
Frame202.AnchorPoint = Vector2.new(1, 0.5)
Frame202.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame202.BorderSizePixel = 0
Frame202.Parent = Toggle_NoReloadAnimation
local UICorner225 = Instance.new("UICorner")
UICorner225.CornerRadius = UDim.new(1, 0)
UICorner225.Parent = Frame202
local Frame203 = Instance.new("Frame")
Frame203.Size = UDim2.new(0, 12, 0, 12)
Frame203.Position = UDim2.new(0, 3, 0.5, 0)
Frame203.AnchorPoint = Vector2.new(0, 0.5)
Frame203.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame203.BorderSizePixel = 0
Frame203.Parent = Frame202
local UICorner226 = Instance.new("UICorner")
UICorner226.CornerRadius = UDim.new(1, 0)
UICorner226.Parent = Frame203
local UIStroke114 = Instance.new("UIStroke")
UIStroke114.Color = Color3.fromRGB(170, 20, 40)
UIStroke114.Thickness = 1.2
UIStroke114.Transparency = 0.3
UIStroke114.Parent = Frame203
local TextButton129 = Instance.new("TextButton")
TextButton129.Size = UDim2.new(1, 0, 1, 0)
TextButton129.BackgroundTransparency = 1
TextButton129.Text = ""
TextButton129.Parent = Toggle_NoReloadAnimation

TextButton129.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween114 = TweenService:Create(Frame202, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween114:Play()
	local tween115 = TweenService:Create(Frame203, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween115:Play()
	UIStroke113.Color = Color3.fromRGB(255, 0, 0)
	UIStroke113.Transparency = 0.25
	local Humanoid2 = Players.LocalPlayer.Character:WaitForChild("Humanoid", 5)
	local Animator = Humanoid2:WaitForChild("Animator", 5)

	local connection21 = Animator.AnimationPlayed:Connect(function()
	end)

	Players.LocalPlayer.CharacterAdded:Connect(function(character21)
		task.wait(0.5)
		connection21:Disconnect()
		local Humanoid7 = character21:WaitForChild("Humanoid", 5)
		local Animator2 = Humanoid7:WaitForChild("Animator", 5)

		Animator2.AnimationPlayed:Connect(function()
		end)
	end)
end)

createDivider(30, Scroll2, "Environment")
local Toggle_StretchScreen, UIStroke115 = createFrame(36, 33, Scroll2)
Toggle_StretchScreen.Name = "Toggle_Stretch Screen"
local TextLabel139 = Instance.new("TextLabel")
TextLabel139.Size = UDim2.new(1, -72, 0, 14)
TextLabel139.Position = UDim2.new(0, 10, 0, 5)
TextLabel139.BackgroundTransparency = 1
TextLabel139.Text = "Stretch Screen"
TextLabel139.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel139.TextSize = 11
TextLabel139.Font = Enum.Font.ArialBold
TextLabel139.TextXAlignment = Enum.TextXAlignment.Left
TextLabel139.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel139.Parent = Toggle_StretchScreen
local TextLabel140 = Instance.new("TextLabel")
TextLabel140.Size = UDim2.new(1, -72, 0, 11)
TextLabel140.Position = UDim2.new(0, 10, 0, 20)
TextLabel140.BackgroundTransparency = 1
TextLabel140.Text = "Squished widescreen look — adjust with slider below"
TextLabel140.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel140.TextSize = 9
TextLabel140.Font = Enum.Font.Arial
TextLabel140.TextXAlignment = Enum.TextXAlignment.Left
TextLabel140.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel140.Parent = Toggle_StretchScreen
local Frame208 = Instance.new("Frame")
Frame208.Size = UDim2.new(0, 34, 0, 18)
Frame208.Position = UDim2.new(1, -44, 0.5, 0)
Frame208.AnchorPoint = Vector2.new(1, 0.5)
Frame208.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame208.BorderSizePixel = 0
Frame208.Parent = Toggle_StretchScreen
local UICorner228 = Instance.new("UICorner")
UICorner228.CornerRadius = UDim.new(1, 0)
UICorner228.Parent = Frame208
local Frame209 = Instance.new("Frame")
Frame209.Size = UDim2.new(0, 12, 0, 12)
Frame209.Position = UDim2.new(0, 3, 0.5, 0)
Frame209.AnchorPoint = Vector2.new(0, 0.5)
Frame209.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame209.BorderSizePixel = 0
Frame209.Parent = Frame208
local UICorner229 = Instance.new("UICorner")
UICorner229.CornerRadius = UDim.new(1, 0)
UICorner229.Parent = Frame209
local UIStroke116 = Instance.new("UIStroke")
UIStroke116.Color = Color3.fromRGB(170, 20, 40)
UIStroke116.Thickness = 1.2
UIStroke116.Transparency = 0.3
UIStroke116.Parent = Frame209
local TextButton130 = Instance.new("TextButton")
TextButton130.Size = UDim2.new(1, 0, 1, 0)
TextButton130.BackgroundTransparency = 1
TextButton130.Text = ""
TextButton130.Parent = Toggle_StretchScreen

TextButton130.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween116 = TweenService:Create(Frame208, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween116:Play()
	local tween117 = TweenService:Create(Frame209, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween117:Play()
	UIStroke115.Color = Color3.fromRGB(255, 0, 0)
	UIStroke115.Transparency = 0.25

	RunService.RenderStepped:Connect(function(deltaTime13)
		workspace.CurrentCamera.FieldOfView = 120
	end)
end)

createTextLabel(34, Scroll2, "Slider_Stretch Amount", "Stretch Amount", "65%", "65% = squished widescreen, 100% = normal", 0.1875)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function destroyRuzHL(player2)
	local RuzHL = player2.Character:FindFirstChild("RuzHL")
	RuzHL:Destroy()
end

local function destroyRuzCB(player2)
	local RuzCB = player2.Character:FindFirstChild("RuzCB")
	RuzCB:Destroy()
	local child = Players.LocalPlayer.PlayerGui:FindFirstChild("RuzCB_" .. player2.Character.Name)
	child:Destroy()
end

local function helper3(player2)
	destroyRuzHL(player2)
	destroyRuzCB(player2)
end

Players.PlayerRemoving:Connect(function(player)
	helper3(player)
end)

local players = Players:GetPlayers()

for i, v in ipairs(players) do
	v.CharacterAdded:Connect(function(character5)
		helper3(v)
	end)
end

Players.PlayerAdded:Connect(function(player2)
	player2.CharacterAdded:Connect(function(character22)
		task.defer(function()
		end)
	end)
end)

task.spawn(function(...)
	task.wait(1.5)
	workspace:FindFirstChild("GunDrop", true)

	task.delay(5, function()
	end)
end)

task.spawn(function()
	task.wait(0.5)
	task.wait(0.5)
	-- [envlog] the statements above repeat forever (loop)
end)

local Toggle_ESPEnabled, UIStroke119 = createFrame(36, 1, Scroll3)
Toggle_ESPEnabled.Name = "Toggle_ESP Enabled"
local TextLabel144 = Instance.new("TextLabel")
TextLabel144.Size = UDim2.new(1, -72, 0, 14)
TextLabel144.Position = UDim2.new(0, 10, 0, 5)
TextLabel144.BackgroundTransparency = 1
TextLabel144.Text = "ESP Enabled"
TextLabel144.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel144.TextSize = 11
TextLabel144.Font = Enum.Font.ArialBold
TextLabel144.TextXAlignment = Enum.TextXAlignment.Left
TextLabel144.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel144.Parent = Toggle_ESPEnabled
local TextLabel145 = Instance.new("TextLabel")
TextLabel145.Size = UDim2.new(1, -72, 0, 11)
TextLabel145.Position = UDim2.new(0, 10, 0, 20)
TextLabel145.BackgroundTransparency = 1
TextLabel145.Text = "Enables ESP — Murderer, Sheriff & Gun auto-ON"
TextLabel145.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel145.TextSize = 9
TextLabel145.Font = Enum.Font.Arial
TextLabel145.TextXAlignment = Enum.TextXAlignment.Left
TextLabel145.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel145.Parent = Toggle_ESPEnabled
local Frame215 = Instance.new("Frame")
Frame215.Size = UDim2.new(0, 34, 0, 18)
Frame215.Position = UDim2.new(1, -44, 0.5, 0)
Frame215.AnchorPoint = Vector2.new(1, 0.5)
Frame215.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame215.BorderSizePixel = 0
Frame215.Parent = Toggle_ESPEnabled
local UICorner235 = Instance.new("UICorner")
UICorner235.CornerRadius = UDim.new(1, 0)
UICorner235.Parent = Frame215
local Frame216 = Instance.new("Frame")
Frame216.Size = UDim2.new(0, 12, 0, 12)
Frame216.Position = UDim2.new(0, 3, 0.5, 0)
Frame216.AnchorPoint = Vector2.new(0, 0.5)
Frame216.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame216.BorderSizePixel = 0
Frame216.Parent = Frame215
local UICorner236 = Instance.new("UICorner")
UICorner236.CornerRadius = UDim.new(1, 0)
UICorner236.Parent = Frame216
local UIStroke120 = Instance.new("UIStroke")
UIStroke120.Color = Color3.fromRGB(170, 20, 40)
UIStroke120.Thickness = 1.2
UIStroke120.Transparency = 0.3
UIStroke120.Parent = Frame216
local TextButton132 = Instance.new("TextButton")
TextButton132.Size = UDim2.new(1, 0, 1, 0)
TextButton132.BackgroundTransparency = 1
TextButton132.Text = ""
TextButton132.Parent = Toggle_ESPEnabled

TextButton132.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween118 = TweenService:Create(Frame215, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween118:Play()
	local tween119 = TweenService:Create(Frame216, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween119:Play()
	UIStroke119.Color = Color3.fromRGB(255, 0, 0)
	UIStroke119.Transparency = 0.25

	RunService.Heartbeat:Connect(function(deltaTime14)
		-- [envlog] error: LPH:4835: Script:3: attempt to compare userdata < number
	end)

	local GunDrop = workspace:FindFirstChild("GunDrop", true)
	local Highlight = Instance.new("Highlight")
	Highlight.Adornee = GunDrop
	Highlight.FillColor = Color3.fromRGB(255, 215, 0)
	Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	Highlight.FillTransparency = 0.35
	Highlight.OutlineTransparency = 0
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = GunDrop
	local RuzGunMarker = Instance.new("Part")
	RuzGunMarker.Name = "RuzGunMarker"
	RuzGunMarker.Size = Vector3.new(1.5, 0.15000000596046448, 1.5)
	RuzGunMarker.Anchored = true
	RuzGunMarker.CanCollide = false
	RuzGunMarker.CastShadow = false
	RuzGunMarker.Material = Enum.Material.Neon
	RuzGunMarker.Color = Color3.fromRGB(50, 255, 80)
	RuzGunMarker.Transparency = 0.25
	RuzGunMarker.CFrame = CFrame.new(GunDrop.Position + Vector3.new(0, 0.10000000149011612, 0))
	RuzGunMarker.Parent = workspace

	task.spawn(function()
		for _, transparency in ipairs({
			0.25, 0.32821723252011542, 0.40450849718747373, 0.47699524986977337,
			0.54389262614623657, 0.60355339059327373, 0.65450849718747373, 0.69550326209418389,
			0.72552825814757682, 0.74384417029756889, 0.75, 0.74384417029756889,
			0.72552825814757682, 0.69550326209418389, 0.65450849718747373, 0.60355339059327362,
			0.54389262614623646, 0.47699524986977326, 0.40450849718747334, 0.32821723252011503,
			0.25, 0.32821723252011542, 0.40450849718747373, 0.47699524986977337,
			0.54389262614623657, 0.60355339059327373, 0.65450849718747373, 0.69550326209418389,
			0.72552825814757682, 0.74384417029756889, 0.75, 0.74384417029756889,
			0.72552825814757682, 0.69550326209418389, 0.65450849718747373, 0.60355339059327362,
			0.54389262614623646, 0.47699524986977326, 0.40450849718747334, 0.32821723252011503,
			0.25, 0.32821723252011542, 0.40450849718747373, 0.47699524986977337,
			0.54389262614623657, 0.60355339059327373, 0.65450849718747373, 0.69550326209418389,
			0.72552825814757682, 0.74384417029756889, 0.75,
		}) do
			RuzGunMarker.Transparency = transparency
			task.wait(0.03)
		end
		-- [envlog] stopped after 50 waits
	end)

	local BillboardGui = Instance.new("BillboardGui")
	BillboardGui.Adornee = GunDrop
	BillboardGui.Size = UDim2.new(0, 130, 0, 36)
	BillboardGui.StudsOffset = Vector3.new(0, 4, 0)
	BillboardGui.AlwaysOnTop = true
	BillboardGui.MaxDistance = 300
	BillboardGui.Parent = GunDrop
	local Frame398 = Instance.new("Frame", BillboardGui)
	Frame398.Size = UDim2.new(1, 0, 1, 0)
	Frame398.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Frame398.BackgroundTransparency = 0.4
	Frame398.BorderSizePixel = 0
	local UICorner391 = Instance.new("UICorner", Frame398)
	UICorner391.CornerRadius = UDim.new(0, 6)
	local UIStroke280 = Instance.new("UIStroke", Frame398)
	UIStroke280.Color = Color3.fromRGB(255, 215, 0)
	UIStroke280.Thickness = 1.5
	UIStroke280.Transparency = 0.1
	local TextLabel703 = Instance.new("TextLabel", Frame398)
	TextLabel703.Size = UDim2.new(1, 0, 1, 0)
	TextLabel703.BackgroundTransparency = 1
	TextLabel703.Text = "DROPPED GUN"
	TextLabel703.TextColor3 = Color3.fromRGB(255, 215, 0)
	TextLabel703.Font = Enum.Font.GothamBlack
	TextLabel703.TextSize = 13
	TextLabel703.TextStrokeTransparency = 0.4
	TextLabel703.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
end)

createDivider(2, Scroll3, "Roles")
createTextLabel2(3, Scroll3, "Toggle_Murderer ESP", "Murderer ESP", "Red gradient — auto ON")
createTextLabel2(4, Scroll3, "Toggle_Sheriff ESP", "Sheriff ESP", "Blue/yellow — auto ON")
createTextLabel2(5, Scroll3, "Toggle_Innocent ESP", "Innocent ESP", "Green highlight for innocents — auto ON")
createTextLabel3(6, Scroll3, "Toggle_Self ESP", "Self ESP", "White highlight on yourself")
createDivider(7, Scroll3, "Style")
local Toggle_Highlight, UIStroke129 = createFrame(36, 8, Scroll3)
Toggle_Highlight.Name = "Toggle_Highlight"
local TextLabel156 = Instance.new("TextLabel")
TextLabel156.Size = UDim2.new(1, -72, 0, 14)
TextLabel156.Position = UDim2.new(0, 10, 0, 5)
TextLabel156.BackgroundTransparency = 1
TextLabel156.Text = "Highlight"
TextLabel156.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel156.TextSize = 11
TextLabel156.Font = Enum.Font.ArialBold
TextLabel156.TextXAlignment = Enum.TextXAlignment.Left
TextLabel156.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel156.Parent = Toggle_Highlight
local TextLabel157 = Instance.new("TextLabel")
TextLabel157.Size = UDim2.new(1, -72, 0, 11)
TextLabel157.Position = UDim2.new(0, 10, 0, 20)
TextLabel157.BackgroundTransparency = 1
TextLabel157.Text = "Role-coloured body highlight — auto ON"
TextLabel157.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel157.TextSize = 9
TextLabel157.Font = Enum.Font.Arial
TextLabel157.TextXAlignment = Enum.TextXAlignment.Left
TextLabel157.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel157.Parent = Toggle_Highlight
local Frame236 = Instance.new("Frame")
Frame236.Size = UDim2.new(0, 34, 0, 18)
Frame236.Position = UDim2.new(1, -44, 0.5, 0)
Frame236.AnchorPoint = Vector2.new(1, 0.5)
Frame236.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
Frame236.BorderSizePixel = 0
Frame236.Parent = Toggle_Highlight
local UICorner250 = Instance.new("UICorner")
UICorner250.CornerRadius = UDim.new(1, 0)
UICorner250.Parent = Frame236
local Frame237 = Instance.new("Frame")
Frame237.Size = UDim2.new(0, 12, 0, 12)
Frame237.Position = UDim2.new(1, -14, 0.5, 0)
Frame237.AnchorPoint = Vector2.new(0, 0.5)
Frame237.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame237.BorderSizePixel = 0
Frame237.Parent = Frame236
local UICorner251 = Instance.new("UICorner")
UICorner251.CornerRadius = UDim.new(1, 0)
UICorner251.Parent = Frame237
local UIStroke130 = Instance.new("UIStroke")
UIStroke130.Color = Color3.fromRGB(170, 20, 40)
UIStroke130.Thickness = 1.2
UIStroke130.Transparency = 0.3
UIStroke130.Parent = Frame237
local TextButton137 = Instance.new("TextButton")
TextButton137.Size = UDim2.new(1, 0, 1, 0)
TextButton137.BackgroundTransparency = 1
TextButton137.Text = ""
TextButton137.Parent = Toggle_Highlight

TextButton137.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween128 = TweenService:Create(Frame236, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) })
	tween128:Play()
	local tween129 = TweenService:Create(Frame237, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 3, 0.5, 0) })
	tween129:Play()
	UIStroke129.Color = Color3.fromRGB(60, 60, 60)
	UIStroke129.Transparency = 0.4
	local players2 = Players:GetPlayers()

	for k2, v52 in pairs(players2) do
		destroyRuzHL(v52)
	end
end)

UIStroke129.Color = Color3.fromRGB(255, 0, 0)
UIStroke129.Transparency = 0.25
createTextLabel3(9, Scroll3, "Toggle_Corner Box", "Corner Box", "Gradient corner box around player")
createTextLabel3(10, Scroll3, "Toggle_Skeleton", "Skeleton", "Role-coloured skeleton lines")
createDivider(11, Scroll3, "Items")
local Toggle_DroppedGunESP, UIStroke135 = createFrame(36, 12, Scroll3)
Toggle_DroppedGunESP.Name = "Toggle_Dropped Gun ESP"
local TextLabel163 = Instance.new("TextLabel")
TextLabel163.Size = UDim2.new(1, -72, 0, 14)
TextLabel163.Position = UDim2.new(0, 10, 0, 5)
TextLabel163.BackgroundTransparency = 1
TextLabel163.Text = "Dropped Gun ESP"
TextLabel163.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel163.TextSize = 11
TextLabel163.Font = Enum.Font.ArialBold
TextLabel163.TextXAlignment = Enum.TextXAlignment.Left
TextLabel163.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel163.Parent = Toggle_DroppedGunESP
local TextLabel164 = Instance.new("TextLabel")
TextLabel164.Size = UDim2.new(1, -72, 0, 11)
TextLabel164.Position = UDim2.new(0, 10, 0, 20)
TextLabel164.BackgroundTransparency = 1
TextLabel164.Text = "Gold highlight + label on dropped gun — auto ON"
TextLabel164.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel164.TextSize = 9
TextLabel164.Font = Enum.Font.Arial
TextLabel164.TextXAlignment = Enum.TextXAlignment.Left
TextLabel164.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel164.Parent = Toggle_DroppedGunESP
local Frame248 = Instance.new("Frame")
Frame248.Size = UDim2.new(0, 34, 0, 18)
Frame248.Position = UDim2.new(1, -44, 0.5, 0)
Frame248.AnchorPoint = Vector2.new(1, 0.5)
Frame248.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
Frame248.BorderSizePixel = 0
Frame248.Parent = Toggle_DroppedGunESP
local UICorner259 = Instance.new("UICorner")
UICorner259.CornerRadius = UDim.new(1, 0)
UICorner259.Parent = Frame248
local Frame249 = Instance.new("Frame")
Frame249.Size = UDim2.new(0, 12, 0, 12)
Frame249.Position = UDim2.new(1, -14, 0.5, 0)
Frame249.AnchorPoint = Vector2.new(0, 0.5)
Frame249.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame249.BorderSizePixel = 0
Frame249.Parent = Frame248
local UICorner260 = Instance.new("UICorner")
UICorner260.CornerRadius = UDim.new(1, 0)
UICorner260.Parent = Frame249
local UIStroke136 = Instance.new("UIStroke")
UIStroke136.Color = Color3.fromRGB(170, 20, 40)
UIStroke136.Thickness = 1.2
UIStroke136.Transparency = 0.3
UIStroke136.Parent = Frame249
local TextButton140 = Instance.new("TextButton")
TextButton140.Size = UDim2.new(1, 0, 1, 0)
TextButton140.BackgroundTransparency = 1
TextButton140.Text = ""
TextButton140.Parent = Toggle_DroppedGunESP

TextButton140.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween134 = TweenService:Create(Frame248, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(50, 50, 50) })
	tween134:Play()
	local tween135 = TweenService:Create(Frame249, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0, 3, 0.5, 0) })
	tween135:Play()
	UIStroke135.Color = Color3.fromRGB(60, 60, 60)
	UIStroke135.Transparency = 0.4
	Highlight:Destroy()
	BillboardGui:Destroy()
	RuzGunMarker:Destroy()
end)

UIStroke135.Color = Color3.fromRGB(255, 0, 0)
UIStroke135.Transparency = 0.25
local Modules = ReplicatedStorage:WaitForChild("Modules")
local CurrentRoundClient = Modules:WaitForChild("CurrentRoundClient", 10)
require(CurrentRoundClient)
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 10)
local Gameplay = Remotes:WaitForChild("Gameplay", 10)
local RoleSelect = Gameplay:FindFirstChild("RoleSelect")
local PlayerDataChanged = Gameplay:FindFirstChild("PlayerDataChanged")

RoleSelect.OnClientEvent:Connect(function()
	task.spawn(function()
		task.wait(1)
	end)
end)

PlayerDataChanged.OnClientEvent:Connect(function()
	task.spawn(function()
		task.wait(1)
	end)
end)

UserInputService.InputBegan:Connect(function(input57, gameProcessed57)
end)

UserInputService.InputChanged:Connect(function(input58, gameProcessed58)
end)

UserInputService.InputEnded:Connect(function(input59, gameProcessed59)
end)

hookmetamethod(game, "__namecall", function()
	-- [envlog] error: Script:3: attempt to call a nil value
end)

local Circle = Drawing.new("Circle")
Circle.Visible = false
Circle.Thickness = 1
Circle.NumSides = 100
Circle.Filled = false
Circle.Color = Color3.fromRGB(255, 255, 255)
Circle.Radius = 90

RunService.RenderStepped:Connect(function(deltaTime2)
	Circle.Position = Vector2.new(0, 0)
	Circle.Radius = 90
	Circle.Visible = false
end)

createDivider(1, Scroll4, "Silent Aim")
createTextLabel3(2, Scroll4, "Toggle_Silent Aim Enabled", "Silent Aim Enabled", "Murderer › Sheriff › Nearest — predictive aim")
local Dropdown_SilentAimMethod, UIStroke139 = createFrame(28, 3, Scroll4)
Dropdown_SilentAimMethod.Name = "Dropdown_Silent Aim Method"
Dropdown_SilentAimMethod.ClipsDescendants = false
local TextLabel168 = Instance.new("TextLabel")
TextLabel168.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel168.Position = UDim2.new(0, 10, 0, 7)
TextLabel168.BackgroundTransparency = 1
TextLabel168.Text = "Silent Aim Method"
TextLabel168.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel168.TextSize = 11
TextLabel168.Font = Enum.Font.ArialBold
TextLabel168.TextXAlignment = Enum.TextXAlignment.Left
TextLabel168.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel168.Parent = Dropdown_SilentAimMethod
local TextButton142 = Instance.new("TextButton")
TextButton142.Size = UDim2.new(0, 100, 0, 20)
TextButton142.Position = UDim2.new(1, -8, 0.5, 0)
TextButton142.AnchorPoint = Vector2.new(1, 0.5)
TextButton142.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton142.BackgroundTransparency = 0.1
TextButton142.BorderSizePixel = 0
TextButton142.Text = ""
TextButton142.Parent = Dropdown_SilentAimMethod
local UICorner265 = Instance.new("UICorner")
UICorner265.CornerRadius = UDim.new(0, 6)
UICorner265.Parent = TextButton142
local UIStroke140 = Instance.new("UIStroke")
UIStroke140.Color = Color3.fromRGB(60, 60, 60)
UIStroke140.Thickness = 1
UIStroke140.Transparency = 0.2
UIStroke140.Parent = TextButton142
local TextLabel169 = Instance.new("TextLabel")
TextLabel169.Size = UDim2.new(1, -24, 1, 0)
TextLabel169.Position = UDim2.new(0, 8, 0, 0)
TextLabel169.BackgroundTransparency = 1
TextLabel169.Text = "Normal"
TextLabel169.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel169.TextSize = 11
TextLabel169.Font = Enum.Font.ArialBold
TextLabel169.TextXAlignment = Enum.TextXAlignment.Left
TextLabel169.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel169.Parent = TextButton142
local TextLabel170 = Instance.new("TextLabel")
TextLabel170.Size = UDim2.new(0, 16, 1, 0)
TextLabel170.Position = UDim2.new(1, -18, 0, 0)
TextLabel170.BackgroundTransparency = 1
TextLabel170.Text = "▾"
TextLabel170.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel170.TextSize = 12
TextLabel170.Font = Enum.Font.Arial
TextLabel170.Parent = TextButton142
local DropList_SilentAimMethod = Instance.new("Frame")
DropList_SilentAimMethod.Name = "DropList_Silent Aim Method"
DropList_SilentAimMethod.Size = UDim2.new(0, 100, 0, 92)
DropList_SilentAimMethod.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_SilentAimMethod.BackgroundTransparency = 0.04
DropList_SilentAimMethod.BorderSizePixel = 0
DropList_SilentAimMethod.Visible = false
DropList_SilentAimMethod.ZIndex = 60
DropList_SilentAimMethod.Parent = CustomPanelGui
local UICorner266 = Instance.new("UICorner")
UICorner266.CornerRadius = UDim.new(0, 8)
UICorner266.Parent = DropList_SilentAimMethod
local UIStroke141 = Instance.new("UIStroke")
UIStroke141.Color = Color3.fromRGB(255, 0, 0)
UIStroke141.Thickness = 1.2
UIStroke141.Transparency = 0.2
UIStroke141.Parent = DropList_SilentAimMethod
local Frame258 = Instance.new("Frame")
Frame258.Size = UDim2.new(1, 0, 0, 28)
Frame258.BackgroundTransparency = 1
Frame258.ZIndex = 61
Frame258.Parent = DropList_SilentAimMethod
local TextLabel171 = Instance.new("TextLabel")
TextLabel171.Size = UDim2.new(1, -32, 1, 0)
TextLabel171.Position = UDim2.new(0, 8, 0, 0)
TextLabel171.BackgroundTransparency = 1
TextLabel171.Text = "Silent Aim Method"
TextLabel171.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel171.TextSize = 10
TextLabel171.Font = Enum.Font.ArialBold
TextLabel171.TextXAlignment = Enum.TextXAlignment.Left
TextLabel171.ZIndex = 61
TextLabel171.Parent = Frame258
local TextButton143 = Instance.new("TextButton")
TextButton143.Size = UDim2.new(0, 28, 0, 28)
TextButton143.Position = UDim2.new(1, -8, 0.5, 0)
TextButton143.AnchorPoint = Vector2.new(1, 0.5)
TextButton143.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton143.BackgroundTransparency = 0.3
TextButton143.BorderSizePixel = 0
TextButton143.Text = ""
TextButton143.ZIndex = 62
TextButton143.Parent = Frame258
local UICorner267 = Instance.new("UICorner")
UICorner267.CornerRadius = UDim.new(0, 6)
UICorner267.Parent = TextButton143
local UIStroke142 = Instance.new("UIStroke")
UIStroke142.Color = Color3.fromRGB(255, 40, 60)
UIStroke142.Thickness = 1.2
UIStroke142.Transparency = 0.3
UIStroke142.Parent = TextButton143
local ImageLabel40 = Instance.new("ImageLabel")
ImageLabel40.Size = UDim2.new(0, 16, 0, 16)
ImageLabel40.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel40.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel40.BackgroundTransparency = 1
ImageLabel40.ScaleType = Enum.ScaleType.Fit
ImageLabel40.Image = "rbxassetid://116396312853810"
ImageLabel40.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel40.ZIndex = 63
ImageLabel40.Parent = TextButton143

TextButton143.MouseEnter:Connect(function()
	TextButton143.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton143.BackgroundTransparency = 0.1
end)

TextButton143.MouseLeave:Connect(function()
	TextButton143.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton143.BackgroundTransparency = 0.3
end)

local Frame259 = Instance.new("Frame")
Frame259.Size = UDim2.new(1, -8, 0, 1)
Frame259.Position = UDim2.new(0.5, 0, 0, 28)
Frame259.AnchorPoint = Vector2.new(0.5, 0)
Frame259.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame259.BackgroundTransparency = 0.6
Frame259.BorderSizePixel = 0
Frame259.ZIndex = 61
Frame259.Parent = DropList_SilentAimMethod
local ScrollingFrame13 = Instance.new("ScrollingFrame")
ScrollingFrame13.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame13.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame13.BackgroundTransparency = 1
ScrollingFrame13.BorderSizePixel = 0
ScrollingFrame13.ScrollBarThickness = 2
ScrollingFrame13.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame13.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame13.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame13.ZIndex = 61
ScrollingFrame13.Parent = DropList_SilentAimMethod
local UIListLayout18 = Instance.new("UIListLayout")
UIListLayout18.Padding = UDim.new(0, 2)
UIListLayout18.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout18.Parent = ScrollingFrame13
local UIPadding15 = Instance.new("UIPadding")
UIPadding15.PaddingLeft = UDim.new(0, 4)
UIPadding15.PaddingRight = UDim.new(0, 4)
UIPadding15.PaddingTop = UDim.new(0, 3)
UIPadding15.Parent = ScrollingFrame13
local TextButton144 = Instance.new("TextButton")
TextButton144.Size = UDim2.new(1, 0, 0, 20)
TextButton144.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton144.BackgroundTransparency = 0.3
TextButton144.BorderSizePixel = 0
TextButton144.Text = "Normal"
TextButton144.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton144.TextSize = 11
TextButton144.Font = Enum.Font.ArialBold
TextButton144.TextTruncate = Enum.TextTruncate.AtEnd
TextButton144.ZIndex = 62
TextButton144.LayoutOrder = 1
TextButton144.Parent = ScrollingFrame13
local UICorner268 = Instance.new("UICorner")
UICorner268.CornerRadius = UDim.new(0, 5)
UICorner268.Parent = TextButton144

TextButton144.MouseEnter:Connect(function()
end)

TextButton144.MouseLeave:Connect(function()
end)

TextButton144.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel169.Text = "Normal"
	TextButton144.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton144.BackgroundTransparency = 0.3
	TextButton144.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton145.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton145.BackgroundTransparency = 0.65
	TextButton145.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton146.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton146.BackgroundTransparency = 0.65
	TextButton146.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel170.Text = "▾"
	local tween138 = TweenService:Create(DropList_SilentAimMethod, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween138:Play()
	task.wait(0.15)
	DropList_SilentAimMethod.Visible = false
end)

local TextButton145 = Instance.new("TextButton")
TextButton145.Size = UDim2.new(1, 0, 0, 20)
TextButton145.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton145.BackgroundTransparency = 0.65
TextButton145.BorderSizePixel = 0
TextButton145.Text = "Wallbang"
TextButton145.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton145.TextSize = 11
TextButton145.Font = Enum.Font.ArialBold
TextButton145.TextTruncate = Enum.TextTruncate.AtEnd
TextButton145.ZIndex = 62
TextButton145.LayoutOrder = 2
TextButton145.Parent = ScrollingFrame13
local UICorner269 = Instance.new("UICorner")
UICorner269.CornerRadius = UDim.new(0, 5)
UICorner269.Parent = TextButton145

TextButton145.MouseEnter:Connect(function()
	TextButton145.BackgroundTransparency = 0.4
	TextButton145.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton145.MouseLeave:Connect(function()
	TextButton145.BackgroundTransparency = 0.65
	TextButton145.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton145.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel169.Text = "Wallbang"
	TextButton144.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton144.BackgroundTransparency = 0.65
	TextButton144.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton145.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton145.BackgroundTransparency = 0.3
	TextButton145.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton146.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton146.BackgroundTransparency = 0.65
	TextButton146.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel170.Text = "▾"
	local tween139 = TweenService:Create(DropList_SilentAimMethod, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween139:Play()
	task.wait(0.15)
	DropList_SilentAimMethod.Visible = false
end)

local TextButton146 = Instance.new("TextButton")
TextButton146.Size = UDim2.new(1, 0, 0, 20)
TextButton146.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton146.BackgroundTransparency = 0.65
TextButton146.BorderSizePixel = 0
TextButton146.Text = "Flick"
TextButton146.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton146.TextSize = 11
TextButton146.Font = Enum.Font.ArialBold
TextButton146.TextTruncate = Enum.TextTruncate.AtEnd
TextButton146.ZIndex = 62
TextButton146.LayoutOrder = 3
TextButton146.Parent = ScrollingFrame13
local UICorner270 = Instance.new("UICorner")
UICorner270.CornerRadius = UDim.new(0, 5)
UICorner270.Parent = TextButton146

TextButton146.MouseEnter:Connect(function()
	TextButton146.BackgroundTransparency = 0.4
	TextButton146.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton146.MouseLeave:Connect(function()
	TextButton146.BackgroundTransparency = 0.65
	TextButton146.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton146.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel169.Text = "Flick"
	TextButton144.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton144.BackgroundTransparency = 0.65
	TextButton144.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton145.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton145.BackgroundTransparency = 0.65
	TextButton145.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton146.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton146.BackgroundTransparency = 0.3
	TextButton146.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel170.Text = "▾"
	local tween140 = TweenService:Create(DropList_SilentAimMethod, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween140:Play()
	task.wait(0.15)
	DropList_SilentAimMethod.Visible = false
end)

Dropdown_SilentAimMethod.Destroying:Connect(function()
	DropList_SilentAimMethod:Destroy()
end)

TextButton143.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel170, DropList_SilentAimMethod)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child15, parent5)
end)

TextButton142.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_SilentAimMethod, 96, TextLabel170, 92)
end)

createTextLabel3(4, Scroll4, "Toggle_FOV Visible", "FOV Visible", "FOV ring on screen — only targets inside FOV when enabled")
local ColorPicker_FOVColor, UIStroke145 = createFrame(36, 5, Scroll4)
ColorPicker_FOVColor.Name = "ColorPicker_FOV Color"
ColorPicker_FOVColor.ClipsDescendants = false
local TextLabel174 = Instance.new("TextLabel")
TextLabel174.Size = UDim2.new(0.52, 0, 0, 14)
TextLabel174.Position = UDim2.new(0, 10, 0, 5)
TextLabel174.BackgroundTransparency = 1
TextLabel174.Text = "FOV Color"
TextLabel174.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel174.TextSize = 11
TextLabel174.Font = Enum.Font.ArialBold
TextLabel174.TextXAlignment = Enum.TextXAlignment.Left
TextLabel174.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel174.Parent = ColorPicker_FOVColor
local TextLabel175 = Instance.new("TextLabel")
TextLabel175.Size = UDim2.new(0.52, 0, 0, 11)
TextLabel175.Position = UDim2.new(0, 10, 0, 20)
TextLabel175.BackgroundTransparency = 1
TextLabel175.Text = "Ring color"
TextLabel175.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel175.TextSize = 9
TextLabel175.Font = Enum.Font.Arial
TextLabel175.TextXAlignment = Enum.TextXAlignment.Left
TextLabel175.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel175.Parent = ColorPicker_FOVColor
local Frame264 = Instance.new("Frame")
Frame264.Size = UDim2.new(0, 100, 0, 20)
Frame264.Position = UDim2.new(1, -8, 0.5, 0)
Frame264.AnchorPoint = Vector2.new(1, 0.5)
Frame264.BackgroundTransparency = 1
Frame264.Parent = ColorPicker_FOVColor
local TextButton148 = Instance.new("TextButton")
TextButton148.Size = UDim2.new(1, 0, 1, 0)
TextButton148.BackgroundTransparency = 1
TextButton148.Text = ""
TextButton148.ZIndex = 3
TextButton148.Parent = Frame264
local Frame265 = Instance.new("Frame")
Frame265.Size = UDim2.new(0, 26, 0, 26)
Frame265.Position = UDim2.new(0, 0, 0, 0)
Frame265.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame265.BorderSizePixel = 0
Frame265.ZIndex = 2
Frame265.Parent = Frame264
local UICorner275 = Instance.new("UICorner")
UICorner275.CornerRadius = UDim.new(0, 6)
UICorner275.Parent = Frame265
local UIStroke146 = Instance.new("UIStroke")
UIStroke146.Color = Color3.fromRGB(255, 255, 255)
UIStroke146.Thickness = 1.5
UIStroke146.Transparency = 0.4
UIStroke146.Parent = Frame265
local TextLabel176 = Instance.new("TextLabel")
TextLabel176.Size = UDim2.new(0, 68, 1, 0)
TextLabel176.Position = UDim2.new(0, 32, 0, 0)
TextLabel176.BackgroundTransparency = 1
TextLabel176.Text = "#FFFFFF"
TextLabel176.TextColor3 = Color3.fromRGB(160, 160, 160)
TextLabel176.TextSize = 11
TextLabel176.Font = Enum.Font.Code
TextLabel176.TextXAlignment = Enum.TextXAlignment.Left
TextLabel176.ZIndex = 2
TextLabel176.Parent = Frame264
local TextLabel177 = Instance.new("TextLabel")
TextLabel177.Size = UDim2.new(0, 14, 1, 0)
TextLabel177.Position = UDim2.new(1, -14, 0, 0)
TextLabel177.BackgroundTransparency = 1
TextLabel177.Text = "▾"
TextLabel177.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel177.TextSize = 12
TextLabel177.Font = Enum.Font.Arial
TextLabel177.ZIndex = 2
TextLabel177.Parent = Frame264
local CPPanel_FOVColor = Instance.new("Frame")
CPPanel_FOVColor.Name = "CPPanel_FOV Color"
CPPanel_FOVColor.Size = UDim2.new(0, 0, 0, 0)
CPPanel_FOVColor.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
CPPanel_FOVColor.BackgroundTransparency = 0.06
CPPanel_FOVColor.BorderSizePixel = 0
CPPanel_FOVColor.ClipsDescendants = true
CPPanel_FOVColor.Visible = false
CPPanel_FOVColor.ZIndex = 55
CPPanel_FOVColor.Parent = CustomPanelGui
local UICorner276 = Instance.new("UICorner")
UICorner276.CornerRadius = UDim.new(0, 8)
UICorner276.Parent = CPPanel_FOVColor
local UIStroke147 = Instance.new("UIStroke")
UIStroke147.Color = Color3.fromRGB(255, 0, 0)
UIStroke147.Thickness = 1.2
UIStroke147.Transparency = 0.25
UIStroke147.Parent = CPPanel_FOVColor
local Frame267 = Instance.new("Frame")
Frame267.Size = UDim2.new(1, 0, 0, 28)
Frame267.BackgroundTransparency = 1
Frame267.ZIndex = 56
Frame267.Parent = CPPanel_FOVColor
local TextLabel178 = Instance.new("TextLabel")
TextLabel178.Size = UDim2.new(1, -32, 1, 0)
TextLabel178.Position = UDim2.new(0, 8, 0, 0)
TextLabel178.BackgroundTransparency = 1
TextLabel178.Text = "FOV Color"
TextLabel178.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel178.TextSize = 10
TextLabel178.Font = Enum.Font.ArialBold
TextLabel178.TextXAlignment = Enum.TextXAlignment.Left
TextLabel178.ZIndex = 56
TextLabel178.Parent = Frame267
local TextButton149 = Instance.new("TextButton")
TextButton149.Size = UDim2.new(0, 28, 0, 28)
TextButton149.Position = UDim2.new(1, -8, 0.5, 0)
TextButton149.AnchorPoint = Vector2.new(1, 0.5)
TextButton149.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton149.BackgroundTransparency = 0.3
TextButton149.BorderSizePixel = 0
TextButton149.Text = ""
TextButton149.ZIndex = 57
TextButton149.Parent = Frame267
local UICorner277 = Instance.new("UICorner")
UICorner277.CornerRadius = UDim.new(0, 6)
UICorner277.Parent = TextButton149
local UIStroke148 = Instance.new("UIStroke")
UIStroke148.Color = Color3.fromRGB(255, 40, 60)
UIStroke148.Thickness = 1.2
UIStroke148.Transparency = 0.3
UIStroke148.Parent = TextButton149
local ImageLabel41 = Instance.new("ImageLabel")
ImageLabel41.Size = UDim2.new(0, 16, 0, 16)
ImageLabel41.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel41.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel41.BackgroundTransparency = 1
ImageLabel41.ScaleType = Enum.ScaleType.Fit
ImageLabel41.Image = "rbxassetid://116396312853810"
ImageLabel41.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel41.ZIndex = 57
ImageLabel41.Parent = TextButton149
local Frame268 = Instance.new("Frame")
Frame268.Size = UDim2.new(1, -8, 0, 1)
Frame268.Position = UDim2.new(0.5, 0, 0, 28)
Frame268.AnchorPoint = Vector2.new(0.5, 0)
Frame268.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame268.BackgroundTransparency = 0.6
Frame268.BorderSizePixel = 0
Frame268.ZIndex = 56
Frame268.Parent = CPPanel_FOVColor
local Frame269 = Instance.new("Frame")
Frame269.Size = UDim2.new(1, 0, 1, -28)
Frame269.Position = UDim2.new(0, 0, 0, 28)
Frame269.BackgroundTransparency = 1
Frame269.ZIndex = 56
Frame269.Parent = CPPanel_FOVColor
local UIListLayout19 = Instance.new("UIListLayout")
UIListLayout19.Padding = UDim.new(0, 3)
UIListLayout19.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout19.Parent = Frame269
local UIPadding16 = Instance.new("UIPadding")
UIPadding16.PaddingLeft = UDim.new(0, 8)
UIPadding16.PaddingRight = UDim.new(0, 8)
UIPadding16.PaddingTop = UDim.new(0, 5)
UIPadding16.PaddingBottom = UDim.new(0, 5)
UIPadding16.Parent = Frame269
createFrame2(1, Frame269, "R", 220, 60, 60, "255", 1)
createFrame2(2, Frame269, "G", 60, 200, 80, "255", 1)
createFrame2(3, Frame269, "B", 60, 120, 220, "255", 1)
local Frame282 = Instance.new("Frame")
Frame282.Size = UDim2.new(1, 0, 0, 20)
Frame282.BackgroundTransparency = 1
Frame282.LayoutOrder = 4
Frame282.ZIndex = 56
Frame282.Parent = Frame269
local UIListLayout20 = Instance.new("UIListLayout")
UIListLayout20.FillDirection = Enum.FillDirection.Horizontal
UIListLayout20.Padding = UDim.new(0, 4)
UIListLayout20.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout20.Parent = Frame282

local function setFrameBackgroundColor3(r, g, b, text)
	Frame265.BackgroundColor3 = Color3.fromRGB(r, g, b)
	TextLabel176.Text = text
	Circle.Color = Color3.fromRGB(r, g, b)
end

for _, item in ipairs({
	{ r = 220, g = 20, b = 40, layoutOrder = 1, text = "#DC1428" },
	{ r = 255, g = 120, b = 0, layoutOrder = 2, text = "#FF7800" },
	{ r = 240, g = 200, b = 0, layoutOrder = 3, text = "#F0C800" },
	{ r = 40, g = 200, b = 80, layoutOrder = 4, text = "#28C850" },
	{ r = 0, g = 140, b = 240, layoutOrder = 5, text = "#008CF0" },
	{ r = 150, g = 60, b = 230, layoutOrder = 6, text = "#963CE6" },
	{ r = 240, g = 240, b = 240, layoutOrder = 7, text = "#F0F0F0" },
	{ r = 60, g = 60, b = 60, layoutOrder = 8, text = "#3C3C3C" },
}) do
	local TextButton153 = Instance.new("TextButton")
	TextButton153.Size = UDim2.new(0, 18, 0, 18)
	TextButton153.BackgroundColor3 = Color3.fromRGB(item.r, item.g, item.b)
	TextButton153.BorderSizePixel = 0
	TextButton153.Text = ""
	TextButton153.LayoutOrder = item.layoutOrder
	TextButton153.ZIndex = 57
	TextButton153.Parent = Frame282
	local UICorner287 = Instance.new("UICorner")
	UICorner287.CornerRadius = UDim.new(0, 4)
	UICorner287.Parent = TextButton153

	TextButton153.MouseButton1Click:Connect(function()
		setFrameBackgroundColor3(item.r, item.g, item.b, item.text)
	end)
end

TextButton148.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel2(TextLabel177, UIStroke145, CPPanel_FOVColor)
end)

TextButton149.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel3(TextLabel177, UIStroke145, CPPanel_FOVColor)
end)

TextButton149.MouseEnter:Connect(function()
	TextButton149.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton149.BackgroundTransparency = 0.1
end)

TextButton149.MouseLeave:Connect(function()
	TextButton149.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton149.BackgroundTransparency = 0.3
end)

createTextLabel(6, Scroll4, "Slider_FOV Size", "FOV Size", "90px", "Ring radius (px)", 0.35294117647058826)
createDivider(7, Scroll4, "Screen Buttons")
local RuzHub_ComboBtns = game.CoreGui:FindFirstChild("RuzHub_ComboBtns")
RuzHub_ComboBtns:Destroy()
local RuzHub_ComboBtns2 = Instance.new("ScreenGui", game.CoreGui)
RuzHub_ComboBtns2.Name = "RuzHub_ComboBtns"
RuzHub_ComboBtns2.ResetOnSpawn = false
RuzHub_ComboBtns2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RuzHub_ComboBtns2.DisplayOrder = 99
RuzHub_ComboBtns2.IgnoreGuiInset = true

RunService.RenderStepped:Connect(function(deltaTime3)
	UIGradient.Rotation = 228.71795654296875
	UIGradient3.Rotation = 228.71795654296875
end)

local Sound2 = Instance.new("Sound")
Sound2.SoundId = "rbxassetid://86169980872189"
Sound2.Volume = 0.7
Sound2.Parent = SoundService

RunService.Heartbeat:Connect(function(deltaTime4)
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character6)
end)

RunService.Heartbeat:Connect(function(deltaTime5)
	Lbl.Text = "NoClip\nON"
	Lbl2.Text = "Fly\nON"
end)

local Toggle_LoadShootThrowButton, UIStroke154 = createFrame(36, 7, Scroll4)
Toggle_LoadShootThrowButton.Name = "Toggle_Load Shoot / Throw Button"
local TextLabel189 = Instance.new("TextLabel")
TextLabel189.Size = UDim2.new(1, -72, 0, 14)
TextLabel189.Position = UDim2.new(0, 10, 0, 5)
TextLabel189.BackgroundTransparency = 1
TextLabel189.Text = "Load Shoot / Throw Button"
TextLabel189.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel189.TextSize = 11
TextLabel189.Font = Enum.Font.ArialBold
TextLabel189.TextXAlignment = Enum.TextXAlignment.Left
TextLabel189.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel189.Parent = Toggle_LoadShootThrowButton
local TextLabel190 = Instance.new("TextLabel")
TextLabel190.Size = UDim2.new(1, -72, 0, 11)
TextLabel190.Position = UDim2.new(0, 10, 0, 20)
TextLabel190.BackgroundTransparency = 1
TextLabel190.Text = "Knife = THROW mode, no knife = SHOOT mode — draggable button"
TextLabel190.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel190.TextSize = 9
TextLabel190.Font = Enum.Font.Arial
TextLabel190.TextXAlignment = Enum.TextXAlignment.Left
TextLabel190.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel190.Parent = Toggle_LoadShootThrowButton
local Frame291 = Instance.new("Frame")
Frame291.Size = UDim2.new(0, 34, 0, 18)
Frame291.Position = UDim2.new(1, -44, 0.5, 0)
Frame291.AnchorPoint = Vector2.new(1, 0.5)
Frame291.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame291.BorderSizePixel = 0
Frame291.Parent = Toggle_LoadShootThrowButton
local UICorner300 = Instance.new("UICorner")
UICorner300.CornerRadius = UDim.new(1, 0)
UICorner300.Parent = Frame291
local Frame292 = Instance.new("Frame")
Frame292.Size = UDim2.new(0, 12, 0, 12)
Frame292.Position = UDim2.new(0, 3, 0.5, 0)
Frame292.AnchorPoint = Vector2.new(0, 0.5)
Frame292.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame292.BorderSizePixel = 0
Frame292.Parent = Frame291
local UICorner301 = Instance.new("UICorner")
UICorner301.CornerRadius = UDim.new(1, 0)
UICorner301.Parent = Frame292
local UIStroke155 = Instance.new("UIStroke")
UIStroke155.Color = Color3.fromRGB(170, 20, 40)
UIStroke155.Thickness = 1.2
UIStroke155.Transparency = 0.3
UIStroke155.Parent = Frame292
local TextButton162 = Instance.new("TextButton")
TextButton162.Size = UDim2.new(1, 0, 1, 0)
TextButton162.BackgroundTransparency = 1
TextButton162.Text = ""
TextButton162.Parent = Toggle_LoadShootThrowButton

local function createSpinImg(textButton, image, textLabel)
	local SpinImg = Instance.new("ImageLabel", textButton)
	SpinImg.Name = "SpinImg"
	SpinImg.Size = UDim2.new(0, 64, 0, 64)
	SpinImg.AnchorPoint = Vector2.new(0.5, 0.5)
	SpinImg.Position = UDim2.new(0.5, 0, 0.44, 0)
	SpinImg.BackgroundTransparency = 1
	SpinImg.Image = image
	SpinImg.ScaleType = Enum.ScaleType.Fit
	SpinImg.ImageColor3 = Color3.fromRGB(180, 0, 0)
	textLabel.Size = UDim2.new(1, 0, 0, 20)
	textLabel.Position = UDim2.new(0, 0, 1, -20)
	textLabel.TextSize = 13
end

local function createUIGradient2(name, yScale, text)
	local RuzBtn_Shoot = Instance.new("TextButton", RuzHub_ComboBtns2)
	RuzBtn_Shoot.Name = name
	RuzBtn_Shoot.Size = UDim2.new(0, 88, 0, 88)
	RuzBtn_Shoot.Position = UDim2.new(0.85, 0, yScale, 0)
	RuzBtn_Shoot.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
	RuzBtn_Shoot.BackgroundTransparency = 0.45
	RuzBtn_Shoot.Text = ""
	RuzBtn_Shoot.AutoButtonColor = false
	RuzBtn_Shoot.BorderSizePixel = 0
	local UICorner392 = Instance.new("UICorner", RuzBtn_Shoot)
	UICorner392.CornerRadius = UDim.new(0, 12)
	local UIStroke281 = Instance.new("UIStroke", RuzBtn_Shoot)
	UIStroke281.Thickness = 2.5
	UIStroke281.Color = Color3.fromRGB(255, 255, 255)
	UIStroke281.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	local UIGradient5 = Instance.new("UIGradient", UIStroke281)
	UIGradient5.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)) })
	local Lbl3 = Instance.new("TextLabel", RuzBtn_Shoot)
	Lbl3.Name = "Lbl"
	Lbl3.Size = UDim2.new(1, 0, 1, 0)
	Lbl3.BackgroundTransparency = 1
	Lbl3.Text = text
	Lbl3.Font = Enum.Font.GothamBold
	Lbl3.TextSize = 12.32
	Lbl3.TextYAlignment = Enum.TextYAlignment.Center
	Lbl3.TextXAlignment = Enum.TextXAlignment.Center
	Lbl3.TextStrokeTransparency = 0.5
	Lbl3.TextColor3 = Color3.fromRGB(255, 255, 255)
	local UIGradient6 = Instance.new("UIGradient", Lbl3)
	UIGradient6.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 0)) })
	UIGradient6.Rotation = 90
	setupTextButton2(RuzBtn_Shoot)
	return RuzBtn_Shoot, Lbl3
end

TextButton162.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween147 = TweenService:Create(Frame291, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween147:Play()
	local tween148 = TweenService:Create(Frame292, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween148:Play()
	UIStroke154.Color = Color3.fromRGB(255, 0, 0)
	UIStroke154.Transparency = 0.25
	local RuzBtn_Shoot, Lbl3 = createUIGradient2("RuzBtn_Shoot", 0.75, "SHOOT")
	createSpinImg(RuzBtn_Shoot, "rbxassetid://139650104834071", Lbl3)
end)

local Dropdown_ShootStyle, UIStroke156 = createFrame(36, 8, Scroll4)
Dropdown_ShootStyle.Name = "Dropdown_Shoot Style"
Dropdown_ShootStyle.ClipsDescendants = false
local TextLabel191 = Instance.new("TextLabel")
TextLabel191.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel191.Position = UDim2.new(0, 10, 0, 5)
TextLabel191.BackgroundTransparency = 1
TextLabel191.Text = "Shoot Style"
TextLabel191.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel191.TextSize = 11
TextLabel191.Font = Enum.Font.ArialBold
TextLabel191.TextXAlignment = Enum.TextXAlignment.Left
TextLabel191.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel191.Parent = Dropdown_ShootStyle
local TextLabel192 = Instance.new("TextLabel")
TextLabel192.Size = UDim2.new(0.48, 0, 0, 11)
TextLabel192.Position = UDim2.new(0, 10, 0, 20)
TextLabel192.BackgroundTransparency = 1
TextLabel192.Text = "Select shoot button behavior"
TextLabel192.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel192.TextSize = 9
TextLabel192.Font = Enum.Font.Arial
TextLabel192.TextXAlignment = Enum.TextXAlignment.Left
TextLabel192.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel192.Parent = Dropdown_ShootStyle
local TextButton163 = Instance.new("TextButton")
TextButton163.Size = UDim2.new(0, 100, 0, 20)
TextButton163.Position = UDim2.new(1, -8, 0.5, 0)
TextButton163.AnchorPoint = Vector2.new(1, 0.5)
TextButton163.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton163.BackgroundTransparency = 0.1
TextButton163.BorderSizePixel = 0
TextButton163.Text = ""
TextButton163.Parent = Dropdown_ShootStyle
local UICorner303 = Instance.new("UICorner")
UICorner303.CornerRadius = UDim.new(0, 6)
UICorner303.Parent = TextButton163
local UIStroke157 = Instance.new("UIStroke")
UIStroke157.Color = Color3.fromRGB(60, 60, 60)
UIStroke157.Thickness = 1
UIStroke157.Transparency = 0.2
UIStroke157.Parent = TextButton163
local TextLabel193 = Instance.new("TextLabel")
TextLabel193.Size = UDim2.new(1, -24, 1, 0)
TextLabel193.Position = UDim2.new(0, 8, 0, 0)
TextLabel193.BackgroundTransparency = 1
TextLabel193.Text = "Normal"
TextLabel193.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel193.TextSize = 11
TextLabel193.Font = Enum.Font.ArialBold
TextLabel193.TextXAlignment = Enum.TextXAlignment.Left
TextLabel193.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel193.Parent = TextButton163
local TextLabel194 = Instance.new("TextLabel")
TextLabel194.Size = UDim2.new(0, 16, 1, 0)
TextLabel194.Position = UDim2.new(1, -18, 0, 0)
TextLabel194.BackgroundTransparency = 1
TextLabel194.Text = "▾"
TextLabel194.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel194.TextSize = 12
TextLabel194.Font = Enum.Font.Arial
TextLabel194.Parent = TextButton163
local DropList_ShootStyle = Instance.new("Frame")
DropList_ShootStyle.Name = "DropList_Shoot Style"
DropList_ShootStyle.Size = UDim2.new(0, 100, 0, 92)
DropList_ShootStyle.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_ShootStyle.BackgroundTransparency = 0.04
DropList_ShootStyle.BorderSizePixel = 0
DropList_ShootStyle.Visible = false
DropList_ShootStyle.ZIndex = 60
DropList_ShootStyle.Parent = CustomPanelGui
local UICorner304 = Instance.new("UICorner")
UICorner304.CornerRadius = UDim.new(0, 8)
UICorner304.Parent = DropList_ShootStyle
local UIStroke158 = Instance.new("UIStroke")
UIStroke158.Color = Color3.fromRGB(255, 0, 0)
UIStroke158.Thickness = 1.2
UIStroke158.Transparency = 0.2
UIStroke158.Parent = DropList_ShootStyle
local Frame295 = Instance.new("Frame")
Frame295.Size = UDim2.new(1, 0, 0, 28)
Frame295.BackgroundTransparency = 1
Frame295.ZIndex = 61
Frame295.Parent = DropList_ShootStyle
local TextLabel195 = Instance.new("TextLabel")
TextLabel195.Size = UDim2.new(1, -32, 1, 0)
TextLabel195.Position = UDim2.new(0, 8, 0, 0)
TextLabel195.BackgroundTransparency = 1
TextLabel195.Text = "Shoot Style"
TextLabel195.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel195.TextSize = 10
TextLabel195.Font = Enum.Font.ArialBold
TextLabel195.TextXAlignment = Enum.TextXAlignment.Left
TextLabel195.ZIndex = 61
TextLabel195.Parent = Frame295
local TextButton164 = Instance.new("TextButton")
TextButton164.Size = UDim2.new(0, 28, 0, 28)
TextButton164.Position = UDim2.new(1, -8, 0.5, 0)
TextButton164.AnchorPoint = Vector2.new(1, 0.5)
TextButton164.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton164.BackgroundTransparency = 0.3
TextButton164.BorderSizePixel = 0
TextButton164.Text = ""
TextButton164.ZIndex = 62
TextButton164.Parent = Frame295
local UICorner305 = Instance.new("UICorner")
UICorner305.CornerRadius = UDim.new(0, 6)
UICorner305.Parent = TextButton164
local UIStroke159 = Instance.new("UIStroke")
UIStroke159.Color = Color3.fromRGB(255, 40, 60)
UIStroke159.Thickness = 1.2
UIStroke159.Transparency = 0.3
UIStroke159.Parent = TextButton164
local ImageLabel42 = Instance.new("ImageLabel")
ImageLabel42.Size = UDim2.new(0, 16, 0, 16)
ImageLabel42.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel42.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel42.BackgroundTransparency = 1
ImageLabel42.ScaleType = Enum.ScaleType.Fit
ImageLabel42.Image = "rbxassetid://116396312853810"
ImageLabel42.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel42.ZIndex = 63
ImageLabel42.Parent = TextButton164

TextButton164.MouseEnter:Connect(function()
	TextButton164.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton164.BackgroundTransparency = 0.1
end)

TextButton164.MouseLeave:Connect(function()
	TextButton164.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton164.BackgroundTransparency = 0.3
end)

local Frame296 = Instance.new("Frame")
Frame296.Size = UDim2.new(1, -8, 0, 1)
Frame296.Position = UDim2.new(0.5, 0, 0, 28)
Frame296.AnchorPoint = Vector2.new(0.5, 0)
Frame296.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame296.BackgroundTransparency = 0.6
Frame296.BorderSizePixel = 0
Frame296.ZIndex = 61
Frame296.Parent = DropList_ShootStyle
local ScrollingFrame14 = Instance.new("ScrollingFrame")
ScrollingFrame14.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame14.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame14.BackgroundTransparency = 1
ScrollingFrame14.BorderSizePixel = 0
ScrollingFrame14.ScrollBarThickness = 2
ScrollingFrame14.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame14.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame14.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame14.ZIndex = 61
ScrollingFrame14.Parent = DropList_ShootStyle
local UIListLayout21 = Instance.new("UIListLayout")
UIListLayout21.Padding = UDim.new(0, 2)
UIListLayout21.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout21.Parent = ScrollingFrame14
local UIPadding17 = Instance.new("UIPadding")
UIPadding17.PaddingLeft = UDim.new(0, 4)
UIPadding17.PaddingRight = UDim.new(0, 4)
UIPadding17.PaddingTop = UDim.new(0, 3)
UIPadding17.Parent = ScrollingFrame14
local TextButton165 = Instance.new("TextButton")
TextButton165.Size = UDim2.new(1, 0, 0, 20)
TextButton165.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton165.BackgroundTransparency = 0.3
TextButton165.BorderSizePixel = 0
TextButton165.Text = "Normal"
TextButton165.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton165.TextSize = 11
TextButton165.Font = Enum.Font.ArialBold
TextButton165.TextTruncate = Enum.TextTruncate.AtEnd
TextButton165.ZIndex = 62
TextButton165.LayoutOrder = 1
TextButton165.Parent = ScrollingFrame14
local UICorner306 = Instance.new("UICorner")
UICorner306.CornerRadius = UDim.new(0, 5)
UICorner306.Parent = TextButton165

TextButton165.MouseEnter:Connect(function()
end)

TextButton165.MouseLeave:Connect(function()
end)

TextButton165.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel193.Text = "Normal"
	TextButton165.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton165.BackgroundTransparency = 0.3
	TextButton165.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton166.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton166.BackgroundTransparency = 0.65
	TextButton166.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton167.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton167.BackgroundTransparency = 0.65
	TextButton167.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel194.Text = "▾"
	local tween149 = TweenService:Create(DropList_ShootStyle, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween149:Play()
	task.wait(0.15)
	DropList_ShootStyle.Visible = false
end)

local TextButton166 = Instance.new("TextButton")
TextButton166.Size = UDim2.new(1, 0, 0, 20)
TextButton166.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton166.BackgroundTransparency = 0.65
TextButton166.BorderSizePixel = 0
TextButton166.Text = "Flick Shoot"
TextButton166.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton166.TextSize = 11
TextButton166.Font = Enum.Font.ArialBold
TextButton166.TextTruncate = Enum.TextTruncate.AtEnd
TextButton166.ZIndex = 62
TextButton166.LayoutOrder = 2
TextButton166.Parent = ScrollingFrame14
local UICorner307 = Instance.new("UICorner")
UICorner307.CornerRadius = UDim.new(0, 5)
UICorner307.Parent = TextButton166

TextButton166.MouseEnter:Connect(function()
	TextButton166.BackgroundTransparency = 0.4
	TextButton166.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton166.MouseLeave:Connect(function()
	TextButton166.BackgroundTransparency = 0.65
	TextButton166.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton166.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel193.Text = "Flick Shoot"
	TextButton165.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton165.BackgroundTransparency = 0.65
	TextButton165.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton166.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton166.BackgroundTransparency = 0.3
	TextButton166.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton167.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton167.BackgroundTransparency = 0.65
	TextButton167.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextLabel194.Text = "▾"
	local tween150 = TweenService:Create(DropList_ShootStyle, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween150:Play()
	task.wait(0.15)
	DropList_ShootStyle.Visible = false
end)

local TextButton167 = Instance.new("TextButton")
TextButton167.Size = UDim2.new(1, 0, 0, 20)
TextButton167.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton167.BackgroundTransparency = 0.65
TextButton167.BorderSizePixel = 0
TextButton167.Text = "Wallbang"
TextButton167.TextColor3 = Color3.fromRGB(160, 160, 160)
TextButton167.TextSize = 11
TextButton167.Font = Enum.Font.ArialBold
TextButton167.TextTruncate = Enum.TextTruncate.AtEnd
TextButton167.ZIndex = 62
TextButton167.LayoutOrder = 3
TextButton167.Parent = ScrollingFrame14
local UICorner308 = Instance.new("UICorner")
UICorner308.CornerRadius = UDim.new(0, 5)
UICorner308.Parent = TextButton167

TextButton167.MouseEnter:Connect(function()
	TextButton167.BackgroundTransparency = 0.4
	TextButton167.TextColor3 = Color3.fromRGB(240, 240, 240)
end)

TextButton167.MouseLeave:Connect(function()
	TextButton167.BackgroundTransparency = 0.65
	TextButton167.TextColor3 = Color3.fromRGB(160, 160, 160)
end)

TextButton167.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel193.Text = "Wallbang"
	TextButton165.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton165.BackgroundTransparency = 0.65
	TextButton165.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton166.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextButton166.BackgroundTransparency = 0.65
	TextButton166.TextColor3 = Color3.fromRGB(160, 160, 160)
	TextButton167.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton167.BackgroundTransparency = 0.3
	TextButton167.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel194.Text = "▾"
	local tween151 = TweenService:Create(DropList_ShootStyle, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween151:Play()
	task.wait(0.15)
	DropList_ShootStyle.Visible = false
end)

Dropdown_ShootStyle.Destroying:Connect(function()
	DropList_ShootStyle:Destroy()
end)

TextButton164.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel194, DropList_ShootStyle)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child16, parent6)
end)

TextButton163.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_ShootStyle, 96, TextLabel194, 92)
end)

createKeybindRow(10, Scroll4)
createDivider(11, Scroll4, "Camlock")
local Toggle_LoadCamlockButton, UIStroke163 = createFrame(36, 12, Scroll4)
Toggle_LoadCamlockButton.Name = "Toggle_Load Camlock Button"
local TextLabel199 = Instance.new("TextLabel")
TextLabel199.Size = UDim2.new(1, -72, 0, 14)
TextLabel199.Position = UDim2.new(0, 10, 0, 5)
TextLabel199.BackgroundTransparency = 1
TextLabel199.Text = "Load Camlock Button"
TextLabel199.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel199.TextSize = 11
TextLabel199.Font = Enum.Font.ArialBold
TextLabel199.TextXAlignment = Enum.TextXAlignment.Left
TextLabel199.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel199.Parent = Toggle_LoadCamlockButton
local TextLabel200 = Instance.new("TextLabel")
TextLabel200.Size = UDim2.new(1, -72, 0, 11)
TextLabel200.Position = UDim2.new(0, 10, 0, 20)
TextLabel200.BackgroundTransparency = 1
TextLabel200.Text = "Draggable camlock button on screen"
TextLabel200.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel200.TextSize = 9
TextLabel200.Font = Enum.Font.Arial
TextLabel200.TextXAlignment = Enum.TextXAlignment.Left
TextLabel200.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel200.Parent = Toggle_LoadCamlockButton
local Frame303 = Instance.new("Frame")
Frame303.Size = UDim2.new(0, 34, 0, 18)
Frame303.Position = UDim2.new(1, -44, 0.5, 0)
Frame303.AnchorPoint = Vector2.new(1, 0.5)
Frame303.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame303.BorderSizePixel = 0
Frame303.Parent = Toggle_LoadCamlockButton
local UICorner313 = Instance.new("UICorner")
UICorner313.CornerRadius = UDim.new(1, 0)
UICorner313.Parent = Frame303
local Frame304 = Instance.new("Frame")
Frame304.Size = UDim2.new(0, 12, 0, 12)
Frame304.Position = UDim2.new(0, 3, 0.5, 0)
Frame304.AnchorPoint = Vector2.new(0, 0.5)
Frame304.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame304.BorderSizePixel = 0
Frame304.Parent = Frame303
local UICorner314 = Instance.new("UICorner")
UICorner314.CornerRadius = UDim.new(1, 0)
UICorner314.Parent = Frame304
local UIStroke164 = Instance.new("UIStroke")
UIStroke164.Color = Color3.fromRGB(170, 20, 40)
UIStroke164.Thickness = 1.2
UIStroke164.Transparency = 0.3
UIStroke164.Parent = Frame304
local TextButton169 = Instance.new("TextButton")
TextButton169.Size = UDim2.new(1, 0, 1, 0)
TextButton169.BackgroundTransparency = 1
TextButton169.Text = ""
TextButton169.Parent = Toggle_LoadCamlockButton

TextButton169.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween157 = TweenService:Create(Frame303, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween157:Play()
	local tween158 = TweenService:Create(Frame304, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween158:Play()
	UIStroke163.Color = Color3.fromRGB(255, 0, 0)
	UIStroke163.Transparency = 0.25
	local RuzBtn_Camlock, Lbl4 = createUIGradient2("RuzBtn_Camlock", 0.6, "")
	createSpinImg(RuzBtn_Camlock, "rbxassetid://114084146151777", Lbl4)
	Lbl4.Text = "CAMLOCK"
end)

createKeybindRow(14, Scroll4)
createTextLabel2(15, Scroll4, "Toggle_Prediction", "Prediction", "Enable movement prediction")

Players.LocalPlayer.CharacterAdded:Connect(function(character7)
end)

createDivider(16, Scroll4, "Murderer")
local Toggle_HoldEveryoneAsHostage, UIStroke170 = createFrame(36, 17, Scroll4)
Toggle_HoldEveryoneAsHostage.Name = "Toggle_Hold Everyone As Hostage"
local TextLabel206 = Instance.new("TextLabel")
TextLabel206.Size = UDim2.new(1, -72, 0, 14)
TextLabel206.Position = UDim2.new(0, 10, 0, 5)
TextLabel206.BackgroundTransparency = 1
TextLabel206.Text = "Hold Everyone As Hostage"
TextLabel206.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel206.TextSize = 11
TextLabel206.Font = Enum.Font.ArialBold
TextLabel206.TextXAlignment = Enum.TextXAlignment.Left
TextLabel206.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel206.Parent = Toggle_HoldEveryoneAsHostage
local TextLabel207 = Instance.new("TextLabel")
TextLabel207.Size = UDim2.new(1, -72, 0, 11)
TextLabel207.Position = UDim2.new(0, 10, 0, 20)
TextLabel207.BackgroundTransparency = 1
TextLabel207.Text = "Only works as Murderer (knife in hand) — holds everyone 5 studs in front, no collision"
TextLabel207.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel207.TextSize = 9
TextLabel207.Font = Enum.Font.Arial
TextLabel207.TextXAlignment = Enum.TextXAlignment.Left
TextLabel207.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel207.Parent = Toggle_HoldEveryoneAsHostage
local Frame314 = Instance.new("Frame")
Frame314.Size = UDim2.new(0, 34, 0, 18)
Frame314.Position = UDim2.new(1, -44, 0.5, 0)
Frame314.AnchorPoint = Vector2.new(1, 0.5)
Frame314.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame314.BorderSizePixel = 0
Frame314.Parent = Toggle_HoldEveryoneAsHostage
local UICorner322 = Instance.new("UICorner")
UICorner322.CornerRadius = UDim.new(1, 0)
UICorner322.Parent = Frame314
local Frame315 = Instance.new("Frame")
Frame315.Size = UDim2.new(0, 12, 0, 12)
Frame315.Position = UDim2.new(0, 3, 0.5, 0)
Frame315.AnchorPoint = Vector2.new(0, 0.5)
Frame315.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame315.BorderSizePixel = 0
Frame315.Parent = Frame314
local UICorner323 = Instance.new("UICorner")
UICorner323.CornerRadius = UDim.new(1, 0)
UICorner323.Parent = Frame315
local UIStroke171 = Instance.new("UIStroke")
UIStroke171.Color = Color3.fromRGB(170, 20, 40)
UIStroke171.Thickness = 1.2
UIStroke171.Transparency = 0.3
UIStroke171.Parent = Frame315
local TextButton172 = Instance.new("TextButton")
TextButton172.Size = UDim2.new(1, 0, 1, 0)
TextButton172.BackgroundTransparency = 1
TextButton172.Text = ""
TextButton172.Parent = Toggle_HoldEveryoneAsHostage

TextButton172.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween164 = TweenService:Create(Frame314, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween164:Play()
	local tween165 = TweenService:Create(Frame315, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween165:Play()
	UIStroke170.Color = Color3.fromRGB(255, 0, 0)
	UIStroke170.Transparency = 0.25

	RunService.Heartbeat:Connect(function(deltaTime15)
		Players.LocalPlayer.Backpack:FindFirstChild("Knife")
		Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local players5 = Players:GetPlayers()

		for i59, v61 in ipairs(players5) do
			v61.Character:FindFirstChild("HumanoidRootPart")
			v61.Character:FindFirstChildOfClass("Humanoid")
		end
		-- [envlog] error: LPH:6138: Script:3: attempt to compare number < userdata
	end)
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character8)
end)

local HitboxWarning, UIStroke172 = createFrame(30, 18, Scroll4)
HitboxWarning.Name = "HitboxWarning"
HitboxWarning.BackgroundTransparency = 1
UIStroke172.Transparency = 1
local TextLabel208 = Instance.new("TextLabel")
TextLabel208.Size = UDim2.new(1, -16, 1, 0)
TextLabel208.Position = UDim2.new(0, 8, 0, 0)
TextLabel208.BackgroundTransparency = 1
TextLabel208.Text = " Only works in Murderer stab!"
TextLabel208.TextColor3 = Color3.fromRGB(255, 170, 50)
TextLabel208.TextSize = 11
TextLabel208.Font = Enum.Font.ArialBold
TextLabel208.TextXAlignment = Enum.TextXAlignment.Left
TextLabel208.Parent = HitboxWarning
createTextLabel(19, Scroll4, "Slider_Hitbox Expander", "Hitbox Expander", "12 stud", "Target hitbox size — larger value = easier to hit", 0.2)
local Toggle_HitboxActived, UIStroke175 = createFrame(36, 20, Scroll4)
Toggle_HitboxActived.Name = "Toggle_Hitbox Actived"
local TextLabel212 = Instance.new("TextLabel")
TextLabel212.Size = UDim2.new(1, -72, 0, 14)
TextLabel212.Position = UDim2.new(0, 10, 0, 5)
TextLabel212.BackgroundTransparency = 1
TextLabel212.Text = "Hitbox Actived"
TextLabel212.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel212.TextSize = 11
TextLabel212.Font = Enum.Font.ArialBold
TextLabel212.TextXAlignment = Enum.TextXAlignment.Left
TextLabel212.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel212.Parent = Toggle_HitboxActived
local TextLabel213 = Instance.new("TextLabel")
TextLabel213.Size = UDim2.new(1, -72, 0, 11)
TextLabel213.Position = UDim2.new(0, 10, 0, 20)
TextLabel213.BackgroundTransparency = 1
TextLabel213.Text = "Only works as Murderer (knife/stab)"
TextLabel213.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel213.TextSize = 9
TextLabel213.Font = Enum.Font.Arial
TextLabel213.TextXAlignment = Enum.TextXAlignment.Left
TextLabel213.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel213.Parent = Toggle_HitboxActived
local Frame322 = Instance.new("Frame")
Frame322.Size = UDim2.new(0, 34, 0, 18)
Frame322.Position = UDim2.new(1, -44, 0.5, 0)
Frame322.AnchorPoint = Vector2.new(1, 0.5)
Frame322.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame322.BorderSizePixel = 0
Frame322.Parent = Toggle_HitboxActived
local UICorner330 = Instance.new("UICorner")
UICorner330.CornerRadius = UDim.new(1, 0)
UICorner330.Parent = Frame322
local Frame323 = Instance.new("Frame")
Frame323.Size = UDim2.new(0, 12, 0, 12)
Frame323.Position = UDim2.new(0, 3, 0.5, 0)
Frame323.AnchorPoint = Vector2.new(0, 0.5)
Frame323.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame323.BorderSizePixel = 0
Frame323.Parent = Frame322
local UICorner331 = Instance.new("UICorner")
UICorner331.CornerRadius = UDim.new(1, 0)
UICorner331.Parent = Frame323
local UIStroke176 = Instance.new("UIStroke")
UIStroke176.Color = Color3.fromRGB(170, 20, 40)
UIStroke176.Thickness = 1.2
UIStroke176.Transparency = 0.3
UIStroke176.Parent = Frame323
local TextButton174 = Instance.new("TextButton")
TextButton174.Size = UDim2.new(1, 0, 1, 0)
TextButton174.BackgroundTransparency = 1
TextButton174.Text = ""
TextButton174.Parent = Toggle_HitboxActived

TextButton174.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween166 = TweenService:Create(Frame322, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween166:Play()
	local tween167 = TweenService:Create(Frame323, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween167:Play()
	UIStroke175.Color = Color3.fromRGB(255, 0, 0)
	UIStroke175.Transparency = 0.25

	RunService.RenderStepped:Connect(function(deltaTime16)
		local players6 = Players:GetPlayers()

		for i60, v62 in ipairs(players6) do
			v62.Character:FindFirstChild("HumanoidRootPart")
			v62.Character:FindFirstChildOfClass("Humanoid")
		end
		-- [envlog] error: LPH:6252: Script:3: attempt to compare number < userdata
	end)
end)

local function helper2(child)
	local result39 = child.Name:lower()
	result39:find("bomb")
end

local function onActivated(child)
	helper2(child)

	child.Activated:Connect(function(inputObject6, clickCount5)
		local HumanoidRootPart9 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local Humanoid11 = Players.LocalPlayer.Character:FindFirstChild("Humanoid")
		local Remote4 = child:FindFirstChild("Remote")
		Humanoid11:GetState()
		Remote4:FireServer(CFrame.new(((HumanoidRootPart9.Position + (HumanoidRootPart9.CFrame.LookVector * 4)) + Vector3.new(0, 2, 0)), (((HumanoidRootPart9.Position + (HumanoidRootPart9.CFrame.LookVector * 4)) + Vector3.new(0, 2, 0)) + HumanoidRootPart9.CFrame.LookVector)), 50)
	end)
end

Players.LocalPlayer.CharacterAdded:Connect(function(character9)
	character9.ChildAdded:Connect(function(child23)
		helper2(child23)
		onActivated(child23)
	end)

	local children22 = character9:GetChildren()

	for i51, v53 in ipairs(children22) do
		helper2(v53)
		onActivated(v53)
	end
end)

Players.LocalPlayer.Character.ChildAdded:Connect(function(child17)
	helper2(child17)
	onActivated(child17)
end)

local children = Players.LocalPlayer.Character:GetChildren()

for i2, v2 in ipairs(children) do
	helper2(v2)
	onActivated(v2)
end

task.spawn(function()
	task.wait(2)
	task.wait(2)
	-- [envlog] the statements above repeat forever (loop)
end)

Players.LocalPlayer.CharacterAdded:Connect(function(character10)
	task.wait(1)
end)

createDivider(1, Scroll5, "Bomb")
local Toggle_FreeGoldBomb, UIStroke177 = createFrame(36, 2, Scroll5)
Toggle_FreeGoldBomb.Name = "Toggle_Free Gold Bomb"
local TextLabel215 = Instance.new("TextLabel")
TextLabel215.Size = UDim2.new(1, -72, 0, 14)
TextLabel215.Position = UDim2.new(0, 10, 0, 5)
TextLabel215.BackgroundTransparency = 1
TextLabel215.Text = "Free Gold Bomb"
TextLabel215.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel215.TextSize = 11
TextLabel215.Font = Enum.Font.ArialBold
TextLabel215.TextXAlignment = Enum.TextXAlignment.Left
TextLabel215.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel215.Parent = Toggle_FreeGoldBomb
local TextLabel216 = Instance.new("TextLabel")
TextLabel216.Size = UDim2.new(1, -72, 0, 11)
TextLabel216.Position = UDim2.new(0, 10, 0, 20)
TextLabel216.BackgroundTransparency = 1
TextLabel216.Text = "Free visual gold bomb — no pass required, auto-refreshes"
TextLabel216.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel216.TextSize = 9
TextLabel216.Font = Enum.Font.Arial
TextLabel216.TextXAlignment = Enum.TextXAlignment.Left
TextLabel216.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel216.Parent = Toggle_FreeGoldBomb
local Frame328 = Instance.new("Frame")
Frame328.Size = UDim2.new(0, 34, 0, 18)
Frame328.Position = UDim2.new(1, -44, 0.5, 0)
Frame328.AnchorPoint = Vector2.new(1, 0.5)
Frame328.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame328.BorderSizePixel = 0
Frame328.Parent = Toggle_FreeGoldBomb
local UICorner333 = Instance.new("UICorner")
UICorner333.CornerRadius = UDim.new(1, 0)
UICorner333.Parent = Frame328
local Frame329 = Instance.new("Frame")
Frame329.Size = UDim2.new(0, 12, 0, 12)
Frame329.Position = UDim2.new(0, 3, 0.5, 0)
Frame329.AnchorPoint = Vector2.new(0, 0.5)
Frame329.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame329.BorderSizePixel = 0
Frame329.Parent = Frame328
local UICorner334 = Instance.new("UICorner")
UICorner334.CornerRadius = UDim.new(1, 0)
UICorner334.Parent = Frame329
local UIStroke178 = Instance.new("UIStroke")
UIStroke178.Color = Color3.fromRGB(170, 20, 40)
UIStroke178.Thickness = 1.2
UIStroke178.Transparency = 0.3
UIStroke178.Parent = Frame329
local TextButton175 = Instance.new("TextButton")
TextButton175.Size = UDim2.new(1, 0, 1, 0)
TextButton175.BackgroundTransparency = 1
TextButton175.Text = ""
TextButton175.Parent = Toggle_FreeGoldBomb

local function createVisualGoldDrop()
	local VisualGoldDrop = Instance.new("Part")
	VisualGoldDrop.Name = "VisualGoldDrop"
	VisualGoldDrop.Size = Vector3.new(1.6499999761581421, 0.89999997615814209, 1.2999999523162842)
	VisualGoldDrop.Transparency = 0
	VisualGoldDrop.CanCollide = true
	local SpecialMesh = Instance.new("SpecialMesh")
	SpecialMesh.MeshId = "http://www.roblox.com/asset/?id=104516854"
	SpecialMesh.TextureId = "rbxassetid://111999858263148"
	SpecialMesh.Scale = Vector3.new(1.5, 1.5, 1.5)
	SpecialMesh.Parent = VisualGoldDrop
	return VisualGoldDrop
end

TextButton175.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween168 = TweenService:Create(Frame328, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween168:Play()
	local tween169 = TweenService:Create(Frame329, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween169:Play()
	UIStroke177.Color = Color3.fromRGB(255, 0, 0)
	UIStroke177.Transparency = 0.25
	local children23 = Players.LocalPlayer.Backpack:GetChildren()

	for i52, v54 in ipairs(children23) do
	end

	local children24 = Players.LocalPlayer.Character:GetChildren()

	for i53, v55 in ipairs(children24) do
	end

	local GoldBombVisual = Instance.new("Tool")
	GoldBombVisual.Name = "GoldBomb (Visual)"
	GoldBombVisual.RequiresHandle = true
	GoldBombVisual.CanBeDropped = false
	GoldBombVisual.TextureId = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=70754337097792"
	GoldBombVisual.Grip = CFrame.new(-0.6, 0, -0.4, -0.936466694, -3.63886356e-05, -0.350756258, -0.168184027, 0.877594054, 0.448935181, 0.30780527, 0.479404479, -0.821843743)
	local VisualGoldDrop = createVisualGoldDrop()
	VisualGoldDrop.Name = "Handle"
	VisualGoldDrop.CanCollide = false
	VisualGoldDrop.Parent = GoldBombVisual

	GoldBombVisual.Activated:Connect(function(inputObject5, clickCount4)
		local HumanoidRootPart7 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local VisualGoldDrop2 = createVisualGoldDrop()
		VisualGoldDrop2.CFrame = (HumanoidRootPart7.CFrame * CFrame.new(0, -3.2, 0))
		VisualGoldDrop2.Parent = workspace
		local Smoke = Instance.new("Smoke", VisualGoldDrop2)
		Smoke.Color = Color3.fromRGB(128, 128, 128)
		Smoke.Opacity = 0.2
		Smoke.Size = 0.1
		Smoke.RiseVelocity = 1
		Smoke.Enabled = true
		local BillboardGui2 = Instance.new("BillboardGui", VisualGoldDrop2)
		BillboardGui2.Size = UDim2.new(3, 0, 3, 0)
		BillboardGui2.ExtentsOffset = Vector3.new(0, 0, 1)
		local ImageLabel49 = Instance.new("ImageLabel", BillboardGui2)
		ImageLabel49.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel49.BackgroundTransparency = 1
		ImageLabel49.Image = "http://www.roblox.com/asset/?id=104564194"
		ImageLabel49.Visible = false

		task.spawn(function()
			for _, visible in ipairs({
				true, false, true, false, true, false, true, false, true, false, true, false, true,
				false, true, false, true, false, true, false, true, false, true, false, true, false,
				true, false, true, false, true, false, true, false, true, false, true, false, true,
				false, true, false, true, false, true, false, true, false, true, false, true,
			}) do
				ImageLabel49.Visible = visible
				task.wait(0.18)
			end
			-- [envlog] stopped after 50 waits
		end)

		local BodyVelocity2 = Instance.new("BodyVelocity", VisualGoldDrop2)
		BodyVelocity2.MaxForce = Vector3.new(100000, 100000, 100000)
		local mouse = Players.LocalPlayer:GetMouse()
		BodyVelocity2.Velocity = (((mouse.Hit.p - HumanoidRootPart7.Position).Unit * 25) + Vector3.new(0, 10, 0))
		game.Debris:AddItem(BodyVelocity2, 0.1)

		task.spawn(function()
			local Humanoid10 = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			Humanoid10:GetState()
		end)

		GoldBombVisual:GetChildren()
		VisualGoldDrop.Transparency = 1
		local SpecialMesh3 = VisualGoldDrop:FindFirstChildOfClass("SpecialMesh")
		SpecialMesh3.Scale = Vector3.new(0, 0, 0)
		task.wait(4)
		local Part4 = Instance.new("Part")
		Part4.Shape = Enum.PartType.Ball
		Part4.Size = Vector3.new(0.5, 0.5, 0.5)
		Part4.Color = Color3.fromRGB(255, 215, 0)
		Part4.Material = Enum.Material.Neon
		Part4.Anchored = true
		Part4.CanCollide = false
		Part4.CFrame = CFrame.new(VisualGoldDrop2.Position + Vector3.new(0, 1.2000000476837158, 0))
		Part4.Parent = workspace
		local ParticleEmitter = Instance.new("ParticleEmitter")
		ParticleEmitter.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 240, 130)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 190, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 90, 0)) })
		ParticleEmitter.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.2), NumberSequenceKeypoint.new(0.5, 0.6), NumberSequenceKeypoint.new(1, 0) })
		ParticleEmitter.Speed = NumberRange.new(12, 25)
		ParticleEmitter.SpreadAngle = Vector2.new(180, 180)
		ParticleEmitter.Lifetime = NumberRange.new(0.4, 0.7)
		ParticleEmitter.Acceleration = Vector3.new(0, -8, 0)
		ParticleEmitter.LightEmission = 1
		ParticleEmitter.Parent = Part4

		task.spawn(function()
			task.wait(0.02)
			ParticleEmitter:Emit(60)
		end)

		task.spawn(function()
			for _, item in ipairs({
				{ x9 = 1.2000000476837158, transparency = 0.083333333333333329 },
				{ x9 = 1.9000000953674316, transparency = 0.16666666666666666 },
				{ x9 = 2.6000001430511475, transparency = 0.25 },
				{ x9 = 3.3000001907348633, transparency = 0.33333333333333331 },
				{ x9 = 4, transparency = 0.41666666666666669 },
				{ x9 = 4.6999998092651367, transparency = 0.5 },
				{ x9 = 5.3999996185302734, transparency = 0.58333333333333337 },
				{ x9 = 6.0999994277954102, transparency = 0.66666666666666663 },
				{ x9 = 6.7999992370605469, transparency = 0.75 },
				{ x9 = 7.4999990463256836, transparency = 0.83333333333333337 },
				{ x9 = 8.1999988555908203, transparency = 0.91666666666666663 },
				{ x9 = 8.899998664855957, transparency = 1 },
			}) do
				Part4.Size = Vector3.new(item.x9, item.x9, item.x9)
				Part4.Transparency = item.transparency
				task.wait(0.015)
			end

			Part4:Destroy()
		end)

		VisualGoldDrop2:Destroy()
		GoldBombVisual:GetChildren()
		VisualGoldDrop.Transparency = 0
		local SpecialMesh4 = VisualGoldDrop:FindFirstChildOfClass("SpecialMesh")
		SpecialMesh4.Scale = Vector3.new(1.5, 1.5, 1.5)
	end)

	GoldBombVisual.Parent = Players.LocalPlayer.Backpack
end)

createDivider(3, Scroll5, "Bomb Jump")
local Toggle_GoldBombJump, UIStroke179 = createFrame(28, 4, Scroll5)
Toggle_GoldBombJump.Name = "Toggle_Gold Bomb Jump"
local TextLabel218 = Instance.new("TextLabel")
TextLabel218.Size = UDim2.new(1, -72, 0, 14)
TextLabel218.Position = UDim2.new(0, 10, 0, 7)
TextLabel218.BackgroundTransparency = 1
TextLabel218.Text = "Gold Bomb Jump"
TextLabel218.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel218.TextSize = 11
TextLabel218.Font = Enum.Font.ArialBold
TextLabel218.TextXAlignment = Enum.TextXAlignment.Left
TextLabel218.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel218.Parent = Toggle_GoldBombJump
local Frame334 = Instance.new("Frame")
Frame334.Size = UDim2.new(0, 34, 0, 18)
Frame334.Position = UDim2.new(1, -44, 0.5, 0)
Frame334.AnchorPoint = Vector2.new(1, 0.5)
Frame334.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame334.BorderSizePixel = 0
Frame334.Parent = Toggle_GoldBombJump
local UICorner336 = Instance.new("UICorner")
UICorner336.CornerRadius = UDim.new(1, 0)
UICorner336.Parent = Frame334
local Frame335 = Instance.new("Frame")
Frame335.Size = UDim2.new(0, 12, 0, 12)
Frame335.Position = UDim2.new(0, 3, 0.5, 0)
Frame335.AnchorPoint = Vector2.new(0, 0.5)
Frame335.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame335.BorderSizePixel = 0
Frame335.Parent = Frame334
local UICorner337 = Instance.new("UICorner")
UICorner337.CornerRadius = UDim.new(1, 0)
UICorner337.Parent = Frame335
local UIStroke180 = Instance.new("UIStroke")
UIStroke180.Color = Color3.fromRGB(170, 20, 40)
UIStroke180.Thickness = 1.2
UIStroke180.Transparency = 0.3
UIStroke180.Parent = Frame335
local TextButton176 = Instance.new("TextButton")
TextButton176.Size = UDim2.new(1, 0, 1, 0)
TextButton176.BackgroundTransparency = 1
TextButton176.Text = ""
TextButton176.Parent = Toggle_GoldBombJump

TextButton176.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween170 = TweenService:Create(Frame334, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween170:Play()
	local tween171 = TweenService:Create(Frame335, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween171:Play()
	UIStroke179.Color = Color3.fromRGB(255, 0, 0)
	UIStroke179.Transparency = 0.25

	local connection22 = workspace.ChildAdded:Connect(function(child24)
	end)
end)

local Toggle_BombJump, UIStroke181 = createFrame(28, 5, Scroll5)
Toggle_BombJump.Name = "Toggle_Bomb Jump"
local TextLabel219 = Instance.new("TextLabel")
TextLabel219.Size = UDim2.new(1, -72, 0, 14)
TextLabel219.Position = UDim2.new(0, 10, 0, 7)
TextLabel219.BackgroundTransparency = 1
TextLabel219.Text = "Bomb Jump"
TextLabel219.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel219.TextSize = 11
TextLabel219.Font = Enum.Font.ArialBold
TextLabel219.TextXAlignment = Enum.TextXAlignment.Left
TextLabel219.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel219.Parent = Toggle_BombJump
local Frame337 = Instance.new("Frame")
Frame337.Size = UDim2.new(0, 34, 0, 18)
Frame337.Position = UDim2.new(1, -44, 0.5, 0)
Frame337.AnchorPoint = Vector2.new(1, 0.5)
Frame337.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame337.BorderSizePixel = 0
Frame337.Parent = Toggle_BombJump
local UICorner339 = Instance.new("UICorner")
UICorner339.CornerRadius = UDim.new(1, 0)
UICorner339.Parent = Frame337
local Frame338 = Instance.new("Frame")
Frame338.Size = UDim2.new(0, 12, 0, 12)
Frame338.Position = UDim2.new(0, 3, 0.5, 0)
Frame338.AnchorPoint = Vector2.new(0, 0.5)
Frame338.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame338.BorderSizePixel = 0
Frame338.Parent = Frame337
local UICorner340 = Instance.new("UICorner")
UICorner340.CornerRadius = UDim.new(1, 0)
UICorner340.Parent = Frame338
local UIStroke182 = Instance.new("UIStroke")
UIStroke182.Color = Color3.fromRGB(170, 20, 40)
UIStroke182.Thickness = 1.2
UIStroke182.Transparency = 0.3
UIStroke182.Parent = Frame338
local TextButton177 = Instance.new("TextButton")
TextButton177.Size = UDim2.new(1, 0, 1, 0)
TextButton177.BackgroundTransparency = 1
TextButton177.Text = ""
TextButton177.Parent = Toggle_BombJump

TextButton177.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween172 = TweenService:Create(Frame337, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween172:Play()
	local tween173 = TweenService:Create(Frame338, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween173:Play()
	UIStroke181.Color = Color3.fromRGB(255, 0, 0)
	UIStroke181.Transparency = 0.25
	connection22:Disconnect()

	workspace.ChildAdded:Connect(function(child25)
	end)
end)

createDivider(6, Scroll5, "Fireflies")
local Toggle_FirefliesJumpHelper, UIStroke183 = createFrame(28, 7, Scroll5)
Toggle_FirefliesJumpHelper.Name = "Toggle_Fireflies Jump Helper"
local TextLabel221 = Instance.new("TextLabel")
TextLabel221.Size = UDim2.new(1, -72, 0, 14)
TextLabel221.Position = UDim2.new(0, 10, 0, 7)
TextLabel221.BackgroundTransparency = 1
TextLabel221.Text = "Fireflies Jump Helper"
TextLabel221.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel221.TextSize = 11
TextLabel221.Font = Enum.Font.ArialBold
TextLabel221.TextXAlignment = Enum.TextXAlignment.Left
TextLabel221.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel221.Parent = Toggle_FirefliesJumpHelper
local Frame343 = Instance.new("Frame")
Frame343.Size = UDim2.new(0, 34, 0, 18)
Frame343.Position = UDim2.new(1, -44, 0.5, 0)
Frame343.AnchorPoint = Vector2.new(1, 0.5)
Frame343.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame343.BorderSizePixel = 0
Frame343.Parent = Toggle_FirefliesJumpHelper
local UICorner342 = Instance.new("UICorner")
UICorner342.CornerRadius = UDim.new(1, 0)
UICorner342.Parent = Frame343
local Frame344 = Instance.new("Frame")
Frame344.Size = UDim2.new(0, 12, 0, 12)
Frame344.Position = UDim2.new(0, 3, 0.5, 0)
Frame344.AnchorPoint = Vector2.new(0, 0.5)
Frame344.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame344.BorderSizePixel = 0
Frame344.Parent = Frame343
local UICorner343 = Instance.new("UICorner")
UICorner343.CornerRadius = UDim.new(1, 0)
UICorner343.Parent = Frame344
local UIStroke184 = Instance.new("UIStroke")
UIStroke184.Color = Color3.fromRGB(170, 20, 40)
UIStroke184.Thickness = 1.2
UIStroke184.Transparency = 0.3
UIStroke184.Parent = Frame344
local TextButton178 = Instance.new("TextButton")
TextButton178.Size = UDim2.new(1, 0, 1, 0)
TextButton178.BackgroundTransparency = 1
TextButton178.Text = ""
TextButton178.Parent = Toggle_FirefliesJumpHelper

TextButton178.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween174 = TweenService:Create(Frame343, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween174:Play()
	local tween175 = TweenService:Create(Frame344, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween175:Play()
	UIStroke183.Color = Color3.fromRGB(255, 0, 0)
	UIStroke183.Transparency = 0.25
	local Handle2 = workspace:FindFirstChild("Handle2")
	Handle2:GetAttribute("FFJumpSetup")

	workspace.ChildAdded:Connect(function(child26)
	end)
end)

createDivider(1, Scroll6, "Grab Gun")
local Button_GrabGun, UIStroke185 = createFrame(28, 2, Scroll6)
Button_GrabGun.Name = "Button_Grab Gun"
local TextLabel223 = Instance.new("TextLabel")
TextLabel223.Size = UDim2.new(1, -74, 0, 14)
TextLabel223.Position = UDim2.new(0, 10, 0, 7)
TextLabel223.BackgroundTransparency = 1
TextLabel223.Text = "Grab Gun"
TextLabel223.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel223.TextSize = 11
TextLabel223.Font = Enum.Font.ArialBold
TextLabel223.TextXAlignment = Enum.TextXAlignment.Left
TextLabel223.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel223.Parent = Button_GrabGun
local TextButton179 = Instance.new("TextButton")
TextButton179.Size = UDim2.new(0, 52, 0, 20)
TextButton179.Position = UDim2.new(1, -8, 0.5, 0)
TextButton179.AnchorPoint = Vector2.new(1, 0.5)
TextButton179.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton179.BackgroundTransparency = 0.1
TextButton179.BorderSizePixel = 0
TextButton179.Text = "Run"
TextButton179.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton179.TextSize = 10
TextButton179.Font = Enum.Font.ArialBold
TextButton179.Parent = Button_GrabGun
local UICorner345 = Instance.new("UICorner")
UICorner345.CornerRadius = UDim.new(0, 5)
UICorner345.Parent = TextButton179
local UIStroke186 = Instance.new("UIStroke")
UIStroke186.Color = Color3.fromRGB(255, 40, 60)
UIStroke186.Thickness = 1
UIStroke186.Transparency = 0.3
UIStroke186.Parent = TextButton179

TextButton179.MouseEnter:Connect(function()
	local tween176 = TweenService:Create(TextButton179, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
	tween176:Play()
end)

TextButton179.MouseLeave:Connect(function()
	local tween177 = TweenService:Create(TextButton179, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
	tween177:Play()
end)

TextButton179.MouseButton1Down:Connect(function(x4, y4)
	local tween178 = TweenService:Create(TextButton179, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
	tween178:Play()
end)

TextButton179.MouseButton1Up:Connect(function()
	local tween179 = TweenService:Create(TextButton179, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
	tween179:Play()
end)

TextButton179.MouseButton1Click:Connect(function()
	Sound:Play()
	workspace:FindFirstChild("GunDrop", true)
	Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	Players.LocalPlayer.Character:FindFirstChild("Gun")
end)

createKeybindRow(3, Scroll6)
createFrame3(4, Scroll6, "Toggle_Auto Grab Gun", "Auto Grab Gun")
getgenv().RuzOldPos = nil
getgenv().RuzFPDH = 0
createDivider(5, Scroll6, "Fling")
local Button_FlingMurderer1Time, UIStroke192 = createFrame(36, 6, Scroll6)
Button_FlingMurderer1Time.Name = "Button_Fling Murderer 1 Time"
local TextLabel228 = Instance.new("TextLabel")
TextLabel228.Size = UDim2.new(1, -74, 0, 14)
TextLabel228.Position = UDim2.new(0, 10, 0, 5)
TextLabel228.BackgroundTransparency = 1
TextLabel228.Text = "Fling Murderer 1 Time"
TextLabel228.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel228.TextSize = 11
TextLabel228.Font = Enum.Font.ArialBold
TextLabel228.TextXAlignment = Enum.TextXAlignment.Left
TextLabel228.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel228.Parent = Button_FlingMurderer1Time
local TextLabel229 = Instance.new("TextLabel")
TextLabel229.Size = UDim2.new(1, -74, 0, 11)
TextLabel229.Position = UDim2.new(0, 10, 0, 20)
TextLabel229.BackgroundTransparency = 1
TextLabel229.Text = "Flings the player carrying a Knife"
TextLabel229.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel229.TextSize = 9
TextLabel229.Font = Enum.Font.Arial
TextLabel229.TextXAlignment = Enum.TextXAlignment.Left
TextLabel229.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel229.Parent = Button_FlingMurderer1Time
local TextButton182 = Instance.new("TextButton")
TextButton182.Size = UDim2.new(0, 52, 0, 20)
TextButton182.Position = UDim2.new(1, -8, 0.5, 0)
TextButton182.AnchorPoint = Vector2.new(1, 0.5)
TextButton182.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton182.BackgroundTransparency = 0.1
TextButton182.BorderSizePixel = 0
TextButton182.Text = "Run"
TextButton182.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton182.TextSize = 10
TextButton182.Font = Enum.Font.ArialBold
TextButton182.Parent = Button_FlingMurderer1Time
local UICorner353 = Instance.new("UICorner")
UICorner353.CornerRadius = UDim.new(0, 5)
UICorner353.Parent = TextButton182
local UIStroke193 = Instance.new("UIStroke")
UIStroke193.Color = Color3.fromRGB(255, 40, 60)
UIStroke193.Thickness = 1
UIStroke193.Transparency = 0.3
UIStroke193.Parent = TextButton182

TextButton182.MouseEnter:Connect(function()
	local tween185 = TweenService:Create(TextButton182, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
	tween185:Play()
end)

TextButton182.MouseLeave:Connect(function()
	local tween186 = TweenService:Create(TextButton182, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
	tween186:Play()
end)

TextButton182.MouseButton1Down:Connect(function(x5, y5)
	local tween187 = TweenService:Create(TextButton182, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
	tween187:Play()
end)

TextButton182.MouseButton1Up:Connect(function()
	local tween188 = TweenService:Create(TextButton182, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
	tween188:Play()
end)

local function setupV4(v, childName)
	v:FindFirstChild("Backpack")
	v.Character:FindFirstChild(childName)
end

TextButton182.MouseButton1Click:Connect(function()
	Sound:Play()
	local players3 = Players:GetPlayers()

	for i54, v56 in ipairs(players3) do
		setupV4(v56, "Knife")

		task.spawn(function()
			Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			v56.Character:FindFirstChildOfClass("Humanoid")
			v56.Character:FindFirstChild("Head")
			local Accessory = v56.Character:FindFirstChildOfClass("Accessory")
			Accessory:FindFirstChild("Handle")
			-- [envlog] error: LPH:6806: Script:3: attempt to compare userdata < number
		end, v56)
	end
end)

local Button_FlingSheriff1Time, UIStroke194 = createFrame(36, 7, Scroll6)
Button_FlingSheriff1Time.Name = "Button_Fling Sheriff 1 Time"
local TextLabel230 = Instance.new("TextLabel")
TextLabel230.Size = UDim2.new(1, -74, 0, 14)
TextLabel230.Position = UDim2.new(0, 10, 0, 5)
TextLabel230.BackgroundTransparency = 1
TextLabel230.Text = "Fling Sheriff 1 Time"
TextLabel230.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel230.TextSize = 11
TextLabel230.Font = Enum.Font.ArialBold
TextLabel230.TextXAlignment = Enum.TextXAlignment.Left
TextLabel230.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel230.Parent = Button_FlingSheriff1Time
local TextLabel231 = Instance.new("TextLabel")
TextLabel231.Size = UDim2.new(1, -74, 0, 11)
TextLabel231.Position = UDim2.new(0, 10, 0, 20)
TextLabel231.BackgroundTransparency = 1
TextLabel231.Text = "Flings the player carrying a Gun"
TextLabel231.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel231.TextSize = 9
TextLabel231.Font = Enum.Font.Arial
TextLabel231.TextXAlignment = Enum.TextXAlignment.Left
TextLabel231.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel231.Parent = Button_FlingSheriff1Time
local TextButton183 = Instance.new("TextButton")
TextButton183.Size = UDim2.new(0, 52, 0, 20)
TextButton183.Position = UDim2.new(1, -8, 0.5, 0)
TextButton183.AnchorPoint = Vector2.new(1, 0.5)
TextButton183.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton183.BackgroundTransparency = 0.1
TextButton183.BorderSizePixel = 0
TextButton183.Text = "Run"
TextButton183.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton183.TextSize = 10
TextButton183.Font = Enum.Font.ArialBold
TextButton183.Parent = Button_FlingSheriff1Time
local UICorner355 = Instance.new("UICorner")
UICorner355.CornerRadius = UDim.new(0, 5)
UICorner355.Parent = TextButton183
local UIStroke195 = Instance.new("UIStroke")
UIStroke195.Color = Color3.fromRGB(255, 40, 60)
UIStroke195.Thickness = 1
UIStroke195.Transparency = 0.3
UIStroke195.Parent = TextButton183

TextButton183.MouseEnter:Connect(function()
	local tween189 = TweenService:Create(TextButton183, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
	tween189:Play()
end)

TextButton183.MouseLeave:Connect(function()
	local tween190 = TweenService:Create(TextButton183, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
	tween190:Play()
end)

TextButton183.MouseButton1Down:Connect(function(x6, y6)
	local tween191 = TweenService:Create(TextButton183, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
	tween191:Play()
end)

TextButton183.MouseButton1Up:Connect(function()
	local tween192 = TweenService:Create(TextButton183, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
	tween192:Play()
end)

TextButton183.MouseButton1Click:Connect(function()
	Sound:Play()
	local players4 = Players:GetPlayers()

	for i55, v57 in ipairs(players4) do
		setupV4(v57, "Gun")

		task.spawn(function()
			Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			v56.Character:FindFirstChildOfClass("Humanoid")
			v56.Character:FindFirstChild("Head")
			local Accessory = v56.Character:FindFirstChildOfClass("Accessory")
			Accessory:FindFirstChild("Handle")
			-- [envlog] error: LPH:6806: Script:3: attempt to compare userdata < number
		end, v57)
	end
end)

createDivider(8, Scroll6, "Anti Fling")
local Toggle_AntiFling, UIStroke196 = createFrame(28, 9, Scroll6)
Toggle_AntiFling.Name = "Toggle_Anti Fling"
local TextLabel233 = Instance.new("TextLabel")
TextLabel233.Size = UDim2.new(1, -72, 0, 14)
TextLabel233.Position = UDim2.new(0, 10, 0, 7)
TextLabel233.BackgroundTransparency = 1
TextLabel233.Text = "Anti Fling"
TextLabel233.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel233.TextSize = 11
TextLabel233.Font = Enum.Font.ArialBold
TextLabel233.TextXAlignment = Enum.TextXAlignment.Left
TextLabel233.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel233.Parent = Toggle_AntiFling
local Frame363 = Instance.new("Frame")
Frame363.Size = UDim2.new(0, 34, 0, 18)
Frame363.Position = UDim2.new(1, -44, 0.5, 0)
Frame363.AnchorPoint = Vector2.new(1, 0.5)
Frame363.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame363.BorderSizePixel = 0
Frame363.Parent = Toggle_AntiFling
local UICorner357 = Instance.new("UICorner")
UICorner357.CornerRadius = UDim.new(1, 0)
UICorner357.Parent = Frame363
local Frame364 = Instance.new("Frame")
Frame364.Size = UDim2.new(0, 12, 0, 12)
Frame364.Position = UDim2.new(0, 3, 0.5, 0)
Frame364.AnchorPoint = Vector2.new(0, 0.5)
Frame364.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame364.BorderSizePixel = 0
Frame364.Parent = Frame363
local UICorner358 = Instance.new("UICorner")
UICorner358.CornerRadius = UDim.new(1, 0)
UICorner358.Parent = Frame364
local UIStroke197 = Instance.new("UIStroke")
UIStroke197.Color = Color3.fromRGB(170, 20, 40)
UIStroke197.Thickness = 1.2
UIStroke197.Transparency = 0.3
UIStroke197.Parent = Frame364
local TextButton184 = Instance.new("TextButton")
TextButton184.Size = UDim2.new(1, 0, 1, 0)
TextButton184.BackgroundTransparency = 1
TextButton184.Text = ""
TextButton184.Parent = Toggle_AntiFling

TextButton184.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween193 = TweenService:Create(Frame363, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween193:Play()
	local tween194 = TweenService:Create(Frame364, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween194:Play()
	UIStroke196.Color = Color3.fromRGB(255, 0, 0)
	UIStroke196.Transparency = 0.25
	local PhysicsService = game:GetService("PhysicsService")
	PhysicsService:CollisionGroupExists("RuzAntiFling")
	PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "Default", false)
	PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "RuzAntiFling", false)
	local descendants30 = Players.LocalPlayer.Character:GetDescendants()

	for i56, v58 in ipairs(descendants30) do
		v58.CollisionGroup = "RuzAntiFling"
	end

	local connection23 = Players.LocalPlayer.Character.DescendantAdded:Connect(function(descendant5)
		descendant5.CollisionGroup = "RuzAntiFling"
	end)

	Players.LocalPlayer.CharacterAdded:Connect(function(character23)
		task.wait(0.5)
		connection23:Disconnect()
		PhysicsService:CollisionGroupExists("RuzAntiFling")
		PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "Default", false)
		PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "RuzAntiFling", false)
		local descendants32 = Players.LocalPlayer.Character:GetDescendants()

		for i61, v63 in ipairs(descendants32) do
			v63.CollisionGroup = "RuzAntiFling"
		end

		Players.LocalPlayer.Character.DescendantAdded:Connect(function(descendant6)
			descendant6.CollisionGroup = "RuzAntiFling"
		end)
	end)
end)

createDivider(10, Scroll6, "Wallhop")
local Toggle_AutoWallhop, UIStroke198 = createFrame(28, 11, Scroll6)
Toggle_AutoWallhop.Name = "Toggle_Auto Wallhop"
local TextLabel235 = Instance.new("TextLabel")
TextLabel235.Size = UDim2.new(1, -72, 0, 14)
TextLabel235.Position = UDim2.new(0, 10, 0, 7)
TextLabel235.BackgroundTransparency = 1
TextLabel235.Text = "Auto Wallhop"
TextLabel235.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel235.TextSize = 11
TextLabel235.Font = Enum.Font.ArialBold
TextLabel235.TextXAlignment = Enum.TextXAlignment.Left
TextLabel235.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel235.Parent = Toggle_AutoWallhop
local Frame369 = Instance.new("Frame")
Frame369.Size = UDim2.new(0, 34, 0, 18)
Frame369.Position = UDim2.new(1, -44, 0.5, 0)
Frame369.AnchorPoint = Vector2.new(1, 0.5)
Frame369.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame369.BorderSizePixel = 0
Frame369.Parent = Toggle_AutoWallhop
local UICorner360 = Instance.new("UICorner")
UICorner360.CornerRadius = UDim.new(1, 0)
UICorner360.Parent = Frame369
local Frame370 = Instance.new("Frame")
Frame370.Size = UDim2.new(0, 12, 0, 12)
Frame370.Position = UDim2.new(0, 3, 0.5, 0)
Frame370.AnchorPoint = Vector2.new(0, 0.5)
Frame370.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame370.BorderSizePixel = 0
Frame370.Parent = Frame369
local UICorner361 = Instance.new("UICorner")
UICorner361.CornerRadius = UDim.new(1, 0)
UICorner361.Parent = Frame370
local UIStroke199 = Instance.new("UIStroke")
UIStroke199.Color = Color3.fromRGB(170, 20, 40)
UIStroke199.Thickness = 1.2
UIStroke199.Transparency = 0.3
UIStroke199.Parent = Frame370
local TextButton185 = Instance.new("TextButton")
TextButton185.Size = UDim2.new(1, 0, 1, 0)
TextButton185.BackgroundTransparency = 1
TextButton185.Text = ""
TextButton185.Parent = Toggle_AutoWallhop

TextButton185.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween195 = TweenService:Create(Frame369, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween195:Play()
	local tween196 = TweenService:Create(Frame370, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween196:Play()
	UIStroke198.Color = Color3.fromRGB(255, 0, 0)
	UIStroke198.Transparency = 0.25

	RunService.Heartbeat:Connect(function(deltaTime17)
		local HumanoidRootPart8 = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		RaycastParams.new().FilterDescendantsInstances = { Players.LocalPlayer.Character }
		RaycastParams.new().FilterType = Enum.RaycastFilterType.Exclude
		workspace:Raycast(HumanoidRootPart8.Position, (workspace.CurrentCamera.CFrame.LookVector * 3), RaycastParams.new())
	end)
end)

createDivider(0, Scroll7, "UI Settings")
local HideKeyRow, UIStroke200 = createFrame(38, 1, Scroll7)
HideKeyRow.Name = "HideKeyRow"
local TextLabel237 = Instance.new("TextLabel")
TextLabel237.Size = UDim2.new(0.55, 0, 1, 0)
TextLabel237.Position = UDim2.new(0, 12, 0, 0)
TextLabel237.BackgroundTransparency = 1
TextLabel237.Text = "Hide Key"
TextLabel237.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel237.TextSize = 13
TextLabel237.Font = Enum.Font.ArialBold
TextLabel237.TextXAlignment = Enum.TextXAlignment.Left
TextLabel237.Parent = HideKeyRow
local TextLabel238 = Instance.new("TextLabel")
TextLabel238.Size = UDim2.new(0.55, 0, 1, 0)
TextLabel238.Position = UDim2.new(0, 12, 0.45, 0)
TextLabel238.BackgroundTransparency = 1
TextLabel238.Text = "Toggle panel visibility"
TextLabel238.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel238.TextSize = 10
TextLabel238.Font = Enum.Font.Arial
TextLabel238.TextXAlignment = Enum.TextXAlignment.Left
TextLabel238.Parent = HideKeyRow
local TextButton186 = Instance.new("TextButton")
TextButton186.Size = UDim2.new(0, 100, 0, 26)
TextButton186.Position = UDim2.new(1, -10, 0.5, 0)
TextButton186.AnchorPoint = Vector2.new(1, 0.5)
TextButton186.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
TextButton186.BackgroundTransparency = 0.1
TextButton186.BorderSizePixel = 0
TextButton186.Text = "RightShift"
TextButton186.TextColor3 = Color3.fromRGB(240, 240, 240)
TextButton186.TextSize = 12
TextButton186.Font = Enum.Font.ArialBold
TextButton186.Parent = HideKeyRow
local UICorner363 = Instance.new("UICorner")
UICorner363.CornerRadius = UDim.new(0, 6)
UICorner363.Parent = TextButton186
local UIStroke201 = Instance.new("UIStroke")
UIStroke201.Color = Color3.fromRGB(60, 60, 60)
UIStroke201.Thickness = 1
UIStroke201.Parent = TextButton186

TextButton186.MouseButton1Click:Connect(function()
	TextButton186.Text = "Press key..."
	TextButton186.TextColor3 = Color3.fromRGB(220, 20, 40)

	UserInputService.InputBegan:Connect(function(input101, gameProcessed101)
	end)
end)

createTextLabel(2, Scroll7, "Slider_UI Size", "UI Size", "100%", "Panel scale — default 100%", 0.5)
createTextLabel2(3, Scroll7, "Toggle_Notifications", "Notifications", "Show RuzHub slide-in notifications (top-right)")
local contents2 = readfile("RuzConfigs/_meta.json")
HttpService:JSONDecode(contents2)
createDivider(10, Scroll7, "Config Manager")
-- isfolder("RuzConfigs") -> false
local Dropdown_SelectConfig, UIStroke206 = createFrame(36, 11, Scroll7)
Dropdown_SelectConfig.Name = "Dropdown_Select Config"
Dropdown_SelectConfig.ClipsDescendants = false
local TextLabel245 = Instance.new("TextLabel")
TextLabel245.Size = UDim2.new(0.48, 0, 0, 14)
TextLabel245.Position = UDim2.new(0, 10, 0, 5)
TextLabel245.BackgroundTransparency = 1
TextLabel245.Text = "Select Config"
TextLabel245.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel245.TextSize = 11
TextLabel245.Font = Enum.Font.ArialBold
TextLabel245.TextXAlignment = Enum.TextXAlignment.Left
TextLabel245.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel245.Parent = Dropdown_SelectConfig
local TextLabel246 = Instance.new("TextLabel")
TextLabel246.Size = UDim2.new(0.48, 0, 0, 11)
TextLabel246.Position = UDim2.new(0, 10, 0, 20)
TextLabel246.BackgroundTransparency = 1
TextLabel246.Text = "Select from saved configs"
TextLabel246.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel246.TextSize = 9
TextLabel246.Font = Enum.Font.Arial
TextLabel246.TextXAlignment = Enum.TextXAlignment.Left
TextLabel246.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel246.Parent = Dropdown_SelectConfig
local TextButton189 = Instance.new("TextButton")
TextButton189.Size = UDim2.new(0, 100, 0, 20)
TextButton189.Position = UDim2.new(1, -8, 0.5, 0)
TextButton189.AnchorPoint = Vector2.new(1, 0.5)
TextButton189.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton189.BackgroundTransparency = 0.1
TextButton189.BorderSizePixel = 0
TextButton189.Text = ""
TextButton189.Parent = Dropdown_SelectConfig
local UICorner372 = Instance.new("UICorner")
UICorner372.CornerRadius = UDim.new(0, 6)
UICorner372.Parent = TextButton189
local UIStroke207 = Instance.new("UIStroke")
UIStroke207.Color = Color3.fromRGB(60, 60, 60)
UIStroke207.Thickness = 1
UIStroke207.Transparency = 0.2
UIStroke207.Parent = TextButton189
local TextLabel247 = Instance.new("TextLabel")
TextLabel247.Size = UDim2.new(1, -24, 1, 0)
TextLabel247.Position = UDim2.new(0, 8, 0, 0)
TextLabel247.BackgroundTransparency = 1
TextLabel247.Text = "(No configs)"
TextLabel247.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel247.TextSize = 11
TextLabel247.Font = Enum.Font.ArialBold
TextLabel247.TextXAlignment = Enum.TextXAlignment.Left
TextLabel247.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel247.Parent = TextButton189
local TextLabel248 = Instance.new("TextLabel")
TextLabel248.Size = UDim2.new(0, 16, 1, 0)
TextLabel248.Position = UDim2.new(1, -18, 0, 0)
TextLabel248.BackgroundTransparency = 1
TextLabel248.Text = "▾"
TextLabel248.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel248.TextSize = 12
TextLabel248.Font = Enum.Font.Arial
TextLabel248.Parent = TextButton189
local DropList_SelectConfig = Instance.new("Frame")
DropList_SelectConfig.Name = "DropList_Select Config"
DropList_SelectConfig.Size = UDim2.new(0, 100, 0, 48)
DropList_SelectConfig.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
DropList_SelectConfig.BackgroundTransparency = 0.04
DropList_SelectConfig.BorderSizePixel = 0
DropList_SelectConfig.Visible = false
DropList_SelectConfig.ZIndex = 60
DropList_SelectConfig.Parent = CustomPanelGui
local UICorner373 = Instance.new("UICorner")
UICorner373.CornerRadius = UDim.new(0, 8)
UICorner373.Parent = DropList_SelectConfig
local UIStroke208 = Instance.new("UIStroke")
UIStroke208.Color = Color3.fromRGB(255, 0, 0)
UIStroke208.Thickness = 1.2
UIStroke208.Transparency = 0.2
UIStroke208.Parent = DropList_SelectConfig
local Frame387 = Instance.new("Frame")
Frame387.Size = UDim2.new(1, 0, 0, 28)
Frame387.BackgroundTransparency = 1
Frame387.ZIndex = 61
Frame387.Parent = DropList_SelectConfig
local TextLabel249 = Instance.new("TextLabel")
TextLabel249.Size = UDim2.new(1, -32, 1, 0)
TextLabel249.Position = UDim2.new(0, 8, 0, 0)
TextLabel249.BackgroundTransparency = 1
TextLabel249.Text = "Select Config"
TextLabel249.TextColor3 = Color3.fromRGB(220, 20, 40)
TextLabel249.TextSize = 10
TextLabel249.Font = Enum.Font.ArialBold
TextLabel249.TextXAlignment = Enum.TextXAlignment.Left
TextLabel249.ZIndex = 61
TextLabel249.Parent = Frame387
local TextButton190 = Instance.new("TextButton")
TextButton190.Size = UDim2.new(0, 28, 0, 28)
TextButton190.Position = UDim2.new(1, -8, 0.5, 0)
TextButton190.AnchorPoint = Vector2.new(1, 0.5)
TextButton190.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
TextButton190.BackgroundTransparency = 0.3
TextButton190.BorderSizePixel = 0
TextButton190.Text = ""
TextButton190.ZIndex = 62
TextButton190.Parent = Frame387
local UICorner374 = Instance.new("UICorner")
UICorner374.CornerRadius = UDim.new(0, 6)
UICorner374.Parent = TextButton190
local UIStroke209 = Instance.new("UIStroke")
UIStroke209.Color = Color3.fromRGB(255, 40, 60)
UIStroke209.Thickness = 1.2
UIStroke209.Transparency = 0.3
UIStroke209.Parent = TextButton190
local ImageLabel43 = Instance.new("ImageLabel")
ImageLabel43.Size = UDim2.new(0, 16, 0, 16)
ImageLabel43.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageLabel43.AnchorPoint = Vector2.new(0.5, 0.5)
ImageLabel43.BackgroundTransparency = 1
ImageLabel43.ScaleType = Enum.ScaleType.Fit
ImageLabel43.Image = "rbxassetid://116396312853810"
ImageLabel43.ImageColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel43.ZIndex = 63
ImageLabel43.Parent = TextButton190

TextButton190.MouseEnter:Connect(function()
	TextButton190.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
	TextButton190.BackgroundTransparency = 0.1
end)

TextButton190.MouseLeave:Connect(function()
	TextButton190.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	TextButton190.BackgroundTransparency = 0.3
end)

local Frame388 = Instance.new("Frame")
Frame388.Size = UDim2.new(1, -8, 0, 1)
Frame388.Position = UDim2.new(0.5, 0, 0, 28)
Frame388.AnchorPoint = Vector2.new(0.5, 0)
Frame388.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame388.BackgroundTransparency = 0.6
Frame388.BorderSizePixel = 0
Frame388.ZIndex = 61
Frame388.Parent = DropList_SelectConfig
local ScrollingFrame15 = Instance.new("ScrollingFrame")
ScrollingFrame15.Size = UDim2.new(1, 0, 1, -30)
ScrollingFrame15.Position = UDim2.new(0, 0, 0, 30)
ScrollingFrame15.BackgroundTransparency = 1
ScrollingFrame15.BorderSizePixel = 0
ScrollingFrame15.ScrollBarThickness = 2
ScrollingFrame15.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 40)
ScrollingFrame15.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame15.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame15.ZIndex = 61
ScrollingFrame15.Parent = DropList_SelectConfig
local UIListLayout22 = Instance.new("UIListLayout")
UIListLayout22.Padding = UDim.new(0, 2)
UIListLayout22.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout22.Parent = ScrollingFrame15
local UIPadding18 = Instance.new("UIPadding")
UIPadding18.PaddingLeft = UDim.new(0, 4)
UIPadding18.PaddingRight = UDim.new(0, 4)
UIPadding18.PaddingTop = UDim.new(0, 3)
UIPadding18.Parent = ScrollingFrame15
local TextButton191 = Instance.new("TextButton")
TextButton191.Size = UDim2.new(1, 0, 0, 20)
TextButton191.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
TextButton191.BackgroundTransparency = 0.3
TextButton191.BorderSizePixel = 0
TextButton191.Text = "(No configs)"
TextButton191.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton191.TextSize = 11
TextButton191.Font = Enum.Font.ArialBold
TextButton191.TextTruncate = Enum.TextTruncate.AtEnd
TextButton191.ZIndex = 62
TextButton191.LayoutOrder = 1
TextButton191.Parent = ScrollingFrame15
local UICorner375 = Instance.new("UICorner")
UICorner375.CornerRadius = UDim.new(0, 5)
UICorner375.Parent = TextButton191

TextButton191.MouseEnter:Connect(function()
end)

TextButton191.MouseLeave:Connect(function()
end)

TextButton191.MouseButton1Click:Connect(function()
	Sound:Play()
	TextLabel247.Text = "(No configs)"
	TextButton191.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton191.BackgroundTransparency = 0.3
	TextButton191.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel248.Text = "▾"
	local tween199 = TweenService:Create(DropList_SelectConfig, TweenInfo.new(0.14), { Size = UDim2.new(0, 0, 0, 0) })
	tween199:Play()
	task.wait(0.15)
	DropList_SelectConfig.Visible = false
end)

Dropdown_SelectConfig.Destroying:Connect(function()
	DropList_SelectConfig:Destroy()
end)

TextButton190.MouseButton1Click:Connect(function()
	Sound:Play()
	setupTextLabel(TextLabel248, DropList_SelectConfig)
end)

for _, textButton in ipairs({
	PlayerButton, VisualButton, ESPButton, CombatButton, SkillsButton, UtilitiesButton,
	ConfigButton, MinimizeButton,
}) do
	textButton.MouseButton1Click:Connect(function()
	end)
end

CustomPanelGui.AncestryChanged:Connect(function(child18, parent7)
end)

TextButton189.MouseButton1Click:Connect(function()
	Sound:Play()
	setupFrame(DropList_SelectConfig, 52, TextLabel248, 48)
end)

local function createTextLabel5(layoutOrder, name, text, textLabelText, textButtonText)
	local Button_RunConfig, UIStroke210 = createFrame(36, layoutOrder, Scroll7)
	Button_RunConfig.Name = name
	local TextLabel250 = Instance.new("TextLabel")
	TextLabel250.Size = UDim2.new(1, -74, 0, 14)
	TextLabel250.Position = UDim2.new(0, 10, 0, 5)
	TextLabel250.BackgroundTransparency = 1
	TextLabel250.Text = text
	TextLabel250.TextColor3 = Color3.fromRGB(240, 240, 240)
	TextLabel250.TextSize = 11
	TextLabel250.Font = Enum.Font.ArialBold
	TextLabel250.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel250.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel250.Parent = Button_RunConfig
	local TextLabel251 = Instance.new("TextLabel")
	TextLabel251.Size = UDim2.new(1, -74, 0, 11)
	TextLabel251.Position = UDim2.new(0, 10, 0, 20)
	TextLabel251.BackgroundTransparency = 1
	TextLabel251.Text = textLabelText
	TextLabel251.TextColor3 = Color3.fromRGB(100, 100, 100)
	TextLabel251.TextSize = 9
	TextLabel251.Font = Enum.Font.Arial
	TextLabel251.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel251.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel251.Parent = Button_RunConfig
	local TextButton192 = Instance.new("TextButton")
	TextButton192.Size = UDim2.new(0, 52, 0, 20)
	TextButton192.Position = UDim2.new(1, -8, 0.5, 0)
	TextButton192.AnchorPoint = Vector2.new(1, 0.5)
	TextButton192.BackgroundColor3 = Color3.fromRGB(220, 20, 40)
	TextButton192.BackgroundTransparency = 0.1
	TextButton192.BorderSizePixel = 0
	TextButton192.Text = textButtonText
	TextButton192.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton192.TextSize = 10
	TextButton192.Font = Enum.Font.ArialBold
	TextButton192.Parent = Button_RunConfig
	local UICorner377 = Instance.new("UICorner")
	UICorner377.CornerRadius = UDim.new(0, 5)
	UICorner377.Parent = TextButton192
	local UIStroke211 = Instance.new("UIStroke")
	UIStroke211.Color = Color3.fromRGB(255, 40, 60)
	UIStroke211.Thickness = 1
	UIStroke211.Transparency = 0.3
	UIStroke211.Parent = TextButton192

	TextButton192.MouseEnter:Connect(function()
		local tween202 = TweenService:Create(TextButton192, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60), BackgroundTransparency = 0 })
		tween202:Play()
	end)

	TextButton192.MouseLeave:Connect(function()
		local tween203 = TweenService:Create(TextButton192, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(220, 20, 40), BackgroundTransparency = 0.1 })
		tween203:Play()
	end)

	TextButton192.MouseButton1Down:Connect(function(x7, y7)
		local tween204 = TweenService:Create(TextButton192, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(140, 10, 20) })
		tween204:Play()
	end)

	TextButton192.MouseButton1Up:Connect(function()
		local tween205 = TweenService:Create(TextButton192, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { BackgroundColor3 = Color3.fromRGB(255, 40, 60) })
		tween205:Play()
	end)

	TextButton192.MouseButton1Click:Connect(function()
		Sound:Play()
	end)
end

createTextLabel5(12, "Button_Run Config", "Run Config", "Load selected config and apply all settings", "Run")
local NewConfigNameRow, UIStroke212 = createFrame(38, 13, Scroll7)
NewConfigNameRow.Name = "NewConfigNameRow"
local TextLabel252 = Instance.new("TextLabel")
TextLabel252.Size = UDim2.new(0.4, 0, 1, 0)
TextLabel252.Position = UDim2.new(0, 12, 0, 0)
TextLabel252.BackgroundTransparency = 1
TextLabel252.Text = "Config Name"
TextLabel252.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel252.TextSize = 13
TextLabel252.Font = Enum.Font.ArialBold
TextLabel252.TextXAlignment = Enum.TextXAlignment.Left
TextLabel252.Parent = NewConfigNameRow
local TextBox3 = Instance.new("TextBox")
TextBox3.Size = UDim2.new(0, 150, 0, 26)
TextBox3.Position = UDim2.new(1, -10, 0.5, 0)
TextBox3.AnchorPoint = Vector2.new(1, 0.5)
TextBox3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox3.BackgroundTransparency = 0.1
TextBox3.BorderSizePixel = 0
TextBox3.PlaceholderText = "New config name..."
TextBox3.Text = ""
TextBox3.TextColor3 = Color3.fromRGB(240, 240, 240)
TextBox3.TextSize = 12
TextBox3.Font = Enum.Font.ArialBold
TextBox3.TextXAlignment = Enum.TextXAlignment.Center
TextBox3.ClearTextOnFocus = false
TextBox3.Parent = NewConfigNameRow
local UICorner379 = Instance.new("UICorner")
UICorner379.CornerRadius = UDim.new(0, 6)
UICorner379.Parent = TextBox3
local UIStroke213 = Instance.new("UIStroke")
UIStroke213.Color = Color3.fromRGB(60, 60, 60)
UIStroke213.Thickness = 1
UIStroke213.Transparency = 0.2
UIStroke213.Parent = TextBox3
createTextLabel5(14, "Button_Set New Config", "Set New Config", "Save all current settings with this name", "Save")
local Toggle_AutoLoadConfig, UIStroke216 = createFrame(36, 15, Scroll7)
Toggle_AutoLoadConfig.Name = "Toggle_Auto Load Config"
local TextLabel255 = Instance.new("TextLabel")
TextLabel255.Size = UDim2.new(1, -72, 0, 14)
TextLabel255.Position = UDim2.new(0, 10, 0, 5)
TextLabel255.BackgroundTransparency = 1
TextLabel255.Text = "Auto Load Config"
TextLabel255.TextColor3 = Color3.fromRGB(240, 240, 240)
TextLabel255.TextSize = 11
TextLabel255.Font = Enum.Font.ArialBold
TextLabel255.TextXAlignment = Enum.TextXAlignment.Left
TextLabel255.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel255.Parent = Toggle_AutoLoadConfig
local TextLabel256 = Instance.new("TextLabel")
TextLabel256.Size = UDim2.new(1, -72, 0, 11)
TextLabel256.Position = UDim2.new(0, 10, 0, 20)
TextLabel256.BackgroundTransparency = 1
TextLabel256.Text = "Auto-loads selected config when panel opens"
TextLabel256.TextColor3 = Color3.fromRGB(100, 100, 100)
TextLabel256.TextSize = 9
TextLabel256.Font = Enum.Font.Arial
TextLabel256.TextXAlignment = Enum.TextXAlignment.Left
TextLabel256.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel256.Parent = Toggle_AutoLoadConfig
local Frame393 = Instance.new("Frame")
Frame393.Size = UDim2.new(0, 34, 0, 18)
Frame393.Position = UDim2.new(1, -44, 0.5, 0)
Frame393.AnchorPoint = Vector2.new(1, 0.5)
Frame393.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame393.BorderSizePixel = 0
Frame393.Parent = Toggle_AutoLoadConfig
local UICorner383 = Instance.new("UICorner")
UICorner383.CornerRadius = UDim.new(1, 0)
UICorner383.Parent = Frame393
local Frame394 = Instance.new("Frame")
Frame394.Size = UDim2.new(0, 12, 0, 12)
Frame394.Position = UDim2.new(0, 3, 0.5, 0)
Frame394.AnchorPoint = Vector2.new(0, 0.5)
Frame394.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame394.BorderSizePixel = 0
Frame394.Parent = Frame393
local UICorner384 = Instance.new("UICorner")
UICorner384.CornerRadius = UDim.new(1, 0)
UICorner384.Parent = Frame394
local UIStroke217 = Instance.new("UIStroke")
UIStroke217.Color = Color3.fromRGB(170, 20, 40)
UIStroke217.Thickness = 1.2
UIStroke217.Transparency = 0.3
UIStroke217.Parent = Frame394
local TextButton194 = Instance.new("TextButton")
TextButton194.Size = UDim2.new(1, 0, 1, 0)
TextButton194.BackgroundTransparency = 1
TextButton194.Text = ""
TextButton194.Parent = Toggle_AutoLoadConfig

TextButton194.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween210 = TweenService:Create(Frame393, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 20, 40) })
	tween210:Play()
	local tween211 = TweenService:Create(Frame394, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(1, -14, 0.5, 0) })
	tween211:Play()
	UIStroke216.Color = Color3.fromRGB(255, 0, 0)
	UIStroke216.Transparency = 0.25
	-- isfolder("RuzConfigs") -> false
	makefolder("RuzConfigs")
	local json = HttpService:JSONEncode({ autoload = true })
	writefile("RuzConfigs/_meta.json", json)
end)

local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.new(0, 205, 0, 48)
OpenButton.AnchorPoint = Vector2.new(0.5, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
OpenButton.BackgroundTransparency = 0.2
OpenButton.AutoButtonColor = false
OpenButton.BorderSizePixel = 0
OpenButton.Text = ""
OpenButton.Visible = false
OpenButton.ZIndex = 10
local RuzOpenBtn = Instance.new("ScreenGui")
RuzOpenBtn.Name = "RuzOpenBtn"
RuzOpenBtn.ResetOnSpawn = false
RuzOpenBtn.DisplayOrder = 9999
RuzOpenBtn.ZIndexBehavior = Enum.ZIndexBehavior.Global
RuzOpenBtn.IgnoreGuiInset = true
RuzOpenBtn.Parent = game.CoreGui
OpenButton.Parent = RuzOpenBtn
local UIScale2 = Instance.new("UIScale")
UIScale2.Scale = 0.85
UIScale2.Parent = OpenButton

local function setUIScaleScale()
	UIScale2.Scale = 0.85
	OpenButton.Position = UDim2.new(0.5, 0, 0, 7)
end

setUIScaleScale()
local UICorner385 = Instance.new("UICorner")
UICorner385.CornerRadius = UDim.new(1, 0)
UICorner385.Parent = OpenButton
local Outline = Instance.new("UIStroke")
Outline.Name = "Outline"
Outline.Color = Color3.fromRGB(170, 20, 40)
Outline.Thickness = 1.8
Outline.Transparency = 0
Outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
Outline.Parent = OpenButton
local DragIcon = Instance.new("ImageLabel")
DragIcon.Name = "DragIcon"
DragIcon.Size = UDim2.new(0, 22, 0, 22)
DragIcon.Position = UDim2.new(0, 14, 0.5, -11)
DragIcon.BackgroundTransparency = 1
DragIcon.Image = "rbxassetid://77028714324861"
DragIcon.ImageColor3 = Color3.fromRGB(170, 20, 40)
DragIcon.ZIndex = 11
DragIcon.Parent = OpenButton
local Divider31 = Instance.new("Frame")
Divider31.Name = "Divider"
Divider31.Size = UDim2.new(0, 1, 1, 0)
Divider31.Position = UDim2.new(0, 46, 0, 0)
Divider31.BackgroundColor3 = Color3.fromRGB(170, 20, 40)
Divider31.BackgroundTransparency = 0.3
Divider31.BorderSizePixel = 0
Divider31.ZIndex = 11
Divider31.Parent = OpenButton
local MainIcon = Instance.new("ImageLabel")
MainIcon.Name = "MainIcon"
MainIcon.Size = UDim2.new(0, 36, 0, 36)
MainIcon.Position = UDim2.new(0, 56, 0.5, -18)
MainIcon.BackgroundTransparency = 1
MainIcon.Image = "rbxassetid://108459346703445"
MainIcon.ZIndex = 11
MainIcon.Parent = OpenButton
local Label = Instance.new("TextLabel")
Label.Name = "Label"
Label.Size = UDim2.new(1, -100, 1, 0)
Label.Position = UDim2.new(0, 98, 0, 0)
Label.BackgroundTransparency = 1
Label.Font = Enum.Font.ArialBold
Label.RichText = true
Label.Text = "<font color=\"#AA1428\">Ruz</font><font color=\"#FFFFFF\">Hub</font>"
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 21
Label.TextXAlignment = Enum.TextXAlignment.Left
Label.ZIndex = 11
Label.Parent = OpenButton
local changedSignal = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize")

changedSignal:Connect(function()
	setUIScaleScale()
end)

OpenButton.InputBegan:Connect(function(input84, gameProcessed84)
end)

OpenButton.InputChanged:Connect(function(input85, gameProcessed85)
end)

UserInputService.InputChanged:Connect(function(input86, gameProcessed86)
end)

local ConfirmDialog = Instance.new("Frame")
ConfirmDialog.Name = "ConfirmDialog"
ConfirmDialog.Size = UDim2.new(0, 300, 0, 130)
ConfirmDialog.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfirmDialog.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmDialog.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
ConfirmDialog.BackgroundTransparency = 0.1
ConfirmDialog.BorderSizePixel = 0
ConfirmDialog.Visible = false
ConfirmDialog.ZIndex = 20
ConfirmDialog.Parent = CustomPanelGui
local UIScale3 = Instance.new("UIScale")
UIScale3.Scale = 0
UIScale3.Parent = ConfirmDialog
local UICorner386 = Instance.new("UICorner")
UICorner386.CornerRadius = UDim.new(0, 14)
UICorner386.Parent = ConfirmDialog
local UIStroke219 = Instance.new("UIStroke")
UIStroke219.Color = Color3.fromRGB(255, 0, 0)
UIStroke219.Thickness = 1.8
UIStroke219.Transparency = 0.2
UIStroke219.Parent = ConfirmDialog
local TextLabel258 = Instance.new("TextLabel")
TextLabel258.Size = UDim2.new(1, -20, 0, 28)
TextLabel258.Position = UDim2.new(0, 10, 0, 10)
TextLabel258.BackgroundTransparency = 1
TextLabel258.Text = "RuzHub says:"
TextLabel258.TextColor3 = Color3.fromRGB(240, 30, 50)
TextLabel258.TextSize = 14
TextLabel258.Font = Enum.Font.ArialBold
TextLabel258.TextXAlignment = Enum.TextXAlignment.Left
TextLabel258.ZIndex = 21
TextLabel258.Parent = ConfirmDialog
local TextLabel259 = Instance.new("TextLabel")
TextLabel259.Size = UDim2.new(1, -20, 0, 34)
TextLabel259.Position = UDim2.new(0, 10, 0, 36)
TextLabel259.BackgroundTransparency = 1
TextLabel259.Text = "Are you sure you want to close this script?"
TextLabel259.TextColor3 = Color3.fromRGB(220, 220, 220)
TextLabel259.TextSize = 13
TextLabel259.Font = Enum.Font.Arial
TextLabel259.TextXAlignment = Enum.TextXAlignment.Left
TextLabel259.TextWrapped = true
TextLabel259.ZIndex = 21
TextLabel259.Parent = ConfirmDialog
local Frame397 = Instance.new("Frame")
Frame397.Size = UDim2.new(1, -20, 0, 1)
Frame397.Position = UDim2.new(0, 10, 0, 76)
Frame397.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Frame397.BackgroundTransparency = 0.6
Frame397.BorderSizePixel = 0
Frame397.ZIndex = 21
Frame397.Parent = ConfirmDialog
local TextButton196 = Instance.new("TextButton")
TextButton196.Size = UDim2.new(0, 110, 0, 30)
TextButton196.Position = UDim2.new(0.5, -120, 1, -40)
TextButton196.BackgroundColor3 = Color3.fromRGB(160, 15, 25)
TextButton196.BackgroundTransparency = 0.2
TextButton196.BorderSizePixel = 0
TextButton196.Text = "Yes, close"
TextButton196.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton196.TextSize = 13
TextButton196.Font = Enum.Font.ArialBold
TextButton196.ZIndex = 22
TextButton196.Parent = ConfirmDialog
local UICorner387 = Instance.new("UICorner")
UICorner387.CornerRadius = UDim.new(0, 7)
UICorner387.Parent = TextButton196
local UIStroke220 = Instance.new("UIStroke")
UIStroke220.Color = Color3.fromRGB(255, 40, 60)
UIStroke220.Thickness = 1.2
UIStroke220.Transparency = 0.3
UIStroke220.Parent = TextButton196
local TextButton197 = Instance.new("TextButton")
TextButton197.Size = UDim2.new(0, 110, 0, 30)
TextButton197.Position = UDim2.new(0.5, 10, 1, -40)
TextButton197.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton197.BackgroundTransparency = 0.2
TextButton197.BorderSizePixel = 0
TextButton197.Text = "Cancel"
TextButton197.TextColor3 = Color3.fromRGB(200, 200, 200)
TextButton197.TextSize = 13
TextButton197.Font = Enum.Font.ArialBold
TextButton197.ZIndex = 22
TextButton197.Parent = ConfirmDialog
local UICorner388 = Instance.new("UICorner")
UICorner388.CornerRadius = UDim.new(0, 7)
UICorner388.Parent = TextButton197
local UIStroke221 = Instance.new("UIStroke")
UIStroke221.Color = Color3.fromRGB(100, 100, 100)
UIStroke221.Thickness = 1.2
UIStroke221.Transparency = 0.4
UIStroke221.Parent = TextButton197

MinimizeButton.MouseButton1Click:Connect(function()
	Sound:Play()
	chList.Visible = false
	local tween212 = TweenService:Create(UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0 })
	tween212:Play()
	local tween213 = TweenService:Create(UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
	tween213:Play()
	task.wait(0.3)
	MainPanel.Visible = false
	OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
	Sound:Play()
	OpenButton.Visible = false
	MainPanel.Visible = true
	UIScale.Scale = 0
	local tween214 = TweenService:Create(UIScale, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
	tween214:Play()
	local tween215 = TweenService:Create(UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 0.25 })
	tween215:Play()

	task.defer(function()
	end)
end)

CloseButton.MouseButton1Click:Connect(function()
	Sound:Play()
	ConfirmDialog.Visible = true
	UIScale3.Scale = 0
	local tween216 = TweenService:Create(UIScale3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1 })
	tween216:Play()
end)

TextButton196.MouseButton1Click:Connect(function()
	Sound:Play()
	CustomPanelGui:Destroy()
end)

TextButton197.MouseButton1Click:Connect(function()
	Sound:Play()
	local tween217 = TweenService:Create(UIScale3, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0 })
	tween217:Play()
	task.wait(0.25)
	ConfirmDialog.Visible = false
end)

local function setupTextButton4(textButton, r, g, b, r2, g2, b2)
	textButton.MouseEnter:Connect(function()
		textButton.BackgroundColor3 = Color3.fromRGB(r, g, b)
		textButton.BackgroundTransparency = 0.1
	end)

	textButton.MouseLeave:Connect(function()
		textButton.BackgroundColor3 = Color3.fromRGB(r2, g2, b2)
		textButton.BackgroundTransparency = 0.3
	end)
end

setupTextButton4(TextButton196, 200, 20, 30, 160, 15, 25)
setupTextButton4(TextButton197, 55, 55, 55, 30, 30, 30)
local Sound3 = Instance.new("Sound")
Sound3.SoundId = "rbxassetid://12948391899"
Sound3.Volume = 0.25
Sound3.PlaybackSpeed = 1.4
Sound3.Parent = SoundService

OpenButton.MouseEnter:Connect(function()
	Sound3:Play()
	local tween218 = TweenService:Create(Outline, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Color = Color3.fromRGB(220, 35, 55), Thickness = 3, Transparency = 0 })
	tween218:Play()
	local tween219 = TweenService:Create(OpenButton, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.05 })
	tween219:Play()
	local tween220 = TweenService:Create(DragIcon, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { ImageColor3 = Color3.fromRGB(255, 255, 255) })
	tween220:Play()
	local tween221 = TweenService:Create(Divider31, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(220, 35, 55), BackgroundTransparency = 0 })
	tween221:Play()
	local tween222 = TweenService:Create(UIScale2, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 0.901 })
	tween222:Play()
end)

OpenButton.MouseLeave:Connect(function()
	local tween223 = TweenService:Create(Outline, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Color = Color3.fromRGB(170, 20, 40), Thickness = 1.8, Transparency = 0 })
	tween223:Play()
	local tween224 = TweenService:Create(OpenButton, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.2 })
	tween224:Play()
	local tween225 = TweenService:Create(DragIcon, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageColor3 = Color3.fromRGB(170, 20, 40) })
	tween225:Play()
	local tween226 = TweenService:Create(Divider31, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(170, 20, 40), BackgroundTransparency = 0.3 })
	tween226:Play()
	local tween227 = TweenService:Create(UIScale2, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 0.85 })
	tween227:Play()
end)

OpenButton.InputBegan:Connect(function(input87, gameProcessed87)
end)

OpenButton.InputEnded:Connect(function(input88, gameProcessed88)
end)
