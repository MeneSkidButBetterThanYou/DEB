-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

local n = 86400
local str = "660c15973c85e2004735b1f2"
local str2 = "https://keymarishub.netlify.app/"
local str3 = "664ca06fae50ed48496de861"
local str4 = "https://keymarishub.netlify.app/"
local tbl = { Key = "", ExpiryTime = 0, IsAuthenticated = false }
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
game:GetService("UserInputService")
local mouse = Players.LocalPlayer:GetMouse()

local function fn()
	if writefile and readfile and isfile and isfile("MarisHub_KeyDatav2_0.json") then
		local ok, result = pcall(function()
			return HttpService:JSONDecode(readfile("MarisHub_KeyDatav2_0.json"))
		end)

		if ok and result then
			tbl = result
		end
	end
end

local function fn2()
	if writefile then
		pcall(function()
			writefile("MarisHub_KeyDatav2_0.json", HttpService:JSONEncode(tbl))
		end)
	end
end

fn()

local function fn3()
	print("SUCCESS! Key Verified. Loading Main Script...")

	local ok, result = pcall(function()
		loadstring(game:HttpGet("https://pastefy.app/VA8djTJo/raw"))()
	end)

	if not ok then
		warn("Failed to load main script: " .. tostring(result))
	end
end

local flag = tbl.Key ~= ""

if flag then
	local expiryTime = tbl.ExpiryTime
	flag = os.time() < expiryTime
end

if flag and tbl.IsAuthenticated then
	fn3()
	return
end

local function fn4()
	math.randomseed(os.time())
	local str5 = ""

	for i = 1, 12 do
		local n2 = math.random(1, 62)
		str5 ..= ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"):sub(n2, n2)
	end

	tbl.Key = "MarisHub_" .. str5
	tbl.ExpiryTime = os.time() + n
	tbl.IsAuthenticated = false
	fn2()
	return tbl.Key
end

local function fn5()
	local str5 = str2 .. "?ma=" .. fn4()
	local str6 = "https://link4m.co/api-shorten/v2?api=" .. str .. "&url=" .. HttpService:UrlEncode(str5)

	local ok, result = pcall(function()
		return HttpService:JSONDecode(game:HttpGet(str6))
	end)

	if ok and result and result.status ~= "error" then
		return result.shortenedUrl
	end
	return str5
end

local function fn6()
	local str5 = str4 .. "?ma=" .. fn4()
	local str6 = "https://bbmkts.com/dapi?token=" .. str3 .. "&longurl=" .. HttpService:UrlEncode(str5) .. "&format=text"

	local ok, result = pcall(function()
		return game:HttpGet(str6)
	end)

	if ok and result and result ~= "" then
		return string.gsub(result, "^%s*(.-)%s*$", "%1")
	end
	return str5
end

local function fn7(arg, arg2, arg3, arg4, arg5)
	TweenService:Create(arg, TweenInfo.new(arg3, arg4 or Enum.EasingStyle.Quint, arg5 or Enum.EasingDirection.Out), arg2):Play()
end

local function fn8(arg)
	local genv = getgenv and getgenv() or _G

	if genv.HIDEUI then
		arg.Parent = genv.HIDEUI
	elseif gethui then
		arg.Parent = gethui()
	else
		arg.Parent = game:GetService("CoreGui")
	end
end

local function fn9(arg, arg2, arg3)
	local instance = Instance.new(arg)

	for k, v in pairs(arg2) do
		if k ~= "Children" and k ~= "Parent" then
			pcall(function()
				instance[k] = v
			end)
		end
	end

	if arg2.Children then
		for _, child in ipairs(arg2.Children) do
			pcall(function()
				child.Parent = instance
			end)
		end
	end

	instance.Parent = arg2.Parent or arg3
	return instance
end

local function fn10(arg, arg2, arg3)
	task.spawn(function()
		arg.ClipsDescendants = true
		local n2 = arg2 - arg.AbsolutePosition.X
		local n3 = arg3 - arg.AbsolutePosition.Y
		local n4 = math.max(arg.AbsoluteSize.X, arg.AbsoluteSize.Y) * 1.6

		local ImageLabel = fn9("ImageLabel", {
			Name = "Ripple",
			Image = "rbxassetid://266543268",
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ImageTransparency = 0.82,
			BackgroundTransparency = 1,
			ZIndex = arg.ZIndex + 5,
			Size = UDim2.new(0, 0, 0, 0),
			Position = UDim2.new(0, n2, 0, n3),
		}, arg)

		fn7(ImageLabel, { Size = UDim2.new(0, n4, 0, n4), Position = UDim2.new(0.5, -n4 / 2, 0.5, -n4 / 2) }, 0.45, Enum.EasingStyle.Quad)
		fn7(ImageLabel, { ImageTransparency = 1 }, 0.45, Enum.EasingStyle.Linear)
		task.wait(0.46)
		ImageLabel:Destroy()
	end)
end

local function fn11()
	local flag2 = false
	local flag3 = false
	local tbl2 = {}
	local tbl3 = { label = "Script", value = "KaiTun Find Fruit" }

	local tbl4 = {
		label = "Game",
		value = pcall(function()
			return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
		end) and game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown",
	}

	tbl2[1] = tbl3
	tbl2[2] = tbl4
	tbl2[3] = { label = "Version", value = "v2.0" }
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "KL_" .. tostring(math.random(1000000))
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
	screenGui.ResetOnSpawn = false
	screenGui.IgnoreGuiInset = true
	fn8(screenGui)
	local n2 = 450
	local n3 = 298
	local v = fn9

	local tbl5 = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, n2 * 0.5, 0, n3 * 0.5),
		BackgroundColor3 = Color3.fromRGB(12, 16, 24),
		BackgroundTransparency = 0.35,
		BorderSizePixel = 0,
		ZIndex = 201,
		ClipsDescendants = true,
		Parent = screenGui,
	}

	local children = {}
	local UICorner = fn9("UICorner", { CornerRadius = UDim.new(0, 14) })
	local v2 = fn9

	local tbl6 = {
		Color = Color3.fromRGB(60, 90, 140),
		Transparency = 0.4,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	children[1] = UICorner

	do
		local values = table.pack(v2("UIStroke", tbl6))
		table.move(values, 1, values.n, 2, children)
	end

	tbl5.Children = children
	local Frame = v("Frame", tbl5)
	local v3 = fn9

	local tbl7 = {
		BackgroundColor3 = Color3.fromRGB(15, 20, 30),
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 44),
		ZIndex = 202,
		Parent = Frame,
	}

	local children2 = {}
	local UICorner2 = fn9("UICorner", { CornerRadius = UDim.new(0, 14) })
	local v4 = fn9

	local tbl8 = {
		BackgroundColor3 = Color3.fromRGB(15, 20, 30),
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0.5, 0),
		ZIndex = 202,
	}

	children2[1] = UICorner2

	do
		local values = table.pack(v4("Frame", tbl8))
		table.move(values, 1, values.n, 2, children2)
	end

	tbl7.Children = children2
	local Frame2 = v3("Frame", tbl7)

	fn9("TextLabel", {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.FredokaOne,
		Text = "Maris Hub — Key System",
		TextColor3 = Color3.fromRGB(220, 230, 255),
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 203,
		Parent = Frame2,
	})

	local n4 = n2 - 198 - 10
	local v5 = fn9

	local tbl9 = {
		BackgroundColor3 = Color3.fromRGB(15, 20, 30),
		BackgroundTransparency = 0.45,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 52),
		Size = UDim2.new(0, 180, 0, 76),
		ZIndex = 202,
		Parent = Frame,
	}

	local children3 = {}
	local UICorner3 = fn9("UICorner", { CornerRadius = UDim.new(0, 8) })
	local v6 = fn9

	local tbl10 = {
		Color = Color3.fromRGB(60, 80, 120),
		Transparency = 0.6,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	children3[1] = UICorner3

	do
		local values = table.pack(v6("UIStroke", tbl10))
		table.move(values, 1, values.n, 2, children3)
	end

	tbl9.Children = children3
	local Frame3 = v5("Frame", tbl9)

	fn9("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 9, 0, 5),
		Size = UDim2.new(1, -14, 0, 13),
		Font = Enum.Font.GothamBold,
		Text = "Information",
		TextColor3 = Color3.fromRGB(130, 165, 220),
		TextSize = 9,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 203,
		Parent = Frame3,
	})

	local n5 = 20

	for _, v7 in ipairs(tbl2) do
		fn9("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 9, 0, n5),
			Size = UDim2.new(0, 55, 0, 12),
			Font = Enum.Font.GothamBold,
			Text = (v7.label or "") .. ":",
			TextColor3 = Color3.fromRGB(120, 140, 180),
			TextSize = 8.5,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 203,
			Parent = Frame3,
		})

		fn9("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 64, 0, n5),
			Size = UDim2.new(1, -70, 0, 12),
			Font = Enum.Font.Gotham,
			Text = tostring(v7.value or ""),
			TextColor3 = Color3.fromRGB(190, 205, 240),
			TextSize = 8.5,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 203,
			Parent = Frame3,
		})

		n5 += 17
	end

	local v7 = fn9

	local tbl11 = {
		BackgroundColor3 = Color3.fromRGB(15, 20, 30),
		BackgroundTransparency = 0.45,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 134),
		Size = UDim2.new(0, 180, 0, 150),
		ZIndex = 202,
		Parent = Frame,
	}

	local children4 = {}
	local UICorner4 = fn9("UICorner", { CornerRadius = UDim.new(0, 8) })
	local v8 = fn9

	local tbl12 = {
		Color = Color3.fromRGB(60, 80, 120),
		Transparency = 0.6,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	children4[1] = UICorner4

	do
		local values = table.pack(v8("UIStroke", tbl12))
		table.move(values, 1, values.n, 2, children4)
	end

	tbl11.Children = children4
	local Frame4 = v7("Frame", tbl11)

	fn9("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 9, 0, 5),
		Size = UDim2.new(1, -14, 0, 13),
		Font = Enum.Font.GothamBold,
		Text = "Community",
		TextColor3 = Color3.fromRGB(255, 210, 80),
		TextSize = 9.5,
		TextXAlignment = Enum.TextXAlignment.Center,
		ZIndex = 203,
		Parent = Frame4,
	})

	local v9 = fn9

	local tbl13 = {
		BackgroundColor3 = Color3.fromRGB(139, 21, 21),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 25),
		Size = UDim2.new(0, 164, 0, 33),
		AutoButtonColor = false,
		Text = "",
		ZIndex = 203,
		Parent = Frame4,
	}

	local children5 = {}
	local UICorner5 = fn9("UICorner", { CornerRadius = UDim.new(0, 6) })
	local v10 = fn9

	local tbl14 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.GothamBold,
		Text = "Youtube",
		TextColor3 = Color3.fromRGB(255, 220, 220),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 204,
	}

	children5[1] = UICorner5

	do
		local values = table.pack(v10("TextLabel", tbl14))
		table.move(values, 1, values.n, 2, children5)
	end

	tbl13.Children = children5
	local TextButton = v9("TextButton", tbl13)
	local v11 = fn9

	local tbl15 = {
		BackgroundColor3 = Color3.fromRGB(18, 52, 140),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 64),
		Size = UDim2.new(0, 164, 0, 33),
		AutoButtonColor = false,
		Text = "",
		ZIndex = 203,
		Parent = Frame4,
	}

	local children6 = {}
	local UICorner6 = fn9("UICorner", { CornerRadius = UDim.new(0, 6) })
	local v12 = fn9

	local tbl16 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.GothamBold,
		Text = "Discord",
		TextColor3 = Color3.fromRGB(200, 220, 255),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 204,
	}

	children6[1] = UICorner6

	do
		local values = table.pack(v12("TextLabel", tbl16))
		table.move(values, 1, values.n, 2, children6)
	end

	tbl15.Children = children6
	local TextButton2 = v11("TextButton", tbl15)
	local v13 = fn9

	local tbl17 = {
		BackgroundColor3 = Color3.fromRGB(20, 22, 28),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 8, 0, 103),
		Size = UDim2.new(0, 164, 0, 33),
		AutoButtonColor = false,
		Text = "",
		ZIndex = 203,
		Parent = Frame4,
	}

	local children7 = {}
	local UICorner7 = fn9("UICorner", { CornerRadius = UDim.new(0, 6) })
	local v14 = fn9

	local tbl18 = {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Font = Enum.Font.GothamBold,
		Text = "Tiktok",
		TextColor3 = Color3.fromRGB(220, 220, 220),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 204,
	}

	children7[1] = UICorner7

	do
		local values = table.pack(v14("TextLabel", tbl18))
		table.move(values, 1, values.n, 2, children7)
	end

	tbl17.Children = children7
	local TextButton3 = v13("TextButton", tbl17)
	local v15 = fn9

	local tbl19 = {
		BackgroundColor3 = Color3.fromRGB(15, 20, 30),
		BackgroundTransparency = 0.45,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 198, 0, 52),
		Size = UDim2.new(0, n4, 0, 44),
		ZIndex = 202,
		Parent = Frame,
	}

	local children8 = {}
	local UICorner8 = fn9("UICorner", { CornerRadius = UDim.new(0, 7) })
	local v16 = fn9

	local tbl20 = {
		Color = Color3.fromRGB(60, 140, 90),
		Transparency = 0.5,
		Thickness = 1,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	children8[1] = UICorner8

	do
		local values = table.pack(v16("UIStroke", tbl20))
		table.move(values, 1, values.n, 2, children8)
	end

	tbl19.Children = children8
	local Frame5 = v15("Frame", tbl19)

	fn9("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 10, 0, 0),
		Size = UDim2.new(1, -20, 1, 0),
		Font = Enum.Font.Gotham,
		TextColor3 = Color3.fromRGB(140, 230, 170),
		TextSize = 9.5,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 203,
		Text = "Get Key from Get Key 1 or Get Key 2,\nthen enter your key below.",
		Parent = Frame5,
	})

	local v17 = fn9

	local tbl21 = {
		BackgroundColor3 = Color3.fromRGB(10, 12, 18),
		BackgroundTransparency = 0.35,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 198, 0, 102),
		Size = UDim2.new(0, n4, 0, 36),
		ZIndex = 202,
		Parent = Frame,
	}

	local children9 = {}
	local UICorner9 = fn9("UICorner", { CornerRadius = UDim.new(0, 8) })
	local v18 = fn9

	local tbl22 = {
		Color = Color3.fromRGB(90, 110, 180),
		Transparency = 0.4,
		Thickness = 1.2,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}

	children9[1] = UICorner9

	do
		local values = table.pack(v18("UIStroke", tbl22))
		table.move(values, 1, values.n, 2, children9)
	end

	tbl21.Children = children9
	local Frame6 = v17("Frame", tbl21)

	local TextBox = fn9("TextBox", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 10, 0, 0),
		Size = UDim2.new(1, -20, 1, 0),
		Font = Enum.Font.GothamBold,
		PlaceholderText = "Enter key here...",
		PlaceholderColor3 = Color3.fromRGB(120, 130, 160),
		Text = "",
		TextColor3 = Color3.fromRGB(240, 230, 255),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		ClearTextOnFocus = false,
		ZIndex = 203,
		Parent = Frame6,
	})

	local TextLabel = fn9("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 198, 0, 266),
		Size = UDim2.new(0, n4, 0, 16),
		Font = Enum.Font.GothamBold,
		Text = "",
		TextColor3 = Color3.fromRGB(175, 155, 210),
		TextSize = 11,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 202,
		Parent = Frame,
	})

	local function fn12(text, textColor3)
		TextLabel.Text = text
		TextLabel.TextColor3 = textColor3 or Color3.fromRGB(175, 155, 210)
	end

	TextButton.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard("https://www.youtube.com/@godhnam")
			fn12("Copied YouTube Link!", Color3.fromRGB(80, 230, 130))
		else
			fn12("Clipboard not supported.", Color3.fromRGB(255, 90, 110))
		end
	end)

	TextButton2.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard("https://discord.gg/YdfMPtCYn2")
			fn12("Copied Discord Link!", Color3.fromRGB(80, 230, 130))
		else
			fn12("Clipboard not supported.", Color3.fromRGB(255, 90, 110))
		end
	end)

	TextButton3.MouseButton1Click:Connect(function()
		if setclipboard then
			setclipboard("https://www.tiktok.com/@xneomixi")
			fn12("Copied TikTok Link!", Color3.fromRGB(80, 230, 130))
		else
			fn12("Clipboard not supported.", Color3.fromRGB(255, 90, 110))
		end
	end)

	local function fn13()
		fn7(Frame, { Size = UDim2.new(0, n2 * 0.65, 0, n3 * 0.65), BackgroundTransparency = 0.75 }, 0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

		task.delay(0.22, function()
			screenGui:Destroy()
			flag2 = true
		end)
	end

	local function fn14(arg, arg2, arg3, arg4, arg5, arg6)
		local v19 = fn9

		local tbl23 = {
			BackgroundColor3 = arg4,
			BackgroundTransparency = 0.3,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 198, 0, arg2),
			Size = UDim2.new(0, n4, 0, arg3),
			AutoButtonColor = false,
			Text = "",
			ClipsDescendants = true,
			ZIndex = 202,
			Parent = Frame,
		}

		local children10 = {}
		local UICorner10 = fn9("UICorner", { CornerRadius = UDim.new(0, 7) })
		local v20 = fn9

		local tbl24 = {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.FredokaOne,
			Text = arg,
			TextColor3 = arg5,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Center,
			ZIndex = 203,
		}

		children10[1] = UICorner10

		do
			local values = table.pack(v20("TextLabel", tbl24))
			table.move(values, 1, values.n, 2, children10)
		end

		tbl23.Children = children10
		local TextButton4 = v19("TextButton", tbl23)

		TextButton4.MouseEnter:Connect(function()
			fn7(TextButton4, { BackgroundTransparency = 0.1 }, 0.12)
		end)

		TextButton4.MouseLeave:Connect(function()
			fn7(TextButton4, { BackgroundTransparency = 0.3 }, 0.16)
		end)

		TextButton4.MouseButton1Click:Connect(function()
			fn10(TextButton4, mouse.X, mouse.Y)
			arg6()
		end)

		return TextButton4
	end

	fn14("Enter Key", 144, 32, Color3.fromRGB(55, 20, 120), Color3.fromRGB(210, 170, 255), function()
		local v19 = string.gsub(TextBox.Text, "^%s*(.-)%s*$", "%1")
		local flag4 = tbl.Key ~= ""

		if flag4 then
			local expiryTime = tbl.ExpiryTime
			flag4 = os.time() < expiryTime
		end

		if flag4 then
			if v19 == tbl.Key then
				tbl.IsAuthenticated = true
				fn2()
				fn12("SUCCESS! Key Verified.", Color3.fromRGB(80, 230, 130))
				flag3 = true
				task.wait(0.8)
				fn13()
			else
				fn12("Wrong Key!", Color3.fromRGB(255, 90, 110))
			end
		else
			fn12("Key Expired / Get New Key!", Color3.fromRGB(255, 90, 110))
		end
	end)

	fn14("GET KEY 1", 182, 32, Color3.fromRGB(40, 20, 85), Color3.fromRGB(190, 150, 255), function()
		if setclipboard then
			fn12("Generating Link 1...", Color3.fromRGB(190, 170, 255))
			local v19 = fn5()
			setclipboard(v19)
			fn12("Copied Link 1!", Color3.fromRGB(80, 230, 130))
		else
			fn12("Clipboard not supported.", Color3.fromRGB(255, 90, 110))
		end
	end)

	fn14("GET KEY 2", 220, 32, Color3.fromRGB(15, 45, 90), Color3.fromRGB(130, 190, 255), function()
		if setclipboard then
			fn12("Generating Link 2...", Color3.fromRGB(190, 170, 255))
			local v19 = fn6()
			setclipboard(v19)
			fn12("Copied Link 2!", Color3.fromRGB(80, 230, 130))
		else
			fn12("Clipboard not supported.", Color3.fromRGB(255, 90, 110))
		end
	end)

	fn7(Frame, { Size = UDim2.new(0, 450, 0, 298), BackgroundTransparency = 0.35 }, 0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

	repeat
		task.wait(0.08)
	until flag2

	return flag3
end

task.spawn(function()
	if fn11() then
		fn3()
	end
end)
