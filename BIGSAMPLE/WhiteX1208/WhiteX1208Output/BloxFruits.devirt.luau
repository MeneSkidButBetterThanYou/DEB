-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

repeat
	wait()
until game:IsLoaded()

while true do
	wait()
	if not (game:GetService("Players") and game.Players.LocalPlayer) then
		continue
	end
	break
end

repeat
	wait()

	pcall(function()
		local v = pairs
		local v2 = getconnections
		local container = game.Players.LocalPlayer.PlayerGui["Main (minimal)"].ChooseTeam.Container
		local team = getgenv().Team and getgenv().Team or "Pirates"

		for _, v3 in v(v2(container[team].Frame.TextButton.Activated)) do
			v3.Function()
		end
	end)
until game.Players.LocalPlayer.Team ~= nil

while true do
	wait()
	if not (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		continue
	end
	break
end

local tbl = { Whitelisted = false, IsPremiumUser = false }
local fn = nil

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local tbl2 = {}
local bxor = bit32.bxor
local band = bit32.band
local lshift = bit32.lshift
local rshift = bit32.rshift
local lrotate = bit32.lrotate
local str = "NIGHTHUB|"
local n = 8
local n2 = 4
local n3 = 4294967296
local tbl3 = { 1634760805, 857760878, 2036477234, 1797285236 }

local function fn2(arg)
	local tbl4 = {}

	for i = 1, #arg, 2 do
		tbl4[#tbl4 + 1] = tonumber(arg:sub(i, i + 1), 16)
	end

	return tbl4
end

local function fn3(arg)
	local tbl4 = {}

	for i = 1, #arg do
		tbl4[i] = arg:byte(i)
	end

	return tbl4
end

local function fn4(arg)
	local tbl4 = {}

	for i = 1, #arg do
		tbl4[i] = string.char(arg[i])
	end

	return table.concat(tbl4)
end

local function fn5(arg, arg2)
	return arg[arg2] + arg[arg2 + 1] * 256 + arg[arg2 + 2] * 65536 + arg[arg2 + 3] * 16777216
end

local function fn6(arg, arg2, arg3, arg4, arg5)
	arg[arg2] = (arg[arg2] + arg[arg3]) % n3
	arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 16)
	arg[arg4] = (arg[arg4] + arg[arg5]) % n3
	arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 12)
	arg[arg2] = (arg[arg2] + arg[arg3]) % n3
	arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 8)
	arg[arg4] = (arg[arg4] + arg[arg5]) % n3
	arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 7)
end

local function fn7(arg)
	for i = 1, 10 do
		fn6(arg, 1, 5, 9, 13)
		fn6(arg, 2, 6, 10, 14)
		fn6(arg, 3, 7, 11, 15)
		fn6(arg, 4, 8, 12, 16)
		fn6(arg, 1, 6, 11, 16)
		fn6(arg, 2, 7, 12, 13)
		fn6(arg, 3, 8, 9, 14)
		fn6(arg, 4, 5, 10, 15)
	end
end

local function fn8(arg, arg2, arg3)
	local tbl4 = { tbl3[1], tbl3[2], tbl3[3], tbl3[4] }

	for i = 0, 7 do
		tbl4[5 + i] = fn5(arg, 1 + 4 * i)
	end

	tbl4[13] = arg2 % n3

	for i = 0, 2 do
		tbl4[14 + i] = fn5(arg3, 1 + 4 * i)
	end

	return tbl4
end

local function fn9(arg, arg2, arg3)
	local v = fn8(arg, arg2, arg3)
	local tbl4 = {}

	for i = 1, 16 do
		tbl4[i] = v[i]
	end

	fn7(tbl4)
	local tbl5 = {}

	for i = 1, 16 do
		local n4 = (tbl4[i] + v[i]) % n3
		local n5 = (i - 1) * 4
		tbl5[n5 + 1] = band(n4, 255)
		tbl5[n5 + 2] = band(rshift(n4, 8), 255)
		tbl5[n5 + 3] = band(rshift(n4, 16), 255)
		tbl5[n5 + 4] = band(rshift(n4, 24), 255)
	end

	return tbl5
end

local function fn10(arg, arg2, arg3, arg4)
	local tbl4 = {}
	local n4 = 0

	while n4 < arg4 do
		local v = fn9(arg, arg3, arg2)

		for i = 1, 64 do
			if not (arg4 <= n4) then
				n4 += 1
				tbl4[n4] = v[i]
				continue
			end

			break
		end

		arg3 += 1
	end

	return tbl4
end

local function fn11(arg, arg2, arg3)
	local v = fn8(arg, 4294967295, arg2)
	fn7(v)
	local n4 = #arg3

	for i = 0, n4 + (16 - n4 % 16) % 16 - 1, 16 do
		for i2 = 0, 3 do
			local n5 = i + 4 * i2
			v[i2 + 1] = bxor(v[i2 + 1], (arg3[n5 + 1] or 0) + (arg3[n5 + 2] or 0) * 256 + (arg3[n5 + 3] or 0) * 65536 + (arg3[n5 + 4] or 0) * 16777216)
		end

		fn7(v)
	end

	v[1] = bxor(v[1], n4)
	fn7(v)
	local v2 = v[1]
	local tbl4 = {}
	local v3 = band(v2, 255)
	local v4 = band(rshift(v2, 8), 255)
	local v5 = band(rshift(v2, 16), 255)
	local v6 = rshift(v2, 24)
	tbl4[1] = v3
	tbl4[2] = v4
	tbl4[3] = v5

	do
		local values = table.pack(band(v6, 255))
		table.move(values, 1, values.n, 4, tbl4)
	end

	return tbl4
end

local tbl4 = {}

local function fn12(arg)
	local str2 = table.concat(arg, ",")
	if tbl4[str2] then
		return tbl4[str2]
	end
	local v = fn10(arg, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 11259375, 128)
	local tbl5 = {}

	for i = 1, 64 do
		tbl5[i] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"):sub(i, i)
	end

	for i = 64, 2, -1 do
		local n4 = i - 1
		local n5 = (v[2 * n4 + 1] * 256 + v[2 * n4 + 2]) % i + 1
		local v2 = tbl5[i]
		tbl5[i] = tbl5[n5]
		tbl5[n5] = v2
	end

	local str3 = table.concat(tbl5)
	tbl4[str2] = str3
	return str3
end

local function fn13(arg, arg2)
	local tbl5 = {}
	local n4 = #arg
	local n5 = 1

	while n5 <= n4 do
		local v = arg[n5]
		local v2 = arg[n5 + 1]
		local v3 = arg[n5 + 2]
		local v4 = rshift(v, 2)
		tbl5[#tbl5 + 1] = arg2:sub(v4 + 1, v4 + 1)
		local n6 = lshift(band(v, 3), 4) + rshift(v2 or 0, 4)
		tbl5[#tbl5 + 1] = arg2:sub(n6 + 1, n6 + 1)

		if v2 ~= nil then
			local n7 = lshift(band(v2, 15), 2) + rshift(v3 or 0, 6)
			tbl5[#tbl5 + 1] = arg2:sub(n7 + 1, n7 + 1)

			if v3 ~= nil then
				local v5 = band(v3, 63)
				tbl5[#tbl5 + 1] = arg2:sub(v5 + 1, v5 + 1)
				n5 += 3
				continue
			end
		end

		break
	end

	return table.concat(tbl5)
end

local function fn14(arg, arg2)
	local tbl5 = {}

	for i = 1, 64 do
		tbl5[arg2:sub(i, i)] = i - 1
	end

	local tbl6 = {}

	for i = 1, #arg do
		local v = tbl5[arg:sub(i, i)]
		if v == nil then
			return nil
		end
		tbl6[#tbl6 + 1] = v
	end

	local tbl7 = {}

	for i = 1, #tbl6, 4 do
		local v = tbl6[i]
		local v2 = tbl6[i + 1]
		local v3 = tbl6[i + 2]
		local v4 = tbl6[i + 3]
		if v2 == nil then
			return nil
		end
		tbl7[#tbl7 + 1] = band(lshift(v, 2) + rshift(v2, 4), 255)

		if v3 ~= nil then
			tbl7[#tbl7 + 1] = band(lshift(band(v2, 15), 4) + rshift(v3, 2), 255)
		end

		if v4 ~= nil then
			tbl7[#tbl7 + 1] = band(lshift(band(v3, 3), 6) + v4, 255)
		end
	end

	return tbl7
end

local v = fn2("8992d555ed7846a562b058523100fbd0e59b5f6f28e98003230ffb4d9db60411")
local new = Random and Random.new and Random.new() or nil

local function fn15()
	local tbl5 = {}

	for i = 1, 8 do
		tbl5[i] = new and new:NextInteger(0, 255) or math.random(0, 255)
	end

	return tbl5
end

tbl2.encode = function(arg, arg2, arg3)
	arg2 = arg2 or v
	arg3 = arg3 or fn15()
	local v2 = fn3(arg)
	local tbl5 = {}

	for i = 1, 8 do
		tbl5[i] = arg3[i]
	end

	for i = n + 1, 12 do
		tbl5[i] = 0
	end

	local v3 = fn10(arg2, tbl5, 1, #v2)
	local tbl6 = {}

	for i = 1, #v2 do
		tbl6[i] = bxor(v2[i], v3[i])
	end

	local v4 = fn11(arg2, tbl5, tbl6)
	local tbl7 = {}

	for i = 1, 8 do
		tbl7[#tbl7 + 1] = arg3[i]
	end

	for i = 1, 4 do
		tbl7[#tbl7 + 1] = v4[i]
	end

	for i = 1, #tbl6 do
		tbl7[#tbl7 + 1] = tbl6[i]
	end

	return str .. fn13(tbl7, fn12(arg2))
end

tbl2.decode = function(arg, arg2)
	local v2 = arg2 or v
	if type(arg) ~= "string" or arg:sub(1, #str) ~= str then
		return nil, "bad prefix"
	end
	local v3 = fn14(arg:sub(#str + 1), fn12(v2))
	if not v3 or #v3 < n + n2 then
		return nil, "malformed"
	end
	local tbl5 = {}

	for i = 1, 8 do
		tbl5[i] = v3[i]
	end

	for i = n + 1, 12 do
		tbl5[i] = 0
	end

	local tbl6 = {}

	for i = n + n2 + 1, #v3 do
		tbl6[i - n - n2] = v3[i]
	end

	local v4 = fn11(v2, tbl5, tbl6)
	local n4 = 0

	for i = 1, 4 do
		n4 += v4[i] == v3[n + i] and 0 or 1
	end

	if n4 ~= 0 then
		return nil, "bad tag"
	end
	local v5 = fn10(v2, tbl5, 1, #tbl6)
	local tbl7 = {}

	for i = 1, #tbl6 do
		tbl7[i] = bxor(tbl6[i], v5[i])
	end

	return true, fn4(tbl7)
end

Loader.CheckAndJoinTeam = function()
	if LocalPlayer.Team == nil then
		repeat
			wait()
			CommF_:InvokeServer("SetTeam", "Marines")
		until LocalPlayer.Team ~= nil
	end
end

local function fn16()
	local TweenService = game:GetService("TweenService")
	local n4 = 0
	local str2 = "Noctelis/key.txt"

	local tbl5 = {
		interfaceName = "Night Hub",
		titleText = "Night Hub",
		hintText = "Enter your key to continue",
		keyInputLabelText = "License key",
		submitButtonText = "Submit Key",
		getKeyButtonText = "GET KEY",
		getKeyUrl = "https://103.69.96.168/key?ver=NightHub",
		loadingStageMessages = {
			"Authorising session",
			"Fetching components",
			"Building interface",
			"Restoring settings",
			"Finishing up",
		},
		maximumKeyLength = 50,
		savedKeyFilePath = "NightHub/key.txt",
		savedKeyCheckMessage = "Checking saved key",
		savedKeyCheckTimeoutSeconds = 15,
		validateLicenseKey = nil,
		onLicenseKeyAccepted = nil,
	}

	local function fn17(arg, arg2, arg3)
		return Color3.fromRGB(arg, arg2, arg3)
	end

	local v2 = fn17(24, 24, 26)
	local v3 = fn17(18, 18, 20)
	local v4 = fn17(237, 237, 235)
	local v5 = fn17(150, 150, 146)
	local v6 = fn17(143, 143, 139)
	local v7 = fn17(111, 140, 208)
	local v8 = fn17(214, 90, 74)
	local v9 = fn17(122, 190, 128)
	local v10 = fn17(128, 156, 220)
	local v11 = fn17(92, 117, 175)
	local v12 = fn17(58, 122, 68)
	local v13 = v7
	local v14 = fn17(255, 255, 255)
	local v15 = fn17(240, 246, 240)
	local n5 = 444
	local n6 = 354
	local n7 = 320
	local n8 = 88
	local n9 = 4
	local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local regular = Enum.FontWeight.Regular
	local bold = Enum.FontWeight.Bold

	local function fn18(arg)
		return Font.new("rbxasset://fonts/families/RobotoMono.json", arg or regular)
	end

	local function fn19(arg, arg2, parent)
		local instance = Instance.new(arg)

		for k, v16 in pairs(arg2) do
			instance[k] = v16
		end

		instance.Parent = parent
		return instance
	end

	local function fn20(arg, arg2, arg3)
		return fn19("UICorner", { Name = arg2, CornerRadius = UDim.new(0, arg) }, arg3)
	end

	local function fn21(arg, arg2)
		return fn19("UIStroke", {
			Name = arg,
			Color = fn17(255, 255, 255),
			Transparency = 0.65,
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			LineJoinMode = Enum.LineJoinMode.Round,
		}, arg2)
	end

	local function fn22(arg, arg2, arg3, arg4, arg5, arg6, arg7)
		return fn19("TextLabel", {
			Name = arg,
			Size = UDim2.new(0, arg6, 0, math.floor(arg3 * 1.2 + 0.5)),
			Position = arg5,
			BackgroundTransparency = 1,
			Text = arg2,
			TextColor3 = arg4,
			TextSize = arg3,
			FontFace = fn18(),
			TextXAlignment = Enum.TextXAlignment.Left,
		}, arg7)
	end

	local function fn23()
		local hui = gethui and gethui() or game:GetService("CoreGui")
		if syn and syn.protect_gui then
			return hui, syn.protect_gui
		end
		return hui, protect_gui
	end

	local function fn24(arg)
		return (arg:gsub("^%s+", ""):gsub("%s+$", ""))
	end

	local function fn25(arg)
		local v16 = setclipboard or toclipboard
		if type(v16) ~= "function" then
			return false
		end
		return pcall(v16, arg)
	end

	local function fn26(arg)
		local match = tbl5.savedKeyFilePath:match("^(.*)[/]")

		if match and isfolder and makefolder and not isfolder(match) then
			pcall(makefolder, match)
		end

		pcall(writefile, tbl5.savedKeyFilePath, arg)
	end

	tbl5.deleteSavedLicenseKey = function()
		if isfile and isfile(tbl5.savedKeyFilePath) then
			pcall(delfile, tbl5.savedKeyFilePath)
		end

		if isfile and isfile("Noctelis/key.txt") then
			pcall(delfile, "Noctelis/key.txt")
		end
	end

	local function fn27()
		if not (isfile and readfile) then
			return
		end
		local savedKeyFilePath = isfile(tbl5.savedKeyFilePath) and tbl5.savedKeyFilePath or isfile("Noctelis/key.txt") and "Noctelis/key.txt"
		if not savedKeyFilePath then
			return
		end
		local ok, result = pcall(readfile, savedKeyFilePath)
		if not ok or type(result) ~= "string" then
			return
		end

		if savedKeyFilePath == str2 then
			fn26(result)
		end

		local v16 = fn24(result)
		local flag = v16 ~= "" and utf8.len(v16)
		if not flag or flag > tbl5.maximumKeyLength then
			return
		end
		return v16
	end

	tbl5.destroyInterface = function()
		n4 += 1
		local v16 = fn23():FindFirstChild(tbl5.interfaceName)

		if v16 then
			v16:Destroy()
		end
	end

	tbl5.showInterface = function(arg, arg2)
		tbl5.destroyInterface()
		local v16 = n4
		local v17 = fn27()
		local flag = arg ~= nil and type(arg) ~= "string"
		local flag2 = type(arg) == "string" and fn24(arg) or nil

		if flag2 == "" then
			flag2 = nil
		end

		local flag3 = not flag and (flag2 or v17) or nil
		local v18, v19 = fn23()

		local ScreenGui = fn19("ScreenGui", {
			Name = tbl5.interfaceName,
			DisplayOrder = 10,
			IgnoreGuiInset = true,
			ResetOnSpawn = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		}, v18)

		if v19 then
			pcall(v19, ScreenGui)
		end

		local Frame = fn19("Frame", {
			Name = "Scrim",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = fn17(0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			ZIndex = 1,
		}, ScreenGui)

		local CanvasGroup = fn19("CanvasGroup", {
			Name = "Root",
			Size = UDim2.fromOffset(n5 + n9 * 4, n6 + n9 * 4),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			GroupTransparency = 1,
			ZIndex = 2,
		}, ScreenGui)

		for i = 4, 1, -1 do
			local n10 = i * 2

			local Frame2 = fn19("Frame", {
				Name = ("Aura%*"):format(i),
				Size = UDim2.new(1, n10 * 2 - n9 * 4 - 4, 1, n10 * 2 - n9 * 4 - 4),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = v7,
				BackgroundTransparency = 0.83,
				BorderSizePixel = 0,
			}, CanvasGroup)

			fn20(12 + n10, "AuraCorner", Frame2)
		end

		local Frame2 = fn19("Frame", {
			Name = "Panel",
			Size = UDim2.new(1, -n9 * 4 - 4, 1, -n9 * 4 - 4),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = v2,
			BorderSizePixel = 0,
		}, CanvasGroup)

		fn20(12, "PanelCorner", Frame2)
		fn21("PanelStroke", Frame2)
		local CanvasGroup2 = fn19("CanvasGroup", { Name = "Body", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, Frame2)
		fn22("Title", tbl5.titleText, 20, v4, UDim2.new(0, 22, 0, 22), 340, CanvasGroup2).FontFace = fn18(bold)
		fn22("Hint", tbl5.hintText, 13, v5, UDim2.new(0, 22, 0, 52), 340, CanvasGroup2)

		local TextButton = fn19("TextButton", {
			Name = "Close",
			Size = UDim2.new(0, 32, 0, 32),
			Position = UDim2.new(1, -12, 0, 18),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			Text = "",
			FontFace = fn18(),
			AutoButtonColor = false,
		}, CanvasGroup2)

		local tbl6 = {}

		for i, v20 in ipairs({ 45, -45 }) do
			tbl6[i] = fn19("Frame", {
				Name = ("Bar%*"):format(i),
				Size = UDim2.new(0, 13, 0, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = v6,
				Rotation = v20,
				BorderSizePixel = 0,
			}, TextButton)
		end

		fn19("Frame", {
			Name = "Divider",
			Size = UDim2.new(1, -44, 0, 1),
			Position = UDim2.new(0, 22, 0, 88),
			BackgroundColor3 = fn17(255, 255, 255),
			BackgroundTransparency = 0.86,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn22("Label", tbl5.keyInputLabelText, 13, v5, UDim2.new(0, 22, 0, 108), 220, CanvasGroup2)

		local Frame3 = fn19("Frame", {
			Name = "Field",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 130),
			BackgroundColor3 = v3,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn20(8, "FieldCorner", Frame3)
		local FieldStroke = fn21("FieldStroke", Frame3)

		local TextBox = fn19("TextBox", {
			Name = "Box",
			Size = UDim2.new(1, -32, 1, 0),
			Position = UDim2.new(0, 16, 0, 0),
			BackgroundTransparency = 1,
			Text = "",
			PlaceholderText = "Paste your key here",
			PlaceholderColor3 = v6,
			TextColor3 = v4,
			TextSize = 16,
			FontFace = fn18(),
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			MultiLine = false,
		}, Frame3)

		local Err = fn22("Err", "", 13, v8, UDim2.new(0, 22, 0, 192), 400, CanvasGroup2)

		local TextButton2 = fn19("TextButton", {
			Name = "Submit",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 218),
			BackgroundColor3 = v13,
			Text = "",
			FontFace = fn18(),
			AutoButtonColor = false,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn20(8, "SubmitCorner", TextButton2)

		local TextLabel = fn19("TextLabel", {
			Name = "SubmitTitle",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = tbl5.submitButtonText,
			TextColor3 = v14,
			TextSize = 18,
			FontFace = fn18(),
		}, TextButton2)

		local TextButton3 = fn19("TextButton", {
			Name = "GetKey",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 278),
			BackgroundColor3 = v13,
			Text = "",
			FontFace = fn18(),
			AutoButtonColor = false,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn20(8, "GetKeyCorner", TextButton3)

		fn19("TextLabel", {
			Name = "GetKeyTitle",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = tbl5.getKeyButtonText,
			TextColor3 = v14,
			TextSize = 18,
			FontFace = fn18(),
		}, TextButton3)

		local CanvasGroup3 = fn19("CanvasGroup", {
			Name = "Load",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 1,
			Visible = false,
		}, Frame2)

		local Step = fn22("Step", "", 14, v4, UDim2.new(0, 22, 0, 28), 190, CanvasGroup3)
		local Pct = fn22("Pct", "0%", 13, v5, UDim2.new(1, -22, 0, 29), 60, CanvasGroup3)
		Pct.AnchorPoint = Vector2.new(1, 0)
		Pct.TextXAlignment = Enum.TextXAlignment.Right

		local Frame4 = fn19("Frame", {
			Name = "Track",
			Size = UDim2.new(1, -44, 0, 2),
			Position = UDim2.new(0, 22, 0, 60),
			BackgroundColor3 = fn17(255, 255, 255),
			BackgroundTransparency = 0.88,
			BorderSizePixel = 0,
		}, CanvasGroup3)

		local Frame5 = fn19("Frame", { Name = "Fill", Size = UDim2.fromScale(0, 1), BackgroundColor3 = v7, BorderSizePixel = 0 }, Frame4)
		local tweenInfo2 = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tweenInfo3 = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		local tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

		if flag3 then
			CanvasGroup.Size = UDim2.fromOffset(n7 + n9 * 4, n8 + n9 * 4)
			CanvasGroup2.Visible = false
			CanvasGroup2.GroupTransparency = 1
			CanvasGroup3.Visible = true
			CanvasGroup3.GroupTransparency = 0
		end

		TweenService:Create(Frame, tweenInfo, { BackgroundTransparency = 0.45 }):Play()
		TweenService:Create(CanvasGroup, tweenInfo2, { GroupTransparency = 0 }):Play()

		local function fn28(arg3, arg4)
			TweenService:Create(arg3, tweenInfo, arg4):Play()
		end

		local flag4 = nil
		local flag5 = nil
		local text = nil

		local function fn29()
			return not flag5 and v16 == n4 and ScreenGui.Parent ~= nil
		end

		local function fn30()
			if not fn29() then
				return
			end
			flag5 = true
			n4 += 1
			TweenService:Create(Frame, tweenInfo3, { BackgroundTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo3, { GroupTransparency = 1 }):Play()
			task.delay(0.12, ScreenGui.Destroy, ScreenGui)
		end

		local function fn31(arg3, arg4)
			fn28(FieldStroke, { Color = arg3, Transparency = arg4, Thickness = arg4 < 0.3 and 2 or 1 })
		end

		local function fn32(text2)
			if not fn29() then
				return
			end
			local v20 = Err
			local v21 = v8
			local text3 = TextBox.Text
			Err.Text = text2
			v20.TextColor3 = v21
			text = text3
			fn31(v8, 0)
		end

		local function fn33()
			if Err.Text == "" or TextBox.Text == text then
				return
			end
			Err.Text = ""
			if TextBox:IsFocused() then
				return fn31(v7, 0)
			end
			fn31(fn17(255, 255, 255), 0.65)
		end

		local function fn34(text2)
			Step.TextTransparency = 1
			Step.Text = text2
			TweenService:Create(Step, tweenInfo2, { TextTransparency = 0 }):Play()
		end

		local function fn35(arg3, arg4, arg5)
			local now = os.clock()

			while true do
				if not fn29() then
					return
				else
					local n10 = math.min((os.clock() - now) / arg5, 1)
					local n11 = arg3 + (arg4 - arg3) * (1 - (1 - n10) ^ 2)
					Frame5.Size = UDim2.fromScale(n11, 1)
					Pct.Text = math.floor(n11 * 100) .. "%"
					if n10 >= 1 then
						break
					end
					task.wait()
				end
			end
		end

		local function fn36(arg3)
			local n10 = #tbl5.loadingStageMessages
			local n11 = 1 - arg3

			for i, loadingStageMessage in ipairs(tbl5.loadingStageMessages) do
				if not fn29() then
					return
				end
				fn34(loadingStageMessage)
				fn35(arg3 + n11 * (i - 1) / n10, arg3 + n11 * i / n10, 0.55)
			end
		end

		local function fn37(arg3, arg4)
			task.wait(0.4)
			if not fn29() then
				return
			end
			fn30()
			local v20 = n4
			task.wait(0.16)

			if v20 == n4 and tbl5.onLicenseKeyAccepted then
				task.spawn(tbl5.onLicenseKeyAccepted, arg3, arg4)
			end
		end

		local function fn38()
			CanvasGroup3.Visible = true
			TweenService:Create(CanvasGroup2, tweenInfo3, { GroupTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo4, { Size = UDim2.fromOffset(n7 + n9 * 4, n8 + n9 * 4) }):Play()
			task.wait(0.13)
			if not fn29() then
				return
			end
			CanvasGroup2.Visible = false
			task.wait(0.17)
			if not fn29() then
				return
			end
			TweenService:Create(CanvasGroup3, tweenInfo2, { GroupTransparency = 0 }):Play()
		end

		local function fn39(arg3, arg4, arg5)
			if not fn29() then
				return
			end

			if type(arg4) == "table" and arg4.shouldForgetSavedKey == true and fn27() == arg5 then
				tbl5.deleteSavedLicenseKey()
			end

			CanvasGroup2.Visible = true
			TweenService:Create(CanvasGroup3, tweenInfo3, { GroupTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo4, { Size = UDim2.fromOffset(n5 + n9 * 4, n6 + n9 * 4) }):Play()
			task.wait(0.14)
			if not fn29() then
				return
			end
			CanvasGroup3.Visible = false
			TweenService:Create(CanvasGroup2, tweenInfo2, { GroupTransparency = 0 }):Play()
			fn32(arg3)
		end

		local function fn40(arg3, arg4)
			if type(arg3) == "table" and type(arg3.message) == "string" and arg3.message ~= "" then
				return arg3.message
			end
			return arg4
		end

		local function fn41(arg3)
			local flag6 = false
			local v20 = nil
			local v21, v22

			local thread = task.spawn(function()
				local ok, result, result2 = pcall(tbl5.validateLicenseKey, arg3)
				v21 = ok
				v20 = result
				v22 = result2
				flag6 = true
			end)

			local now = os.clock()
			local n10 = math.clamp(tonumber(tbl5.savedKeyCheckTimeoutSeconds) or 15, 1, 60)

			while not flag6 and fn29() and os.clock() - now < n10 do
				task.wait()
			end

			if not flag6 then
				pcall(task.cancel, thread)
				return false, false, { message = "Key check timed out, try again", shouldForgetSavedKey = false }
			end
			return v21, v20 == true, v22
		end

		local function fn42()
			if flag4 or not fn29() then
				return
			end
			local v20 = fn24(TextBox.Text)
			if v20 == "" then
				return fn32("Enter your key first")
			end

			if type(tbl5.validateLicenseKey) ~= "function" then
				return fn32("No verifier attached")
			end
			local v21 = TextLabel
			flag4 = true
			v21.Text = "Checking..."
			fn28(TextButton2, { BackgroundColor3 = v11 })
			local v22, v23, v24 = fn41(v20)
			if not fn29() then
				return
			end
			flag4 = false

			if not v22 then
				TextLabel.Text = tbl5.submitButtonText
				fn28(TextButton2, { BackgroundColor3 = v13 })
				return fn32(fn40(v24, "Check failed, try again"))
			end

			if not v23 then
				TextLabel.Text = tbl5.submitButtonText
				fn28(TextButton2, { BackgroundColor3 = v13 })

				if type(v24) == "table" and v24.shouldForgetSavedKey == true and fn27() == v20 then
					tbl5.deleteSavedLicenseKey()
				end

				return fn32(fn40(v24, "Key not valid, check it and retry"))
			end

			local v25 = TextLabel
			flag4 = true
			v25.Text = "Verified"
			TextBox:ReleaseFocus()
			fn28(TextButton2, { BackgroundColor3 = v12 })
			fn28(TextLabel, { TextColor3 = v15 })
			fn31(v9, 0)
			fn26(v20)
			task.wait(0.35)
			if not fn29() then
				return
			end
			fn38()
			fn36(0)
			fn37(v20, v24)
		end

		local function fn43(arg3)
			if type(tbl5.validateLicenseKey) ~= "function" then
				return fn39("No verifier attached")
			end
			local n10 = #tbl5.loadingStageMessages + 1
			fn34(flag2 and "Checking configured key" or tbl5.savedKeyCheckMessage)
			fn35(0, 1 / n10, 0.5)
			if not fn29() then
				return
			end
			local v20, v21, v22 = fn41(arg3)
			if not fn29() then
				return
			end

			if not v20 then
				return fn39(fn40(v22, flag2 and "Configured key check failed" or "Saved key check failed"))
			end

			if not v21 then
				return fn39(fn40(v22, flag2 and "Configured key not valid" or "Saved key no longer valid"), v22, arg3)
			end

			if flag2 then
				if type(v22) ~= "table" or v22.valid ~= true then
					return fn39("Configured key is not valid")
				end
				fn26(arg3)
			end

			fn36(1 / n10)
			fn37(arg3, v22)
		end

		TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local v20 = utf8.len(TextBox.Text)
			if v20 and v20 > tbl5.maximumKeyLength then
				TextBox.Text = TextBox.Text:sub(1, utf8.offset(TextBox.Text, tbl5.maximumKeyLength + 1) - 1)
				return
			end
			fn33()
		end)

		TextBox.Focused:Connect(function()
			if Err.Text == "" then
				fn31(v7, 0)
			end
		end)

		TextBox.FocusLost:Connect(function(enterPressed)
			if Err.Text == "" then
				fn31(fn17(255, 255, 255), 0.65)
			end

			if enterPressed then
				fn42()
			end
		end)

		TextButton2.MouseEnter:Connect(function()
			if not flag4 then
				fn28(TextButton2, { BackgroundColor3 = v10 })
			end
		end)

		TextButton2.MouseLeave:Connect(function()
			if not flag4 then
				fn28(TextButton2, { BackgroundColor3 = v13 })
			end
		end)

		TextButton2.MouseButton1Down:Connect(function()
			if not flag4 then
				fn28(TextButton2, { BackgroundColor3 = v11 })
			end
		end)

		TextButton2.MouseButton1Click:Connect(fn42)

		TextButton3.MouseEnter:Connect(function()
			fn28(TextButton3, { BackgroundColor3 = v10 })
		end)

		TextButton3.MouseLeave:Connect(function()
			fn28(TextButton3, { BackgroundColor3 = v13 })
		end)

		TextButton3.MouseButton1Down:Connect(function()
			fn28(TextButton3, { BackgroundColor3 = v11 })
		end)

		TextButton3.MouseButton1Click:Connect(function()
			local v20 = fn25(tbl5.getKeyUrl)
			Err.Text = v20 and "Get Key link copied" or tbl5.getKeyUrl
			Err.TextColor3 = v20 and v9 or v5
			text = TextBox.Text
			fn28(TextButton3, { BackgroundColor3 = v10 })
		end)

		local text2 = "Click the cross again to close"
		local flag6 = false
		local flag7 = false

		local function fn44()
			local v20 = flag7 and v8 or flag6 and v4 or v6

			for _, v21 in ipairs(tbl6) do
				fn28(v21, { BackgroundColor3 = v20 })
			end
		end

		TextButton.MouseEnter:Connect(function()
			flag6 = true
			fn44()
		end)

		TextButton.MouseLeave:Connect(function()
			flag6 = false
			fn44()
		end)

		TextButton.MouseButton1Click:Connect(function()
			if flag7 then
				return fn30()
			end
			flag7 = true
			local v20 = Err
			local v21 = v5
			local text3 = TextBox.Text
			Err.Text = text2
			v20.TextColor3 = v21
			text = text3
			fn44()

			task.delay(10, function()
				if flag5 then
					return
				end
				flag7 = false

				if Err.Text == text2 then
					Err.Text = ""
				end

				fn44()
			end)
		end)

		if flag then
			fn32("Configured key must be a string")
		elseif flag3 then
			task.spawn(fn43, flag3)
		elseif type(arg2) == "string" and arg2 ~= "" then
			fn32(arg2)
		end

		return ScreenGui, TextBox
	end

	return tbl5
end

local HttpService = game:GetService("HttpService")
local genv = type(getgenv) == "function" and getgenv() or _G
local request_ = request or http_request or syn and syn.request
local hash = crypt and crypt.hash
local hmac = crypt and crypt.hmac
local str2 = "https://103.69.96.168"
local v2 = fn16()

local function fn17(arg, arg2, arg3)
	return false, { valid = false, code = arg, message = arg2, shouldForgetSavedKey = arg3 == true }
end

local function fn18(arg, arg2)
	return type(arg) == "string" and #arg == arg2 and not arg:find("[^a-f0-9]")
end

local function fn19(arg)
	return type(arg) == "number" and arg == arg and arg > 0 and arg < math.huge and arg % 1 == 0
end

local function fn20(arg, arg2)
	if type(arg) ~= "table" then
		return nil
	end
	local str3 = arg2:lower()

	for k, v3 in pairs(arg) do
		if type(k) == "string" and k:lower() == str3 and type(v3) == "string" then
			return v3
		end
	end
end

local function fn21(arg, arg2)
	local ok, result = pcall(request_, {
		Url = str2 .. "/auth",
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json", Accept = "application/json, text/plain" },
		Body = HttpService:JSONEncode(arg),
		Timeout = 15,
	})

	if not ok or type(result) ~= "table" then
		return nil, "Cannot reach the license server"
	end
	local flag = type(result.Body) ~= "string" or #result.Body < 1

	if not flag then
		flag = #result.Body > (arg2 or 8192)
	end

	if flag then
		return nil, "Invalid response from the license server"
	end
	return result
end

local function validateLicenseKey(arg)
	if type(arg) ~= "string" or #arg < 13 or #arg > 50 then
		return fn17("INVALID_KEY_FORMAT", "Enter a valid Night Hub key")
	end

	if type(request_) ~= "function" then
		return fn17("HTTP_UNAVAILABLE", "HTTP request is unavailable")
	end

	if type(gethwid) ~= "function" then
		return fn17("HWID_UNAVAILABLE", "Cannot read this device's hardware identifier")
	end

	if type(hash) ~= "function" or type(hmac) ~= "function" then
		return fn17("CRYPTO_UNAVAILABLE", "SHA-256 or HMAC is unavailable")
	end
	local ok, result = pcall(gethwid)
	if not ok or type(result) ~= "string" or #result < 1 or #result > 256 or result:find("%c") then
		return fn17("HWID_UNAVAILABLE", "Cannot read this device's hardware identifier")
	end
	local str3 = HttpService:GenerateGUID(false):gsub("%-", ""):lower()
	local v3, v4 = fn21({ step = "init", licenseKey = arg, hardwareIdentifier = result, clientNonce = str3 }, 8192)
	if not v3 then
		return fn17("VALIDATION_UNAVAILABLE", v4)
	end
	local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, v3.Body)
	if not ok2 or type(result2) ~= "table" then
		return fn17("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.valid == false then
		local message = type(result2.message) == "string" and result2.message or "Key rejected"
		return fn17(type(result2.code) == "string" and result2.code or "KEY_REJECTED", message, result2.shouldForgetSavedKey)
	end

	if result2.valid ~= true or not fn18(result2.sessionIdentifier, 32) or not fn18(result2.accessToken, 64) or not fn18(result2.challenge, 64) or result2.clientNonce ~= str3 or not fn19(result2.sessionExpiresAt) or not fn19(result2.serverTime) or result2.sessionExpiresAt <= result2.serverTime or result2.sessionExpiresAt - result2.serverTime > 120 then
		return fn17("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.version ~= "Free" and result2.version ~= "NightHub" and result2.version ~= "Noctelis" then
		return fn17("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.subscriptionTier ~= "Free" and result2.subscriptionTier ~= "Pro" then
		return fn17("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.expiresAt ~= nil and (not fn19(result2.expiresAt) or result2.expiresAt <= result2.serverTime) then
		return fn17("KEY_EXPIRED", "This key has expired", true)
	end

	local v5, v6 = fn21({
		step = "start",
		sessionIdentifier = result2.sessionIdentifier,
		accessToken = result2.accessToken,
		challenge = result2.challenge,
		clientNonce = str3,
		hardwareIdentifier = result,
	}, 8388608)

	if not v5 then
		return fn17("VALIDATION_UNAVAILABLE", v6)
	end

	if v5.StatusCode ~= 200 then
		return fn17("AUTH_START_FAILED", "Protected authorization failed")
	end
	local ok3, result3 = pcall(hash, v5.Body, "sha256")
	if not ok3 or not fn18(result3, 64) then
		return fn17("CRYPTO_UNAVAILABLE", "Payload integrity check failed")
	end
	local v7 = fn20(v5.Headers, "x-night-hub-session")
	local v8 = fn20(v5.Headers, "x-night-hub-digest")
	local v9 = fn20(v5.Headers, "x-night-hub-watermark")
	local v10 = fn20(v5.Headers, "x-night-hub-proof")
	if not fn18(v7, 32) or not fn18(v9, 32) or v8 ~= result3 or type(v10) ~= "string" then
		return fn17("INVALID_SERVER_RESPONSE", "Protected authorization signature is invalid")
	end
	local ok4, result4 = pcall(hmac, result2.challenge, table.concat({ v7, result3, v9 }, ":"), "sha256")
	if not ok4 or v10 ~= result4 then
		return fn17("INVALID_SERVER_RESPONSE", "Protected authorization signature is invalid")
	end

	return true, {
		valid = true,
		version = result2.version == "Noctelis" and "NightHub" or result2.version,
		subscriptionTier = result2.subscriptionTier,
		expiresAt = result2.expiresAt,
		serverTime = result2.serverTime,
	}
end

local nightHubAuthRewrite = {
	Valid = false,
	Details = nil,
	Stop = function()
		v2.destroyInterface()
	end,
}

v2.validateLicenseKey = validateLicenseKey

v2.onLicenseKeyAccepted = function(_, details)
	if nightHubAuthRewrite.Valid then
		return
	end
	nightHubAuthRewrite.Valid = true
	nightHubAuthRewrite.Details = details
	tbl.Whitelisted = true
	tbl.IsPremiumUser = details.subscriptionTier == "Pro"
	print("KEY VALID")

	if fn then
		task.spawn(fn)
	else
		nightHubAuthRewrite.PendingStart = true
	end
end

genv.NightHubAuthRewrite = nightHubAuthRewrite
local value = rawget(genv, "Key")
v2.showInterface(type(value) == "string" and value or nil)

fn = function()
	local obj = setmetatable({}, { __index = function(_, arg2)
		return game:GetService(arg2)
	end })

	local now = tick()
	local replicatedStorage = obj.ReplicatedStorage
	local workspace = obj.Workspace
	local lighting = obj.Lighting
	local runService = obj.RunService
	local players = obj.Players
	local tweenService = obj.TweenService
	local httpService = obj.HttpService
	local virtualInputManager = obj.VirtualInputManager
	local collectionService = obj.CollectionService
	local userInputService = obj.UserInputService
	local quests = replicatedStorage:WaitForChild("Quests")
	local guideModule = replicatedStorage:WaitForChild("GuideModule")
	local remotes = replicatedStorage:WaitForChild("Remotes")
	local commF = remotes:WaitForChild("CommF_")
	local commE = remotes:WaitForChild("CommE")
	local redeem = remotes:WaitForChild("Redeem")
	local localPlayer = players.LocalPlayer
	local playerGui = localPlayer:WaitForChild("PlayerGui")
	local character = localPlayer and localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

	localPlayer.CharacterAdded:Connect(function(character2)
		character = character2
		humanoid = character:WaitForChild("Humanoid")
		humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	end)

	local net = replicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
	local reShootGunEvent = net:WaitForChild("RE/ShootGunEvent")
	local validator2 = remotes:WaitForChild("Validator2")
	local data = localPlayer:WaitForChild("Data")
	local level = data:WaitForChild("Level")
	data:WaitForChild("Beli")
	data:WaitForChild("Fragments")
	require(game.ReplicatedStorage.Controllers.UI.Inventory)
	local ItemId = require(game.ReplicatedStorage.Economy.ItemId)
	local ItemReplicationService = require(game.ReplicatedStorage.ItemReplicationService)
	local KEYS = require(game.ReplicatedStorage.ItemReplicationService.KEYS)
	ItemReplicationService:GetItems(KEYS.QUANTITY)
	local flag = false
	local v3 = nil
	local lua = nil
	local v4 = nil
	local luau = nil
	local luau2 = nil
	local cdkQuest = nil
	local cframe = CFrame.new(5867, 1208, 872)
	local flag2 = false
	local flag3 = tbl.IsPremiumUser == true or localPlayer.Name == "NightX_LMN"
	local tbl5 = {}
	local tbl6 = {}
	local tbl7 = {}
	local tbl8 = { Tabs = {}, Counts = 0, Feature = {} }
	local tbl9 = { [0] = "Common", "UnCommon", "Rare", "Legendary", "Mythical", "Premium" }
	local tbl10 = {}
	local flag4 = false
	local flag5 = false
	local flag6 = false
	local attribute = workspace:GetAttribute("MAP") or "UNKNOWN"

	if attribute == "Sea1" then
		flag4 = true
	elseif attribute == "Sea2" then
		flag5 = true
	elseif attribute == "Sea3" then
		flag6 = true
	else
		print("[⚠️⚠️⚠️⚠️] WTF!")
	end

	local tbl11 = {
		SelectTool = "Melee",
		TweenSpeed = "250",
		SelectTheme = "Darker",
		["Delay Claim Quest"] = true,
		BringRange = "500",
		BringSpeed = "300",
		["Bring Mobs"] = true,
	}

	local tbl12 = { "Segment1", "Segment3", "Segment4", "Segment7", "Segment10" }
	local tbl13 = { "Trophy1", "Trophy2", "Trophy3", "Trophy4", "Trophy5" }

	local tbl14 = {
		Part1 = "Really black",
		Part2 = "Really black",
		Part3 = "Dusty Rose",
		Part4 = "Storm blue",
		Part5 = "Really black",
		Part6 = "Parsley green",
		Part7 = "Really black",
		Part8 = "Dusty Rose",
		Part9 = "Really black",
		Part10 = "Storm blue",
	}

	local tbl15 = {
		RequestQuest = { NPC = "Dojo Trainer", Command = "RequestQuest" },
		ClaimQuest = { NPC = "Dojo Trainer", Command = "ClaimQuest" },
	}

	for _, v5 in pairs(getconnections(localPlayer.Idled)) do
		v5:Disable()
	end

	if not getsenv then
		warn("❌ Executor Doesn't Support getsenv!")
		return
	end

	pcall(function()
		local v5 = next
		local children, v6 = localPlayer.PlayerScripts:GetChildren()

		for _, v7 in v5, children, v6 do
			if v7:IsA("LocalScript") then
				local ok, result = pcall(getsenv, v7)

				if typeof(result) == "table" then
					HitFunc = result._G.SendHitsToServer
				end
			end
		end
	end)

	for _, player in pairs(players:GetPlayers()) do
		if player.Name ~= localPlayer.Name then
			table.insert(tbl10, player.Name)
		end
	end

	require(replicatedStorage.Reparent).Unparent = function()
		return nil
	end

	if not workspace.Map:FindFirstChild("Temple of Time") and replicatedStorage:WaitForChild("MapStash"):FindFirstChild("Temple of Time") then
		replicatedStorage.MapStash["Temple of Time"].Parent = workspace.Map
	end

	local tbl16 = {}
	local v5 = next
	local children, v6 = workspace.Map:FindFirstChild("Temple of Time"):GetChildren()

	for _, v7 in v5, children, v6 do
		if v7:IsA("Model") and v7.Name:find("Corridor") then
			local door = v7.Door
			tbl16[v7.Name:gsub("Corridor", "")] = door
		end
	end

	local function fn22(arg, arg2)
		local flag7 = nil
		local v7 = nil
		local position = nil
		local position2

		arg2.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag7 = true
				position2 = input.Position
				position = arg.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag7 = false
					end
				end)
			end
		end)

		arg2.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v7 = input
			end
		end)

		userInputService.InputChanged:Connect(function(input)
			if input == v7 and flag7 then
				local n4 = input.Position - position2
				tweenService:Create(arg, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Position = UDim2.new(position.X.Scale, position.X.Offset + n4.X, position.Y.Scale, position.Y.Offset + n4.Y) }):Play()
			end
		end)
	end

	local folder = Instance.new("Folder")
	folder.Name = "N_Cache"
	folder.Parent = workspace
	local folder2 = Instance.new("Folder")
	folder2.Name = "NPCs"
	folder2.Parent = folder

	for _, v7 in pairs(getnilinstances()) do
		if v7:GetAttribute("FloorPos") then
			local part = Instance.new("Part")
			part.Parent = folder2
			part.Name = v7.Name
			part.Size = Vector3.one
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1
			part.CFrame = v7:GetPivot()
		end
	end

	for _, v7 in pairs({ workspace.NPCs, replicatedStorage.NPCs }) do
		for _, child in pairs(v7:GetChildren()) do
			local part = Instance.new("Part")
			part.Parent = folder2
			part.Name = child.Name
			part.Size = Vector3.one
			part.Anchored = true
			part.CanCollide = false
			part.Transparency = 1
			part.CFrame = child:GetPivot()
		end
	end

	local tbl17 = { Functions = {}, Module = {} }
	local module = tbl17.Module

	module.SubFunction = function()
		return {
			ConvertAnyToCFrame = function(_, arg2)
				if typeof(arg2) == "Vector3" then
					return CFrame.new(arg2)
				end

				if typeof(arg2) == "Instance" and arg2:IsA("BasePart") then
					return arg2.CFrame
				end
				return arg2
			end,
			GetDistance = function(arg, arg2, arg3, arg4)
				if not arg2 then
					return
				end
				local v7 = arg:ConvertAnyToCFrame(arg2)
				local cFrame = arg3 and arg:ConvertAnyToCFrame(arg3) or character.HumanoidRootPart.CFrame
				return (arg4 and Vector3.new(v7.X, 0, v7.Z) - Vector3.new(cFrame.X, 0, cFrame.Z) or v7.Position - cFrame.Position).Magnitude
			end,
			CheckQuest = function(_, arg2)
				local quest = playerGui:WaitForChild("Main"):WaitForChild("Quest")
				local str3 = quest.Container.QuestTitle.Title.Text:gsub("-", ""):lower()
				local str4 = arg2:gsub("-", ""):lower()
				return quest.Visible and str3:find(str4)
			end,
			ClaimQuest = function(_, arg2, ...)
				if (arg2.p - humanoidRootPart.Position).Magnitude <= 15 then
					if tbl11["Delay Claim Quest"] then
						wait(0.8)
					end

					commF:InvokeServer(...)
				else
					module.TweenModule:to(arg2, true)
				end
			end,
			GetWeaponName = function(_, arg2)
				local str3 = ""

				local function fn23(arg3, arg4)
					if arg4 and arg4:IsA("Tool") and arg4.ToolTip == arg2 then
						str3 = arg4.Name
					end
				end

				table.foreach(localPlayer.Backpack:GetChildren(), fn23)
				table.foreach(localPlayer.Character:GetChildren(), fn23)
				return str3 ~= "" and str3 or nil
			end,
			TweenPart = function(_, arg2, arg3, arg4)
				tweenpart = tweenService:Create(arg2, TweenInfo.new((arg3.Position - arg2.Position).Magnitude / (arg4 or 350), Enum.EasingStyle.Linear), { CFrame = arg3 })
				tweenpart:Play()
			end,
			GetMaterial = function(_, arg2)
				if ItemReplicationService.IsInitialized then
					local tbl18 = {}
					local items = ItemReplicationService:GetItems(KEYS.QUANTITY)

					for _, item in pairs(items) do
						local v7 = ItemId.getDataFromId(item.ItemId):unwrap()
						table.insert(tbl18, { Name = v7.StorageKey, Count = item.Value or 0, Type = v7.Type })
					end

					for _, v7 in pairs(tbl18) do
						if v7 and v7.Name == arg2 and v7.Count >= 1 then
							return v7.Count
						end
					end
				end

				return 0
			end,
			GetItemInventory = function(_, arg2)
				if ItemReplicationService.IsInitialized then
					local tbl18 = {}
					local items = ItemReplicationService:GetItems(KEYS.QUANTITY)

					for _, item in pairs(items) do
						local v7 = ItemId.getDataFromId(item.ItemId):unwrap()
						table.insert(tbl18, { Name = v7.StorageKey, Count = item.Value or 0, Type = v7.Type })
					end

					for _, v7 in pairs(tbl18) do
						if v7 and v7.Name == arg2 and v7.Count >= 1 then
							return true
						end
					end
				end

				return false
			end,
			GetNPCPos = function(_, arg2)
				local cFrame = nil

				for _, child in pairs(workspace.N_Cache.NPCs:GetChildren()) do
					if child.Name == arg2 then
						cFrame = child.CFrame
					end
				end

				return cFrame
			end,
			GetNPC = function(_, arg2)
				local cFrame = nil

				for _, child in pairs(workspace.N_Cache.NPCs:GetChildren()) do
					if child.Name == arg2 then
						cFrame = child.CFrame
					end
				end

				return cFrame
			end,
			EquipToolName = function(_, arg2)
				local v7 = localPlayer.Backpack:FindFirstChild(arg2)
				if v7 and humanoid then
					humanoid:EquipTool(v7)
					return
				end
			end,
			CheckItem = function(_, arg2)
				local v7 = nil

				local function fn23(arg3, arg4)
					if arg4 and (arg4.Name == arg2 or arg4.Name:find(arg2)) then
						v7 = arg4
					end
				end

				table.foreach(localPlayer.Backpack:GetChildren(), fn23)
				table.foreach(localPlayer.Character:GetChildren(), fn23)
				return v7
			end,
			GetMeleeNPC = function(_, arg2)
				for k, v7 in next, {
					["Black Leg"] = "Dark Step Teacher",
					Electro = "Mad Scientist",
					["Fishman Karate"] = "Water Kung-fu Teacher",
					["Dragon Claw"] = "Sabi",
					Superhuman = "Martial Arts Master",
					["Death Step"] = "Phoeyu, the Reformed",
					["Sharkman Karate"] = "Sharkman Teacher",
					["Electric Claw"] = "Previous Hero",
					["Dragon Talon"] = "Uzoth",
					Godhuman = "Ancient Monk",
					["Sanguine Art"] = "Shafi",
				}, nil do
					if k == arg2 then
						return v7
					end
				end
			end,
			HopServers = function(_, arg2)
				local serverBrowser = replicatedStorage:WaitForChild("__ServerBrowser")

				for i = 1, 100 do
					for k, v7 in next, serverBrowser:InvokeServer(i), nil do
						if game.JobId ~= k and v7.Count <= 12 and (not arg2 or v7.Region:find(arg2)) then
							serverBrowser:InvokeServer("teleport", k)
							task.wait(0.5)
						end
					end
				end
			end,
			Decode = function(_, arg2)
				local tbl18 = {}

				for match in arg2:gsub("^" .. HEADER, ""):gsub(FOOTER .. "$", ""):gmatch(MARK .. "(...)" .. MARK) do
					local v7 = DECODE[match]

					if v7 then
						tbl18[#tbl18 + 1] = v7
					end
				end

				return table.concat(tbl18)
			end,
			CheckFruits = function(_, arg2)
				local v7

				local function fn23(arg3, arg4)
					if arg4:IsA("Tool") and string.find(arg4.Name, "Fruit") and not arg4:GetAttribute("WeaponType") and (not arg2 or table.find(tbl5, arg4.Name)) then
						v7 = arg4
					end
				end

				table.foreach(localPlayer.Backpack:GetChildren(), fn23)
				table.foreach(character:GetChildren(), fn23)
				return v7
			end,
			GetFruitInventory = function()
				return nil
			end,
			GetNearPlayers = function()
				local v7 = next
				local children2, v8 = game.Workspace.Characters:GetChildren()
				local huge = math.huge
				local v9 = nil

				for _, v10 in v7, children2, v8 do
					if v10 and v10.Parent and v10:FindFirstChild("Humanoid") and v10.Humanoid.Health > 0 and v10:FindFirstChild("HumanoidRootPart") then
						local magnitude = (v10.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude

						if magnitude <= huge and magnitude <= 400 then
							huge = magnitude
							v9 = v10
						end
					end
				end

				return v9
			end,
			CheckNotify = function(_, arg2)
				for _, child in pairs(playerGui.Notifications:GetChildren()) do
					local text = child and child.Parent and child:IsA("TextLabel") and child.Text
					local v7

					if text then
						local lower = arg2.lower
						v7 = string.find(string.lower(child.Text), lower(arg2))
					else
						v7 = text
					end

					if v7 then
						return child
					end
				end
			end,
			HopApi = function(arg, arg2)
				local ok, result = pcall(function()
					return http.request({ Url = "http://163.223.9.144/boss/" .. arg2, Method = "GET" })
				end)

				if ok and result then
					local data2 = game:GetService("HttpService"):JSONDecode(result.Body)

					if data2 then
						local tbl18 = {}

						for _, v7 in pairs(data2.data) do
							if v7 and v7.JobId and game.JobId ~= arg:Decode(v7.JobId) and v7.Age and v7.PlaceId == game.PlaceId then
								table.insert(tbl18, v7)
							end
						end

						table.sort(tbl18, function(arg3, arg4)
							return arg3.Age < arg4.Age
						end)

						for _, v7 in ipairs(tbl18) do
							local v8 = arg:Decode(v7.JobId)

							lua:Notify({
								Title = "Hop Find " .. arg2 .. " Servers",
								Content = "Type: " .. arg2 .. " JobId: " .. v8 .. " Age: " .. tostring(v7.Age),
								Duration = 3,
							})

							game.ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", v8)
							task.wait(0.3)
						end
					end
				else
					print(ok, result, result.StatusCode)
				end
			end,
			CheckRace = function()
				local response = commF:InvokeServer("Wenlocktoad", "1")
				local response2 = commF:InvokeServer("Alchemist", "1")
				if character:FindFirstChild("RaceTransformed") then
					return "V4"
				end
				return response == -2 and "V3" or response2 == -2 and "V2" or "V1"
			end,
			checkmirage = function()
				return workspace.Map:FindFirstChild("MysticIsland")
			end,
			getbluegear = function()
				if workspace.Map:FindFirstChild("MysticIsland") then
					for _, child in pairs(workspace.Map.MysticIsland:GetChildren()) do
						if child:IsA("MeshPart") and child.MeshId == "rbxassetid://10153114969" then
							return child
						end
					end
				end
			end,
			HighestPoint = function()
				if workspace.Map:FindFirstChild("MysticIsland") then
					for _, descendant in pairs(workspace.Map.MysticIsland:GetDescendants()) do
						if descendant:IsA("MeshPart") and descendant.MeshId == "rbxassetid://6105779869" then
							return descendant
						end
					end
				end
			end,
			CheckAgilityTurn = function(_, arg2)
				local v7 = next
				local children2, v8 = arg2:GetChildren()

				for _, v9 in v7, children2, v8 do
					if table.find({
						"Last Resort",
						"Agility",
						"Water Body",
						"Heavenly Blood",
						"Heightened Senses",
						"Energy Core",
						"Primordial Reign",
					}, v9.Name) then
						return true
					end
				end

				return false
			end,
			CheckPlayerTurnAbility = function(arg)
				local v7 = next
				local children2, v8 = workspace.Characters:GetChildren()

				for _, v9 in v7, children2, v8 do
					local flag7 = v9 and v9.Name ~= localPlayer.Name and arg:GetDistance(v9.HumanoidRootPart) <= 1000 and (v9.HumanoidRootPart.Position - tbl16[players[v9.Name].Data.Race.Value].Entrance.Position).Magnitude <= 50 and game.Players[v9.Name].Data.Race.Value ~= data.Race.Value
					local agility

					if flag7 then
						agility = v9.HumanoidRootPart:FindFirstChild("Agility") or arg:CheckAgilityTurn(v9.HumanoidRootPart)
					else
						agility = flag7
					end

					if agility then
						return true
					end
				end

				return false
			end,
			GetTool = function(_, arg2)
				local v7 = nil

				local function fn23(arg3, arg4)
					if arg4 and arg4:IsA("Tool") and arg4.ToolTip == arg2 then
						v7 = arg4
					end
				end

				table.foreach(localPlayer.Backpack:GetChildren(), fn23)
				table.foreach(localPlayer.Character:GetChildren(), fn23)
				return v7
			end,
			AddBodyVelocity = function(_, arg2)
				if arg2 then
					if not character.Head:FindFirstChild("BodyVelocity") then
						local bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.Parent = character.Head
						bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
						bodyVelocity.Velocity = Vector3.zero
						bodyVelocity.P = 1500
					end

					for _, descendant in pairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.CanCollide then
							descendant.CanCollide = false
						end
					end
				elseif character.Head:FindFirstChild("BodyVelocity") then
					character.Head.BodyVelocity:Destroy()
				end
			end,
		}
	end

	module.SaveManager = function()
		local tbl18 = {
			NameFolder = "Night Hub True V2",
			NameGame = "Blox Fruits",
			SaveSettings = function(arg, arg2, arg3)
				if arg2 ~= nil then
					tbl11[arg2] = arg3
				end

				if not isfolder(arg.NameFolder) then
					makefolder(arg.NameFolder)
				end

				if not isfolder(arg.NameFolder .. "/" .. arg.NameGame) then
					makefolder(arg.NameFolder .. "/" .. arg.NameGame)
				end

				writefile(arg.NameFolder .. "/" .. arg.NameGame .. "/" .. localPlayer.Name .. "-settings.json", httpService:JSONEncode(tbl11))
			end,
			LoadSettings = function(arg)
				local ok, result = pcall(function()
					if not isfolder(arg.NameFolder) or not isfolder(arg.NameFolder .. "/" .. arg.NameGame) then
						arg:SaveSettings()
					end

					return httpService:JSONDecode(readfile(arg.NameFolder .. "/" .. arg.NameGame .. "/" .. localPlayer.Name .. "-settings.json"))
				end)

				if not ok then
					arg:SaveSettings()
					return arg:LoadSettings()
				end
				return result
			end,
		}

		tbl11 = tbl18:LoadSettings()
		return tbl18
	end

	module.TweenModule = function()
		return {
			Portals = {
				Sea1 = {
					["Sky Arena 1"] = Vector3.new(-4654, 872, -1759),
					["Sky Arena 2"] = Vector3.new(-7894, 5547, -380),
					["UnderWater City 1"] = Vector3.new(3876, 35, -1939),
					["UnderWater City 2"] = Vector3.new(61163, 11, 1819),
				},
				Sea2 = {
					Mansion = Vector3.new(-288, 305, 613),
					["Swan Room"] = Vector3.new(2284, 15, 897),
					["Out Ship"] = Vector3.new(-6518, 83, -145),
					["In Ship"] = Vector3.new(923, 125, 32883),
				},
				Sea3 = {
					Mansion = Vector3.new(-12550, 337, -7476),
					["Castle On The Sea"] = Vector3.new(-5125, 315, -3116),
					["Hydra Island"] = Vector3.new(5681, 1013, -313),
					["Great Tree"] = Vector3.new(3028, 2280, -7324),
					["Temple Of Time"] = Vector3.new(28294, 14896, 103),
				},
			},
			GetPortalTeleport = function(arg, arg2)
				local huge = math.huge
				local v7 = nil
				local str3 = ""

				for k, v8 in pairs(arg.Portals[attribute]) do
					local magnitude = (v8 - arg2.Position).Magnitude

					if v8 and magnitude <= huge then
						huge = magnitude
						v7 = v8
						str3 = k
					end
				end

				if v7 and (v7 - arg2.Position).Magnitude + 250 <= (arg2.Position - character.HumanoidRootPart.Position).Magnitude then
					return v7, str3
				end
			end,
			InArea = function(_, arg2)
				local v7 = next
				local children2, v8 = workspace._WorldOrigin.Locations:GetChildren()

				for _, v9 in v7, children2, v8 do
					local position = v9.Position
					if (module.SubFunction:ConvertAnyToCFrame(arg2).Position - position).Magnitude <= v9.Mesh.Scale.X then
						return v9
					end
				end

				return { Name = "" }
			end,
			tween = function(arg, cFrame)
				if not humanoid or humanoid.Health <= 0.36 or not humanoidRootPart then
					if tween then
						tween:Cancel()
					end

					return
				end

				if not character:FindFirstChild("TweenColor") then
					local highlight = Instance.new("Highlight")
					highlight.Name = "TweenColor"
					highlight.Parent = character
					highlight.FillColor = Color3.fromRGB(255, 255, 255)
					highlight.FillTransparency = 0.7
				end

				local v7 = arg:InArea(cFrame)
				local v8 = arg:InArea(humanoidRootPart)
				local magnitude = (cFrame.Position - humanoidRootPart.Position).Magnitude

				if magnitude <= 300 then
					humanoidRootPart.CFrame = cFrame
				end

				if module.SubFunction:GetDistance(cFrame) >= 3000 and (v8.Name == "Submerged Island" or v8.Name == "Sealed Cavern") and not table.find({ "Submerged Island", "Sealed Cavern" }, v7.Name) then
					if module.SubFunction:GetDistance(CFrame.new(11427, -2155, 9730)) <= 30 then
						replicatedStorage.Modules.Net["RF/SubmarineTransportation"]:InvokeServer("InitiateTeleport", "Tiki Outpost")
						wait(0.1)
					else
						arg:to(CFrame.new(11427, -2155, 9730), true)
					end

					return
				end

				if v7.Name == "Submerged Island" and v8.Name ~= "Submerged Island" or v7.Name == "Sealed Cavern" and v8.Name ~= "Sealed Cavern" then
					if module.SubFunction:GetDistance(CFrame.new(-16270, 25, 1379).Position) <= 30 then
						local v9, v10

						repeat
							wait()
							v9 = arg:InArea(cFrame)
							v10 = arg:InArea(humanoidRootPart)
							replicatedStorage.Modules.Net["RF/SubmarineWorkerSpeak"]:InvokeServer("TravelToSubmergedIsland")
						until v10 == v9

						wait(0.1)
					else
						arg:to(CFrame.new(-16270, 25, 1379), true)
						wait(0.1)
					end

					return
				end

				if flag6 and module.SubFunction:GetDistance(Vector3.new(28609, 14896, 106), cFrame) > 3000 and module.SubFunction:GetDistance(Vector3.new(28609, 14896, 106)) <= 3000 then
					if module.SubFunction:GetDistance(CFrame.new(28610, 14897, 105)) <= 10 then
						commF:InvokeServer("RaceV4Progress", "Check")
						commF:InvokeServer("RaceV4Progress", "TeleportBack")
						wait(1)
					else
						wait(0.1)
						arg:to(CFrame.new(28610, 14897, 105))
					end

					return
				end

				local portalTeleport, v9 = arg:GetPortalTeleport(cFrame)

				if portalTeleport and v9 and flag2 then
					if tween then
						tween:Cancel()
					end

					print("[📜] Portal Teleport to:", v9)

					if v9 == "Great Tree" then
						portalTeleport = Vector3.new(28294, 14896, 103)
					end

					commF:InvokeServer("requestEntrance", portalTeleport)
					return
				end

				if tbl11["Same Y"] then
					humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.CFrame.X, cFrame.Y, humanoidRootPart.CFrame.Z)
				end

				tween = tweenService:Create(humanoidRootPart, TweenInfo.new(magnitude / tbl11.TweenSpeed / (magnitude <= 350 and 3 or 1), Enum.EasingStyle.Linear), { CFrame = cFrame })
				tween:Play()
			end,
			to = function(arg, arg2, arg3)
				if not arg2 then
					return
				end

				if arg3 then
					module.SubFunction:AddBodyVelocity(true)
				else
					module.SubFunction:AddBodyVelocity(false)
				end

				arg:tween(arg2)
			end,
			StopTween = function()
				if tween then
					tween:Cancel()
				end

				if character:FindFirstChild("TweenColor") then
					character:FindFirstChild("TweenColor"):Destroy()
				end

				if character.PrimaryPart:FindFirstChild("IDK") then
					character.PrimaryPart:FindFirstChild("IDK"):Destroy()
				end

				if character:FindFirstChild("Head") and character.Head:FindFirstChild("BodyVelocity") then
					character.Head.BodyVelocity:Destroy()
				end
			end,
		}
	end

	module.QuestModule = function()
		local tbl18

		tbl18 = {
			QuestCake = {
				NameQuest = "CakeQuest1",
				NumberQuest = 1,
				NameMob = "Cookie Crafter",
				Mobs = { "Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter" },
			},
			QuestBone = {
				NameQuest = "HauntedQuest2",
				NumberQuest = 1,
				NameMob = "Demonic Soul",
				Mobs = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" },
			},
			CDKQuest = { Good = 0, Evil = 0 },
			GetCFrameQuest = function()
				for k, v7 in pairs(require(guideModule).Data.NPCList) do
					local lastClosestNPC = require(guideModule).Data.LastClosestNPC
					if module.SubFunction:GetNPCPos(lastClosestNPC) then
						return module.SubFunction:GetNPCPos(lastClosestNPC)
					end

					if v7.NPCName == lastClosestNPC then
						return k.CFrame
					end
				end
			end,
			QuestLevel = function()
				local tbl19 = {}
				if attribute == "Sea1" and level.Value >= 700 then
					return { NameMob = "Galley Captain", NameQuest = "FountainQuest", NumberQuest = 2 }
				end

				if attribute == "Sea2" and level.Value >= 1500 then
					return { NameMob = "Water Fighter", NameQuest = "ForgottenQuest", NumberQuest = 2 }
				end
				local n4 = 0

				for k, v7 in pairs(require(quests)) do
					for k2, v8 in pairs(v7) do
						local levelReq = v8.LevelReq

						for k3 in pairs(v8.Task) do
							if level.Value >= levelReq and levelReq >= n4 and v8.Task[k3] > 1 and not table.find({ "BartiloQuest", "CitizenQuest", "Trainer" }, k) then
								tbl19 = { NameQuest = k, NumberQuest = k2, NameMob = k3 }
								n4 = levelReq
							end
						end
					end
				end

				return tbl19
			end,
			GetCDKQuest = function()
				local v7 = next
				local response, v8 = commF:InvokeServer("CDKQuest", "Progress", "Good")

				for k, v9 in v7, response, v8 do
					tbl18.CDKQuest[k] = v9
				end

				return tbl18.CDKQuest
			end,
		}

		return tbl18
	end

	module.CreateFunc = function(arg, arg2, arg3, arg4)
		if arg and arg2 and not tbl17.Functions[arg] then
			tbl17.Functions[arg] = { _func = arg2, _enable = arg3, _noclip = arg4 }
		end
	end

	module.AttackModule = function()
		return {
			GetMidPosition = function(_, arg2)
				local v7, v8, v9 = pairs(replicatedStorage:WaitForChild("FortBuilderReplicatedSpawnPositionsFolder"):GetChildren())
				local position = nil
				local n4 = 0

				for _, v10 in v7, v8, v9 do
					if v10.Name == arg2.Name then
						if not position then
							position = v10.Position
						else
							position += v10.Position
						end

						n4 += 1
					end
				end

				if position then
					return position / n4
				end
				return arg2.HumanoidRootPart.Position
			end,
			BringMob = function(_, arg2)
				if tbl11["Bring Mobs"] then
					if game.Players.LocalPlayer.SimulationRadius < 3150 then
						sethiddenproperty(localPlayer, "SimulationRadius", 3150)
					end

					local position = arg2.HumanoidRootPart.Position
					local children2 = workspace:WaitForChild("Enemies"):GetChildren()

					for i = 1, #children2 do
						local v7 = children2[i]
						local flag7 = v7 and v7.Name == arg2.Name and v7:FindFirstChild("Humanoid") and v7.Humanoid.Health > 0 and v7:FindFirstChild("HumanoidRootPart") and (v7.PrimaryPart.Position - humanoidRootPart.Position).Magnitude <= 500

						if flag7 then
							flag7 = (position - v7.HumanoidRootPart.Position).Magnitude <= tonumber(tbl11.BringRange or 500)
						end

						if flag7 then
							if not v7.HumanoidRootPart:FindFirstChild("Lock") then
								local bodyVelocity = Instance.new("BodyVelocity")
								bodyVelocity.Name = "Lock"
								bodyVelocity.Parent = v7.HumanoidRootPart
								bodyVelocity.MaxForce = Vector3.new(90000, 90000, 90000)
								bodyVelocity.Velocity = Vector3.zero
							end

							v7.Humanoid.WalkSpeed = 0
							v7.Humanoid.AutoRotate = false
							v7.HumanoidRootPart.CanCollide = false
							v7.Head.CanCollide = false

							if v7.HumanoidRootPart and isnetworkowner(v7.HumanoidRootPart) and (v7.HumanoidRootPart.Position - position).Magnitude > 5 then
								v7:SetPrimaryPartCFrame(CFrame.new(position))
							end
						end
					end
				end
			end,
			EquipBuso = function()
				if not character:FindFirstChild("HasBuso") then
					commF:InvokeServer("Buso")
					return
				end
			end,
			EquipWeapon = function(_, arg2)
				local weaponName = module.SubFunction:GetWeaponName(arg2 or tbl11.SelectTool)
				if weaponName and localPlayer.Backpack:FindFirstChild(weaponName) then
					humanoid:EquipTool(localPlayer.Backpack[weaponName])
					return
				end
			end,
			CheckCakePrinceSkill = function()
				local v7 = next
				local children2, v8 = workspace._WorldOrigin:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9.Name == "Ring" or v9.Name == "Fist" then
						if module.SubFunction:GetDistance(v9.Position) <= 400 then
							return true
						end
					end
				end

				return false
			end,
			CheckTerrorSharkSkills = function()
				for _, child in pairs(workspace.Enemies:GetChildren()) do
					if child and child.Name == "Terrorshark" and child.Parent and module.FarmFunction:IsAlive(child) and module.SubFunction:GetDistance(child.HumanoidRootPart.Position) <= 600 then
						for _, v7 in pairs(child.Humanoid:GetPlayingAnimationTracks()) do
							if v7.Animation.AnimationId == "rbxassetid://14977820392" then
								return true
							end
						end
					end
				end

				return false
			end,
			AttackM1 = function(_, arg2)
				local tool = character:FindFirstChildOfClass("Tool")

				if tool then
					local leftClickRemote = tool:FindFirstChild("LeftClickRemote")

					if leftClickRemote and leftClickRemote:IsA("RemoteEvent") then
						local v7 = leftClickRemote
						local fireServer = v7.FireServer
						fireServer(v7, Vector3.new(0, -500, 0), arg2 or math.random(1, 4), true)
						task.wait(0.01)
						leftClickRemote:FireServer(false)
					end
				end
			end,
			Kill = function(arg, arg2)
				if not arg2 then
					return nil
				end
				local tool = character:FindFirstChildOfClass("Tool")
				local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart") or arg2.PrimaryPart
				local humanoid2 = arg2:FindFirstChild("Humanoid")
				if not humanoidRootPart2 or not humanoid2 or humanoid2.Health <= 0 then
					return nil
				end

				if character and character.Humanoid.Sit then
					character.Humanoid.Sit = false
					return
				end

				if arg:CheckCakePrinceSkill() or arg:CheckTerrorSharkSkills() then
					module.TweenModule:to(humanoidRootPart2.CFrame * CFrame.new(0, 250, 0), true)
				else
					module.TweenModule:to(humanoidRootPart2.CFrame * CFrame.new(-3, tool and tool.ToolTip == "Blox Fruit" and 15 or arg2:GetAttribute("IsBoss") and 50 or 30, 0), true)
				end

				arg:EquipWeapon()
				arg:EquipBuso()

				if not bringtick then
					bringtick = tick()
				end

				local v7 = bringtick

				if tick() - v7 >= 0.1 and not arg2:GetAttribute("IsBoss") then
					bringtick = tick()
					arg:BringMob(arg2)
				end

				return true
			end,
		}
	end

	module.FarmFunction = function()
		return {
			IsAlive = function(_, arg2)
				return arg2 and arg2.Parent and not arg2:FindFirstChild("VehicleSeat") and arg2:FindFirstChild("Humanoid") and arg2.Humanoid.Health > 0 and arg2:FindFirstChild("HumanoidRootPart")
			end,
			GetMobs = function(arg, arg2, arg3, arg4)
				local huge = math.huge
				local v7 = nil

				local function fn23(arg5, arg6)
					local isModel = arg6 and arg6:IsA("Model") and arg:IsAlive(arg6)

					if isModel then
						local flag7 = typeof(arg2) == "string"

						if flag7 then
							isModel = arg6.Name == arg2 or arg6.Name:find(arg2)
						else
							isModel = flag7
						end

						isModel = isModel or typeof(arg2) == "table" and table.find(arg2, arg6.Name)
					end

					if isModel then
						local distance = module.SubFunction:GetDistance(arg6.HumanoidRootPart.Position)

						if distance <= huge and (not arg4 or distance <= arg4) then
							huge = distance
							v7 = arg6
						end
					end
				end

				table.foreach(workspace.Enemies:GetChildren(), fn23)

				if arg3 then
					table.foreach(replicatedStorage:GetChildren(), fn23)
				end

				return v7
			end,
			GetChest = function()
				local tagged = game:GetService("CollectionService"):GetTagged("_ChestTagged")
				local huge = math.huge
				local v7 = nil

				for i = 1, #tagged do
					local position = humanoidRootPart.Position
					local magnitude = (tagged[i]:GetPivot().Position - position).Magnitude

					if tagged[i].Parent and tagged[i]:FindFirstChild("TouchInterest") and not tagged[i]:GetAttribute("IsDisabled") and magnitude <= huge then
						v7 = tagged[i]
						huge = magnitude
					end
				end

				return v7
			end,
			TPSpawnMob = function(arg, arg2, arg3)
				local v7 = pairs
				local fortBuilderReplicatedSpawnPositi = replicatedStorage:WaitForChild("FortBuilderReplicatedSpawnPositionsFolder")

				for _, child in v7(fortBuilderReplicatedSpawnPositi:GetChildren()) do
					if child and (typeof(arg2) == "string" and (child.Name == arg2 or child.Name:find(arg2)) or typeof(arg2) == "table" and table.find(arg2, child.Name)) and (child.Position - humanoidRootPart.Position).Magnitude > 30 then
						if not (not tbl11[arg3] or arg:GetMobs(arg2)) then
							while true do
								wait()
								module.TweenModule:to(child.CFrame * CFrame.new(0, 20, 0), true)
								wait(1)
								if not (not tbl11[arg3] or arg:GetMobs(arg2) or (child.Position - humanoidRootPart.Position).Magnitude <= 30) then
									continue
								end
								break
							end

							continue
						end
					else
						continue
					end

					break
				end
			end,
			GetCDKProcess = function()
				local evil = cdkQuest.Evil
				local good = cdkQuest.Good

				if evil ~= -2 and evil ~= 3 and evil ~= 4 then
					if evil == 2 or evil == -5 then
						return "Hell Dismension Quest"
					end

					if evil == 1 or evil == -4 then
						return "Haze Quest"
					end

					if evil == 0 or evil == -3 then
						return "Die Quest"
					end
				else
					if good == 2 or good == -5 then
						return "Heavenly Dismension Quest"
					end

					if good == 1 or good == -4 then
						return "Raid Castle Quest"
					end

					if good == 0 or good == -3 then
						return "Boat Quest"
					end
				end

				return "None"
			end,
			GetPedestal = function()
				local turtle = workspace.Map:WaitForChild("Turtle")
				local pedestal2

				if cdkQuest.Evil == 3 then
					pedestal2 = turtle.Cursed.Pedestal2
				else
					local enabled = (cdkQuest.Good == 3 or cdkQuest.Good == 4) and turtle.Cursed.Pedestal1.ProximityPrompt.Enabled
					pedestal2 = nil

					if enabled then
						pedestal2 = turtle.Cursed.Pedestal1
					end
				end

				return pedestal2
			end,
			DetectNearPlayersInCFrame = function(arg, arg2)
				local v7 = next
				local children2, v8 = workspace.Characters:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9.Name ~= localPlayer.Name and arg:IsAlive(v9) then
						if module.SubFunction:GetDistance(v9.HumanoidRootPart.Position) <= arg2 then
							return true
						end
					end
				end

				return false
			end,
			GetZombieGuitarPuzzle = function()
				local tbl18 = {}
				local v7 = next
				local children2, v8 = workspace.Enemies:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9.Name == "Living Zombie" then
						table.insert(tbl18, v9)
					end
				end

				return tbl18
			end,
			HazePos = function()
				local tbl18 = {}
				local v7 = next
				local children2, v8 = localPlayer:WaitForChild("QuestHaze"):GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9.Value > 0 then
						table.insert(tbl18, v9)
					end
				end

				local cFrame = nil

				if #tbl18 > 0 then
					local huge = math.huge
					cFrame = nil

					for _, v9 in next, tbl18, nil do
						local v10 = next
						local children3, v11 = replicatedStorage.FortBuilderReplicatedSpawnPositionsFolder:GetChildren()

						for _, v12 in v10, children3, v11 do
							if v9.Name == v12.Name then
								local distance = module.SubFunction:GetDistance(v12)

								if distance <= huge then
									cFrame = v12.CFrame
									huge = distance
								end
							end
						end
					end
				end

				return cFrame
			end,
			HazeMobs = function(arg)
				local huge = math.huge
				local v7 = nil

				local function fn23(arg2, arg3)
					if arg3:IsA("Model") and arg:IsAlive(arg3) and arg3:FindFirstChild("HazeESP") then
						if module.SubFunction:GetDistance(arg3.HumanoidRootPart) <= huge then
							huge = module.SubFunction:GetDistance(arg3.HumanoidRootPart)
							v7 = arg3
						end
					end
				end

				table.foreach(workspace.Enemies:GetChildren(), fn23)
				table.foreach(replicatedStorage:GetChildren(), fn23)
				return v7
			end,
			GetMobInCFrame = function(arg, arg2, arg3)
				local v7 = next
				local children2, v8 = workspace.Enemies:GetChildren()

				for _, v9 in v7, children2, v8 do
					local isModel = v9:IsA("Model") and arg:IsAlive(v9)
					local flag7

					if isModel then
						flag7 = module.SubFunction:GetDistance(v9.HumanoidRootPart, arg2) <= (arg3 or 1000)
					else
						flag7 = isModel
					end

					if flag7 then
						return v9
					end
				end
			end,
			DoCDKQuest = function(arg)
				local cdkProcess = arg:GetCDKProcess()

				if cdkProcess == "Die Quest" then
					if arg:GetMobs("Mythological Pirate", true) then
						module.TweenModule:to(arg:GetMobs("Mythological Pirate", true).HumanoidRootPart.CFrame)
					else
						module.TweenModule:to(CFrame.new(-13234, 520, -6800))
					end
				elseif cdkProcess == "Haze Quest" then
					local v7 = arg:HazeMobs()
					if v7 then
						return module.AttackModule:Kill(v7)
					end
					module.TweenModule:to(arg:HazePos() * CFrame.new(0, 20, 0))
				elseif cdkProcess == "Hell Dismension Quest" then
					local hellDimension = workspace._WorldOrigin.Locations["Hell Dimension"]

					if hellDimension and module.SubFunction:GetDistance(hellDimension.Position) <= 2000 then
						if workspace.Map:FindFirstChild("HellDimension") and workspace.Map:FindFirstChild("HellDimension").Exit.BrickColor == BrickColor.new("Olivine") then
							module.TweenModule:to(workspace.Map.HellDimension.Exit.CFrame)
							return
						end
						local mobInCFrame = arg:GetMobInCFrame(hellDimension.Position)
						if mobInCFrame then
							return module.AttackModule:Kill(mobInCFrame)
						end

						if workspace.Map:FindFirstChild("HellDimension") then
							local v7 = next
							local children2, v8 = workspace.Map:FindFirstChild("HellDimension"):GetChildren()

							for _, v9 in v7, children2, v8 do
								if string.find(v9.Name, "Torch") then
									if v9.ProximityPrompt.Enabled then
										module.TweenModule:to(v9.CFrame)
										fireproximityprompt(v9.ProximityPrompt)
									end
								end
							end
						end
					else
						local mobs = arg:GetMobs("Soul Reaper", true)

						if mobs then
							while true do
								task.wait()
								arg:GetCDKProcess()
								module.TweenModule:to(mobs.HumanoidRootPart.CFrame)
								if not (not mobs or not mobs.Parent or module.SubFunction:CheckNotify("loading...") or not tbl11.AutoCDK or hellDimension and module.SubFunction:GetDistance(hellDimension.Position) <= 2000) then
									continue
								end
								break
							end
						elseif module.SubFunction:GetMaterial("Bones") >= 50 then
							if module.SubFunction:CheckItem("Hallow Essence") then
								module.SubFunction:EquipToolName("Hallow Essence")
								module.TweenModule:to(CFrame.new(-8932, 142, 6063))
							elseif module.SubFunction:GetDistance(CFrame.new(-8934, 142, 6036)) <= 50 then
								commF:InvokeServer("Bones", "Buy", 1, 1)
							else
								module.TweenModule:to(CFrame.new(-8934, 142, 6036))
							end
						end
					end
				elseif cdkProcess == "Boat Quest" then
					local npc = module.SubFunction:GetNPC("Luxury Boat Dealer", "Dit")

					if npc then
						while true do
							wait()
							local cdkProcess2 = arg:GetCDKProcess()
							module.TweenModule:to(npc:GetPivot())
							local luxuryBoatDealer = workspace.NPCs:FindFirstChild("Luxury Boat Dealer")
							commF:InvokeServer("CDKQuest", "BoatQuest", luxuryBoatDealer)
							commF:InvokeServer("CDKQuest", "BoatQuest", luxuryBoatDealer, "Check")
							wait(0.5)
							npc:SetAttribute("Dit", true)
							if not (not npc or cdkProcess2 ~= "Boat Quest" or not tbl11.AutoCDK or npc:GetAttribute("Dit")) then
								continue
							end
							break
						end
					end
				elseif cdkProcess == "Raid Castle Quest" then
					if not arg:GetMobInCFrame(CFrame.new(-5541, 314, -2961)) then
						module.TweenModule:to(CFrame.new(-5043, 548, -3044))
					else
						local mobInCFrame = arg:GetMobInCFrame(CFrame.new(-5541, 314, -2961))
						if mobInCFrame then
							return module.AttackModule:Kill(mobInCFrame)
						end
					end
				elseif cdkProcess == "Heavenly Dismension Quest" then
					local heavenlyDimension = workspace._WorldOrigin.Locations["Heavenly Dimension"]

					if heavenlyDimension and module.SubFunction:GetDistance(heavenlyDimension.Position) <= 2000 then
						if workspace.Map:FindFirstChild("HeavenlyDimension") and workspace.Map:FindFirstChild("HeavenlyDimension").Exit.BrickColor == BrickColor.new("Cloudy grey") then
							module.TweenModule:to(workspace.Map.HeavenlyDimension.Exit.CFrame)
							return
						end
						local mobInCFrame = arg:GetMobInCFrame(heavenlyDimension.Position)
						if mobInCFrame then
							return module.AttackModule:Kill(mobInCFrame)
						end

						if workspace.Map:FindFirstChild("HeavenlyDimension") then
							local v7 = next
							local children2, v8 = workspace.Map:FindFirstChild("HeavenlyDimension"):GetChildren()

							for _, v9 in v7, children2, v8 do
								if string.find(v9.Name, "Torch") then
									if v9.ProximityPrompt.Enabled then
										module.TweenModule:to(v9.CFrame)
										fireproximityprompt(v9.ProximityPrompt)
									end
								end
							end
						end
					else
						if arg:GetMobs("Cake Queen", true) then
							local mobs = arg:GetMobs("Cake Queen", true)
							return module.AttackModule:Kill(mobs)
						end

						if not module.SubFunction:CheckNotify("loading...") and not arg:GetMobs("Cake Queen", true) and not DontHop then
							if module.SubFunction:GetDistance(CFrame.new(-731.20343017578125, 381.56588745117188, -11198.4951171875)) <= 500 then
								module.SubFunction:HopServers()
							else
								module.TweenModule:to(CFrame.new(-731.20343017578125, 381.56588745117188, -11198.4951171875))
							end
						end
					end
				end
			end,
			GetFruit = function()
				local v7 = next
				local children2, v8 = workspace:GetChildren()

				for _, v9 in v7, children2, v8 do
					if (v9:IsA("Model") or v9:IsA("Tool")) and string.find(v9.Name, "Fruit") and v9.Parent and v9:FindFirstChild("Handle") then
						return v9
					end
				end
			end,
			GetRaidIsland = function()
				local v7 = nil

				for i = 5, 1, -1 do
					local v8 = next
					local children2, v9 = workspace._WorldOrigin.Locations:GetChildren()

					for _, v10 in v8, children2, v9 do
						if v10.Name == "Island " .. tostring(i) and (v10.Position - humanoidRootPart.Position).Magnitude <= 3000 then
							v7 = v10
							break
						end
					end

					if not v7 then
						continue
					end
					break
				end

				return v7
			end,
			SendKeys = function(_, arg2)
				local function fn23(arg3)
					virtualInputManager:SendKeyEvent(true, arg3, false, game)
					task.wait()
					virtualInputManager:SendKeyEvent(false, arg3, false, game)
				end

				if typeof(arg2) == "string" then
					fn23(arg2)
				elseif typeof(arg2) == "table" then
					for k, v7 in pairs(arg2) do
						if v7 then
							fn23(k)
						end
					end
				end
			end,
			GetNearestMobs = function(arg)
				local v7 = next
				local children2, v8 = workspace.Enemies:GetChildren()
				local huge = math.huge
				local v9 = nil

				for _, v10 in v7, children2, v8 do
					if v10 and v10.Parent and arg:IsAlive(v10) and tbl17.Module.SubFunction:GetDistance(v10.PrimaryPart.Position) <= 1000 and tbl17.Module.SubFunction:GetDistance(v10.PrimaryPart.Position) <= huge then
						huge = tbl17.Module.SubFunction:GetDistance(v10.PrimaryPart.Position)
						v9 = v10
					end
				end

				return v9
			end,
			BuyMelee = function(_, arg2)
				local meleeNPC = tbl17.Module.SubFunction:GetMeleeNPC(arg2)
				local npcPos = tbl17.Module.SubFunction:GetNPCPos(meleeNPC)

				if meleeNPC and npcPos then
					if tbl17.Module.SubFunction:GetDistance(npcPos) <= 30 then
						for k, meleeRemote in pairs(luau2.MeleeRemotes) do
							if k == arg2 then
								if typeof(meleeRemote) == "table" then
									commF:InvokeServer(unpack(meleeRemote))
								else
									commF:InvokeServer(meleeRemote)
								end
							end
						end
					else
						module.TweenModule:to(npcPos, true)
					end
				end
			end,
			DetectNearMobLowHealth = function(arg, arg2, arg3)
				local v7 = next
				local children2, v8 = workspace.Enemies:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9 and v9.Name == arg2 and arg:IsAlive(v9) and module.SubFunction:GetDistance(v9.HumanoidRootPart.Position) <= 200 then
						if v9.Humanoid.Health * 100 / v9.Humanoid.MaxHealth <= (arg3 or 25) then
							return true
						end
					end
				end

				return false
			end,
			GetMobPositionOnScreen = function(_, arg2)
				if not arg2 then
					return
				end
				local v7, v8 = workspace.CurrentCamera:WorldToViewportPoint(arg2.Position)
				if v7 and v8 then
					return v7.X, v7.Z
				end
			end,
			Click = function(_, arg2, arg3)
				virtualInputManager:SendMouseButtonEvent(arg2, arg3, 0, true, game, 0)
				task.wait()
				virtualInputManager:SendMouseButtonEvent(arg2, arg3, 0, false, game, 0)
			end,
			TPSeabeast = function(_, arg2)
				local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")
				local waterBasePlane = workspace.Map:FindFirstChild("WaterBase-Plane")

				if humanoidRootPart2 then
					if (Vector3.new(0, humanoidRootPart2.Position.Y, 0) - Vector3.new(0, waterBasePlane.Position.Y, 0)).Magnitude <= 175 then
						module.TweenModule:to(humanoidRootPart2.CFrame * CFrame.new(0, 300, 0), true)
					elseif waterBasePlane then
						module.TweenModule:to(CFrame.new(humanoidRootPart2.CFrame.X, waterBasePlane.CFrame.Y + 200, humanoidRootPart2.CFrame.Z), true)
					end
				end
			end,
			TPLeviathan = function(_, arg2)
				local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")
				local waterBasePlane = workspace.Map:FindFirstChild("WaterBase-Plane")

				if (Vector3.new(0, waterBasePlane.Position.Y, 0) - Vector3.new(0, humanoidRootPart2.Position.Y, 0)).Magnitude <= 175 then
					module.TweenModule:to(humanoidRootPart2.CFrame * CFrame.new(0, 80, 0), true)
				else
					module.TweenModule:to(CFrame.new(humanoidRootPart2.Position.X, waterBasePlane.Position.Y + 120, humanoidRootPart2.Position.Z), true)
				end
			end,
			GetLocalBoat = function(_, arg2)
				local v7 = next
				local children2, v8 = workspace.Boats:GetChildren()

				for _, v9 in v7, children2, v8 do
					local flag7 = v9 and v9.Parent and v9:FindFirstChild("Humanoid") and v9.Humanoid.Value > 0

					if flag7 then
						local localPlayer2 = game.Players.LocalPlayer
						flag7 = v9:WaitForChild("Owner").Value == localPlayer2
					end

					if flag7 and (not arg2 or v9.Name == arg2) and module.SubFunction:GetDistance(v9.VehicleSeat.Position) <= 3000 then
						return v9
					end
				end
			end,
			GetSeaBeast = function(_, arg2)
				local v7 = next
				local children2, v8 = workspace.SeaBeasts:GetChildren()
				local huge = math.huge
				local v9 = nil

				for _, v10 in v7, children2, v8 do
					local flag7 = v10.Name == "SeaBeast1" and v10:FindFirstChild("HumanoidRootPart") and module.SubFunction:GetDistance(v10.HumanoidRootPart.Position) <= huge
					local flag8

					if flag7 then
						flag8 = not arg2 or module.SubFunction:GetDistance(v10.HumanoidRootPart.Position) <= arg2
					else
						flag8 = flag7
					end

					if flag8 then
						if v10:FindFirstChild("Health") and v10.Health.Value > 0 then
							huge = module.SubFunction:GetDistance(v10.HumanoidRootPart.Position)
							v9 = v10
						end
					end
				end

				return v9
			end,
			GetSkills = function(_, arg2, arg3)
				if not arg3 then
					return
				end
				local tbl18 = {}

				for k, v7 in pairs(arg3) do
					if v7 then
						table.insert(tbl18, k)
					end
				end

				local v7 = next
				local children2, v8 = playerGui.Main.Skills:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9:IsA("Frame") and v9.Name ~= "Container" and v9.Name == module.SubFunction:GetWeaponName(arg2) then
						local v10 = next
						local children3, v11 = v9:GetChildren()

						for _, v12 in v10, children3, v11 do
							if v12:IsA("Frame") and v12.Name ~= "Template" and table.find(tbl18, v12.Name) and v12.Cooldown.AbsoluteSize.X <= 5 and v12.Title.TextColor3 == Color3.fromRGB(255, 255, 255) then
								return v12.Name
							end
						end
					end
				end
			end,
			EquipRandomTool = function()
				for _, v7 in pairs({ "Melee", "Sword", "Gun", "Blox Fruit" }) do
					module.AttackModule:EquipWeapon(v7)
				end
			end,
			CheckSafeZone = function(_, arg2)
				local v7 = next
				local children2, v8 = workspace._WorldOrigin.SafeZones:GetChildren()

				for _, v9 in v7, children2, v8 do
					v9 = v9 and module.SubFunction:GetDistance(arg2.Position, v9.Position) <= 1000
					if v9 then
						return true
					end
				end

				return false
			end,
			IsRaiding = function(_, arg2)
				local v7 = next
				local children2, v8 = workspace._WorldOrigin.Locations:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9.Name == "Island 1" and module.SubFunction:GetDistance(arg2.Position, v9.Position) <= 10000 then
						return true
					end
				end

				return false
			end,
			AutoSpamSkill = function(arg)
				local skills = arg:GetSkills("Melee", tbl11.MeleeSkills)
				local skills2 = arg:GetSkills("Sword", tbl11.SwordSkills)
				local skills3 = arg:GetSkills("Gun", tbl11.GunSkills)
				local skills4 = arg:GetSkills("Blox Fruit", tbl11.BFSkills)

				if skills and tbl11.SpamMelee then
					module.AttackModule:EquipWeapon("Melee")
					module.FarmFunction:SendKeys(skills)
				elseif skills2 and tbl11.SpamSword then
					module.AttackModule:EquipWeapon("Sword")
					module.FarmFunction:SendKeys(skills2)
				elseif skills3 and tbl11.SpamGun then
					module.AttackModule:EquipWeapon("Gun")
					module.FarmFunction:SendKeys(skills3)
				elseif skills4 and tbl11.SpamBF then
					module.AttackModule:EquipWeapon("Blox Fruit")
					module.FarmFunction:SendKeys(skills4)
				else
					arg:EquipRandomTool()
				end
			end,
			MakeESP = function(_, name, parent, text, arg2, arg3)
				if not parent or parent:FindFirstChild(name) then
					return
				end
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = name
				billboardGui.Parent = parent
				billboardGui.Size = UDim2.new(0, 200, 0, 50)
				billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
				billboardGui.AlwaysOnTop = true
				local textLabel = Instance.new("TextLabel")
				textLabel.Parent = billboardGui
				textLabel.Name = "Name_" .. name
				textLabel.Size = UDim2.fromScale(1, 1)
				textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.BackgroundTransparency = 1
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.TextSize = 20
				textLabel.RichText = true
				textLabel.Font = Enum.Font.Nunito
				textLabel.Text = text

				spawn(function()
					while task.wait(0.1) do
						if not parent or not parent.Parent or tbl11[arg2] == false or arg3 and arg3() == true then
							billboardGui:Destroy()
							break
						else
							textLabel.Text = text .. " [" .. tostring(math.floor((parent.Position - humanoidRootPart.Position).Magnitude)) .. "]"
						end
					end
				end)
			end,
			ESPPlayers = function(arg, arg2)
				if not arg2.Character or arg2.Character:FindFirstChild("ESPPlayer") or not arg2.Character:FindFirstChild("Humanoid") then
					return
				end
				local str3 = tostring(arg2.Team) == "Pirates" and "<font color='rgb(255,0,0)'>[Pirate]</font>" or "<font color='rgb(0,0,255)'>[Marine]</font>"
				local character2 = arg2.Character

				local ok, result = pcall(function()
					arg:MakeESP("ESPPlayers", arg2.Character.HumanoidRootPart, "<b>" .. arg2.Name .. "</b> " .. str3 .. " <font color='rgb(0,255,0)'>[" .. tostring(arg2.Character.Humanoid.MaxHealth) .. "/" .. tostring(arg2.Character.Humanoid.Health) .. "]</font>", "ESPPlayers", function()
						return not character2 or not character2:FindFirstChild("Humanoid")
					end)
				end)

				if not ok then
					print(result)
					return
				end
			end,
			ESPIslands = function(arg, arg2)
				if not arg2 or not arg2.Parent or not arg2:IsA("BasePart") then
					return
				end

				local ok, result = pcall(function()
					arg:MakeESP("ESPIslands", arg2, "<b>" .. arg2.Name .. "</b>", "ESPIslands", function()
						return not arg2 or not arg2.Parent
					end)
				end)

				if not ok then
					print(result)
					return
				end
			end,
			ESPChests = function(arg, arg2)
				if not arg2 or not arg2.Parent or not arg2:IsA("BasePart") or arg2:GetAttribute("IsDisabled") then
					return
				end

				local ok, result = pcall(function()
					arg:MakeESP("ESPChests", arg2, "<b>" .. arg2.Name .. "</b>", "ESPChests", function()
						return not arg2 or not arg2.Parent or arg2:GetAttribute("IsDisabled")
					end)
				end)

				if not ok then
					print(result)
					return
				end
			end,
			ESPBloxFruits = function(arg, arg2)
				if not arg2 or not arg2.Parent then
					return
				end

				local ok, result = pcall(function()
					arg:MakeESP("ESPFruits", arg2, "<b>" .. arg2.Name .. "</b>", "ESPFruits", function()
						return not arg2 or not arg2.Parent
					end)
				end)

				if not ok then
					print(result)
					return
				end
			end,
			BuyBoat = function(arg, arg2)
				local localBoat = arg:GetLocalBoat(arg2)
				local cframe2 = CFrame.new(-16921, 9, 471)

				if not localBoat then
					if module.SubFunction:GetDistance(cframe2) <= 30 then
						commF:InvokeServer("BuyBoat", arg2 or "Guardian")
						wait(0.5)
					else
						module.TweenModule:to(cframe2, true)
					end
				end
			end,
			GetShip = function()
				local tbl18 = { "PirateBasic", "PirateBrigade", "FishBoat", "PirateGrandBrigade" }
				local v7 = next
				local children2, v8 = workspace.Enemies:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9 and v9.Parent and table.find(tbl18, v9.Name) and v9:FindFirstChild("Health") and v9.Health.Value > 0 and module.SubFunction:GetDistance(v9.Engine.Position) <= 2500 then
						return v9
					end
				end
			end,
			GetZoneSelected = function()
				if tbl11.SelectZone == "Zone 1" or tbl11.SelectZone == nil then
					return Vector3.new(-21354.006, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Zone 2" then
					return Vector3.new(-25180.498, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Zone 3" then
					return Vector3.new(-29086.07, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Zone 4" then
					return Vector3.new(-32046.496, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Zone 5" then
					return Vector3.new(-36872.727, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Zone 6" then
					return Vector3.new(-45061.586, 37.187046, 656.75134)
				end

				if tbl11.SelectZone == "Infinity" then
					return Vector3.new(-100000000, 37.187046, 656.75134)
				end
			end,
			NoClipBoat = function(arg, arg2)
				local localBoat = arg:GetLocalBoat()

				if arg2 and localBoat then
					for _, descendant in pairs(localBoat:GetDescendants()) do
						if (descendant:IsA("BasePart") or descendant:IsA("Part")) and descendant.CanCollide then
							descendant.CanCollide = false
						end
					end
				elseif localBoat then
					for _, descendant in pairs(localBoat:GetDescendants()) do
						if (descendant:IsA("BasePart") or descendant:IsA("Part")) and descendant.CanCollide == false then
							descendant.CanCollide = true
						end
					end
				end
			end,
			KeepShipSafe = function(arg, arg2)
				local localBoat = arg:GetLocalBoat(arg2)

				if localBoat then
					local z = humanoidRootPart.CFrame.Z
					localBoat.VehicleSeat.CFrame = CFrame.new(humanoidRootPart.CFrame.X + math.random(-500, 500), math.random(200, 650), z + math.random(-500, 500))
				end
			end,
		}
	end

	tbl17.RunFastAttack = function()
		local tbl18 = {}
		local combatRemoteThread = require(replicatedStorage.Modules:WaitForChild("Flags")).COMBAT_REMOTE_THREAD or false

		local ok, result = pcall(function()
			return getupvalue(require(game.ReplicatedStorage.Controllers.CombatController).Attack, 9)
		end)

		tbl18.IsBuddhaTransform = function()
			return data.DevilFruit.Value == "Buddha-Buddha" and character.Humanoid.BodyWidthScale.Value >= 3
		end

		tbl18.GetBladeHits = function()
			local tbl19 = {}
			local v7 = next
			local children2, v8 = workspace.Enemies:GetChildren()

			for _, v9 in v7, children2, v8 do
				if v9 and v9:IsA("Model") and not v9:FindFirstChild("VehicleSeat") and v9:FindFirstChild("Humanoid") and v9.Humanoid.Health > 0 and v9:FindFirstChild("HumanoidRootPart") and (v9.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude <= 100 then
					table.insert(tbl19, v9)
				end
			end

			local v9 = next
			local children3, v10 = workspace.Characters:GetChildren()

			for _, v11 in v9, children3, v10 do
				if v11 and v11.Name ~= localPlayer.Name and v11:IsA("Model") and v11:FindFirstChild("Humanoid") and v11.Humanoid.Health > 0 and (v11.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude <= 100 then
					table.insert(tbl19, v11)
				end
			end

			return tbl19
		end

		tbl18.GetValidator2 = function()
			local v7 = getupvalue(result, 15)
			local v8 = getupvalue(result, 13)
			local v9 = getupvalue(result, 16)
			local v10 = getupvalue(result, 17)
			local v11 = getupvalue(result, 14)
			local v12 = getupvalue(result, 12)
			local v13 = getupvalue(result, 18)
			local n4 = ((v11 * v8 + v12 * v7) % v9 * v9 + v12 * v8) % v10
			local n5 = math.floor(n4 / v9)
			local n6 = v13 + 1
			setupvalue(result, 15, v7)
			setupvalue(result, 13, v8)
			setupvalue(result, 16, v9)
			setupvalue(result, 17, v10)
			setupvalue(result, 14, n5)
			setupvalue(result, 12, n4 - n5 * v9)
			setupvalue(result, 18, n6)
			return math.floor(n4 / v10 * 16777215), n6
		end

		local function fn23()
			local bladeHits = tbl18:GetBladeHits()
			local tool = character:FindFirstChildOfClass("Tool")
			local tbl19 = {}

			if #bladeHits > 0 then
				if tool then
					if tool.ToolTip == "Blox Fruit" then
						local leftClickRemote = tool:FindFirstChild("LeftClickRemote")

						if leftClickRemote and leftClickRemote:IsA("RemoteEvent") then
							leftClickRemote:FireServer(Vector3.new(0, -500, 0), math.random(1, 4), true)
							task.wait(0.01)
							leftClickRemote:FireServer(false)
						end
					elseif tool.ToolTip == "Melee" or tool.ToolTip == "Sword" then
						for _, v7 in next, bladeHits, nil do
							if v7 and v7:FindFirstChild("HumanoidRootPart") then
								table.insert(tbl19, { v7, v7.HumanoidRootPart })
							end
						end

						if #tbl19 >= 1 then
							local v7 = tbl19[1][2]
							replicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack"):FireServer(0)

							if combatRemoteThread then
								HitFunc(v7, tbl19)
							else
								replicatedStorage.Modules.Net:WaitForChild("RE/RegisterHit"):FireServer(v7, tbl19)
							end
						end
					elseif tool.ToolTip == "Gun" then
						for _, child in pairs(workspace.SeaBeasts:GetChildren()) do
							if child and child:FindFirstChild("Health") and child.Health.Value > 0 and not table.find(bladeHits, child) then
								table.insert(bladeHits, child)
							end
						end

						if tool.Name == "Dragonstorm" then
							for _, bladeHit in pairs(bladeHits) do
								if bladeHit and bladeHit.Parent then
									tool:SetAttribute("LocalTotalShots", (tool:GetAttribute("LocalTotalShots") or 0) + 1)
									validator2:FireServer(tbl18:GetValidator2())
									reShootGunEvent:FireServer(bladeHit.HumanoidRootPart.Position, { bladeHit.HumanoidRootPart })
								end
							end
						end
					end
				end
			end
		end

		spawn(function()
			while wait() do
				local ok2, result2 = pcall(fn23)

				if not ok2 then
					print("[⚠️] Fast Attack Bugs:", result2)
				end
			end
		end)

		print("[✅] Loaded Fast Attack Success!")
	end

	tbl17.StartFunction = function(arg)
		local createFunc = arg.Module.CreateFunc
		local questModule = arg.Module.QuestModule
		local subFunction = arg.Module.SubFunction
		local attackModule = arg.Module.AttackModule
		local farmFunction = arg.Module.FarmFunction
		local tweenModule = arg.Module.TweenModule
		local tbl18 = { "Deandre", "Diablo", "Urban" }

		local function fn23()
			flag = false
			v3 = nil
		end

		local function fn24()
			if commF:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
				if commF:InvokeServer("TalkTrevor", "1") ~= 0 then
					if subFunction:CheckFruits(true) then
						return true
					end
				elseif not commF:InvokeServer("ZQuestProgress", "Check") then
					if farmFunction:GetMobs("Don Swan", true) then
						return true
					end
				elseif commF:InvokeServer("ZQuestProgress", "Check") == 0 then
					return true
				end
			end
		end

		local function fn25()
			if tbl11.AutoShark and farmFunction:GetMobs("Shark", nil, 2500) then
				return true
			end

			if tbl11.AutoFishCrewMember and farmFunction:GetMobs("Fish Crew Member", nil, 2500) then
				return true
			end

			if tbl11.AutoPiranha and farmFunction:GetMobs("Piranha", nil, 2500) then
				return true
			end

			if tbl11.AutoTerrorShark and farmFunction:GetMobs("Terrorshark", nil, 2500) then
				return true
			end
			return false
		end

		local function fn26(arg2)
			if arg2 == 1 then
				local flag7 = tbl11.AutoBuyMelee and tbl11.SelectMeleeBuy ~= ""

				if flag7 then
					local selectMeleeBuy = tbl11.SelectMeleeBuy
					flag7 = arg.Module.SubFunction:GetWeaponName("Melee") ~= selectMeleeBuy
				end

				if flag7 then
					return true
				end

				if tbl11.AutoElite and farmFunction:GetMobs(tbl18, true) and attribute == "Sea3" then
					return true
				end

				if tbl11.AutoBartilo and not subFunction:GetItemInventory("Warrior Helmet") and flag5 and (commF:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 or commF:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 and farmFunction:GetMobs("Jeremy", true)) then
					return true
				end

				if tbl11.AutoDressrosa and flag4 and commF:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 and level.Value >= 700 then
					return true
				end

				if tbl11.AutoZou and flag5 and fn24() and level.Value >= 1500 then
					return true
				end

				if tbl11.AutoDoughKing and flag6 and farmFunction:GetMobs("Dough King", true) then
					return true
				end

				if tbl11.AutoRipIndra and flag6 and farmFunction:GetMobs({ "rip_indra", "rip_indra True Form" }, true) then
					return true
				end

				if tbl11.Yama and flag6 and commF:InvokeServer("EliteHunter", "Progress") >= 30 and not subFunction:GetItemInventory("Yama") then
					return true
				end
			end

			return false
		end

		createFunc("Auto Farm Level", function()
			if fn26(1) then
				return
			end
			local v7 = questModule:QuestLevel()
			local cFrameQuest = questModule:GetCFrameQuest()

			if subFunction:CheckQuest(v7.NameMob) then
				local mobs = farmFunction:GetMobs(v7.NameMob)
				if mobs then
					return attackModule:Kill(mobs)
				end
				farmFunction:TPSpawnMob(v7.NameMob, "Auto Farm Level")
			elseif cFrameQuest then
				subFunction:ClaimQuest(cFrameQuest, "StartQuest", v7.NameQuest, v7.NumberQuest)
			end
		end, true, true)

		createFunc("Auto Katakuri", function()
			if fn26(1) then
				return
			end
			local questCake = questModule.QuestCake
			local mobs = farmFunction:GetMobs("Cake Prince", true)

			if mobs then
				if not (subFunction:GetDistance(mobs.HumanoidRootPart) >= 1500) then
					return attackModule:Kill(mobs)
				end

				if workspace.Map:FindFirstChild("CakeLoaf") and workspace.Map.CakeLoaf:FindFirstChild("BigMirror") and workspace.Map.CakeLoaf.BigMirror:FindFirstChild("Main") then
					fn23()
					firetouchinterest(humanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 0)
					task.wait(0.1)
					firetouchinterest(humanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 1)
				else
					tweenModule:to(CFrame.new(-2124, 69, -12401))
				end
			else
				if commF:InvokeServer("CakePrinceSpawner", true):find("open portal") then
					commF:InvokeServer("CakePrinceSpawner")
				end

				if tbl11["Auto Katakuri [ HOP ]"] then
					subFunction:HopApi("CakePrince")
					wait(2)
				elseif tbl11["Accept Quests"] and level.Value >= 2200 and not subFunction:CheckQuest(questCake.NameMob) then
					subFunction:ClaimQuest(CFrame.new(-2020, 45, -12029), "StartQuest", "CakeQuest1", 1)
				elseif not tbl11["Accept Quests"] or level.Value < 2200 or subFunction:CheckQuest(questCake.NameMob) then
					local mobs2 = farmFunction:GetMobs(questCake.Mobs)
					if mobs2 then
						return attackModule:Kill(mobs2)
					end
					farmFunction:TPSpawnMob(questCake.Mobs, "Auto Katakuri")
				end
			end
		end, flag6, true)

		createFunc("Auto Bones", function()
			if fn26(1) then
				return
			end
			local questBone = questModule.QuestBone

			if tbl11["Accept Quests"] and level.Value >= 2025 and not subFunction:CheckQuest(questBone.NameMob) then
				local nameQuest = questBone.NameQuest
				local numberQuest = questBone.NumberQuest
				subFunction:ClaimQuest(CFrame.new(-9514, 172, 6078), "StartQuest", nameQuest, numberQuest)
			elseif not tbl11["Accept Quests"] or level.Value < 2025 or subFunction:CheckQuest(questBone.NameMob) then
				local mobs = farmFunction:GetMobs(questBone.Mobs)
				if mobs then
					return attackModule:Kill(mobs)
				end
				farmFunction:TPSpawnMob(questBone.Mobs, "Auto Bones")
			end
		end, flag6, true)

		createFunc("AutoChestTween", function()
			local chest = farmFunction:GetChest()

			if chest then
				tweenModule:to(chest:GetPivot(), true)

				if subFunction:GetDistance(chest:GetPivot()) <= 10 then
					local now2 = tick()
					firetouchinterest(chest, humanoidRootPart, 0)
					firetouchinterest(chest, humanoidRootPart, 1)
					firesignal(chest.Touched, humanoidRootPart)

					if tick() - now2 >= 1 and not chest:GetAttribute("IsDisabled") then
						chest:SetAttribute("IsDisabled", true)
					end
				end
			end
		end, true, true)

		createFunc("AutoChestTP", function()
			local chest = farmFunction:GetChest()

			if chest then
				character:PivotTo(chest:GetPivot())

				if subFunction:GetDistance(chest:GetPivot()) <= 10 then
					firetouchinterest(chest, humanoidRootPart, 0)
					firetouchinterest(chest, humanoidRootPart, 1)
					firesignal(chest.Touched, humanoidRootPart)
				end
			end
		end, true, true)

		createFunc("AutoElite", function()
			local mobs = farmFunction:GetMobs(tbl18, true)

			if mobs then
				if subFunction:CheckQuest(mobs.Name) then
					return attackModule:Kill(mobs)
				end
				commF:InvokeServer("EliteHunter")
			end
		end, flag6, true)

		createFunc("AutoDressrosa", function()
			if commF:InvokeServer("DressrosaQuestProgress", "Dressrosa") == 0 then
				wait(0.5)
				commF:InvokeServer("TravelDressrosa")
				return
			end

			if workspace.Map.Ice.Door.CanCollide then
				if not subFunction:CheckItem("Key") then
					commF:InvokeServer("DressrosaQuestProgress", "Detective")
				else
					subFunction:EquipToolName("Key")

					if character:FindFirstChild("Key") then
						firetouchinterest(character.Key.Handle, workspace.Map.Ice.Door, 0)
						firetouchinterest(character.Key.Handle, workspace.Map.Ice.Door, 1)
					end
				end
			else
				local mobs = farmFunction:GetMobs("Ice Admiral", true)
				if mobs then
					return attackModule:Kill(mobs)
				end
				tweenModule:to(CFrame.new(1345, 37, -1329))
			end
		end, flag4, true)

		createFunc("AutoBuyMelee", function()
			if tbl11.SelectMeleeBuy and tbl11.SelectMeleeBuy ~= "" then
				arg.Module.FarmFunction:BuyMelee(tbl11.SelectMeleeBuy)
			end
		end, true)

		createFunc("AutoBartilo", function()
			if commF:InvokeServer("BartiloQuestProgress", "Bartilo") ~= 3 and not subFunction:GetItemInventory("Warrior Helmet") then
				local response = commF:InvokeServer("BartiloQuestProgress", "Bartilo")

				if response == 0 then
					if not subFunction:CheckQuest("Swan Pirate") then
						subFunction:ClaimQuest(CFrame.new(-456, 73, 299), "StartQuest", "BartiloQuest", 1)
					else
						local mobs = farmFunction:GetMobs("Swan Pirate")
						if mobs then
							return attackModule:Kill(mobs)
						end
						farmFunction:TPSpawnMob("Swan Pirate", "AutoBartilo")
					end
				elseif response == 1 then
					local mobs = farmFunction:GetMobs("Jeremy", true)

					if mobs then
						attackModule:Kill(mobs)
					end
				elseif response == 2 then
					commF:InvokeServer("BartiloQuestProgress", "DidPlates")
				end
			end
		end, flag5, true)

		createFunc("AutoDarkbeard", function()
			if farmFunction:GetMobs("Darkbeard", true) then
				local mobs = farmFunction:GetMobs("Darkbeard", true)
				return attackModule:Kill(mobs)
			end

			if subFunction:CheckItem("Fist of Darkness") then
				subFunction:EquipToolName("Fist of Darkness")
				tweenModule:to(CFrame.new(3779, 16, -3500))
			end
		end, flag5, true)

		createFunc("Saber", function()
			if not subFunction:GetItemInventory("Saber") then
				local jungle = workspace.Map:WaitForChild("Jungle")

				if jungle.Final.Part.CanCollide then
					if jungle.QuestPlates.Door.CanCollide then
						local v7 = next
						local children2, v8 = jungle.QuestPlates:GetChildren()

						for _, v9 in v7, children2, v8 do
							if v9:FindFirstChild("Button") and v9.Button:FindFirstChild("TouchInterest") then
								firetouchinterest(v9.Button, humanoidRootPart, 0)
								firetouchinterest(v9.Button, humanoidRootPart, 1)
							end
						end
					elseif workspace.Map.Desert:FindFirstChild("Burn") and workspace.Map.Desert.Burn.Part.CanCollide then
						if not subFunction:CheckItem("Torch") then
							firetouchinterest(jungle.Torch, humanoidRootPart, 0)
							firetouchinterest(jungle.Torch, humanoidRootPart, 1)
						elseif workspace.Map.Desert:FindFirstChild("Burn") then
							commF:InvokeServer("ProQuestProgress", "DestroyTorch")
							task.wait()
							workspace.Map.Desert.Burn:Destroy()
						end
					else
						local response = commF:InvokeServer("ProQuestProgress", "RichSon")

						if response ~= 0 and response ~= 1 then
							if not subFunction:CheckItem("Cup") then
								commF:InvokeServer("ProQuestProgress", "GetCup")
							else
								subFunction:EquipToolName("Cup")
								commF:InvokeServer("ProQuestProgress", "FillCup", character:FindFirstChild("Cup"))
								commF:InvokeServer("ProQuestProgress", "SickMan")
							end
						elseif response == 0 then
							local mobs = farmFunction:GetMobs("Mob Leader", true)
							if mobs then
								return attackModule:Kill(mobs)
							end
							farmFunction:TPSpawnMob("Mob Leader", "Saber")
						elseif response == 1 then
							if not subFunction:CheckItem("Relic") then
								commF:InvokeServer("ProQuestProgress", "RichSon")
							else
								subFunction:EquipToolName("Relic")
								task.wait(0.1)
								firetouchinterest(character.Relic.Handle, jungle.Final.Invis, 0)
								firetouchinterest(character.Relic.Handle, jungle.Final.Invis, 1)
							end
						end
					end
				else
					local mobs = farmFunction:GetMobs("Saber Expert", true)
					if mobs then
						return attackModule:Kill(mobs)
					end
				end
			end
		end, flag4, true)

		createFunc("Pole", function()
			local mobs = farmFunction:GetMobs("Thunder God", true)
			if mobs then
				return attackModule:Kill(mobs)
			end
		end, flag4, true)

		createFunc("AutoCursedCaptain", function()
			local mobs = farmFunction:GetMobs("Cursed Captain", true)
			if mobs then
				return attackModule:Kill(mobs)
			end
		end, flag5, true)

		createFunc("AutoRipIndra", function()
			local mobs = farmFunction:GetMobs({ "rip_indra", "rip_indra True Form" }, true)
			if mobs then
				return attackModule:Kill(mobs)
			end
		end, flag6, true)

		createFunc("AutoZou", function()
			if level.Value >= 1500 and commF:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
				if commF:InvokeServer("TalkTrevor", "1") ~= 0 then
					if not subFunction:CheckFruits(true) then
						commF:InvokeServer("LoadFruit", subFunction:GetFruitInventory())
						task.wait(1)
					else
						local npcPos = subFunction:GetNPCPos("Trevor")

						if subFunction:GetDistance(npcPos) <= 15 then
							subFunction:EquipToolName(subFunction:CheckFruits(true).Name)

							for i = 1, 3 do
								commF:InvokeServer("TalkTrevor", tostring(i))
							end
						else
							tweenModule:to(npcPos)
						end
					end
				elseif not commF:InvokeServer("ZQuestProgress", "Check") then
					local mobs = farmFunction:GetMobs("Don Swan", true)
					if mobs then
						return attackModule:Kill(mobs)
					end
					farmFunction:TPSpawnMob("Don Swan")

					spawn(function()
						subFunction:HopServers()
					end)
				elseif commF:InvokeServer("ZQuestProgress", "Check") == 0 then
					if subFunction:GetDistance(workspace.Map.IndraIsland.Part.Position) > 1000 then
						local npcPos = subFunction:GetNPCPos("King Red Head")

						if subFunction:GetDistance(npcPos) <= 30 then
							wait(0.1)
							commF:InvokeServer("ZQuestProgress", "Begin")
						else
							tweenModule:to(npcPos)
						end
					else
						local mobs = farmFunction:GetMobs("rip_indra", true)
						if mobs then
							commF:InvokeServer("TravelZou")
							return attackModule.Attack(mobs)
						end
					end
				end
			end
		end, flag5, true)

		createFunc("Yama", function()
			if subFunction:GetItemInventory("Yama") then
				return
			end

			if commF:InvokeServer("EliteHunter", "Progress") >= 30 then
				if not workspace.Map:FindFirstChild("Waterfall") or not workspace.Map.Waterfall:FindFirstChild("SealedKatana") then
					tweenModule:to(CFrame.new(5250.71924, 19.842907, 453.177002), true)
				elseif subFunction:GetDistance(workspace.Map.Waterfall.SealedKatana.Hitbox.Position) <= 15 then
					fireclickdetector(workspace.Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
				else
					tweenModule:to(workspace.Map.Waterfall.SealedKatana.Hitbox.CFrame, true)
				end
			end
		end, flag6)

		createFunc("Tushita", function()
			if subFunction:GetItemInventory("Tushita") or level.Value < 2000 then
				return
			end

			if not commF:InvokeServer("TushitaProgress").OpenedDoor then
				if farmFunction:GetMobs({ "rip_indra", "rip_indra True Form" }, true) then
					if not subFunction:CheckItem("Holy Torch") then
						tweenModule:to(CFrame.new(5717.06592, 18.8161335, 252.124573, 0.926925123, -3.25000045e-08, -0.375246346, 3.45466091e-08, 1, -1.2735254e-09, 0.375246346, -1.17830261e-08, 0.926925123))
					else
						subFunction:EquipToolName("Holy Torch")

						for i = 1, 5 do
							commF:InvokeServer("TushitaProgress", "Torch", i)
						end
					end
				end
			else
				local mobs = farmFunction:GetMobs("Longma", true)
				if mobs then
					return attackModule:Kill(mobs)
				end

				if not mobs then
					farmFunction:TPSpawnMob("Longma")

					spawn(function()
						subFunction:HopServers()
					end)
				end
			end
		end, flag6, true)

		createFunc("AutoSoulReaper", function()
			if farmFunction:GetMobs("Soul Reaper", true) then
				local mobs = farmFunction:GetMobs("Soul Reaper", true)
				return attackModule:Kill(mobs)
			end

			if subFunction:CheckItem("Hallow Essence") then
				subFunction:EquipToolName("Hallow Essence")
				tweenModule:to(CFrame.new(-8934, 142, 6036))
			end
		end, flag6, true)

		createFunc("AutoDoughKing", function()
			local mobs = farmFunction:GetMobs("Dough King", true)

			if mobs then
				if not (subFunction:GetDistance(mobs.HumanoidRootPart) >= 1500) then
					return attackModule:Kill(mobs)
				end

				if workspace.Map:FindFirstChild("CakeLoaf") and workspace.Map.CakeLoaf:FindFirstChild("BigMirror") and workspace.Map.CakeLoaf.BigMirror:FindFirstChild("Main") then
					fn23()
					firetouchinterest(humanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 0)
					task.wait(0.1)
					firetouchinterest(humanoidRootPart, workspace.Map.CakeLoaf.BigMirror.Main, 1)
				else
					tweenModule:to(CFrame.new(-2124, 69, -12401))
				end
			else
				if commF:InvokeServer("CakePrinceSpawner", true):find("open portal") then
					commF:InvokeServer("CakePrinceSpawner")
				end

				local questCake = questModule.QuestCake

				if subFunction:CheckItem("Sweet Chalice") then
					local mobs2 = farmFunction:GetMobs(questCake.Mobs)
					if mobs2 then
						return attackModule:Kill(mobs2)
					end
					farmFunction:TPSpawnMob(questCake.Mobs, "AutoDoughKing")
				elseif subFunction:CheckItem("God's Chalice") then
					if subFunction:GetMaterial("Conjured Cocoa") >= 10 then
						commF:InvokeServer("SweetChaliceNpc")
					else
						local tbl19 = { "Cocoa Warrior", "Chocolate Bar Battler" }
						local mobs2 = farmFunction:GetMobs(tbl19)
						if mobs2 then
							return attackModule:Kill(mobs2)
						end
						farmFunction:TPSpawnMob(tbl19, "AutoDoughKing")
					end
				end
			end
		end, flag6, true)

		createFunc("AutoCDK", function()
		end, flag6, true)

		createFunc("TPFruit", function()
			local fruit = farmFunction:GetFruit()

			if fruit then
				tweenModule:to(fruit.Handle.CFrame, true)
			end
		end, true)

		createFunc("AutoV2V3", function()
			local v7 = subFunction:CheckRace()

			if v7 == "V1" then
				for i = 1, 2 do
					commF:InvokeServer("Alchemist", tostring(i))
					task.wait(0.1)
				end

				if subFunction:CheckItem("Flower 1") and subFunction:CheckItem("Flower 2") and subFunction:CheckItem("Flower 3") then
					commF:InvokeServer("Alchemist", "3")
				elseif not subFunction:CheckItem("Flower 1") then
					if game.Lighting.ClockTime > 3 and game.Lighting.ClockTime < 16 then
						subFunction:HopServers()
						return
					end
					tweenModule:to(workspace.Flower1.CFrame)
				elseif not subFunction:CheckItem("Flower 2") then
					tweenModule:to(workspace.Flower2.CFrame)
				elseif not subFunction:CheckItem("Flower 3") then
					local mobs = farmFunction:GetMobs({ "Ship Deckhand", "Ship Engineer", "Ship Steward" })
					if mobs then
						return attackModule:Kill(mobs)
					end
					farmFunction:TPSpawnMob({ "Ship Deckhand", "Ship Engineer", "Ship Steward" }, "AutoV2V3")
				end
			elseif v7 == "V2" then
				spawn(function()
					if commF:InvokeServer("Wenlocktoad", "1") == 0 then
						print("Claim Quest Race V3")
						commF:InvokeServer("Wenlocktoad", "2")
					end

					commF:InvokeServer("Wenlocktoad", "3")
				end)

				local value2 = data.Race.Value

				if value2 == "Human" then
					local mobs = farmFunction:GetMobs({ "Diamond", "Jeremy", "Orbitus" }, true)
					if mobs then
						return attackModule:Kill(mobs)
					end

					if v7 ~= "V2" then
						return
					end
					subFunction:HopServers()
				elseif value2 == "Fishman" then
					if not farmFunction:GetSeaBeast() then
						local localBoat = farmFunction:GetLocalBoat("Guardian")

						if not localBoat then
							if subFunction:GetDistance(Vector3.new(-5334, 5, -695)) <= 15 then
								commF:InvokeServer("BuyBoat", "Guardian")
								wait(0.5)
							else
								tweenModule:to(CFrame.new(-5334, 5, -695), true)
							end
						else
							while true do
								task.wait()

								if character.Humanoid.Sit == false then
									tweenModule:to(localBoat.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
								else
									subFunction:TweenPart(localBoat.VehicleSeat, CFrame.new(Vector3.new(-4327.1753, 18.999872, 768.4105)))
								end

								if not (not localBoat or subFunction:GetDistance(Vector3.new(-4327.1753, 18.999872, 768.4105), nil, true) <= 200 or tbl11.AutoV2V3 == false or farmFunction:GetSeaBeast()) then
									continue
								end
								break
							end
						end
					else
						while true do
							task.wait()
							farmFunction:AutoSpamSkill()
							farmFunction:TPSeabeast(farmFunction:GetSeaBeast())
							if not (not farmFunction:GetSeaBeast() or tbl11.AutoV2V3 == false) then
								continue
							end
							break
						end
					end
				elseif value2 == "Mink" then
					local chest = farmFunction:GetChest()

					if chest then
						tweenModule:to(chest:GetPivot(), true)

						if subFunction:GetDistance(chest:GetPivot()) <= 10 then
							local now2 = tick()
							firetouchinterest(chest, humanoidRootPart, 0)
							firetouchinterest(chest, humanoidRootPart, 1)
							firesignal(chest.Touched, humanoidRootPart)

							if tick() - now2 >= 1 and not chest:GetAttribute("IsDisabled") then
								chest:SetAttribute("IsDisabled", true)
							end
						end
					end
				elseif value2 == "Cyborg" then
					if not subFunction:CheckFruits() then
						commF:InvokeServer("LoadFruit", subFunction:GetFruitInventory(true))
						wait(0.5)
					else
						subFunction:EquipToolName(subFunction:CheckFruits().Name)
					end
				elseif value2 == "Skypiea" then
					if not SkypieaPlayers then
						SkypieaPlayers = { Blacklist = {}, Target = {} }
					end

					if playerGui.Main.BottomHUDList.PvpDisabled.Visible then
						commF:InvokeServer("EnablePvp")
						return
					end
					local v8 = next
					local players2, v9 = players:GetPlayers()

					for _, v10 in v8, players2, v9 do
						if v10 and v10.Parent and v10.Name ~= localPlayer.Name and v10:FindFirstChild("Data") and v10.Data.Race.Value == "Skypiea" then
							print(v10.Character)
							print(farmFunction:CheckSafeZone(v10.Character.HumanoidRootPart))
							print(farmFunction:IsRaiding(v10.Character.HumanoidRootPart))
							print(not table.find(SkypieaPlayers.Blacklist, v10.Character))

							if v10.Character and not farmFunction:CheckSafeZone(v10.Character.HumanoidRootPart) and not farmFunction:IsRaiding(v10.Character.HumanoidRootPart) and not table.find(SkypieaPlayers.Blacklist, v10.Character) then
								table.insert(SkypieaPlayers.Target, v10.Character)
							end
						end
					end

					if #SkypieaPlayers.Target > 0 then
						for _, v10 in next, SkypieaPlayers.Target, nil do
							if farmFunction:IsAlive(v10) then
								while true do
									task.wait()

									if (subFunction:CheckNotify("died") or subFunction:CheckNotify("player")) and (v10.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude <= 100 then
										table.insert(SkypieaPlayers.Blacklist, v10.Character)
										break
									else
										attackModule:EquipWeapon()
										attackModule:EquipBuso()
										tweenModule:to(v10.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3), true)
										if not (not v10 or not v10.Parent or not farmFunction:IsAlive(v10) or tbl11.AutoV2V3 == false or value2 ~= "Skypiea" or v7 ~= "V2" or subFunction:CheckNotify("died") or subFunction:CheckNotify("player")) then
											continue
										end
									end

									break
								end

								if subFunction:CheckNotify("died") or subFunction:CheckNotify("player") then
									table.insert(SkypieaPlayers.Blacklist, v10.Character)
								end

								getgenv().EnableAim = false
								getgenv().AimPos = nil
							end
						end
					else
						subFunction:HopServers()
						wait(2)
					end
				elseif value2 == "Ghoul" then
					local v8 = next
					local children2, v9 = game.Workspace.Characters:GetChildren()

					for _, v10 in v8, children2, v9 do
						if v10 and not table.find(BlacklistedTarget, v10.Name) and v10 ~= localPlayer and farmFunction:IsAlive(v10) and not farmFunction:CheckSafeZone(v10.HumanoidRootPart) and not farmFunction:IsRaiding(v10.HumanoidRootPart) then
							while true do
								task.wait()

								if (subFunction:CheckNotify("died") or subFunction:CheckNotify("players") or farmFunction:CheckSafeZone(v10.HumanoidRootPart)) and subFunction:GetDistance(v10.HumanoidRootPart.Position) <= 50 then
									table.insert(BlacklistedTarget, v10.Name)

									if subFunction:CheckNotify("died") then
										subFunction:CheckNotify("died"):Destroy()
									end

									if subFunction:CheckNotify("players") then
										subFunction:CheckNotify("players"):Destroy()
									end

									break
								else
									attackModule:EquipWeapon()
									attackModule:EquipBuso()
									tweenModule:to(v10.HumanoidRootPart.CFrame * CFrame.new(0, 3, 3), true)
									if not (not v10 or not v10.Parent or not farmFunction:IsAlive(v10) or tbl11.AutoV2V3 == false or value2 ~= "Ghoul" or v7 ~= "V2") then
										continue
									end
								end

								break
							end
						end
					end
				end
			end
		end, flag5, true)

		createFunc("AutoPullLever", function()
			if subFunction:GetItemInventory("Mirror Fractal") and subFunction:GetItemInventory("Valkyrie Helm") then
				if not commF:InvokeServer("CheckTempleDoor") then
					local response = commF:InvokeServer("RaceV4Progress", "Check")

					if response == 1 then
						commF:InvokeServer("RaceV4Progress", "Begin")
					elseif response == 2 then
						if subFunction:GetDistance(CFrame.new(3033, 2281, -7324).Position) <= 10 then
							commF:InvokeServer("RaceV4Progress", "Teleport")
						else
							tweenModule:to(CFrame.new(3033, 2281, -7324))
						end
					elseif response == 3 then
						commF:InvokeServer("RaceV4Progress", "Continue")
					elseif subFunction:checkmirage() then
						local cFrame = subFunction:HighestPoint() and subFunction:HighestPoint().CFrame

						if not cFrame then
							cFrame = workspace.Map:FindFirstChild("MysticIsland"):GetPivot() * CFrame.new(0, 500, 0)
						end

						local v7 = subFunction:getbluegear()

						if v7 then
							if v7.Transparency == 0 and not v7.CanCollide then
								while true do
									wait()
									tweenModule:to(v7.CFrame, true)
									if not (not v7 or v7.Transparency == 1 or not v7.CanCollide) then
										continue
									end
									break
								end
							else
								while true do
									task.wait()

									if subFunction:GetDistance(cFrame) <= 50 then
										if game.Lighting.ClockTime >= 18 or game.Lighting.ClockTime < 5 then
											local currentCamera = workspace.CurrentCamera
											local cframe2 = CFrame.lookAt
											local position = workspace.CurrentCamera.CFrame.Position
											local Lighting = game:GetService("Lighting")
											local position2 = workspace.CurrentCamera.CFrame.Position
											currentCamera.CFrame = cframe2(position, Lighting:GetMoonDirection() + position2)
											commE:FireServer("ActivateAbility")
										else
											tweenModule:to(cFrame, true)
										end
									else
										tweenModule:to(cFrame, true)
									end

									if not (v7.Transparency == 0 and v7.CanCollide == false or not subFunction:checkmirage() or tbl11.AutoPullLever == false) then
										continue
									end
									break
								end
							end
						else
							tweenModule:to(cFrame, true)
						end
					elseif tbl11.AutoPullLeverHop and flag3 then
						subFunction:HopApi("Mirage")
						wait(1)
						return
					end
				end
			end
		end, flag6, true)

		local function fn27()
			if subFunction:CheckNotify("loading map...") or farmFunction:GetRaidIsland() then
				return
			end

			if not subFunction:CheckItem("Special Microchip") then
				if tbl11.GetMinValueFruitRaid then
					if not subFunction:CheckFruits() then
						commF:InvokeServer("LoadFruit", subFunction:GetFruitInventory(true))
						wait(0.1)
					else
						commF:InvokeServer("RaidsNpc", "Select", tbl11.SelectChip)
					end
				else
					commF:InvokeServer("RaidsNpc", "Select", tbl11.SelectChip)
				end
			end
		end

		createFunc("AutoBuyChip", fn27, flag5 or flag6)

		local function fn28()
			if subFunction:CheckNotify("loading map...") or farmFunction:GetRaidIsland() then
				return
			end

			if subFunction:CheckItem("Special Microchip") then
				if not flag5 then
					if flag6 then
						character:PivotTo(CFrame.new(-5069, 314, -2987))
					end
				end

				fireclickdetector(flag5 and workspace.Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector or workspace.Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
			end
		end

		createFunc("AutoStartRaid", fn28, flag5 or flag6)

		local function fn29()
			local response = commF:InvokeServer("Awakener", "Check")

			if response and response ~= 0 and response ~= 1 then
				commF:InvokeServer("Awakener", "Awaken")
			end
		end

		createFunc("AutoAwaken", fn29, flag5 or flag6)

		local function fn30()
			if playerGui.Main.TopHUDList.RaidTimer.Visible then
				local nearestMobs = farmFunction:GetNearestMobs()

				if nearestMobs then
					if table.find({ "Island 1", "Island 2", "Island 3" }, farmFunction:GetRaidIsland().Name) then
						return attackModule:Kill(nearestMobs)
					end
					nearestMobs.Humanoid:ChangeState(15)
					sethiddenproperty(localPlayer, "SimulationRadius", math.huge)
				else
					tweenModule:to(farmFunction:GetRaidIsland().CFrame * CFrame.new(0, 67, 0), true)
				end
			end
		end

		createFunc("AutoRaid", fn30, flag5 or flag6, true)

		createFunc("DeathStep", function()
			if commF:InvokeServer("BuyDeathStep", true) == 1 then
				farmFunction:BuyMelee("Death Step")
				return
			end
			local tool = subFunction:GetTool("Melee")

			if tool and tool.Name == "Black Leg" and tool:FindFirstChild("Level") and tool.Level.Value >= 400 then
				if not game.Workspace.Map:FindFirstChild("IceCastle") then
					tweenModule:to(CFrame.new(6379, 297, -6879))
					return
				end
				local phoeyuDoor = game.Workspace.Map.IceCastle:WaitForChild("Hall"):WaitForChild("LibraryDoor"):FindFirstChild("PhoeyuDoor")

				if phoeyuDoor and phoeyuDoor.CanCollide then
					if subFunction:CheckItem("Library Key") then
						subFunction:EquipToolName("Library Key")
						tweenModule:to(CFrame.new(6375.32568, 296.664825, -6842.70605, -0.67479372, -2.92396907e-09, -0.738006353, 2.7116652e-08, 1, -2.87560074e-08, 0.738006353, -3.94166371e-08, -0.67479372))
					else
						local mobs = farmFunction:GetMobs("Awakened Ice Admiral", true)
						if mobs then
							return attackModule:Kill(mobs)
						end
						wait(2)
						subFunction:HopServers()
					end
				else
					farmFunction:BuyMelee("Death Step")
				end
			elseif not tool or tool.Name ~= "Black Leg" then
				farmFunction:BuyMelee("Black Leg")
			end
		end, flag5, true)

		createFunc("ElectricClaw", function()
			if commF:InvokeServer("BuyElectricClaw", true) == 1 then
				farmFunction:BuyMelee("Electric Claw")
				return
			end
			local tool = subFunction:GetTool("Melee")

			if tool and tool.Name == "Electro" and tool:FindFirstChild("Level") and tool.Level.Value >= 400 then
				if not TalkElectricClawNPC then
					if subFunction:GetDistance(subFunction:GetNPCPos("Previous Hero")) <= 30 then
						TalkElectricClawNPC = true
					else
						tweenModule:to(subFunction:GetNPCPos("Previous Hero"))
					end
				elseif commF:InvokeServer("BuyElectricClaw", true) == 0 then
					arg.Module.FarmFunction:BuyMelee("Electric Claw")
				elseif not commF:InvokeServer("BuyElectricClaw", "Start") then
					commF:InvokeServer("BuyElectricClaw", "Start")
				elseif commF:InvokeServer("BuyElectricClaw", "Start") == 4 then
					tweenModule:to(CFrame.new(-12549, 337, -7470))
				end
			elseif not tool or tool.Name ~= "Electro" then
				arg.Module.FarmFunction:BuyMelee("Electro")
			end
		end, flag6)

		createFunc("AutoTrials", function()
			if ReallytoReset then
				tbl8.Feature["Upgraded Race"]["Auto Trials"]:SetValue(false)
				wait()
				ReallytoReset = false
				return
			end

			if not playerGui.Main.TopHUDList.RaidTimer.Visible then
				if arg.Module.SubFunction:GetDistance(CFrame.new(28310, 14895, 109)) > 1000 then
					arg.Module.TweenModule:to(CFrame.new(28310, 14895, 109))
					task.wait()
				else
					while true do
						wait()

						if arg.Module.SubFunction:GetDistance(tbl16[data.Race.Value].Entrance) <= 15 then
							if arg.Module.SubFunction:CheckPlayerTurnAbility() and tbl11.Autoturnv3nearLocalPlayer then
								commE:FireServer("ActivateAbility")
							end
						end

						arg.Module.TweenModule:to(tbl16[data.Race.Value].Entrance.CFrame, true)
						if not (ResetEnable or IsTrial or playerGui.Main.Timer.Visible or arg.Module.SubFunction:GetDistance(tbl16[game.Players.LocalPlayer.Data.Race.Value].Entrance) <= 15 or not tbl11.AutoTrials) then
							continue
						end
						break
					end
				end
			elseif playerGui.Main.TopHUDList.RaidTimer.Visible then
				local value2 = game.Players.LocalPlayer.Data.Race.Value

				if value2 == "Human" or value2 == "Ghoul" then
					local v7 = next
					local children2, v8 = workspace.Enemies:GetChildren()

					for _, v9 in v7, children2, v8 do
						if v9 and farmFunction:IsAlive(v9) and arg.Module.SubFunction:GetDistance(v9.HumanoidRootPart) <= 1000 then
							return attackModule:Kill(v9)
						end
					end
				elseif value2 == "Skypiea" then
					if workspace._WorldOrigin.Locations["Trial of the King"] and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace._WorldOrigin.Locations["Trial of the King"].CFrame.Position).Magnitude <= 1000 then
						arg.Module.TweenModule:to(workspace.Map.SkyTrial.Model.FinishPart.CFrame, true)
					end
				elseif value2 == "Mink" then
					if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - workspace._WorldOrigin.Locations["Trial of Speed"].Position).Magnitude <= 1000 then
						arg.Module.TweenModule:to(workspace.StartPoint.CFrame * CFrame.new(0, 2, 0))
					end
				elseif value2 == "Fishman" then
					local trialOfWater = workspace._WorldOrigin.Locations:FindFirstChild("Trial of Water")

					if trialOfWater and subFunction:GetDistance(trialOfWater) <= 1500 then
						local v7 = next
						local children2, v8 = workspace.SeaBeasts:GetChildren()

						for _, v9 in v7, children2, v8 do
							if v9.Name:find("SeaBeast") and v9:FindFirstChild("Health") and v9.Health.Value > 0 then
								while true do
									wait()

									if IsTrial == false then
										break
									else
										farmFunction:AutoSpamSkill()
										farmFunction:TPSeabeast(v9)
										if not (not subFunction:GetDistance(trialOfWater) > 1500 or not IsTrial or not v9 or not v9:FindFirstChild("Health") or v9.Health.Value <= 0 or not tbl11.AutoTrials) then
											continue
										end
										break
									end
								end
							end
						end
					end
				elseif value2 == "Cyborg" then
					if arg.Module.SubFunction:GetDistance(CFrame.new(-20021.8691, 10090.4893, -16.37994, -0.976144373, 6.71342875e-08, -0.217122361, 8.46145412e-08, 1, -7.1212007e-08, 0.217122361, -8.78849065e-08, -0.976144373)) <= 1000 then
						arg.Module.TweenModule:to(CFrame.new(-20021.8691, 10090.4893, -16.37994, -0.976144373, 6.71342875e-08, -0.217122361, 8.46145412e-08, 1, -7.1212007e-08, 0.217122361, -8.78849065e-08, -0.976144373))
					end
				end
			end
		end, flag6, true)

		createFunc("AutoResetTrial", function()
			if ResetEnable then
				character.Humanoid.Health = 0
				wait()
				ResetEnable = false
				IsTrial = false
				ReallytoReset = false
				wait(1)
				ResetEnable = false
				IsTrial = false
				ReallytoReset = false
				CanKillPlayer = false
			end
		end, flag6)

		createFunc("AutoKillPlayerAfterTrial", function()
			if not playerGui.Main.TopHUDList.RaidTimer.Visible and CanKillPlayer then
				CanKillPlayer = false
				return
			end

			if playerGui.Main.TopHUDList.RaidTimer.Visible and CanKillPlayer and subFunction:GetDistance(Vector3.new(28718, 14887, -60)) <= 300 then
				for _, child in pairs(workspace.Characters:GetChildren()) do
					if child and child.Name ~= localPlayer.Name and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and (Vector3.new(28718.068, 14887.5625, -60.548218) - child.HumanoidRootPart.Position).Magnitude <= 300 then
						while true do
							task.wait()
							attackModule:EquipBuso()
							attackModule:EquipWeapon()
							tweenModule:to(child.HumanoidRootPart.CFrame * CFrame.new(0, 5, 2), true)
							if not (not tbl11.AutoKillPlayerAfterTrial or not child:FindFirstChild("Humanoid") or child.Humanoid.Health <= 0 or not child:FindFirstChild("HumanoidRootPart") or ReallytoReset == false) then
								continue
							end
							break
						end
					end
				end
			end
		end, flag6, true)

		createFunc("AutoTrainRace", function()
			local raceEnergy = character:FindFirstChild("RaceEnergy")
			local raceTransformed = character:FindFirstChild("RaceTransformed")

			if raceEnergy and raceTransformed then
				if raceTransformed.Value == true then
					tweenModule:to(CFrame.new(-2019, 38, -12028), true)
				elseif raceEnergy.Value >= 1 and not raceTransformed.Value then
					localPlayer.Backpack:WaitForChild("Awakening").RemoteFunction:InvokeServer(true)
				else
					local questCake = questModule.QuestCake
					local mobs = farmFunction:GetMobs(questCake.Mobs)
					if mobs then
						return attackModule:Kill(mobs)
					end
					farmFunction:TPSpawnMob(questCake.Mobs, "AutoTrainRace")
				end
			end
		end, flag6, true)

		createFunc("AutoSkullGuitar", function()
			if not workspace.Map:FindFirstChild("Haunted Castle") then
				tweenModule:to(CFrame.new(-8654, 140, 6167), true)
				return
			end
			local hauntedCastle = workspace.Map["Haunted Castle"]

			if not commF:InvokeServer("GuitarPuzzleProgress", "Check") then
				if game.Lighting.Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" and (game.Lighting.ClockTime > 16 or game.Lighting.ClockTime < 5) then
					local cframe2 = CFrame.new(-8654, 140, 6167)

					if subFunction:GetDistance(cframe2) <= 30 then
						commF:InvokeServer("gravestoneEvent", 2)
						commF:InvokeServer("gravestoneEvent", 2, true)
					else
						tweenModule:to(cframe2)
					end
				else
					tweenModule:to(CFrame.new(-9502, 580, 6034))
				end
			elseif not commF:InvokeServer("GuitarPuzzleProgress", "Check").Swamp then
				if subFunction:GetDistance(CFrame.new(-10171, 138, 6008)) > 500 then
					tweenModule:to(CFrame.new(-10171, 138, 6008), true)
				else
					if farmFunction:DetectNearPlayersInCFrame(200) then
						subFunction:HopServers()
						return
					end

					if #farmFunction:GetZombieGuitarPuzzle() >= 6 then
						while true do
							task.wait()
							attackModule:Kill(workspace.Enemies["Living Zombie"])
							if not (not tbl11.AutoSkullGuitar or commF:InvokeServer("GuitarPuzzleProgress", "Check").Swamp) then
								continue
							end
							break
						end
					else
						farmFunction:TPSpawnMob("Living Zombie", "AutoSkullGuitar")
					end
				end
			elseif not commF:InvokeServer("GuitarPuzzleProgress", "Check").Gravestones then
				tweenModule:to(CFrame.new(-8761, 142, 6086))

				for _, v7 in pairs({
					hauntedCastle.Placard1.Right.ClickDetector,
					hauntedCastle.Placard2.Right.ClickDetector,
					hauntedCastle.Placard3.Left.ClickDetector,
					hauntedCastle.Placard4.Right.ClickDetector,
					hauntedCastle.Placard5.Left.ClickDetector,
					hauntedCastle.Placard6.Left.ClickDetector,
					hauntedCastle.Placard7.Left.ClickDetector,
				}) do
					fireclickdetector(v7)
				end
			elseif not commF:InvokeServer("GuitarPuzzleProgress", "Check").Ghost then
				tweenModule:to(CFrame.new(-9755, 271, 6290), true)
				commF:InvokeServer("GuitarPuzzleProgress", "Ghost")
			elseif not commF:InvokeServer("GuitarPuzzleProgress", "Check").Trophies then
				tweenModule:to(CFrame.new(-9530, 6, 6054), true)
				local tablet = workspace.Map["Haunted Castle"].Tablet
				local quest = workspace.Map["Haunted Castle"].Trophies.Quest

				for i, v7 in ipairs(tbl12) do
					local v8 = tablet[v7]
					local v9 = quest[tbl13[i]]

					if v8 and v9 then
						local v10 = tostring(v9.Handle.CFrame):split(", ")[4]
						local str3 = (v10 == "1" or v10 == "-1") and "90" or "180"

						if not string.find(tostring(v8.Line.Rotation.Z), str3) then
							repeat
								wait()
								fireclickdetector(v8.ClickDetector)
							until string.find(tostring(v8.Line.Rotation.Z), str3)
						end
					end
				end

				local v7 = next
				local children2, v8 = tablet:GetChildren()

				for _, v9 in v7, children2, v8 do
					if not table.find(tbl12, v9.Name) then
						if v9.Line.Rotation.Z ~= 0 then
							repeat
								task.wait(0.2)
								fireclickdetector(v9.ClickDetector)
							until v9.Line.Rotation.Z == 0
						end
					end
				end
			elseif not commF:InvokeServer("GuitarPuzzleProgress", "Check").Pipes then
				tweenModule:to(CFrame.new(-9530, 6, 6054), true)

				for k, v7 in pairs(tbl14) do
					local v8 = hauntedCastle["Lab Puzzle"].ColorFloor.Model[k]

					if v8.BrickColor.Name ~= v7 then
						repeat
							wait()
							fireclickdetector(v8.ClickDetector)
						until v8.BrickColor.Name == v7
					end
				end
			else
				commF:InvokeServer("soulGuitarBuy", true)
				commF:InvokeServer("soulGuitarBuy")
			end
		end, flag6)

		createFunc("Auto Farm Mastery", function()
			local tbl19 = tbl11.FarmMasteryMethod == "Bones" and { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" } or { "Cookie Crafter", "Cake Guard", "Baking Staff", "Head Baker" }

			if subFunction:GetWeaponName(tbl11.SelectMasteryTool) then
				local mobs = farmFunction:GetMobs(tbl19)

				if mobs then
					if not farmFunction:DetectNearMobLowHealth(mobs.Name, tonumber(tbl11.LowHealthMastery)) then
						getgenv().EnableAim = false
						getgenv().AimPos = nil
						return attackModule:Kill(mobs)
					end

					getgenv().EnableAim = true
					local position = mobs.HumanoidRootPart.Position
					getgenv().AimPos = position

					if tbl11.SelectMasteryTool == "Gun" then
						if subFunction:GetWeaponName(tbl11.SelectMasteryTool) == "Skull Guitar" then
							local tbl20 = { "TAP", mobs.HumanoidRootPart.Position }
							subFunction:GetTool("Gun"):WaitForChild("RemoteEvent"):FireServer(unpack(tbl20))
						else
							localPlayer.CameraMode = Enum.CameraMode.Classic
							localPlayer.CameraMinZoomDistance = 0
							localPlayer.CameraMaxZoomDistance = 0.5
							localPlayer.CameraMaxZoomDistance = 200
							workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, mobs.Head.Position)

							if farmFunction:GetMobPositionOnScreen(mobs.HumanoidRootPart) then
								local mobPositionOnScreen, v7 = farmFunction:GetMobPositionOnScreen(mobs.HumanoidRootPart)
								farmFunction:Click(mobPositionOnScreen, v7)
								task.wait(0.1)
							end
						end
					end

					attackModule:BringMob(mobs)
					subFunction:EquipToolName(subFunction:GetWeaponName(tbl11.SelectMasteryTool))
					tweenModule:to(mobs.HumanoidRootPart.CFrame * CFrame.new(0, 15, 2), true)
					farmFunction:SendKeys(tbl11.SelectSkillFarmMastery)
				else
					farmFunction:TPSpawnMob(tbl19, "Auto Farm Mastery")
				end
			end
		end, true, true)

		createFunc("AutoDojoTrainer", function()
			if not DojoProgress then
				if subFunction:GetDistance(cframe) <= 15 then
					DojoProgress = net:WaitForChild("RF/InteractDragonQuest"):InvokeServer(tbl15.RequestQuest)
					net:WaitForChild("RF/InteractDragonQuest"):InvokeServer(tbl15.ClaimQuest)
				else
					tweenModule:to(cframe)
				end

				return
			end

			if DojoProgress then
				local quest = DojoProgress and DojoProgress.Quest
				print(quest.BeltName, quest.Progress, quest.Goal)

				if quest.BeltName == "White" then
					local v7 = questModule:QuestLevel()
					local mobs = farmFunction:GetMobs(v7.NameMob)
					if mobs then
						return attackModule:Kill(mobs)
					end
					farmFunction:TPSpawnMob(v7.NameMob, "AutoDojoTrainer")
				elseif quest.BeltName == "Yellow" then
					if not tbl11.StartSeaEvent then
						lua:Notify({
							Title = "Script Notification",
							Content = "Please turn Start Sea Events and Auto Shark, Piranha, ... Farmming in [Sea Events] Tab",
							Duration = 6,
						})

						wait(7)
						return
					end
				end
			end
		end, flag6, true)

		createFunc("AutoBuyBoat", function()
			local selectBoats = tbl11.SelectBoats
			local localBoat = farmFunction:GetLocalBoat(selectBoats)
			local cframe2 = CFrame.new(-16214, 9, 406)

			if not localBoat then
				if subFunction:GetDistance(cframe2) <= 30 then
					commF:InvokeServer("BuyBoat", selectBoats or "Guardian")
					wait(0.5)
				else
					tweenModule:to(cframe2, true)
				end
			end
		end, flag6)

		createFunc("AutoShark", function()
			local mobs = farmFunction:GetMobs("Shark", nil, 2500)

			if mobs then
				while true do
					wait()
					attackModule:Kill(mobs)
					if not (not tbl11.AutoShark or not mobs or not mobs.Parent or not farmFunction:IsAlive(mobs)) then
						continue
					end
					break
				end
			end
		end, flag6)

		createFunc("AutoFishCrewMember", function()
			local mobs = farmFunction:GetMobs("Fish Crew Member", nil, 2500)

			if mobs then
				while true do
					wait()
					attackModule:Kill(mobs)
					if not (not tbl11.AutoFishCrewMember or not mobs or not mobs.Parent or not farmFunction:IsAlive(mobs)) then
						continue
					end
					break
				end
			end
		end, flag6)

		createFunc("AutoPiranha", function()
			local mobs = farmFunction:GetMobs("Piranha", nil, 2500)

			if mobs then
				while true do
					wait()
					attackModule:Kill(mobs)
					if not (not tbl11.AutoPiranha or not mobs or not mobs.Parent or not farmFunction:IsAlive(mobs)) then
						continue
					end
					break
				end
			end
		end, flag6)

		createFunc("AutoTerrorShark", function()
			local mobs = farmFunction:GetMobs("Terrorshark", nil, 2500)

			if mobs then
				while true do
					wait()
					attackModule:Kill(mobs)
					if not (not tbl11.AutoTerrorShark or not mobs or not mobs.Parent or not farmFunction:IsAlive(mobs)) then
						continue
					end
					break
				end
			end
		end, flag6)

		createFunc("AutoSeabeast", function()
			if fn25() then
				return
			end
			local seaBeast = farmFunction:GetSeaBeast(3500)

			if seaBeast then
				while true do
					wait()
					character.Humanoid.Sit = false
					farmFunction:KeepShipSafe(tbl11.SelectBoats)

					if subFunction:GetDistance(seaBeast.HumanoidRootPart.Position, nil, true) <= 100 then
						if tbl11.UseM1SeaEvent then
							attackModule:EquipWeapon("Blox Fruit")
							attackModule:AttackM1()
						else
							farmFunction:AutoSpamSkill()
							getgenv().EnableAim = true
							local aimPos = seaBeast.HumanoidRootPart.Position + Vector3.new(0, 40, 0)
							getgenv().AimPos = aimPos
						end
					end

					farmFunction:TPSeabeast(seaBeast)
					if not (not seaBeast or not seaBeast:FindFirstChild("HumanoidRootPart") or seaBeast.Health.Value <= 0 or not tbl11.AutoSeabeast or fn25()) then
						continue
					end
					break
				end

				getgenv().EnableAim = false
				getgenv().AimPos = nil
			end
		end, flag6)

		createFunc("AutoShip", function()
			if fn25() then
				return
			end
			local ship = farmFunction:GetShip()

			if ship then
				while true do
					wait()
					character.Humanoid.Sit = false
					farmFunction:KeepShipSafe(tbl11.SelectBoats)

					if subFunction:GetDistance(ship.Engine.Position) <= 100 then
						if tbl11.UseM1SeaEvent then
							attackModule:EquipWeapon("Blox Fruit")
							attackModule:AttackM1(4)
						else
							farmFunction:AutoSpamSkill()
							getgenv().EnableAim = true
							getgenv().AimPos = Vector3.new(ship.Engine.Position.X, ship.Engine.Position.Y - 50, ship.Engine.Position.Z)
						end
					end

					tweenModule:to(ship.Engine.CFrame * CFrame.new(0, -30, 0), true)
					if not (not ship or not ship.Parent or ship.Health.Value <= 0 or not tbl11.AutoShip or fn25()) then
						continue
					end
					break
				end

				getgenv().EnableAim = false
				getgenv().AimPos = nil
			end
		end, flag6)

		createFunc("StartSeaEvent", function()
			local v7 = tbl11
			local localBoat = farmFunction:GetLocalBoat(v7.SelectBoats)
			if fn25() or farmFunction:GetShip() and v7.AutoShip or farmFunction:GetSeaBeast(3500) and v7.AutoSeabeast then
				character.Humanoid.Sit = false
				return
			end

			if localBoat then
				if character.Humanoid.Sit == false then
					if character.PrimaryPart:FindFirstChild("IDK") then
						character.PrimaryPart:FindFirstChild("IDK"):Destroy()
					end

					farmFunction:NoClipBoat(false)
					arg.Module.TweenModule:to(localBoat.VehicleSeat.CFrame * CFrame.new(0, 2, 0), true)
				else
					while true do
						wait()
						local zoneSelected = farmFunction:GetZoneSelected()
						farmFunction:NoClipBoat(true)

						if not character.PrimaryPart:FindFirstChild("IDK") then
							local bodyVelocity = Instance.new("BodyVelocity")
							bodyVelocity.Name = "IDK"
							bodyVelocity.Parent = character.PrimaryPart
							bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							bodyVelocity.Velocity = Vector3.zero
						end

						localBoat.VehicleSeat.CFrame = CFrame.new(localBoat.VehicleSeat.CFrame.X, 120, localBoat.VehicleSeat.CFrame.Z)

						if subFunction:GetDistance(zoneSelected) > 50 then
							subFunction:TweenPart(localBoat.VehicleSeat, CFrame.new(farmFunction:GetZoneSelected()), tbl11["Tween Boat Speed"] and tonumber(tbl11["Tween Boat Speed"]) or 250)
						end

						if not (not v7.StartSeaEvent or not localBoat or not localBoat.Parent or character.Humanoid.Sit == false or fn25() or farmFunction:GetShip() and v7.AutoShip or farmFunction:GetSeaBeast(3500) and v7.AutoSeabeast) then
							continue
						end
						break
					end

					if tweenpart then
						tweenpart:Cancel()
						tweenpart = nil
					end

					if character.PrimaryPart:FindFirstChild("IDK") then
						character.PrimaryPart:FindFirstChild("IDK"):Destroy()
					end
				end
			else
				farmFunction:BuyBoat(tbl11.SelectBoats)
				wait(0.1)
			end
		end, flag6, true)

		createFunc("AutoFindLeviathan", function()
			if workspace.Map:FindFirstChild("LeviathanGate") then
				lua:Notify({ Title = "Auto Find Leviathan", Content = "Frozen Dimension Spawn", Duration = 10 })
				tbl8.Feature["Sea Events"]["Auto Find Leviathan"]:SetValue(false)
				wait(0.1)
				return
			end

			if localPlayer.Character.Humanoid.Sit == true then
				local v7 = next
				local children2, v8 = workspace.Boats:GetChildren()

				for _, v9 in v7, children2, v8 do
					if v9 and subFunction:GetDistance(v9.VehicleSeat.Position) <= 50 then
						while true do
							task.wait()
							subFunction:AddBodyVelocity(true)
							farmFunction:NoClipBoat(true)

							if not character.PrimaryPart:FindFirstChild("IDK") then
								local bodyVelocity = Instance.new("BodyVelocity")
								bodyVelocity.Name = "IDK"
								bodyVelocity.Parent = character.PrimaryPart
								bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyVelocity.Velocity = Vector3.zero
							end

							if localPlayer:GetAttribute("ExactLocation") == "" or not localPlayer:GetAttribute("ExactLocation") then
								v9.VehicleSeat.CFrame = CFrame.new(v9.VehicleSeat.CFrame.X, 70, v9.VehicleSeat.CFrame.Z)
							else
								v9.VehicleSeat.CFrame = CFrame.new(v9.VehicleSeat.CFrame.X, 750, v9.VehicleSeat.CFrame.Z)
							end

							subFunction:TweenPart(v9.VehicleSeat, CFrame.new(-99999999.21484375, 37.187046974897385, 656.7513427734375), tbl11["Tween Boat Speed"] and tonumber(tbl11["Tween Boat Speed"]) or 250)
							if not (not tbl11.AutoFindLeviathan or localPlayer.Character.Humanoid.Sit ~= true or workspace.Map:FindFirstChild("LeviathanGate")) then
								continue
							end
							break
						end

						humanoidRootPart:FindFirstChild("IDK"):Destroy()
						v9.VehicleSeat.CFrame = CFrame.new(v9.VehicleSeat.CFrame.X, 27, v9.VehicleSeat.CFrame.Z)
						subFunction:AddBodyVelocity(false)

						if tweenpart then
							tweenpart:Cancel()
							tweenpart = nil
						end
					end
				end
			end
		end, flag6)

		createFunc("AutoFindKitsuneIsland", function()
			if workspace.Map:FindFirstChild("KitsuneIsland") then
				localPlayer.Character.Humanoid.Sit = false
				tweenModule:to(workspace.Map.KitsuneIsland.ShrineActive.NeonShrinePart.CFrame)
			elseif localPlayer.Character.Humanoid.Sit == true then
				local v7 = next
				local children2, v8 = workspace.Boats:GetChildren()

				for _, v9 in v7, children2, v8 do
					v9 = v9 and subFunction:GetDistance(v9.VehicleSeat.Position) <= 50

					if v9 then
						while true do
							task.wait()
							subFunction:AddBodyVelocity(true)

							if not character.PrimaryPart:FindFirstChild("IDK") then
								local bodyVelocity = Instance.new("BodyVelocity")
								bodyVelocity.Name = "IDK"
								bodyVelocity.Parent = character.PrimaryPart
								bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyVelocity.Velocity = Vector3.zero
							end

							if localPlayer:GetAttribute("ExactLocation") == "" or not localPlayer:GetAttribute("ExactLocation") then
								Boats.VehicleSeat.CFrame = CFrame.new(Boats.VehicleSeat.CFrame.X, 70, Boats.VehicleSeat.CFrame.Z)
							else
								Boats.VehicleSeat.CFrame = CFrame.new(Boats.VehicleSeat.CFrame.X, 750, Boats.VehicleSeat.CFrame.Z)
							end

							subFunction:TweenPart(Boats.VehicleSeat, CFrame.new(-99999999.21484375, 37.187046974897385, 656.7513427734375), tbl11["Tween Boat Speed"] and tonumber(tbl11["Tween Boat Speed"]) or 250)
							if not (not tbl11.AutoFindKitsuneIsland or localPlayer.Character.Humanoid.Sit ~= true or workspace.Map:FindFirstChild("KitsuneIsland")) then
								continue
							end
							break
						end

						Boats.VehicleSeat.CFrame = CFrame.new(Boats.VehicleSeat.CFrame.X, 27, Boats.VehicleSeat.CFrame.Z)
					end
				end
			elseif not farmFunction:GetLocalBoat() then
				farmFunction:BuyBoat(tbl11.SelectBoats)
			else
				tweenModule:to(farmFunction:GetLocalBoat().VehicleSeat.CFrame * CFrame.new(0, 2, 0), true)
			end
		end, flag6, true)

		createFunc("Auto Collect Azure Member", function()
			if workspace:FindFirstChild("AttachedAzureEmber") then
				character.HumanoidRootPart.CFrame = workspace:WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame
			end
		end, flag6)

		createFunc("Auto Trade Azure Member", function()
			net["RF/KitsuneStatuePray"]:InvokeServer()
		end, flag6)

		createFunc("AutoLeviathan", function()
			if workspace.SeaBeasts:FindFirstChild("Leviathan") then
				local leviathanSegment = workspace.SeaBeasts:FindFirstChild("Leviathan Segment")
				local leviathan = workspace.SeaBeasts:FindFirstChild("Leviathan")

				if leviathanSegment and leviathanSegment:FindFirstChild("Health") and leviathanSegment.Health.Value > 0 then
					for _, child in pairs(workspace.SeaBeasts:GetChildren()) do
						if child.Name == "Leviathan Segment" then
							if child and child:FindFirstChild("Health") and child.Health.Value > 0 then
								while true do
									task.wait()

									if subFunction:GetDistance(child.HumanoidRootPart.Position, nil, true) <= 100 then
										if tbl11.UseM1SeaEvent then
											attackModule:EquipWeapon("Blox Fruit")
											attackModule:AttackM1()
											child.HumanoidRootPart.CFrame = Vector3.new(30, 30, 30)
										else
											farmFunction:AutoSpamSkill()
											getgenv().EnableAim = true
											local aimPos = child.HumanoidRootPart.Position + Vector3.new(0, 60, 0)
											getgenv().AimPos = aimPos
										end
									end

									attackModule:EquipBuso()
									tweenModule:to(child.HumanoidRootPart.CFrame * CFrame.new(0, 75, 0))
									if not (not child or not child.Parent or child.Health.Value <= 0 or tbl11.AutoLeviathan == false) then
										continue
									end
									break
								end

								getgenv().EnableAim = false
								getgenv().AimPos = nil
							end
						end
					end
				elseif leviathan then
					local leviathan2 = workspace.SeaBeasts:FindFirstChild("Leviathan")

					if leviathan2 and leviathan2:FindFirstChild("Health") and leviathan2.Health.Value > 0 then
						while true do
							task.wait()

							if subFunction:GetDistance(leviathan2.HumanoidRootPart.Position, nil, true) <= 100 then
								if tbl11.UseM1SeaEvent then
									attackModule:EquipWeapon("Blox Fruit")
									attackModule:AttackM1()
								else
									farmFunction:AutoSpamSkill()
									getgenv().EnableAim = true
									local position = leviathan2.HumanoidRootPart.Position
									getgenv().AimPos = position
								end
							end

							attackModule:EquipBuso()
							farmFunction:TPLeviathan(leviathan2)
							if not (not leviathan2 or leviathan2.Health.Value <= 0 or tbl11.AutoLeviathan == false or not leviathan2.Parent or leviathanSegment and leviathanSegment:FindFirstChild("Health") and leviathanSegment.Health.Value > 0) then
								continue
							end
							break
						end

						getgenv().EnableAim = false
						getgenv().AimPos = nil
					end
				end
			end
		end, flag6, true)

		print("[✅] Loaded Functions Success!")
	end

	tbl17.StartModule = function(arg)
		for k, v7 in pairs(arg.Module) do
			if typeof(v7) == "function" then
				local ok, result = pcall(v7)

				if ok and result then
					arg.Module[k] = result
				elseif result then
					warn("[⚠️] FAILED to load module:", k, result)
				end
			end
		end

		print("[✅] Start Module Success!")
	end

	tbl17.SafeLoadstring = function(_, arg2)
		local ok, result = pcall(function()
			return loadstring(game:HttpGet(arg2))()
		end)

		if ok and result then
			return result
		end

		if result then
			warn("⚠️ Failed to load:", arg2, "| Error:", result)
			return
		end
	end

	tbl17.StartWindow = function(arg)
		lua = arg:SafeLoadstring("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua")

		v4 = lua:CreateWindow({
			Title = "Night Hub " .. (flag3 and "<font color='rgb(255,255,0)'>[PREMIUM]</font>" or "[FREEMIUM]"),
			SubTitle = "discord.gg/nighthub",
			TabWidth = 145,
			MinimizeKey = Enum.KeyCode.RightControl,
			Size = obj.UserInputService.TouchEnabled and UDim2.fromOffset(450, 400) or UDim2.fromOffset(600, 450),
			Acrylic = false,
			Theme = tbl11.SelectTheme,
			Image = "rbxassetid://118583787829543",
		})
	end

	tbl17.StartFarm = function(arg)
		spawn(function()
			while wait() do
				pcall(function()
					flag2 = arg.Module.SubFunction:GetItemInventory("Valkyrie Helm") and true or false

					if tbl11.AutoCDK then
						cdkQuest = arg.Module.QuestModule:GetCDKQuest()
					end

					if arg.Module.SubFunction:CheckNotify("GO!") then
						IsTrial = true
					end

					if arg.Module.SubFunction:CheckNotify("completed your trial!") or arg.Module.SubFunction:CheckNotify("All trials have been completed!") then
						IsTrial = false
					end

					if arg.Module.SubFunction:CheckNotify("but there") then
						ReallytoReset = true
					end

					if arg.Module.SubFunction:CheckNotify("fight!") then
						ResetEnable = true
						CanKillPlayer = true
					end
				end)

				wait(1)
			end
		end)

		loadstring([[        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self)
            local method = getnamecallmethod()
            local args = {...}
            if self.Name == "RemoteEvent" and method == "FireServer" and getgenv().EnableAim == true then
                if typeof(args[1]) ~= "boolean" and typeof(args[1]) ~= "string" and getgenv().AimPos ~= nil then
                    args[1] = getgenv().AimPos
                    return old(self, unpack(args))
                end
            end
            return old(self, ...)
        end)
        setreadonly(mt, true)
    ]])()

		spawn(function()
			while task.wait() do
				local ok, result = pcall(function()
					for k, function_ in pairs(tbl17.Functions) do
						if tbl11[k] and function_._enable then
							if function_._noclip then
								arg.Module.SubFunction:AddBodyVelocity(true)
							end

							function_._func()
						end
					end
				end)

				if not ok and result then
					print("[⚠️] Farm Loop Bugs:", tostring(result))
				end
			end
		end)

		workspace.Map:WaitForChild("WaterBase-Plane").Size = Vector3.new(1000, 111, 1000)
		print("[✅] Loaded Start Farm Module")
	end

	tbl17.StartUI = function(arg)
		local screenGui = Instance.new("ScreenGui")
		local imageButton = Instance.new("ImageButton")
		local uiCorner = Instance.new("UICorner")
		local frame = Instance.new("Frame")
		screenGui.Parent = game.CoreGui
		frame.Parent = screenGui
		frame.Size = UDim2.new(0, 60, 0, 60)
		frame.BackgroundTransparency = 0
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.Position = UDim2.new(0.2, 0, 0.2, 0)
		frame.BackgroundColor3 = Color3.new(0, 0, 0)
		frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		frame.BorderSizePixel = 0
		imageButton.Parent = frame
		imageButton.Size = UDim2.new(0, 55, 0, 45)
		imageButton.Image = "rbxassetid://116484728506478"
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.BackgroundColor3 = Color3.new(0, 0, 0)
		imageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.AutoButtonColor = false
		uiCorner.Parent = frame
		uiCorner.CornerRadius = UDim.new(0, 100)

		imageButton.MouseButton1Click:Connect(function()
			imageButton.Size = UDim2.new(0, 55, 0, 45)
			local tween_ = tweenService:Create(imageButton, TweenInfo.new(0.85, Enum.EasingStyle.Quad), { Rotation = 360, Size = UDim2.new(0, 55, 0, 45) })
			tween_:Play()

			tween_.Completed:Connect(function()
				imageButton.Rotation = 0
			end)

			virtualInputManager:SendKeyEvent(true, "RightControl", false, game)
			virtualInputManager:SendKeyEvent(false, "RightControl", false, game)
		end)

		fn22(frame, imageButton)
		arg:StartWindow()
		luau = arg:SafeLoadstring("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/Utils/BloxFruits/Codes.luau")
		luau2 = arg:SafeLoadstring("https://github.com/WhiteX1208/Scripts/raw/refs/heads/main/Utils/BloxFruits/Table.luau")
		local tbl18 = flag4 and { 1, 3 } or flag5 and { 1, 7 } or flag6 and { 1, #luau2.MeleeList }
		local tbl19 = {}

		for i = tbl18[1], tbl18[2] do
			table.insert(tbl19, luau2.MeleeList[i])
		end

		for k, v7 in next, luau2.AllFruits, nil do
			if v7.Cost >= 1000000 then
				table.insert(tbl5, k)
			end
		end

		Chips = {}
		local v7 = next
		local Raids, v8 = require(replicatedStorage.Raids)

		for _, v9 in v7, Raids, v8 do
			for _, v10 in next, v9, nil do
				table.insert(Chips, v10)
			end
		end

		lua:Notify({ Title = "Script", Content = "Welcome back", Duration = 10 })

		if flag3 then
			lua:Notify({
				Title = "Whitelist System",
				Content = "Detect Premium User, Unlock Premium Access",
				Duration = 10,
			})
		end

		local saveManager = arg.Module.SaveManager
		local v9 = tbl8

		v9.Tab = function(arg2, arg3, arg4)
			local v10 = v4:AddTab({ Title = arg3, Icon = arg4 })
			arg2.Feature[arg3] = arg2.Feature[arg3] or {}
			arg2.Tabs[arg3] = v10
		end

		v9:Tab("Infomation", "info")
		v9:Tab("Shop", "rbxassetid://75541626470710")
		v9:Tab("Status & Server", "rbxassetid://94279959064594")
		v9:Tab("Hop", "rbxassetid://130005988799640")
		v9:Tab("Farmming", "home")
		v9:Tab("Items", "sword")
		v9:Tab("Stack Farm", "layers")
		v9:Tab("Fruit & Dungeon", "rbxassetid://96762576414960")
		v9:Tab("LocalPlayer", "rbxassetid://83969387607768")
		v9:Tab("Upgraded Race", "rbxassetid://80141089591563")
		v9:Tab("Sea Events", "rbxassetid://126844449681317")
		v9:Tab("Volcano Events", "rbxassetid://122636312407104")
		v9:Tab("Misc", "rbxassetid://82061864628205")
		v9:Tab("Settings", "settings")
		v4:SelectTab(1)

		local function fn23(arg2, arg3)
			v9.Feature[arg2][arg3.Title] = v9.Tabs[arg2]:AddParagraph(arg3)
		end

		local function fn24(arg2, arg3)
			v9.Feature[arg2][arg3.Title] = v9.Tabs[arg2]:AddButton(arg3)
		end

		local function fn25(arg2, arg3)
			local name = arg3.Name and arg3.Name or arg3.Title
			arg3.Default = arg3.Default or tbl11[name] or false

			arg3.OnChanged = arg3.OnChanged or function()
			end

			arg3.Callback = arg3.Callback or function(arg4)
				arg3.OnChanged(arg4)

				if arg4 == false and tbl17.Functions[name] then
					arg.Module.TweenModule:StopTween()
				end

				saveManager:SaveSettings(name, arg4)
			end

			v9.Feature[arg2][arg3.Title] = v9.Tabs[arg2]:AddToggle("Toggle", arg3)
		end

		local function fn26(arg2, arg3)
			local name = arg3.Name and arg3.Name or arg3.Title

			if not arg3.Default and not tbl11[name] and arg3.Multi then
				tbl11[name] = {}

				for _, value2 in pairs(arg3.Values) do
					tbl11[name][value2] = false
				end
			end

			arg3.Default = arg3.Default or tbl11[name] or arg3.Multi and {} or ""

			arg3.Callback = arg3.Callback or function(arg4)
				saveManager:SaveSettings(name, arg4)
			end

			v9.Feature[arg2][arg3.Title] = v9.Tabs[arg2]:AddDropdown("Dropdown", arg3)
		end

		local function fn27(arg2, arg3)
			local name = arg3.Name and arg3.Name or arg3.Title
			arg3.Rounding = arg3.Rounding or 1
			arg3.Default = arg3.Default or tbl11[name] or arg3.Min

			arg3.Callback = arg3.Callback or function(arg4)
				saveManager:SaveSettings(name, arg4)
			end

			v9.Feature[arg2][name] = v9.Tabs[arg2]:AddSlider("Slider", arg3)
		end

		local function fn28(arg2, arg3)
			v9.Feature[arg2][arg3] = v9.Tabs[arg2]:AddSection(arg3)
		end

		local function fn29(arg2, arg3)
			local name = arg3.Name and arg3.Name or arg3.Title
			arg3.Default = arg3.Default or tbl11[name] or ""
			arg3.Numberic = arg3.Numberic or false
			arg3.PlaceHolder = arg3.PlaceHolder or ""

			arg3.Callback = arg3.Callback or function(arg4)
				saveManager:SaveSettings(name, arg4)
			end

			v9.Feature[arg2][arg3.Title] = v9.Tabs[arg2]:AddInput("Textbox", arg3)
		end

		spawn(function()
			while task.wait() do
				if teleportEnabled then
					character.HumanoidRootPart.CFrame = CFrame.new(character.HumanoidRootPart.CFrame.X, -2147483650, character.HumanoidRootPart.CFrame.Z)
				end
			end
		end)

		local function fn30()
			getgenv().EnableAim = false
			getgenv().AimPos = nil
		end

		local function fn31()
			lighting.FogEnd = 100000

			for _, descendant in pairs(lighting:GetDescendants()) do
				if descendant:IsA("Atmosphere") then
					descendant:Destroy()
				end
			end

			if lighting:FindFirstChild("LightingLayers") then
				lighting.LightingLayers:Destroy()
			end

			if lighting:FindFirstChild("SeaTerrorCC") then
				lighting.SeaTerrorCC:Destroy()
			end
		end

		local function fn32(arg2)
			saveManager:SaveSettings("EnableAimbot", arg2)

			spawn(function()
				while tbl11.EnableAimbot and wait() do
					if getgenv().SelectTarget ~= nil then
						local v10 = workspace.Characters:FindFirstChild(getgenv().SelectTarget)

						if v10 and v10.Humanoid and v10.Humanoid.Health > 0 then
							getgenv().EnableAim = true
							local position = v10.HumanoidRootPart.Position
							getgenv().AimPos = position
						else
							getgenv().EnableAim = false
							getgenv().AimPos = nil
						end
					end
				end

				getgenv().EnableAim = false
				getgenv().AimPos = nil
			end)
		end

		local function fn33(arg2)
			saveManager:SaveSettings("EnableAimbotNear", arg2)

			spawn(function()
				while tbl11.EnableAimbotNear and wait() do
					local nearPlayers = arg.Module.SubFunction:GetNearPlayers()

					if nearPlayers then
						getgenv().EnableAim = true
						local position = nearPlayers.HumanoidRootPart.Position
						getgenv().AimPos = position
					else
						getgenv().EnableAim = false
						getgenv().AimPos = nil
					end
				end

				getgenv().EnableAim = false
				getgenv().AimPos = nil
			end)
		end

		local function fn34(arg2)
			saveManager:SaveSettings("AutoStats", arg2)

			spawn(function()
				while tbl11.AutoStats and wait() do
					for k, selectStat in pairs(tbl11.SelectStats) do
						if selectStat == true then
							commF:InvokeServer("AddPoint", k, 9999)
							task.wait()
						end
					end
				end
			end)
		end

		local function fn35(arg2)
			saveManager:SaveSettings("OneHitSaishiZ", arg2)

			spawn(function()
				while tbl11.OneHitSaishiZ and wait() do
					for _, v10 in pairs(character.Humanoid:GetPlayingAnimationTracks()) do
						if v10.Name == "Saddi_Z_Attack" and v10.IsPlaying then
							teleportEnabled = true
							task.wait(0.75)
							teleportEnabled = false
						end
					end
				end
			end)
		end

		local function fn36(arg2)
			saveManager:SaveSettings("RandomBones", arg2)

			spawn(function()
				while tbl11.RandomBones and wait() and flag6 do
					commF:InvokeServer("Bones", "Buy", 1, 1)
					task.wait()
				end
			end)
		end

		local function fn37(arg2)
			saveManager:SaveSettings("RandomFruit", arg2)

			spawn(function()
				while tbl11.RandomFruit and wait() do
					commF:InvokeServer("Cousin", "Buy")
					task.wait(1)
				end
			end)
		end

		local function fn38(arg2)
			saveManager:SaveSettings("StoreFruit", arg2)

			spawn(function()
				while tbl11.StoreFruit and wait() do
					local v10 = arg.Module.SubFunction:CheckFruits()

					if v10 then
						commF:InvokeServer("StoreFruit", v10:GetAttribute("OriginalName"), v10)
						task.wait(0.05)
					end
				end
			end)
		end

		local function fn39(arg2)
			saveManager:SaveSettings("BringFruit", arg2)

			spawn(function()
				while tbl11.BringFruit and wait() do
					local fruit = arg.Module.FarmFunction:GetFruit()

					if fruit then
						if fruit.Name == "Fruit " then
							character:PivotTo(fruit.Handle.CFrame)
						else
							firetouchinterest(fruit.Handle, humanoidRootPart, 1)
							firetouchinterest(fruit.Handle, humanoidRootPart, 0)
						end
					end
				end
			end)
		end

		local function fn40(arg2)
			saveManager:SaveSettings("AutoLockMoon", arg2)

			spawn(function()
				while tbl11.AutoLockMoon and wait() do
					workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.Position, game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
				end
			end)
		end

		local function fn41(arg2)
			saveManager:SaveSettings("AutoBuyGear", arg2)

			spawn(function()
				while tbl11.AutoBuyGear and wait() do
					local response = commF:InvokeServer("UpgradeRace", "Check")

					if response == 2 or response == 4 or response == 7 then
						commF:InvokeServer("UpgradeRace", "Buy")
					end
				end
			end)
		end

		local function fn42(arg2)
			saveManager:SaveSettings("AutoChooseGear", arg2)

			spawn(function()
				while tbl11.AutoChooseGear and wait() do
					if commF:InvokeServer("TempleClock", "Check") and commF:InvokeServer("TempleClock", "Check").HadPoint then
						local raceDetails = commF:InvokeServer("TempleClock", "Check").RaceDetails
						fireproximityprompt(workspace.Map["Temple of Time"].Prompt.ProximityPrompt)
						task.wait()

						spawn(function()
							local v10 = next
							local children2, v11 = workspace.Map["Temple of Time"].InnerClock:GetChildren()

							for _, v12 in v10, children2, v11 do
								if v12:FindFirstChild("Highlight") and v12.Highlight.Enabled then
									if v12.Name == "Gear4" then
										if raceDetails.A == 2 or raceDetails.A < 2 then
											commF:InvokeServer(unpack({ "TempleClock", "SpendPoint", v12.Name, "Alpha" }))
										elseif raceDetails.B == 2 then
											commF:InvokeServer(unpack({ "TempleClock", "SpendPoint", v12.Name, "Omega" }))
										end
									else
										commF:InvokeServer(unpack({
											"TempleClock",
											"SpendPoint",
											v12.Name,
											math.random(0, 1) == 1 and "Alpha" or "Omega",
										}))
									end
								end
							end
						end)
					else
						wait(2)
						local v10 = next
						local v11, v12 = getconnections(playerGui.TempleGui.Skip.TextButton.Activated)

						for _, v13 in v10, v11, v12 do
							v13.Function()
						end
					end
				end
			end)
		end

		local function fn43(arg2)
			saveManager:SaveSettings("EnableDashLength", arg2)

			spawn(function()
				while tbl11.EnableDashLength and wait() do
					if character and character.Humanoid and character.Humanoid.Health > 0 then
						character:SetAttribute("DashLengthGround", tonumber(tbl11.DashLengthValue))
						task.wait(0.1)
					end
				end
			end)
		end

		local function fn44(arg2)
			saveManager:SaveSettings("ESPPlayers", arg2)

			spawn(function()
				while tbl11.ESPPlayers and wait() do
					for _, player in pairs(players:GetPlayers()) do
						if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and not player.Character.HumanoidRootPart:FindFirstChild("ESPPlayers") then
							arg.Module.FarmFunction:ESPPlayers(player)
							task.wait(0.05)
						end
					end

					if not getgenv().ESPPlayerConnection then
						local playerAdded = players.PlayerAdded

						getgenv().ESPPlayerConnection = playerAdded:Connect(function(arg3)
							arg.Module.FarmFunction:ESPPlayers(arg3)
							task.wait(0.05)
						end)
					end

					task.wait(0.5)
				end

				if getgenv().ESPPlayerConnection then
					getgenv().ESPPlayerConnection:Discontuned()
					getgenv().ESPPlayerConnection = nil
				end
			end)
		end

		local function fn45(arg2)
			saveManager:SaveSettings("ESPIslands", arg2)

			spawn(function()
				while tbl11.ESPIslands and wait() do
					for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
						if child and child:IsA("BasePart") and child.Name ~= "Sea" and child.Parent and not child:FindFirstChild("ESPIslands") then
							arg.Module.FarmFunction:ESPIslands(child)
						end
					end

					task.wait(0.5)
				end
			end)
		end

		local function fn46(arg2)
			saveManager:SaveSettings("ESPBloxFruits", arg2)

			spawn(function()
				while tbl11.ESPBloxFruits and wait() do
					for _, child in pairs(workspace:GetChildren()) do
						if (child:IsA("Model") or child:IsA("Tool")) and child.Name:find("Fruit") and child:FindFirstChild("Handle") then
							arg.Module.FarmFunction:ESPBloxFruits(child)
						end
					end

					task.wait(0.5)
				end
			end)
		end

		local function fn47(arg2)
			saveManager:SaveSettings("ESPChests", arg2)

			spawn(function()
				while tbl11.ESPChests and wait() do
					local tagged = collectionService:GetTagged("_ChestTagged")

					for _, v10 in pairs(tagged) do
						if v10 and v10.Parent and not v10:GetAttribute("IsDisabled") then
							arg.Module.FarmFunction:ESPChests(v10)
						end
					end

					task.wait(0.5)
				end
			end)
		end

		local function fn48(arg2)
			saveManager:SaveSettings("Auto Turn Race V4", arg2)

			spawn(function()
				while tbl11["Auto Turn Race V4"] and wait() do
					local raceEnergy = character:FindFirstChild("RaceEnergy")
					local raceTransformed = character:FindFirstChild("RaceTransformed")

					if raceEnergy and raceTransformed and raceEnergy.Value >= 1 and not raceTransformed.Value then
						localPlayer.Backpack:WaitForChild("Awakening").RemoteFunction:InvokeServer(true)
					end

					wait(1)
				end
			end)
		end

		local function fn49(arg2)
			saveManager:SaveSettings("Auto Turn Race V3", arg2)

			spawn(function()
				while tbl11["Auto Turn Race V3"] and wait() do
					commE:FireServer("ActivateAbility")
					wait(1)
				end
			end)
		end

		local function fn50()
			if not flag3 then
				lua:Notify({
					Title = "Hop Failed!",
					Content = "Your dont have permission to hop, buy premium please!",
					Duration = 5,
				})

				return
			end

			return flag3
		end

		fn23("Infomation", {
			Title = "Owner Infomation",
			Content = [[Name: Lương Minh Nghĩa
From: VietNamese 🇻🇳
Birthday: 12/8
Age: 14
Home Adress: idk]],
		})

		fn24("Infomation", {
			Title = "Join Discord",
			Desc = "Click to copy discord server invite link\ndiscord.gg/nighthub",
			Callback = function()
				lua:Notify({ Title = "Discord Notification", Content = "Link server copied to clipboard!", Duration = 7 })
				setclipboard("discord.gg/nighthub")
			end,
		})

		fn24("Infomation", {
			Title = "Open Hop Boss Script",
			Callback = function()
				lua:Notify({ Title = "Script", Content = "Execute Success Wait 2 - 3 seconds!", Duration = 7 })
				arg:SafeLoadstring("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/HopScript.luau")
			end,
		})

		fn28("Shop", "Game")

		fn24("Shop", {
			Title = "Redeem All Codes",
			Callback = function()
				for _, v10 in pairs(luau) do
					redeem:InvokeServer(tostring(v10))
				end

				print("[✅] Redeem Success!", #luau, "codes")
			end,
		})

		fn24("Shop", {
			Title = "Teleport to Travel Main",
			Description = "Teleport to sea 1",
			Callback = function()
				commF:InvokeServer("TravelMain")
			end,
		})

		fn24("Shop", {
			Title = "Teleport to Travel Dressrosa",
			Description = "Teleport to sea 2",
			Callback = function()
				commF:InvokeServer("TravelDressrosa")
			end,
		})

		fn24("Shop", {
			Title = "Teleport to Travel Zou",
			Description = "Teleport to sea 3",
			Callback = function()
				commF:InvokeServer("TravelZou")
			end,
		})

		fn28("Shop", "Melee")
		fn26("Shop", { Name = "SelectMeleeBuy", Title = "Select Melee", Values = tbl19 })
		fn25("Shop", { Name = "AutoBuyMelee", Title = "Buy Melee" })
		fn28("Shop", "Other")

		fn24("Shop", {
			Title = "Buy Refund Stats (2,500f)",
			Callback = function()
				commF:InvokeServer("BlackbeardReward", "Refund", "1")
				commF:InvokeServer("BlackbeardReward", "Refund", "2")
			end,
		})

		fn24("Shop", {
			Title = "Buy Reroll Race (1,500f)",
			Callback = function()
				commF:InvokeServer("BlackbeardReward", "Reroll", "1")
				commF:InvokeServer("BlackbeardReward", "Reroll", "2")
			end,
		})

		fn24("Shop", {
			Title = "Buy Ghoul Race",
			Callback = function()
				commF:InvokeServer("Ectoplasm", "BuyCheck", 4)
			end,
		})

		fn24("Shop", {
			Title = "Buy Cyborg Race",
			Callback = function()
				commF:InvokeServer("CyborgTrainer", "Buy")
			end,
		})

		fn25("Shop", { Name = "RandomBones", Title = "Auto Random Suprises", Callback = fn36 })
		fn28("Shop", "Haki")

		fn24("Shop", {
			Title = "Buy Buso (25,000$)",
			Callback = function()
				commF:InvokeServer("BuyHaki", "Buso")
			end,
		})

		fn24("Shop", {
			Title = "Buy Geppo (10,000$)",
			Callback = function()
				commF:InvokeServer("BuyHaki", "Geppo")
			end,
		})

		fn24("Shop", {
			Title = "Buy Soru (100,000$)",
			Callback = function()
				commF:InvokeServer("BuyHaki", "Soru")
			end,
		})

		fn24("Shop", {
			Title = "Buy Ken(Observation) (750,000$)",
			Callback = function()
				commF:InvokeServer("KenTalk", "Buy")
			end,
		})

		fn28("Status & Server", "Status")
		fn23("Status & Server", { Title = "Time Elapsed", Content = "0 Day 0 Hours 0 Minutes 0 Seconds" })
		fn23("Status & Server", { Title = "Elite Hunter", Content = "❌ Not Spawned! | Progress: 0" })
		fn23("Status & Server", { Title = "Leviathan Status", Content = "None" })
		fn23("Status & Server", { Title = "Fruit Stock", Content = "IDK" })
		fn23("Status & Server", { Title = "Advanced Fruit Stock", Content = "IDK" })
		fn28("Status & Server", "Server")

		fn29("Status & Server", {
			Title = "Enter JobId",
			Description = "Enter Night Hub Job Id or game JobId here",
			PlaceHolder = "Enter here",
			Default = "",
			Callback = function(arg2)
				JobIdInput = arg2
			end,
		})

		fn24("Status & Server", {
			Title = "Join Server",
			Callback = function()
				if JobIdInput:find("NIGHTHUB") then
					JobIdInput = arg.Module.SubFunction:Decode(JobIdInput)
				end

				replicatedStorage.__ServerBrowser:InvokeServer("teleport", tostring(JobIdInput))
			end,
		})

		fn24("Status & Server", {
			Title = "Copy JobId",
			Callback = function()
				setclipboard(game.JobId)
				lua:Notify({ Title = "Interface", Content = "JobId Copied!", Duration = 3 })
			end,
		})

		fn24("Status & Server", {
			Title = "Rejoin Server",
			Callback = function()
				replicatedStorage.__ServerBrowser:InvokeServer("teleport", tostring(game.JobId))
			end,
		})

		fn24("Status & Server", {
			Title = "Hop Servers",
			Callback = function()
				arg.Module.SubFunction:HopServers()
			end,
		})

		fn24("Status & Server", {
			Title = "Hop Servers Low Player",
			Callback = function()
				lua:Notify({ Title = "Hop Failed!", Content = "This feature isn't update", Duration = 5 })
			end,
		})

		fn23("Hop", { Title = "Api Status", Content = "Click Refresh Api Status to show api status" })

		fn24("Hop", {
			Title = "Refresh Api Status",
			Callback = function()
				v9.Feature.Hop["Api Status"]:SetTitle("Api Status: Checking...")

				local ok, result = pcall(function()
					return http.request({ Url = "http://163.223.9.144", Method = "GET" })
				end)

				if ok and result and result.StatusCode == 200 then
					v9.Feature.Hop["Api Status"]:SetTitle("Api Status: 🟢 (Online)")
				else
					v9.Feature.Hop["Api Status"]:SetTitle("Api Status: 🔴 (Offline)")
				end
			end,
		})

		fn24("Hop", {
			Title = "Hop Elite Hunter [Freemium]",
			Callback = function()
				arg.Module.SubFunction:HopApi("Elite")
			end,
		})

		fn24("Hop", {
			Title = "Hop Fullmoon [Freemium]",
			Callback = function()
				arg.Module.SubFunction:HopApi("Fullmoon")
			end,
		})

		fn24("Hop", {
			Title = "Hop Near Moon [Freemium]",
			Callback = function()
				arg.Module.SubFunction:HopApi("NearMoon")
			end,
		})

		fn24("Hop", {
			Title = "Hop Mirage [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("Mirage")
			end,
		})

		fn24("Hop", {
			Title = "Hop Rip Indra [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("RipIndra")
			end,
		})

		fn24("Hop", {
			Title = "Hop Dough King [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("DoughKing")
			end,
		})

		fn24("Hop", {
			Title = "Hop Darkbeard [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("Darkbeard")
			end,
		})

		fn24("Hop", {
			Title = "Hop Cursed Captain [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("CursedCatain")
			end,
		})

		fn24("Hop", {
			Title = "Hop Soul Reaper [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("SoulReaper")
			end,
		})

		fn24("Hop", {
			Title = "Hop Cake Prince [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("CakePrince")
			end,
		})

		fn24("Hop", {
			Title = "Hop Castle Raid [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("CastleRaid")
			end,
		})

		fn24("Hop", {
			Title = "Hop Legendary Sword [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("Sword")
			end,
		})

		fn24("Hop", {
			Title = "Hop Legendary Haki [Premium]",
			Callback = function()
				if not fn50() then
					return
				end
				arg.Module.SubFunction:HopApi("HakiLegendary")
			end,
		})

		fn28("Farmming", "Farm Configuration")
		fn26("Farmming", { Name = "SelectTool", Title = "Select Tool", Values = { "Melee", "Sword", "Gun", "Blox Fruit" } })
		fn25("Farmming", { Title = "Accept Quests", Description = "Claim quest Cake/Bone farm" })
		fn25("Farmming", { Title = "Auto Turn Race V3", Callback = fn49 })
		fn25("Farmming", { Title = "Auto Turn Race V4", Callback = fn48 })
		fn28("Farmming", "Level")
		fn25("Farmming", { Title = "Auto Farm Level", Description = "self explain" })
		fn28("Farmming", "Mastery")
		fn26("Farmming", { Name = "FarmMasteryMethod", Title = "Select Farm Mastery Method", Values = { "Bones", "Cake" } })
		fn26("Farmming", { Name = "SelectMasteryTool", Title = "Select Mastery Tool", Values = { "Blox Fruit", "Gun" } })
		fn27("Farmming", { Name = "LowHealthMastery", Title = "Low Health", Max = 50, Min = 10 })

		fn25("Farmming", {
			Title = "Auto Farm Mastery",
			OnChanged = function(arg2)
				if arg2 == false then
					getgenv().EnableAim = false
					getgenv().AimPos = nil
				end
			end,
		})

		fn26("Farmming", {
			Name = "SelectSkillFarmMastery",
			Title = "Select Skills",
			Values = { "Z", "X", "C", "V", "F" },
			Multi = true,
		})

		fn28("Farmming", "Others")
		fn25("Farmming", { Name = "AutoChestTween", Title = "Auto Chest <Tween>" })
		fn25("Farmming", { Name = "AutoChestTP", Title = "Auto Chest <Teleport>" })
		fn28("Farmming", "Cake Prince")
		fn23("Farmming", { Title = "Cake Prince Status", Content = "Kill 500 Mobs" })
		fn25("Farmming", { Title = "Auto Katakuri" })
		fn25("Farmming", { Title = "Auto Katakuri [ HOP ]" })
		fn28("Farmming", "Bone")
		fn23("Farmming", { Title = "Total Bones: 0" })
		fn25("Farmming", { Title = "Auto Bones" })
		fn28("Items", "Melee")
		fn25("Items", { Name = "DeathStep", Title = "Auto Death Step", Description = "Function only sea 2" })
		fn25("Items", { Name = "ElectricClaw", Title = "Auto Electric Claw", Description = "Function only sea 3" })
		fn28("Items", "Sword")
		fn25("Items", { Name = "Saber", Title = "Auto Saber", Description = "Function only sea 1" })
		fn25("Items", { Name = "Pole", Title = "Auto Pole (1st form)", Description = "Function only sea 1" })
		fn25("Items", { Name = "Rengoku", Title = "Auto Rengoku", Description = "Function only sea 2" })
		fn25("Items", { Name = "Yama", Title = "Auto Yama", Description = "Function only sea 3" })
		fn25("Items", { Name = "Tushita", Title = "Auto Tushita", Description = "Function only sea 3" })
		fn25("Items", { Name = "AutoCDK", Title = "Auto Cursed Dual Katana", Description = "Function only sea 3" })
		fn25("Items", { Name = "AutoSkullGuitar", Title = "Auto Skull Guitar", Description = "Function only sea 3" })
		fn28("Stack Farm", "Sea 1 Functions")
		fn25("Stack Farm", { Name = "AutoDressrosa", Title = "Auto Travel Dressrosa", Description = "Function only sea 1" })
		fn28("Stack Farm", "Sea 2 Functions")
		fn25("Stack Farm", { Name = "AutoBartilo", Title = "Auto Bartilo Quest", Description = "Function only sea 2" })
		fn25("Stack Farm", { Name = "AutoZou", Title = "Auto Travel Zou", Description = "Function only sea 2" })
		fn25("Stack Farm", { Name = "AutoDarkbeard", Title = "Auto Darkbeard", Description = "Function only sea 2" })
		fn25("Stack Farm", { Name = "AutoCursedCaptain", Title = "Auto Cursed Captain", Description = "Function only sea 2" })
		fn28("Stack Farm", "Sea 3 Functions")
		fn25("Stack Farm", { Name = "AutoSoulReaper", Title = "Auto Soul Reaper", Description = "Function only sea 3" })
		fn25("Stack Farm", { Name = "AutoElite", Title = "Auto Elite Hunter", Description = "Function only sea 3" })
		fn25("Stack Farm", { Name = "AutoRipIndra", Title = "Auto Rip Indra", Description = "Function only sea 3" })
		fn25("Stack Farm", { Name = "AutoDoughKing", Title = "Auto Dough King", Description = "Function only sea 3" })
		fn25("Fruit & Dungeon", { Name = "RandomFruit", Title = "Auto Random Fruits", Callback = fn37 })
		fn25("Fruit & Dungeon", { Name = "TPFruit", Title = "Teleport to Fruits Spawn" })
		fn25("Fruit & Dungeon", { Name = "StoreFruit", Title = "Auto Store Fruit", Callback = fn38 })
		fn25("Fruit & Dungeon", { Name = "BringFruit", Title = "Auto Bring Fruit", Callback = fn39 })
		fn28("Fruit & Dungeon", "Raid")
		fn26("Fruit & Dungeon", { Name = "SelectChip", Title = "Select Chips", Values = Chips })
		fn25("Fruit & Dungeon", { Name = "AutoBuyChip", Title = "Auto Buy Chip" })
		fn25("Fruit & Dungeon", { Name = "AutoStartRaid", Title = "Auto Start Raid" })
		fn25("Fruit & Dungeon", { Name = "GetMinValueFruitRaid", Title = "Auto Get Min Value Fruit to Raid" })
		fn25("Fruit & Dungeon", { Name = "AutoAwaken", Title = "Auto Awaken" })
		fn25("Fruit & Dungeon", { Name = "AutoRaid", Title = "Auto Raid", Description = "Top 1 auto raid script" })

		fn24("LocalPlayer", {
			Title = "Remove Frog",
			Callback = function()
				fn31()
			end,
		})

		fn26("LocalPlayer", {
			Name = "SelectStats",
			Title = "Select Stats",
			Values = { "Melee", "Sword", "Defense", "Gun", "Devil Fruit" },
			Multi = true,
		})

		fn25("LocalPlayer", { Name = "AutoStats", Title = "Auto Add Stats", Callback = fn34 })
		fn27("LocalPlayer", { Name = "DashLenghValue", Title = "Dash Length", Max = 1000, Min = 50 })
		fn25("LocalPlayer", { Name = "EnableDashLength", Title = "Enable Custom Dash Lenth", Callback = fn43 })
		fn27("LocalPlayer", { Name = "WalkSpeedValue", Title = "WalkSpeed", Max = 500, Min = 36 })

		fn25("LocalPlayer", {
			Name = "EnableWalkSpeed",
			Title = "Enable WalkSpeed",
			OnChanged = function(arg2)
				if getgenv().OldWalkSpeed then
					getgenv().OldWalkSpeed:Discontuned()
					getgenv().OldWalkSpeed = nil
				end

				if arg2 then
					local renderStepped = runService.RenderStepped

					getgenv().OldWalkSpeed = renderStepped:Connect(function()
						character.Humanoid.WalkSpeed = tonumber(tbl11.WalkSpeedValue)
					end)
				end
			end,
		})

		fn28("LocalPlayer", "ESP")
		fn25("LocalPlayer", { Name = "ESPPlayers", Title = "ESP Players", Callback = fn44 })
		fn25("LocalPlayer", { Name = "ESPIslands", Title = "ESP Islands", Callback = fn45 })
		fn25("LocalPlayer", { Name = "ESPBloxFruits", Title = "ESP Blox Fruits", Callback = fn46 })
		fn25("LocalPlayer", { Name = "ESPChests", Title = "ESP Chests", Callback = fn47 })
		fn28("LocalPlayer", "PvP")

		fn26("LocalPlayer", {
			Name = "SelectPlayerPvP",
			Title = "Select Players",
			Values = tbl10,
			Default = "",
			Callback = function(selectTarget)
				getgenv().SelectTarget = selectTarget
			end,
		})

		fn24("LocalPlayer", {
			Title = "Refresh Players List",
			Callback = function()
				table.clear(tbl10)

				for _, player in pairs(players:GetPlayers()) do
					if player ~= localPlayer then
						tbl10[#tbl10 + 1] = player.Name
					end
				end

				v9.Feature.LocalPlayer["Select Players"]:SetValues(tbl10)
			end,
		})

		fn25("LocalPlayer", { Name = "EnableAimbot", Title = "Aimbot Skill Target", Callback = fn32 })
		fn25("LocalPlayer", { Name = "EnableNearAim", Title = "Aimbot Skill Near Target", Callback = fn33 })

		fn25("LocalPlayer", {
			Title = "Specate Target",
			Callback = function(arg2)
				if not getgenv().SelectTarget then
					return
				end

				if arg2 then
					workspace.CurrentCamera.CameraSubject = workspace.Characters[getgenv().SelectTarget].Humanoid
				else
					workspace.CurrentCamera.CameraSubject = character.Humanoid
				end
			end,
		})

		fn25("LocalPlayer", {
			Title = "Teleport to Target",
			Callback = function(teleporttoTarget)
				if not getgenv().SelectTarget or not workspace.Characters[getgenv().SelectTarget] then
					return
				end
				getgenv().TeleporttoTarget = teleporttoTarget

				spawn(function()
					while getgenv().TeleporttoTarget and task.wait() do
						arg.Module.TweenModule:to(workspace.Characters[getgenv().SelectTarget].HumanoidRootPart.CFrame * CFrame.new(0, 5, 3), true)
					end

					arg.Module.TweenModule:StopTween()
				end)
			end,
		})

		fn25("LocalPlayer", {
			Title = "Big Target Hitbox",
			Callback = function(bixTargetHitbox)
				if not getgenv().SelectTarget or not workspace.Characters[getgenv().SelectTarget] then
					return
				end
				getgenv().BixTargetHitbox = bixTargetHitbox

				spawn(function()
					while getgenv().BixTargetHitbox and wait() do
						if getgenv().SelectTarget then
							workspace.Characters[getgenv().SelectTarget].HumanoidRootPart.Size = Vector3.new(40, 40, 40)
							workspace.Characters[getgenv().SelectTarget].HumanoidRootPart.Transparency = 0.5
						end
					end

					workspace.Characters[getgenv().SelectTarget].HumanoidRootPart.Size = Vector3.new(1, 2, 1)
					workspace.Characters[getgenv().SelectTarget].HumanoidRootPart.Transparency = 1
				end)
			end,
		})

		fn25("LocalPlayer", { Name = "OneHitSaishiZ", Title = "One Hit Saishi Z", Callback = fn35 })

		fn24("Misc", {
			Title = "Open Fruit Shop Dealer",
			Callback = function()
				require(replicatedStorage.Controllers.UI.FruitShop):Open("FruitDealer")
			end,
		})

		fn24("Misc", {
			Title = "Open Advance Fruit Shop Dealer",
			Callback = function()
				require(replicatedStorage.Controllers.UI.FruitShop):Open("AdvancedFruitDealer")
			end,
		})

		fn28("Upgraded Race", "Evo Race")

		fn25("Upgraded Race", {
			Name = "AutoV2V3",
			Title = "Auto Upgrade Race V2 - V3",
			OnChanged = function(arg2)
				getgenv().EnableAim = false
				getgenv().AimPos = nil
				local flag7 = arg2 == true
				local flag8

				if flag7 then
					flag8 = data.Race.Value == "Skypiea" or data.Race.Value == "Fishman"
				else
					flag8 = flag7
				end

				if flag8 then
					lua:Notify({
						Title = "Auto Upgraded Race V2 - V3",
						Content = "Choose Weapon, Skills in Settings Tab",
						Duration = 7,
					})
				end
			end,
		})

		fn28("Upgraded Race", "Mirage Puzzle")
		fn25("Upgraded Race", { Name = "AutoLockMoon", Title = "Auto Look at moon", Callback = fn40 })

		fn24("Upgraded Race", {
			Title = "Teleport to Mirage Island",
			Callback = function()
				if workspace.Map:FindFirstChild("MysticIsland") then
					while true do
						wait()
						arg.Module.TweenModule:to(workspace.Map:FindFirstChild("MysticIsland"):GetPivot() * CFrame.new(0, 500, 0), true)
						if not (arg.Module.GetDistance(arg.Module.SubFunction:getbluegear().CFrame) <= 50 or not humanoid or humanoid.Health <= 0) then
							continue
						end
						break
					end
				end
			end,
		})

		fn24("Upgraded Race", {
			Title = "Teleport to Blue Gear",
			Callback = function()
				if arg.Module.SubFunction:getbluegear() then
					while true do
						wait()
						arg.Module.TweenModule:to(arg.Module.SubFunction:getbluegear().CFrame, true)
						if not (arg.Module.GetDistance(arg.Module.SubFunction:getbluegear().CFrame) <= 50 or not humanoid or humanoid.Health <= 0) then
							continue
						end
						break
					end
				end
			end,
		})

		fn24("Upgraded Race", {
			Title = "Teleport to Advanced Fruit Dealer",
			Callback = function()
				if workspace.Map:FindFirstChild("MysticIsland") then
					for _, child in pairs(workspace.N_Cache.NPCs:GetChildren()) do
						if child.Name == "Advanced Fruit Dealer" then
							arg.Module.TweenModule:to(child:GetPivot(), true)
						end
					end

					for _, v10 in pairs(getnilinstances()) do
						if v10.Name == "Advanced Fruit Dealer" then
							arg.Module.TweenModule:to(v10:GetPivot(), true)
						end
					end
				end
			end,
		})

		fn25("Upgraded Race", { Name = "AutoPullLever", Title = "Auto Pull Lever" })
		fn25("Upgraded Race", { Name = "AutoPullLeverHop", Title = "Auto Pull Lever [HOP] [Premium]" })
		fn28("Upgraded Race", "Trials")

		fn24("Upgraded Race", {
			Title = "Teleport to Great Tree",
			Callback = function()
				if not flag6 then
					return
				end

				if arg.Module.SubFunction:GetDistance(Vector3.new(3044, 2282, -7338)) > 50 then
					repeat
						wait()
						arg.Module.TweenModule:to(CFrame.new(3044, 2282, -7338))
					until arg.Module.SubFunction:GetDistance(Vector3.new(3044, 2282, -7338)) <= 50
				end
			end,
		})

		fn24("Upgraded Race", {
			Title = "Teleport to Temple",
			Callback = function()
				if not flag6 then
					return
				end
				commF:InvokeServer("requestEntrance", Vector3.new(28294, 14896, 103))
			end,
		})

		fn24("Upgraded Race", {
			Title = "Teleport to Lever",
			Callback = function()
				if not flag6 then
					return
				end

				if (Vector3.new(28294, 14896, 103) - humanoidRootPart.Position).Magnitude > 1000 then
					commF:InvokeServer("requestEntrance", Vector3.new(28294, 14896, 103))
				end

				wait(0.3)
				arg.Module.TweenModule:to(workspace.Map["Temple of Time"].Lever.Part.CFrame)

				for _, descendant in pairs(workspace.Map["Temple of Time"].Lever:GetDescendants()) do
					if descendant.Name == "ProximityPrompt" then
						fireproximityprompt(descendant)
						lua:Notify({ Title = "Script", Content = "Pull Lever Done", Duration = 5 })
					end
				end
			end,
		})

		fn24("Upgraded Race", {
			Title = "Teleport to Trial Door",
			Callback = function()
				if not flag6 or data.Race.Value == "Draco" then
					return
				end

				if (Vector3.new(28294, 14896, 103) - humanoidRootPart.Position).Magnitude > 1000 then
					commF:InvokeServer("requestEntrance", Vector3.new(28294, 14896, 103))
				end

				wait(0.3)
				arg.Module.TweenModule:to(tbl16[data.Race.Value].Entrance.CFrame)
			end,
		})

		fn25("Upgraded Race", {
			Name = "AutoTrials",
			Title = "Auto Trials",
			OnChanged = function(arg2)
				if arg2 == false and data.Race.Value == "Fishman" then
					lua:Notify({ Title = "Auto Trials", Content = "Select Weapon & Skills in Settings", Duration = 10 })
				end
			end,
		})

		fn25("Upgraded Race", { Name = "Autoturnv3nearLocalPlayer", Title = "Auto turn race v3 if near player turn" })
		fn25("Upgraded Race", { Name = "AutoKillPlayerAfterTrial", Title = "Auto Kill Player After Trial" })

		fn25("Upgraded Race", {
			Name = "AutoResetTrial",
			Title = "Auto Reset Character In Combat Trial",
			Desc = "Like multi trial",
		})

		fn25("Upgraded Race", { Name = "AutoTrainRace", Title = "Auto Train Race" })
		fn25("Upgraded Race", { Name = "AutoBuyGear", Title = "Auto Buy Gear", Callback = fn41 })
		fn25("Upgraded Race", { Name = "AutoChooseGear", Title = "Auto Choose Gear", Callback = fn42 })
		fn28("Sea Events", "Sea Events")

		fn26("Sea Events", {
			Name = "SelectBoats",
			Title = "Select Boats",
			Values = {
				"Guardian",
				"Dinghy",
				"PirateSloop",
				"PirateBrigade",
				"PirateGrandBrigade",
				"MarineSloop",
				"MarineBrigade",
				"MarineGrandBrigade",
				"Beast Hunter",
			},
		})

		fn25("Sea Events", { Name = "AutoBuyBoat", Title = "Auto Buy Boat" })

		fn24("Sea Events", {
			Title = "Teleport to Ship",
			Callback = function()
				local localBoat = arg.Module.FarmFunction:GetLocalBoat()

				if localBoat then
					while character and humanoid and humanoid.Health > 0 and (localBoat.VehicleSeat.Position - humanoidRootPart.Position).Magnitude > 5 and humanoid.Sit == false and wait() do
						arg.Module.TweenModule:to(localBoat.VehicleSeat.CFrame * CFrame.new(0, 2, 0), true)
					end

					arg.Module.TweenModule:StopTween()
				end
			end,
		})

		fn29("Sea Events", { Title = "Tween Boat Speed", PlaceHolder = "Enter Number" })
		fn29("Sea Events", { Title = "Boat Speed", PlaceHolder = "Enter Number" })

		fn25("Sea Events", {
			Title = "Enable Speed Boat",
			OnChanged = function(arg2)
				if arg2 then
					for _, child in pairs(workspace.Boats:GetChildren()) do
						if child and child.Parent then
							child.VehicleSeat.MaxSpeed = tonumber(tbl11["Boat Speed"]) or 300
						end
					end
				end
			end,
		})

		fn26("Sea Events", {
			Name = "SelectZone",
			Title = "Select Zone",
			Values = { "Zone 1", "Zone 2", "Zone 3", "Zone 4", "Zone 5", "Zone 6", "Infinity" },
		})

		fn25("Sea Events", {
			Name = "StartSeaEvent",
			Title = "Start Sea Event Farmming",
			OnChanged = function()
				arg.Module.FarmFunction:NoClipBoat(false)
			end,
		})

		fn25("Sea Events", {
			Name = "UseM1SeaEvent",
			Title = "Use M1 Fruit(Read desc)",
			Description = "Use m1 fruit to attack ghost ship, pirate ship and sea beast, if you want use it in farm shark, terror please select weapon in farmming tab.",
		})

		fn25("Sea Events", { Name = "AutoShark", Title = "Auto Shark" })
		fn25("Sea Events", { Name = "AutoPiranha", Title = "Auto Piranha" })
		fn25("Sea Events", { Name = "AutoFishCrewMember", Title = "Auto Fish Crew Member" })
		fn25("Sea Events", { Name = "AutoTerrorShark", Title = "Auto Terror Shark" })

		fn25("Sea Events", {
			Name = "AutoShip",
			Title = "Auto Ghost Ship & Pirate Ship",
			OnChanged = function(arg2)
				if arg2 == false then
					fn30()
				else
					lua:Notify({
						Title = "Auto Ghost Ship & Pirate Ship",
						Content = "Select Skills & Weapons in Settings",
						Duration = 7,
					})
				end
			end,
		})

		fn25("Sea Events", {
			Name = "AutoSeabeast",
			Title = "Auto Sea Beast",
			OnChanged = function(arg2)
				if arg2 == false then
					fn30()
				else
					lua:Notify({ Title = "Auto Sea Beast", Content = "Select Skills & Weapons in Settings", Duration = 7 })
				end
			end,
		})

		fn28("Sea Events", "Leviathan")

		fn24("Sea Events", {
			Title = "Buy Spy Leviathan",
			Callback = function()
				commF:InvokeServer("InfoLeviathan", "2")
			end,
		})

		fn25("Sea Events", { Name = "AutoFindLeviathan", Title = "Auto Find Leviathan", Description = "Function Only Sea 3" })

		fn25("Sea Events", {
			Name = "AutoLeviathan",
			Title = "Auto Leviathan",
			Description = "Function Only Sea 3",
			OnChanged = function(arg2)
				if arg2 == false then
					fn30()
				else
					lua:Notify({ Title = "Auto Leviathan", Content = "Select Skills & Weapons in Settings", Duration = 7 })
				end
			end,
		})

		fn28("Sea Events", "Kitsune Events")
		fn25("Sea Events", { Title = "Auto Find Kitsune Island", Description = "Function Only Sea 3" })
		fn25("Sea Events", { Title = "Auto Collect Azure Member", Description = "Function Only Sea 3" })
		fn25("Sea Events", { Title = "Auto Trade Azure Member", Description = "Function Only Sea 3" })
		fn28("Volcano Events", "Dojo Trainer")
		fn25("Volcano Events", { Name = "AutoDojoTrainer", Title = "Auto Dojo Trainer" })
		fn25("Settings", { Title = "Delay Claim Quest", Description = "delay 0.5 - 1 seconds when claim quest" })
		fn25("Settings", { Title = "Same Y", Description = "Tween same y with target" })

		fn26("Settings", {
			Name = "TweenSpeed",
			Title = "Tween Speed",
			Description = "shouldn't choose bigger number",
			Values = { "500", "400", "350", "325", "300", "280", "250", "200", "180" },
		})

		fn28("Settings", "Bring Mobs Setting")
		fn25("Settings", { Title = "Bring Mobs", Description = "" })

		fn26("Settings", {
			Name = "BringRange",
			Title = "Bring Mob Range",
			Values = { "1000", "800", "600", "500", "400", "350" },
		})

		fn26("Settings", {
			Name = "BringSpeed",
			Title = "Bring Mob Speed",
			Values = { "9999", "1000", "800", "500", "300", "200", "180" },
		})

		fn28("Settings", "Spam Skills")
		fn25("Settings", { Name = "SpamMelee", Title = "Use Melee", Description = "" })
		fn26("Settings", { Name = "MeleeSkills", Title = "Select Melee Skills", Values = { "Z", "X", "C" }, Multi = true })
		fn25("Settings", { Name = "SpamSword", Title = "Use Sword", Description = "" })
		fn26("Settings", { Name = "SwordSkills", Title = "Select Sword Skills", Values = { "Z", "X" }, Multi = true })
		fn25("Settings", { Name = "SpamGun", Title = "Use Gun", Description = "" })
		fn26("Settings", { Name = "GunSkills", Title = "Select Gun Skills", Values = { "Z", "X" }, Multi = true })
		fn25("Settings", { Name = "SpamBF", Title = "Use Blox Fruit", Description = "" })

		fn26("Settings", {
			Name = "BFSkills",
			Title = "Select Blox Fruit Skills",
			Values = { "Z", "X", "C", "V", "F" },
			Multi = true,
		})

		fn28("Settings", "Interface")

		fn26("Settings", {
			Name = "SelectTheme",
			Title = "Select Theme",
			Values = {
				"Dark",
				"Darker",
				"AMOLED",
				"Light",
				"Balloon",
				"SoftCream",
				"Aqua",
				"Amethyst",
				"Rose",
				"Midnight",
				"Forest",
				"Sunset",
				"Ocean",
				"Emerald",
				"Sapphire",
				"Cloud",
				"Grape",
				"Bloody",
				"Arctic",
			},
			Callback = function(arg2)
				lua:SetTheme(arg2)
				arg.Module.SaveManager:SaveSettings("SelectTheme", arg2)
			end,
		})

		local function fn51()
			if attribute ~= "Sea3" then
				return "Only Sea 3"
			end

			if arg.Module.FarmFunction:GetMobs({ "Dough King", "Cake Prince" }, true) then
				return arg.Module.FarmFunction:GetMobs({ "Dough King", "Cake Prince" }, true).Name .. " ✅ Spawned!"
			end
			return string.format("Kill: %s Mobs", string.match(commF:InvokeServer("CakePrinceSpawner", true), "%d+") or "0")
		end

		local function fn52()
			if attribute ~= "Sea3" then
				return "Only Sea 3"
			end
			return tostring(arg.Module.SubFunction:GetMaterial("Bones") or "0")
		end

		local function fn53()
			if attribute ~= "Sea3" then
				return "❌ Not Spawned! | Progress: 0"
			end
			return (arg.Module.FarmFunction:GetMobs({ "Deandre", "Diablo", "Urban" }, true) and "✅ Spawned!" or "❌ Not Spawned!") .. " | Progress: " .. commF:InvokeServer("EliteHunter", "Progress")
		end

		local function fn54()
			local n4 = tick() - now
			return string.format("%d Day %d Hours %d Minutes %d Seconds", math.floor(n4 / 86400), math.floor(n4 % 86400 / 3600), math.floor(n4 % 3600 / 60), n4 % 60)
		end

		local function fn55(arg2)
			local str3 = tostring(arg2)

			repeat
				local v10
				str3, v10 = str3:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
				b = v10
			until b == 0

			return str3
		end

		local function fn56(arg2)
			local v10 = arg2 and tbl7 or tbl6

			task.delay(0.2, function()
				local response = commF:InvokeServer("GetFruits", arg2)

				if response then
					table.clear(v10)

					for _, v11 in pairs(response) do
						if v11.OnSale then
							table.insert(v10, v11.Name .. " (" .. tbl9[v11.Rarity] .. ") " .. fn55(v11.Price) .. "$")
						end
					end
				end
			end)

			return table.concat(v10, "$\n")
		end

		CheckSpyStatus = function()
			if not flag6 then
				return "none"
			end
			local response = commF:InvokeServer("InfoLeviathan", "1")
			if workspace.Map:FindFirstChild("LeviathanGate") then
				return "Frozen Dimension Spawn"
			end

			if response == 5 then
				return "The Leviathan is out there! Go find it before it causes more destruction."
			end

			if response ~= -1 then
				return "You're itching to know more? I'll see what I can do... for an easy <font color='rgb(218, 177, 218)'>1,500</font>."
			end
			return "I don't know anything yet."
		end

		spawn(function()
			while task.wait() do
				local ok, result = pcall(function()
					v9.Feature.Farmming["Cake Prince Status"]:SetDesc(fn51())
					v9.Feature.Farmming["Total Bones: 0"]:SetTitle("Total Bones: " .. fn52())
					v9.Feature["Status & Server"]["Elite Hunter"]:SetDesc(fn53())
					v9.Feature["Status & Server"]["Fruit Stock"]:SetDesc(fn56())
					v9.Feature["Status & Server"]["Advanced Fruit Stock"]:SetDesc(fn56(true))
					v9.Feature["Status & Server"]["Time Elapsed"]:SetDesc(fn54())
					v9.Feature["Status & Server"]["Leviathan Status"]:SetDesc(CheckSpyStatus())
				end)

				if not ok then
					print("[⚠️] Status Bugs:", result)
				end
			end
		end)

		print("[✅] Loaded Ui Success!")
	end

	tbl17:StartModule()
	tbl17:StartFunction()
	tbl17:RunFastAttack()
	tbl17:StartUI()
	tbl17:StartFarm()
	print("[✅] Loaded Script in", tick() - now)
end

if nightHubAuthRewrite.Valid or nightHubAuthRewrite.PendingStart then
	task.spawn(fn)
end
