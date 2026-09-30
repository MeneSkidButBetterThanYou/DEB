-- Deobfuscated by deobf (dynamic trace)
-- source: Kaitunbossvip.lua
-- NOTE: reconstructed from observed behaviour; branches that were not taken
--       during the trace are missing and conditions are only noted in comments.
-- run status: finished
-- 593 statements recorded in 2.12s

-- [deobf] folded 66 repeated calls into 16 helper functions and 0 unrolled runs into loops
-- loadstring() of 119473 bytes: "return setmetatable({Xa=function(P,V,f,j,z,Z,q,K,n,J,u,s,l,_)if j<=22 then if j<=21 then local d,a,I,v,c=1+l,109,253,(127+u)%256,0;return 32,d,127,a,I,P[16](2),c,(v*a+I)%256,P[47],P[66],d+c;else local"
-- [deobf] removed 57 lines of the obfuscator's environment/anti-tamper probes
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local mouse = Players.LocalPlayer:GetMouse()

-- isfile("MarisHub_KeyDatav2_0.json") -> false
local function setupTextLabel(textLabel, text, r, g, b)
	textLabel.Text = text
	textLabel.TextColor3 = Color3.fromRGB(r, g, b)
end

local function tweenTextButton(textButton, duration, backgroundTransparency)
	local tween2 = TweenService:Create(textButton, TweenInfo.new(duration, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { BackgroundTransparency = backgroundTransparency })
	tween2:Play()
end

local function tweenImageLabel(imageLabel)
	local tween4 = TweenService:Create(imageLabel, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 0, 0, 0) })
	tween4:Play()
end

local function tweenImageLabel2(imageLabel)
	local tween5 = TweenService:Create(imageLabel, TweenInfo.new(0.45, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), { ImageTransparency = 1 })
	tween5:Play()
end

local function helper()
	local json = HttpService:JSONEncode({ ExpiryTime = 1790667380, IsAuthenticated = false, Key = "MarisHub_IaNAkXDcfSgv" })
	writefile("MarisHub_KeyDatav2_0.json", json)
end

local function createUICorner(offset)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, offset)
	UICorner.Parent = nil
	return UICorner
end

local function createUIStroke(r, g, b, transparency, thickness)
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = Color3.fromRGB(r, g, b)
	UIStroke.Transparency = transparency
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Thickness = thickness
	UIStroke.Parent = nil
	return UIStroke
end

local function createFrame(xOffset, yOffset, backgroundTransparency, xOffset2, yOffset2, r, g, b, uiCorner, uiStroke, parent)
	local Frame5 = Instance.new("Frame")
	Frame5.Size = UDim2.new(0, xOffset, 0, yOffset)
	Frame5.BackgroundTransparency = backgroundTransparency
	Frame5.Position = UDim2.new(0, xOffset2, 0, yOffset2)
	Frame5.ZIndex = 202
	Frame5.BorderSizePixel = 0
	Frame5.BackgroundColor3 = Color3.fromRGB(r, g, b)
	uiCorner.Parent = Frame5
	uiStroke.Parent = Frame5
	Frame5.Parent = parent
	return Frame5
end

local function createTextLabel(text, yOffset, parent)
	local TextLabel3 = Instance.new("TextLabel")
	TextLabel3.TextColor3 = Color3.fromRGB(120, 140, 180)
	TextLabel3.Text = text
	TextLabel3.Font = Enum.Font.GothamBold
	TextLabel3.BackgroundTransparency = 1
	TextLabel3.Position = UDim2.new(0, 9, 0, yOffset)
	TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel3.ZIndex = 203
	TextLabel3.TextSize = 8.5
	TextLabel3.Size = UDim2.new(0, 55, 0, 12)
	TextLabel3.Parent = parent
end

local function createTextLabel2(text, yOffset, parent)
	local TextLabel4 = Instance.new("TextLabel")
	TextLabel4.TextColor3 = Color3.fromRGB(190, 205, 240)
	TextLabel4.Text = text
	TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel4.Font = Enum.Font.Gotham
	TextLabel4.BackgroundTransparency = 1
	TextLabel4.Position = UDim2.new(0, 64, 0, yOffset)
	TextLabel4.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel4.ZIndex = 203
	TextLabel4.TextSize = 8.5
	TextLabel4.Size = UDim2.new(1, -70, 0, 12)
	TextLabel4.Parent = parent
end

local function createTextLabel3(r, b, text)
	local TextLabel10 = Instance.new("TextLabel")
	TextLabel10.TextColor3 = Color3.fromRGB(r, 220, b)
	TextLabel10.Text = text
	TextLabel10.Font = Enum.Font.GothamBold
	TextLabel10.BackgroundTransparency = 1
	TextLabel10.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel10.ZIndex = 204
	TextLabel10.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel10.TextSize = 11
	TextLabel10.Size = UDim2.new(1, 0, 1, 0)
	TextLabel10.Parent = nil
	return TextLabel10
end

local function createTextButton(yOffset, r, g, b, uiCorner, textLabel, parent)
	local TextButton = Instance.new("TextButton")
	TextButton.Text = ""
	TextButton.AutoButtonColor = false
	TextButton.BackgroundTransparency = 0.05
	TextButton.Position = UDim2.new(0, 8, 0, yOffset)
	TextButton.Size = UDim2.new(0, 164, 0, 33)
	TextButton.ZIndex = 203
	TextButton.BorderSizePixel = 0
	TextButton.BackgroundColor3 = Color3.fromRGB(r, g, b)
	uiCorner.Parent = TextButton
	textLabel.Parent = TextButton
	TextButton.Parent = parent
	return TextButton
end

local function createTextLabel4(r, g, text)
	local TextLabel15 = Instance.new("TextLabel")
	TextLabel15.ZIndex = 203
	TextLabel15.Font = Enum.Font.FredokaOne
	TextLabel15.BackgroundTransparency = 1
	TextLabel15.TextColor3 = Color3.fromRGB(r, g, 255)
	TextLabel15.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel15.Text = text
	TextLabel15.TextSize = 12
	TextLabel15.Size = UDim2.new(1, 0, 1, 0)
	TextLabel15.Parent = nil
	return TextLabel15
end

local function createTextButton2(yOffset, r, g, b, uiCorner, textLabel, parent)
	local TextButton4 = Instance.new("TextButton")
	TextButton4.ClipsDescendants = true
	TextButton4.Text = ""
	TextButton4.AutoButtonColor = false
	TextButton4.BackgroundTransparency = 0.3
	TextButton4.Position = UDim2.new(0, 198, 0, yOffset)
	TextButton4.Size = UDim2.new(0, 242, 0, 32)
	TextButton4.ZIndex = 202
	TextButton4.BorderSizePixel = 0
	TextButton4.BackgroundColor3 = Color3.fromRGB(r, g, b)
	uiCorner.Parent = TextButton4
	textLabel.Parent = TextButton4
	TextButton4.Parent = parent
	return TextButton4
end

local function createRipple(parent)
	local Ripple = Instance.new("ImageLabel")
	Ripple.ImageColor3 = Color3.fromRGB(255, 255, 255)
	Ripple.Image = "rbxassetid://266543268"
	Ripple.Name = "Ripple"
	Ripple.ImageTransparency = 0.82
	Ripple.Position = UDim2.new(0, (mouse.X - 0), 0, (mouse.Y - 0))
	Ripple.ZIndex = 207
	Ripple.BackgroundTransparency = 1
	Ripple.Size = UDim2.new(0, 0, 0, 0)
	Ripple.Parent = parent
	return Ripple
end

local function destroyRipple(textButton)
	task.spawn(function()
		textButton.ClipsDescendants = true
		local Ripple = createRipple(textButton)
		tweenImageLabel(Ripple)
		tweenImageLabel2(Ripple)
		task.wait(0.46)
		Ripple:Destroy()
	end)
end

task.spawn(function()
	local MarketplaceService = game:GetService("MarketplaceService")
	MarketplaceService:GetProductInfo(0)
	local productInfo = MarketplaceService:GetProductInfo(0)
	local KL_47856 = Instance.new("ScreenGui")
	KL_47856.Name = "KL_47856"
	KL_47856.ZIndexBehavior = Enum.ZIndexBehavior.Global
	KL_47856.ResetOnSpawn = false
	KL_47856.IgnoreGuiInset = true
	local hui = gethui()
	KL_47856.Parent = hui
	local UICorner = createUICorner(14)
	local UIStroke = createUIStroke(60, 90, 140, 0.4, 1)
	local Frame2 = Instance.new("Frame")
	Frame2.ClipsDescendants = true
	Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame2.BackgroundTransparency = 0.35
	Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame2.BackgroundColor3 = Color3.fromRGB(12, 16, 24)
	Frame2.ZIndex = 201
	Frame2.BorderSizePixel = 0
	Frame2.Size = UDim2.new(0, 225, 0, 149)
	UICorner.Parent = Frame2
	UIStroke.Parent = Frame2
	Frame2.Parent = KL_47856
	local UICorner2 = createUICorner(14)
	local Frame3 = Instance.new("Frame")
	Frame3.BackgroundTransparency = 0.5
	Frame3.Position = UDim2.new(0, 0, 0.5, 0)
	Frame3.Size = UDim2.new(1, 0, 0.5, 0)
	Frame3.ZIndex = 202
	Frame3.BorderSizePixel = 0
	Frame3.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
	Frame3.Parent = nil
	local Frame4 = Instance.new("Frame")
	Frame4.BackgroundTransparency = 0.5
	Frame4.Size = UDim2.new(1, 0, 0, 44)
	Frame4.ZIndex = 202
	Frame4.BorderSizePixel = 0
	Frame4.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
	UICorner2.Parent = Frame4
	Frame3.Parent = Frame4
	Frame4.Parent = Frame2
	local TextLabel = Instance.new("TextLabel")
	TextLabel.TextColor3 = Color3.fromRGB(220, 230, 255)
	TextLabel.Text = "Maris Hub — Key System"
	TextLabel.ZIndex = 203
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.Font = Enum.Font.FredokaOne
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel.TextSize = 14
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Parent = Frame4
	local UICorner3 = createUICorner(8)
	local UIStroke2 = createUIStroke(60, 80, 120, 0.6, 1)
	local Frame5 = createFrame(180, 76, 0.45, 8, 52, 15, 20, 30, UICorner3, UIStroke2, Frame2)
	local TextLabel2 = Instance.new("TextLabel")
	TextLabel2.TextColor3 = Color3.fromRGB(130, 165, 220)
	TextLabel2.Text = "Information"
	TextLabel2.Font = Enum.Font.GothamBold
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.Position = UDim2.new(0, 9, 0, 5)
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel2.ZIndex = 203
	TextLabel2.TextSize = 9
	TextLabel2.Size = UDim2.new(1, -14, 0, 13)
	TextLabel2.Parent = Frame5
	createTextLabel("Script:", 20, Frame5)
	createTextLabel2("KaiTun Find Fruit", 20, Frame5)
	createTextLabel("Game:", 37, Frame5)
	local TextLabel6 = Instance.new("TextLabel")
	TextLabel6.TextColor3 = Color3.fromRGB(190, 205, 240)
	TextLabel6.Text = tostring(productInfo.Name)
	TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel6.Font = Enum.Font.Gotham
	TextLabel6.BackgroundTransparency = 1
	TextLabel6.Position = UDim2.new(0, 64, 0, 37)
	TextLabel6.TextTruncate = Enum.TextTruncate.AtEnd
	TextLabel6.ZIndex = 203
	TextLabel6.TextSize = 8.5
	TextLabel6.Size = UDim2.new(1, -70, 0, 12)
	TextLabel6.Parent = Frame5
	createTextLabel("Version:", 54, Frame5)
	createTextLabel2("v2.0", 54, Frame5)
	local UICorner4 = createUICorner(8)
	local UIStroke3 = createUIStroke(60, 80, 120, 0.6, 1)
	local Frame6 = createFrame(180, 150, 0.45, 8, 134, 15, 20, 30, UICorner4, UIStroke3, Frame2)
	local TextLabel9 = Instance.new("TextLabel")
	TextLabel9.TextColor3 = Color3.fromRGB(255, 210, 80)
	TextLabel9.Text = "Community"
	TextLabel9.Font = Enum.Font.GothamBold
	TextLabel9.BackgroundTransparency = 1
	TextLabel9.Position = UDim2.new(0, 9, 0, 5)
	TextLabel9.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel9.ZIndex = 203
	TextLabel9.TextSize = 9.5
	TextLabel9.Size = UDim2.new(1, -14, 0, 13)
	TextLabel9.Parent = Frame6
	local UICorner5 = createUICorner(6)
	local TextLabel10 = createTextLabel3(255, 220, "Youtube")
	local TextButton = createTextButton(25, 139, 21, 21, UICorner5, TextLabel10, Frame6)
	local UICorner6 = createUICorner(6)
	local TextLabel11 = createTextLabel3(200, 255, "Discord")
	local TextButton2 = createTextButton(64, 18, 52, 140, UICorner6, TextLabel11, Frame6)
	local UICorner7 = createUICorner(6)
	local TextLabel12 = createTextLabel3(220, 220, "Tiktok")
	local TextButton3 = createTextButton(103, 20, 22, 28, UICorner7, TextLabel12, Frame6)
	local UICorner8 = createUICorner(7)
	local UIStroke4 = createUIStroke(60, 140, 90, 0.5, 1)
	local Frame7 = createFrame(242, 44, 0.45, 198, 52, 15, 20, 30, UICorner8, UIStroke4, Frame2)
	local TextLabel13 = Instance.new("TextLabel")
	TextLabel13.TextWrapped = true
	TextLabel13.TextColor3 = Color3.fromRGB(140, 230, 170)
	TextLabel13.Text = "Get Key from Get Key 1 or Get Key 2,\nthen enter your key below."
	TextLabel13.ZIndex = 203
	TextLabel13.Font = Enum.Font.Gotham
	TextLabel13.BackgroundTransparency = 1
	TextLabel13.Position = UDim2.new(0, 10, 0, 0)
	TextLabel13.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel13.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel13.TextSize = 9.5
	TextLabel13.Size = UDim2.new(1, -20, 1, 0)
	TextLabel13.Parent = Frame7
	local UICorner9 = createUICorner(8)
	local UIStroke5 = createUIStroke(90, 110, 180, 0.4, 1.2)
	local Frame8 = createFrame(242, 36, 0.35, 198, 102, 10, 12, 18, UICorner9, UIStroke5, Frame2)
	local TextBox = Instance.new("TextBox")
	TextBox.TextColor3 = Color3.fromRGB(240, 230, 255)
	TextBox.Text = ""
	TextBox.ZIndex = 203
	TextBox.ClearTextOnFocus = false
	TextBox.TextXAlignment = Enum.TextXAlignment.Center
	TextBox.Font = Enum.Font.GothamBold
	TextBox.BackgroundTransparency = 1
	TextBox.PlaceholderColor3 = Color3.fromRGB(120, 130, 160)
	TextBox.Position = UDim2.new(0, 10, 0, 0)
	TextBox.PlaceholderText = "Enter key here..."
	TextBox.TextSize = 11
	TextBox.Size = UDim2.new(1, -20, 1, 0)
	TextBox.Parent = Frame8
	local TextLabel14 = Instance.new("TextLabel")
	TextLabel14.TextColor3 = Color3.fromRGB(175, 155, 210)
	TextLabel14.Text = ""
	TextLabel14.ZIndex = 202
	TextLabel14.Font = Enum.Font.GothamBold
	TextLabel14.BackgroundTransparency = 1
	TextLabel14.Position = UDim2.new(0, 198, 0, 266)
	TextLabel14.TextXAlignment = Enum.TextXAlignment.Center
	TextLabel14.TextYAlignment = Enum.TextYAlignment.Center
	TextLabel14.TextSize = 11
	TextLabel14.Size = UDim2.new(0, 242, 0, 16)
	TextLabel14.Parent = Frame2

	TextButton.MouseButton1Click:Connect(function()
		setclipboard("https://www.youtube.com/@godhnam")
		setupTextLabel(TextLabel14, "Copied YouTube Link!", 80, 230, 130)
	end)

	TextButton2.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/YdfMPtCYn2")
		setupTextLabel(TextLabel14, "Copied Discord Link!", 80, 230, 130)
	end)

	TextButton3.MouseButton1Click:Connect(function()
		setclipboard("https://www.tiktok.com/@xneomixi")
		setupTextLabel(TextLabel14, "Copied TikTok Link!", 80, 230, 130)
	end)

	local UICorner10 = createUICorner(7)
	local TextLabel15 = createTextLabel4(210, 170, "Enter Key")
	local TextButton4 = createTextButton2(144, 55, 20, 120, UICorner10, TextLabel15, Frame2)

	TextButton4.MouseEnter:Connect(function()
		tweenTextButton(TextButton4, 0.12, 0.1)
	end)

	TextButton4.MouseLeave:Connect(function()
		tweenTextButton(TextButton4, 0.16, 0.3)
	end)

	TextButton4.MouseButton1Click:Connect(function()
		destroyRipple(TextButton4)
		setupTextLabel(TextLabel14, "Key Expired / Get New Key!", 255, 90, 110)
	end)

	local UICorner11 = createUICorner(7)
	local TextLabel16 = createTextLabel4(190, 150, "GET KEY 1")
	local TextButton5 = createTextButton2(182, 40, 20, 85, UICorner11, TextLabel16, Frame2)

	TextButton5.MouseEnter:Connect(function()
		tweenTextButton(TextButton5, 0.12, 0.1)
	end)

	TextButton5.MouseLeave:Connect(function()
		tweenTextButton(TextButton5, 0.16, 0.3)
	end)

	TextButton5.MouseButton1Click:Connect(function()
		destroyRipple(TextButton5)
		setupTextLabel(TextLabel14, "Generating Link 1...", 190, 170, 255)
		helper()
		local encoded = HttpService:UrlEncode("https://keymarishub.netlify.app/?ma=MarisHub_IaNAkXDcfSgv")
		local response = game:HttpGet("https://link4m.co/api-shorten/v2?api=" .. "660c15973c85e2004735b1f2" .. "&url=" .. encoded)
		local data = HttpService:JSONDecode(response)
		setclipboard(data.shortenedUrl)
		setupTextLabel(TextLabel14, "Copied Link 1!", 80, 230, 130)
	end)

	local UICorner12 = createUICorner(7)
	local TextLabel17 = createTextLabel4(130, 190, "GET KEY 2")
	local TextButton6 = createTextButton2(220, 15, 45, 90, UICorner12, TextLabel17, Frame2)

	TextButton6.MouseEnter:Connect(function()
		tweenTextButton(TextButton6, 0.12, 0.1)
	end)

	TextButton6.MouseLeave:Connect(function()
		tweenTextButton(TextButton6, 0.16, 0.3)
	end)

	TextButton6.MouseButton1Click:Connect(function()
		destroyRipple(TextButton6)
		setupTextLabel(TextLabel14, "Generating Link 2...", 190, 170, 255)
		helper()
		local encoded2 = HttpService:UrlEncode("https://keymarishub.netlify.app/?ma=MarisHub_IaNAkXDcfSgv")
		local response2 = game:HttpGet("https://bbmkts.com/dapi?token=" .. "664ca06fae50ed48496de861" .. "&longurl=" .. encoded2 .. "&format=text")
		setclipboard(string.gsub(response2, "^%s*(.-)%s*$", "%1"))
		setupTextLabel(TextLabel14, "Copied Link 2!", 80, 230, 130)
	end)

	local tween = TweenService:Create(Frame2, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { BackgroundTransparency = 0.35, Size = UDim2.new(0, 450, 0, 298) })
	tween:Play()
	task.wait(0.08)
	task.wait(0.08)
	-- [envlog] the statements above repeat forever (loop)
end)
