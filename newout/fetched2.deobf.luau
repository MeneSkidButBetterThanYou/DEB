-- Deobfuscated by deobf (dynamic trace)
-- source: fetched2.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 731 statements recorded in 0.82s
-- non-standard globals touched: syn

-- [deobf] folded 0 repeated calls into 0 helper functions and 5 unrolled runs into loops
task.spawn(function()
end)

task.spawn(function()
end)

task.delay(96, function()
	-- [envlog] cancelled before it ran
end)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(0, 199, 0, 106)
Frame.Parent = ScreenGui
local Path2D = Instance.new("Path2D")
Path2D.Parent = Frame
Path2D:SetControlPoints({ Path2DControlPoint.new(UDim2.new(0, -8, 0.375, 7), UDim2.new(0, -1, 0, -7), UDim2.new(0, 0, 0, 0)), Path2DControlPoint.new(UDim2.new(0.5, -10, 0, -2), UDim2.new(0, 0, 0, 0), UDim2.new(-0.0625, 5, 0, 1)), Path2DControlPoint.new(UDim2.new(0.5, 5, 0, -1), UDim2.new(0, -3, 0, 1), UDim2.new(0, -1, 0.125, 6)), Path2DControlPoint.new(UDim2.new(0.25, -7, 0.125, -5), UDim2.new(0, -4, -0.0625, 3), UDim2.new(0, -8, 0, -8)), Path2DControlPoint.new(UDim2.new(0.5, 6, 0, 4), UDim2.new(0, 0, 0, 0), UDim2.new(0.125, 1, 0, 0)), Path2DControlPoint.new(UDim2.new(0, -3, 0.5, 8), UDim2.new(0.125, 5, 0, -3), UDim2.new(0, 0, 0, 0)) })
Path2D:GetLength()
Path2D:GetPositionOnCurve(0.45454546809196472)
Path2D:GetPositionOnCurve(0.4285714328289032)
Path2D:GetPositionOnCurve(0.4444444477558136)
Path2D:GetTangentOnCurve(0.2222222238779068)
Path2D:GetTangentOnCurve(0.72727274894714355)
Path2D:GetTangentOnCurve(0.75)
Path2D:GetTangentOnCurve(0.91666668653488159)
Path2D:GetPositionOnCurveArcLength(0.375)
Path2D:GetPositionOnCurveArcLength(0.58333331346511841)
Path2D:GetTangentOnCurveArcLength(0.5)
Path2D:GetTangentOnCurveArcLength(0.78571426868438721)
ScreenGui:Destroy()

local connection = game.AncestryChanged:Connect(function(child, parent)
end)

connection:Disconnect()

local connection2 = workspace.AncestryChanged:Connect(function(child2, parent2)
end)

connection2:Disconnect()
local Folder = Instance.new("Folder")

local connection3 = Folder.AncestryChanged:Connect(function(child3, parent3)
end)

connection3:Disconnect()
Folder:GetChildren()
Folder:Destroy()
local Folder2 = Instance.new("Folder", Folder)

local connection4 = Folder2.AncestryChanged:Connect(function(child4, parent4)
end)

connection4:Disconnect()
Folder2.Name = "1641908661"
Folder:WaitForChild("1641908661")
Folder:Destroy()
Folder2:Destroy()
local HttpService = game:GetService("HttpService")

local connection5 = HttpService.AncestryChanged:Connect(function(child5, parent5)
end)

connection5:Disconnect()
local RunService = game:GetService("RunService")

local connection6 = RunService.AncestryChanged:Connect(function(child6, parent6)
end)

connection6:Disconnect()
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local FyyCommunityLoader = CoreGui:FindFirstChild("FyyCommunityLoader")
FyyCommunityLoader:Destroy()
local FyyCommunityLoader2 = CoreGui:FindFirstChild("FyyCommunityLoader")
FyyCommunityLoader2:Destroy()
local FyyCommunityLoader3 = Instance.new("ScreenGui")
FyyCommunityLoader3.Name = "FyyCommunityLoader"
FyyCommunityLoader3.DisplayOrder = 100000
FyyCommunityLoader3.ResetOnSpawn = false
FyyCommunityLoader3.IgnoreGuiInset = true
FyyCommunityLoader3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
FyyCommunityLoader3.Parent = CoreGui
syn.protect_gui(FyyCommunityLoader3)
local Backdrop = Instance.new("Frame")
Backdrop.Name = "Backdrop"
Backdrop.BackgroundColor3 = Color3.fromRGB(5, 7, 10)
Backdrop.BackgroundTransparency = 1
Backdrop.BorderSizePixel = 0
Backdrop.Size = UDim2.fromScale(1, 1)
Backdrop.Parent = FyyCommunityLoader3
local Card = Instance.new("Frame")
Card.Active = true
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.BackgroundTransparency = 1
Card.Position = UDim2.new(0.5, 0, 0.5, 10)
Card.Name = "Card"
Card.BackgroundColor3 = Color3.fromRGB(17, 21, 27)
Card.BorderSizePixel = 0
Card.Size = UDim2.fromOffset(380, 250)
Card.Parent = Backdrop
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = Card
local UIGradient = Instance.new("UIGradient")
UIGradient.Rotation = 90
UIGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 26, 34)), ColorSequenceKeypoint.new(1, Color3.fromRGB(17, 21, 27)) })
UIGradient.Parent = Card
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 1
UIStroke.Transparency = 1
UIStroke.Color = Color3.fromRGB(48, 56, 68)
UIStroke.Parent = Card
local UIScale = Instance.new("UIScale")
UIScale.Scale = 0.96
UIScale.Parent = Card
local TopAccent = Instance.new("Frame")
TopAccent.AnchorPoint = Vector2.new(0.5, 0)
TopAccent.BackgroundColor3 = Color3.fromRGB(125, 101, 255)
TopAccent.Name = "TopAccent"
TopAccent.Position = UDim2.fromScale(0.5, 0)
TopAccent.BackgroundTransparency = 1
TopAccent.BorderSizePixel = 0
TopAccent.Size = UDim2.new(1, -40, 0, 2)
TopAccent.Parent = Card
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = TopAccent
local UIGradient2 = Instance.new("UIGradient")
UIGradient2.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.18, 0.15), NumberSequenceKeypoint.new(0.82, 0.15), NumberSequenceKeypoint.new(1, 1) })
UIGradient2.Parent = TopAccent
local Mark = Instance.new("Frame")
Mark.Name = "Mark"
Mark.Position = UDim2.fromOffset(18, 18)
Mark.BackgroundTransparency = 1
Mark.BorderSizePixel = 0
Mark.Size = UDim2.fromOffset(28, 28)
Mark.Parent = Card
local Logo = Instance.new("ImageLabel")
Logo.ImageColor3 = Color3.fromRGB(243, 246, 250)
Logo.ScaleType = Enum.ScaleType.Fit
Logo.ImageTransparency = 1
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.Image = "rbxassetid://90892630150011"
Logo.BackgroundTransparency = 1
Logo.Position = UDim2.fromScale(0.5, 0.5)
Logo.Name = "Logo"
Logo.Size = UDim2.fromOffset(22, 22)
Logo.Parent = Mark
local TextLabel = Instance.new("TextLabel")
TextLabel.TextColor3 = Color3.fromRGB(243, 246, 250)
TextLabel.TextTransparency = 1
TextLabel.Text = "Fyy Community"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.fromOffset(54, 17)
TextLabel.TextXAlignment = Enum.TextXAlignment.Left
TextLabel.TextSize = 13
TextLabel.Size = UDim2.fromOffset(170, 16)
TextLabel.Parent = Card
MarketplaceService:GetProductInfo(0)
local TextLabel2 = Instance.new("TextLabel")
TextLabel2.TextColor3 = Color3.fromRGB(146, 156, 170)
TextLabel2.TextTransparency = 1
TextLabel2.Text = "ROBLOX EXPERIENCE RUNTIME"
TextLabel2.Font = Enum.Font.GothamMedium
TextLabel2.BackgroundTransparency = 1
TextLabel2.Position = UDim2.fromOffset(54, 34)
TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
TextLabel2.TextSize = 8
TextLabel2.Size = UDim2.fromOffset(210, 13)
TextLabel2.Parent = Card
local StatePill = Instance.new("Frame")
StatePill.AnchorPoint = Vector2.new(1, 0)
StatePill.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
StatePill.Name = "StatePill"
StatePill.Position = UDim2.new(1, -18, 0, 20)
StatePill.BackgroundTransparency = 1
StatePill.BorderSizePixel = 0
StatePill.Size = UDim2.fromOffset(106, 24)
StatePill.Parent = Card
local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 8)
UICorner3.Parent = StatePill
local Content = Instance.new("Frame")
Content.AnchorPoint = Vector2.new(0.5, 0.5)
Content.Name = "Content"
Content.Position = UDim2.fromScale(0.5, 0.5)
Content.BackgroundTransparency = 1
Content.Size = UDim2.new(1, -8, 1, 0)
Content.Parent = StatePill
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = Content
local Dot = Instance.new("Frame")
Dot.LayoutOrder = 1
Dot.Name = "Dot"
Dot.BackgroundColor3 = Color3.fromRGB(166, 148, 255)
Dot.BackgroundTransparency = 1
Dot.BorderSizePixel = 0
Dot.Size = UDim2.fromOffset(5, 5)
Dot.Parent = Content
local UICorner4 = Instance.new("UICorner")
UICorner4.CornerRadius = UDim.new(1, 0)
UICorner4.Parent = Dot
local Text = Instance.new("TextLabel")
Text.LayoutOrder = 2
Text.TextColor3 = Color3.fromRGB(166, 148, 255)
Text.TextTransparency = 1
Text.Text = "CHECKING"
Text.Name = "Text"
Text.Font = Enum.Font.GothamBold
Text.BackgroundTransparency = 1
Text.TextXAlignment = Enum.TextXAlignment.Center
Text.TextSize = 8
Text.TextYAlignment = Enum.TextYAlignment.Center
Text.AutomaticSize = Enum.AutomaticSize.X
Text.Size = UDim2.fromScale(0, 1)
Text.Parent = Content
local TextLabel4 = Instance.new("TextLabel")
TextLabel4.TextColor3 = Color3.fromRGB(243, 246, 250)
TextLabel4.TextTransparency = 1
TextLabel4.Text = "Initializing runtime..."
TextLabel4.Font = Enum.Font.GothamBold
TextLabel4.BackgroundTransparency = 1
TextLabel4.Position = UDim2.fromOffset(18, 68)
TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
TextLabel4.TextSize = 15
TextLabel4.Size = UDim2.new(1, -36, 0, 20)
TextLabel4.Parent = Card
local TextLabel5 = Instance.new("TextLabel")
TextLabel5.Visible = false
TextLabel5.TextColor3 = Color3.fromRGB(146, 156, 170)
TextLabel5.TextTransparency = 1
TextLabel5.Text = "Keyless access granted • Free Premium features unlocked\nConnecting to online session..."
TextLabel5.Font = Enum.Font.Gotham
TextLabel5.BackgroundTransparency = 1
TextLabel5.Position = UDim2.fromOffset(18, 96)
TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
TextLabel5.TextYAlignment = Enum.TextYAlignment.Top
TextLabel5.TextSize = 11
TextLabel5.Size = UDim2.new(1, -36, 0, 36)
TextLabel5.Parent = Card
local InputRow = Instance.new("Frame")
InputRow.Visible = false
InputRow.Name = "InputRow"
InputRow.Position = UDim2.fromOffset(18, 96)
InputRow.BackgroundTransparency = 1
InputRow.Size = UDim2.new(1, -36, 0, 34)
InputRow.Parent = Card
local LicenseKey = Instance.new("TextBox")
LicenseKey.TextXAlignment = Enum.TextXAlignment.Left
LicenseKey.TextSize = 10
LicenseKey.TextColor3 = Color3.fromRGB(243, 246, 250)
LicenseKey.TextTransparency = 1
LicenseKey.Text = ""
LicenseKey.PlaceholderColor3 = Color3.fromRGB(91, 101, 116)
LicenseKey.PlaceholderText = "FYY-... or TRIAL-..."
LicenseKey.BackgroundTransparency = 1
LicenseKey.Font = Enum.Font.GothamMedium
LicenseKey.Name = "LicenseKey"
LicenseKey.Position = UDim2.fromOffset(0, 0)
LicenseKey.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
LicenseKey.ClearTextOnFocus = false
LicenseKey.BorderSizePixel = 0
LicenseKey.Size = UDim2.new(1, -92, 1, 0)
LicenseKey.Parent = InputRow
local UICorner5 = Instance.new("UICorner")
UICorner5.CornerRadius = UDim.new(0, 8)
UICorner5.Parent = LicenseKey
local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingRight = UDim.new(0, 11)
UIPadding.PaddingLeft = UDim.new(0, 11)
UIPadding.Parent = LicenseKey
local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Thickness = 1
UIStroke2.Transparency = 1
UIStroke2.Color = Color3.fromRGB(48, 56, 68)
UIStroke2.Parent = LicenseKey
local Validate = Instance.new("TextButton")
Validate.TextColor3 = Color3.fromRGB(243, 246, 250)
Validate.TextTransparency = 1
Validate.Text = "CONTINUE"
Validate.TextSize = 9
Validate.AutoButtonColor = false
Validate.AnchorPoint = Vector2.new(1, 0)
Validate.Font = Enum.Font.GothamBold
Validate.BackgroundTransparency = 1
Validate.Position = UDim2.new(1, 0, 0, 0)
Validate.Name = "Validate"
Validate.BackgroundColor3 = Color3.fromRGB(125, 101, 255)
Validate.BorderSizePixel = 0
Validate.Size = UDim2.fromOffset(84, 34)
Validate.Parent = InputRow
local UICorner6 = Instance.new("UICorner")
UICorner6.CornerRadius = UDim.new(0, 8)
UICorner6.Parent = Validate

Validate.MouseEnter:Connect(function()
	local tween98 = TweenService:Create(Validate, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(166, 148, 255) })
	tween98:Play()
end)

Validate.MouseLeave:Connect(function()
	local tween99 = TweenService:Create(Validate, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(125, 101, 255) })
	tween99:Play()
end)

local ActionsRow = Instance.new("Frame")
ActionsRow.Visible = false
ActionsRow.Name = "ActionsRow"
ActionsRow.Position = UDim2.fromOffset(18, 138)
ActionsRow.BackgroundTransparency = 1
ActionsRow.Size = UDim2.new(1, -36, 0, 30)
ActionsRow.Parent = Card
local GetKey = Instance.new("TextButton")
GetKey.TextColor3 = Color3.fromRGB(243, 246, 250)
GetKey.TextTransparency = 1
GetKey.Text = "GET FREE KEY"
GetKey.AutoButtonColor = false
GetKey.TextSize = 8
GetKey.Font = Enum.Font.GothamBold
GetKey.BackgroundTransparency = 1
GetKey.Position = UDim2.fromOffset(0, 0)
GetKey.Name = "GetKey"
GetKey.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
GetKey.BorderSizePixel = 0
GetKey.Size = UDim2.new(0.5, -5, 1, 0)
GetKey.Parent = ActionsRow
local UICorner7 = Instance.new("UICorner")
UICorner7.CornerRadius = UDim.new(0, 8)
UICorner7.Parent = GetKey
local UIStroke3 = Instance.new("UIStroke")
UIStroke3.Thickness = 1
UIStroke3.Transparency = 1
UIStroke3.Color = Color3.fromRGB(48, 56, 68)
UIStroke3.Parent = GetKey
local DiscordAction = Instance.new("TextButton")
DiscordAction.TextColor3 = Color3.fromRGB(243, 246, 250)
DiscordAction.TextTransparency = 1
DiscordAction.Text = "JOIN DISCORD"
DiscordAction.TextSize = 8
DiscordAction.AutoButtonColor = false
DiscordAction.AnchorPoint = Vector2.new(1, 0)
DiscordAction.Font = Enum.Font.GothamBold
DiscordAction.BackgroundTransparency = 1
DiscordAction.Position = UDim2.new(1, 0, 0, 0)
DiscordAction.Name = "DiscordAction"
DiscordAction.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
DiscordAction.BorderSizePixel = 0
DiscordAction.Size = UDim2.new(0.5, -5, 1, 0)
DiscordAction.Parent = ActionsRow
local UICorner8 = Instance.new("UICorner")
UICorner8.CornerRadius = UDim.new(0, 8)
UICorner8.Parent = DiscordAction
local UIStroke4 = Instance.new("UIStroke")
UIStroke4.Thickness = 1
UIStroke4.Transparency = 1
UIStroke4.Color = Color3.fromRGB(48, 56, 68)
UIStroke4.Parent = DiscordAction

for _, textButton in ipairs({
	GetKey, DiscordAction,
}) do
	textButton.MouseEnter:Connect(function()
		local tween100 = TweenService:Create(textButton, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(32, 38, 48) })
		tween100:Play()
	end)

	textButton.MouseLeave:Connect(function()
		local tween101 = TweenService:Create(textButton, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(24, 29, 37) })
		tween101:Play()
	end)
end

local TextLabel6 = Instance.new("TextLabel")
TextLabel6.TextColor3 = Color3.fromRGB(146, 156, 170)
TextLabel6.TextTransparency = 1
TextLabel6.Text = "Connecting securely..."
TextLabel6.Font = Enum.Font.GothamMedium
TextLabel6.BackgroundTransparency = 1
TextLabel6.Position = UDim2.fromOffset(18, 180)
TextLabel6.TextTruncate = Enum.TextTruncate.AtEnd
TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
TextLabel6.TextSize = 9
TextLabel6.Size = UDim2.new(1, -36, 0, 16)
TextLabel6.Parent = Card
local ProgressTrack = Instance.new("Frame")
ProgressTrack.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
ProgressTrack.Name = "ProgressTrack"
ProgressTrack.Position = UDim2.fromOffset(18, 206)
ProgressTrack.BackgroundTransparency = 1
ProgressTrack.BorderSizePixel = 0
ProgressTrack.Size = UDim2.new(1, -36, 0, 4)
ProgressTrack.Parent = Card
local UICorner9 = Instance.new("UICorner")
UICorner9.CornerRadius = UDim.new(1, 0)
UICorner9.Parent = ProgressTrack
local Progress = Instance.new("Frame")
Progress.Name = "Progress"
Progress.BackgroundColor3 = Color3.fromRGB(125, 101, 255)
Progress.BackgroundTransparency = 1
Progress.BorderSizePixel = 0
Progress.Size = UDim2.fromScale(0, 1)
Progress.Parent = ProgressTrack
local UICorner10 = Instance.new("UICorner")
UICorner10.CornerRadius = UDim.new(1, 0)
UICorner10.Parent = Progress
local UIGradient3 = Instance.new("UIGradient")
UIGradient3.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(125, 101, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(166, 148, 255)) })
UIGradient3.Parent = Progress
local DiscordFull = Instance.new("TextButton")
DiscordFull.Visible = false
DiscordFull.BackgroundColor3 = Color3.fromRGB(24, 29, 37)
DiscordFull.TextColor3 = Color3.fromRGB(243, 246, 250)
DiscordFull.TextTransparency = 1
DiscordFull.Text = "JOIN DISCORD COMMUNITY"
DiscordFull.TextXAlignment = Enum.TextXAlignment.Center
DiscordFull.AutoButtonColor = false
DiscordFull.TextSize = 9
DiscordFull.Font = Enum.Font.GothamBold
DiscordFull.BackgroundTransparency = 1
DiscordFull.Position = UDim2.fromOffset(18, 180)
DiscordFull.Name = "DiscordFull"
DiscordFull.TextYAlignment = Enum.TextYAlignment.Center
DiscordFull.BorderSizePixel = 0
DiscordFull.Size = UDim2.new(1, -36, 0, 34)
DiscordFull.Parent = Card
local UICorner11 = Instance.new("UICorner")
UICorner11.CornerRadius = UDim.new(0, 8)
UICorner11.Parent = DiscordFull
local UIStroke5 = Instance.new("UIStroke")
UIStroke5.Thickness = 1
UIStroke5.Transparency = 1
UIStroke5.Color = Color3.fromRGB(48, 56, 68)
UIStroke5.Parent = DiscordFull

DiscordFull.MouseEnter:Connect(function()
	local tween104 = TweenService:Create(DiscordFull, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(32, 38, 48) })
	tween104:Play()
	local tween105 = TweenService:Create(UIStroke5, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Color = Color3.fromRGB(125, 101, 255), Transparency = 0.3 })
	tween105:Play()
end)

DiscordFull.MouseLeave:Connect(function()
	local tween106 = TweenService:Create(DiscordFull, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(24, 29, 37) })
	tween106:Play()
	local tween107 = TweenService:Create(UIStroke5, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Color = Color3.fromRGB(48, 56, 68), Transparency = 0.5 })
	tween107:Play()
end)

local TextLabel7 = Instance.new("TextLabel")
TextLabel7.TextColor3 = Color3.fromRGB(91, 101, 116)
TextLabel7.TextTransparency = 1
TextLabel7.Text = "Fyy Community  •  Secure Runtime"
TextLabel7.Font = Enum.Font.Gotham
TextLabel7.BackgroundTransparency = 1
TextLabel7.Position = UDim2.fromOffset(18, 226)
TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
TextLabel7.TextSize = 8
TextLabel7.Size = UDim2.new(1, -36, 0, 12)
TextLabel7.Parent = Card

Card.InputBegan:Connect(function(input, gameProcessed)
end)

UserInputService.InputChanged:Connect(function(input2, gameProcessed2)
end)

UserInputService.InputEnded:Connect(function(input3, gameProcessed3)
end)

for _, v in ipairs({
	{ textButton = GetKey, text = "https://fyycommunity.com/free", textLabelText = "Free key link copied to clipboard!" },
	{ textButton = DiscordAction, text = "https://discord.gg/pH3u8bBZsJ", textLabelText = "Discord invite link copied to clipboard!" },
	{ textButton = DiscordFull, text = "https://discord.gg/pH3u8bBZsJ", textLabelText = "Discord invite link copied to clipboard!" },
}) do
	v.textButton.MouseButton1Click:Connect(function()
		setclipboard(v.text)
		TextLabel6.Text = v.textLabelText
		TextLabel6.TextColor3 = Color3.fromRGB(67, 207, 139)

		task.delay(1.5, function()
		end)
	end)
end

Validate.MouseButton1Click:Connect(function()
	TextLabel6.Text = "Enter a valid FYY or TRIAL key"
	TextLabel6.TextColor3 = Color3.fromRGB(239, 92, 105)

	task.delay(1.5, function()
	end)
end)

LicenseKey.FocusLost:Connect(function(enterPressed, inputObject)
end)

local tween = TweenService:Create(Backdrop, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0.36 })
tween:Play()
local tween2 = TweenService:Create(Card, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0, Position = UDim2.fromScale(0.5, 0.5) })
tween2:Play()
local tween3 = TweenService:Create(UIScale, TweenInfo.new(0.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
tween3:Play()
local tween4 = TweenService:Create(UIStroke, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 0.42 })
tween4:Play()
local tween5 = TweenService:Create(TopAccent, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
tween5:Play()
local tween6 = TweenService:Create(StatePill, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
tween6:Play()
local tween7 = TweenService:Create(ProgressTrack, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
tween7:Play()
local lastTween4 = TweenService:Create(Progress, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
local lastTween5 = lastTween4

for _, textLabel in ipairs({
	TextLabel, TextLabel2, Text, TextLabel4, TextLabel6, TextLabel7,
}) do
	local previousTween5 = lastTween5
	previousTween5:Play()
	local tween9 = TweenService:Create(textLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 0 })
	lastTween5 = tween9
end

lastTween5:Play()
local tween15 = TweenService:Create(Logo, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 0 })
tween15:Play()
local tween16 = TweenService:Create(Dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0 })
tween16:Play()

task.spawn(function()
	for _, backgroundTransparency in ipairs({
		0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0,
		0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0,
		0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72, 0, 0.72,
	}) do
		local tween17 = TweenService:Create(Dot, TweenInfo.new(0.55, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { BackgroundTransparency = backgroundTransparency })
		tween17:Play()
		task.wait(0.55)
	end
	-- [envlog] stopped after 50 waits
end)

task.spawn(function(...)
	-- identifyexecutor() -> "Wave"
	task.spawn(function()
	end)

	TextLabel4.Text = "Service Unavailable"
	TextLabel6.Text = "Could not verify access mode. Please try again. (REQUEST_FAILED)"
	TextLabel6.TextColor3 = Color3.fromRGB(239, 92, 105)
	Text.Text = "FAILED"
	Text.TextColor3 = Color3.fromRGB(239, 92, 105)
	Dot.BackgroundColor3 = Color3.fromRGB(239, 92, 105)
	TopAccent.BackgroundColor3 = Color3.fromRGB(239, 92, 105)
	Progress.BackgroundColor3 = Color3.fromRGB(239, 92, 105)
	Validate.Text = "INVALID"
	local tween68 = TweenService:Create(Validate, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundColor3 = Color3.fromRGB(239, 92, 105) })
	tween68:Play()
	GetKey.Active = true
	DiscordAction.Active = true
	local tween69 = TweenService:Create(GetKey, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0, TextTransparency = 0 })
	tween69:Play()
	local tween70 = TweenService:Create(DiscordAction, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 0, TextTransparency = 0 })
	tween70:Play()
	local tween71 = TweenService:Create(UIScale, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.015 })
	tween71:Play()

	task.delay(0.12, function()
	end)

	task.spawn(function()
		TextLabel7.Text = "Closing automatically in 5 seconds • Click Discord to copy invite"
		task.wait(1)
		TextLabel7.Text = "Closing automatically in 4 seconds • Click Discord to copy invite"
		task.wait(1)
		TextLabel7.Text = "Closing automatically in 3 seconds • Click Discord to copy invite"
		task.wait(1)
		TextLabel7.Text = "Closing automatically in 2 seconds • Click Discord to copy invite"
		task.wait(1)
		TextLabel7.Text = "Closing automatically in 1 second • Click Discord to copy invite"
		task.wait(1)
		local tween72 = TweenService:Create(UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Scale = 0.965 })
		tween72:Play()
		local tween73 = TweenService:Create(Card, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, -8) })
		tween73:Play()
		local tween74 = TweenService:Create(Backdrop, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		tween74:Play()
		local tween75 = TweenService:Create(UIStroke, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
		tween75:Play()
		local tween76 = TweenService:Create(TopAccent, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		tween76:Play()
		local tween77 = TweenService:Create(StatePill, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		tween77:Play()
		local tween78 = TweenService:Create(Dot, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		tween78:Play()
		local tween79 = TweenService:Create(ProgressTrack, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		tween79:Play()
		local lastTween = TweenService:Create(Progress, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
		lastTween:Play()
		local tween81 = TweenService:Create(LicenseKey, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1, TextTransparency = 1 })
		tween81:Play()
		local tween82 = TweenService:Create(UIStroke2, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
		tween82:Play()
		local tween83 = TweenService:Create(Validate, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1, TextTransparency = 1 })
		tween83:Play()
		local tween84 = TweenService:Create(GetKey, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1, TextTransparency = 1 })
		tween84:Play()
		local tween85 = TweenService:Create(UIStroke3, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
		tween85:Play()
		local tween86 = TweenService:Create(DiscordAction, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1, TextTransparency = 1 })
		tween86:Play()
		local tween87 = TweenService:Create(UIStroke4, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
		tween87:Play()
		local tween88 = TweenService:Create(DiscordFull, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1, TextTransparency = 1 })
		tween88:Play()
		local lastTween2 = TweenService:Create(UIStroke5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Transparency = 1 })
		local lastTween3 = lastTween2

		for _, textLabel in ipairs({
			TextLabel, TextLabel2, Text, TextLabel4, TextLabel6, TextLabel5, TextLabel7,
		}) do
			local previousTween3 = lastTween3
			previousTween3:Play()
			local tween90 = TweenService:Create(textLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { TextTransparency = 1 })
			lastTween3 = tween90
		end

		lastTween3:Play()
		local tween97 = TweenService:Create(Logo, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 1 })
		tween97:Play()
		task.wait(0.3)
		FyyCommunityLoader3.Enabled = false
		FyyCommunityLoader3:Destroy()
	end)
end)
