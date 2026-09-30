
local Players
Players = game:GetService("Players")
local UserInputService
UserInputService = game:GetService("UserInputService")
local SoundService
SoundService = game:GetService("SoundService")
local TweenService
TweenService = game:GetService("TweenService")
local RunService
RunService = game:GetService("RunService")
local localPlayer
localPlayer = Players.LocalPlayer
local screenGui, flag

do
	local playerGui = localPlayer:WaitForChild("PlayerGui")

	if playerGui:FindFirstChild("CustomPanelGui") then
		playerGui.CustomPanelGui:Destroy()
	end

	screenGui = Instance.new("ScreenGui")
	screenGui.Name = "CustomPanelGui"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = playerGui
	flag = true
	local screenGui2 = Instance.new("ScreenGui")
	screenGui2.Name = "RuzHubNotifs"
	screenGui2.ResetOnSpawn = false
	screenGui2.DisplayOrder = 999
	screenGui2.Parent = playerGui
end

local n = 1

pcall(function()
	if not isfolder("RuzConfigs") then
		makefolder("RuzConfigs")
	end

	local txt = readfile and readfile("RuzConfigs/_visits.txt") or nil

	if txt then
		n = (tonumber(txt) or 0) + 1
	end
end)

pcall(function()
	if writefile then
		writefile("RuzConfigs/_visits.txt", tostring(n))
	end
end)

task.defer(function()
	task.wait(1.2)
end)

local tbl

tbl = {
	BG = Color3.fromRGB(8, 8, 8),
	Surface = Color3.fromRGB(18, 18, 18),
	SurfaceHigh = Color3.fromRGB(28, 28, 28),
	Accent = Color3.fromRGB(220, 20, 40),
	AccentBright = Color3.fromRGB(255, 40, 60),
	AccentDark = Color3.fromRGB(140, 10, 20),
	TextPrimary = Color3.fromRGB(240, 240, 240),
	TextSecond = Color3.fromRGB(160, 160, 160),
	TextMuted = Color3.fromRGB(100, 100, 100),
	Stroke = Color3.fromRGB(255, 0, 0),
	StrokeOff = Color3.fromRGB(60, 60, 60),
	ToggleOff = Color3.fromRGB(50, 50, 50),
	White = Color3.fromRGB(255, 255, 255),
}

local frame
frame = Instance.new("Frame")
frame.Name = "MainPanel"
frame.Size = UDim2.new(0, 460, 0, 290)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = tbl.BG
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 0
frame.Parent = screenGui
local uiScale
uiScale = Instance.new("UIScale")
local n2
n2 = 1
uiScale.Scale = 1
uiScale.Parent = frame
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = frame
local uiStroke
uiStroke = Instance.new("UIStroke")
uiStroke.Color = tbl.Stroke
uiStroke.Thickness = 2
uiStroke.Transparency = 0.25
uiStroke.Parent = frame
local uiSizeConstraint = Instance.new("UISizeConstraint")
uiSizeConstraint.MinSize = Vector2.new(340, 220)
uiSizeConstraint.MaxSize = Vector2.new(520, 330)
uiSizeConstraint.Parent = frame

do
	local flag2 = false
	local v = nil
	local position = nil
	local position2 = nil

	local function fn(arg)
		local n3 = arg.Position - position
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local absoluteSize = frame.AbsoluteSize
		local anchorPoint = frame.AnchorPoint
		local n4 = position2.Y.Offset + n3.Y
		frame.Position = UDim2.new(frame.Position.X.Scale, math.clamp(position2.X.Offset + n3.X, absoluteSize.X * anchorPoint.X - viewportSize.X * frame.Position.X.Scale, viewportSize.X - absoluteSize.X * (1 - anchorPoint.X) - viewportSize.X * frame.Position.X.Scale), frame.Position.Y.Scale, math.clamp(n4, absoluteSize.Y * anchorPoint.Y - viewportSize.Y * frame.Position.Y.Scale, viewportSize.Y - absoluteSize.Y * (1 - anchorPoint.Y) - viewportSize.Y * frame.Position.Y.Scale))

		if syncDropdownPositions then
			syncDropdownPositions()
		end
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag2 = true
			position = input.Position
			position2 = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag2 = false
				end
			end)
		end
	end)

	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			v = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == v and flag2 then
			fn(input)
		end
	end)
end

local sound
sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://12948391899"
sound.Volume = 0.5
sound.Parent = SoundService
local textButton, textButton2

do
	local frame2 = Instance.new("Frame")
	frame2.Size = UDim2.new(1, 0, 0, 42)
	frame2.Position = UDim2.new(0, 0, 0, 0)
	frame2.BackgroundTransparency = 1
	frame2.BorderSizePixel = 0
	frame2.Parent = frame
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(0, 200, 1, 0)
	textLabel.Position = UDim2.new(0, 16, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "RuzHub"
	textLabel.TextColor3 = Color3.fromRGB(240, 30, 50)
	textLabel.TextSize = 21
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = frame2
	local textLabel2 = Instance.new("TextLabel")
	textLabel2.Size = UDim2.new(0, 100, 1, 0)
	textLabel2.Position = UDim2.new(0, 95, 0, 1)
	textLabel2.BackgroundTransparency = 1
	textLabel2.Text = "v1.0"
	textLabel2.TextColor3 = Color3.fromRGB(140, 140, 140)
	textLabel2.TextSize = 12
	textLabel2.Font = Enum.Font.Arial
	textLabel2.TextXAlignment = Enum.TextXAlignment.Left
	textLabel2.Parent = frame2
	textButton = Instance.new("TextButton")
	textButton.Name = "CloseButton"
	textButton.Size = UDim2.new(0, 28, 0, 28)
	textButton.Position = UDim2.new(1, -10, 0.5, 0)
	textButton.AnchorPoint = Vector2.new(1, 0.5)
	textButton.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	textButton.BackgroundTransparency = 0.3
	textButton.BorderSizePixel = 0
	textButton.Text = ""
	textButton.Parent = frame2
	local uiCorner2 = Instance.new("UICorner")
	uiCorner2.CornerRadius = UDim.new(0, 6)
	uiCorner2.Parent = textButton
	local uiStroke2 = Instance.new("UIStroke")
	uiStroke2.Color = tbl.AccentBright
	uiStroke2.Thickness = 1.2
	uiStroke2.Transparency = 0.3
	uiStroke2.Parent = textButton
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Size = UDim2.new(0, 16, 0, 16)
	imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.BackgroundTransparency = 1
	imageLabel.ScaleType = Enum.ScaleType.Fit
	imageLabel.Image = "rbxassetid://116396312853810"
	imageLabel.ImageColor3 = tbl.White
	imageLabel.Parent = textButton
	textButton2 = Instance.new("TextButton")
	textButton2.Name = "MinimizeButton"
	textButton2.Size = UDim2.new(0, 28, 0, 28)
	textButton2.Position = UDim2.new(1, -44, 0.5, 0)
	textButton2.AnchorPoint = Vector2.new(1, 0.5)
	textButton2.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
	textButton2.BackgroundTransparency = 0.3
	textButton2.BorderSizePixel = 0
	textButton2.Text = ""
	textButton2.Parent = frame2
end

local uiCorner2 = Instance.new("UICorner")
uiCorner2.CornerRadius = UDim.new(0, 6)
uiCorner2.Parent = textButton2
local uiStroke2 = Instance.new("UIStroke")
uiStroke2.Color = tbl.Accent
uiStroke2.Thickness = 1.2
uiStroke2.Transparency = 0.4
uiStroke2.Parent = textButton2
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0, 16, 0, 16)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.ScaleType = Enum.ScaleType.Fit
imageLabel.Image = "rbxassetid://95555494586098"
imageLabel.ImageColor3 = tbl.White
imageLabel.Parent = textButton2
local frame2 = Instance.new("Frame")
frame2.Size = UDim2.new(1, -24, 0, 1)
frame2.Position = UDim2.new(0.5, 0, 0, 42)
frame2.AnchorPoint = Vector2.new(0.5, 0)
frame2.BackgroundColor3 = tbl.Stroke
frame2.BackgroundTransparency = 0.6
frame2.BorderSizePixel = 0
frame2.Parent = frame

do
	local function fn(arg, backgroundColor3, backgroundColor32)
		arg.MouseEnter:Connect(function()
			arg.BackgroundColor3 = backgroundColor3
			arg.BackgroundTransparency = 0.1
		end)

		arg.MouseLeave:Connect(function()
			arg.BackgroundColor3 = backgroundColor32
			arg.BackgroundTransparency = 0.3
		end)
	end

	local color = Color3.fromRGB
	fn(textButton, Color3.fromRGB(220, 20, 35), color(180, 15, 25))
	local color2 = Color3.fromRGB
	fn(textButton2, Color3.fromRGB(160, 15, 30), color2(120, 10, 20))
end

local tbl2, tbl3, fn, tbl4

do
	local frame3 = Instance.new("Frame")
	frame3.Name = "ContentArea"
	frame3.Size = UDim2.new(1, -149, 1, -58)
	frame3.Position = UDim2.new(0, 135, 0, 50)
	frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame3.BackgroundTransparency = 0.15
	frame3.BorderSizePixel = 0
	frame3.ClipsDescendants = true
	frame3.Parent = frame
	local uiCorner3 = Instance.new("UICorner")
	uiCorner3.CornerRadius = UDim.new(0, 10)
	uiCorner3.Parent = frame3
	local uiStroke3 = Instance.new("UIStroke")
	uiStroke3.Color = tbl.Stroke
	uiStroke3.Thickness = 1
	uiStroke3.Transparency = 0.35
	uiStroke3.Parent = frame3
	local frame4 = Instance.new("Frame")
	frame4.Name = "TabBar"
	frame4.Size = UDim2.new(0, 115, 1, -58)
	frame4.Position = UDim2.new(0, 12, 0, 50)
	frame4.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame4.BackgroundTransparency = 0.4
	frame4.BorderSizePixel = 0
	frame4.Parent = frame
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 12)
	uiCorner4.Parent = frame4
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.Stroke
	uiStroke4.Thickness = 1.5
	uiStroke4.Transparency = 0.4
	uiStroke4.Parent = frame4

	local tbl5 = {
		{ name = "Player", icon = "rbxassetid://114567720540659" },
		{ name = "Visual", icon = "rbxassetid://128162112866809" },
		{ name = "ESP", icon = "rbxassetid://127234874352422" },
		{ name = "Combat", icon = "rbxassetid://83752373575368" },
		{ name = "Skills", icon = "rbxassetid://110164536607343" },
		{ name = "Utilities", icon = "rbxassetid://117371753006597" },
		{ name = "Config", icon = "rbxassetid://77937190465422" },
	}

	local color = Color3.fromRGB(180, 180, 180)
	local white = tbl.White
	local color2 = Color3.fromRGB(180, 180, 180)
	local white2 = tbl.White
	local tbl6 = {}
	local tbl7 = {}
	tbl2 = {}

	for i, v in ipairs(tbl5) do
		local name = v.name
		local frame5 = Instance.new("Frame")
		frame5.Name = name .. "Content"
		frame5.Size = UDim2.new(1, 0, 1, 0)
		frame5.BackgroundTransparency = 1
		frame5.Visible = i == 1
		frame5.Parent = frame3
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Name = "Scroll"
		scrollingFrame.Size = UDim2.new(1, -4, 1, -4)
		scrollingFrame.Position = UDim2.new(0, 2, 0, 4)
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.ScrollBarThickness = 3
		scrollingFrame.ScrollBarImageColor3 = tbl.Accent
		scrollingFrame.ScrollBarImageTransparency = 0.3
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
		scrollingFrame.Parent = frame5
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Padding = UDim.new(0, 3)
		uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		uiListLayout.Parent = scrollingFrame
		local uiPadding = Instance.new("UIPadding")
		uiPadding.PaddingLeft = UDim.new(0, 5)
		uiPadding.PaddingRight = UDim.new(0, 10)
		uiPadding.PaddingTop = UDim.new(0, 3)
		uiPadding.PaddingBottom = UDim.new(0, 6)
		uiPadding.Parent = scrollingFrame
		tbl7[name] = frame5
		tbl2[name] = scrollingFrame
	end

	local n3 = #tbl5
	local n4 = frame4.AbsoluteSize.Y - 16

	if n4 <= 0 then
		n4 = 220
	end

	local n5 = math.floor((n4 - (n3 - 1) * 5) / n3)
	local n6 = n5 + 5
	local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

	for i, v in ipairs(tbl5) do
		local name = v.name
		local textButton3 = Instance.new("TextButton")
		textButton3.Name = name .. "Button"
		textButton3.Size = UDim2.new(1, -12, 0, n5)
		textButton3.Position = UDim2.new(0.5, 0, 0, 8 + (i - 1) * n6)
		textButton3.AnchorPoint = Vector2.new(0.5, 0)
		textButton3.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
		textButton3.BackgroundTransparency = 0.55
		textButton3.BorderSizePixel = 0
		textButton3.Text = ""
		textButton3.Parent = frame4
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 7)
		uiCorner5.Parent = textButton3
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.Color = tbl.Accent
		uiStroke5.Thickness = 1.2
		uiStroke5.Transparency = 0.4
		uiStroke5.Parent = textButton3
		local imageLabel2 = Instance.new("ImageLabel")
		imageLabel2.Name = "TabIcon"
		imageLabel2.Size = UDim2.new(0, 18, 0, 18)
		imageLabel2.Position = UDim2.new(0, 10, 0.5, 0)
		imageLabel2.AnchorPoint = Vector2.new(0, 0.5)
		imageLabel2.BackgroundTransparency = 1
		imageLabel2.ScaleType = Enum.ScaleType.Fit
		imageLabel2.Image = v.icon
		imageLabel2.ImageColor3 = color
		imageLabel2.Parent = textButton3
		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "TabName"
		textLabel.Size = UDim2.new(1, -36, 1, 0)
		textLabel.Position = UDim2.new(0, 33, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = name
		textLabel.TextColor3 = color2
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.ArialBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextYAlignment = Enum.TextYAlignment.Center
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Parent = textButton3

		if i == 1 then
			textButton3.BackgroundColor3 = Color3.fromRGB(160, 15, 30)
			textButton3.BackgroundTransparency = 0.2
			uiStroke5.Transparency = 0.1
			uiStroke5.Thickness = 1.8
			imageLabel2.ImageColor3 = white
			textLabel.TextColor3 = white2
		end

		local size = textButton3.Size
		local tween = TweenService:Create(textButton3, tweenInfo, { Size = UDim2.new(size.X.Scale, size.X.Offset + 6, size.Y.Scale, size.Y.Offset + 3) })
		local tween2 = TweenService:Create(textButton3, tweenInfo2, { Size = size })

		textButton3.MouseEnter:Connect(function()
			if textButton3.BackgroundTransparency > 0.25 then
				textButton3.BackgroundTransparency = 0.35
			end

			tween:Play()
		end)

		textButton3.MouseLeave:Connect(function()
			if textButton3.BackgroundTransparency > 0.25 then
				textButton3.BackgroundTransparency = 0.55
			end

			tween2:Play()
		end)

		table.insert(tbl6, textButton3)

		textButton3.MouseButton1Click:Connect(function()
			sound:Play()
			tween2:Play()

			for _, v2 in ipairs(tbl6) do
				v2.BackgroundColor3 = Color3.fromRGB(120, 10, 20)
				v2.BackgroundTransparency = 0.55
				local uiStroke6 = v2:FindFirstChildWhichIsA("UIStroke")

				if uiStroke6 then
					uiStroke6.Transparency = 0.4
					uiStroke6.Thickness = 1.2
				end

				local tabIcon = v2:FindFirstChild("TabIcon")

				if tabIcon then
					tabIcon.ImageColor3 = color
				end

				local tabName = v2:FindFirstChild("TabName")

				if tabName then
					tabName.TextColor3 = color2
				end
			end

			textButton3.BackgroundColor3 = Color3.fromRGB(160, 15, 30)
			textButton3.BackgroundTransparency = 0.2
			local uiStroke6 = textButton3:FindFirstChildWhichIsA("UIStroke")

			if uiStroke6 then
				uiStroke6.Transparency = 0.1
				uiStroke6.Thickness = 1.8
			end

			local tabIcon = textButton3:FindFirstChild("TabIcon")

			if tabIcon then
				tabIcon.ImageColor3 = white
			end

			local tabName = textButton3:FindFirstChild("TabName")

			if tabName then
				tabName.TextColor3 = white2
			end

			for _, v2 in pairs(tbl7) do
				v2.Visible = false
			end

			if tbl7[name] then
				tbl7[name].Visible = true
			end
		end)
	end

	tbl3 = {}
	local tbl8 = {}

	local function fn2(arg, arg2, arg3, arg4)
		if tbl8[arg] then
			local str = arg .. " #2"
			local n7 = 2

			while tbl8[str] do
				n7 += 1
				str = arg .. " #" .. n7
			end

			arg = str
		end

		local tbl9 = { key = arg, type = arg2, get = arg3, set = arg4 }
		table.insert(tbl3, tbl9)
		tbl8[arg] = tbl9
	end

	local tbl9 = {}

	local function fn3(arg, arg2, arg3)
		table.insert(tbl9, { list = arg, btn = arg2, h = arg3 })
	end

	fn = function(parent, arg, layoutOrder)
		local frame5 = Instance.new("Frame")
		frame5.Size = UDim2.new(1, 0, 0, arg)
		frame5.BackgroundColor3 = tbl.Surface
		frame5.BackgroundTransparency = 0.3
		frame5.BorderSizePixel = 0
		frame5.LayoutOrder = layoutOrder or 0
		frame5.Parent = parent
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 8)
		uiCorner5.Parent = frame5
		local uiStroke5 = Instance.new("UIStroke")
		uiStroke5.Color = tbl.StrokeOff
		uiStroke5.Thickness = 1
		uiStroke5.Transparency = 0.4
		uiStroke5.Parent = frame5
		return frame5, uiStroke5
	end

	tbl4 = {
		Divider = function(parent, text, layoutOrder)
			local frame5 = Instance.new("Frame")
			frame5.Name = "Divider"
			frame5.Size = UDim2.new(1, 0, 0, 14)
			frame5.BackgroundTransparency = 1
			frame5.LayoutOrder = layoutOrder or 0
			frame5.Parent = parent

			if text and text ~= "" then
				local frame6 = Instance.new("Frame")
				frame6.Size = UDim2.new(0, 10, 0, 1)
				frame6.Position = UDim2.new(0, 0, 0.5, 0)
				frame6.AnchorPoint = Vector2.new(0, 0.5)
				frame6.BackgroundColor3 = tbl.Stroke
				frame6.BackgroundTransparency = 0.5
				frame6.BorderSizePixel = 0
				frame6.Parent = frame5
				local textLabel = Instance.new("TextLabel")
				textLabel.Size = UDim2.new(0, 0, 1, 0)
				textLabel.AutomaticSize = Enum.AutomaticSize.X
				textLabel.Position = UDim2.new(0, 16, 0, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.Text = text
				textLabel.TextColor3 = tbl.Accent
				textLabel.TextSize = 10
				textLabel.Font = Enum.Font.ArialBold
				textLabel.Parent = frame5
				local frame7 = Instance.new("Frame")
				frame7.Size = UDim2.new(1, -28, 0, 1)
				frame7.Position = UDim2.new(0, 24, 0.5, 0)
				frame7.AnchorPoint = Vector2.new(0, 0.5)
				frame7.BackgroundColor3 = tbl.Stroke
				frame7.BackgroundTransparency = 0.5
				frame7.BorderSizePixel = 0
				frame7.Parent = frame5

				task.defer(function()
					local x = textLabel.AbsoluteSize.X
					frame7.Position = UDim2.new(0, 22 + x, 0.5, 0)
					frame7.Size = UDim2.new(1, -(24 + x), 0, 1)
				end)
			else
				local frame6 = Instance.new("Frame")
				frame6.Size = UDim2.new(1, 0, 0, 1)
				frame6.Position = UDim2.new(0, 0, 0.5, 0)
				frame6.AnchorPoint = Vector2.new(0, 0.5)
				frame6.BackgroundColor3 = tbl.Stroke
				frame6.BackgroundTransparency = 0.65
				frame6.BorderSizePixel = 0
				frame6.Parent = frame5
			end

			return frame5
		end,
		Toggle = function(arg, text, text2, arg2, arg3, arg4, arg5)
			arg2 = arg2 or false
			local v, v2 = fn(arg, text2 and text2 ~= "" and 36 or 28, arg4)
			v.Name = "Toggle_" .. text
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -72, 0, 14)
			textLabel.Position = UDim2.new(0, 10, 0, text2 and text2 ~= "" and 5 or 7)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = tbl.TextPrimary
			textLabel.TextSize = 11
			textLabel.Font = Enum.Font.ArialBold
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = v

			if text2 and text2 ~= "" then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(1, -72, 0, 11)
				textLabel2.Position = UDim2.new(0, 10, 0, 20)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = text2
				textLabel2.TextColor3 = tbl.TextMuted
				textLabel2.TextSize = 9
				textLabel2.Font = Enum.Font.Arial
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2.Parent = v
			end

			local frame5 = Instance.new("Frame")
			frame5.Size = UDim2.new(0, 34, 0, 18)
			frame5.Position = UDim2.new(1, -44, 0.5, 0)
			frame5.AnchorPoint = Vector2.new(1, 0.5)
			frame5.BackgroundColor3 = arg2 and tbl.Accent or tbl.ToggleOff
			frame5.BorderSizePixel = 0
			frame5.Parent = v
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(1, 0)
			uiCorner5.Parent = frame5
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(0, 12, 0, 12)
			frame6.Position = arg2 and UDim2.new(1, -14, 0.5, 0) or UDim2.new(0, 3, 0.5, 0)
			frame6.AnchorPoint = Vector2.new(0, 0.5)
			frame6.BackgroundColor3 = tbl.White
			frame6.BorderSizePixel = 0
			frame6.Parent = frame5
			local uiCorner6 = Instance.new("UICorner")
			uiCorner6.CornerRadius = UDim.new(1, 0)
			uiCorner6.Parent = frame6
			local uiStroke5 = Instance.new("UIStroke")
			uiStroke5.Color = Color3.fromRGB(170, 20, 40)
			uiStroke5.Thickness = 1.2
			uiStroke5.Transparency = 0.3
			uiStroke5.Parent = frame6
			local tweenInfo3 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

			local function fn4(arg6, arg7)
				arg2 = arg6
				TweenService:Create(frame5, tweenInfo3, { BackgroundColor3 = arg2 and tbl.Accent or tbl.ToggleOff }):Play()
				TweenService:Create(frame6, tweenInfo3, { Position = arg2 and UDim2.new(1, -14, 0.5, 0) or UDim2.new(0, 3, 0.5, 0) }):Play()
				v2.Color = arg2 and tbl.Stroke or tbl.StrokeOff
				v2.Transparency = arg2 and 0.25 or 0.4

				if arg7 and arg3 then
					arg3(arg2)
				end
			end

			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(1, 0, 1, 0)
			textButton3.BackgroundTransparency = 1
			textButton3.Text = ""
			textButton3.Parent = v

			textButton3.MouseButton1Click:Connect(function()
				sound:Play()
				fn4(not arg2, true)
			end)

			if arg2 then
				v2.Color = tbl.Stroke
				v2.Transparency = 0.25
			end

			if not arg5 then
				fn2(text, "Toggle", function()
					return arg2
				end, function(arg6)
					fn4(arg6, true)
				end)
			end

			return v
		end,
		Button = function(arg, text, text2, arg2, arg3, text3)
			local v = fn(arg, text2 and text2 ~= "" and 36 or 28, arg3)
			v.Name = "Button_" .. text
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, -74, 0, 14)
			textLabel.Position = UDim2.new(0, 10, 0, text2 and text2 ~= "" and 5 or 7)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = tbl.TextPrimary
			textLabel.TextSize = 11
			textLabel.Font = Enum.Font.ArialBold
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = v

			if text2 and text2 ~= "" then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(1, -74, 0, 11)
				textLabel2.Position = UDim2.new(0, 10, 0, 20)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = text2
				textLabel2.TextColor3 = tbl.TextMuted
				textLabel2.TextSize = 9
				textLabel2.Font = Enum.Font.Arial
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2.Parent = v
			end

			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(0, 52, 0, 20)
			textButton3.Position = UDim2.new(1, -8, 0.5, 0)
			textButton3.AnchorPoint = Vector2.new(1, 0.5)
			textButton3.BackgroundColor3 = tbl.Accent
			textButton3.BackgroundTransparency = 0.1
			textButton3.BorderSizePixel = 0
			textButton3.Text = text3 or "Run"
			textButton3.TextColor3 = tbl.White
			textButton3.TextSize = 10
			textButton3.Font = Enum.Font.ArialBold
			textButton3.Parent = v
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(0, 5)
			uiCorner5.Parent = textButton3
			local uiStroke5 = Instance.new("UIStroke")
			uiStroke5.Color = tbl.AccentBright
			uiStroke5.Thickness = 1
			uiStroke5.Transparency = 0.3
			uiStroke5.Parent = textButton3
			local tweenInfo3 = TweenInfo.new(0.1, Enum.EasingStyle.Quad)

			textButton3.MouseEnter:Connect(function()
				TweenService:Create(textButton3, tweenInfo3, { BackgroundColor3 = tbl.AccentBright, BackgroundTransparency = 0 }):Play()
			end)

			textButton3.MouseLeave:Connect(function()
				TweenService:Create(textButton3, tweenInfo3, { BackgroundColor3 = tbl.Accent, BackgroundTransparency = 0.1 }):Play()
			end)

			textButton3.MouseButton1Down:Connect(function()
				TweenService:Create(textButton3, tweenInfo3, { BackgroundColor3 = tbl.AccentDark }):Play()
			end)

			textButton3.MouseButton1Up:Connect(function()
				TweenService:Create(textButton3, tweenInfo3, { BackgroundColor3 = tbl.AccentBright }):Play()
			end)

			textButton3.MouseButton1Click:Connect(function()
				sound:Play()

				if arg2 then
					arg2()
				end
			end)

			return v
		end,
		Slider = function(arg, text, text2, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
			arg2 = arg2 or 0
			arg3 = arg3 or 100
			local n7 = math.clamp(arg4 or arg2, arg2, arg3)
			arg5 = arg5 or ""
			local n8 = n7
			local v = fn(arg, text2 and text2 ~= "" and 44 or 36, arg7)
			v.Name = "Slider_" .. text
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(0.62, 0, 0, 14)
			textLabel.Position = UDim2.new(0, 10, 0, 5)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = tbl.TextPrimary
			textLabel.TextSize = 11
			textLabel.Font = Enum.Font.ArialBold
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = v
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(0.34, 0, 0, 14)
			textLabel2.Position = UDim2.new(0.64, 0, 0, 5)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = tostring(n7) .. arg5
			textLabel2.TextColor3 = tbl.Accent
			textLabel2.TextSize = 10
			textLabel2.Font = Enum.Font.ArialBold
			textLabel2.TextXAlignment = Enum.TextXAlignment.Right
			textLabel2.Parent = v

			if text2 and text2 ~= "" then
				local textLabel3 = Instance.new("TextLabel")
				textLabel3.Size = UDim2.new(1, -20, 0, 10)
				textLabel3.Position = UDim2.new(0, 10, 0, 19)
				textLabel3.BackgroundTransparency = 1
				textLabel3.Text = text2
				textLabel3.TextColor3 = tbl.TextMuted
				textLabel3.TextSize = 9
				textLabel3.Font = Enum.Font.Arial
				textLabel3.TextXAlignment = Enum.TextXAlignment.Left
				textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel3.Parent = v
			end

			local frame5 = Instance.new("Frame")
			frame5.Size = UDim2.new(1, -20, 0, 5)
			frame5.Position = UDim2.new(0, 10, 1, -10)
			frame5.AnchorPoint = Vector2.new(0, 1)
			frame5.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			frame5.BorderSizePixel = 0
			frame5.Parent = v
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(1, 0)
			uiCorner5.Parent = frame5
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new((n7 - arg2) / (arg3 - arg2), 0, 1, 0)
			frame6.BackgroundColor3 = tbl.Accent
			frame6.BorderSizePixel = 0
			frame6.Parent = frame5
			local uiCorner6 = Instance.new("UICorner")
			uiCorner6.CornerRadius = UDim.new(1, 0)
			uiCorner6.Parent = frame6
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(0, 11, 0, 11)
			frame7.AnchorPoint = Vector2.new(0.5, 0.5)
			frame7.Position = UDim2.new((n7 - arg2) / (arg3 - arg2), 0, 0.5, 0)
			frame7.BackgroundColor3 = Color3.fromRGB(170, 20, 40)
			frame7.BorderSizePixel = 0
			frame7.ZIndex = 2
			frame7.Parent = frame5
			local uiCorner7 = Instance.new("UICorner")
			uiCorner7.CornerRadius = UDim.new(1, 0)
			uiCorner7.Parent = frame7
			local uiStroke5 = Instance.new("UIStroke")
			uiStroke5.Color = Color3.fromRGB(220, 50, 70)
			uiStroke5.Thickness = 1.5
			uiStroke5.Parent = frame7
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(1, 0, 1, 24)
			textButton3.Position = UDim2.new(0, 0, 0.5, 0)
			textButton3.AnchorPoint = Vector2.new(0, 0.5)
			textButton3.BackgroundTransparency = 1
			textButton3.Text = ""
			textButton3.ZIndex = 3
			textButton3.Parent = frame5

			local function fn4(arg9, arg10)
				n8 = math.clamp(math.floor(arg9), arg2, arg3)
				local n9 = (n8 - arg2) / (arg3 - arg2)
				frame6.Size = UDim2.new(n9, 0, 1, 0)
				frame7.Position = UDim2.new(n9, 0, 0.5, 0)
				textLabel2.Text = tostring(n8) .. arg5

				if arg10 and arg6 then
					arg6(n8)
				end
			end

			local function fn5(arg9)
				local n9 = arg3 - arg2
				fn4(arg2 + math.clamp((arg9 - frame5.AbsolutePosition.X) / frame5.AbsoluteSize.X, 0, 1) * n9, true)
			end

			local flag2 = false

			textButton3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag2 = true
					fn5(input.Position.X)
				end
			end)

			textButton3.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					flag2 = false
				end
			end)

			UserInputService.InputChanged:Connect(function(input)
				if flag2 and input.UserInputType == Enum.UserInputType.MouseMovement then
					fn5(input.Position.X)
				end
			end)

			textButton3.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Touch then
					fn5(input.Position.X)

					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							return
						end
						fn5(input.Position.X)
					end)
				end
			end)

			if not arg8 then
				fn2(text, "Slider", function()
					return n8
				end, function(arg9)
					fn4(arg9, true)
				end)
			end

			return v
		end,
		Dropdown = function(arg, text, text2, arg2, arg3, arg4, arg5, arg6)
			local text3 = arg3 or arg2[1] or "Select..."
			local flag2 = false
			local v = fn(arg, text2 and text2 ~= "" and 36 or 28, arg5)
			v.Name = "Dropdown_" .. text
			v.ClipsDescendants = false
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(0.48, 0, 0, 14)
			textLabel.Position = UDim2.new(0, 10, 0, text2 and text2 ~= "" and 5 or 7)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = tbl.TextPrimary
			textLabel.TextSize = 11
			textLabel.Font = Enum.Font.ArialBold
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = v

			if text2 and text2 ~= "" then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(0.48, 0, 0, 11)
				textLabel2.Position = UDim2.new(0, 10, 0, 20)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = text2
				textLabel2.TextColor3 = tbl.TextMuted
				textLabel2.TextSize = 9
				textLabel2.Font = Enum.Font.Arial
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2.Parent = v
			end

			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(0, 100, 0, 20)
			textButton3.Position = UDim2.new(1, -8, 0.5, 0)
			textButton3.AnchorPoint = Vector2.new(1, 0.5)
			textButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			textButton3.BackgroundTransparency = 0.1
			textButton3.BorderSizePixel = 0
			textButton3.Text = ""
			textButton3.Parent = v
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(0, 6)
			uiCorner5.Parent = textButton3
			local uiStroke5 = Instance.new("UIStroke")
			uiStroke5.Color = tbl.StrokeOff
			uiStroke5.Thickness = 1
			uiStroke5.Transparency = 0.2
			uiStroke5.Parent = textButton3
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(1, -24, 1, 0)
			textLabel2.Position = UDim2.new(0, 8, 0, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = text3
			textLabel2.TextColor3 = tbl.TextPrimary
			textLabel2.TextSize = 11
			textLabel2.Font = Enum.Font.ArialBold
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel2.Parent = textButton3
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Size = UDim2.new(0, 16, 1, 0)
			textLabel3.Position = UDim2.new(1, -18, 0, 0)
			textLabel3.BackgroundTransparency = 1
			textLabel3.Text = "▾"
			textLabel3.TextColor3 = tbl.Accent
			textLabel3.TextSize = 12
			textLabel3.Font = Enum.Font.Arial
			textLabel3.Parent = textButton3
			local n7 = math.min(#arg2, 5) * 22 + 26
			local frame5 = Instance.new("Frame")
			frame5.Name = "DropList_" .. text
			frame5.Size = UDim2.new(0, 100, 0, n7)
			frame5.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
			frame5.BackgroundTransparency = 0.04
			frame5.BorderSizePixel = 0
			frame5.Visible = false
			frame5.ZIndex = 60
			frame5.Parent = screenGui
			local uiCorner6 = Instance.new("UICorner")
			uiCorner6.CornerRadius = UDim.new(0, 8)
			uiCorner6.Parent = frame5
			local uiStroke6 = Instance.new("UIStroke")
			uiStroke6.Color = tbl.Stroke
			uiStroke6.Thickness = 1.2
			uiStroke6.Transparency = 0.2
			uiStroke6.Parent = frame5
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(1, 0, 0, 28)
			frame6.BackgroundTransparency = 1
			frame6.ZIndex = 61
			frame6.Parent = frame5
			local textLabel4 = Instance.new("TextLabel")
			textLabel4.Size = UDim2.new(1, -32, 1, 0)
			textLabel4.Position = UDim2.new(0, 8, 0, 0)
			textLabel4.BackgroundTransparency = 1
			textLabel4.Text = text
			textLabel4.TextColor3 = tbl.Accent
			textLabel4.TextSize = 10
			textLabel4.Font = Enum.Font.ArialBold
			textLabel4.TextXAlignment = Enum.TextXAlignment.Left
			textLabel4.ZIndex = 61
			textLabel4.Parent = frame6
			local textButton4 = Instance.new("TextButton")
			textButton4.Size = UDim2.new(0, 28, 0, 28)
			textButton4.Position = UDim2.new(1, -8, 0.5, 0)
			textButton4.AnchorPoint = Vector2.new(1, 0.5)
			textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
			textButton4.BackgroundTransparency = 0.3
			textButton4.BorderSizePixel = 0
			textButton4.Text = ""
			textButton4.ZIndex = 62
			textButton4.Parent = frame6
			local uiCorner7 = Instance.new("UICorner")
			uiCorner7.CornerRadius = UDim.new(0, 6)
			uiCorner7.Parent = textButton4
			local uiStroke7 = Instance.new("UIStroke")
			uiStroke7.Color = tbl.AccentBright
			uiStroke7.Thickness = 1.2
			uiStroke7.Transparency = 0.3
			uiStroke7.Parent = textButton4
			local imageLabel2 = Instance.new("ImageLabel")
			imageLabel2.Size = UDim2.new(0, 16, 0, 16)
			imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
			imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.ScaleType = Enum.ScaleType.Fit
			imageLabel2.Image = "rbxassetid://116396312853810"
			imageLabel2.ImageColor3 = tbl.White
			imageLabel2.ZIndex = 63
			imageLabel2.Parent = textButton4

			textButton4.MouseEnter:Connect(function()
				textButton4.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
				textButton4.BackgroundTransparency = 0.1
			end)

			textButton4.MouseLeave:Connect(function()
				textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
				textButton4.BackgroundTransparency = 0.3
			end)

			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(1, -8, 0, 1)
			frame7.Position = UDim2.new(0.5, 0, 0, 28)
			frame7.AnchorPoint = Vector2.new(0.5, 0)
			frame7.BackgroundColor3 = tbl.Stroke
			frame7.BackgroundTransparency = 0.6
			frame7.BorderSizePixel = 0
			frame7.ZIndex = 61
			frame7.Parent = frame5
			local scrollingFrame = Instance.new("ScrollingFrame")
			scrollingFrame.Size = UDim2.new(1, 0, 1, -30)
			scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
			scrollingFrame.BackgroundTransparency = 1
			scrollingFrame.BorderSizePixel = 0
			scrollingFrame.ScrollBarThickness = 2
			scrollingFrame.ScrollBarImageColor3 = tbl.Accent
			scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
			scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			scrollingFrame.ZIndex = 61
			scrollingFrame.Parent = frame5
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Padding = UDim.new(0, 2)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = scrollingFrame
			local uiPadding = Instance.new("UIPadding")
			uiPadding.PaddingLeft = UDim.new(0, 4)
			uiPadding.PaddingRight = UDim.new(0, 4)
			uiPadding.PaddingTop = UDim.new(0, 3)
			uiPadding.Parent = scrollingFrame
			local tbl10 = {}

			local function fn4(text4, arg7)
				if not text4 then
					return
				end
				text3 = text4
				textLabel2.Text = text4

				for _, v2 in ipairs(tbl10) do
					local flag3 = v2.name == text4
					v2.btn.BackgroundColor3 = flag3 and tbl.Accent or Color3.fromRGB(30, 30, 30)
					v2.btn.BackgroundTransparency = flag3 and 0.3 or 0.65
					v2.btn.TextColor3 = flag3 and tbl.White or tbl.TextSecond
				end

				if arg7 and arg4 then
					arg4(text4)
				end
			end

			for i, v2 in ipairs(arg2) do
				local flag3 = v2 == text3
				local textButton5 = Instance.new("TextButton")
				textButton5.Size = UDim2.new(1, 0, 0, 20)
				textButton5.BackgroundColor3 = flag3 and tbl.Accent or Color3.fromRGB(30, 30, 30)
				textButton5.BackgroundTransparency = flag3 and 0.3 or 0.65
				textButton5.BorderSizePixel = 0
				textButton5.Text = v2
				textButton5.TextColor3 = flag3 and tbl.White or tbl.TextSecond
				textButton5.TextSize = 11
				textButton5.Font = Enum.Font.ArialBold
				textButton5.TextTruncate = Enum.TextTruncate.AtEnd
				textButton5.ZIndex = 62
				textButton5.LayoutOrder = i
				textButton5.Parent = scrollingFrame
				local uiCorner8 = Instance.new("UICorner")
				uiCorner8.CornerRadius = UDim.new(0, 5)
				uiCorner8.Parent = textButton5
				table.insert(tbl10, { btn = textButton5, name = v2 })

				textButton5.MouseEnter:Connect(function()
					if v2 ~= text3 then
						textButton5.BackgroundTransparency = 0.4
						textButton5.TextColor3 = tbl.TextPrimary
					end
				end)

				textButton5.MouseLeave:Connect(function()
					if v2 ~= text3 then
						textButton5.BackgroundTransparency = 0.65
						textButton5.TextColor3 = tbl.TextSecond
					end
				end)

				textButton5.MouseButton1Click:Connect(function()
					sound:Play()
					fn4(v2, true)
					flag2 = false
					textLabel3.Text = "▾"
					TweenService:Create(frame5, TweenInfo.new(0.14), { Size = UDim2.new(0, frame5.AbsoluteSize.X, 0, 0) }):Play()
					task.wait(0.15)
					frame5.Visible = false
				end)
			end

			local function fn5()
				flag2 = false
				textLabel3.Text = "▾"
				TweenService:Create(frame5, TweenInfo.new(0.14), { Size = UDim2.new(0, 116, 0, 0) }):Play()
				task.wait(0.15)
				frame5.Visible = false
			end

			local function fn6()
				local absolutePosition = textButton3.AbsolutePosition
				local n8 = absolutePosition.Y + textButton3.AbsoluteSize.Y + 4

				if n8 + n7 > workspace.CurrentCamera.ViewportSize.Y then
					n8 = absolutePosition.Y - n7 - 4
				end

				frame5.Position = UDim2.new(0, absolutePosition.X, 0, n8)
				frame5.Size = UDim2.new(0, 116, 0, 0)
				frame5.Visible = true
				textLabel3.Text = "▴"
				TweenService:Create(frame5, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 116, 0, n7) }):Play()
			end

			fn3(frame5, textButton3, n7)

			v.Destroying:Connect(function()
				frame5:Destroy()
			end)

			textButton4.MouseButton1Click:Connect(function()
				sound:Play()
				fn5()
			end)

			for _, v2 in ipairs(tbl6) do
				v2.MouseButton1Click:Connect(function()
					if flag2 then
						fn5()
					end
				end)
			end

			textButton2.MouseButton1Click:Connect(function()
				if flag2 then
					fn5()
				end
			end)

			screenGui.AncestryChanged:Connect(function()
				if flag2 then
					flag2 = false
					frame5.Visible = false
				end
			end)

			textButton3.MouseButton1Click:Connect(function()
				sound:Play()

				if flag2 then
					fn5()
				else
					flag2 = true
					fn6()
				end
			end)

			if not arg6 then
				fn2(text, "Dropdown", function()
					return text3
				end, function(arg7)
					fn4(arg7, true)
				end)
			end

			return v
		end,
		ColorPicker = function(arg, text, text2, arg2, arg3, arg4, arg5)
			local color3 = arg2 or Color3.fromRGB(220, 20, 40)
			local n7 = math.floor(color3.R * 255)
			local n8 = math.floor(color3.G * 255)
			local n9 = math.floor(color3.B * 255)
			local flag2 = false
			local v, v2 = fn(arg, text2 and text2 ~= "" and 36 or 28, arg4)
			v.Name = "ColorPicker_" .. text
			v.ClipsDescendants = false
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(0.52, 0, 0, 14)
			textLabel.Position = UDim2.new(0, 10, 0, text2 and text2 ~= "" and 5 or 7)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = text
			textLabel.TextColor3 = tbl.TextPrimary
			textLabel.TextSize = 11
			textLabel.Font = Enum.Font.ArialBold
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			textLabel.TextTruncate = Enum.TextTruncate.AtEnd
			textLabel.Parent = v

			if text2 and text2 ~= "" then
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.Size = UDim2.new(0.52, 0, 0, 11)
				textLabel2.Position = UDim2.new(0, 10, 0, 20)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Text = text2
				textLabel2.TextColor3 = tbl.TextMuted
				textLabel2.TextSize = 9
				textLabel2.Font = Enum.Font.Arial
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2.Parent = v
			end

			local frame5 = Instance.new("Frame")
			frame5.Size = UDim2.new(0, 100, 0, 20)
			frame5.Position = UDim2.new(1, -8, 0.5, 0)
			frame5.AnchorPoint = Vector2.new(1, 0.5)
			frame5.BackgroundTransparency = 1
			frame5.Parent = v
			local textButton3 = Instance.new("TextButton")
			textButton3.Size = UDim2.new(1, 0, 1, 0)
			textButton3.BackgroundTransparency = 1
			textButton3.Text = ""
			textButton3.ZIndex = 3
			textButton3.Parent = frame5
			local frame6 = Instance.new("Frame")
			frame6.Size = UDim2.new(0, 26, 0, 26)
			frame6.Position = UDim2.new(0, 0, 0, 0)
			frame6.BackgroundColor3 = color3
			frame6.BorderSizePixel = 0
			frame6.ZIndex = 2
			frame6.Parent = frame5
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(0, 6)
			uiCorner5.Parent = frame6
			local uiStroke5 = Instance.new("UIStroke")
			uiStroke5.Color = tbl.White
			uiStroke5.Thickness = 1.5
			uiStroke5.Transparency = 0.4
			uiStroke5.Parent = frame6
			local textLabel2 = Instance.new("TextLabel")
			textLabel2.Size = UDim2.new(0, 68, 1, 0)
			textLabel2.Position = UDim2.new(0, 32, 0, 0)
			textLabel2.BackgroundTransparency = 1
			textLabel2.Text = string.format("#%02X%02X%02X", n7, n8, n9)
			textLabel2.TextColor3 = tbl.TextSecond
			textLabel2.TextSize = 11
			textLabel2.Font = Enum.Font.Code
			textLabel2.TextXAlignment = Enum.TextXAlignment.Left
			textLabel2.ZIndex = 2
			textLabel2.Parent = frame5
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Size = UDim2.new(0, 14, 1, 0)
			textLabel3.Position = UDim2.new(1, -14, 0, 0)
			textLabel3.BackgroundTransparency = 1
			textLabel3.Text = "▾"
			textLabel3.TextColor3 = tbl.Accent
			textLabel3.TextSize = 12
			textLabel3.Font = Enum.Font.Arial
			textLabel3.ZIndex = 2
			textLabel3.Parent = frame5
			local frame7 = Instance.new("Frame")
			frame7.Name = "CPPanel_" .. text
			frame7.Size = UDim2.new(0, 0, 0, 0)
			frame7.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
			frame7.BackgroundTransparency = 0.06
			frame7.BorderSizePixel = 0
			frame7.ClipsDescendants = true
			frame7.Visible = false
			frame7.ZIndex = 55
			frame7.Parent = screenGui
			local uiCorner6 = Instance.new("UICorner")
			uiCorner6.CornerRadius = UDim.new(0, 8)
			uiCorner6.Parent = frame7
			local uiStroke6 = Instance.new("UIStroke")
			uiStroke6.Color = tbl.Stroke
			uiStroke6.Thickness = 1.2
			uiStroke6.Transparency = 0.25
			uiStroke6.Parent = frame7
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.new(1, 0, 0, 28)
			frame8.BackgroundTransparency = 1
			frame8.ZIndex = 56
			frame8.Parent = frame7
			local textLabel4 = Instance.new("TextLabel")
			textLabel4.Size = UDim2.new(1, -32, 1, 0)
			textLabel4.Position = UDim2.new(0, 8, 0, 0)
			textLabel4.BackgroundTransparency = 1
			textLabel4.Text = text
			textLabel4.TextColor3 = tbl.Accent
			textLabel4.TextSize = 10
			textLabel4.Font = Enum.Font.ArialBold
			textLabel4.TextXAlignment = Enum.TextXAlignment.Left
			textLabel4.ZIndex = 56
			textLabel4.Parent = frame8
			local textButton4 = Instance.new("TextButton")
			textButton4.Size = UDim2.new(0, 28, 0, 28)
			textButton4.Position = UDim2.new(1, -8, 0.5, 0)
			textButton4.AnchorPoint = Vector2.new(1, 0.5)
			textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
			textButton4.BackgroundTransparency = 0.3
			textButton4.BorderSizePixel = 0
			textButton4.Text = ""
			textButton4.ZIndex = 57
			textButton4.Parent = frame8
			local uiCorner7 = Instance.new("UICorner")
			uiCorner7.CornerRadius = UDim.new(0, 6)
			uiCorner7.Parent = textButton4
			local uiStroke7 = Instance.new("UIStroke")
			uiStroke7.Color = tbl.AccentBright
			uiStroke7.Thickness = 1.2
			uiStroke7.Transparency = 0.3
			uiStroke7.Parent = textButton4
			local imageLabel2 = Instance.new("ImageLabel")
			imageLabel2.Size = UDim2.new(0, 16, 0, 16)
			imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
			imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
			imageLabel2.BackgroundTransparency = 1
			imageLabel2.ScaleType = Enum.ScaleType.Fit
			imageLabel2.Image = "rbxassetid://116396312853810"
			imageLabel2.ImageColor3 = tbl.White
			imageLabel2.ZIndex = 57
			imageLabel2.Parent = textButton4
			local frame9 = Instance.new("Frame")
			frame9.Size = UDim2.new(1, -8, 0, 1)
			frame9.Position = UDim2.new(0.5, 0, 0, 28)
			frame9.AnchorPoint = Vector2.new(0.5, 0)
			frame9.BackgroundColor3 = tbl.Stroke
			frame9.BackgroundTransparency = 0.6
			frame9.BorderSizePixel = 0
			frame9.ZIndex = 56
			frame9.Parent = frame7
			local frame10 = Instance.new("Frame")
			frame10.Size = UDim2.new(1, 0, 1, -28)
			frame10.Position = UDim2.new(0, 0, 0, 28)
			frame10.BackgroundTransparency = 1
			frame10.ZIndex = 56
			frame10.Parent = frame7
			local uiListLayout = Instance.new("UIListLayout")
			uiListLayout.Padding = UDim.new(0, 3)
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout.Parent = frame10
			local uiPadding = Instance.new("UIPadding")
			uiPadding.PaddingLeft = UDim.new(0, 8)
			uiPadding.PaddingRight = UDim.new(0, 8)
			uiPadding.PaddingTop = UDim.new(0, 5)
			uiPadding.PaddingBottom = UDim.new(0, 5)
			uiPadding.Parent = frame10

			local function fn4()
				color3 = Color3.fromRGB(n7, n8, n9)
				frame6.BackgroundColor3 = color3
				textLabel2.Text = string.format("#%02X%02X%02X", n7, n8, n9)

				if arg3 then
					arg3(color3)
				end
			end

			local tbl10 = {}

			local function fn5(text3, textColor3, arg6, arg7, layoutOrder)
				local frame11 = Instance.new("Frame")
				frame11.Size = UDim2.new(1, 0, 0, 24)
				frame11.BackgroundTransparency = 1
				frame11.LayoutOrder = layoutOrder
				frame11.ZIndex = 56
				frame11.Parent = frame10
				local textLabel5 = Instance.new("TextLabel")
				textLabel5.Size = UDim2.new(0, 12, 1, 0)
				textLabel5.BackgroundTransparency = 1
				textLabel5.Text = text3
				textLabel5.TextColor3 = textColor3
				textLabel5.TextSize = 10
				textLabel5.Font = Enum.Font.ArialBold
				textLabel5.TextXAlignment = Enum.TextXAlignment.Left
				textLabel5.ZIndex = 56
				textLabel5.Parent = frame11
				local textLabel6 = Instance.new("TextLabel")
				textLabel6.Size = UDim2.new(0, 26, 1, 0)
				textLabel6.Position = UDim2.new(1, 0, 0, 0)
				textLabel6.AnchorPoint = Vector2.new(1, 0)
				textLabel6.BackgroundTransparency = 1
				textLabel6.Text = tostring(arg6())
				textLabel6.TextColor3 = tbl.TextSecond
				textLabel6.TextSize = 10
				textLabel6.Font = Enum.Font.Code
				textLabel6.TextXAlignment = Enum.TextXAlignment.Right
				textLabel6.ZIndex = 56
				textLabel6.Parent = frame11
				local frame12 = Instance.new("Frame")
				frame12.Size = UDim2.new(1, -44, 0, 6)
				frame12.Position = UDim2.new(0, 18, 0.5, 0)
				frame12.AnchorPoint = Vector2.new(0, 0.5)
				frame12.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				frame12.BorderSizePixel = 0
				frame12.ZIndex = 56
				frame12.Parent = frame11
				local uiCorner8 = Instance.new("UICorner")
				uiCorner8.CornerRadius = UDim.new(1, 0)
				uiCorner8.Parent = frame12
				local frame13 = Instance.new("Frame")
				frame13.Size = UDim2.new(arg6() / 255, 0, 1, 0)
				frame13.BackgroundColor3 = textColor3
				frame13.BorderSizePixel = 0
				frame13.ZIndex = 57
				frame13.Parent = frame12
				local uiCorner9 = Instance.new("UICorner")
				uiCorner9.CornerRadius = UDim.new(1, 0)
				uiCorner9.Parent = frame13
				local frame14 = Instance.new("Frame")
				frame14.Size = UDim2.new(0, 12, 0, 12)
				frame14.AnchorPoint = Vector2.new(0.5, 0.5)
				frame14.Position = UDim2.new(arg6() / 255, 0, 0.5, 0)
				frame14.BackgroundColor3 = tbl.White
				frame14.BorderSizePixel = 0
				frame14.ZIndex = 58
				frame14.Parent = frame12
				local uiCorner10 = Instance.new("UICorner")
				uiCorner10.CornerRadius = UDim.new(1, 0)
				uiCorner10.Parent = frame14
				local uiStroke8 = Instance.new("UIStroke")
				uiStroke8.Color = textColor3
				uiStroke8.Thickness = 1.5
				uiStroke8.Parent = frame14

				table.insert(tbl10, function()
					local n10 = arg6() / 255
					frame13.Size = UDim2.new(n10, 0, 1, 0)
					frame14.Position = UDim2.new(n10, 0, 0.5, 0)
					textLabel6.Text = tostring(arg6())
				end)

				local textButton5 = Instance.new("TextButton")
				textButton5.Size = UDim2.new(1, 0, 1, 16)
				textButton5.Position = UDim2.new(0, 0, 0.5, 0)
				textButton5.AnchorPoint = Vector2.new(0, 0.5)
				textButton5.BackgroundTransparency = 1
				textButton5.Text = ""
				textButton5.ZIndex = 59
				textButton5.Parent = frame12

				local function fn6(arg8)
					local n10 = math.clamp((arg8 - frame12.AbsolutePosition.X) / frame12.AbsoluteSize.X, 0, 1)
					arg7(math.floor(n10 * 255))
					frame13.Size = UDim2.new(n10, 0, 1, 0)
					frame14.Position = UDim2.new(n10, 0, 0.5, 0)
					textLabel6.Text = tostring(arg6())
					fn4()
				end

				local flag3 = false

				textButton5.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						flag3 = true
						fn6(input.Position.X)
					end
				end)

				textButton5.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						flag3 = false
					end
				end)

				UserInputService.InputChanged:Connect(function(input)
					if flag3 and input.UserInputType == Enum.UserInputType.MouseMovement then
						fn6(input.Position.X)
					end
				end)

				textButton5.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.Touch then
						fn6(input.Position.X)

						input.Changed:Connect(function()
							if input.UserInputState ~= Enum.UserInputState.End then
								fn6(input.Position.X)
							end
						end)
					end
				end)
			end

			fn5("R", Color3.fromRGB(220, 60, 60), function()
				return n7
			end, function(arg6)
				n7 = arg6
			end, 1)

			fn5("G", Color3.fromRGB(60, 200, 80), function()
				return n8
			end, function(arg6)
				n8 = arg6
			end, 2)

			fn5("B", Color3.fromRGB(60, 120, 220), function()
				return n9
			end, function(arg6)
				n9 = arg6
			end, 3)

			local frame11 = Instance.new("Frame")
			frame11.Size = UDim2.new(1, 0, 0, 20)
			frame11.BackgroundTransparency = 1
			frame11.LayoutOrder = 4
			frame11.ZIndex = 56
			frame11.Parent = frame10
			local uiListLayout2 = Instance.new("UIListLayout")
			uiListLayout2.FillDirection = Enum.FillDirection.Horizontal
			uiListLayout2.Padding = UDim.new(0, 4)
			uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			uiListLayout2.Parent = frame11
			local tbl11 = {}
			local color4 = Color3.fromRGB(220, 20, 40)
			local color5 = Color3.fromRGB(255, 120, 0)
			local color6 = Color3.fromRGB(240, 200, 0)
			local color7 = Color3.fromRGB(40, 200, 80)
			local color8 = Color3.fromRGB(0, 140, 240)
			local color9 = Color3.fromRGB(150, 60, 230)
			local color10 = Color3.fromRGB(240, 240, 240)
			local color11 = Color3.fromRGB
			tbl11[1] = color4
			tbl11[2] = color5
			tbl11[3] = color6
			tbl11[4] = color7
			tbl11[5] = color8
			tbl11[6] = color9
			tbl11[7] = color10

			do
				local values = table.pack(color11(60, 60, 60))
				table.move(values, 1, values.n, 8, tbl11)
			end

			for i, v3 in ipairs(tbl11) do
				local textButton5 = Instance.new("TextButton")
				textButton5.Size = UDim2.new(0, 18, 0, 18)
				textButton5.BackgroundColor3 = v3
				textButton5.BorderSizePixel = 0
				textButton5.Text = ""
				textButton5.LayoutOrder = i
				textButton5.ZIndex = 57
				textButton5.Parent = frame11
				local uiCorner8 = Instance.new("UICorner")
				uiCorner8.CornerRadius = UDim.new(0, 4)
				uiCorner8.Parent = textButton5

				textButton5.MouseButton1Click:Connect(function()
					n7 = math.floor(v3.R * 255)
					n8 = math.floor(v3.G * 255)
					n9 = math.floor(v3.B * 255)
					fn4()
				end)
			end

			local function fn6(arg6)
				n7 = math.floor(arg6.R * 255)
				n8 = math.floor(arg6.G * 255)
				n9 = math.floor(arg6.B * 255)
				fn4()

				for _, v3 in ipairs(tbl10) do
					v3()
				end
			end

			local tweenInfo3 = TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			local tweenInfo4 = TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			local n10 = 200

			local function fn7()
				flag2 = false
				textLabel3.Text = "▾"
				v2.Color = tbl.StrokeOff
				v2.Transparency = 0.4
				TweenService:Create(frame7, tweenInfo4, { Size = UDim2.new(0, 200, 0, 0) }):Play()
				task.wait(0.17)
				frame7.Visible = false
			end

			local function fn8()
				local absolutePosition = v.AbsolutePosition
				local absoluteSize = v.AbsoluteSize
				flag2 = true
				textLabel3.Text = "▴"
				v2.Color = tbl.Stroke
				v2.Transparency = 0.2
				frame7.Size = UDim2.new(0, 200, 0, 0)
				frame7.Position = UDim2.new(0, absolutePosition.X + absoluteSize.X - n10, 0, absolutePosition.Y + absoluteSize.Y + 4)
				frame7.Visible = true
				TweenService:Create(frame7, tweenInfo3, { Size = UDim2.new(0, 200, 0, 142) }):Play()
			end

			textButton3.MouseButton1Click:Connect(function()
				sound:Play()

				if flag2 then
					fn7()
				else
					fn8()
				end
			end)

			textButton4.MouseButton1Click:Connect(function()
				sound:Play()
				fn7()
			end)

			textButton4.MouseEnter:Connect(function()
				textButton4.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
				textButton4.BackgroundTransparency = 0.1
			end)

			textButton4.MouseLeave:Connect(function()
				textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
				textButton4.BackgroundTransparency = 0.3
			end)

			if not arg5 then
				fn2(text, "ColorPicker", function()
					return color3
				end, fn6)
			end

			return v
		end,
	}
end

local fn2
fn2 = nil
local fn3
fn3 = nil
local flag2
flag2 = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local flag3
flag3 = false
local n3
n3 = 100
local flag4
flag4 = false
local walkSpeed
walkSpeed = 30
local flag5
flag5 = false
local jumpPower
jumpPower = 100
local flag6
flag6 = false
local fn4, fn5

do
	local connection = nil
	local tbl5 = { FakeDual = true, FakeDualGun = true, HitboxVisual = true, VisualGoldDrop = true }

	local function fn6(arg)
		local parent = arg.Parent

		while parent do
			if parent:IsA("Accessory") then
				return true
			end
			parent = parent.Parent
		end

		return false
	end

	fn4 = function()
		connection = RunService.Stepped:Connect(function()
			if not flag6 then
				return
			end
			local character = localPlayer.Character
			if not character then
				return
			end

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") and not tbl5[descendant.Name] and not fn6(descendant) then
					descendant.CanCollide = false
				end
			end
		end)
	end

	fn5 = function()
		flag6 = false

		if connection then
			connection:Disconnect()
			connection = nil
		end

		task.defer(function()
			local character = localPlayer.Character
			if not character then
				return
			end

			for _, descendant in ipairs(character:GetDescendants()) do
				if descendant:IsA("BasePart") and not tbl5[descendant.Name] and not fn6(descendant) then
					descendant.CanCollide = descendant.Name ~= "HumanoidRootPart"
				end
			end

			task.wait()
			local character2 = localPlayer.Character
			if not character2 then
				return
			end

			for _, descendant in ipairs(character2:GetDescendants()) do
				if descendant:IsA("BasePart") and not tbl5[descendant.Name] and not fn6(descendant) then
					if descendant.Name ~= "HumanoidRootPart" then
						descendant.CanCollide = true
					end
				end
			end
		end)
	end
end

local flag7
flag7 = false
local fn6, fn7
local connection = nil

fn6 = function()
	connection = UserInputService.JumpRequest:Connect(function()
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local flag8

		if humanoid then
			local dead = Enum.HumanoidStateType.Dead
			flag8 = humanoid:GetState() ~= dead
		else
			flag8 = humanoid
		end

		if flag8 then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end

fn7 = function()
	if connection then
		connection:Disconnect()
		connection = nil
	end
end

local flag8
flag8 = false
local n4
n4 = 80
local fn8, fn9

do
	local connection2 = nil
	local bodyVelocity = nil
	local bodyGyro = nil

	local function fn10()
		local ok, result = pcall(function()
			local playerModule = localPlayer.PlayerScripts:FindFirstChild("PlayerModule")

			if playerModule then
				local controlModule = playerModule:FindFirstChild("ControlModule")
				if controlModule then
					return require(controlModule):GetMoveVector()
				end
			end

			return Vector3.zero
		end)

		return ok and result or Vector3.zero
	end

	fn8 = function()
		if bodyVelocity then
			bodyVelocity:Destroy()
		end

		if bodyGyro then
			bodyGyro:Destroy()
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not humanoid then
			return
		end
		humanoid.PlatformStand = true
		bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.MaxForce = Vector3.new(99999, 99999, 99999)
		bodyVelocity.Velocity = Vector3.zero
		bodyVelocity.Parent = humanoidRootPart
		bodyGyro = Instance.new("BodyGyro")
		bodyGyro.MaxTorque = Vector3.new(99999, 99999, 99999)
		bodyGyro.P = 12500
		bodyGyro.Parent = humanoidRootPart

		connection2 = RunService.RenderStepped:Connect(function()
			if not flag8 or not bodyVelocity then
				return
			end
			local currentCamera = workspace.CurrentCamera
			local vector = fn10()
			local n5 = 0

			if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
				n5 = 1
			end

			if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				n5 = -1
			end

			if vector.Magnitude == 0 then
				local n6 = 0

				if UserInputService:IsKeyDown(Enum.KeyCode.W) then
					n6 = 1
				end

				if UserInputService:IsKeyDown(Enum.KeyCode.S) then
					n6 = -1
				end

				local n7 = 0

				if UserInputService:IsKeyDown(Enum.KeyCode.D) then
					n7 = 1
				end

				if UserInputService:IsKeyDown(Enum.KeyCode.A) then
					n7 = -1
				end

				vector = Vector3.new(n7, 0, -n6)
			end

			local vector2 = Vector3.new(vector.X, n5, vector.Z)

			if vector2.Magnitude > 0 then
				bodyVelocity.Velocity = currentCamera.CFrame:VectorToWorldSpace(vector2.Unit) * n4
			else
				bodyVelocity.Velocity = Vector3.zero
			end

			if bodyGyro then
				bodyGyro.CFrame = currentCamera.CFrame
			end
		end)
	end

	fn9 = function()
		flag8 = false

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local character = localPlayer.Character

		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.PlatformStand = false
			end
		end

		if bodyVelocity then
			bodyVelocity:Destroy()
			bodyVelocity = nil
		end

		if bodyGyro then
			bodyGyro:Destroy()
			bodyGyro = nil
		end
	end
end

do
	local frame3 = Instance.new("Frame")
	frame3.Name = "BindableButtons"
	frame3.Size = UDim2.new(0, 160, 1, -20)
	frame3.Position = UDim2.new(1, -170, 0, 10)
	frame3.BackgroundTransparency = 1
	frame3.AnchorPoint = Vector2.new(0, 0)
	frame3.ZIndex = 15
	frame3.Parent = screenGui
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.FillDirection = Enum.FillDirection.Vertical
	uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	uiListLayout.Padding = UDim.new(0, 6)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = frame3
end

local tbl5 = {
	Surface = Color3.fromRGB(18, 18, 18),
	SurfaceHigh = Color3.fromRGB(32, 32, 32),
	AccentBright = Color3.fromRGB(255, 45, 65),
	Accent = Color3.fromRGB(210, 20, 40),
	AccentDark = Color3.fromRGB(130, 8, 18),
	TextPrimary = Color3.fromRGB(240, 240, 240),
	White = Color3.fromRGB(255, 255, 255),
}

local screenGui2 = Instance.new("ScreenGui")
screenGui2.Name = "RuzScreenBtns"
screenGui2.ResetOnSpawn = false
screenGui2.DisplayOrder = 99
screenGui2.IgnoreGuiInset = true
screenGui2.Parent = game.CoreGui
local tbl6 = {}

RunService.RenderStepped:Connect(function()
	for _, v in ipairs(tbl6) do
		v.s.Rotation = (v.s.Rotation + 2) % 360
		v.t.Rotation = (v.t.Rotation + 2) % 360
	end
end)

local str, v, v2, v3, v4, rightShift, fn10

do
	local connection2 = nil
	local connection3 = nil

	local function fn11()
		if not flag4 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoid and humanoid.WalkSpeed ~= walkSpeed then
			humanoid.WalkSpeed = walkSpeed
		end
	end

	local function fn12()
		if not flag5 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoid and humanoid.JumpPower ~= jumpPower then
			humanoid.JumpPower = jumpPower
		end
	end

	local function fn13()
		if connection2 then
			connection2:Disconnect()
		end

		connection2 = RunService.RenderStepped:Connect(fn11)
	end

	local function fn14()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local character = localPlayer.Character

		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.WalkSpeed = 16
			end
		end
	end

	local function fn15()
		if connection3 then
			connection3:Disconnect()
		end

		connection3 = RunService.RenderStepped:Connect(fn12)
	end

	local function fn16()
		if connection3 then
			connection3:Disconnect()
			connection3 = nil
		end

		local character = localPlayer.Character

		if character then
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				humanoid.JumpPower = 50
			end
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		if flag4 then
			fn11()
		end

		if flag5 then
			fn12()
		end
	end)

	local keyCode = nil
	local keyCode2 = nil
	local keyCode3 = nil
	local keyCode4 = nil
	str = nil
	local v5 = nil
	local v6 = nil
	local v7 = nil
	local v8 = nil
	v = nil
	v2 = nil
	v3 = nil
	v4 = nil
	rightShift = Enum.KeyCode.RightShift

	local function fn17(arg, arg2)
		if arg then
			arg.Text = arg2 and arg2.Name or "None"
		end
	end

	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if input.UserInputType ~= Enum.UserInputType.Keyboard then
			return
		end

		if str then
			if input.KeyCode ~= Enum.KeyCode.Escape then
				if str == "noclip" then
					keyCode = input.KeyCode
					fn17(v5, keyCode)
				elseif str == "fly" then
					keyCode2 = input.KeyCode
					fn17(v7, keyCode2)
				elseif str == "shoot" then
					keyCode3 = input.KeyCode
					fn17(v, keyCode3)
				elseif str == "camlock" then
					keyCode4 = input.KeyCode
					fn17(v3, keyCode4)
				elseif str == "grabgun" then
					grabGunKeybind = input.KeyCode
					fn17(grabGunKeybindLabel, grabGunKeybind)
				end
			end

			if str == "noclip" and v6 then
				v6()
			end

			if str == "fly" and v8 then
				v8()
			end

			if str == "shoot" and v2 then
				v2()
			end

			if str == "camlock" and v4 then
				v4()
			end

			if str == "grabgun" and grabGunKeybindSetIdle then
				grabGunKeybindSetIdle()
			end

			str = nil
			return
		end

		if flag2 then
			return
		end

		if input.KeyCode == rightShift then
			if isMinimized then
				restorePanel()
			else
				minimizePanel()
			end

			return
		end

		if keyCode and input.KeyCode == keyCode then
			flag6 = not flag6

			if flag6 then
				fn4()
			else
				fn5()
			end
		end

		if keyCode2 and input.KeyCode == keyCode2 then
			flag8 = not flag8

			if flag8 then
				fn8()
			else
				fn9()
			end
		end

		if keyCode3 and input.KeyCode == keyCode3 then
			SmartShoot()
		end

		if keyCode4 and input.KeyCode == keyCode4 then
			camlockEnabled = not camlockEnabled
			camlockTarget = nil

			if camlockEnabled then
				StartCamlock()
			else
				StopCamlock()
			end
		end

		if grabGunKeybind and input.KeyCode == grabGunKeybind then
			DoGrabGun()
		end
	end)

	fn10 = function(arg, arg2, arg3)
		local v9, v10 = fn(arg, 38, arg2)
		v9.Name = "KeybindRow"
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0, 80, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "Keybind"
		textLabel.TextColor3 = tbl.TextPrimary
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.ArialBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextYAlignment = Enum.TextYAlignment.Center
		textLabel.Parent = v9
		local frame3 = Instance.new("Frame")
		frame3.Size = UDim2.new(0, 60, 0, 24)
		frame3.Position = UDim2.new(1, -148, 0.5, 0)
		frame3.AnchorPoint = Vector2.new(1, 0.5)
		frame3.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		frame3.BackgroundTransparency = 0.1
		frame3.BorderSizePixel = 0
		frame3.Parent = v9
		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(0, 6)
		uiCorner3.Parent = frame3
		local uiStroke3 = Instance.new("UIStroke")
		uiStroke3.Color = tbl.StrokeOff
		uiStroke3.Thickness = 1
		uiStroke3.Transparency = 0.3
		uiStroke3.Parent = frame3
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, 0, 1, 0)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "None"
		textLabel2.TextColor3 = tbl.TextSecond
		textLabel2.TextSize = 11
		textLabel2.Font = Enum.Font.ArialBold
		textLabel2.TextXAlignment = Enum.TextXAlignment.Center
		textLabel2.TextYAlignment = Enum.TextYAlignment.Center
		textLabel2.Parent = frame3
		local textButton3 = Instance.new("TextButton")
		textButton3.Size = UDim2.new(0, 80, 0, 26)
		textButton3.Position = UDim2.new(1, -10, 0.5, 0)
		textButton3.AnchorPoint = Vector2.new(1, 0.5)
		textButton3.BackgroundColor3 = tbl.Accent
		textButton3.BackgroundTransparency = 0.15
		textButton3.BorderSizePixel = 0
		textButton3.Text = "Attach"
		textButton3.TextColor3 = tbl.White
		textButton3.TextSize = 12
		textButton3.Font = Enum.Font.ArialBold
		textButton3.AutoButtonColor = false
		textButton3.Parent = v9
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 6)
		uiCorner4.Parent = textButton3
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = tbl.AccentBright
		uiStroke4.Thickness = 1
		uiStroke4.Transparency = 0.3
		uiStroke4.Parent = textButton3
		local flag9 = false
		local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad)

		local function fn18()
			flag9 = false
			textButton3.Text = "Attach"
			TweenService:Create(textButton3, tweenInfo, { BackgroundColor3 = tbl.Accent, BackgroundTransparency = 0.15 }):Play()
			textButton3.TextColor3 = tbl.White
			v10.Color = tbl.StrokeOff
			v10.Transparency = 0.4
			uiStroke3.Color = tbl.StrokeOff
		end

		local function fn19()
			flag9 = true
			textButton3.Text = "Press key..."
			TweenService:Create(textButton3, tweenInfo, { BackgroundColor3 = Color3.fromRGB(180, 15, 25), BackgroundTransparency = 0 }):Play()
			textButton3.TextColor3 = tbl.White
			v10.Color = tbl.Accent
			v10.Transparency = 0.1
			uiStroke3.Color = tbl.Accent
		end

		textButton3.MouseEnter:Connect(function()
			if not flag9 then
				TweenService:Create(textButton3, tweenInfo, { BackgroundColor3 = tbl.AccentBright, BackgroundTransparency = 0 }):Play()
			end
		end)

		textButton3.MouseLeave:Connect(function()
			if not flag9 then
				TweenService:Create(textButton3, tweenInfo, { BackgroundColor3 = tbl.Accent, BackgroundTransparency = 0.15 }):Play()
			end
		end)

		textButton3.MouseButton1Click:Connect(function()
			sound:Play()

			if flag9 then
				str = nil
				fn18()
				return
			end

			fn19()
			arg3()

			task.spawn(function()
				local n5 = 0

				while str and n5 < 6 do
					task.wait(0.1)
					n5 += 0.1
				end

				if flag9 then
					fn18()
				end

				str = nil
			end)
		end)

		return textLabel2, fn18
	end

	local player = tbl2.Player
	tbl4.Divider(player, "Walk Speed", 1)

	tbl4.Toggle(player, "Walk Speed Enabled", "Auto-enforced every frame", false, function(arg)
		flag4 = arg

		if arg then
			fn13()
		else
			fn14()
		end
	end, 2)

	tbl4.Slider(player, "Walk Speed", "Default: 16 stud/s", 16, 200, 30, " stud/s", function(arg)
		walkSpeed = arg
	end, 3)

	tbl4.Divider(player, "", 4)
	tbl4.Divider(player, "Jump Power", 5)

	tbl4.Toggle(player, "Jump Power Enabled", "Auto-enforced every frame", false, function(arg)
		flag5 = arg

		if arg then
			fn15()
		else
			fn16()
		end
	end, 6)

	tbl4.Slider(player, "Jump Power", "Default: 50", 10, 500, 100, " pow", function(arg)
		jumpPower = arg
	end, 7)

	tbl4.Divider(player, "", 8)
	tbl4.Divider(player, "NoClip", 9)

	tbl4.Toggle(player, "NoClip Enabled", "Walk through walls", false, function(arg)
		flag6 = arg

		if arg then
			fn4()
		else
			fn5()
		end

		if comboBtnRefs and comboBtnRefs.Noclip then
			comboBtnRefs.Noclip.lbl.Text = arg and "NoClip\nON" or "NoClip\nOFF"
		end
	end, 10)

	tbl4.Toggle(player, "Load NoClip Button", "Loads button on screen", false, function(arg)
		if fn2 then
			fn2(arg)
		end
	end, 11)

	v5, v6 = fn10(player, 12, function()
		str = "noclip"
	end)

	tbl4.Divider(player, "", 13)

	tbl4.Toggle(player, "Infinite Jump Enabled", "Jump from mid-air", false, function(arg)
		flag7 = arg

		if arg then
			fn6()
		else
			fn7()
		end
	end, 14)

	tbl4.Divider(player, "Fly", 15)

	tbl4.Toggle(player, "Fly Enabled", "WASD · Space to rise · LCtrl to descend", false, function(arg)
		flag8 = arg

		if arg then
			fn8()
		else
			fn9()
		end

		if comboBtnRefs and comboBtnRefs.Fly then
			comboBtnRefs.Fly.lbl.Text = arg and "Fly\nON" or "Fly\nOFF"
		end
	end, 16)

	tbl4.Slider(player, "Fly Speed", "Speed while flying", 10, 300, 80, " stud/s", function(arg)
		n4 = arg
	end, 17)

	tbl4.Toggle(player, "Load Fly Button", "Loads button on screen", false, function(arg)
		if fn3 then
			fn3(arg)
		end
	end, 18)

	v7, v8 = fn10(player, 19, function()
		str = "fly"
	end)

	tbl4.Divider(player, "Camera", 20)

	tbl4.Toggle(player, "FOV Enabled", "Override camera field of view", false, function(arg)
		flag3 = arg
		workspace.CurrentCamera.FieldOfView = arg and n3 or 70
	end, 21)

	tbl4.Slider(player, "Field of View", "Default: 70°", 30, 120, 100, "°", function(fieldOfView)
		n3 = fieldOfView

		if flag3 then
			workspace.CurrentCamera.FieldOfView = fieldOfView
		end
	end, 22)
end

local visual
visual = tbl2.Visual
local tbl7

tbl7 = {
	{ name = "Red Crosshair", id = "5341007131" },
	{ name = "Red Crosshair 2", id = "118814636385112" },
	{ name = "Red Dot", id = "11770691141" },
	{ name = "Blue Dot", id = "10891594349" },
	{ name = "Sanrio Crosshair", id = "11720475063" },
	{ name = "Triple T", id = "104359094015436" },
	{ name = "Hollow Circle", id = "98322941706613" },
	{ name = "Angel Triple T", id = "128878142732909" },
	{ name = "Naruto Thingy 2", id = "11770890197" },
	{ name = "Heart Pink Glow", id = "11767039725" },
	{ name = "White Crosshair", id = "17200988910" },
	{ name = "White Wings", id = "12902947168" },
	{ name = "Purple Crosshair", id = "9214055123" },
	{ name = "Purple Crosshair 2", id = "13318660422" },
	{ name = "Heart Crosshair 2", id = "13318885193" },
	{ name = "Purple Dabi", id = "101366086866631" },
	{ name = "Arrow Crosshair", id = "83387422212665" },
	{ name = "Arrows 2", id = "76324162026923" },
	{ name = "Pixel Heart", id = "10878218308" },
	{ name = "White Cross IDK", id = "10831379335" },
	{ name = "White Dot Line", id = "8375241602" },
}

local flag9, n5, n6, str2, fn11, fn12, fn13

do
	local flag10 = false
	flag9 = false
	n5 = 1
	n6 = 30
	str2 = "5341007131"
	local imageLabel2 = nil
	local connection2 = nil
	local v5 = nil

	fn11 = function()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if flag9 then
			connection2 = RunService.RenderStepped:Connect(function()
				if imageLabel2 and imageLabel2.Parent and imageLabel2.Visible then
					imageLabel2.Rotation = imageLabel2.Rotation + 4 * n5
				end

				if _G.RuzSavedDecals then
					for _, ruzSavedDecal in ipairs(_G.RuzSavedDecals) do
						if ruzSavedDecal.obj and ruzSavedDecal.obj.Parent then
							pcall(function()
								ruzSavedDecal.obj.Rotation = (ruzSavedDecal.obj.Rotation + 4 * n5) % 360
							end)
						end
					end
				end
			end)
		else
			if imageLabel2 then
				imageLabel2.Rotation = 0
			end

			if _G.RuzSavedDecals then
				for _, ruzSavedDecal in ipairs(_G.RuzSavedDecals) do
					if ruzSavedDecal.obj and ruzSavedDecal.obj.Parent then
						pcall(function()
							ruzSavedDecal.obj.Rotation = 0
						end)
					end
				end
			end
		end
	end

	local function fn14()
		local ruzCrosshairDisplay = game.CoreGui:FindFirstChild("RuzCrosshairDisplay")

		if ruzCrosshairDisplay then
			ruzCrosshairDisplay:Destroy()
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local screenGui3 = Instance.new("ScreenGui", game.CoreGui)
		screenGui3.Name = "RuzCrosshairDisplay"
		screenGui3.ResetOnSpawn = false
		screenGui3.DisplayOrder = 25
		screenGui3.IgnoreGuiInset = true
		v5 = screenGui3
		imageLabel2 = Instance.new("ImageLabel", screenGui3)
		imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageLabel2.Size = UDim2.new(0, n6, 0, n6)
		imageLabel2.BackgroundTransparency = 1
		imageLabel2.Image = "rbxassetid://" .. str2
		imageLabel2.ZIndex = 10
		imageLabel2.Visible = false
		imageLabel2.Rotation = 0

		local function fn15()
			local tbl8 = {}

			local function fn16(arg)
				if not arg then
					return
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if (descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")) and (descendant.Name:lower():find("crosshair") or descendant.Name:lower():find("cursor") or descendant.Name:lower():find("reticle")) then
						table.insert(tbl8, descendant)
					end
				end
			end

			local playerGui = localPlayer:FindFirstChild("PlayerGui")

			if playerGui then
				fn16(playerGui)
			end

			fn16(game.CoreGui)
			return tbl8
		end

		local ruzSavedDecals = {}

		local function ruzApplyCrosshair()
			for _, ruzSavedDecal in ipairs(ruzSavedDecals) do
				if ruzSavedDecal.obj and ruzSavedDecal.obj.Parent then
					pcall(function()
						ruzSavedDecal.obj.Image = ruzSavedDecal.origImage

						if ruzSavedDecal.origSize then
							ruzSavedDecal.obj.Size = ruzSavedDecal.origSize
						end

						ruzSavedDecal.obj.Rotation = 0
					end)
				end
			end

			ruzSavedDecals = {}
			_G.RuzSavedDecals = nil
			if not flag10 then
				return
			end
			local v6 = fn15()
			if #v6 == 0 then
				imageLabel2.Visible = true
				return
			end
			imageLabel2.Visible = false

			for _, v7 in ipairs(v6) do
				table.insert(ruzSavedDecals, { obj = v7, origImage = v7.Image, origSize = v7.Size })

				pcall(function()
					v7.Image = "rbxassetid://" .. str2
					v7.Size = UDim2.new(0, n6, 0, n6)
				end)
			end

			_G.RuzSavedDecals = ruzSavedDecals
		end

		RunService.RenderStepped:Connect(function()
			if not flag10 then
				return
			end

			if imageLabel2 and imageLabel2.Parent and imageLabel2.Visible then
				imageLabel2.Visible = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
			end
		end)

		_G.RuzApplyCrosshair = ruzApplyCrosshair
		fn11()
	end

	fn12 = function()
		if imageLabel2 and imageLabel2.Parent then
			imageLabel2.Image = "rbxassetid://" .. str2
		end

		if _G.RuzApplyCrosshair then
			_G.RuzApplyCrosshair()
		end
	end

	fn13 = function()
		if imageLabel2 and imageLabel2.Parent then
			imageLabel2.Size = UDim2.new(0, n6, 0, n6)
		end

		if _G.RuzSavedDecals then
			for _, ruzSavedDecal in ipairs(_G.RuzSavedDecals) do
				if ruzSavedDecal.obj and ruzSavedDecal.obj.Parent then
					pcall(function()
						ruzSavedDecal.obj.Size = UDim2.new(0, n6, 0, n6)
					end)
				end
			end
		end
	end

	tbl4.Divider(visual, "Crosshair", 1)

	tbl4.Toggle(visual, "Custom Crosshair", "Replace default cursor (ShiftLock required)", false, function(arg)
		flag10 = arg

		if arg then
			fn14()

			if _G.RuzApplyCrosshair then
				_G.RuzApplyCrosshair()
			end
		else
			if _G.RuzApplyCrosshair then
				_G.RuzApplyCrosshair()
			end

			local ruzCrosshairDisplay = game.CoreGui:FindFirstChild("RuzCrosshairDisplay")

			if ruzCrosshairDisplay then
				ruzCrosshairDisplay:Destroy()
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			imageLabel2 = nil
			UserInputService.MouseIconEnabled = true
		end
	end, 2)
end

local textButton3, imageLabel2

do
	local v5 = fn(visual, 46, 3)
	v5.Name = "CrosshairStyleRow"
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(0, 140, 0, 18)
	textLabel.Position = UDim2.new(0, 12, 0.5, 0)
	textLabel.AnchorPoint = Vector2.new(0, 0.5)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Select Crosshair"
	textLabel.TextColor3 = tbl.TextPrimary
	textLabel.TextSize = 13
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = v5
	textButton3 = Instance.new("TextButton")
	textButton3.Size = UDim2.new(0, 32, 0, 26)
	textButton3.Position = UDim2.new(0, 160, 0.5, 0)
	textButton3.AnchorPoint = Vector2.new(0, 0.5)
	textButton3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textButton3.BackgroundTransparency = 0.1
	textButton3.BorderSizePixel = 0
	textButton3.Text = ""
	textButton3.Parent = v5
	local uiCorner3 = Instance.new("UICorner")
	uiCorner3.CornerRadius = UDim.new(0, 6)
	uiCorner3.Parent = textButton3
	local uiStroke3 = Instance.new("UIStroke")
	uiStroke3.Color = tbl.StrokeOff
	uiStroke3.Thickness = 1
	uiStroke3.Transparency = 0.2
	uiStroke3.Parent = textButton3
	local imageLabel3 = Instance.new("ImageLabel")
	imageLabel3.Size = UDim2.new(0, 20, 0, 20)
	imageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel3.BackgroundTransparency = 1
	imageLabel3.ScaleType = Enum.ScaleType.Fit
	imageLabel3.Image = "rbxassetid://71046418862578"
	imageLabel3.ImageColor3 = tbl.Accent
	imageLabel3.Parent = textButton3
	local frame3 = Instance.new("Frame")
	frame3.Size = UDim2.new(0, 26, 0, 26)
	frame3.Position = UDim2.new(0, 202, 0.5, 0)
	frame3.AnchorPoint = Vector2.new(0, 0.5)
	frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame3.BackgroundTransparency = 0.3
	frame3.BorderSizePixel = 0
	frame3.ClipsDescendants = true
	frame3.Parent = v5
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = frame3
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.StrokeOff
	uiStroke4.Thickness = 1
	uiStroke4.Transparency = 0.3
	uiStroke4.Parent = frame3
	imageLabel2 = Instance.new("ImageLabel")
	imageLabel2.Size = UDim2.new(1, -4, 1, -4)
	imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel2.BackgroundTransparency = 1
	imageLabel2.ScaleType = Enum.ScaleType.Fit
	imageLabel2.Image = "rbxassetid://" .. str2
	imageLabel2.Parent = frame3
end

local flag10
flag10 = false
local n7
n7 = math.min(#tbl7, 6) * 30 + 34
local frame3
frame3 = Instance.new("Frame")
frame3.Name = "CrosshairList"
frame3.Size = UDim2.new(0, 220, 0, n7)
frame3.BackgroundColor3 = Color3.fromRGB(16, 16, 16)
frame3.BackgroundTransparency = 0.04
frame3.BorderSizePixel = 0
frame3.Visible = false
frame3.ZIndex = 60
frame3.Parent = screenGui
local uiCorner3 = Instance.new("UICorner")
uiCorner3.CornerRadius = UDim.new(0, 8)
uiCorner3.Parent = frame3
local uiStroke3 = Instance.new("UIStroke")
uiStroke3.Color = tbl.Stroke
uiStroke3.Thickness = 1.2
uiStroke3.Transparency = 0.2
uiStroke3.Parent = frame3

do
	local frame4 = Instance.new("Frame")
	frame4.Size = UDim2.new(1, 0, 0, 28)
	frame4.BackgroundTransparency = 1
	frame4.ZIndex = 61
	frame4.Parent = frame3
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -32, 1, 0)
	textLabel.Position = UDim2.new(0, 8, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Select Crosshair"
	textLabel.TextColor3 = tbl.Accent
	textLabel.TextSize = 10
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.ZIndex = 61
	textLabel.Parent = frame4
	local textButton4 = Instance.new("TextButton")
	textButton4.Size = UDim2.new(0, 28, 0, 28)
	textButton4.Position = UDim2.new(1, -8, 0.5, 0)
	textButton4.AnchorPoint = Vector2.new(1, 0.5)
	textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
	textButton4.BackgroundTransparency = 0.3
	textButton4.BorderSizePixel = 0
	textButton4.Text = ""
	textButton4.ZIndex = 62
	textButton4.Parent = frame4
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = textButton4
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.AccentBright
	uiStroke4.Thickness = 1.2
	uiStroke4.Transparency = 0.3
	uiStroke4.Parent = textButton4
	local imageLabel3 = Instance.new("ImageLabel")
	imageLabel3.Size = UDim2.new(0, 16, 0, 16)
	imageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
	imageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel3.BackgroundTransparency = 1
	imageLabel3.ScaleType = Enum.ScaleType.Fit
	imageLabel3.Image = "rbxassetid://116396312853810"
	imageLabel3.ImageColor3 = tbl.White
	imageLabel3.ZIndex = 63
	imageLabel3.Parent = textButton4

	textButton4.MouseEnter:Connect(function()
		textButton4.BackgroundColor3 = Color3.fromRGB(220, 20, 35)
		textButton4.BackgroundTransparency = 0.1
	end)

	textButton4.MouseLeave:Connect(function()
		textButton4.BackgroundColor3 = Color3.fromRGB(180, 15, 25)
		textButton4.BackgroundTransparency = 0.3
	end)

	local frame5 = Instance.new("Frame")
	frame5.Size = UDim2.new(1, -8, 0, 1)
	frame5.Position = UDim2.new(0.5, 0, 0, 28)
	frame5.AnchorPoint = Vector2.new(0.5, 0)
	frame5.BackgroundColor3 = tbl.Stroke
	frame5.BackgroundTransparency = 0.6
	frame5.BorderSizePixel = 0
	frame5.ZIndex = 61
	frame5.Parent = frame3
	local scrollingFrame = Instance.new("ScrollingFrame")
	scrollingFrame.Size = UDim2.new(1, 0, 1, -30)
	scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
	scrollingFrame.BackgroundTransparency = 1
	scrollingFrame.BorderSizePixel = 0
	scrollingFrame.ScrollBarThickness = 2
	scrollingFrame.ScrollBarImageColor3 = tbl.Accent
	scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
	scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	scrollingFrame.ZIndex = 61
	scrollingFrame.Parent = frame3
	local uiListLayout = Instance.new("UIListLayout")
	uiListLayout.Padding = UDim.new(0, 2)
	uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	uiListLayout.Parent = scrollingFrame
	local uiPadding = Instance.new("UIPadding")
	uiPadding.PaddingLeft = UDim.new(0, 4)
	uiPadding.PaddingRight = UDim.new(0, 4)
	uiPadding.PaddingTop = UDim.new(0, 3)
	uiPadding.Parent = scrollingFrame
	local tbl8 = {}

	for i, v5 in ipairs(tbl7) do
		local flag11 = v5.id == str2
		local textButton5 = Instance.new("TextButton")
		textButton5.Size = UDim2.new(1, 0, 0, 28)
		textButton5.BackgroundColor3 = flag11 and tbl.Accent or Color3.fromRGB(30, 30, 30)
		textButton5.BackgroundTransparency = flag11 and 0.3 or 0.65
		textButton5.BorderSizePixel = 0
		textButton5.Text = ""
		textButton5.ZIndex = 62
		textButton5.LayoutOrder = i
		textButton5.Parent = scrollingFrame
		local uiCorner5 = Instance.new("UICorner")
		uiCorner5.CornerRadius = UDim.new(0, 5)
		uiCorner5.Parent = textButton5
		local imageLabel4 = Instance.new("ImageLabel")
		imageLabel4.Size = UDim2.new(0, 20, 0, 20)
		imageLabel4.Position = UDim2.new(0, 6, 0.5, 0)
		imageLabel4.AnchorPoint = Vector2.new(0, 0.5)
		imageLabel4.BackgroundTransparency = 1
		imageLabel4.ScaleType = Enum.ScaleType.Fit
		imageLabel4.Image = "rbxassetid://" .. v5.id
		imageLabel4.ZIndex = 63
		imageLabel4.Parent = textButton5
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(1, -32, 1, 0)
		textLabel2.Position = UDim2.new(0, 30, 0, 0)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = v5.name
		textLabel2.TextColor3 = flag11 and tbl.White or tbl.TextSecond
		textLabel2.TextSize = 11
		textLabel2.Font = Enum.Font.ArialBold
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel2.ZIndex = 63
		textLabel2.Parent = textButton5
		table.insert(tbl8, { btn = textButton5, data = v5 })

		textButton5.MouseEnter:Connect(function()
			if v5.id ~= str2 then
				textButton5.BackgroundTransparency = 0.4
				textLabel2.TextColor3 = tbl.TextPrimary
			end
		end)

		textButton5.MouseLeave:Connect(function()
			if v5.id ~= str2 then
				textButton5.BackgroundTransparency = 0.65
				textLabel2.TextColor3 = tbl.TextSecond
			end
		end)

		textButton5.MouseButton1Click:Connect(function()
			sound:Play()
			str2 = v5.id
			imageLabel2.Image = "rbxassetid://" .. v5.id
			fn12()

			for _, v6 in ipairs(tbl8) do
				v6.btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				v6.btn.BackgroundTransparency = 0.65
				local textLabel3 = v6.btn:FindFirstChildWhichIsA("TextLabel")

				if textLabel3 then
					textLabel3.TextColor3 = tbl.TextSecond
				end
			end

			textButton5.BackgroundColor3 = tbl.Accent
			textButton5.BackgroundTransparency = 0.3
			textLabel2.TextColor3 = tbl.White
			closeChList()
		end)
	end

	local frame6 = Instance.new("Frame")
	frame6.Size = UDim2.new(0, 220, 0, 1)
	frame6.BackgroundTransparency = 1
	frame6.ZIndex = 0
	frame6.Parent = screenGui

	local function fn14()
		flag10 = false
		TweenService:Create(frame3, TweenInfo.new(0.14), { Size = UDim2.new(0, 220, 0, 0) }):Play()
		task.wait(0.15)
		frame3.Visible = false
	end

	local function fn15()
		local absolutePosition = textButton3.AbsolutePosition
		local n8 = absolutePosition.Y + textButton3.AbsoluteSize.Y + 4

		if n8 + n7 > workspace.CurrentCamera.ViewportSize.Y then
			n8 = absolutePosition.Y - n7 - 4
		end

		frame3.Position = UDim2.new(0, absolutePosition.X - 100, 0, n8)
		frame3.Size = UDim2.new(0, 220, 0, 0)
		frame3.Visible = true
		flag10 = true
		TweenService:Create(frame3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 220, 0, n7) }):Play()
	end

	textButton4.MouseButton1Click:Connect(function()
		sound:Play()

		if flag10 then
			fn14()
		end
	end)

	textButton3.MouseButton1Click:Connect(function()
		sound:Play()

		if flag10 then
			fn14()
		else
			fn15()
		end
	end)
end

tbl4.Slider(visual, "Crosshair Size", "Default: 30px", 10, 150, 30, " px", function(arg)
	n6 = arg
	fn13()
end, 4)

tbl4.Toggle(visual, "Crosshair Spin", "Rotate crosshair continuously", false, function(arg)
	flag9 = arg
	fn11()
end, 5)

do
	local v5 = fn(visual, 38, 6)
	v5.Name = "SpinSpeedRow"
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(0.5, 0, 0, 18)
	textLabel.Position = UDim2.new(0, 12, 0, 10)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Spin Speed"
	textLabel.TextColor3 = tbl.TextPrimary
	textLabel.TextSize = 13
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = v5
	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(0, 60, 0, 26)
	textBox.Position = UDim2.new(1, -10, 0.5, 0)
	textBox.AnchorPoint = Vector2.new(1, 0.5)
	textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textBox.BackgroundTransparency = 0.1
	textBox.BorderSizePixel = 0
	textBox.Text = "1.0"
	textBox.TextColor3 = tbl.TextPrimary
	textBox.TextSize = 12
	textBox.Font = Enum.Font.ArialBold
	textBox.TextXAlignment = Enum.TextXAlignment.Center
	textBox.Parent = v5
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = textBox
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.StrokeOff
	uiStroke4.Thickness = 1
	uiStroke4.Transparency = 0.2
	uiStroke4.Parent = textBox

	textBox.FocusLost:Connect(function()
		local num = tonumber(textBox.Text)

		if num and num > 0 then
			n5 = num
			textBox.Text = tostring(num)
			fn11()
		else
			textBox.Text = tostring(n5)
		end
	end)
end

do
	local v5 = fn(visual, 38, 7)
	v5.Name = "CustomIDRow"
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(0.45, 0, 0, 18)
	textLabel.Position = UDim2.new(0, 12, 0, 10)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Custom Texture ID"
	textLabel.TextColor3 = tbl.TextPrimary
	textLabel.TextSize = 12
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = v5
	local frame4 = Instance.new("Frame")
	frame4.Size = UDim2.new(0, 170, 0, 26)
	frame4.Position = UDim2.new(1, -10, 0.5, 0)
	frame4.AnchorPoint = Vector2.new(1, 0.5)
	frame4.BackgroundTransparency = 1
	frame4.Parent = v5
	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(1, -46, 1, 0)
	textBox.Position = UDim2.new(0, 0, 0, 0)
	textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textBox.BackgroundTransparency = 0.1
	textBox.BorderSizePixel = 0
	textBox.PlaceholderText = "Enter ID..."
	textBox.Text = ""
	textBox.TextColor3 = tbl.TextPrimary
	textBox.TextSize = 11
	textBox.Font = Enum.Font.Arial
	textBox.TextXAlignment = Enum.TextXAlignment.Center
	textBox.Parent = frame4
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = textBox
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.StrokeOff
	uiStroke4.Thickness = 1
	uiStroke4.Transparency = 0.2
	uiStroke4.Parent = textBox
	local textButton4 = Instance.new("TextButton")
	textButton4.Size = UDim2.new(0, 40, 1, 0)
	textButton4.Position = UDim2.new(1, 0, 0, 0)
	textButton4.AnchorPoint = Vector2.new(1, 0)
	textButton4.BackgroundColor3 = tbl.Accent
	textButton4.BackgroundTransparency = 0.1
	textButton4.BorderSizePixel = 0
	textButton4.Text = "Apply"
	textButton4.TextColor3 = tbl.White
	textButton4.TextSize = 10
	textButton4.Font = Enum.Font.ArialBold
	textButton4.Parent = frame4
	local uiCorner5 = Instance.new("UICorner")
	uiCorner5.CornerRadius = UDim.new(0, 6)
	uiCorner5.Parent = textButton4
	local uiStroke5 = Instance.new("UIStroke")
	uiStroke5.Color = tbl.AccentBright
	uiStroke5.Thickness = 1
	uiStroke5.Transparency = 0.3
	uiStroke5.Parent = textButton4

	textButton4.MouseButton1Click:Connect(function()
		sound:Play()
		local match = textBox.Text:match("%d+")

		if match then
			str2 = match
			imageLabel2.Image = "rbxassetid://" .. match
			fn12()
			textBox.Text = ""
		end
	end)
end

tbl4.Divider(visual, "Custom Skybox", 8)

do
	local flag11 = false
	local str3 = "10318000595"
	local v5 = nil

	local tbl8 = {
		["Red Skybox"] = "10318000595",
		["Black Breath"] = "129826851998944",
		Skything = "90246620946502",
		["SON goku"] = "76338167951386",
		["pink 1"] = "95000769820905",
		["pink 2"] = "79734717339224",
		Aurora = "11915636055",
		["white blue aura men"] = "18899181786",
		Green = "5036205687",
		Creepy = "6986847642",
		["midnight blue"] = "109118817560710",
		["purple sky"] = "136428068532091",
		["purple sky 2"] = "10206626164",
		["yellow peak"] = "5694322014",
		["turkiye peak"] = "12373010210",
	}

	local function fn14(arg)
		local Lighting = game:GetService("Lighting")

		if v5 then
			pcall(function()
				v5:Destroy()
			end)

			v5 = nil
		end

		for _, v6 in Lighting:GetChildren() do
			if v6:IsA("Sky") then
				pcall(function()
					v6:Destroy()
				end)
			end
		end

		local ok, result = pcall(function()
			local sky = Instance.new("Sky")
			local skyboxBk = "rbxassetid://" .. tostring(arg)
			sky.SkyboxBk = skyboxBk
			sky.SkyboxDn = skyboxBk
			sky.SkyboxFt = skyboxBk
			sky.SkyboxLf = skyboxBk
			sky.SkyboxRt = skyboxBk
			sky.SkyboxUp = skyboxBk
			sky.SkyboxOrientation = Vector3.zero
			sky.Parent = Lighting
			return sky
		end)

		if ok then
			v5 = result
		end
	end

	local function fn15()
		local Lighting = game:GetService("Lighting")

		if v5 then
			pcall(function()
				v5:Destroy()
			end)

			v5 = nil
		end

		for _, v6 in Lighting:GetChildren() do
			if v6:IsA("Sky") then
				pcall(function()
					v6:Destroy()
				end)
			end
		end
	end

	tbl4.Toggle(visual, "Custom Skybox", "", false, function(arg)
		flag11 = arg

		if arg then
			fn14(str3)
		else
			fn15()
		end
	end, 9)

	tbl4.Dropdown(visual, "Select Skybox", "", {
		"Red Skybox",
		"Black Breath",
		"Skything",
		"SON goku",
		"pink 1",
		"pink 2",
		"Aurora",
		"white blue aura men",
		"Green",
		"Creepy",
		"midnight blue",
		"purple sky",
		"purple sky 2",
		"yellow peak",
		"turkiye peak",
	}, "Red Skybox", function(arg)
		str3 = tbl8[arg] or "10318000595"

		if flag11 then
			fn14(str3)
		end
	end, 10)
end

tbl4.Divider(visual, "VFX Aura", 11)

do
	local tbl8 = { "None" }
	local tbl9 = {}

	for _, v5 in ipairs({
		{ name = "Angel Wings", id = "rbxassetid://97658130917593" },
		{ name = "Starlight", id = "rbxassetid://134645216613107" },
		{ name = "Heavenly", id = "rbxassetid://139300897520961" },
		{ name = "Ribbon", id = "rbxassetid://132069507632161" },
		{ name = "Sakura", id = "rbxassetid://81755778619404" },
		{ name = "Wind", id = "rbxassetid://80694081850877" },
		{ name = "Flow", id = "rbxassetid://119913533725648" },
		{ name = "Star", id = "rbxassetid://73754563740680" },
	}) do
		table.insert(tbl8, v5.name)
		tbl9[v5.name] = v5.id
	end

	local flag11 = false
	local str3 = "None"
	local tbl10 = {}
	local tbl11 = {}
	local color = Color3.fromRGB(133, 220, 255)
	local connection2 = nil

	local function fn14(arg, color2)
		if not arg or not color2 then
			return
		end
		local colorSequence = ColorSequence.new(color2)

		local function fn15(arg2)
			if arg2:IsA("ParticleEmitter") or arg2:IsA("Beam") or arg2:IsA("Trail") then
				pcall(function()
					arg2.Color = colorSequence
				end)
			elseif arg2:IsA("PointLight") then
				pcall(function()
					arg2.Color = color2
				end)
			end
		end

		fn15(arg)

		for _, descendant in ipairs(arg:GetDescendants()) do
			fn15(descendant)
		end
	end

	local function fn15()
		for _, v5 in ipairs(tbl10) do
			if v5 and v5.Parent then
				pcall(function()
					v5:Destroy()
				end)
			end
		end

		table.clear(tbl10)

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end

	local fn16 = nil

	fn16 = function()
		fn15()
		if not flag11 or str3 == "None" then
			return
		end
		local v5 = tbl9[str3]
		if not v5 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local result = tbl11[str3]

		if not result then
			local ok

			ok, result = pcall(function()
				return game:GetObjects(v5)[1]
			end)

			if not (ok and result) then
				return
			end
			tbl11[str3] = result
		end

		local tbl12 = {}

		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("BasePart") then
				tbl12[child.Name] = child
			end
		end

		local clone = result:Clone()

		for _, child in ipairs(clone:GetChildren()) do
			local v6 = tbl12[child.Name]

			if v6 then
				for _, child2 in ipairs(child:GetChildren()) do
					local clone2 = child2:Clone()
					clone2.Name = "RuzAuraParticle"
					clone2.Parent = v6
					fn14(clone2, color)

					if clone2:IsA("ParticleEmitter") then
						clone2.Enabled = true
					end

					for _, descendant in ipairs(clone2:GetDescendants()) do
						if descendant:IsA("ParticleEmitter") then
							descendant.Enabled = true
						end
					end

					table.insert(tbl10, clone2)
				end
			end
		end

		clone:Destroy()

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		connection2 = localPlayer.CharacterAdded:Connect(function()
			task.delay(0.8, fn16)
		end)
	end

	tbl4.Toggle(visual, "Aura Enabled", "", false, function(arg)
		flag11 = arg

		if arg then
			fn16()
		else
			fn15()
		end
	end, 12)

	tbl4.Dropdown(visual, "Aura Type", "", tbl8, "None", function(arg)
		str3 = arg

		if flag11 then
			fn16()
		end
	end, 13)

	local color2 = Color3.fromRGB(133, 220, 255)

	tbl4.ColorPicker(visual, "Aura Color", "", color2, function(arg)
		color = arg

		for _, v5 in ipairs(tbl10) do
			if v5 and v5.Parent then
				fn14(v5, color)
			end
		end
	end, 14)

	tbl4.Button(visual, "Reset Aura Color", "", function()
		color = color2

		for _, v5 in ipairs(tbl10) do
			if v5 and v5.Parent then
				fn14(v5, color)
			end
		end
	end, 13)

	tbl4.Button(visual, "Refresh Aura", "", function()
		if flag11 then
			fn16()
		end
	end, 14)
end

tbl4.Divider(visual, "Gun Visuals", 15)

do
	local flag11 = false
	local color = Color3.fromRGB(255, 50, 50)
	local v5 = color
	local n8 = 1
	local str3 = "None"
	local flag12 = false
	local tbl8 = {}
	local str4 = "Workspace.Part.Beam"

	local function fn14(arg)
		local fullName = arg:GetFullName()
		return fullName == str4 or fullName:find("Workspace.Part.Beam", 1, true) ~= nil
	end

	local tbl9 = {}

	for _, v6 in ipairs({ { name = "None" }, { name = "Beam 1" }, { name = "Beam 2" }, { name = "Beam 3" } }) do
		table.insert(tbl9, v6.name)
	end

	local function fn15(arg, arg2)
		if arg2 == "None" then
			return
		end

		pcall(function()
			if arg2 == "Beam 1" then
				arg.Brightness = 15
				arg.LightEmission = 0.75
				arg.LightInfluence = 0
				arg.Segments = 8
				arg.Texture = "rbxassetid://10386316474"
				arg.TextureLength = 0.375
				arg.TextureMode = Enum.TextureMode.Stretch
				arg.TextureSpeed = 1.75
				arg.Width0 = 5
				arg.Width1 = 8
				arg.ZOffset = 0.10000000149011612
			elseif arg2 == "Beam 2" then
				arg.Brightness = 5
				arg.LightEmission = 0.34999999403953552
				arg.LightInfluence = 0
				arg.Segments = 8
				arg.Texture = "rbxassetid://10386355946"
				arg.TextureLength = 5
				arg.TextureMode = Enum.TextureMode.Stretch
				arg.TextureSpeed = 5.5
				arg.Width0 = 3.5
				arg.Width1 = 5
				arg.ZOffset = 0
			elseif arg2 == "Beam 3" then
				arg.Brightness = 5
				arg.LightEmission = 0.75
				arg.LightInfluence = 0
				arg.Segments = 8
				arg.Texture = "http://www.roblox.com/asset/?id=6474806246"
				arg.TextureLength = 0.5
				arg.TextureMode = Enum.TextureMode.Stretch
				arg.TextureSpeed = 5.5
				arg.Width0 = 2.5
				arg.Width1 = 5
				arg.ZOffset = 0
			end

			arg.Color = ColorSequence.new(v5)
			arg.Transparency = NumberSequence.new(0)
		end)
	end

	local function fn16()
		if not flag12 then
			return
		end

		for k in pairs(tbl8) do
			if k.Parent then
				fn15(k, str3)
			end
		end
	end

	local folder = Instance.new("Folder")
	folder.Name = "RuzBeamHits"
	folder.Parent = workspace

	local function fn17(position)
		if str3 == "None" then
			return
		end
		local part = Instance.new("Part")
		part.Size = Vector3.new(0.2, 0.2, 0.2)
		part.Position = position
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 1
		part.Parent = folder
		local sparkles = Instance.new("Sparkles")
		sparkles.SparkleColor = Color3.fromRGB(193, 49, 255)
		sparkles.Parent = part

		task.delay(0.6, function()
			if part.Parent then
				part:Destroy()
			end
		end)
	end

	local function fn18(arg)
		local v6 = nil
		local v7 = nil

		return (RunService.Heartbeat:Connect(function()
			if not arg or not arg.Parent then
				v7:Disconnect()
				return
			end
			local attachment1 = arg.Attachment1

			if attachment1 then
				local worldPosition = attachment1.WorldPosition

				if v6 and (worldPosition - v6).Magnitude > 0.5 then
					fn17(worldPosition)
				end

				v6 = worldPosition
			end
		end))
	end

	local function fn19(arg)
		pcall(function()
			arg.Width0 = math.max(0.05, n8 * 0.3)
			arg.Width1 = math.max(0.05, n8 * 0.3)
		end)
	end

	local function fn20(arg)
		local v6 = tbl8[arg]
		if not v6 then
			return
		end

		for _, connection2 in ipairs(v6.connections) do
			pcall(function()
				connection2:Disconnect()
			end)
		end

		if arg.Parent then
			pcall(function()
				arg.Color = v6.origColor
			end)

			pcall(function()
				arg.Transparency = v6.origTrans
			end)

			pcall(function()
				arg.Width0 = v6.origW0
			end)

			pcall(function()
				arg.Width1 = v6.origW1
			end)
		end

		tbl8[arg] = nil
	end

	local function fn21(arg)
		if tbl8[arg] then
			return
		end

		if not flag11 then
			return
		end

		if not fn14(arg) then
			return
		end
		local color2 = arg.Color
		local transparency = arg.Transparency
		local width0 = arg.Width0
		local width1 = arg.Width1

		if str3 ~= "None" then
			fn15(arg, str3)
		else
			pcall(function()
				arg.Color = ColorSequence.new(v5)
			end)

			pcall(function()
				arg.Transparency = NumberSequence.new(0)
			end)

			fn19(arg)
		end

		local tbl10 = {}

		if str3 ~= "None" then
			local v6 = fn18(arg)

			if v6 then
				table.insert(tbl10, v6)
			end
		end

		if str3 == "None" then
			tbl10[#tbl10 + 1] = arg:GetPropertyChangedSignal("Color"):Connect(function()
				if not flag11 or not tbl8[arg] then
					return
				end
				local colorSequence = ColorSequence.new(v5)

				if arg.Color ~= colorSequence then
					pcall(function()
						arg.Color = colorSequence
					end)
				end
			end)

			tbl10[#tbl10 + 1] = arg:GetPropertyChangedSignal("Width0"):Connect(function()
				if not flag11 or not tbl8[arg] then
					return
				end
				local width02 = math.max(0.05, n8 * 0.3)

				if arg.Width0 ~= width02 then
					pcall(function()
						arg.Width0 = width02
					end)
				end
			end)

			tbl10[#tbl10 + 1] = arg:GetPropertyChangedSignal("Width1"):Connect(function()
				if not flag11 or not tbl8[arg] then
					return
				end
				local width12 = math.max(0.05, n8 * 0.3)

				if arg.Width1 ~= width12 then
					pcall(function()
						arg.Width1 = width12
					end)
				end
			end)
		end

		tbl10[#tbl10 + 1] = arg.AncestryChanged:Connect(function(child, parent)
			if parent == nil then
				task.delay(0.15, function()
					fn20(arg)
				end)
			end
		end)

		tbl8[arg] = { origColor = color2, origTrans = transparency, origW0 = width0, origW1 = width1, connections = tbl10 }
	end

	local connection2 = nil

	local function fn22()
		if connection2 then
			return
		end

		connection2 = workspace.DescendantAdded:Connect(function(descendant)
			if descendant:IsA("Beam") then
				task.defer(function()
					if descendant.Parent and flag11 then
						fn21(descendant)
					end
				end)
			end
		end)

		for _, descendant in ipairs(workspace:GetDescendants()) do
			if descendant:IsA("Beam") then
				fn21(descendant)
			end
		end
	end

	local function fn23()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		for k in pairs(tbl8) do
			fn20(k)
		end

		for _, child in ipairs(folder:GetChildren()) do
			child:Destroy()
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		task.delay(0.8, function()
			if flag11 then
				fn16()
			end
		end)
	end)

	tbl4.Toggle(visual, "Beam Color Changer", "", false, function(arg)
		flag11 = arg

		if arg then
			fn22()
			fn16()
		else
			fn23()
		end
	end, 16)

	tbl4.ColorPicker(visual, "Beam Color", "", color, function(arg)
		v5 = arg

		for k in pairs(tbl8) do
			if k.Parent then
				pcall(function()
					k.Color = ColorSequence.new(v5)
				end)
			end
		end
	end, 17)

	tbl4.Toggle(visual, "Beam VFX", "", false, function(arg)
		flag12 = arg

		if arg then
			fn16()
		else
			str3 = "None"

			for k in pairs(tbl8) do
				if k.Parent then
					pcall(function()
						k.Color = ColorSequence.new(v5)
					end)

					pcall(function()
						k.Transparency = NumberSequence.new(0)
					end)

					fn19(k)
				end
			end
		end
	end, 20)

	tbl4.Button(visual, "Reset Beam Color", "", function()
		v5 = color

		for k in pairs(tbl8) do
			if k.Parent then
				pcall(function()
					k.Color = ColorSequence.new(v5)
				end)
			end
		end
	end, 18)

	tbl4.Slider(visual, "Beam Width", "", 1, 20, 10, "x", function(arg)
		n8 = arg / 10

		for k in pairs(tbl8) do
			if k.Parent then
				fn19(k)
			end
		end
	end, 19)

	tbl4.Dropdown(visual, "Beam VFX Preset", "", tbl9, "None", function(arg)
		str3 = arg

		if flag12 then
			fn16()
		end
	end, 21)
end

tbl4.Divider(visual, "Knife Visuals", 22)

do
	local flag11 = false
	local clone = nil
	local connection2 = nil
	local v5 = nil
	local tbl8 = {}

	local function fn14()
		if clone then
			clone:Destroy()
			clone = nil
		end

		local character = localPlayer.Character

		if character then
			local fakeDual = character:FindFirstChild("FakeDual")

			if fakeDual then
				fakeDual:Destroy()
			end
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end

	local function fn15()
		fn14()

		for _, v6 in ipairs(tbl8) do
			pcall(function()
				v6:Disconnect()
			end)
		end

		tbl8 = {}
		v5 = nil
	end

	local function fn16(arg)
		if not arg or v5 == arg then
			return
		end
		fn15()
		v5 = arg
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local animator = character:WaitForChild("Humanoid"):WaitForChild("Animator")
		local leftHand = character:WaitForChild("LeftHand")
		local leftUpperArm = character:WaitForChild("LeftUpperArm")
		local leftLowerArm = character:WaitForChild("LeftLowerArm")
		local leftShoulder = leftUpperArm:WaitForChild("LeftShoulder")
		local leftElbow = leftLowerArm:WaitForChild("LeftElbow")
		local leftWrist = leftHand:WaitForChild("LeftWrist")
		local cframe = CFrame.new(-4.94883466e-07, 0.0162158459, -0.0139809521, 1, 0, 0, 0, 0.173686132, -0.984801054, 0, 0.984801054, 0.173686132)
		local cframe2 = CFrame.new(0, -0.0664157271, -0.0117114801, 1, 0, 0, 0, 0.980836987, -0.194830135, 0, 0.194830135, 0.980836987)
		local cframe3 = CFrame.new(0, 0, 0, 1, 9.61123533e-06, -6.41587258e-06, -9.61123533e-06, 1, -2.76937699e-05, 6.41587258e-06, 2.76937699e-05, 1)
		local animation = Instance.new("Animation")
		animation.AnimationId = "rbxassetid://2467577524"
		local animation2 = Instance.new("Animation")
		animation2.AnimationId = "rbxassetid://2470501967"
		local v6 = animator:LoadAnimation(animation)
		local v7 = animator:LoadAnimation(animation2)

		local connection3 = animator.AnimationPlayed:Connect(function(arg2)
			if arg.Parent ~= character then
				return
			end
			local animationId = arg2.Animation.AnimationId

			if animationId == "rbxassetid://115592970007001" or animationId == "rbxassetid://2467567750" then
				arg2:Stop(0)
				v6:Play(0.1, 2, 1)
			elseif animationId == "rbxassetid://109717378649651" or animationId == "rbxassetid://1957890538" then
				arg2:Stop(0)
				v7:Play(0.1, 2, 1)
			end
		end)

		table.insert(tbl8, connection3)

		local function fn17()
			fn14()
			local handle = arg:FindFirstChild("Handle")
			if not handle then
				return
			end
			clone = handle:Clone()
			clone.Name = "FakeDual"
			clone.Massless = true
			clone.CanCollide = false

			for _, child in ipairs(clone:GetChildren()) do
				if child:IsA("LuaSourceContainer") or child:IsA("Sound") or child:IsA("TouchTransmitter") then
					child:Destroy()
				end
			end

			clone.LocalTransparencyModifier = 0

			clone:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
				clone.LocalTransparencyModifier = 0
			end)

			clone.Parent = character
			local weld = Instance.new("Weld")
			weld.Name = "DualGripWeld"
			weld.Part0 = leftHand
			weld.Part1 = clone
			local leftGripAttachment = leftHand:FindFirstChild("LeftGripAttachment")

			if leftGripAttachment then
				weld.C0 = leftGripAttachment.CFrame
				weld.C1 = arg.Grip * CFrame.Angles(0, 0, 0)
			else
				weld.C0 = CFrame.new(0, -0.15, 0)
				weld.C1 = arg.Grip
			end

			weld.Parent = clone
			local n8 = 0.5
			local n9 = 3.5
			local n10 = 0
			local n11 = 0.5
			local transform = cframe
			local transform2 = cframe2
			local transform3 = cframe3
			local flag12 = false

			connection2 = RunService.Stepped:Connect(function(time)
				if not arg or arg.Parent ~= character then
					fn14()
					return
				end

				if v6.IsPlaying or v7.IsPlaying then
					n11 = 0
					n10 = 0
					flag12 = false
					transform = leftShoulder.Transform
					transform2 = leftElbow.Transform
					transform3 = leftWrist.Transform
				else
					n11 += time

					if n11 < n8 then
						leftShoulder.Transform = transform
						leftElbow.Transform = transform2
						leftWrist.Transform = transform3
						n10 = 0
						flag12 = true
					elseif flag12 then
						n10 += time
						local n12 = math.clamp(n10 / n9, 0, 1)
						local n13 = n12 * n12 * (3 - 2 * n12)
						leftShoulder.Transform = transform:Lerp(cframe, n13)
						leftElbow.Transform = transform2:Lerp(cframe2, n13)
						leftWrist.Transform = transform3:Lerp(cframe3, n13)

						if n13 >= 1 then
							flag12 = false
						end
					else
						leftShoulder.Transform = cframe
						leftElbow.Transform = cframe2
						leftWrist.Transform = cframe3
					end
				end
			end)
		end

		table.insert(tbl8, arg.Equipped:Connect(fn17))
		table.insert(tbl8, arg.Unequipped:Connect(fn14))

		table.insert(tbl8, arg.AncestryChanged:Connect(function(child, parent)
			if not parent then
				fn15()
			end
		end))

		if arg.Parent == character then
			fn17()
		end
	end

	local function fn17(arg)
		return arg and arg:IsA("Tool") and arg.Name == "Knife"
	end

	local function fn18()
		if not flag11 then
			return
		end
		local character = localPlayer.Character
		local backpack = localPlayer:FindFirstChild("Backpack")
		character = character and character:FindFirstChild("Knife")
		backpack = backpack and backpack:FindFirstChild("Knife")

		if fn17(character) then
			fn16(character)
		elseif fn17(backpack) then
			fn16(backpack)
		end
	end

	local function fn19(arg)
		if not arg then
			return
		end

		arg.ChildAdded:Connect(function(child)
			if flag11 and fn17(child) then
				fn16(child)
			end
		end)
	end

	local function fn20(arg)
		if not arg then
			return
		end

		arg.ChildAdded:Connect(function(child)
			if flag11 and fn17(child) then
				fn16(child)
			end
		end)
	end

	local backpack = localPlayer:WaitForChild("Backpack", 5)

	if backpack then
		fn19(backpack)
	end

	localPlayer.ChildAdded:Connect(function(child)
		if child.Name == "Backpack" then
			fn19(child)
		end
	end)

	if localPlayer.Character then
		fn20(localPlayer.Character)
	end

	localPlayer.CharacterAdded:Connect(function(character)
		fn15()
		fn20(character)
		task.wait(0.5)

		if flag11 then
			fn18()
		end
	end)

	tbl4.Toggle(visual, "Two-Handed Knife", "Hold knife with both hands — visual only", false, function(arg)
		flag11 = arg

		if arg then
			fn18()
		else
			fn15()
		end
	end, 23)
end

do
	local flag11 = false
	local clone = nil
	local connection2 = nil
	local v5 = nil
	local tbl8 = {}

	local function fn14()
		if clone then
			clone:Destroy()
			clone = nil
		end

		local character = localPlayer.Character

		if character then
			local fakeDualGun = character:FindFirstChild("FakeDualGun")

			if fakeDualGun then
				fakeDualGun:Destroy()
			end
		end

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end

	local function fn15()
		fn14()

		for _, v6 in ipairs(tbl8) do
			pcall(function()
				v6:Disconnect()
			end)
		end

		tbl8 = {}
		v5 = nil
	end

	local function fn16(arg)
		if not arg or v5 == arg then
			return
		end
		fn15()
		v5 = arg
		local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
		local leftHand = character:WaitForChild("LeftHand", 5)
		local leftUpperArm = character:WaitForChild("LeftUpperArm", 5)
		local leftLowerArm = character:WaitForChild("LeftLowerArm", 5)
		if not leftHand or not leftUpperArm or not leftLowerArm then
			return
		end
		local leftShoulder = leftUpperArm:WaitForChild("LeftShoulder", 5)
		local leftElbow = leftLowerArm:WaitForChild("LeftElbow", 5)
		local leftWrist = leftHand:WaitForChild("LeftWrist", 5)
		if not leftShoulder or not leftElbow or not leftWrist then
			return
		end
		local cframe = CFrame.new(0, 0.01, -0.01, 1, 0, 0, 0, 0.2, -0.98, 0, 0.98, 0.2)
		local cframe2 = CFrame.new(0, -0.06, -0.01, 1, 0, 0, 0, 0.97, -0.22, 0, 0.22, 0.97)
		local cframe3 = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

		local function fn17()
			fn14()
			local handle = arg:FindFirstChild("Handle")
			if not handle then
				return
			end
			clone = handle:Clone()
			clone.Name = "FakeDualGun"
			clone.Massless = true
			clone.CanCollide = false

			for _, child in ipairs(clone:GetChildren()) do
				if child:IsA("LuaSourceContainer") or child:IsA("Sound") or child:IsA("TouchTransmitter") then
					child:Destroy()
				end
			end

			clone.Parent = character
			local weld = Instance.new("Weld")
			weld.Name = "DualGunWeld"
			weld.Part0 = leftHand
			weld.Part1 = clone
			local leftGripAttachment = leftHand:FindFirstChild("LeftGripAttachment")

			if leftGripAttachment then
				weld.C0 = leftGripAttachment.CFrame
				weld.C1 = arg.Grip
			else
				weld.C0 = CFrame.new(0, -0.15, 0)
				weld.C1 = arg.Grip
			end

			weld.Parent = clone

			connection2 = RunService.Stepped:Connect(function()
				if not flag11 or not arg or arg.Parent ~= character then
					fn14()
					return
				end

				pcall(function()
					leftShoulder.Transform = cframe
					leftElbow.Transform = cframe2
					leftWrist.Transform = cframe3
				end)
			end)
		end

		table.insert(tbl8, arg.Equipped:Connect(fn17))
		table.insert(tbl8, arg.Unequipped:Connect(fn14))

		if arg.Parent == character then
			fn17()
		end
	end

	local function fn17(arg)
		return arg and arg:IsA("Tool") and arg.Name == "Gun"
	end

	local function fn18()
		if not flag11 then
			return
		end
		local character = localPlayer.Character
		local backpack = localPlayer:FindFirstChild("Backpack")
		character = character and character:FindFirstChild("Gun")
		backpack = backpack and backpack:FindFirstChild("Gun")

		if fn17(character) then
			fn16(character)
		elseif fn17(backpack) then
			fn16(backpack)
		end
	end

	localPlayer.CharacterAdded:Connect(function(character)
		fn15()

		character.ChildAdded:Connect(function(child)
			if flag11 and fn17(child) then
				fn16(child)
			end
		end)

		task.wait(0.5)

		if flag11 then
			fn18()
		end
	end)

	if localPlayer.Character then
		localPlayer.Character.ChildAdded:Connect(function(child)
			if flag11 and fn17(child) then
				fn16(child)
			end
		end)
	end

	tbl4.Toggle(visual, "Two-Handed Gun", "Hold gun with both hands — visual only", false, function(arg)
		flag11 = arg

		if arg then
			fn18()
		else
			fn15()
		end
	end, 24)
end

do
	local tbl8 = {
		{ name = "None" },
		{ name = "Raygun", id = "rbxassetid://131340586597360" },
		{ name = "Magical", id = "rbxassetid://136881806991431" },
		{ name = "GingerScope", id = "rbxassetid://83408763987668" },
	}

	local flag11 = false
	local str3 = "None"
	local tbl9 = {}
	local tbl10 = {}
	local tbl11 = {}
	local v5 = nil
	local tbl12 = {}

	for _, v6 in ipairs(tbl8) do
		table.insert(tbl12, v6.name)
	end

	local function fn14(arg)
		for _, v6 in ipairs(tbl8) do
			if v6.name == arg then
				return v6.id
			end
		end

		return nil
	end

	local function fn15(arg)
		local str4 = arg.Name:lower()
		return str4:find("reload") or str4:find("reloading") or str4:find("mag") ~= nil
	end

	local function fn16(arg)
		if fn15(arg) then
			return false
		end
		local str4 = arg.Name:lower()
		local str5 = (arg.SoundId or ""):lower()

		for _, v6 in ipairs({ "shoot", "shot", "gunshot", "fire", "gun", "muzzle" }) do
			if str4:find(v6) or str5:find(v6) then
				return true
			end
		end

		return false
	end

	local function fn17()
		for k, v6 in pairs(tbl9) do
			if k and k.Parent then
				pcall(function()
					k.SoundId = v6.origId
					k.Volume = v6.origVolume
					k.PlaybackSpeed = v6.origPitch
				end)
			end
		end

		tbl9 = {}

		for k, v6 in pairs(tbl10) do
			if k and k.Parent then
				pcall(function()
					k.Volume = v6.origVolume
				end)
			end
		end

		tbl10 = {}

		for _, v6 in ipairs(tbl11) do
			pcall(function()
				v6:Disconnect()
			end)
		end

		tbl11 = {}
		v5 = nil
	end

	local function fn18(arg, soundId)
		if tbl9[arg] then
			return
		end
		tbl9[arg] = { origId = arg.SoundId, origVolume = arg.Volume, origPitch = arg.PlaybackSpeed }

		pcall(function()
			arg.SoundId = soundId
			arg.Volume = 1
			arg.PlaybackSpeed = 1
		end)
	end

	local function fn19(arg)
		if tbl10[arg] then
			return
		end
		tbl10[arg] = { origVolume = arg.Volume }

		pcall(function()
			arg.Volume = 0
		end)
	end

	local function fn20()
		local v6 = fn14(str3)

		for _, v7 in ipairs({ workspace, localPlayer.Character, localPlayer.PlayerGui, game:GetService("SoundService") }) do
			if v7 then
				for _, descendant in ipairs(v7:GetDescendants()) do
					if descendant:IsA("Sound") then
						if fn15(descendant) then
							fn19(descendant)
						elseif fn16(descendant) and v6 then
							fn18(descendant, v6)
						end
					end
				end
			end
		end
	end

	local function fn21()
		fn17()
		fn20()

		local connection2 = workspace.DescendantAdded:Connect(function(descendant)
			if not flag11 then
				return
			end

			if not descendant:IsA("Sound") then
				return
			end
			local v6 = fn14(str3)

			if fn15(descendant) then
				fn19(descendant)
			elseif fn16(descendant) and v6 then
				task.defer(function()
					fn18(descendant, v6)
				end)
			end
		end)

		table.insert(tbl11, connection2)
	end

	tbl4.Toggle(visual, "Custom Shoot Sound", "", false, function(arg)
		flag11 = arg

		if arg then
			if str3 ~= "None" then
				fn21()
			end
		else
			fn17()
		end
	end, 25)

	tbl4.Dropdown(visual, "Shoot Sound Preset", "", tbl12, "None", function(arg)
		str3 = arg

		if flag11 then
			fn17()
			task.wait(0.1)

			if arg ~= "None" then
				fn21()
			end
		end
	end, 26)
end

do
	local soundId = "rbxassetid://99050406637477"
	local flag11 = false
	local sound2 = nil
	local tbl8 = {}
	local connection2 = nil

	local function fn14()
		for _, v5 in ipairs(tbl8) do
			pcall(function()
				v5:Disconnect()
			end)
		end

		tbl8 = {}
	end

	local function fn15(arg)
		local connection3 = arg.Equipped:Connect(function()
			if sound2 and sound2.Parent then
				sound2:Play()
			end
		end)

		table.insert(tbl8, connection3)
	end

	local function fn16(arg)
		fn14()

		if sound2 then
			sound2:Destroy()
			sound2 = nil
		end

		if not flag11 then
			return
		end
		local humanoidRootPart = arg:WaitForChild("HumanoidRootPart", 5)
		if not humanoidRootPart then
			return
		end
		sound2 = Instance.new("Sound")
		sound2.SoundId = soundId
		sound2.Volume = 0.8
		sound2.RollOffMaxDistance = 60
		sound2.Parent = humanoidRootPart
		local backpack = localPlayer:FindFirstChild("Backpack")

		if backpack then
			for _, child in ipairs(backpack:GetChildren()) do
				if child:IsA("Tool") then
					fn15(child)
				end
			end

			local connection3 = backpack.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					fn15(child)
				end
			end)

			table.insert(tbl8, connection3)
		end

		local connection3 = arg.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				fn15(child)
			end
		end)

		table.insert(tbl8, connection3)
	end

	tbl4.Toggle(visual, "Old Gun Equip Sound", "Play classic equip sound on tool equip", false, function(arg)
		flag11 = arg

		if arg then
			if connection2 then
				connection2:Disconnect()
			end

			local character = localPlayer.Character

			if character then
				fn16(character)
			end

			connection2 = localPlayer.CharacterAdded:Connect(function(character2)
				task.wait(0.5)
				fn16(character2)
			end)
		else
			fn14()

			if sound2 then
				sound2:Destroy()
				sound2 = nil
			end

			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end
		end
	end, 27)
end

do
	local flag11 = false
	local connection2 = nil
	local connection3 = nil

	local function fn14(arg)
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		if not flag11 then
			return
		end
		local humanoid = arg:WaitForChild("Humanoid", 5)
		if not humanoid then
			return
		end
		local animator = humanoid:WaitForChild("Animator", 5)
		if not animator then
			return
		end

		connection2 = animator.AnimationPlayed:Connect(function(arg2)
			if not flag11 then
				return
			end

			if arg2.Priority == Enum.AnimationPriority.Action or arg2.Priority == Enum.AnimationPriority.Action4 or arg2.Priority == Enum.AnimationPriority.Action3 or arg2.Priority == Enum.AnimationPriority.Action2 then
				task.defer(function()
					if arg2 and arg2.IsPlaying then
						arg2:Stop(0)
					end
				end)
			end
		end)
	end

	tbl4.Toggle(visual, "No Reload Animation", "Block weapon reload/equip animations", false, function(arg)
		flag11 = arg

		if arg then
			if connection3 then
				connection3:Disconnect()
			end

			local character = localPlayer.Character

			if character then
				fn14(character)
			end

			connection3 = localPlayer.CharacterAdded:Connect(function(character2)
				task.wait(0.5)
				fn14(character2)
			end)
		else
			if connection2 then
				connection2:Disconnect()
				connection2 = nil
			end

			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end
		end
	end, 28)
end

tbl4.Divider(visual, "Environment", 30)

do
	local connection2 = nil
	local n8 = 0.65
	local fieldOfView = nil

	local function fn14(arg)
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local currentCamera = workspace.CurrentCamera

		if not fieldOfView then
			fieldOfView = currentCamera.FieldOfView
		end

		if math.abs(arg - 1) < 0.01 then
			currentCamera.FieldOfView = fieldOfView
			return
		end

		connection2 = RunService.RenderStepped:Connect(function()
			currentCamera.FieldOfView = math.clamp((fieldOfView or 70) * 1 / arg, 10, 120)
		end)
	end

	local function fn15()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		local currentCamera = workspace.CurrentCamera

		if fieldOfView then
			currentCamera.FieldOfView = fieldOfView
		end
	end

	tbl4.Toggle(visual, "Stretch Screen", "Squished widescreen look — adjust with slider below", false, function(arg)
		if arg then
			fieldOfView = workspace.CurrentCamera.FieldOfView
			fn14(n8)
		else
			fn15()
		end
	end, 33)

	tbl4.Slider(visual, "Stretch Amount", "65% = squished widescreen, 100% = normal", 50, 130, 65, "%", function(arg)
		n8 = arg / 100

		if connection2 then
			fn14(n8)
		end
	end, 34)
end

local ReplicatedStorage
ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players2
Players2 = game:GetService("Players")
local RunService2
RunService2 = game:GetService("RunService")
local localPlayer2, flag11, flag12, flag13, flag14, flag15, flag16, flag17, flag18, flag19

do
	local Workspace = game:GetService("Workspace")
	localPlayer2 = Players2.LocalPlayer
	flag11 = false
	flag12 = false
	flag13 = false
	flag14 = false
	flag15 = false
	flag16 = false
	flag17 = false
	flag18 = false
	flag19 = false
	local name = nil
	local name2 = nil
	local name3 = nil
	local connection2 = nil
	local color = Color3.fromRGB

	local tbl8 = {
		murderer = { Color3.fromRGB(220, 30, 30), color(80, 0, 0) },
		sheriff = { Color3.fromRGB(30, 80, 220), color(0, 0, 80) },
		hero = { Color3.fromRGB(255, 220, 0), color(120, 80, 0) },
		innocent = { Color3.fromRGB(30, 200, 30), color(0, 70, 0) },
		self = { Color3.fromRGB(220, 220, 220), color(80, 80, 80) },
	}

	local function fn14(arg, arg2, arg3, arg4)
		if arg then
			return tbl8.murderer
		end

		if arg2 then
			return tbl8.hero
		end

		if arg3 then
			return tbl8.sheriff
		end

		if arg4 then
			return tbl8.self
		end
		return tbl8.innocent
	end

	local function fn15(adornee)
		if not adornee:FindFirstChildWhichIsA("Humanoid") then
			return nil
		end
		local ruzHL = adornee:FindFirstChild("RuzHL")

		if not ruzHL then
			ruzHL = Instance.new("Highlight")
			ruzHL.Name = "RuzHL"
			ruzHL.Adornee = adornee
			ruzHL.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			ruzHL.FillTransparency = 0.5
			ruzHL.OutlineTransparency = 0
			ruzHL.Parent = adornee

			ruzHL.AncestryChanged:Connect(function()
				if not ruzHL.Parent then
					return
				end

				if not adornee.Parent then
					ruzHL:Destroy()
				end
			end)
		end

		return ruzHL
	end

	local function fn16(arg)
		local ruzHL = arg:FindFirstChild("RuzHL")

		if ruzHL then
			ruzHL:Destroy()
		end
	end

	local function fn17(arg, arg2)
		if arg:FindFirstChild("RuzCB") or localPlayer.PlayerGui:FindFirstChild("RuzCB_" .. arg.Name) then
			local ruzCB = arg:FindFirstChild("RuzCB") or localPlayer.PlayerGui:FindFirstChild("RuzCB_" .. arg.Name)

			for _, child in ipairs(ruzCB:GetChildren()) do
				for _, child2 in ipairs(child:GetChildren()) do
					if child2:IsA("Frame") then
						child2.BackgroundColor3 = arg2[1]
						local uiGradient = child2:FindFirstChildWhichIsA("UIGradient")

						if uiGradient then
							local new = ColorSequenceKeypoint.new
							local v5 = arg2[1]
							uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, arg2[2]), new(1, v5) })
						end
					end
				end
			end

			if ruzCB:IsA("BillboardGui") then
				local upperTorso = arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("HumanoidRootPart")

				if upperTorso and ruzCB.Adornee ~= upperTorso then
					ruzCB.Adornee = upperTorso
				end
			end

			return
		end

		local upperTorso = arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("HumanoidRootPart")
		if not upperTorso then
			return
		end
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Name = "RuzCB_" .. arg.Name
		billboardGui.Adornee = upperTorso
		billboardGui.Size = UDim2.new(6, 0, 9, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.Parent = localPlayer.PlayerGui

		arg.AncestryChanged:Connect(function(child, parent)
			if parent == nil then
				if billboardGui and billboardGui.Parent then
					billboardGui:Destroy()
				end
			end
		end)

		local function fn18(arg3, arg4, arg5, arg6)
			local frame4 = Instance.new("Frame", billboardGui)
			frame4.Size = UDim2.new(0.25, 0, 0.25, 0)
			frame4.AnchorPoint = Vector2.new(arg3, arg4)
			frame4.Position = UDim2.new(arg5, 0, arg6, 0)
			frame4.BackgroundTransparency = 1

			for _, v5 in pairs({ "vert", "horiz" }) do
				local frame5 = Instance.new("Frame", frame4)

				if v5 == "vert" then
					frame5.Size = UDim2.new(0.1, 0, 1, 0)
					frame5.Position = UDim2.new(arg3 == 0 and 0 or 0.9, 0, 0, 0)
				else
					frame5.Size = UDim2.new(1, 0, 0.1, 0)
					frame5.Position = UDim2.new(0, 0, arg4 == 0 and 0 or 0.9, 0)
				end

				frame5.BackgroundColor3 = arg2[1]
				local uiGradient = Instance.new("UIGradient", frame5)
				local new = ColorSequenceKeypoint.new
				local v6 = arg2[1]
				uiGradient.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, arg2[2]), new(1, v6) })
				uiGradient.Rotation = 45
			end
		end

		fn18(0, 0, 0, 0)
		fn18(1, 0, 1, 0)
		fn18(0, 1, 0, 1)
		fn18(1, 1, 1, 1)
	end

	local function fn18(arg)
		local ruzCB = arg:FindFirstChild("RuzCB")

		if ruzCB then
			ruzCB:Destroy()
		end

		local v5 = localPlayer.PlayerGui:FindFirstChild("RuzCB_" .. arg.Name)

		if v5 then
			v5:Destroy()
		end
	end

	local thickness = 2
	local transparency = 1

	local tbl9 = {
		{ "Head", "UpperTorso" },
		{ "UpperTorso", "LowerTorso" },
		{ "LowerTorso", "LeftUpperLeg" },
		{ "LeftUpperLeg", "LeftLowerLeg" },
		{ "LowerTorso", "RightUpperLeg" },
		{ "RightUpperLeg", "RightLowerLeg" },
		{ "UpperTorso", "LeftUpperArm" },
		{ "LeftUpperArm", "LeftLowerArm" },
		{ "LeftLowerArm", "LeftHand" },
		{ "UpperTorso", "RightUpperArm" },
		{ "RightUpperArm", "RightLowerArm" },
		{ "RightLowerArm", "RightHand" },
	}

	local tbl10 = {
		{ "Head", "Torso" },
		{ "Torso", "Left Arm" },
		{ "Torso", "Right Arm" },
		{ "Torso", "Left Leg" },
		{ "Torso", "Right Leg" },
	}

	local tbl11 = {}

	local function createLine()
		local line = Drawing.new("Line")
		line.Visible = false
		return line
	end

	local function fn19(arg)
		local v5 = tbl11[arg]
		if not v5 then
			return
		end

		for _, line in ipairs(v5.lines) do
			line.Visible = false
		end
	end

	local function fn20(arg)
		if tbl11[arg] then
			return
		end
		local humanoid = arg:FindFirstChild("Humanoid")
		if not humanoid then
			return
		end
		local flag20 = humanoid.RigType == Enum.HumanoidRigType.R6 and tbl10 or tbl9
		local tbl12 = {}

		for i = 1, #flag20 do
			tbl12[i] = createLine()
		end

		tbl11[arg] = {
			lines = tbl12,
			conn = arg.AncestryChanged:Connect(function(child, parent)
				if not parent then
					local v5 = tbl11[arg]

					if v5 then
						for _, line in ipairs(v5.lines) do
							line:Remove()
						end

						if v5.conn then
							v5.conn:Disconnect()
						end

						tbl11[arg] = nil
					end
				end
			end),
		}
	end

	local function fn21(arg)
		local v5 = tbl11[arg]
		if not v5 then
			return
		end

		for _, line in ipairs(v5.lines) do
			line:Remove()
		end

		if v5.conn then
			v5.conn:Disconnect()
		end

		tbl11[arg] = nil
	end

	local function fn22(arg, color2)
		local v5 = tbl11[arg]
		if not v5 then
			return
		end
		local humanoid = arg:FindFirstChild("Humanoid")
		if not humanoid then
			fn19(arg)
			return
		end
		local flag20 = humanoid.RigType == Enum.HumanoidRigType.R6 and tbl10 or tbl9
		local currentCamera = workspace.CurrentCamera

		for i, v6 in ipairs(flag20) do
			local v7 = arg:FindFirstChild(v6[1])
			local v8 = arg:FindFirstChild(v6[2])
			local v9 = v5.lines[i]

			if v9 then
				if v7 and v8 then
					local v10, v11 = currentCamera:WorldToViewportPoint(v7.Position)
					local v12, v13 = currentCamera:WorldToViewportPoint(v8.Position)
					v9.Color = color2
					v9.Thickness = thickness
					v9.Transparency = transparency

					if v11 and v13 then
						v9.From = Vector2.new(v10.X, v10.Y)
						v9.To = Vector2.new(v12.X, v12.Y)
						v9.Visible = true
					else
						v9.Visible = false
					end
				else
					v9.Visible = false
				end
			end
		end
	end

	local function fn23(arg)
		fn16(arg)
		fn18(arg)
		fn21(arg)
	end

	local function fn24()
		for _, player in pairs(Players2:GetPlayers()) do
			if player.Character then
				fn23(player.Character)
			end
		end

		for k in pairs(tbl11) do
			fn21(k)
		end
	end

	Players2.PlayerRemoving:Connect(function(player)
		if player.Character then
			fn23(player.Character)
		end
	end)

	for _, player in ipairs(Players2:GetPlayers()) do
		player.CharacterAdded:Connect(function()
			for k in pairs(tbl11) do
				if k.Parent == nil then
					fn21(k)
				end
			end

			if player.Character then
				fn23(player.Character)
			end
		end)
	end

	Players2.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function()
			for k in pairs(tbl11) do
				if k.Parent == nil then
					fn21(k)
				end
			end

			if flag11 then
				task.defer(function()
					updateESP()
				end)
			end
		end)
	end)

	local v5 = nil
	local v6 = nil
	local v7 = nil
	local color2 = Color3.fromRGB(255, 215, 0)

	local function fn25()
		if v7 then
			v7:Destroy()
			v7 = nil
		end
	end

	local function fn26(arg)
		fn25()
		local part = Instance.new("Part")
		part.Name = "RuzGunMarker"
		part.Size = Vector3.new(1.5, 0.15, 1.5)
		part.Anchored = true
		part.CanCollide = false
		part.CastShadow = false
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(50, 255, 80)
		part.Transparency = 0.25
		part.CFrame = CFrame.new(arg)
		part.Parent = Workspace

		task.spawn(function()
			while part and part.Parent do
				for i = 0, 1, 0.05 do
					if part and part.Parent then
						part.Transparency = 0.25 + 0.5 * math.sin(i * 3.1415926535897931)
						task.wait(0.03)
						continue
					end

					break
				end
			end
		end)

		v7 = part
	end

	local function fn27()
		if v5 then
			v5:Destroy()
			v5 = nil
		end

		if v6 then
			v6:Destroy()
			v6 = nil
		end

		fn25()
	end

	local function fn28(adornee)
		if not flag19 then
			return
		end

		if not adornee then
			return
		end
		fn27()

		if not adornee:IsA("BasePart") then
			adornee = adornee:FindFirstChild("Handle") or adornee:IsA("Model") and adornee.PrimaryPart or adornee:FindFirstChildWhichIsA("BasePart", true)
		end

		if not adornee then
			return
		end
		local highlight = Instance.new("Highlight")
		highlight.Adornee = adornee
		highlight.FillColor = color2
		highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
		highlight.FillTransparency = 0.35
		highlight.OutlineTransparency = 0
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Parent = adornee
		v5 = highlight
		fn26(adornee.Position + Vector3.new(0, 0.1, 0))
		local billboardGui = Instance.new("BillboardGui")
		billboardGui.Adornee = adornee
		billboardGui.Size = UDim2.new(0, 130, 0, 36)
		billboardGui.StudsOffset = Vector3.new(0, 4, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.MaxDistance = 300
		billboardGui.Parent = adornee
		local frame4 = Instance.new("Frame", billboardGui)
		frame4.Size = UDim2.new(1, 0, 1, 0)
		frame4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		frame4.BackgroundTransparency = 0.4
		frame4.BorderSizePixel = 0
		Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 6)
		local uiStroke4 = Instance.new("UIStroke", frame4)
		uiStroke4.Color = color2
		uiStroke4.Thickness = 1.5
		uiStroke4.Transparency = 0.1
		local textLabel = Instance.new("TextLabel", frame4)
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "DROPPED GUN"
		textLabel.TextColor3 = color2
		textLabel.Font = Enum.Font.GothamBlack
		textLabel.TextSize = 13
		textLabel.TextStrokeTransparency = 0.4
		textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		v6 = billboardGui
	end

	local function fn29()
		return Workspace:FindFirstChild("GunDrop", true)
	end

	local flag20 = false

	local function fn30(arg)
		if flag19 then
			fn28(arg)
		end

		if not flag20 then
			flag20 = true

			task.delay(5, function()
				flag20 = false
			end)
		end
	end

	local function fn31()
		fn27()
	end

	task.spawn(function()
		task.wait(1.5)
		local v8 = fn29()

		if v8 then
			fn30(v8)
		end
	end)

	task.spawn(function()
		while true do
			task.wait(0.5)

			if flag19 then
				local v8 = fn29()
				if v8 and not v5 then
					fn30(v8)
					continue
				end

				if not v8 and v5 then
					fn31()
				end
			end
		end
	end)

	local tbl12 = {}
	local n8 = 0
	local v8 = nil

	local function fn32()
		for _, v9 in ipairs({ "GetCurrentPlayerData", "GetPlayerData", "PlayerData", "GetRoles", "RoleData" }) do
			local v10 = ReplicatedStorage:FindFirstChild(v9, true)
			if v10 and (v10:IsA("RemoteFunction") or v10:IsA("RemoteEvent")) then
				return v10
			end
		end
	end

	local function fn33()
		if not v8 then
			v8 = fn32()
		end

		if not v8 then
			return
		end

		local ok, result = pcall(function()
			if v8:IsA("RemoteFunction") then
				return v8:InvokeServer()
			end
		end)

		if ok and type(result) == "table" then
			tbl12 = result
		end
	end

	local function fn34(arg)
		local v9 = tbl12[arg.Name]
		local str3 = "Innocent"

		if v9 then
			local str4 = tostring(v9.Role or v9.role or v9.Team or v9.RoleSelect or ""):lower()

			if str4:find("murd") or str4:find("killer") then
				str3 = "Murderer"
			elseif str4:find("sheriff") or str4:find("gun") then
				str3 = "Sheriff"
			elseif str4:find("hero") then
				str3 = "Hero"
			end
		end

		if str3 == "Innocent" then
			local attribute = arg:GetAttribute("Role") or arg:GetAttribute("RoleSelect") or arg:GetAttribute("Team")

			if attribute then
				local str4 = tostring(attribute):lower()

				if str4:find("murd") or str4:find("killer") then
					str3 = "Murderer"
				elseif str4:find("sheriff") then
					str3 = "Sheriff"
				elseif str4:find("hero") then
					str3 = "Hero"
				end
			end
		end

		if str3 == "Innocent" then
			local character = arg.Character

			if character then
				if character:FindFirstChild("Knife") or character:FindFirstChild("Blade") then
					str3 = "Murderer"
				elseif character:FindFirstChild("Gun") or character:FindFirstChild("Revolver") then
					str3 = "Sheriff"
				end
			end

			local backpack = arg:FindFirstChild("Backpack")

			if backpack then
				if backpack:FindFirstChild("Knife") or backpack:FindFirstChild("Blade") then
					str3 = "Murderer"
				end
			end
		end

		return str3
	end

	local function fn35()
		if tick() - n8 > 1 then
			fn33()
			n8 = tick()
			name = nil
			name2 = nil
			name3 = nil

			for _, player in pairs(Players2:GetPlayers()) do
				if player ~= localPlayer2 then
					local v9 = fn34(player)

					if v9 == "Murderer" then
						name = player.Name
					elseif v9 == "Sheriff" then
						name2 = player.Name
					elseif v9 == "Hero" then
						name3 = player.Name
					end
				end
			end
		end

		for _, player in pairs(Players2:GetPlayers()) do
			local character = player.Character

			if not character or not character:FindFirstChild("HumanoidRootPart") then
				fn19(character)
			else
				local humanoid = character:FindFirstChild("Humanoid")

				if not humanoid or humanoid.Health <= 0 then
					fn23(character)
				else
					local flag21 = player == localPlayer2
					local flag22 = player.Name == name
					local flag23 = player.Name == name3
					local flag24 = player.Name == name2

					if flag11 and (flag21 and flag15 or flag22 and flag12 or flag24 and flag13 or flag23 and flag13 or not flag22 and not flag23 and not flag24 and not flag21 and flag14) then
						local v9 = fn14(flag22, flag23, flag24, flag21)

						if flag18 then
							local v10 = fn15(character)

							if v10 then
								v10.FillColor = v9[1]
								v10.OutlineColor = v9[1]
							end
						else
							fn16(character)
						end

						if flag16 then
							fn17(character, v9)
						else
							fn18(character)
						end

						if flag17 then
							fn20(character)
							fn22(character, v9[1])
						else
							fn21(character)
						end
					else
						fn23(character)
					end
				end
			end
		end

		for k in pairs(tbl11) do
			if not k.Parent then
				fn21(k)
			end
		end
	end

	local function fn36()
		if connection2 then
			connection2:Disconnect()
		end

		local n9 = 0
		local n10 = 0.05

		connection2 = RunService2.Heartbeat:Connect(function(deltaTime)
			n9 += deltaTime
			if n9 < n10 then
				return
			end
			n9 = 0
			fn35()
		end)
	end

	local function fn37()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end

		fn24()
	end

	local esp = tbl2.ESP

	tbl4.Toggle(esp, "ESP Enabled", "Enables ESP — Murderer, Sheriff & Gun auto-ON", false, function(arg)
		flag11 = arg

		if arg then
			flag12 = true
			flag13 = true
			flag14 = true
			flag18 = true
			flag19 = true
			fn36()
			local v9 = fn29()

			if v9 then
				fn28(v9)
			end
		else
			fn37()
			fn27()
			flag19 = false
		end
	end, 1)

	tbl4.Divider(esp, "Roles", 2)

	tbl4.Toggle(esp, "Murderer ESP", "Red gradient — auto ON", true, function(arg)
		flag12 = arg
	end, 3)

	tbl4.Toggle(esp, "Sheriff ESP", "Blue/yellow — auto ON", true, function(arg)
		flag13 = arg
	end, 4)

	tbl4.Toggle(esp, "Innocent ESP", "Green highlight for innocents — auto ON", true, function(arg)
		flag14 = arg
	end, 5)

	tbl4.Toggle(esp, "Self ESP", "White highlight on yourself", false, function(arg)
		flag15 = arg
	end, 6)

	tbl4.Divider(esp, "Style", 7)

	tbl4.Toggle(esp, "Highlight", "Role-coloured body highlight — auto ON", true, function(arg)
		flag18 = arg

		if not arg then
			for _, player in pairs(Players2:GetPlayers()) do
				if player.Character then
					fn16(player.Character)
				end
			end
		end
	end, 8)

	tbl4.Toggle(esp, "Corner Box", "Gradient corner box around player", false, function(arg)
		flag16 = arg

		if not arg then
			for _, player in pairs(Players2:GetPlayers()) do
				if player.Character then
					fn18(player.Character)
				end
			end
		end
	end, 9)

	tbl4.Toggle(esp, "Skeleton", "Role-coloured skeleton lines", false, function(arg)
		flag17 = arg

		if not arg then
			for _, player in pairs(Players2:GetPlayers()) do
				if player.Character then
					fn21(player.Character)
				end
			end
		end
	end, 10)

	tbl4.Divider(esp, "Items", 11)

	tbl4.Toggle(esp, "Dropped Gun ESP", "Gold highlight + label on dropped gun — auto ON", true, function(arg)
		flag19 = arg

		if not arg then
			fn27()
		else
			local v9 = fn29()

			if v9 then
				fn28(v9)
			end
		end
	end, 12)
end

local Players3
Players3 = game:GetService("Players")
local localPlayer3, fn14, fn15, fn16, fn17, combat

do
	local UserInputService2 = game:GetService("UserInputService")
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	localPlayer3 = Players3.LocalPlayer
	local flag20 = false
	local str3 = "Normal"
	local flag21 = false
	local v5 = nil
	local v6 = nil
	local CurrentRoundClient = nil
	local tbl8 = {}
	local tbl9 = {}
	local n8 = 5

	local tbl10 = {
		Visible = false,
		Radius = 90,
		Thickness = 1,
		NumSides = 100,
		Filled = false,
		Color = Color3.fromRGB(255, 255, 255),
	}

	pcall(function()
		CurrentRoundClient = require(ReplicatedStorage2:WaitForChild("Modules"):WaitForChild("CurrentRoundClient", 10))
	end)

	local function fn18()
		task.wait(1)

		if CurrentRoundClient then
			local playerData = CurrentRoundClient.PlayerData
			v5 = nil
			v6 = nil

			if playerData and next(playerData) then
				for k, v7 in pairs(playerData) do
					if v7.Role then
						local v8 = Players3:FindFirstChild(k)

						if v8 then
							if v7.Role == "Murderer" then
								v5 = v8
							elseif v7.Role == "Sheriff" then
								v6 = v8
							end
						end
					end
				end
			end
		end
	end

	pcall(function()
		local gameplay = ReplicatedStorage2:WaitForChild("Remotes", 10):WaitForChild("Gameplay", 10)

		if gameplay then
			local roleSelect = gameplay:FindFirstChild("RoleSelect")
			local playerDataChanged = gameplay:FindFirstChild("PlayerDataChanged")

			if roleSelect then
				roleSelect.OnClientEvent:Connect(function()
					task.spawn(fn18)
				end)
			end

			if playerDataChanged then
				playerDataChanged.OnClientEvent:Connect(function()
					task.spawn(fn18)
				end)
			end
		end
	end)

	local function fn19()
		for _, player in ipairs(Players3:GetPlayers()) do
			local backpack = player:FindFirstChild("Backpack")
			if backpack and backpack:FindFirstChild("Knife") then
				return player
			end
		end

		for _, player in ipairs(Players3:GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("Knife") then
				return player
			end
		end

		return nil
	end

	local function fn20()
		for _, player in ipairs(Players3:GetPlayers()) do
			if player ~= localPlayer3 then
				local backpack = player:FindFirstChild("Backpack")
				if backpack and backpack:FindFirstChild("Gun") then
					return player
				end
			end
		end

		for _, player in ipairs(Players3:GetPlayers()) do
			if player ~= localPlayer3 and player.Character and player.Character:FindFirstChild("Gun") then
				return player
			end
		end

		return nil
	end

	local function fn21(arg)
		if not arg then
			return nil
		end
		local backpack = arg:FindFirstChild("Backpack")

		if backpack then
			if backpack:FindFirstChild("Knife") then
				return "Knife"
			end

			if backpack:FindFirstChild("Gun") then
				return "Gun"
			end
		end

		if arg.Character then
			if arg.Character:FindFirstChild("Knife") then
				return "Knife"
			end

			if arg.Character:FindFirstChild("Gun") then
				return "Gun"
			end
		end

		return nil
	end

	local function fn22()
		local tbl11 = {}

		for _, player in ipairs(Players3:GetPlayers()) do
			if player ~= localPlayer3 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local v7 = fn21(player)

				if v7 then
					table.insert(tbl11, { player = player, weapon = v7 })
				end
			end
		end

		if #tbl11 == 0 then
			return nil
		end
		local tbl12 = {}

		for _, v7 in ipairs(tbl11) do
			tbl12[v7.weapon] = true
		end

		local n9 = 0

		for k in pairs(tbl12) do
			n9 += 1
		end

		if n9 == 1 then
			local humanoidRootPart = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")
			local v7, v8, v9 = ipairs(tbl11)
			local huge = math.huge
			local player = nil

			for _, v10 in v7, v8, v9 do
				if humanoidRootPart then
					local magnitude = (humanoidRootPart.Position - v10.player.Character.HumanoidRootPart.Position).Magnitude

					if magnitude < huge then
						player = v10.player
						huge = magnitude
					end
				else
					player = player or v10.player
				end
			end

			return player
		end

		local currentCamera = workspace.CurrentCamera
		local viewportSize = currentCamera.ViewportSize
		local vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
		local v7, v8, v9 = ipairs(tbl11)
		local huge = math.huge
		local player = nil

		for _, v10 in v7, v8, v9 do
			local v11, v12 = currentCamera:WorldToViewportPoint(v10.player.Character.HumanoidRootPart.Position)

			if v12 then
				local magnitude = (vector2 - Vector2.new(v11.X, v11.Y)).Magnitude

				if magnitude < huge then
					player = v10.player
					huge = magnitude
				end
			end
		end

		return player or tbl11[1].player
	end

	fn14 = function(arg, arg2)
		local character = arg.Character

		if character then
			local upperTorso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
			local humanoid = character:FindFirstChild("Humanoid")
			if upperTorso and humanoid then
				return upperTorso.Position + upperTorso.AssemblyLinearVelocity * Vector3.new(0.75, 0.5, 0.75) * arg2 / 15 + humanoid.MoveDirection * arg2
			end
		end

		return Vector3.zero
	end

	local function fn23()
		if not localPlayer3.Character then
			return nil
		end
		local humanoidRootPart = localPlayer3.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end
		local huge = math.huge
		local v7 = nil

		for _, player in ipairs(Players3:GetPlayers()) do
			if player ~= localPlayer3 and player.Character then
				local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart2 then
					local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						v7 = player
					end
				end
			end
		end

		return v7
	end

	fn15 = function(arg)
		if not localPlayer3.Character then
			return
		end
		local gun = localPlayer3.Character:FindFirstChild("Gun")
		if not gun then
			return
		end
		local character = arg.Character
		if not character then
			return
		end

		if not character:FindFirstChild("HumanoidRootPart") then
			return
		end
		local v7 = fn14(arg, 2.8)
		local rightHand = localPlayer3.Character:FindFirstChild("RightHand")
		if not rightHand then
			return
		end
		local shoot = gun:FindFirstChild("Shoot")
		if not shoot then
			return
		end

		pcall(function()
			local cframe = CFrame.new
			shoot:FireServer(CFrame.new(rightHand.Position), cframe(v7))
		end)
	end

	local function fn24()
		local character = localPlayer3.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end

		if not (UserInputService2.MouseBehavior == Enum.MouseBehavior.LockCenter) then
			local cFrame = humanoidRootPart.CFrame
			local n9 = cFrame * CFrame.Angles(0, 3.1415926535897931, 0)

			for i = 1, 4 do
				humanoidRootPart.CFrame = cFrame:Lerp(n9, i / 4)
				game:GetService("RunService").RenderStepped:Wait()
			end
		else
			local cFrame = workspace.CurrentCamera.CFrame
			local lookVector = cFrame.LookVector
			local cframe = CFrame.lookAt(cFrame.Position, cFrame.Position + Vector3.new(-lookVector.X, lookVector.Y, -lookVector.Z))

			for i = 1, 5 do
				workspace.CurrentCamera.CFrame = cFrame:Lerp(cframe, i / 5)
				game:GetService("RunService").RenderStepped:Wait()
			end
		end
	end

	local function fn25(arg)
		if not localPlayer3.Character then
			return
		end
		local gun = localPlayer3.Character:FindFirstChild("Gun")
		if not gun then
			return
		end
		local character = arg.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local v7 = fn14(arg, 2.8)
		local shoot = gun:FindFirstChild("Shoot")
		if not shoot then
			return
		end

		pcall(function()
			local cframe = CFrame.new
			shoot:FireServer(CFrame.new(humanoidRootPart.Position), cframe(v7))
		end)
	end

	fn16 = function()
		if v5 and v5.Character and v5.Character:FindFirstChild("HumanoidRootPart") then
			return v5
		end

		if v6 and v6.Character and v6.Character:FindFirstChild("HumanoidRootPart") then
			return v6
		end
		local v7 = fn22()
		if v7 then
			return v7
		end
		local v8 = fn19()
		if v8 and v8 ~= localPlayer3 then
			return v8
		end
		local v9 = fn20()
		if v9 and v9 ~= localPlayer3 then
			return v9
		end
		return fn23()
	end

	local function fn26(arg)
		if not tbl10.Visible then
			return true
		end

		if not arg.Character then
			return false
		end
		local humanoidRootPart = arg.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return false
		end
		local currentCamera = workspace.CurrentCamera
		local v7, v8 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)
		if not v8 then
			return false
		end
		return (Vector2.new(currentCamera.ViewportSize.X / 2, currentCamera.ViewportSize.Y / 2) - Vector2.new(v7.X, v7.Y)).Magnitude <= tbl10.Radius
	end

	local function fn27()
		if not localPlayer3.Character then
			return
		end

		if not localPlayer3.Character:FindFirstChild("Gun") then
			return
		end
		local v7 = fn16()
		if not v7 or not fn26(v7) then
			return
		end

		if str3 == "Wallbang" then
			fn25(v7)
		elseif str3 == "Flick" then
			if flag21 then
				return
			end
			flag21 = true

			task.spawn(function()
				fn24()
				task.wait(0.12)
				fn15(v7)
				task.wait(0.88)
				flag21 = false
			end)
		else
			fn15(v7)
		end
	end

	fn17 = function()
		if not localPlayer3.Character then
			return
		end

		if not localPlayer3.Character:FindFirstChild("Gun") then
			local gun = localPlayer3.Backpack:FindFirstChild("Gun")

			if gun then
				local humanoid = localPlayer3.Character:FindFirstChild("Humanoid")

				if humanoid then
					humanoid:EquipTool(gun)
					task.wait(0.1)
				end
			end

			if not localPlayer3.Character:FindFirstChild("Gun") then
				return
			end
		end

		local v7 = fn16()
		if not v7 then
			return
		end

		if str3 == "Wallbang" then
			fn25(v7)
		elseif str3 == "Flick" then
			task.spawn(function()
				fn24()
				task.wait(0.12)
				fn15(v7)
			end)
		else
			fn15(v7)
		end
	end

	UserInputService2.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if not flag20 then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			fn27()
		elseif input.UserInputType == Enum.UserInputType.Touch then
			tbl8[input] = input.Position
			tbl9[input] = false
		end
	end)

	UserInputService2.InputChanged:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if not tbl8[input] then
			return
		end
		local n9 = input.Position - tbl8[input]

		if n8 <= math.abs(n9.X) + math.abs(n9.Y) then
			tbl9[input] = true
		end
	end)

	UserInputService2.InputEnded:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if not tbl8[input] then
			return
		end
		local v7 = tbl9[input]
		tbl8[input] = nil
		tbl9[input] = nil
		if not flag20 then
			return
		end

		if v7 then
			return
		end
		fn27()
	end)

	local v7 = nil

	if hookmetamethod and getnamecallmethod and checkcaller then
		pcall(function()
			v7 = hookmetamethod(game, "__namecall", function(arg, ...)
				local v8 = getnamecallmethod()
				if not flag20 or checkcaller() or v8 ~= "FireServer" or arg.Name ~= "Shoot" then
					return v7(arg, ...)
				end
				local v9 = fn16()
				if not v9 or not fn26(v9) then
					return v7(arg, ...)
				end
				local character = v9.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not character then
					return v7(arg, ...)
				end
				local v10 = fn14(v9, 2.8)
				local character2 = localPlayer3.Character
				character2 = character2 and character2:FindFirstChild("RightHand")
				if not character2 then
					return v7(arg, ...)
				end

				if str3 == "Wallbang" then
					return v7(arg, CFrame.new(character.Position), CFrame.new(v10))
				end

				if str3 == "Flick" then
					if flag21 then
						return
					end
					flag21 = true
					local v11 = arg

					task.delay(0, function()
						fn24()
						task.wait(0.1)

						pcall(function()
							local cframe = CFrame.new
							v7(v11, CFrame.new(character2.Position), cframe(v10))
						end)

						task.wait(0.9)
						flag21 = false
					end)

					return
				end

				local cframe = CFrame.new
				return v7(arg, CFrame.new(character2.Position), cframe(v10))
			end)
		end)
	end

	local circle = Drawing.new("Circle")
	circle.Visible = tbl10.Visible
	circle.Thickness = tbl10.Thickness
	circle.NumSides = tbl10.NumSides
	circle.Filled = tbl10.Filled
	circle.Color = tbl10.Color
	circle.Radius = tbl10.Radius

	RunService.RenderStepped:Connect(function()
		circle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
		circle.Radius = tbl10.Radius
		circle.Visible = tbl10.Visible
	end)

	combat = tbl2.Combat
	tbl4.Divider(combat, "Silent Aim", 1)

	tbl4.Toggle(combat, "Silent Aim Enabled", "Murderer › Sheriff › Nearest — predictive aim", false, function(arg)
		flag20 = arg
	end, 2)

	tbl4.Dropdown(combat, "Silent Aim Method", "", { "Normal", "Wallbang", "Flick" }, "Normal", function(arg)
		str3 = arg
	end, 3)

	tbl4.Toggle(combat, "FOV Visible", "FOV ring on screen — only targets inside FOV when enabled", false, function(visible)
		tbl10.Visible = visible
	end, 4)

	tbl4.ColorPicker(combat, "FOV Color", "Ring color", Color3.fromRGB(255, 255, 255), function(color)
		tbl10.Color = color
		circle.Color = color
	end, 5)

	tbl4.Slider(combat, "FOV Size", "Ring radius (px)", 30, 200, 90, "px", function(radius)
		tbl10.Radius = radius
	end, 6)
end

tbl4.Divider(combat, "Screen Buttons", 7)

do
	local function createScreenGui()
		local ruzHubComboBtns = game.CoreGui:FindFirstChild("RuzHub_ComboBtns")

		if ruzHubComboBtns then
			ruzHubComboBtns:Destroy()
		end

		local screenGui3 = Instance.new("ScreenGui", game.CoreGui)
		screenGui3.Name = "RuzHub_ComboBtns"
		screenGui3.ResetOnSpawn = false
		screenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui3.DisplayOrder = 99
		screenGui3.IgnoreGuiInset = true
		return screenGui3
	end

	local v5 = createScreenGui()
	local tbl8 = {}
	local tbl9 = {}
	local color = Color3.fromRGB(255, 0, 0)
	local color2 = Color3.fromRGB(20, 0, 0)

	RunService.RenderStepped:Connect(function()
		local rotation = tick() * 90 % 360

		for _, v6 in ipairs(tbl9) do
			if v6.strokeGrad and v6.strokeGrad.Parent then
				v6.strokeGrad.Rotation = rotation
			end
		end
	end)

	local sound2 = Instance.new("Sound")
	sound2.SoundId = "rbxassetid://86169980872189"
	sound2.Volume = 0.7
	sound2.Parent = game:GetService("SoundService")
	local n8 = 10

	local function fn18(arg, arg2)
		local v6 = nil
		local vector2 = nil
		local absolutePosition = nil
		local flag20 = false

		arg.InputBegan:Connect(function(input)
			if v6 then
				return
			end

			if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			v6 = input
			vector2 = Vector2.new(input.Position.X, input.Position.Y)
			absolutePosition = arg.AbsolutePosition
			flag20 = false
		end)

		UserInputService.InputChanged:Connect(function(input)
			if input ~= v6 then
				return
			end
			local n9 = Vector2.new(input.Position.X, input.Position.Y) - vector2
			if not flag20 and n9.Magnitude < n8 then
				return
			end
			flag20 = true
			local viewportSize = workspace.CurrentCamera.ViewportSize
			local absoluteSize = arg.AbsoluteSize
			local n10 = math.clamp(absolutePosition.X + n9.X, 0, viewportSize.X - absoluteSize.X)
			local n11 = math.clamp(absolutePosition.Y + n9.Y, 0, viewportSize.Y - absoluteSize.Y)
			arg.Position = UDim2.fromOffset(n10, n11)
		end)

		UserInputService.InputEnded:Connect(function(input)
			if input ~= v6 then
				return
			end
			local v7 = flag20
			v6 = nil
			vector2 = nil
			absolutePosition = nil
			flag20 = false

			if not v7 then
				sound2:Play()

				if arg2.onClick then
					arg2.onClick()
				end
			end
		end)
	end

	local function fn19(arg, position, size, text, arg2)
		if tbl8[arg] then
			tbl8[arg].btn:Destroy()
			tbl8[arg] = nil
		end

		local textButton4 = Instance.new("TextButton", v5)
		textButton4.Name = "RuzBtn_" .. arg
		textButton4.Size = size
		textButton4.Position = position
		textButton4.BackgroundColor3 = Color3.fromRGB(15, 5, 5)
		textButton4.BackgroundTransparency = 0.45
		textButton4.Text = ""
		textButton4.AutoButtonColor = false
		textButton4.BorderSizePixel = 0
		Instance.new("UICorner", textButton4).CornerRadius = UDim.new(0, 12)
		local uiStroke4 = Instance.new("UIStroke", textButton4)
		uiStroke4.Thickness = 2.5
		uiStroke4.Color = Color3.fromRGB(255, 255, 255)
		uiStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		local uiGradient = Instance.new("UIGradient", uiStroke4)
		local colorSequence = ColorSequence.new
		local tbl10 = {}
		local v6 = ColorSequenceKeypoint.new(0, color)
		local v7 = ColorSequenceKeypoint.new(0.5, color2)
		tbl10[1] = v6
		tbl10[2] = v7

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, color))
			table.move(values, 1, values.n, 3, tbl10)
		end

		uiGradient.Color = colorSequence(tbl10)
		local textLabel = Instance.new("TextLabel", textButton4)
		textLabel.Name = "Lbl"
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = text
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextSize = math.max(10, size.Y.Offset * 0.14)
		textLabel.TextYAlignment = Enum.TextYAlignment.Center
		textLabel.TextXAlignment = Enum.TextXAlignment.Center
		textLabel.TextStrokeTransparency = 0.5
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		local uiGradient2 = Instance.new("UIGradient", textLabel)
		local colorSequence2 = ColorSequence.new
		local tbl11 = {}
		local v8 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 30, 30))
		local v9 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 0, 0))
		tbl11[1] = v8
		tbl11[2] = v9

		do
			local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 0)))
			table.move(values, 1, values.n, 3, tbl11)
		end

		uiGradient2.Color = colorSequence2(tbl11)
		uiGradient2.Rotation = 90
		local tbl12 = { btn = textButton4, key = arg, stroke = uiStroke4, strokeGrad = uiGradient, lbl = textLabel, img = nil, onClick = arg2 }
		tbl8[arg] = tbl12
		table.insert(tbl9, tbl12)
		fn18(textButton4, tbl12)
		return tbl12
	end

	local function fn20(arg, arg2)
		local imageLabel3 = Instance.new("ImageLabel", arg.btn)
		imageLabel3.Name = "SpinImg"
		imageLabel3.Size = UDim2.new(0, 64, 0, 64)
		imageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel3.Position = UDim2.new(0.5, 0, 0.44, 0)
		imageLabel3.BackgroundTransparency = 1
		imageLabel3.Image = "rbxassetid://" .. tostring(arg2)
		imageLabel3.ScaleType = Enum.ScaleType.Fit
		imageLabel3.ImageColor3 = Color3.fromRGB(180, 0, 0)
		arg.img = imageLabel3
		arg.lbl.Size = UDim2.new(1, 0, 0, 20)
		arg.lbl.Position = UDim2.new(0, 0, 1, -20)
		arg.lbl.TextSize = 13
	end

	local flag20 = false

	local function fn21(arg, arg2)
		for _, v6 in ipairs(arg2) do
			local v7 = arg:FindFirstChild(v6)
			if v7 and v7:IsA("BasePart") then
				return v7
			end
		end

		return nil
	end

	local function fn22(arg)
		return arg:FindFirstChild("Torso") or arg:FindFirstChild("UpperTorso"), fn21(arg, { "RightUpperArm", "Right Arm", "RightArm", "UpperRightArm" }), fn21(arg, { "RightLowerArm", "Right Forearm", "RightForearm", "LowerRightArm" }), (fn21(arg, { "RightHand", "Right Hand", "HandR" }))
	end

	local function fn23(part0, part1, name)
		if not part0 or not part1 then
			return nil, nil
		end
		local v6 = nil

		for _, child in ipairs(part1:GetChildren()) do
			if child:IsA("Motor6D") and child.Part0 == part0 then
				v6 = child
				break
			else
				v6 = nil
			end
		end

		if not v6 then
			for _, child in ipairs(part0:GetChildren()) do
				if child:IsA("Motor6D") and child.Part1 == part1 then
					v6 = child
					break
				end
			end
		end

		local motor6D = Instance.new("Motor6D")
		motor6D.Name = name
		motor6D.Part0 = part0
		motor6D.Part1 = part1

		if v6 then
			motor6D.C0 = v6.C0
			motor6D.C1 = v6.C1
			v6.Enabled = false
		else
			motor6D.C0 = part0.CFrame:ToObjectSpace(part1.CFrame) * CFrame.new(0, part1.Size.Y / 2, 0)
			motor6D.C1 = CFrame.new(0, part1.Size.Y / 2, 0)
		end

		motor6D.Parent = part1
		return motor6D, v6
	end

	local function fn24(arg, arg2)
		if arg2 then
			arg2.Enabled = true
		end

		if arg then
			arg:Destroy()
		end
	end

	local function fn25(arg, arg2, arg3, arg4, arg5)
		if not arg then
			return
		end
		local n9 = CFrame.new(arg.C0.Position) * arg2
		TweenService:Create(arg, TweenInfo.new(arg3, arg4 or Enum.EasingStyle.Sine, arg5 or Enum.EasingDirection.Out), { C0 = n9 }):Play()
	end

	local function fn26()
		if flag20 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local v6, v7, v8, v9 = fn22(character)
		if not v6 or not v7 then
			return
		end
		flag20 = true
		local tempRightShoulder, v10 = fn23(v6, v7, "TempRightShoulder")
		local tempRightElbow = nil
		local v11 = nil
		local tempRightWrist = nil
		local v12 = nil

		if v8 then
			tempRightElbow, v11 = fn23(v7, v8, "TempRightElbow")
		end

		if v9 and v8 then
			tempRightWrist, v12 = fn23(v8, v9, "TempRightWrist")
		end

		local c0 = tempRightShoulder and tempRightShoulder.C0
		local c02 = tempRightElbow and tempRightElbow.C0
		local c03 = tempRightWrist and tempRightWrist.C0

		local function fn27()
			fn24(tempRightShoulder, v10)
			fn24(tempRightElbow, v11)
			fn24(tempRightWrist, v12)
			flag20 = false
		end

		local function fn28()
			local humanoid = character:FindFirstChildOfClass("Humanoid")

			if humanoid then
				local state = humanoid:GetState()
				if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
					fn27()
					return true
				end
			end

			return false
		end

		fn25(tempRightShoulder, CFrame.Angles(2.9670597283903604, 0.13962634015954636, -0.10471975511965978), 0.7)
		fn25(tempRightElbow, CFrame.Angles(-0.3490658503988659, 0, 0), 0.7)
		fn25(tempRightWrist, CFrame.Angles(0.17453292519943295, 0, 0), 0.7)
		task.wait(0.8)
		if fn28() then
			return
		end
		local quad = Enum.EasingStyle.Quad
		local in_ = Enum.EasingDirection.In
		fn25(tempRightShoulder, CFrame.Angles(0.52359877559829882, -0.10471975511965978, 0.069813170079773182), 0.4, quad, in_)
		local quad2 = Enum.EasingStyle.Quad
		local in_2 = Enum.EasingDirection.In
		fn25(tempRightElbow, CFrame.Angles(-0.087266462599716474, 0, 0), 0.4, quad2, in_2)
		local quad3 = Enum.EasingStyle.Quad
		local in_3 = Enum.EasingDirection.In
		fn25(tempRightWrist, CFrame.Angles(-0.43633231299858238, 0, 0), 0.36, quad3, in_3)
		task.wait(0.5)
		if fn28() then
			return
		end
		fn25(tempRightShoulder, CFrame.Angles(0.17453292519943295, -0.05235987755982989, 0), 0.36)
		fn25(tempRightElbow, CFrame.Angles(-0.17453292519943295, 0, 0), 0.36)
		task.wait(0.44)

		if tempRightShoulder then
			TweenService:Create(tempRightShoulder, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = c0 }):Play()
		end

		if tempRightElbow then
			TweenService:Create(tempRightElbow, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = c02 }):Play()
		end

		if tempRightWrist then
			TweenService:Create(tempRightWrist, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), { C0 = c03 }):Play()
		end

		task.wait(0.9)
		fn27()
	end

	RunService.Heartbeat:Connect(function()
		if not flag20 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return
		end
		local state = humanoid:GetState()

		if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
			flag20 = false
		end
	end)

	localPlayer.CharacterAdded:Connect(function()
		flag20 = false
	end)

	local n9 = 85
	local flag21 = true

	local function fn27()
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local knife = localPlayer.Backpack:FindFirstChild("Knife") or character:FindFirstChild("Knife")
		if not knife then
			return
		end

		if knife.Parent ~= character then
			character.Humanoid:EquipTool(knife)
			task.wait(0)
		end

		local character2 = currentTarget

		if not character2 then
			local huge = math.huge

			for _, player in ipairs(Players3:GetPlayers()) do
				if player ~= localPlayer and player.Character then
					local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

					if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
						local magnitude = (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude

						if magnitude < huge then
							character2 = player.Character
							huge = magnitude
						end
					end
				end
			end
		end

		if not character2 then
			return
		end
		local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart2 then
			return
		end
		local upperTorso = character2:FindFirstChild("UpperTorso") or character2:FindFirstChild("Torso") or humanoidRootPart2
		local assemblyLinearVelocity = humanoidRootPart2.AssemblyLinearVelocity
		local magnitude = (upperTorso.Position - humanoidRootPart.Position).Magnitude
		local n10 = 0

		if flag21 then
			local ok

			ok, n10 = pcall(function()
				return localPlayer:GetNetworkPing()
			end)

			n10 = ok and n10 or 0
		end

		local n11 = upperTorso.Position + assemblyLinearVelocity * (magnitude / n9 + n10 * 0.5)
		local n12 = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 1.5

		pcall(function()
			local cframe = CFrame.new
			knife:WaitForChild("Events"):WaitForChild("KnifeThrown"):FireServer(CFrame.new(n12, n11), cframe(n11))
		end)
	end

	local function fn28(arg)
		return arg.Backpack and arg.Backpack:FindFirstChild("Knife") or arg.Character and arg.Character:FindFirstChild("Knife")
	end

	local flag22 = false
	local flag23 = true
	local v6 = nil
	local connection2 = nil

	local function fn29()
		local currentCamera = workspace.CurrentCamera
		local viewportSize = currentCamera.ViewportSize
		local vector2 = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
		local huge = math.huge
		local v7 = nil

		for _, player in ipairs(Players3:GetPlayers()) do
			if player ~= localPlayer3 and player.Character then
				local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart and humanoid and humanoid.Health > 0 then
					local v8, v9 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

					if v9 then
						local magnitude = (Vector2.new(v8.X, v8.Y) - vector2).Magnitude

						if magnitude < huge then
							huge = magnitude
							v7 = player
						end
					end
				end
			end
		end

		return v7
	end

	local function fn30(arg)
		if not arg.Character then
			return nil
		end
		local humanoidRootPart = arg.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return nil
		end

		if not flag23 then
			return humanoidRootPart.Position
		end
		local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
		local humanoid = arg.Character:FindFirstChildOfClass("Humanoid")
		humanoid = humanoid and humanoid.MoveDirection or Vector3.zero
		local magnitude = (humanoidRootPart.Position - workspace.CurrentCamera.CFrame.Position).Magnitude

		local ok, result = pcall(function()
			return localPlayer3:GetNetworkPing()
		end)

		result = ok and result or 0
		return humanoidRootPart.Position + Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z) * (magnitude / 300 + result * 0.5) + humanoid * 1.2
	end

	local function fn31()
		if connection2 then
			connection2:Disconnect()
		end

		connection2 = RunService.RenderStepped:Connect(function()
			if not flag22 then
				return
			end

			if not v6 or not v6.Character or not v6.Character:FindFirstChild("HumanoidRootPart") then
				v6 = fn29()
			end

			if not v6 then
				return
			end
			local v7 = fn30(v6)
			if not v7 then
				return
			end
			local currentCamera = workspace.CurrentCamera
			currentCamera.CFrame = CFrame.lookAt(currentCamera.CFrame.Position, v7)
		end)
	end

	local function fn32()
		flag22 = false
		v6 = nil

		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end

	local flag24 = false

	local function fn33()
		if flag24 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		flag24 = true

		if not (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter) then
			local cFrame = humanoidRootPart.CFrame
			local n10 = cFrame * CFrame.Angles(0, 3.1415926535897931, 0)

			for i = 1, 4 do
				humanoidRootPart.CFrame = cFrame:Lerp(n10, i / 4)
				RunService.RenderStepped:Wait()
			end
		else
			local cFrame = workspace.CurrentCamera.CFrame
			local lookVector = cFrame.LookVector
			local cframe = CFrame.lookAt(cFrame.Position, cFrame.Position + Vector3.new(-lookVector.X, lookVector.Y, -lookVector.Z))

			for i = 1, 5 do
				workspace.CurrentCamera.CFrame = cFrame:Lerp(cframe, i / 5)
				RunService.RenderStepped:Wait()
			end
		end

		task.wait(0.15)
		flag24 = false
	end

	local function fn34(arg)
		if not localPlayer3.Character then
			return
		end
		local gun = localPlayer3.Character:FindFirstChild("Gun")

		if not gun then
			local gun2 = localPlayer3.Backpack:FindFirstChild("Gun")

			if gun2 then
				local humanoid = localPlayer3.Character:FindFirstChild("Humanoid")

				if humanoid then
					humanoid:EquipTool(gun2)
					task.wait(0.1)
				end

				gun = localPlayer3.Character:FindFirstChild("Gun")
			end

			if not gun then
				return
			end
		end

		local character = arg.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local v7 = fn14(arg, 2.8)
		local shoot = gun:FindFirstChild("Shoot")
		if not shoot then
			return
		end

		pcall(function()
			local cframe = CFrame.new
			shoot:FireServer(CFrame.new(humanoidRootPart.Position), cframe(v7))
		end)
	end

	local function fn35()
		fn33()
		task.wait(0.12)
		local v7 = fn16()

		if v7 then
			fn15(v7)
		end
	end

	local function fn36()
		if fn28(localPlayer) then
			task.spawn(fn26)
			fn27()
			return
		end

		if shootStyle == "Flick Shoot" then
			fn35()
		elseif shootStyle == "Wallbang" then
			local v7 = fn16()

			if v7 then
				fn34(v7)
			end
		else
			fn17()
		end
	end

	local udim2 = UDim2.new(0, 88, 0, 88)
	local udim22 = UDim2.new(0, 56, 0, 56)

	local function fn37(arg)
		if not arg then
			if tbl8.Shoot then
				tbl8.Shoot.btn:Destroy()
				tbl8.Shoot = nil
			end

			return
		end

		fn20(fn19("Shoot", UDim2.new(0.85, 0, 0.75, 0), udim2, "SHOOT", function()
			fn36()
		end), 139650104834071)
	end

	fn2 = function(arg)
		if not arg then
			if tbl8.Noclip then
				tbl8.Noclip.btn:Destroy()
				tbl8.Noclip = nil
			end

			return
		end

		fn19("Noclip", UDim2.new(0, 20, 0.5, -62), udim22, flag6 and "NoClip\nON" or "NoClip\nOFF", function()
			flag6 = not flag6

			if flag6 then
				fn4()
			else
				fn5()
			end
		end)
	end

	fn3 = function(arg)
		if not arg then
			if tbl8.Fly then
				tbl8.Fly.btn:Destroy()
				tbl8.Fly = nil
			end

			return
		end

		fn19("Fly", UDim2.new(0, 20, 0.5, -4), udim22, flag8 and "Fly\nON" or "Fly\nOFF", function()
			flag8 = not flag8

			if flag8 then
				fn8()
			else
				fn9()
			end
		end)
	end

	RunService.Heartbeat:Connect(function()
		if tbl8.Shoot and tbl8.Shoot.img then
			local v7 = fn28(localPlayer)
			tbl8.Shoot.img.Image = "rbxassetid://" .. (v7 and 9695655416 or 139650104834071)
			tbl8.Shoot.img.ImageColor3 = Color3.fromRGB(180, 0, 0)
			tbl8.Shoot.lbl.Text = v7 and "THROW" or "SHOOT"
		end

		if tbl8.Noclip then
			tbl8.Noclip.lbl.Text = flag6 and "NoClip\nON" or "NoClip\nOFF"
		end

		if tbl8.Fly then
			tbl8.Fly.lbl.Text = flag8 and "Fly\nON" or "Fly\nOFF"
		end

		if tbl8.Camlock and tbl8.Camlock.img then
			tbl8.Camlock.img.Image = flag22 and "rbxassetid://101456706369049" or "rbxassetid://114084146151777"
			tbl8.Camlock.img.ImageColor3 = Color3.fromRGB(180, 0, 0)
		end
	end)

	tbl4.Toggle(combat, "Load Shoot / Throw Button", "Knife = THROW mode, no knife = SHOOT mode — draggable button", false, function(arg)
		fn37(arg)
	end, 7)

	tbl4.Dropdown(combat, "Shoot Style", "Select shoot button behavior", { "Normal", "Flick Shoot", "Wallbang" }, "Normal", function(arg)
		shootStyle = arg
	end, 8)

	v, v2 = fn10(combat, 10, function()
		str = "shoot"
	end)

	tbl4.Divider(combat, "Camlock", 11)

	tbl4.Toggle(combat, "Load Camlock Button", "Draggable camlock button on screen", false, function(arg)
		if arg then
			local Camlock = fn19("Camlock", UDim2.new(0.85, 0, 0.6, 0), udim2, "", function()
				flag22 = not flag22
				v6 = nil

				if flag22 then
					fn31()
				else
					fn32()
				end
			end)

			fn20(Camlock, 114084146151777)
			Camlock.lbl.Text = "CAMLOCK"
		else
			fn32()

			if tbl8.Camlock then
				tbl8.Camlock.btn:Destroy()
				tbl8.Camlock = nil
			end
		end
	end, 12)

	v3, v4 = fn10(combat, 14, function()
		str = "camlock"
	end)

	tbl4.Toggle(combat, "Prediction", "Enable movement prediction", true, function(arg)
		flag23 = arg
	end, 15)

	local flag25 = false
	local connection3 = nil
	local tbl10 = {}

	local function fn38(arg, canCollide)
		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = canCollide
			end
		end
	end

	local function fn39(arg)
		if tbl10[arg] then
			fn38(arg, true)
			tbl10[arg] = nil
		end
	end

	local function fn40()
		for k in pairs(tbl10) do
			fn39(k)
		end
	end

	local function fn41()
		if not flag25 then
			return
		end
		local character = localPlayer.Character
		if not character or not fn28(localPlayer) then
			fn40()
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local tbl11 = {}
		local tbl12 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local humanoidRootPart2 = player.Character:FindFirstChild("HumanoidRootPart")
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
					table.insert(tbl11, player)
					tbl12[player.Character] = true
				end
			end
		end

		for k in pairs(tbl10) do
			if not tbl12[k] then
				fn39(k)
			end
		end

		if #tbl11 == 0 then
			return
		end
		local position = (humanoidRootPart.CFrame * CFrame.new(0, 0, -5)).Position

		for _, v7 in ipairs(tbl11) do
			local character2 = v7.Character
			local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart2 then
				if not tbl10[character2] then
					fn38(character2, false)
					tbl10[character2] = true
				end

				humanoidRootPart2.CFrame = CFrame.new(position, Vector3.new(humanoidRootPart.Position.X, position.Y, humanoidRootPart.Position.Z))
				humanoidRootPart2.AssemblyLinearVelocity = Vector3.new()
				humanoidRootPart2.AssemblyAngularVelocity = Vector3.new()
			end
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		tbl10 = {}
	end)

	tbl4.Divider(combat, "Murderer", 16)

	tbl4.Toggle(combat, "Hold Everyone As Hostage", "Only works as Murderer (knife in hand) — holds everyone 5 studs in front, no collision", false, function(arg)
		flag25 = arg

		if arg then
			if connection3 then
				connection3:Disconnect()
			end

			connection3 = RunService.Heartbeat:Connect(fn41)
		else
			if connection3 then
				connection3:Disconnect()
				connection3 = nil
			end

			fn40()
		end
	end, 17)
end

do
	local tbl8 = {
		enabled = false,
		size = 12,
		conn = nil,
		cycleIndex = 0,
		original = {},
		visualPart = {},
		visualHL = {},
	}

	local function fn18(arg)
		local n8 = math.max(arg, 2)
		local n9 = math.max(arg - 15, 2)
		local n10 = math.max(arg - 10, 2)
		return { n8, n9, n10 }
	end

	local function fn19(arg)
		local v5 = tbl8.original[arg]

		if v5 then
			local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart then
				pcall(function()
					humanoidRootPart.Size = v5.size
					humanoidRootPart.Transparency = v5.transparency
					humanoidRootPart.Material = v5.material
					humanoidRootPart.CanCollide = v5.canCollide
					humanoidRootPart.Color = v5.color
				end)
			end
		end

		tbl8.original[arg] = nil
		local v6 = tbl8.visualPart[arg]

		if v6 then
			v6:Destroy()
		end

		tbl8.visualPart[arg] = nil
		tbl8.visualHL[arg] = nil
	end

	local function fn20()
		for k in pairs(tbl8.original) do
			fn19(k)
		end
	end

	local function fn21()
		if not tbl8.enabled then
			return
		end
		tbl8.cycleIndex = tbl8.cycleIndex + 1
		local v5 = fn18(tbl8.size)
		local v6 = v5[tbl8.cycleIndex % #v5 + 1]
		local tbl9 = {}

		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= localPlayer and player.Character then
				local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
				local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart and humanoid and humanoid.Health > 0 then
					local character = player.Character
					tbl9[character] = true

					if not tbl8.original[character] then
						tbl8.original[character] = {
							size = humanoidRootPart.Size,
							transparency = humanoidRootPart.Transparency,
							material = humanoidRootPart.Material,
							canCollide = humanoidRootPart.CanCollide,
							color = humanoidRootPart.Color,
						}
					end

					pcall(function()
						humanoidRootPart.Size = Vector3.new(v6, v6, v6)
						humanoidRootPart.Transparency = 1
						humanoidRootPart.Material = Enum.Material.Neon
						humanoidRootPart.CanCollide = false
					end)

					local part = tbl8.visualPart[character]

					if not part then
						part = Instance.new("Part")
						part.Name = "HitboxVisual"
						part.Anchored = true
						part.CanCollide = false
						part.CanQuery = false
						part.CanTouch = false
						part.Transparency = 1
						part.Parent = workspace
						tbl8.visualPart[character] = part
						local highlight = Instance.new("Highlight")
						highlight.FillColor = Color3.fromRGB(60, 140, 255)
						highlight.OutlineColor = Color3.fromRGB(140, 200, 255)
						highlight.FillTransparency = 0.55
						highlight.OutlineTransparency = 0.1
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Adornee = part
						highlight.Parent = part
						tbl8.visualHL[character] = highlight
					end

					part.Size = Vector3.new(tbl8.size, tbl8.size, tbl8.size)
					part.CFrame = CFrame.new(humanoidRootPart.Position)
				end
			end
		end

		for k in pairs(tbl8.original) do
			if not tbl9[k] then
				fn19(k)
			end
		end
	end

	localPlayer.CharacterAdded:Connect(function()
		tbl8.original = {}
		tbl8.visualPart = {}
		tbl8.visualHL = {}
	end)

	local v5, v6 = fn(combat, 30, 18)
	v5.Name = "HitboxWarning"
	v5.BackgroundTransparency = 1
	v6.Transparency = 1
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(1, -16, 1, 0)
	textLabel.Position = UDim2.new(0, 8, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = " Only works in Murderer stab!"
	textLabel.TextColor3 = Color3.fromRGB(255, 170, 50)
	textLabel.TextSize = 11
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = v5

	tbl4.Slider(combat, "Hitbox Expander", "Target hitbox size — larger value = easier to hit", 5, 40, 12, " stud", function(size)
		tbl8.size = size
	end, 19)

	tbl4.Toggle(combat, "Hitbox Actived", "Only works as Murderer (knife/stab)", false, function(enabled)
		tbl8.enabled = enabled

		if enabled then
			if tbl8.conn then
				tbl8.conn:Disconnect()
			end

			tbl8.conn = RunService.RenderStepped:Connect(fn21)
		else
			if tbl8.conn then
				tbl8.conn:Disconnect()
				tbl8.conn = nil
			end

			fn20()
		end
	end, 20)
end

do
	local skills = tbl2.Skills
	local flag20 = false
	local flag21 = false
	local flag22 = false
	local flag23 = false
	local connection2 = nil

	local function fn18(arg)
		return arg:lower():find("bomb") ~= nil
	end

	local function fn19(arg)
		if not fn18(arg.Name) then
			return
		end

		arg.Activated:Connect(function()
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			character = character and character:FindFirstChild("Humanoid")
			if not humanoidRootPart or not character then
				return
			end
			local remote = arg:FindFirstChild("Remote")
			if not remote or not remote:IsA("RemoteEvent") then
				return
			end
			local state = character:GetState()

			if state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping then
				local n8 = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 0.8 + Vector3.new(0, -3, 0)

				pcall(function()
					remote:FireServer(CFrame.new(n8, n8 + humanoidRootPart.CFrame.LookVector), 50)
				end)
			else
				local n8 = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 4 + Vector3.new(0, 2, 0)

				pcall(function()
					remote:FireServer(CFrame.new(n8, n8 + humanoidRootPart.CFrame.LookVector), 50)
				end)
			end
		end)
	end

	local function fn20(arg)
		arg.ChildAdded:Connect(function(child)
			if child:IsA("Tool") and fn18(child.Name) then
				fn19(child)
			end
		end)

		for _, child in ipairs(arg:GetChildren()) do
			if child:IsA("Tool") and fn18(child.Name) then
				fn19(child)
			end
		end
	end

	local function fn21()
		if connection2 then
			connection2:Disconnect()
		end

		connection2 = workspace.ChildAdded:Connect(function(child)
			if not (flag22 or flag23) then
				return
			end

			if child.Name ~= "Handle" or not child:IsA("BasePart") then
				return
			end

			if child.Name == "VisualGoldDrop" then
				return
			end
			local character = localPlayer.Character
			local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
			local humanoid = character and character:FindFirstChild("Humanoid")
			if not humanoidRootPart or not humanoid then
				return
			end
			local tool = character:FindFirstChildOfClass("Tool")
			if not tool or not fn18(tool.Name) then
				return
			end

			if (child.Position - humanoidRootPart.Position).Magnitude > 20 then
				return
			end
			local state = humanoid:GetState()
			if not (state == Enum.HumanoidStateType.Freefall or state == Enum.HumanoidStateType.Jumping) then
				return
			end
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
			local z = humanoidRootPart.AssemblyLinearVelocity.Z
			humanoidRootPart.AssemblyLinearVelocity = Vector3.new(humanoidRootPart.AssemblyLinearVelocity.X, math.max(55, 55 - humanoidRootPart.AssemblyLinearVelocity.Y * 0.3), z)
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

			task.delay(0.15, function()
				if humanoid then
					humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
				end
			end)
		end)
	end

	local function fn22()
		if connection2 then
			connection2:Disconnect()
			connection2 = nil
		end
	end

	localPlayer.CharacterAdded:Connect(function(character)
		fn20(character)
	end)

	if localPlayer.Character then
		fn20(localPlayer.Character)
	end

	local function createPart()
		local part = Instance.new("Part")
		part.Name = "VisualGoldDrop"
		part.Size = Vector3.new(1.65, 0.9, 1.3)
		part.Transparency = 0
		part.CanCollide = true
		local specialMesh = Instance.new("SpecialMesh")
		specialMesh.MeshId = "http://www.roblox.com/asset/?id=104516854"
		specialMesh.TextureId = "rbxassetid://111999858263148"
		specialMesh.Scale = Vector3.new(1.5, 1.5, 1.5)
		specialMesh.Parent = part
		return part
	end

	local function fn23(arg)
		local smoke = Instance.new("Smoke", arg)
		smoke.Color = Color3.fromRGB(128, 128, 128)
		smoke.Opacity = 0.2
		smoke.Size = 0.1
		smoke.RiseVelocity = 1
		smoke.Enabled = true
		local billboardGui = Instance.new("BillboardGui", arg)
		billboardGui.Size = UDim2.new(3, 0, 3, 0)
		billboardGui.ExtentsOffset = Vector3.new(0, 0, 1)
		local imageLabel3 = Instance.new("ImageLabel", billboardGui)
		imageLabel3.Size = UDim2.new(1, 0, 1, 0)
		imageLabel3.BackgroundTransparency = 1
		imageLabel3.Image = "http://www.roblox.com/asset/?id=104564194"
		imageLabel3.Visible = false

		task.spawn(function()
			while arg and arg.Parent do
				imageLabel3.Visible = not imageLabel3.Visible
				task.wait(0.18)
			end
		end)
	end

	local function fn24(arg)
		local part = Instance.new("Part")
		part.Shape = Enum.PartType.Ball
		part.Size = Vector3.new(0.5, 0.5, 0.5)
		part.Color = Color3.fromRGB(255, 215, 0)
		part.Material = Enum.Material.Neon
		part.Anchored = true
		part.CanCollide = false
		part.CFrame = CFrame.new(arg + Vector3.new(0, 1.2, 0))
		part.Parent = workspace
		local particleEmitter = Instance.new("ParticleEmitter")
		local colorSequence = ColorSequence.new
		local tbl8 = {}
		local v5 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 240, 130))
		local v6 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 190, 0))
		local new = ColorSequenceKeypoint.new
		local color = Color3.fromRGB
		tbl8[1] = v5
		tbl8[2] = v6

		do
			local values = table.pack(new(1, color(160, 90, 0)))
			table.move(values, 1, values.n, 3, tbl8)
		end

		particleEmitter.Color = colorSequence(tbl8)
		local numberSequence = NumberSequence.new
		local tbl9 = {}
		local v7 = NumberSequenceKeypoint.new(0, 1.2)
		local v8 = NumberSequenceKeypoint.new(0.5, 0.6)
		local new2 = NumberSequenceKeypoint.new
		tbl9[1] = v7
		tbl9[2] = v8

		do
			local values = table.pack(new2(1, 0))
			table.move(values, 1, values.n, 3, tbl9)
		end

		particleEmitter.Size = numberSequence(tbl9)
		particleEmitter.Speed = NumberRange.new(12, 25)
		particleEmitter.SpreadAngle = Vector2.new(180, 180)
		particleEmitter.Lifetime = NumberRange.new(0.4, 0.7)
		particleEmitter.Acceleration = Vector3.new(0, -8, 0)
		particleEmitter.LightEmission = 1
		particleEmitter.Parent = part

		task.spawn(function()
			task.wait(0.02)

			if particleEmitter and particleEmitter.Parent then
				particleEmitter:Emit(60)
			end
		end)

		task.spawn(function()
			for i = 1, 12 do
				if part and part.Parent then
					part.Size = part.Size + Vector3.new(0.7, 0.7, 0.7)
					part.Transparency = i / 12
				end

				task.wait(0.015)
			end

			if part then
				part:Destroy()
			end
		end)
	end

	local function fn25()
		for _, child in ipairs(localPlayer.Backpack:GetChildren()) do
			if child:IsA("Tool") and child.Name == "GoldBomb (Visual)" then
				return true
			end
		end

		if localPlayer.Character then
			for _, child in ipairs(localPlayer.Character:GetChildren()) do
				if child:IsA("Tool") and child.Name == "GoldBomb (Visual)" then
					return true
				end
			end
		end

		return false
	end

	local function fn26()
		if fn25() then
			return
		end
		local tool = Instance.new("Tool")
		tool.Name = "GoldBomb (Visual)"
		tool.RequiresHandle = true
		tool.CanBeDropped = false
		tool.TextureId = "http://www.roblox.com/Thumbs/Asset.ashx?format=png&width=250&height=250&assetId=70754337097792"
		tool.Grip = CFrame.new(-0.6, 0, -0.4, -0.936466694, -3.63886356e-05, -0.350756258, -0.168184027, 0.877594054, 0.448935181, 0.30780527, 0.479404479, -0.821843743)
		local v5 = createPart()
		v5.Name = "Handle"
		v5.CanCollide = false
		v5.Parent = tool
		local flag24 = true
		local v6 = nil

		tool.Activated:Connect(function()
			if not flag24 or flag21 then
				return
			end
			local character = localPlayer.Character
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not character then
				return
			end
			flag24 = false
			flag21 = true

			if v6 then
				v6:Destroy()
			end

			local v7 = createPart()
			v7.CFrame = character.CFrame * CFrame.new(0, -3.2, 0)
			v7.Parent = workspace
			v6 = v7
			fn23(v7)
			local bodyVelocity = Instance.new("BodyVelocity", v7)
			bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
			local position = character.Position
			bodyVelocity.Velocity = (localPlayer:GetMouse().Hit.p - position).Unit * 25 + Vector3.new(0, 10, 0)
			game.Debris:AddItem(bodyVelocity, 0.1)

			if flag23 or flag22 then
				task.spawn(function()
					local character2 = localPlayer.Character
					local humanoid = character2 and character2:FindFirstChildOfClass("Humanoid")
					character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
					if not humanoid or not character2 then
						return
					end
					local state = humanoid:GetState()
					if state ~= Enum.HumanoidStateType.Freefall and state ~= Enum.HumanoidStateType.Jumping then
						return
					end
					character2.AssemblyLinearVelocity = Vector3.new(character2.AssemblyLinearVelocity.X, 60, character2.AssemblyLinearVelocity.Z)
				end)
			end

			for _, child in pairs(tool:GetChildren()) do
				if child:IsA("BasePart") then
					child.Transparency = 1
					local specialMesh = child:FindFirstChildOfClass("SpecialMesh")

					if specialMesh then
						specialMesh.Scale = Vector3.zero
					end
				end
			end

			task.wait(4)

			if v6 and v6.Parent then
				fn24(v6.Position)
				v6:Destroy()
				v6 = nil
			end

			for _, child in pairs(tool:GetChildren()) do
				if child:IsA("BasePart") then
					child.Transparency = 0
					local specialMesh = child:FindFirstChildOfClass("SpecialMesh")

					if specialMesh then
						specialMesh.Scale = Vector3.new(1.5, 1.5, 1.5)
					end
				end
			end

			flag24 = true
			flag21 = false
		end)

		tool.Parent = localPlayer.Backpack
	end

	task.spawn(function()
		while task.wait(2) do
			if localPlayer.Character then
				pcall(function()
					if flag20 then
						fn26()
					end
				end)
			end
		end
	end)

	localPlayer.CharacterAdded:Connect(function()
		task.wait(1)

		if flag20 then
			fn26()
		end
	end)

	tbl4.Divider(skills, "Bomb", 1)

	tbl4.Toggle(skills, "Free Gold Bomb", "Free visual gold bomb — no pass required, auto-refreshes", false, function(arg)
		flag20 = arg

		if arg then
			fn26()
		end
	end, 2)

	tbl4.Divider(skills, "Bomb Jump", 3)

	tbl4.Toggle(skills, "Gold Bomb Jump", "", false, function(arg)
		flag23 = arg

		if arg or flag22 then
			fn21()
		else
			fn22()
		end
	end, 4)

	tbl4.Toggle(skills, "Bomb Jump", "", false, function(arg)
		flag22 = arg

		if arg or flag23 then
			fn21()
		else
			fn22()
		end
	end, 5)

	local flag24 = false
	local tbl8 = {}
	local connection3 = nil

	local function fn27()
		for _, v5 in ipairs(tbl8) do
			pcall(function()
				v5:Disconnect()
			end)
		end

		tbl8 = {}

		if connection3 then
			pcall(function()
				connection3:Disconnect()
			end)

			connection3 = nil
		end
	end

	local function fn28(parent)
		if parent:GetAttribute("FFJumpSetup") then
			return
		end
		parent:SetAttribute("FFJumpSetup", true)
		parent.Anchored = true
		local part = Instance.new("Part")
		part.Name = "TopSensor"
		part.Size = Vector3.new(parent.Size.X * 0.8, 0.5, parent.Size.Z * 0.8)
		part.Position = parent.Position + Vector3.new(0, parent.Size.Y / 2 + 0.5, 0)
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 1
		part.CanQuery = false
		part.Massless = true
		part.Parent = parent
		local connection4 = nil

		connection4 = part.Touched:Connect(function(hit)
			if not flag24 then
				return
			end

			if table.find({ "RightFoot", "LeftFoot" }, hit.Name) then
				parent.Anchored = false
				parent:SetAttribute("Unfrozen", true)
				connection4:Disconnect()
				part:Destroy()
			end
		end)

		table.insert(tbl8, connection4)
	end

	local function fn29()
		fn27()
		local handle2 = workspace:FindFirstChild("Handle2")

		if handle2 and handle2:IsA("BasePart") then
			fn28(handle2)
		end

		connection3 = workspace.ChildAdded:Connect(function(child)
			if not flag24 then
				return
			end

			if child.Name == "Handle2" and child:IsA("BasePart") then
				task.wait()
				fn28(child)
			end
		end)
	end

	local function fn30()
		local handle2 = workspace:FindFirstChild("Handle2")

		if handle2 and handle2:IsA("BasePart") and handle2.Anchored then
			handle2.Anchored = false
			local topSensor = handle2:FindFirstChild("TopSensor")

			if topSensor then
				topSensor:Destroy()
			end

			handle2:SetAttribute("FFJumpSetup", nil)
		end

		fn27()
	end

	tbl4.Divider(skills, "Fireflies", 6)

	tbl4.Toggle(skills, "Fireflies Jump Helper", "", false, function(arg)
		flag24 = arg

		if arg then
			fn29()
		else
			fn30()
		end
	end, 7)
end

do
	local utilities = tbl2.Utilities
	local flag20 = false

	local function fn18(arg)
		local character = arg.Character

		if character then
			character = character:FindFirstChild("Gun") or character:FindFirstChild("Revolver")
		end

		if character then
			return true
		end
		local backpack = arg:FindFirstChild("Backpack")

		if backpack then
			backpack = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
		end

		if backpack then
			return true
		end
		return false
	end

	local function fn19(arg)
		if not arg or not arg:IsA("BasePart") or not arg.Parent then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end

		if fn18(localPlayer) then
			return
		end
		local touchInterest = arg:FindFirstChild("TouchInterest")

		if firetouchinterest and touchInterest then
			firetouchinterest(humanoidRootPart, arg, 0)
			firetouchinterest(humanoidRootPart, arg, 1)
		else
			local canCollide = arg.CanCollide
			arg.CanCollide = false
			local now = tick()
			local connection2 = nil

			connection2 = RunService.Heartbeat:Connect(function()
				if arg and arg.Parent and not fn18(localPlayer) then
					arg.CFrame = humanoidRootPart.CFrame
				else
					if arg and arg.Parent then
						arg.CanCollide = canCollide
					end

					connection2:Disconnect()
				end

				if tick() - now > 0.6 then
					if arg and arg.Parent then
						arg.CanCollide = canCollide
					end

					connection2:Disconnect()
				end
			end)
		end
	end

	local function fn20()
		local gunDrop = workspace:FindFirstChild("GunDrop", true)

		if gunDrop then
			gunDrop = gunDrop:IsA("BasePart") and gunDrop or gunDrop:FindFirstChildWhichIsA("BasePart", true)
		end

		if gunDrop then
			fn19(gunDrop)
		end
	end

	LoadGrabGunBtn = function(arg)
		if not arg then
			if comboBtnRefs and comboBtnRefs.GrabGun then
				comboBtnRefs.GrabGun.btn:Destroy()
				comboBtnRefs.GrabGun = nil
			end

			return
		end

		local v5 = SMALL_SZ

		NewComboBtn("GrabGun", UDim2.new(0.05, 0, 0.75, 0), v5, "GRAB\nGUN", function()
			fn20()
		end)
	end

	grabGunWatcher = nil

	startGrabGunWatcher = function()
		if grabGunWatcher then
			return
		end
		local gunDrop = workspace:FindFirstChild("GunDrop", true)

		if gunDrop then
			local isBasePart = gunDrop:IsA("BasePart") and gunDrop or gunDrop:FindFirstChildWhichIsA("BasePart", true)

			if isBasePart and not fn18(localPlayer) then
				fn19(isBasePart)
			end
		end

		grabGunWatcher = workspace.DescendantAdded:Connect(function(descendant)
			if not flag20 then
				return
			end

			if descendant.Name == "GunDrop" or descendant.Parent and descendant.Parent.Name == "GunDrop" then
				local isBasePart = descendant:IsA("BasePart") and descendant or descendant:FindFirstChildWhichIsA("BasePart", true)

				if isBasePart and not fn18(localPlayer) then
					task.defer(function()
						fn19(isBasePart)
					end)
				end
			end
		end)
	end

	stopGrabGunWatcher = function()
		if grabGunWatcher then
			grabGunWatcher:Disconnect()
			grabGunWatcher = nil
		end
	end

	tbl4.Divider(utilities, "Grab Gun", 1)

	tbl4.Button(utilities, "Grab Gun", "", function()
		fn20()
	end, 2)

	fn10(utilities, 3, function()
		str = "grabgun"
	end)

	tbl4.Toggle(utilities, "Auto Grab Gun", "", false, function(arg)
		flag20 = arg

		if arg then
			startGrabGunWatcher()
		else
			stopGrabGunWatcher()
		end
	end, 4)

	getgenv().RuzOldPos = getgenv().RuzOldPos or nil
	getgenv().RuzFPDH = getgenv().RuzFPDH or workspace.FallenPartsDestroyHeight
	local flag21 = false

	local function fn21(arg)
		if flag21 then
			return
		end
		local character = localPlayer.Character
		if not character then
			return
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			return
		end
		local rootPart = humanoid.RootPart
		if not rootPart then
			return
		end
		local character2 = arg.Character
		if not character2 then
			return
		end
		local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
		local rootPart2 = humanoid2 and humanoid2.RootPart
		local head = character2:FindFirstChild("Head")
		local accessory = character2:FindFirstChildOfClass("Accessory")
		accessory = accessory and accessory:FindFirstChild("Handle")

		if rootPart.Velocity.Magnitude < 50 then
			local cFrame = rootPart.CFrame
			getgenv().RuzOldPos = cFrame
		end

		if humanoid2 and humanoid2.Sit then
			return
		end
		local v5 = head or accessory or humanoid2

		if v5 then
			workspace.CurrentCamera.CameraSubject = v5
		end

		if not character2:FindFirstChildWhichIsA("BasePart") then
			return
		end

		local function fn22(arg2, arg3, arg4)
			rootPart.CFrame = CFrame.new(arg2.Position) * arg3 * arg4

			pcall(function()
				character:SetPrimaryPartCFrame(CFrame.new(arg2.Position) * arg3 * arg4)
			end)

			rootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
			rootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
		end

		local function fn23(arg2)
			local n8 = tick() + 2.5
			local n9 = 0

			while true do
				if rootPart and humanoid2 then
					local magnitude = arg2.Velocity.Magnitude

					if magnitude < 40 then
						n9 += 100
						local n10 = humanoid2.MoveDirection * magnitude / 1.25
						local cframe = CFrame.Angles
						fn22(arg2, CFrame.new(0, 1.5, 0) + n10, cframe(math.rad(n9), 0, 0))
						task.wait()
						local n11 = humanoid2.MoveDirection * magnitude / 1.25
						local cframe2 = CFrame.Angles
						fn22(arg2, CFrame.new(0, -1.5, 0) + n11, cframe2(math.rad(n9), 0, 0))
						task.wait()
						local n12 = humanoid2.MoveDirection * magnitude / 1.25
						local cframe3 = CFrame.Angles
						fn22(arg2, CFrame.new(0, 1.5, 0) + n12, cframe3(math.rad(n9), 0, 0))
						task.wait()
						local n13 = humanoid2.MoveDirection * magnitude / 1.25
						local cframe4 = CFrame.Angles
						fn22(arg2, CFrame.new(0, -1.5, 0) + n13, cframe4(math.rad(n9), 0, 0))
						task.wait()
						local cframe5 = CFrame.Angles
						fn22(arg2, CFrame.new(0, 1.5, 0), cframe5(math.rad(n9), 0, 0))
						task.wait()
						local cframe6 = CFrame.Angles
						fn22(arg2, CFrame.new(0, -1.5, 0), cframe6(math.rad(n9), 0, 0))
						task.wait()
					else
						local moveDirection = humanoid2.MoveDirection
						local walkSpeed2 = humanoid2.WalkSpeed
						local cframe = CFrame.Angles
						fn22(arg2, CFrame.new(moveDirection.X * walkSpeed2 * 0.12, 3, moveDirection.Z * walkSpeed2 * 0.12), cframe(1.5707963267948966, 0, 0))
						rootPart.Velocity = Vector3.new(900000000, 900000000, 900000000)
						task.wait()
						local cframe2 = CFrame.Angles
						fn22(arg2, CFrame.new(-moveDirection.X * walkSpeed2 * 0.06, -3, -moveDirection.Z * walkSpeed2 * 0.06), cframe2(0, 0, 0))
						rootPart.Velocity = Vector3.new(900000000, 900000000, 900000000)
						task.wait()
						local cframe3 = CFrame.Angles
						fn22(arg2, CFrame.new(moveDirection.X * walkSpeed2 * 0.18, 3, moveDirection.Z * walkSpeed2 * 0.18), cframe3(1.5707963267948966, 0, 0))
						rootPart.Velocity = Vector3.new(900000000, 900000000, 900000000)
						task.wait()
						local cframe4 = CFrame.Angles
						fn22(arg2, CFrame.new(-moveDirection.X * walkSpeed2 * 0.06, -3, -moveDirection.Z * walkSpeed2 * 0.06), cframe4(0, 0, 0))
						rootPart.Velocity = Vector3.new(900000000, 900000000, 900000000)
						task.wait()
					end

					if not (n8 < tick()) then
						continue
					end
				end

				break
			end
		end

		flag21 = true
		workspace.FallenPartsDestroyHeight = (0/0)
		local bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Velocity = Vector3.zero
		bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		bodyVelocity.Parent = rootPart
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
		rootPart2 = rootPart2 or head or accessory

		if rootPart2 then
			fn23(rootPart2)
		end

		bodyVelocity:Destroy()
		humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		workspace.CurrentCamera.CameraSubject = humanoid

		if getgenv().RuzOldPos then
			local n8 = 0

			while true do
				n8 += 1
				rootPart.CFrame = getgenv().RuzOldPos * CFrame.new(0, 0.5, 0)

				pcall(function()
					character:SetPrimaryPartCFrame(getgenv().RuzOldPos * CFrame.new(0, 0.5, 0))
				end)

				humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

				for _, child in ipairs(character:GetChildren()) do
					if child:IsA("BasePart") then
						child.Velocity = Vector3.new()
						child.RotVelocity = Vector3.new()
					end
				end

				task.wait()
				if not (n8 > 30 or (rootPart.Position - getgenv().RuzOldPos.p).Magnitude < 25) then
					continue
				end
				break
			end

			workspace.FallenPartsDestroyHeight = getgenv().RuzFPDH
		end

		flag21 = false
	end

	tbl4.Divider(utilities, "Fling", 5)

	local function fn22(arg, arg2)
		local character = arg.Character
		local backpack = arg:FindFirstChild("Backpack")
		if character and character:FindFirstChild(arg2) then
			return true
		end

		if backpack and backpack:FindFirstChild(arg2) then
			return true
		end
		return false
	end

	tbl4.Button(utilities, "Fling Murderer 1 Time", "Flings the player carrying a Knife", function()
		if flag21 then
			return
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player == localPlayer then
				continue
			end
			local ok, result = pcall(fn22, player, "Knife")
			if ok and result then
				task.spawn(fn21, player)
				return
			end
		end
	end, 6)

	tbl4.Button(utilities, "Fling Sheriff 1 Time", "Flings the player carrying a Gun", function()
		if flag21 then
			return
		end

		for _, player in ipairs(Players:GetPlayers()) do
			if player == localPlayer then
				continue
			end
			local ok, result = pcall(fn22, player, "Gun")
			if ok and result then
				task.spawn(fn21, player)
				return
			end
		end
	end, 7)

	_initAntiFling = function()
		local flag22 = false
		local connection2 = nil
		local tbl8 = {}

		local function fn23(arg)
			for _, v5 in ipairs(tbl8) do
				pcall(function()
					v5:Disconnect()
				end)
			end

			tbl8 = {}
			local character = localPlayer.Character
			if not character then
				return
			end

			local function fn24(arg2)
				for _, descendant in ipairs(arg2:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CollisionGroup = arg and "RuzAntiFling" or "Default"
					end
				end
			end

			pcall(function()
				local PhysicsService = game:GetService("PhysicsService")

				if not PhysicsService:CollisionGroupExists("RuzAntiFling") then
					PhysicsService:RegisterCollisionGroup("RuzAntiFling")
				end

				PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "Default", false)
				PhysicsService:CollisionGroupSetCollidable("RuzAntiFling", "RuzAntiFling", false)
			end)

			fn24(character)

			local connection3 = character.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("BasePart") and flag22 then
					descendant.CollisionGroup = "RuzAntiFling"
				end
			end)

			table.insert(tbl8, connection3)
		end

		local function fn24()
			local character = localPlayer.Character

			if character then
				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						pcall(function()
							descendant.CollisionGroup = "Default"
						end)
					end
				end
			end

			for _, v5 in ipairs(tbl8) do
				pcall(function()
					v5:Disconnect()
				end)
			end

			tbl8 = {}
		end

		tbl4.Divider(utilities, "Anti Fling", 8)

		tbl4.Toggle(utilities, "Anti Fling", "", false, function(arg)
			flag22 = arg

			if arg then
				fn23(true)

				connection2 = localPlayer.CharacterAdded:Connect(function()
					task.wait(0.5)

					if flag22 then
						fn23(true)
					end
				end)
			else
				fn24()

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end
		end, 9)
	end

	_initAntiFling()

	_initWallhop = function()
		local flag22 = false
		local connection2 = nil
		local flag23 = false
		local n8 = 0
		local instance = nil

		local function fn23()
			if flag23 then
				return
			end
			flag23 = true
			local character = localPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			character = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoid or not character then
				flag23 = false
				return
			end
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			character.Velocity = Vector3.new(character.Velocity.X, 50, character.Velocity.Z)
			local currentCamera = workspace.CurrentCamera
			local cFrame = currentCamera.CFrame
			currentCamera.CFrame = cFrame * CFrame.Angles(0, 3.1415926535897931, 0)
			task.wait(0.01)
			currentCamera.CFrame = cFrame
			flag23 = false
		end

		tbl4.Divider(utilities, "Wallhop", 10)

		tbl4.Toggle(utilities, "Auto Wallhop", "", false, function(arg)
			flag22 = arg

			if arg then
				connection2 = RunService.Heartbeat:Connect(function()
					local character = localPlayer.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					local currentCamera = workspace.CurrentCamera
					local raycastParams = RaycastParams.new()
					raycastParams.FilterDescendantsInstances = { character }
					raycastParams.FilterType = Enum.RaycastFilterType.Exclude
					local hit = workspace:Raycast(humanoidRootPart.Position, currentCamera.CFrame.LookVector * 3, raycastParams)

					if hit and hit.Instance and hit.Instance.CanCollide then
						if instance and instance ~= hit.Instance then
							if tick() - n8 > 0.05 then
								n8 = tick()
								task.spawn(fn23)
							end
						end

						instance = hit.Instance
					else
						instance = nil
					end
				end)
			else
				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				instance = nil
				flag23 = false
			end
		end, 11)
	end
end

_initWallhop()
local config
config = tbl2.Config
tbl4.Divider(config, "UI Settings", 0)

do
	local v5 = nil
	local flag20 = false

	local function fn18()
		local v6 = fn(config, 38, 1)
		v6.Name = "HideKeyRow"
		local textLabel = Instance.new("TextLabel")
		textLabel.Size = UDim2.new(0.55, 0, 1, 0)
		textLabel.Position = UDim2.new(0, 12, 0, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "Hide Key"
		textLabel.TextColor3 = tbl.TextPrimary
		textLabel.TextSize = 13
		textLabel.Font = Enum.Font.ArialBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.Parent = v6
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Size = UDim2.new(0.55, 0, 1, 0)
		textLabel2.Position = UDim2.new(0, 12, 0.45, 0)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "Toggle panel visibility"
		textLabel2.TextColor3 = tbl.TextMuted
		textLabel2.TextSize = 10
		textLabel2.Font = Enum.Font.Arial
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = v6
		local textButton4 = Instance.new("TextButton")
		textButton4.Size = UDim2.new(0, 100, 0, 26)
		textButton4.Position = UDim2.new(1, -10, 0.5, 0)
		textButton4.AnchorPoint = Vector2.new(1, 0.5)
		textButton4.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
		textButton4.BackgroundTransparency = 0.1
		textButton4.BorderSizePixel = 0
		textButton4.Text = rightShift.Name
		textButton4.TextColor3 = tbl.TextPrimary
		textButton4.TextSize = 12
		textButton4.Font = Enum.Font.ArialBold
		textButton4.Parent = v6
		local uiCorner4 = Instance.new("UICorner")
		uiCorner4.CornerRadius = UDim.new(0, 6)
		uiCorner4.Parent = textButton4
		local uiStroke4 = Instance.new("UIStroke")
		uiStroke4.Color = tbl.StrokeOff
		uiStroke4.Thickness = 1
		uiStroke4.Parent = textButton4
		v5 = textButton4

		textButton4.MouseButton1Click:Connect(function()
			if flag20 then
				return
			end
			flag20 = true
			textButton4.Text = "Press key..."
			textButton4.TextColor3 = tbl.Accent
			local connection2 = nil

			connection2 = UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then
					return
				end

				if input.UserInputType ~= Enum.UserInputType.Keyboard then
					return
				end

				if input.KeyCode ~= Enum.KeyCode.Escape then
					rightShift = input.KeyCode
				end

				textButton4.Text = rightShift.Name
				textButton4.TextColor3 = tbl.TextPrimary
				flag20 = false
				connection2:Disconnect()
			end)
		end)
	end

	fn18()
end

tbl4.Slider(config, "UI Size", "Panel scale — default 100%", 60, 140, 100, "%", function(arg)
	local n8 = arg / 100
	uiScale.Scale = isMinimized and 0 or n8
	n2 = n8
end, 2, true)

tbl4.Toggle(config, "Notifications", "Show RuzHub slide-in notifications (top-right)", true, function(arg)
	flag = arg
end, 3, true)

do
	local HttpService = game:GetService("HttpService")
	local str3 = "RuzConfigs"

	local function fn18()
		pcall(function()
			if not isfolder("RuzConfigs") then
				makefolder("RuzConfigs")
			end
		end)
	end

	local function fn19()
		local tbl8 = {}

		pcall(function()
			if isfolder("RuzConfigs") then
				for _, v5 in ipairs(listfiles("RuzConfigs")) do
					local match = v5:match("([^\\/]+)%.json$")

					if match and match ~= "_meta" then
						table.insert(tbl8, match)
					end
				end
			end
		end)

		table.sort(tbl8)
		return tbl8
	end

	local function fn20(arg)
		if typeof(arg) == "Color3" then
			return { __type = "Color3", r = arg.R, g = arg.G, b = arg.B }
		end
		return arg
	end

	local function fn21(arg)
		if type(arg) == "table" and arg.__type == "Color3" then
			return Color3.new(arg.r, arg.g, arg.b)
		end
		return arg
	end

	local function fn22(arg)
		fn18()
		local tbl8 = {}

		for _, v5 in ipairs(tbl3) do
			local ok, result = pcall(v5.get)

			if ok and result ~= nil then
				tbl8[v5.key] = fn20(result)
			end
		end

		local ok, result = pcall(function()
			return HttpService:JSONEncode(tbl8)
		end)

		if not ok then
			return false
		end

		return pcall(function()
			writefile(str3 .. "/" .. arg .. ".json", result)
		end)
	end

	local function fn23(arg)
		if not arg then
			return false
		end

		local ok, result = pcall(function()
			return readfile(str3 .. "/" .. arg .. ".json")
		end)

		if not ok or not result then
			return false
		end

		local ok2, result2 = pcall(function()
			return HttpService:JSONDecode(result)
		end)

		if not ok2 or type(result2) ~= "table" then
			return false
		end

		for _, v5 in ipairs(tbl3) do
			local v6 = result2[v5.key]

			if v6 ~= nil then
				pcall(v5.set, fn21(v6))
			end
		end

		return true
	end

	local function fn24()
		local ok, result = pcall(function()
			return readfile(str3 .. "/_meta.json")
		end)

		if ok and result then
			local ok2, result2 = pcall(function()
				return HttpService:JSONDecode(result)
			end)

			if ok2 and type(result2) == "table" then
				return result2
			end
		end

		return {}
	end

	local function fn25(arg)
		fn18()

		pcall(function()
			writefile(str3 .. "/_meta.json", HttpService:JSONEncode(arg))
		end)
	end

	local v5 = fn24()
	local autoload = v5.autoload or false
	local lastConfig = v5.lastConfig

	local function fn26()
		fn25({ autoload = autoload, lastConfig = lastConfig })
	end

	tbl4.Divider(config, "Config Manager", 10)
	local v6 = nil

	local function fn27()
		if v6 then
			v6:Destroy()
			v6 = nil
		end

		local v7 = fn19()
		local tbl8 = #v7 > 0 and v7 or { "(No configs)" }

		if lastConfig and not table.find(v7, lastConfig) then
			lastConfig = nil
		end

		v6 = tbl4.Dropdown(config, "Select Config", "Select from saved configs", tbl8, lastConfig or tbl8[1], function(arg)
			if arg ~= "(No configs)" then
				lastConfig = arg
				fn26()
			end
		end, 11, true)
	end

	fn27()

	tbl4.Button(config, "Run Config", "Load selected config and apply all settings", function()
		if not lastConfig then
			return
		end
		fn23(lastConfig)
	end, 12, "Run")

	local v7 = fn(config, 38, 13)
	v7.Name = "NewConfigNameRow"
	local textLabel = Instance.new("TextLabel")
	textLabel.Size = UDim2.new(0.4, 0, 1, 0)
	textLabel.Position = UDim2.new(0, 12, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = "Config Name"
	textLabel.TextColor3 = tbl.TextPrimary
	textLabel.TextSize = 13
	textLabel.Font = Enum.Font.ArialBold
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.Parent = v7
	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(0, 150, 0, 26)
	textBox.Position = UDim2.new(1, -10, 0.5, 0)
	textBox.AnchorPoint = Vector2.new(1, 0.5)
	textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textBox.BackgroundTransparency = 0.1
	textBox.BorderSizePixel = 0
	textBox.PlaceholderText = "New config name..."
	textBox.Text = ""
	textBox.TextColor3 = tbl.TextPrimary
	textBox.TextSize = 12
	textBox.Font = Enum.Font.ArialBold
	textBox.TextXAlignment = Enum.TextXAlignment.Center
	textBox.ClearTextOnFocus = false
	textBox.Parent = v7
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(0, 6)
	uiCorner4.Parent = textBox
	local uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Color = tbl.StrokeOff
	uiStroke4.Thickness = 1
	uiStroke4.Transparency = 0.2
	uiStroke4.Parent = textBox

	tbl4.Button(config, "Set New Config", "Save all current settings with this name", function()
		local str4 = textBox.Text:gsub("^%s+", ""):gsub("%s+$", "")
		if str4 == "" then
			return
		end

		if fn22(str4) then
			lastConfig = str4
			fn26()
			fn27()
			textBox.Text = ""
		end
	end, 14, "Save")

	tbl4.Toggle(config, "Auto Load Config", "Auto-loads selected config when panel opens", autoload, function(arg)
		autoload = arg
		fn26()
	end, 15, true)

	if autoload and lastConfig then
		task.spawn(function()
			task.wait(1)
			fn23(lastConfig)
		end)
	end
end

local color
color = Color3.fromRGB(170, 20, 40)
local fn18, textButton4, uiScale2, uiStroke4, imageLabel3, frame4

do
	local n8 = 48

	fn18 = function()
		return math.clamp(workspace.CurrentCamera.ViewportSize.X / 1920, 0.85, 1.1)
	end

	local function fn19(arg)
		return -math.floor(n8 * (arg - 1) / 2) + 3
	end

	textButton4 = Instance.new("TextButton")
	textButton4.Name = "OpenButton"
	textButton4.Size = UDim2.new(0, 205, 0, 48)
	textButton4.AnchorPoint = Vector2.new(0.5, 0)
	textButton4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	textButton4.BackgroundTransparency = 0.2
	textButton4.AutoButtonColor = false
	textButton4.BorderSizePixel = 0
	textButton4.Text = ""
	textButton4.Visible = false
	textButton4.ZIndex = 10
	openBtnGui = Instance.new("ScreenGui")
	openBtnGui.Name = "RuzOpenBtn"
	openBtnGui.ResetOnSpawn = false
	openBtnGui.DisplayOrder = 9999
	openBtnGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	openBtnGui.IgnoreGuiInset = true
	openBtnGui.Parent = game.CoreGui
	textButton4.Parent = openBtnGui
	uiScale2 = Instance.new("UIScale")
	uiScale2.Scale = fn18()
	uiScale2.Parent = textButton4

	local function fn20()
		local v5 = fn18()
		uiScale2.Scale = v5
		textButton4.Position = UDim2.new(0.5, 0, 0, fn19(v5))
	end

	fn20()
	local uiCorner4 = Instance.new("UICorner")
	uiCorner4.CornerRadius = UDim.new(1, 0)
	uiCorner4.Parent = textButton4
	uiStroke4 = Instance.new("UIStroke")
	uiStroke4.Name = "Outline"
	uiStroke4.Color = color
	uiStroke4.Thickness = 1.8
	uiStroke4.Transparency = 0
	uiStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uiStroke4.Parent = textButton4
	imageLabel3 = Instance.new("ImageLabel")
	imageLabel3.Name = "DragIcon"
	imageLabel3.Size = UDim2.new(0, 22, 0, 22)
	imageLabel3.Position = UDim2.new(0, 14, 0.5, -11)
	imageLabel3.BackgroundTransparency = 1
	imageLabel3.Image = "rbxassetid://77028714324861"
	imageLabel3.ImageColor3 = color
	imageLabel3.ZIndex = 11
	imageLabel3.Parent = textButton4
	frame4 = Instance.new("Frame")
	frame4.Name = "Divider"
	frame4.Size = UDim2.new(0, 1, 1, 0)
	frame4.Position = UDim2.new(0, 46, 0, 0)
	frame4.BackgroundColor3 = color
	frame4.BackgroundTransparency = 0.3
	frame4.BorderSizePixel = 0
	frame4.ZIndex = 11
	frame4.Parent = textButton4
	local imageLabel4 = Instance.new("ImageLabel")
	imageLabel4.Name = "MainIcon"
	imageLabel4.Size = UDim2.new(0, 36, 0, 36)
	imageLabel4.Position = UDim2.new(0, 56, 0.5, -18)
	imageLabel4.BackgroundTransparency = 1
	imageLabel4.Image = "rbxassetid://108459346703445"
	imageLabel4.ZIndex = 11
	imageLabel4.Parent = textButton4
	local textLabel = Instance.new("TextLabel")
	textLabel.Name = "Label"
	textLabel.Size = UDim2.new(1, -100, 1, 0)
	textLabel.Position = UDim2.new(0, 98, 0, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Font = Enum.Font.ArialBold
	textLabel.RichText = true
	textLabel.Text = "<font color=\"#AA1428\">Ruz</font><font color=\"#FFFFFF\">Hub</font>"
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	textLabel.TextSize = 21
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.ZIndex = 11
	textLabel.Parent = textButton4

	workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		fn20()
	end)
end

do
	local flag20 = false
	local v5 = nil
	local position = nil
	local position2 = nil

	local function fn19(arg)
		local n8 = arg.Position - position
		local viewportSize = workspace.CurrentCamera.ViewportSize
		local absoluteSize = textButton4.AbsoluteSize
		local n9 = position2.Y.Offset + n8.Y
		textButton4.Position = UDim2.new(position2.X.Scale, math.clamp(position2.X.Offset + n8.X, -absoluteSize.X * position2.X.Scale, viewportSize.X - absoluteSize.X * (1 - position2.X.Scale)), position2.Y.Scale, math.clamp(n9, 0, viewportSize.Y - absoluteSize.Y))
	end

	textButton4.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag20 = true
			position = input.Position
			position2 = textButton4.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					flag20 = false
				end
			end)
		end
	end)

	textButton4.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			v5 = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == v5 and flag20 then
			fn19(input)
		end
	end)
end

local frame5
frame5 = Instance.new("Frame")
frame5.Name = "ConfirmDialog"
frame5.Size = UDim2.new(0, 300, 0, 130)
frame5.Position = UDim2.new(0.5, 0, 0.5, 0)
frame5.AnchorPoint = Vector2.new(0.5, 0.5)
frame5.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame5.BackgroundTransparency = 0.1
frame5.BorderSizePixel = 0
frame5.Visible = false
frame5.ZIndex = 20
frame5.Parent = screenGui
local uiScale3
uiScale3 = Instance.new("UIScale")
uiScale3.Scale = 0
uiScale3.Parent = frame5
local uiCorner4 = Instance.new("UICorner")
uiCorner4.CornerRadius = UDim.new(0, 14)
uiCorner4.Parent = frame5
local uiStroke5 = Instance.new("UIStroke")
uiStroke5.Color = tbl.Stroke
uiStroke5.Thickness = 1.8
uiStroke5.Transparency = 0.2
uiStroke5.Parent = frame5
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, -20, 0, 28)
textLabel.Position = UDim2.new(0, 10, 0, 10)
textLabel.BackgroundTransparency = 1
textLabel.Text = "RuzHub says:"
textLabel.TextColor3 = Color3.fromRGB(240, 30, 50)
textLabel.TextSize = 14
textLabel.Font = Enum.Font.ArialBold
textLabel.TextXAlignment = Enum.TextXAlignment.Left
textLabel.ZIndex = 21
textLabel.Parent = frame5
local textLabel2 = Instance.new("TextLabel")
textLabel2.Size = UDim2.new(1, -20, 0, 34)
textLabel2.Position = UDim2.new(0, 10, 0, 36)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "Are you sure you want to close this script?"
textLabel2.TextColor3 = Color3.fromRGB(220, 220, 220)
textLabel2.TextSize = 13
textLabel2.Font = Enum.Font.Arial
textLabel2.TextXAlignment = Enum.TextXAlignment.Left
textLabel2.TextWrapped = true
textLabel2.ZIndex = 21
textLabel2.Parent = frame5
local frame6 = Instance.new("Frame")
frame6.Size = UDim2.new(1, -20, 0, 1)
frame6.Position = UDim2.new(0, 10, 0, 76)
frame6.BackgroundColor3 = tbl.Stroke
frame6.BackgroundTransparency = 0.6
frame6.BorderSizePixel = 0
frame6.ZIndex = 21
frame6.Parent = frame5

do
	local textButton5 = Instance.new("TextButton")
	textButton5.Size = UDim2.new(0, 110, 0, 30)
	textButton5.Position = UDim2.new(0.5, -120, 1, -40)
	textButton5.BackgroundColor3 = Color3.fromRGB(160, 15, 25)
	textButton5.BackgroundTransparency = 0.2
	textButton5.BorderSizePixel = 0
	textButton5.Text = "Yes, close"
	textButton5.TextColor3 = tbl.White
	textButton5.TextSize = 13
	textButton5.Font = Enum.Font.ArialBold
	textButton5.ZIndex = 22
	textButton5.Parent = frame5
	local uiCorner5 = Instance.new("UICorner")
	uiCorner5.CornerRadius = UDim.new(0, 7)
	uiCorner5.Parent = textButton5
	local uiStroke6 = Instance.new("UIStroke")
	uiStroke6.Color = tbl.AccentBright
	uiStroke6.Thickness = 1.2
	uiStroke6.Transparency = 0.3
	uiStroke6.Parent = textButton5
	local textButton6 = Instance.new("TextButton")
	textButton6.Size = UDim2.new(0, 110, 0, 30)
	textButton6.Position = UDim2.new(0.5, 10, 1, -40)
	textButton6.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	textButton6.BackgroundTransparency = 0.2
	textButton6.BorderSizePixel = 0
	textButton6.Text = "Cancel"
	textButton6.TextColor3 = Color3.fromRGB(200, 200, 200)
	textButton6.TextSize = 13
	textButton6.Font = Enum.Font.ArialBold
	textButton6.ZIndex = 22
	textButton6.Parent = frame5
	local uiCorner6 = Instance.new("UICorner")
	uiCorner6.CornerRadius = UDim.new(0, 7)
	uiCorner6.Parent = textButton6
	local uiStroke7 = Instance.new("UIStroke")
	uiStroke7.Color = Color3.fromRGB(100, 100, 100)
	uiStroke7.Thickness = 1.2
	uiStroke7.Transparency = 0.4
	uiStroke7.Parent = textButton6
	local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local flag20 = false
	local tbl8 = {}

	local function fn19()
		textButton4.Visible = true
	end

	local function fn20()
		textButton4.Visible = false
	end

	local function fn21()
		for k, v5 in pairs(tbl2) do
			tbl8[k] = v5.CanvasPosition
		end
	end

	local function fn22()
		for k, v5 in pairs(tbl2) do
			if tbl8[k] then
				v5.CanvasPosition = tbl8[k]
			end
		end
	end

	local function fn23()
		flag20 = true
		fn21()

		if chListOpen then
			chListOpen = false
			chList.Visible = false
		end

		TweenService:Create(uiScale, tweenInfo, { Scale = 0 }):Play()
		TweenService:Create(uiStroke, tweenInfo, { Transparency = 1 }):Play()
		task.wait(0.3)
		frame.Visible = false
		fn19()
	end

	local function fn24()
		flag20 = false
		fn20()
		frame.Visible = true
		uiScale.Scale = 0
		TweenService:Create(uiScale, tweenInfo, { Scale = n2 }):Play()
		TweenService:Create(uiStroke, tweenInfo, { Transparency = 0.25 }):Play()
		task.defer(fn22)
	end

	textButton2.MouseButton1Click:Connect(function()
		sound:Play()

		if not flag20 then
			fn23()
		end
	end)

	textButton4.MouseButton1Click:Connect(function()
		sound:Play()
		fn24()
	end)

	local function fn25()
		frame5.Visible = true
		uiScale3.Scale = 0
		TweenService:Create(uiScale3, tweenInfo2, { Scale = 1 }):Play()
	end

	local function fn26()
		TweenService:Create(uiScale3, tweenInfo, { Scale = 0 }):Play()
		task.wait(0.25)
		frame5.Visible = false
	end

	textButton.MouseButton1Click:Connect(function()
		sound:Play()
		fn25()
	end)

	textButton5.MouseButton1Click:Connect(function()
		sound:Play()
		screenGui:Destroy()
	end)

	textButton6.MouseButton1Click:Connect(function()
		sound:Play()
		fn26()
	end)

	local function fn27(arg, backgroundColor3, backgroundColor32)
		arg.MouseEnter:Connect(function()
			arg.BackgroundColor3 = backgroundColor3
			arg.BackgroundTransparency = 0.1
		end)

		arg.MouseLeave:Connect(function()
			arg.BackgroundColor3 = backgroundColor32
			arg.BackgroundTransparency = 0.3
		end)
	end

	local color2 = Color3.fromRGB
	fn27(textButton5, Color3.fromRGB(200, 20, 30), color2(160, 15, 25))
	local color3 = Color3.fromRGB
	fn27(textButton6, Color3.fromRGB(55, 55, 55), color3(30, 30, 30))
end

do
	local tweenInfo = TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local tweenInfo2 = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo3 = TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tweenInfo4 = TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
	local sound2 = Instance.new("Sound")
	sound2.SoundId = "rbxassetid://12948391899"
	sound2.Volume = 0.25
	sound2.PlaybackSpeed = 1.4
	sound2.Parent = SoundService

	textButton4.MouseEnter:Connect(function()
		sound2:Play()
		TweenService:Create(uiStroke4, tweenInfo, { Thickness = 3, Transparency = 0, Color = Color3.fromRGB(220, 35, 55) }):Play()
		TweenService:Create(textButton4, tweenInfo, { BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.05 }):Play()
		TweenService:Create(imageLabel3, tweenInfo, { ImageColor3 = Color3.fromRGB(255, 255, 255) }):Play()
		TweenService:Create(frame4, tweenInfo, { BackgroundTransparency = 0, BackgroundColor3 = Color3.fromRGB(220, 35, 55) }):Play()
		TweenService:Create(uiScale2, tweenInfo, { Scale = fn18() * 1.06 }):Play()
	end)

	textButton4.MouseLeave:Connect(function()
		TweenService:Create(uiStroke4, tweenInfo2, { Thickness = 1.8, Transparency = 0, Color = color }):Play()
		TweenService:Create(textButton4, tweenInfo2, { BackgroundColor3 = Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.2 }):Play()
		TweenService:Create(imageLabel3, tweenInfo2, { ImageColor3 = color }):Play()
		TweenService:Create(frame4, tweenInfo2, { BackgroundTransparency = 0.3, BackgroundColor3 = color }):Play()
		TweenService:Create(uiScale2, tweenInfo2, { Scale = fn18() }):Play()
	end)

	textButton4.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			TweenService:Create(uiScale2, tweenInfo3, { Scale = fn18() * 0.94 }):Play()
		end
	end)

	textButton4.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			TweenService:Create(uiScale2, tweenInfo4, { Scale = fn18() }):Play()
		end
	end)
end
