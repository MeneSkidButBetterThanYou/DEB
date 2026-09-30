-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

repeat
	wait()
until game:IsLoaded()

print("Game Loaded")

local obj = setmetatable({}, { __index = function(arg, arg2)
	return game:GetService(arg2)
end })

local genv = getgenv() or _G

if genv.Config and typeof(genv.Config) == "table" then
end

local tbl = {}
local str = "http://163.223.9.144/boss"
tick()
print("[Time]", "Start Script")
local players = obj.Players
local localPlayer = players.LocalPlayer
local workspace = obj.Workspace
local replicatedStorage = obj.ReplicatedStorage
local runService = obj.RunService
local userInputService = obj.UserInputService
local collectionService = obj.CollectionService
local virtualInputManager = obj.VirtualInputManager
local tweenService = obj.TweenService
local enemies = workspace:WaitForChild("Enemies")
localPlayer:WaitForChild("PlayerGui")
local playerScripts = localPlayer:WaitForChild("PlayerScripts")
local commF = replicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local modules = replicatedStorage:WaitForChild("Modules")
local net = modules:WaitForChild("Net")
local reRegisterAttack = net:WaitForChild("RE/RegisterAttack")
local reRegisterHit = net:WaitForChild("RE/RegisterHit")
local flags = modules:WaitForChild("Flags")
local attribute = workspace:GetAttribute("MAP")
require(replicatedStorage.Controllers.UI.Inventory)
local ItemId = require(replicatedStorage.Economy.ItemId)
local ItemReplicationService = require(replicatedStorage.ItemReplicationService)
local KEYS = require(replicatedStorage.ItemReplicationService.KEYS)
ItemReplicationService:GetItems(KEYS.QUANTITY)

local tbl2 = {
	Berries = {
		"Blue Icicle Berry",
		"Green Toad Berry",
		"Orange Berry",
		"Pink Pig Berry",
		"Purple Jelly Berry",
		"Red Cherry Berry",
		"White Cloud Berry",
		"Yellow Star Berry",
	},
}

local tbl3 = {}
local tbl4 = {}
local str2 = ""
local tbl5 = {}
local flag = false
local cframe = CFrame.new(-5541, 314, -2961)
local flag2 = false
local combatRemoteThread = require(flags).COMBAT_REMOTE_THREAD or false

task.spawn(function()
	while true do
		wait()
		if not (localPlayer.Team ~= nil and localPlayer.Character) then
			continue
		end
		break
	end

	if not genv.HitFunc or typeof(genv.HitFunc) ~= "function" then
		for _, child in pairs(playerScripts:GetChildren()) do
			if child and child:IsA("LocalScript") then
				local ok, result = pcall(getsenv, child)

				if ok and result then
					genv.HitFunc = result._G.SendHitsToServer
				end
			end
		end
	end
end)

print("[Game]", "Loaded Game Modules and Remotes")
local tbl6 = {}
local tbl7 = {}
local tbl8 = { Whitelisted = false, IsPremiumUser = false }
local tbl9 = {}
local tbl10 = {}
local v = nil
local fn = nil

local tbl11 = {
	DefaultSettings = {
		["Select Tool"] = "Melee",
		["Tween Speed"] = 250,
		["Auto Buso"] = true,
		["Enable Fast Attack"] = true,
		["Select Theme"] = "Dark",
	},
}

local fn2 = nil

fn2 = function(arg)
	if type(arg) == "table" then
		local tbl12 = {}

		for i, v2 in ipairs(arg) do
			tbl12[i] = fn2(v2)
		end

		return tbl12
	end

	return (tostring(arg):gsub("%s+", ""))
end

local function fn3(arg)
	local v2 = nil

	for _, child in pairs(localPlayer.Backpack:GetChildren()) do
		if child and child.Name == arg then
			v2 = child
			break
		else
			v2 = nil
		end
	end

	for _, child in pairs(localPlayer.Character:GetChildren()) do
		if child and child.Name == arg then
			v2 = child
			break
		end
	end

	return v2
end

local tbl12 = {}
local bxor = bit32.bxor
local band = bit32.band
local lshift = bit32.lshift
local rshift = bit32.rshift
local lrotate = bit32.lrotate
local str3 = "NIGHTHUB|"
local n = 8
local n2 = 4
local n3 = 4294967296
local tbl13 = { 1634760805, 857760878, 2036477234, 1797285236 }

local function fn4(arg)
	local tbl14 = {}

	for i = 1, #arg, 2 do
		tbl14[#tbl14 + 1] = tonumber(arg:sub(i, i + 1), 16)
	end

	return tbl14
end

local function fn5(arg)
	local tbl14 = {}

	for i = 1, #arg do
		tbl14[i] = arg:byte(i)
	end

	return tbl14
end

local function fn6(arg)
	local tbl14 = {}

	for i = 1, #arg do
		tbl14[i] = string.char(arg[i])
	end

	return table.concat(tbl14)
end

local function fn7(arg, arg2)
	return arg[arg2] + arg[arg2 + 1] * 256 + arg[arg2 + 2] * 65536 + arg[arg2 + 3] * 16777216
end

local function fn8(arg, arg2, arg3, arg4, arg5)
	arg[arg2] = (arg[arg2] + arg[arg3]) % n3
	arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 16)
	arg[arg4] = (arg[arg4] + arg[arg5]) % n3
	arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 12)
	arg[arg2] = (arg[arg2] + arg[arg3]) % n3
	arg[arg5] = lrotate(bxor(arg[arg5], arg[arg2]), 8)
	arg[arg4] = (arg[arg4] + arg[arg5]) % n3
	arg[arg3] = lrotate(bxor(arg[arg3], arg[arg4]), 7)
end

local function fn9(arg)
	for i = 1, 10 do
		fn8(arg, 1, 5, 9, 13)
		fn8(arg, 2, 6, 10, 14)
		fn8(arg, 3, 7, 11, 15)
		fn8(arg, 4, 8, 12, 16)
		fn8(arg, 1, 6, 11, 16)
		fn8(arg, 2, 7, 12, 13)
		fn8(arg, 3, 8, 9, 14)
		fn8(arg, 4, 5, 10, 15)
	end
end

local function fn10(arg, arg2, arg3)
	local tbl14 = { tbl13[1], tbl13[2], tbl13[3], tbl13[4] }

	for i = 0, 7 do
		tbl14[5 + i] = fn7(arg, 1 + 4 * i)
	end

	tbl14[13] = arg2 % n3

	for i = 0, 2 do
		tbl14[14 + i] = fn7(arg3, 1 + 4 * i)
	end

	return tbl14
end

local function fn11(arg, arg2, arg3)
	local v2 = fn10(arg, arg2, arg3)
	local tbl14 = {}

	for i = 1, 16 do
		tbl14[i] = v2[i]
	end

	fn9(tbl14)
	local tbl15 = {}

	for i = 1, 16 do
		local n4 = (tbl14[i] + v2[i]) % n3
		local n5 = (i - 1) * 4
		tbl15[n5 + 1] = band(n4, 255)
		tbl15[n5 + 2] = band(rshift(n4, 8), 255)
		tbl15[n5 + 3] = band(rshift(n4, 16), 255)
		tbl15[n5 + 4] = band(rshift(n4, 24), 255)
	end

	return tbl15
end

local function fn12(arg, arg2, arg3, arg4)
	local tbl14 = {}
	local n4 = 0

	while n4 < arg4 do
		local v2 = fn11(arg, arg3, arg2)

		for i = 1, 64 do
			if not (n4 >= arg4) then
				n4 += 1
				tbl14[n4] = v2[i]
				continue
			end

			break
		end

		arg3 += 1
	end

	return tbl14
end

local function fn13(arg, arg2, arg3)
	local v2 = fn10(arg, 4294967295, arg2)
	fn9(v2)
	local n4 = #arg3

	for i = 0, n4 + (16 - n4 % 16) % 16 - 1, 16 do
		for i2 = 0, 3 do
			local n5 = i + 4 * i2
			v2[i2 + 1] = bxor(v2[i2 + 1], (arg3[n5 + 1] or 0) + (arg3[n5 + 2] or 0) * 256 + (arg3[n5 + 3] or 0) * 65536 + (arg3[n5 + 4] or 0) * 16777216)
		end

		fn9(v2)
	end

	v2[1] = bxor(v2[1], n4)
	fn9(v2)
	local v3 = v2[1]
	local tbl14 = {}
	local v4 = band(v3, 255)
	local v5 = band(rshift(v3, 8), 255)
	local v6 = band(rshift(v3, 16), 255)
	local v7 = rshift(v3, 24)
	tbl14[1] = v4
	tbl14[2] = v5
	tbl14[3] = v6

	do
		local values = table.pack(band(v7, 255))
		table.move(values, 1, values.n, 4, tbl14)
	end

	return tbl14
end

local tbl14 = {}

local function fn14(arg)
	local str4 = table.concat(arg, ",")
	if tbl14[str4] then
		return tbl14[str4]
	end
	local v2 = fn12(arg, { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, 11259375, 128)
	local tbl15 = {}

	for i = 1, 64 do
		tbl15[i] = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"):sub(i, i)
	end

	for i = 64, 2, -1 do
		local n4 = i - 1
		local n5 = (v2[2 * n4 + 1] * 256 + v2[2 * n4 + 2]) % i + 1
		local v3 = tbl15[i]
		tbl15[i] = tbl15[n5]
		tbl15[n5] = v3
	end

	local str5 = table.concat(tbl15)
	tbl14[str4] = str5
	return str5
end

local function fn15(arg, arg2)
	local tbl15 = {}
	local n4 = #arg
	local n5 = 1

	while n5 <= n4 do
		local v2 = arg[n5]
		local v3 = arg[n5 + 1]
		local v4 = arg[n5 + 2]
		local v5 = rshift(v2, 2)
		tbl15[#tbl15 + 1] = arg2:sub(v5 + 1, v5 + 1)
		local n6 = lshift(band(v2, 3), 4) + rshift(v3 or 0, 4)
		tbl15[#tbl15 + 1] = arg2:sub(n6 + 1, n6 + 1)

		if v3 ~= nil then
			local n7 = lshift(band(v3, 15), 2) + rshift(v4 or 0, 6)
			tbl15[#tbl15 + 1] = arg2:sub(n7 + 1, n7 + 1)

			if v4 ~= nil then
				local v6 = band(v4, 63)
				tbl15[#tbl15 + 1] = arg2:sub(v6 + 1, v6 + 1)
				n5 += 3
				continue
			end
		end

		break
	end

	return table.concat(tbl15)
end

local function fn16(arg, arg2)
	local tbl15 = {}

	for i = 1, 64 do
		tbl15[arg2:sub(i, i)] = i - 1
	end

	local tbl16 = {}

	for i = 1, #arg do
		local v2 = tbl15[arg:sub(i, i)]
		if v2 == nil then
			return nil
		end
		tbl16[#tbl16 + 1] = v2
	end

	local tbl17 = {}

	for i = 1, #tbl16, 4 do
		local v2 = tbl16[i]
		local v3 = tbl16[i + 1]
		local v4 = tbl16[i + 2]
		local v5 = tbl16[i + 3]
		if v3 == nil then
			return nil
		end
		tbl17[#tbl17 + 1] = band(lshift(v2, 2) + rshift(v3, 4), 255)

		if v4 ~= nil then
			tbl17[#tbl17 + 1] = band(lshift(band(v3, 15), 4) + rshift(v4, 2), 255)
		end

		if v5 ~= nil then
			tbl17[#tbl17 + 1] = band(lshift(band(v4, 3), 6) + v5, 255)
		end
	end

	return tbl17
end

local v2 = fn4("8992d555ed7846a562b058523100fbd0e59b5f6f28e98003230ffb4d9db60411")
local new = Random and Random.new and Random.new() or nil

local function fn17()
	local tbl15 = {}

	for i = 1, 8 do
		tbl15[i] = new and new:NextInteger(0, 255) or math.random(0, 255)
	end

	return tbl15
end

tbl12.encode = function(arg, arg2, arg3)
	arg2 = arg2 or v2
	arg3 = arg3 or fn17()
	local v3 = fn5(arg)
	local tbl15 = {}

	for i = 1, 8 do
		tbl15[i] = arg3[i]
	end

	for i = n + 1, 12 do
		tbl15[i] = 0
	end

	local v4 = fn12(arg2, tbl15, 1, #v3)
	local tbl16 = {}

	for i = 1, #v3 do
		tbl16[i] = bxor(v3[i], v4[i])
	end

	local v5 = fn13(arg2, tbl15, tbl16)
	local tbl17 = {}

	for i = 1, 8 do
		tbl17[#tbl17 + 1] = arg3[i]
	end

	for i = 1, 4 do
		tbl17[#tbl17 + 1] = v5[i]
	end

	for i = 1, #tbl16 do
		tbl17[#tbl17 + 1] = tbl16[i]
	end

	return str3 .. fn15(tbl17, fn14(arg2))
end

tbl12.decode = function(arg, arg2)
	local v3 = arg2 or v2
	if type(arg) ~= "string" or arg:sub(1, #str3) ~= str3 then
		return nil, "bad prefix"
	end
	local v4 = fn16(arg:sub(#str3 + 1), fn14(v3))
	if not v4 or #v4 < n + n2 then
		return nil, "malformed"
	end
	local tbl15 = {}

	for i = 1, 8 do
		tbl15[i] = v4[i]
	end

	for i = n + 1, 12 do
		tbl15[i] = 0
	end

	local tbl16 = {}

	for i = n + n2 + 1, #v4 do
		tbl16[i - n - n2] = v4[i]
	end

	local v5 = fn13(v3, tbl15, tbl16)
	local n4 = 0

	for i = 1, 4 do
		n4 += v5[i] == v4[n + i] and 0 or 1
	end

	if n4 ~= 0 then
		return nil, "bad tag"
	end
	local v6 = fn12(v3, tbl15, 1, #tbl16)
	local tbl17 = {}

	for i = 1, #tbl16 do
		tbl17[i] = bxor(tbl16[i], v6[i])
	end

	return true, fn6(tbl17)
end

tbl3.CheckAndJoinTeam = function()
	if localPlayer.Team == nil then
		repeat
			wait()
			commF:InvokeServer("SetTeam", "Marines")
		until localPlayer.Team ~= nil
	end
end

local function fn18()
	local TweenService = game:GetService("TweenService")
	local n4 = 0
	local str4 = "Noctelis/key.txt"

	local tbl15 = {
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

	local function fn19(arg, arg2, arg3)
		return Color3.fromRGB(arg, arg2, arg3)
	end

	local v3 = fn19(24, 24, 26)
	local v4 = fn19(18, 18, 20)
	local v5 = fn19(237, 237, 235)
	local v6 = fn19(150, 150, 146)
	local v7 = fn19(143, 143, 139)
	local v8 = fn19(111, 140, 208)
	local v9 = fn19(214, 90, 74)
	local v10 = fn19(122, 190, 128)
	local v11 = fn19(128, 156, 220)
	local v12 = fn19(92, 117, 175)
	local v13 = fn19(58, 122, 68)
	local v14 = v8
	local v15 = fn19(255, 255, 255)
	local v16 = fn19(240, 246, 240)
	local n5 = 444
	local n6 = 354
	local n7 = 320
	local n8 = 88
	local n9 = 4
	local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local regular = Enum.FontWeight.Regular
	local bold = Enum.FontWeight.Bold

	local function fn20(arg)
		return Font.new("rbxasset://fonts/families/RobotoMono.json", arg or regular)
	end

	local function fn21(arg, arg2, parent)
		local instance = Instance.new(arg)

		for k, v17 in pairs(arg2) do
			instance[k] = v17
		end

		instance.Parent = parent
		return instance
	end

	local function fn22(arg, arg2, arg3)
		return fn21("UICorner", { Name = arg2, CornerRadius = UDim.new(0, arg) }, arg3)
	end

	local function fn23(arg, arg2)
		return fn21("UIStroke", {
			Name = arg,
			Color = fn19(255, 255, 255),
			Transparency = 0.65,
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			LineJoinMode = Enum.LineJoinMode.Round,
		}, arg2)
	end

	local function fn24(arg, arg2, arg3, arg4, arg5, arg6, arg7)
		return fn21("TextLabel", {
			Name = arg,
			Size = UDim2.new(0, arg6, 0, math.floor(arg3 * 1.2 + 0.5)),
			Position = arg5,
			BackgroundTransparency = 1,
			Text = arg2,
			TextColor3 = arg4,
			TextSize = arg3,
			FontFace = fn20(),
			TextXAlignment = Enum.TextXAlignment.Left,
		}, arg7)
	end

	local function fn25()
		local hui = gethui and gethui() or game:WaitForChild("CoreGui")
		if syn and syn.protect_gui then
			return hui, syn.protect_gui
		end
		return hui, protect_gui
	end

	local function fn26(arg)
		return (arg:gsub("^%s+", ""):gsub("%s+$", ""))
	end

	local function fn27(arg)
		local v17 = setclipboard or toclipboard
		if type(v17) ~= "function" then
			return false
		end
		return pcall(v17, arg)
	end

	local function fn28(arg)
		local match = tbl15.savedKeyFilePath:match("^(.*)[/]")

		if match and isfolder and makefolder and not isfolder(match) then
			pcall(makefolder, match)
		end

		pcall(writefile, tbl15.savedKeyFilePath, arg)
	end

	tbl15.deleteSavedLicenseKey = function()
		if isfile and isfile(tbl15.savedKeyFilePath) then
			pcall(delfile, tbl15.savedKeyFilePath)
		end

		if isfile and isfile("Noctelis/key.txt") then
			pcall(delfile, "Noctelis/key.txt")
		end
	end

	local function fn29()
		if not (isfile and readfile) then
			return
		end
		local savedKeyFilePath = isfile(tbl15.savedKeyFilePath) and tbl15.savedKeyFilePath or isfile("Noctelis/key.txt") and "Noctelis/key.txt"
		if not savedKeyFilePath then
			return
		end
		local ok, result = pcall(readfile, savedKeyFilePath)
		if not ok or type(result) ~= "string" then
			return
		end

		if savedKeyFilePath == str4 then
			fn28(result)
		end

		local v17 = fn26(result)
		local flag3 = v17 ~= "" and utf8.len(v17)
		if not flag3 or flag3 > tbl15.maximumKeyLength then
			return
		end
		return v17
	end

	tbl15.destroyInterface = function()
		n4 += 1
		local v17 = fn25():FindFirstChild(tbl15.interfaceName)

		if v17 then
			v17:Destroy()
		end
	end

	tbl15.showInterface = function(arg, arg2)
		tbl15.destroyInterface()
		local v17 = n4
		local v18 = fn29()
		local flag3 = arg ~= nil and type(arg) ~= "string"
		local flag4 = type(arg) == "string" and fn26(arg) or nil

		if flag4 == "" then
			flag4 = nil
		end

		local flag5 = not flag3 and (flag4 or v18) or nil
		local v19, v20 = fn25()

		local ScreenGui = fn21("ScreenGui", {
			Name = tbl15.interfaceName,
			DisplayOrder = 10,
			IgnoreGuiInset = true,
			ResetOnSpawn = false,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		}, v19)

		if v20 then
			pcall(v20, ScreenGui)
		end

		local Frame = fn21("Frame", {
			Name = "Scrim",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = fn19(0, 0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Active = true,
			ZIndex = 1,
		}, ScreenGui)

		local CanvasGroup = fn21("CanvasGroup", {
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

			local Frame2 = fn21("Frame", {
				Name = ("Aura%*"):format(i),
				Size = UDim2.new(1, n10 * 2 - n9 * 4 - 4, 1, n10 * 2 - n9 * 4 - 4),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = v8,
				BackgroundTransparency = 0.83,
				BorderSizePixel = 0,
			}, CanvasGroup)

			fn22(12 + n10, "AuraCorner", Frame2)
		end

		local Frame2 = fn21("Frame", {
			Name = "Panel",
			Size = UDim2.new(1, -n9 * 4 - 4, 1, -n9 * 4 - 4),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = v3,
			BorderSizePixel = 0,
		}, CanvasGroup)

		fn22(12, "PanelCorner", Frame2)
		fn23("PanelStroke", Frame2)
		local CanvasGroup2 = fn21("CanvasGroup", { Name = "Body", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1 }, Frame2)
		fn24("Title", tbl15.titleText, 20, v5, UDim2.new(0, 22, 0, 22), 340, CanvasGroup2).FontFace = fn20(bold)
		fn24("Hint", tbl15.hintText, 13, v6, UDim2.new(0, 22, 0, 52), 340, CanvasGroup2)

		local TextButton = fn21("TextButton", {
			Name = "Close",
			Size = UDim2.new(0, 32, 0, 32),
			Position = UDim2.new(1, -12, 0, 18),
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			Text = "",
			FontFace = fn20(),
			AutoButtonColor = false,
		}, CanvasGroup2)

		local tbl16 = {}

		for i, v21 in ipairs({ 45, -45 }) do
			tbl16[i] = fn21("Frame", {
				Name = ("Bar%*"):format(i),
				Size = UDim2.new(0, 13, 0, 1),
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = v7,
				Rotation = v21,
				BorderSizePixel = 0,
			}, TextButton)
		end

		fn21("Frame", {
			Name = "Divider",
			Size = UDim2.new(1, -44, 0, 1),
			Position = UDim2.new(0, 22, 0, 88),
			BackgroundColor3 = fn19(255, 255, 255),
			BackgroundTransparency = 0.86,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn24("Label", tbl15.keyInputLabelText, 13, v6, UDim2.new(0, 22, 0, 108), 220, CanvasGroup2)

		local Frame3 = fn21("Frame", {
			Name = "Field",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 130),
			BackgroundColor3 = v4,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn22(8, "FieldCorner", Frame3)
		local FieldStroke = fn23("FieldStroke", Frame3)

		local TextBox = fn21("TextBox", {
			Name = "Box",
			Size = UDim2.new(1, -32, 1, 0),
			Position = UDim2.new(0, 16, 0, 0),
			BackgroundTransparency = 1,
			Text = "",
			PlaceholderText = "Paste your key here",
			PlaceholderColor3 = v7,
			TextColor3 = v5,
			TextSize = 16,
			FontFace = fn20(),
			TextXAlignment = Enum.TextXAlignment.Left,
			ClearTextOnFocus = false,
			MultiLine = false,
		}, Frame3)

		local Err = fn24("Err", "", 13, v9, UDim2.new(0, 22, 0, 192), 400, CanvasGroup2)

		local TextButton2 = fn21("TextButton", {
			Name = "Submit",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 218),
			BackgroundColor3 = v14,
			Text = "",
			FontFace = fn20(),
			AutoButtonColor = false,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn22(8, "SubmitCorner", TextButton2)

		local TextLabel = fn21("TextLabel", {
			Name = "SubmitTitle",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = tbl15.submitButtonText,
			TextColor3 = v15,
			TextSize = 18,
			FontFace = fn20(),
		}, TextButton2)

		local TextButton3 = fn21("TextButton", {
			Name = "GetKey",
			Size = UDim2.new(1, -44, 0, 50),
			Position = UDim2.new(0, 22, 0, 278),
			BackgroundColor3 = v14,
			Text = "",
			FontFace = fn20(),
			AutoButtonColor = false,
			BorderSizePixel = 0,
		}, CanvasGroup2)

		fn22(8, "GetKeyCorner", TextButton3)

		fn21("TextLabel", {
			Name = "GetKeyTitle",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = tbl15.getKeyButtonText,
			TextColor3 = v15,
			TextSize = 18,
			FontFace = fn20(),
		}, TextButton3)

		local CanvasGroup3 = fn21("CanvasGroup", {
			Name = "Load",
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 1,
			Visible = false,
		}, Frame2)

		local Step = fn24("Step", "", 14, v5, UDim2.new(0, 22, 0, 28), 190, CanvasGroup3)
		local Pct = fn24("Pct", "0%", 13, v6, UDim2.new(1, -22, 0, 29), 60, CanvasGroup3)
		Pct.AnchorPoint = Vector2.new(1, 0)
		Pct.TextXAlignment = Enum.TextXAlignment.Right

		local Frame4 = fn21("Frame", {
			Name = "Track",
			Size = UDim2.new(1, -44, 0, 2),
			Position = UDim2.new(0, 22, 0, 60),
			BackgroundColor3 = fn19(255, 255, 255),
			BackgroundTransparency = 0.88,
			BorderSizePixel = 0,
		}, CanvasGroup3)

		local Frame5 = fn21("Frame", { Name = "Fill", Size = UDim2.fromScale(0, 1), BackgroundColor3 = v8, BorderSizePixel = 0 }, Frame4)
		local tweenInfo2 = TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tweenInfo3 = TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		local tweenInfo4 = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

		if flag5 then
			CanvasGroup.Size = UDim2.fromOffset(n7 + n9 * 4, n8 + n9 * 4)
			CanvasGroup2.Visible = false
			CanvasGroup2.GroupTransparency = 1
			CanvasGroup3.Visible = true
			CanvasGroup3.GroupTransparency = 0
		end

		TweenService:Create(Frame, tweenInfo, { BackgroundTransparency = 0.45 }):Play()
		TweenService:Create(CanvasGroup, tweenInfo2, { GroupTransparency = 0 }):Play()

		local function fn30(arg3, arg4)
			TweenService:Create(arg3, tweenInfo, arg4):Play()
		end

		local flag6 = nil
		local flag7 = nil
		local text = nil

		local function fn31()
			return not flag7 and v17 == n4 and ScreenGui.Parent ~= nil
		end

		local function fn32()
			if not fn31() then
				return
			end
			flag7 = true
			n4 += 1
			TweenService:Create(Frame, tweenInfo3, { BackgroundTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo3, { GroupTransparency = 1 }):Play()
			task.delay(0.12, ScreenGui.Destroy, ScreenGui)
		end

		local function fn33(arg3, arg4)
			fn30(FieldStroke, { Color = arg3, Transparency = arg4, Thickness = arg4 < 0.3 and 2 or 1 })
		end

		local function fn34(text2)
			if not fn31() then
				return
			end
			local v21 = Err
			local v22 = v9
			local text3 = TextBox.Text
			Err.Text = text2
			v21.TextColor3 = v22
			text = text3
			fn33(v9, 0)
		end

		local function fn35()
			if Err.Text == "" or TextBox.Text == text then
				return
			end
			Err.Text = ""
			if TextBox:IsFocused() then
				return fn33(v8, 0)
			end
			fn33(fn19(255, 255, 255), 0.65)
		end

		local function fn36(text2)
			Step.TextTransparency = 1
			Step.Text = text2
			TweenService:Create(Step, tweenInfo2, { TextTransparency = 0 }):Play()
		end

		local function fn37(arg3, arg4, arg5)
			local now = os.clock()

			while true do
				if not fn31() then
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

		local function fn38(arg3)
			local n10 = #tbl15.loadingStageMessages
			local n11 = 1 - arg3

			for i, loadingStageMessage in ipairs(tbl15.loadingStageMessages) do
				if not fn31() then
					return
				end
				fn36(loadingStageMessage)
				fn37(arg3 + n11 * (i - 1) / n10, arg3 + n11 * i / n10, 0.55)
			end
		end

		local function fn39(arg3, arg4)
			task.wait(0.4)
			if not fn31() then
				return
			end
			fn32()
			local v21 = n4
			task.wait(0.16)

			if v21 == n4 and tbl15.onLicenseKeyAccepted then
				task.spawn(tbl15.onLicenseKeyAccepted, arg3, arg4)
			end
		end

		local function fn40()
			CanvasGroup3.Visible = true
			TweenService:Create(CanvasGroup2, tweenInfo3, { GroupTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo4, { Size = UDim2.fromOffset(n7 + n9 * 4, n8 + n9 * 4) }):Play()
			task.wait(0.13)
			if not fn31() then
				return
			end
			CanvasGroup2.Visible = false
			task.wait(0.17)
			if not fn31() then
				return
			end
			TweenService:Create(CanvasGroup3, tweenInfo2, { GroupTransparency = 0 }):Play()
		end

		local function fn41(arg3, arg4, arg5)
			if not fn31() then
				return
			end

			if type(arg4) == "table" and arg4.shouldForgetSavedKey == true and fn29() == arg5 then
				tbl15.deleteSavedLicenseKey()
			end

			CanvasGroup2.Visible = true
			TweenService:Create(CanvasGroup3, tweenInfo3, { GroupTransparency = 1 }):Play()
			TweenService:Create(CanvasGroup, tweenInfo4, { Size = UDim2.fromOffset(n5 + n9 * 4, n6 + n9 * 4) }):Play()
			task.wait(0.14)
			if not fn31() then
				return
			end
			CanvasGroup3.Visible = false
			TweenService:Create(CanvasGroup2, tweenInfo2, { GroupTransparency = 0 }):Play()
			fn34(arg3)
		end

		local function fn42(arg3, arg4)
			if type(arg3) == "table" and type(arg3.message) == "string" and arg3.message ~= "" then
				return arg3.message
			end
			return arg4
		end

		local function fn43(arg3)
			local flag8 = false
			local v21 = nil
			local v22 = nil
			local v23 = nil

			local thread = task.spawn(function()
				local ok, result, result2 = pcall(tbl15.validateLicenseKey, arg3)
				v21 = ok
				v22 = result
				v23 = result2
				flag8 = true
			end)

			local now = os.clock()
			local n10 = math.clamp(tonumber(tbl15.savedKeyCheckTimeoutSeconds) or 15, 1, 60)

			while not flag8 and fn31() and os.clock() - now < n10 do
				task.wait()
			end

			if not flag8 then
				pcall(task.cancel, thread)
				return false, false, { message = "Key check timed out, try again", shouldForgetSavedKey = false }
			end
			return v21, v22 == true, v23
		end

		local function fn44()
			if flag6 or not fn31() then
				return
			end
			local v21 = fn26(TextBox.Text)
			if v21 == "" then
				return fn34("Enter your key first")
			end

			if type(tbl15.validateLicenseKey) ~= "function" then
				return fn34("No verifier attached")
			end
			local v22 = TextLabel
			flag6 = true
			v22.Text = "Checking..."
			fn30(TextButton2, { BackgroundColor3 = v12 })
			local v23, v24, v25 = fn43(v21)
			if not fn31() then
				return
			end
			flag6 = false

			if not v23 then
				TextLabel.Text = tbl15.submitButtonText
				fn30(TextButton2, { BackgroundColor3 = v14 })
				return fn34(fn42(v25, "Check failed, try again"))
			end

			if not v24 then
				TextLabel.Text = tbl15.submitButtonText
				fn30(TextButton2, { BackgroundColor3 = v14 })

				if type(v25) == "table" and v25.shouldForgetSavedKey == true and fn29() == v21 then
					tbl15.deleteSavedLicenseKey()
				end

				return fn34(fn42(v25, "Key not valid, check it and retry"))
			end

			local v26 = TextLabel
			flag6 = true
			v26.Text = "Verified"
			TextBox:ReleaseFocus()
			fn30(TextButton2, { BackgroundColor3 = v13 })
			fn30(TextLabel, { TextColor3 = v16 })
			fn33(v10, 0)
			fn28(v21)
			task.wait(0.35)
			if not fn31() then
				return
			end
			fn40()
			fn38(0)
			fn39(v21, v25)
		end

		local function fn45(arg3)
			if type(tbl15.validateLicenseKey) ~= "function" then
				return fn41("No verifier attached")
			end
			local n10 = #tbl15.loadingStageMessages + 1
			fn36(flag4 and "Checking configured key" or tbl15.savedKeyCheckMessage)
			fn37(0, 1 / n10, 0.5)
			if not fn31() then
				return
			end
			local v21, v22, v23 = fn43(arg3)
			if not fn31() then
				return
			end

			if not v21 then
				return fn41(fn42(v23, flag4 and "Configured key check failed" or "Saved key check failed"))
			end

			if not v22 then
				return fn41(fn42(v23, flag4 and "Configured key not valid" or "Saved key no longer valid"), v23, arg3)
			end

			if flag4 then
				if type(v23) ~= "table" or v23.valid ~= true then
					return fn41("Configured key is not valid")
				end
				fn28(arg3)
			end

			fn38(1 / n10)
			fn39(arg3, v23)
		end

		TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local v21 = utf8.len(TextBox.Text)
			if v21 and v21 > tbl15.maximumKeyLength then
				TextBox.Text = TextBox.Text:sub(1, utf8.offset(TextBox.Text, tbl15.maximumKeyLength + 1) - 1)
				return
			end
			fn35()
		end)

		TextBox.Focused:Connect(function()
			if Err.Text == "" then
				fn33(v8, 0)
			end
		end)

		TextBox.FocusLost:Connect(function(enterPressed)
			if Err.Text == "" then
				fn33(fn19(255, 255, 255), 0.65)
			end

			if enterPressed then
				fn44()
			end
		end)

		TextButton2.MouseEnter:Connect(function()
			if not flag6 then
				fn30(TextButton2, { BackgroundColor3 = v11 })
			end
		end)

		TextButton2.MouseLeave:Connect(function()
			if not flag6 then
				fn30(TextButton2, { BackgroundColor3 = v14 })
			end
		end)

		TextButton2.MouseButton1Down:Connect(function()
			if not flag6 then
				fn30(TextButton2, { BackgroundColor3 = v12 })
			end
		end)

		TextButton2.MouseButton1Click:Connect(fn44)

		TextButton3.MouseEnter:Connect(function()
			fn30(TextButton3, { BackgroundColor3 = v11 })
		end)

		TextButton3.MouseLeave:Connect(function()
			fn30(TextButton3, { BackgroundColor3 = v14 })
		end)

		TextButton3.MouseButton1Down:Connect(function()
			fn30(TextButton3, { BackgroundColor3 = v12 })
		end)

		TextButton3.MouseButton1Click:Connect(function()
			local v21 = fn27(tbl15.getKeyUrl)
			Err.Text = v21 and "Get Key link copied" or tbl15.getKeyUrl
			Err.TextColor3 = v21 and v10 or v6
			text = TextBox.Text
			fn30(TextButton3, { BackgroundColor3 = v11 })
		end)

		local text2 = "Click the cross again to close"
		local flag8 = false
		local flag9 = false

		local function fn46()
			local v21 = flag9 and v9 or flag8 and v5 or v7

			for _, v22 in ipairs(tbl16) do
				fn30(v22, { BackgroundColor3 = v21 })
			end
		end

		TextButton.MouseEnter:Connect(function()
			flag8 = true
			fn46()
		end)

		TextButton.MouseLeave:Connect(function()
			flag8 = false
			fn46()
		end)

		TextButton.MouseButton1Click:Connect(function()
			if flag9 then
				return fn32()
			end
			flag9 = true
			local v21 = Err
			local v22 = v6
			local text3 = TextBox.Text
			Err.Text = text2
			v21.TextColor3 = v22
			text = text3
			fn46()

			task.delay(10, function()
				if flag7 then
					return
				end
				flag9 = false

				if Err.Text == text2 then
					Err.Text = ""
				end

				fn46()
			end)
		end)

		if flag3 then
			fn34("Configured key must be a string")
		elseif flag5 then
			task.spawn(fn45, flag5)
		elseif type(arg2) == "string" and arg2 ~= "" then
			fn34(arg2)
		end

		return ScreenGui, TextBox
	end

	return tbl15
end

local HttpService = game:GetService("HttpService")
local genv2 = type(getgenv) == "function" and getgenv() or _G
local request_ = request or http_request or syn and syn.request
local hash = crypt and crypt.hash
local hmac = crypt and crypt.hmac
local str4 = "https://103.69.96.168"
local v3 = fn18()

local function fn19(arg, arg2, arg3)
	return false, { valid = false, code = arg, message = arg2, shouldForgetSavedKey = arg3 == true }
end

local function fn20(arg, arg2)
	return type(arg) == "string" and #arg == arg2 and not arg:find("[^a-f0-9]")
end

local function fn21(arg)
	return type(arg) == "number" and arg == arg and arg > 0 and arg < math.huge and arg % 1 == 0
end

local function fn22(arg, arg2)
	if type(arg) ~= "table" then
		return nil
	end
	local str5 = arg2:lower()

	for k, v4 in pairs(arg) do
		if type(k) == "string" and k:lower() == str5 and type(v4) == "string" then
			return v4
		end
	end
end

local function fn23(arg, arg2)
	local ok, result = pcall(request_, {
		Url = str4 .. "/auth",
		Method = "POST",
		Headers = { ["Content-Type"] = "application/json", Accept = "application/json, text/plain" },
		Body = HttpService:JSONEncode(arg),
		Timeout = 15,
	})

	if not ok or type(result) ~= "table" then
		return nil, "Cannot reach the license server"
	end
	local flag3 = type(result.Body) ~= "string" or #result.Body < 1
	local flag4

	if flag3 then
		flag4 = flag3
	else
		flag4 = #result.Body > (arg2 or 8192)
	end

	if flag4 then
		return nil, "Invalid response from the license server"
	end
	return result
end

local function validateLicenseKey(arg)
	if type(arg) ~= "string" or #arg < 13 or #arg > v3.maximumKeyLength then
		return fn19("INVALID_KEY_FORMAT", "Enter a valid Night Hub key")
	end

	if type(request_) ~= "function" then
		return fn19("HTTP_UNAVAILABLE", "HTTP request is unavailable")
	end

	if type(gethwid) ~= "function" then
		return fn19("HWID_UNAVAILABLE", "Cannot read this device's hardware identifier")
	end

	if type(hash) ~= "function" or type(hmac) ~= "function" then
		return fn19("CRYPTO_UNAVAILABLE", "SHA-256 or HMAC is unavailable")
	end
	local ok, result = pcall(gethwid)
	if not ok or type(result) ~= "string" or #result < 1 or #result > 256 or result:find("%c") then
		return fn19("HWID_UNAVAILABLE", "Cannot read this device's hardware identifier")
	end
	local str5 = HttpService:GenerateGUID(false):gsub("%-", ""):lower()
	local v4, v5 = fn23({ step = "init", licenseKey = arg, hardwareIdentifier = result, clientNonce = str5 }, 8192)
	if not v4 then
		return fn19("VALIDATION_UNAVAILABLE", v5)
	end
	local ok2, result2 = pcall(HttpService.JSONDecode, HttpService, v4.Body)
	if not ok2 or type(result2) ~= "table" then
		return fn19("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.valid == false then
		local message = type(result2.message) == "string" and result2.message or "Key rejected"
		return fn19(type(result2.code) == "string" and result2.code or "KEY_REJECTED", message, result2.shouldForgetSavedKey)
	end

	if result2.valid ~= true or not fn20(result2.sessionIdentifier, 32) or not fn20(result2.accessToken, 64) or not fn20(result2.challenge, 64) or result2.clientNonce ~= str5 or not fn21(result2.sessionExpiresAt) or not fn21(result2.serverTime) or result2.sessionExpiresAt <= result2.serverTime or result2.sessionExpiresAt - result2.serverTime > 120 then
		return fn19("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.version ~= "Free" and result2.version ~= "NightHub" and result2.version ~= "Noctelis" then
		return fn19("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.subscriptionTier ~= "Free" and result2.subscriptionTier ~= "Pro" then
		return fn19("INVALID_SERVER_RESPONSE", "Invalid response from the license server")
	end

	if result2.expiresAt ~= nil and (not fn21(result2.expiresAt) or result2.expiresAt <= result2.serverTime) then
		return fn19("KEY_EXPIRED", "This key has expired", true)
	end

	local v6, v7 = fn23({
		step = "start",
		sessionIdentifier = result2.sessionIdentifier,
		accessToken = result2.accessToken,
		challenge = result2.challenge,
		clientNonce = str5,
		hardwareIdentifier = result,
	}, 8388608)

	if not v6 then
		return fn19("VALIDATION_UNAVAILABLE", v7)
	end

	if v6.StatusCode ~= 200 then
		return fn19("AUTH_START_FAILED", "Protected authorization failed")
	end
	local ok3, result3 = pcall(hash, v6.Body, "sha256")
	if not ok3 or not fn20(result3, 64) then
		return fn19("CRYPTO_UNAVAILABLE", "Payload integrity check failed")
	end
	local v8 = fn22(v6.Headers, "x-night-hub-session")
	local v9 = fn22(v6.Headers, "x-night-hub-digest")
	local v10 = fn22(v6.Headers, "x-night-hub-watermark")
	local v11 = fn22(v6.Headers, "x-night-hub-proof")
	if not fn20(v8, 32) or not fn20(v10, 32) or v9 ~= result3 or type(v11) ~= "string" then
		return fn19("INVALID_SERVER_RESPONSE", "Protected authorization signature is invalid")
	end
	local ok4, result4 = pcall(hmac, result2.challenge, table.concat({ v8, result3, v10 }, ":"), "sha256")
	if not ok4 or v11 ~= result4 then
		return fn19("INVALID_SERVER_RESPONSE", "Protected authorization signature is invalid")
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
		v3.destroyInterface()
	end,
}

v3.validateLicenseKey = validateLicenseKey

v3.onLicenseKeyAccepted = function(arg, details)
	if nightHubAuthRewrite.Valid then
		return
	end
	nightHubAuthRewrite.Valid = true
	nightHubAuthRewrite.Details = details
	tbl8.Whitelisted = true
	tbl8.IsPremiumUser = details.subscriptionTier == "Pro"

	if fn then
		task.spawn(fn)
	else
		nightHubAuthRewrite.PendingStart = true
	end
end

print("[Authenticate] System Loaded")
genv2.NightHubAuthRewrite = nightHubAuthRewrite
local value = rawget(genv2, "Key")
v3.showInterface(type(value) == "string" and value or nil)

tbl8.decodeResponse = function(arg)
	if type(arg) ~= "string" then
		return false, "Response body is missing"
	end
	local ok, result = pcall(HttpService.JSONDecode, HttpService, arg)
	if not ok or type(result) ~= "table" then
		return false, "Response body is invalid"
	end
	return true, result
end

tbl11.InitSettings = function()
	local v4 = isfolder
	local v5 = makefolder

	local function fn24()
		if not v4("Night Hub") then
			v5("Night Hub")
		end

		if not v4("Night Hub/Hop Boss") then
			v5("Night Hub/Hop Boss")
		end

		writefile("Night Hub/Hop Boss/Night-" .. localPlayer.Name .. "-Settings.json", HttpService:JSONEncode(tbl11.DefaultSettings))
	end

	local fn25 = nil

	fn25 = function()
		local ok, result = pcall(function()
			if not v4("Night Hub") or not v4("Night Hub/Hop Boss") then
				fn24()
			end

			return HttpService:JSONDecode(readfile("Night Hub/Hop Boss/Night-" .. localPlayer.Name .. "-Settings.json"))
		end)

		if ok then
			return result
		end
		fn24()
		return fn25()
	end

	tbl11.DefaultSettings = fn25()

	setmetatable(tbl, {
		__index = tbl11.DefaultSettings,
		__newindex = function(arg, arg2, arg3)
			if not arg2 then
				warn("Settings", "Missing index!")
				return
			end
			rawset(tbl11.DefaultSettings, arg2, arg3)
			fn24()
		end,
	})

	print("[Settings]", "Initialize Settings Successful!")
end

tbl7.FuncManager = function()
	local tbl15

	tbl15 = {
		JoinServer = function(arg, arg2)
			v:Notify({ Title = "Night Hub Hop Boss", Content = arg2 or "Joining Server...", Duration = 5 })
			wait(0.2)
			return replicatedStorage.__ServerBrowser:InvokeServer("teleport", tostring(arg))
		end,
		HopServers = function()
			local serverBrowser = game.ReplicatedStorage:WaitForChild("__ServerBrowser")

			for i = 1, 100 do
				local response = serverBrowser:InvokeServer(i)

				for k, v4 in pairs(response) do
					v4 = v4 and v4.Count < 12

					if v4 then
						tbl15.JoinServer(k)
					end
				end
			end
		end,
		GetCountByApi = function(arg)
			local ok, result = pcall(function()
				return request({ Url = str .. "/" .. fn2(arg), Method = "GET" })
			end)

			if not ok then
				return false, "Failed to check boss in api, error: " .. tostring(result)
			end
			local v4, v5 = tbl8.decodeResponse(result.Body)
			if not v4 then
				return false, v5
			end
			return true, "Check " .. tostring(arg) .. " successful, found " .. tostring(v5.count) .. " servers"
		end,
		SaveServerJoined = function()
			table.insert(tbl4, game.JobId)
			writefile("ServerJoined.json", HttpService:JSONEncode(tbl4))
		end,
	}

	if not isfile("ServerJoined.json") then
		tbl15.SaveServerJoined()
	end

	tbl4 = HttpService:JSONDecode(readfile("ServerJoined.json"))

	tbl15.StartHop = function(arg)
		local ok, result = pcall(function()
			return request({ Url = str .. "/" .. fn2(arg), Method = "GET" })
		end)

		if not ok then
			return false, "Failed to check boss in api, error: " .. tostring(result)
		end
		local v4, v5 = tbl8.decodeResponse(result.Body)
		if not v4 then
			return false, v5
		end

		if v5.count <= 0 then
			return false, "No Boss Found!"
		end

		table.sort(v5.data, function(arg2, arg3)
			return arg2.Age < arg3.Age
		end)

		if not table.find(tbl4, game.JobId) then
			tbl15.SaveServerJoined()
		end

		for _, v6 in pairs(v5.data) do
			if v6.PlaceId == game.PlaceId and v6.Players < 12 and v6.Sea == attribute then
				local v7, v8 = tbl12.decode(v6.JobId)

				if v7 and v8 and game.JobId ~= v8 and not table.find(tbl4, v8) then
					tbl15.JoinServer(v8)
					task.wait(0.3)
				end
			end
		end

		return true, nil
	end

	tbl15.CheckInventory = function(arg)
		if ItemReplicationService.IsInitialized then
			local items = ItemReplicationService:GetItems(KEYS.QUANTITY)

			for _, item in pairs(items) do
				local v4 = ItemId.getDataFromId(item.ItemId):unwrap()
				if v4.StorageKey == arg and item.Value >= 1 then
					return { Name = v4.StorageKey, Count = item.Value or 0, Type = v4.Type }
				end
			end
		end

		return false
	end

	tbl15.GetMaterial = function(arg)
		local v4 = tbl15.CheckInventory(arg)
		return arg and typeof(arg) ~= "boolean" and v4.Count or 0
	end

	tbl15.IsFullmoon = function()
		return (game.Lighting.ClockTime >= 18 or game.Lighting.ClockTime < 5) and game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431"
	end

	tbl15.FoundBerries = function()
		local tagged = collectionService:GetTagged("BerryBush")
		local huge = math.huge
		local v4 = nil

		for i = 1, #tagged do
			local v5 = tagged[i]
			local v6 = next
			local attributes, v7 = v5:GetAttributes()

			for _, v8 in v6, attributes, v7 do
				if table.find(tbl2.Berries, v8) then
					local position = localPlayer.Character.HumanoidRootPart.Position
					local magnitude = (v5.Parent:GetPivot().Position - position).Magnitude

					if magnitude <= huge then
						huge = magnitude
						v4 = v5
					end
				end
			end
		end

		return v4
	end

	tbl15.CheckNotify = function(arg)
		for _, child in pairs(localPlayer.PlayerGui.Notifications:GetChildren()) do
			if child and child.Parent and child:IsA("TextLabel") and child.Text and string.find(string.lower(child.Text), arg) then
				return true
			end
		end

		return false
	end

	tbl15.CheckFruit = function()
		local v4 = next
		local children, v5 = workspace:GetChildren()

		for _, v6 in v4, children, v5 do
			if (v6:IsA("Model") or v6:IsA("Tool")) and string.find(v6.Name, "Fruit") and v6.Parent and v6:FindFirstChild("Handle") then
				return v6
			end
		end
	end

	tbl15.StoreBF = function()
		for _, child in pairs(localPlayer.Backpack:GetChildren()) do
			if string.find(child.Name, "Fruit") and child:GetAttribute("OriginalName") then
				commF:InvokeServer("StoreFruit", child:GetAttribute("OriginalName"), child)
			end
		end

		for _, child in pairs(localPlayer.Character:GetChildren()) do
			if string.find(child.Name, "Fruit") and child:GetAttribute("OriginalName") then
				commF:InvokeServer("StoreFruit", child:GetAttribute("OriginalName"), child)
			end
		end
	end

	tbl15.SendWebhook = function(arg, arg2)
		if not arg then
			return false, "Missing Webhook Url!"
		end

		if not arg2 or typeof(arg2) ~= "table" then
			return false, "Missing Body or Body type mismatch!"
		end

		local ok, result = pcall(function()
			return request({
				Url = arg,
				Method = "POST",
				Headers = { ["Content-Type"] = "application/json" },
				Body = HttpService:JSONEncode(arg2),
			})
		end)

		if not ok or result and result.StatusCode ~= 204 then
			return false, "Send Failed, Error: " .. tostring(result)
		end

		if ok and result and result.StatusCode == 204 then
			return true, "Send Webhook Success!"
		end
		return false, nil
	end

	tbl15.CheckRaidCastle = function()
		return tbl9.GetMobInCFrame(cframe)
	end

	return tbl15
end

tbl6.Tween = nil
tbl6.NoClipParts = {}

tbl6.Portals = {
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
		["Castle On The Sea"] = Vector3.new(-5073, 314, -3152),
		["Hydra Island"] = Vector3.new(5681, 1013, -313),
	},
}

local function fn24()
	local character = localPlayer.Character
	if not character then
		return nil
	end
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then
		return nil
	end
	return character, humanoidRootPart, humanoid
end

local function fn25(arg)
	if typeof(arg) == "CFrame" then
		return arg
	end

	if typeof(arg) == "Vector3" then
		return CFrame.new(arg)
	end

	if typeof(arg) == "Instance" then
		if arg:IsA("Model") then
			return arg:GetPivot()
		end

		if arg:IsA("BasePart") then
			return arg.CFrame
		end
	end

	return nil
end

tbl6.GetDistance = function(arg, arg2, arg3)
	if not arg then
		return
	end
	local position = typeof(arg) == "CFrame" and arg.Position or arg

	if arg2 then
		arg2 = typeof(arg2) == "CFrame" and arg2.Position or arg2
	end

	arg2 = arg2 or localPlayer.Character.HumanoidRootPart.Position
	return (Vector3.new(position.X, arg3 and 0 or position.Y, position.Z) - Vector3.new(arg2.X, arg3 and 0 or arg2.Y, arg2.Z)).Magnitude
end

tbl6.GetArenaName = function(arg)
	local huge = math.huge
	local str5 = ""

	for _, child in pairs(workspace._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do
		if child and child:FindFirstChild("Part") then
			local v4 = tbl6.GetDistance(child.Part.Position, arg.Position)

			if v4 <= huge then
				str5 = child.Name
				huge = v4
			end
		end
	end

	return str5
end

tbl6.GetPortal = function(arg)
	if attribute == "Sea3" and flag ~= true then
		return false, nil
	end
	local huge = math.huge
	local v4 = nil

	for _, v5 in pairs(tbl6.Portals[attribute]) do
		if v5 and (v5 - arg.Position).Magnitude <= huge then
			huge = (v5 - arg.Position).Magnitude
			v4 = v5
		end
	end

	if v4 and (v4 - arg.Position).Magnitude + 250 <= tbl6.GetDistance(arg) then
		return true, v4
	end
	return false, nil
end

tbl6.AddBodyVelocity = function(arg)
	local v4, v5 = fn24()
	if not v4 then
		return false
	end
	local head = v4:FindFirstChild("Head") or v5
	if not head then
		return false
	end

	if arg then
		if not head:FindFirstChild("BodyVelocity") then
			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Name = "BodyVelocity"
			bodyVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
			bodyVelocity.Velocity = Vector3.zero
			bodyVelocity.P = 1500
			bodyVelocity.Parent = head
		end
	else
		local bodyVelocity = head:FindFirstChild("BodyVelocity")

		if bodyVelocity and bodyVelocity:IsA("BodyVelocity") then
			bodyVelocity:Destroy()
		end

		for i = #tbl6.NoClipParts, 1, -1 do
			local v6 = tbl6.NoClipParts[i]

			if v6 and v6.Parent then
				v6.CanCollide = true
			end

			table.remove(tbl6.NoClipParts, i)
		end
	end

	return true
end

tbl6.UseNoClip = function()
	local v4 = fn24()
	if not v4 then
		return false
	end

	for _, descendant in pairs(v4:GetDescendants()) do
		if descendant:IsA("BasePart") and descendant.CanCollide then
			descendant.CanCollide = false
			table.insert(tbl6.NoClipParts, descendant)
		end
	end

	return true
end

tbl6.StopTween = function()
	if tbl6.Tween then
		tbl6.Tween:Cancel()
		tbl6.Tween = nil
	end

	tbl6.AddBodyVelocity(false)
end

tbl6.Tweento = function(arg, arg2)
	local v4, v5, v6 = fn24()
	if not v4 or not v5 or not v6 or v6.Health <= 0 then
		return false, "Character is not loaded"
	end
	local v7 = fn25(arg)
	if not v7 then
		return false, "Invalid target"
	end

	if arg2 == nil or arg2 == true then
		tbl6.AddBodyVelocity(true)
		tbl6.UseNoClip()
	end

	if tbl6.GetDistance(v7.Position, nil, true) <= 25 then
		tbl6.StopTween()
		v5.CFrame = v7
		return true, "Arrived"
	end

	local position = v7.Position
	local v8, v9 = tbl6.GetPortal(arg)

	if v8 and v9 then
		if tbl6.GetDistance(v9, nil, true) <= 20 then
			tbl6.StopTween()
			commF:InvokeServer("requestEntrance", v9)
			wait(0.2)
			return false, "Entering Portal"
		end

		position = v9
	end

	if tbl6.Tween and tbl6.MoveTarget == position and not tbl6.Tween.Cancelled then
		return false, "Tweening"
	end

	if tbl6.Tween then
		tbl6.Tween:Cancel()
	end

	local v10 = v5

	local tween = {
		Cancelled = false,
		Cancel = function(arg3)
			arg3.Cancelled = true
		end,
	}

	tbl6.Tween = tween
	tbl6.MoveTarget = position

	task.spawn(function()
		local position2 = v10.Position
		local magnitude = (position2 - position).Magnitude

		while true do
			if not tween.Cancelled and v5 == v10 and v10.Parent then
				local result = runService.Heartbeat:Wait()

				if not (not v6 or v6.Health <= 0) then
					local position3 = v10.Position
					local magnitude2 = (position3 - position).Magnitude

					if magnitude2 < 8 then
						local rotation = v10.CFrame.Rotation
						v10.CFrame = CFrame.new(position) * rotation
						break
					else
						local n4 = tick() < (tbl6.SlowUntil or 0) and 150 or tonumber(tbl["Tween Speed"]) or 250

						if (position3 - position2).Magnitude > math.max(12, n4 * math.max(result, 0.0041666666666666666) * 4) and magnitude2 > magnitude + 6 then
							tbl6.SlowUntil = tick() + 7
							n4 = 150
						end

						position2 = position3 + (position - position3).Unit * math.min(magnitude2, n4 * math.min(result, 0.1))
						local rotation = v10.CFrame.Rotation
						v10.CFrame = CFrame.new(position2) * rotation
						v10.AssemblyLinearVelocity = Vector3.zero
						magnitude = (position2 - position).Magnitude
						continue
					end
				end
			end

			break
		end

		if tbl6.Tween == tween then
			tbl6.Tween = nil
		end
	end)

	return true, "Tweening"
end

tbl9.IsAlive = function(arg)
	return arg and arg.Parent and arg:FindFirstChild("Humanoid") and not arg:FindFirstChild("VehicleSeat") and arg.Humanoid.Health > 0.5 and arg:FindFirstChild("HumanoidRootPart")
end

tbl9.GetBoss = function(arg)
	local tbl15 = typeof(arg) == "string" and { arg } or arg
	local v4 = nil

	for _, child in pairs(replicatedStorage:GetChildren()) do
		if child and tbl9.IsAlive(child) and table.find(tbl15, child.Name) then
			v4 = child
			break
		else
			v4 = nil
		end
	end

	for _, child in pairs(enemies:GetChildren()) do
		if child and tbl9.IsAlive(child) and table.find(tbl15, child.Name) then
			v4 = child
			break
		end
	end

	return v4
end

tbl9.TurnBuso = function()
	if not localPlayer.Character:FindFirstChild("HasBuso") then
		commF:InvokeServer("Buso")
		return
	end
end

tbl9.EquipTool = function(arg)
	local v4 = localPlayer.Backpack:FindFirstChild(arg)
	if v4 and localPlayer.Character:FindFirstChild("Humanoid") then
		localPlayer.Character.Humanoid:EquipTool(v4)
		return
	end
end

tbl9.EquipWeapon = function(arg)
	local selectTool = arg or tbl["Select Tool"] or "Melee"

	for _, child in pairs(localPlayer.Backpack:GetChildren()) do
		if child and child:IsA("Tool") and child.ToolTip == selectTool then
			tbl9.EquipTool(child.Name)
			break
		end
	end
end

tbl9.GetMobInCFrame = function(arg)
	local v4 = next
	local children, v5 = enemies:GetChildren()
	local v6 = nil

	for _, v7 in v4, children, v5 do
		local isModel = v7:IsA("Model") and tbl9.IsAlive(v7)

		if isModel then
			isModel = (v7.HumanoidRootPart.Position - arg.Position).Magnitude <= (Range or 1000)
		end

		if isModel then
			v6 = v7
		end
	end

	local v7 = next
	local children2, v8 = replicatedStorage:GetChildren()

	for _, v9 in v7, children2, v8 do
		local isModel = v9:IsA("Model") and tbl9.IsAlive(v9)

		if isModel then
			isModel = (v9.HumanoidRootPart.Position - arg.Position).Magnitude <= (Range or 1000)
		end

		if isModel then
			v6 = v9
		end
	end

	return v6
end

tbl9.GetNearMob = function()
	local tbl15 = {}

	for _, child in pairs(enemies:GetChildren()) do
		if child and tbl9.IsAlive(child) and (child.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 80 then
			tbl15[#tbl15 + 1] = child
		end
	end

	return tbl15
end

tbl9.Kill = function(arg, arg2)
	if arg and tbl9.IsAlive(arg) then
		while tbl[arg2] and arg and tbl9.IsAlive(arg) do
			task.wait()
			tbl9.TurnBuso()
			tbl9.EquipWeapon()
			tbl6.Tweento(arg.HumanoidRootPart.CFrame * CFrame.new(0, 30, 5))
		end
	end
end

local function fn26()
	local trackedQuestFrame = localPlayer.PlayerGui:FindFirstChild("TrackedQuestFrame")
	local frame = trackedQuestFrame and trackedQuestFrame:FindFirstChild("Frame")
	if not frame or trackedQuestFrame:IsA("ScreenGui") and not trackedQuestFrame.Enabled or not frame.Visible then
		return nil
	end
	return frame
end

GetTextTrackedQuest = function()
	local v4 = fn26()
	if not v4 then
		return ""
	end
	local tbl15 = {}

	for _, descendant in pairs(v4:GetDescendants()) do
		if descendant:IsA("TextLabel") and descendant.Visible and descendant.Text ~= "" then
			local n4 = #tbl15 + 1
			local lower = string.lower
			local v5 = string.gsub(descendant.Text, "-", "")
			tbl15[n4] = lower(v5)
		end
	end

	return table.concat(tbl15, "\n")
end

tbl9.CheckQuest = function(arg)
	local v4 = GetTextTrackedQuest()
	local lower = string.lower
	local v5 = string.gsub(arg, "-", "")
	local v6 = lower(v5)
	return v4 ~= "" and string.find(v4, v6, 1, true) ~= nil
end

local function fn27()
	local v4 = tbl9.GetNearMob()
	local tool = localPlayer.Character:FindFirstChildOfClass("Tool")
	local flag3 = #v4 > 0 and tool
	local flag4

	if flag3 then
		flag4 = tool.ToolTip == "Sword" or tool.ToolTip == "Melee"
	else
		flag4 = flag3
	end

	if flag4 then
		local tbl15 = {}

		for _, v5 in pairs(v4) do
			if v5 and tbl9.IsAlive(v5) then
				table.insert(tbl15, { v5, v5.HumanoidRootPart })
			end
		end

		if #tbl15 > 0 then
			local v5 = tbl15[1][2]
			reRegisterAttack:FireServer(0)

			if combatRemoteThread and genv.HitFunc then
				genv.HitFunc(v5, tbl15)
			else
				reRegisterHit:FireServer(v5, tbl15)
			end
		end
	elseif #v4 > 0 and tool and tool.ToolTip == "Blox Fruit" then
		local leftClickRemote = tool:FindFirstChild("LeftClickRemote")

		if leftClickRemote and leftClickRemote:IsA("RemoteEvent") then
			leftClickRemote:FireServer(Vector3.new(0, -500, 0), 3, true)
			task.wait(0.01)
			leftClickRemote:FireServer(false)
		end
	end
end

tbl10.CreateWindow = function()
	local ok, result = pcall(function()
		return v:CreateWindow({
			Title = "Night Hub Hop Boss " .. (tbl8.IsPremiumUser and "<font color='rgb(255,255,0)'>[PREMIUM]</font>" or "[FREEMIUM]"),
			SubTitle = "by @_luongminhnghia",
			TabWidth = 145,
			Size = userInputService.TouchEnabled and UDim2.fromOffset(450, 400) or UDim2.fromOffset(550, 450),
			Acrylic = false,
			Image = "rbxassetid://118583787829543",
			MinimizeKey = Enum.KeyCode.RightControl,
			Theme = tbl["Select Theme"],
		})
	end)

	local function fn28(arg, arg2)
		local flag3 = nil
		local v4 = nil
		local position = nil
		local position2 = nil

		local function fn29(arg3)
			local n4 = arg3.Position - position
			local udim2 = UDim2.new(position2.X.Scale, position2.X.Offset + n4.X, position2.Y.Scale, position2.Y.Offset + n4.Y)
			tweenService:Create(arg2, TweenInfo.new(0.2), { Position = udim2 }):Play()
		end

		arg.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				flag3 = true
				position = input.Position
				position2 = arg2.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						flag3 = false
					end
				end)
			end
		end)

		arg.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				v4 = input
			end
		end)

		userInputService.InputChanged:Connect(function(input)
			if input == v4 and flag3 then
				fn29(input)
			end
		end)
	end

	if not ok then
		return false, "Failed to create window, BUGS: " .. tostring(result)
	end
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
	imageButton.Image = "rbxassetid://101533193988556"
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
		local tween = tweenService:Create(imageButton, TweenInfo.new(0.85, Enum.EasingStyle.Quad), { Rotation = 360, Size = UDim2.new(0, 55, 0, 45) })
		tween:Play()

		tween.Completed:Connect(function()
			imageButton.Rotation = 0
		end)

		virtualInputManager:SendKeyEvent(true, "RightControl", false, game)
		virtualInputManager:SendKeyEvent(false, "RightControl", false, game)
	end)

	fn28(frame, imageButton)
	print("[UI]", "Create Window")
	return true, result
end

tbl10.CreateTabs = function(arg)
	tbl10.Tabs = {}
	tbl10.Features = {}
	tbl10.TotalTabs = 0

	for _, v4 in pairs({
		{ "Server", "server" },
		{ "Hop Auto", "home" },
		{ "Farm", "layers" },
		{ "Webhook", "rbxassetid://136418130625199" },
		{ "Settings", "settings" },
	}) do
		tbl10.TotalTabs = tbl10.TotalTabs + 1
		tbl10.Tabs[v4[1]] = arg:AddTab({ Title = v4[1], Icon = v4[2] })
		tbl10.Features[v4[1]] = {}
	end

	print("[UI]", "Created Total", tostring(tbl10.TotalTabs), "Tabs!")
end

tbl10.BuildUI = function(arg, arg2, arg3)
	if not arg then
		return false, "Missing Tab"
	end

	if not arg2 then
		return false, "Missing Type of Feature"
	end

	if not arg3 then
		return false, "Missing the feauture configs"
	end

	if arg2 == "Button" then
		tbl10.Features[arg3.Title] = arg:AddButton(arg3)
	elseif arg2 == "Textbox" then
		arg3.Numberic = arg3.Numberic or false
		arg3.Default = arg3.Default or tbl[arg3.Title] or ""

		arg3.Callback = arg3.Callback or function()
		end

		tbl10.Features[arg3.Title] = arg:AddInput("IDK", arg3)
	elseif arg2 == "Paragraph" then
		tbl10.Features[arg3.Title] = arg:AddParagraph(arg3)
	elseif arg2 == "Toggle" then
		arg3.Default = arg3.Default or tbl[arg3.Title] or false

		arg3.Callback = arg3.Callback or function(arg4)
			tbl[arg3.Title] = arg4
		end

		tbl10.Features[arg3.Title] = arg:AddToggle("Toggle", arg3)
	elseif arg2 == "Dropdown" then
		arg3.Multi = arg3.Multi or false
		arg3.Default = arg3.Default or tbl[arg3.Title] or arg3.Multi and {} or ""

		arg3.Callback = arg3.Callback or function(arg4)
			tbl[arg3.Title] = arg4
		end

		tbl10.Features[arg3.Title] = arg:AddDropdown("Dropdown", arg3)
	elseif arg2 == "Slider" then
		arg3.Rounding = arg3.Rounding or 1
		arg3.Default = arg3.Default or tbl[arg3.Title] or arg3.Min

		arg3.Callback = arg3.Callback or function(arg4)
			tbl[arg3.Title] = arg4
		end

		tbl10.Features[arg3.Title] = arg:AddSlider("Slider", arg3)
	elseif arg2 == "Seperator" then
		arg:AddSection(arg3.Title)
	end

	return true, nil
end

local v4 = tbl7.FuncManager()

tbl10.StartingUI = function()
	local v5, v6 = tbl10.CreateWindow()
	if not v5 then
		warn("Library", "Cannot Create Window!, BUGS:", v6)
		return
	end
	tbl10.CreateTabs(v6)
	v6:SelectTab(1)

	for k, v7 in pairs({
		Server = {
			{ "Paragraph", { Title = "Boss Spawns In Server", Content = "Checking..." } },
			{ "Paragraph", { Title = "Status Script", Content = "No action" } },
			{ "Paragraph", { Title = "Server Data", Content = "Click button show server data to see" } },
			{ "Seperator", { Title = "Teleport" } },
			{
				"Textbox",
				{
					Title = "Enter Night Hub JobId",
					Desc = "enter night hub job id, you can get it in my discord server.",
					PlaceHolder = "Enter Job Id",
					Callback = function(arg)
						local v7, v8 = tbl12.decode(arg, v2)

						if v7 and v8 then
							v4.JoinServer(v8)
						else
							print(v8)
						end
					end,
				},
			},
			{
				"Textbox",
				{
					Title = "Enter Job Id",
					Desc = "enter any server job id",
					PlaceHolder = "Enter Job Id",
					Callback = function(arg)
						v4.JoinServer(tostring(arg))
					end,
				},
			},
			{
				"Button",
				{
					Title = "Show Server Data",
					Callback = function()
						v:Notify({ Title = "Show Server Data", Content = "Update Successful!", Duration = 6 })
						tbl10.Features["Server Data"]:SetDesc("JobId: " .. tostring(game.JobId) .. "\nPlayers: " .. tostring(#players:GetPlayers()) .. "\nPlaceId: " .. tostring(game.PlaceId))
					end,
				},
			},
			{
				"Button",
				{
					Title = "Rejoin Server",
					Callback = function()
						v4.JoinServer(game.JobId)
					end,
				},
			},
		},
		["Hop Auto"] = {
			{
				"Button",
				{
					Title = "Open Old Hop Script",
					Description = "If you don't like this version hop boss, click it to open old Hop Script V1.5",
					Callback = function()
						tbl3.SafeLoadstring("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/HopScriptOld.luau")
					end,
				},
			},
			{
				"Dropdown",
				{
					Title = "Teleport World",
					Desc = "Click any option to teleport, ex: Sea1, Sea2, ...",
					Values = { "Sea 1", "Sea 2", "Sea 3" },
					Callback = function(arg)
						v:Notify({ Title = "Start Teleporting...", Content = "Processing...", Duration = 10 })

						if arg == "Sea 1" then
							commF:InvokeServer("TravelMain")
						elseif arg == "Sea 2" then
							commF:InvokeServer("TravelDressrosa")
						elseif arg == "Sea 3" then
							commF:InvokeServer("TravelZou")
						end
					end,
				},
			},
			{ "Seperator", { Title = "Configuration" } },
			{
				"Dropdown",
				{
					Title = "Select Tool",
					Desc = "select tool to attack boss",
					Values = { "Melee", "Sword", "Blox Fruit" },
				},
			},
			{ "Toggle", { Title = "Auto Buso" } },
			{ "Seperator", { Title = "Farm" } },
			{
				"Dropdown",
				{
					Title = "Select Boss",
					Desc = "no desc",
					Values = {
						"Soul Reaper",
						"Cake Prince",
						"Elite",
						"Rip Indra",
						"Dough King",
						"Tyrant Of The Skies",
						"Darkbeard",
						"Cursed Captain",
						"Cake Queen",
					},
				},
			},
			{
				"Button",
				{
					Title = "Check Boss In API",
					Callback = function()
						local v7, v8 = v4.GetCountByApi(tbl["Select Boss"])
						v:Notify({ Title = "Check Boss In API", Content = tostring(v8), Duration = 8 })
					end,
				},
			},
			{ "Toggle", { Title = "Start Farm Boss" } },
			{ "Toggle", { Title = "Auto Hop Find Boss" } },
			{ "Seperator", { Title = "Others" } },
			{ "Toggle", { Title = "Auto Hop Fullmoon" } },
			{ "Toggle", { Title = "Auto Hop Castle Raid" } },
			{ "Toggle", { Title = "Auto Hop Legendary Sword", Desc = "Auto buy in Farm Tab" } },
			{ "Toggle", { Title = "Auto Hop Berry" } },
			{ "Toggle", { Title = "Auto Hop Near Moon" } },
			{ "Toggle", { Title = "Auto Hop Mirage Island" } },
			{ "Toggle", { Title = "Auto Hop Prehistoric Island" } },
			{ "Toggle", { Title = "Auto Hop Kitsune Island" } },
			{ "Toggle", { Title = "Auto Hop Find Fruits" } },
			{ "Seperator", { Title = "Hop Click" } },
			{
				"Button",
				{
					Title = "Hop Sword Legendary",
					Callback = function()
						v4.StartHop("SwordLegendary")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Fullmoon",
					Callback = function()
						v4.StartHop("Fullmoon")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Castle Raid",
					Callback = function()
						v4.StartHop("CastleRaid")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Near Moon",
					Callback = function()
						v4.StartHop("NearMoon")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Berry",
					Callback = function()
						v4.StartHop("Berry")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Mirage Island",
					Callback = function()
						v4.StartHop("Mirage")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Prehistoric Island",
					Callback = function()
						v4.StartHop("PrehistoricIsland")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Kitsune Island",
					Callback = function()
						v4.StartHop("KitsuneIsland")
					end,
				},
			},
			{
				"Button",
				{
					Title = "Hop Fruits",
					Callback = function()
						v4.StartHop("Fruits")
					end,
				},
			},
		},
		Farm = {
			{
				"Paragraph",
				{
					Title = "Trick",
					Content = "You find Auto Hop Boss or Auto Farm Boss?\nAuto Hop and Auto Farm Boss in Hop Auto Tab",
				},
			},
			{ "Toggle", { Title = "Teleport to Fruits" } },
			{ "Toggle", { Title = "Teleport to Berry" } },
			{
				"Toggle",
				{
					Title = "Auto Buy Legendary Sword",
					Desc = "make sure you have more than 2,000,000$ beli",
				},
			},
			{ "Toggle", { Title = "Auto Castle Raid", Desc = "Auto hop castle raid in Hop Auto Tab" } },
			{ "Seperator", { Title = "Items" } },
			{ "Toggle", { Title = "Auto Yama" } },
			{ "Toggle", { Title = "Auto Tushita" } },
			{ "Toggle", { Title = "Auto True Triple Katana" } },
			{ "Seperator", { Title = "Race" } },
			{ "Toggle", { Title = "Auto Ghoul" } },
		},
		Webhook = {
			{
				"Textbox",
				{
					Title = "Enter Webhook Url",
					Desc = "Put your discord webhook url here!",
					PlaceHolder = "Put webhook here!",
					Callback = function(arg)
						tbl["Enter Webhook Url"] = arg
					end,
				},
			},
			{ "Toggle", { Title = "Send Webhook Killed Boss" } },
			{ "Toggle", { Title = "@everyone" } },
			{
				"Button",
				{
					Title = "Send Test",
					Callback = function()
						local v7, v8 = v4.SendWebhook(tbl["Enter Webhook Url"], { content = "@everyone Hello, This is test message in Hop Boss V2" })
						v:Notify({ Title = "Webhook Test", Content = tostring(v8), Duration = 5 })
					end,
				},
			},
		},
		Settings = {
			{ "Toggle", { Title = "Enable Fast Attack" } },
			{ "Slider", { Title = "Tween Speed", Max = 300, Min = 180 } },
			{
				"Dropdown",
				{
					Title = "Select Theme",
					Values = { "Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose" },
					Callback = function(arg)
						v:SetTheme(arg)
						tbl["Select Theme"] = arg
					end,
				},
			},
		},
	}) do
		local v8 = tbl10.Tabs[k]

		if v8 then
			for _, v9 in pairs(v7) do
				tbl10.BuildUI(v8, v9[1], v9[2])
			end
		end
	end

	print("[UI]", "Started UI!")
end

tbl3.LoadFuncs = function()
	tbl3.Funcs = {
		["Auto Buso"] = function()
			if not localPlayer.Character:FindFirstChild("HasBuso") then
				commF:InvokeServer("Buso")
				wait(1)
			end
		end,
		["Enable Fast Attack"] = fn27,
		["Start Farm Boss"] = function()
			if tbl["Select Boss"] == nil or tbl["Select Boss"] == "" then
				return
			end
			local tbl15 = tbl["Select Boss"] == "Rip Indra" and { "rip_indra", "rip_indra True Form" }
			local tbl16

			if tbl15 then
				tbl16 = tbl15
			else
				tbl16 = tbl["Select Boss"] == "Elite" and { "Urban", "Deandre", "Diablo" }
			end

			local v5 = tbl9.GetBoss(tbl16 or tbl["Select Boss"] == "Tyrant Of The Skies" and "Tyrant of the Skies" or tbl["Select Boss"])

			if v5 then
				str2 = v5.Name

				if tbl["Select Boss"] == "Elite" and not tbl9.CheckQuest(v5.Name) then
					commF:InvokeServer("EliteHunter")
				elseif (tbl["Select Boss"] == "Cake Prince" or tbl["Select Boss"] == "Dough King") and tbl6.GetDistance(v5.HumanoidRootPart.Position) >= 1500 then
					local cakeLoaf = workspace.Map:FindFirstChild("CakeLoaf")
					local bigMirror = cakeLoaf and cakeLoaf:FindFirstChild("BigMirror")
					local main = bigMirror and bigMirror:FindFirstChild("Main")

					if cakeLoaf and bigMirror and main and main:FindFirstChild("TouchInterest") then
						firetouchinterest(main, localPlayer.Character.HumanoidRootPart, 0)
						firetouchinterest(main, localPlayer.Character.HumanoidRootPart, 1)
						wait(0.1)
					else
						tbl6.Tweento(CFrame.new(-2124, 69, -12401))
					end
				else
					tbl9.Kill(v5, "Start Farm Boss")
				end
			else
				local earned = v4.CheckNotify("earned")
				local fragments = v4.CheckNotify("fragments")

				if (earned or fragments) and str2 ~= "" and tbl["Send Webhook Killed Boss"] and not tbl5[earned] then
					tbl5[earned] = true
					local sendWebhook = v4.SendWebhook
					local enterWebhookUrl = tbl["Enter Webhook Url"]
					local tbl17 = { content = (tbl["@everyone"] and "@everyone " or "") .. "Killed " .. tostring(str2) }
					local embeds = {}
					local tbl18 = { author = { name = "Night Hub Hop Boss V2" } }
					local fields = {}
					local tbl19 = { name = "Boss Name", value = "```" .. tostring(str2) .. "```" }
					local tbl20 = { name = "Account Name", value = "```" .. tostring(localPlayer.Name) .. "```" }
					local tbl21 = { name = "Sea", value = "```" .. tostring(attribute) .. "```" }
					local tbl22 = { name = "JobId", value = "||" .. tostring(game.JobId) .. "||" }
					fields[1] = tbl19
					fields[2] = tbl20
					fields[3] = tbl21
					fields[4] = tbl22
					tbl18.fields = fields

					tbl18.thumbnail = {
						url = "https://cdn.discordapp.com/attachments/1481159425652822117/1492901169696215111/Sparxie_Laugh.gif?ex=69e63e8f&is=69e4ed0f&hm=8713614b8ddc0704b2b23baf87fc4ebe7ae3a4089aa5546dde443010f44c609e&",
					}

					embeds[1] = tbl18
					tbl17.embeds = embeds
					local v6, v7 = sendWebhook(enterWebhookUrl, tbl17)
					print(v6, v7)
					wait(0.2)
				end

				if tbl["Auto Hop Find Boss"] then
					wait(2)
					v4.StartHop(tbl["Select Boss"])
				end
			end
		end,
		["Auto Hop Fullmoon"] = function()
			if attribute == "Sea3" then
				if v4.IsFullmoon() then
					v:Notify({
						Title = "Auto Hop Fullmoon",
						Content = "Current Server is Fullmoon, Please turn off auto hop fullmoon!!",
						Duration = 5,
					})

					wait(6)
				else
					v4.StartHop("Fullmoon")
					wait(2)
				end
			end
		end,
		["Auto Hop Berry"] = function()
			if not v4.FoundBerries() then
				v4.StartHop("Berry")
				wait(2)
			else
				v:Notify({
					Title = "Auto Hop Berry",
					Content = "Current Server have Berry, Please turn off auto hop berry!!",
					Duration = 5,
				})

				wait(6)
			end
		end,
		["Auto Hop Near Moon"] = function()
			if attribute == "Sea3" and game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				v:Notify({
					Title = "Auto Hop Near Moon",
					Content = "Current Moon in Server is Near Moon, Please turn off auto hop near moon!!",
					Duration = 5,
				})

				wait(6)
			elseif attribute == "Sea3" then
				v4.StartHop("NearMoon")
				wait(2)
			end
		end,
		["Auto Hop Mirage Island"] = function()
			if attribute == "Sea3" and workspace.Map:FindFirstChild("MysticIsland") then
				v:Notify({
					Title = "Auto Hop Mirage Island",
					Content = "Current Server Found Mirage Island, Please turn off auto hop mirage island!!",
					Duration = 5,
				})

				wait(6)
			elseif attribute == "Sea3" then
				v4.StartHop("Mirage")
				wait(2)
			end
		end,
		["Auto Hop Prehistoric Island"] = function()
			if attribute == "Sea3" and workspace.Map:FindFirstChild("PrehistoricIsland") then
				v:Notify({
					Title = "Auto Hop Prehistoric Island",
					Content = "Current Server Found Prehistoric Island, Please turn off auto hop Prehistoric Island!!",
					Duration = 5,
				})

				wait(6)
			elseif attribute == "Sea3" then
				v4.StartHop("PrehistoricIsland")
				wait(2)
			end
		end,
		["Auto Hop Kitsune Island"] = function()
			if attribute == "Sea3" and workspace.Map:FindFirstChild("KitsuneIsland") then
				v:Notify({
					Title = "Auto Hop Kitsune Island",
					Content = "Current Server Found Kitsune Island, Please turn off auto hop Kitsune Island!!",
					Duration = 5,
				})

				wait(6)
			elseif attribute == "Sea3" then
				v4.StartHop("KitsuneIsland")
				wait(2)
			end
		end,
		["Auto Hop Find Fruits"] = function()
			if v4.CheckFruit() then
				if not tbl["Teleport to Fruits"] then
					v:Notify({
						Title = "Auto Hop Find Fruits",
						Content = "Current Server Found Fruit Spawn, Please turn on auto Teleport to Fruits!!",
						Duration = 5,
					})

					wait(6)
				end
			else
				wait(2)
				v4.StartHop("Fruits")
			end
		end,
		["Teleport to Fruits"] = function()
			v4.StoreBF()

			if v4.CheckFruit() then
				local v5 = v4.CheckFruit()

				if v5.Name == "Fruit " then
					tbl6.Tweento(v5.Handle.CFrame, true)
				else
					firetouchinterest(v5.Handle, localPlayer.Character.PrimaryPart, 0)
					firetouchinterest(v5.Handle, localPlayer.Character.PrimaryPart, 1)
				end
			end
		end,
		["Teleport to Berry"] = function()
			local v5 = v4.FoundBerries()

			if v5 then
				local model = v5:FindFirstChildOfClass("Model")

				if model then
					local position = localPlayer.Character.HumanoidRootPart.Position

					if (model:GetPivot().Position - position).Magnitude <= 15 then
						fireproximityprompt(model.ProximityPrompt)
					end

					tbl6.Tweento(model:GetPivot(), true)
				else
					tbl6.Tweento(v5.Parent:GetPivot(), true)
				end
			end
		end,
		["Auto Buy Legendary Sword"] = function()
			if commF:InvokeServer("LegendarySwordDealer", "1") then
				local response = commF:InvokeServer("LegendarySwordDealer", "2")

				if response == 0 then
					v:Notify({
						Title = "Buy Legendary Sword",
						Content = "Bro it's fucking poor 😭🙏🙏, you don't enough money!",
						Duration = 7,
					})

					wait(8)
				elseif response == 2 then
					v:Notify({ Title = "Buy Legendary Sword", Content = "You already have this sword", Duration = 7 })
					wait(8)
				else
					v:Notify({
						Title = "Buy Legendary Sword",
						Content = "Buyed " .. tostring(commF:InvokeServer("LegendarySwordDealer", "1")),
						Duration = 7,
					})
				end
			end
		end,
		["Auto Hop Legendary Sword"] = function()
			if not commF:InvokeServer("LegendarySwordDealer", "1") and attribute == "Sea2" then
				wait(2)
				v4.StartHop("SwordLegendary")
			end
		end,
		["Auto Castle Raid"] = function()
			if attribute == "Sea3" then
				local flag3 = not raidcastletime

				if not flag3 then
					local v5 = raidcastletime
					flag3 = tick() - v5 >= 35
				end

				if flag3 then
					raidcastletime = tick()
				end

				local flag4 = not v4.CheckRaidCastle()

				if flag4 then
					local v5 = raidcastletime
					flag4 = tick() - v5 >= 30
				end

				if flag4 and not flag2 then
					wait(2)
					v4.StartHop("CastleRaid")
				else
					local v5 = tbl9.GetMobInCFrame(cframe)

					if v5 then
						flag2 = true
						tbl9.Kill(v5, "Auto Castle Raid")
					end

					if v4.CheckNotify("fragment") or v4.CheckNotify("good job!") or v4.CheckNotify("100f") then
						flag2 = false
					end
				end
			end
		end,
		["Auto Yama"] = function()
			if attribute == "Sea3" then
				if commF:InvokeServer("EliteHunter", "Progress") >= 30 then
					if not workspace.Map:FindFirstChild("Waterfall") or not workspace.Map.Waterfall:FindFirstChild("SealedKatana") then
						tbl6.Tweento(CFrame.new(5250.71924, 19.842907, 453.177002))
					elseif tbl6.GetDistance(workspace.Map.Waterfall.SealedKatana.Hitbox.Position) <= 15 then
						fireclickdetector(workspace.Map.Waterfall.SealedKatana.Hitbox.ClickDetector)
					else
						tbl6.Tweento(workspace.Map.Waterfall.SealedKatana.Hitbox.CFrame)
					end
				else
					local v5 = tbl9.GetBoss({ "Urban", "Deandre", "Diablo" })

					if v5 then
						tbl9.Kill(v5, "Auto Yama")
					else
						wait(1)
						v4.StartHop("Elite")
					end
				end
			end
		end,
		["Auto Tushita"] = function()
			if attribute == "Sea3" then
				if v4.CheckInventory("Tushita") or localPlayer.Data.Level.Value < 2000 then
					return
				end

				if not commF:InvokeServer("TushitaProgress").OpenedDoor then
					if tbl9.GetBoss({ "rip_indra", "rip_indra True Form" }) then
						if not fn3("Holy Torch") then
							tbl6.Tweento(CFrame.new(5717.06592, 18.8161335, 252.124573, 0.926925123, -3.25000045e-08, -0.375246346, 3.45466091e-08, 1, -1.2735254e-09, 0.375246346, -1.17830261e-08, 0.926925123))
						else
							EquipTool("Holy Torch")

							for i = 1, 5 do
								commF:InvokeServer("TushitaProgress", "Torch", i)
							end
						end
					else
						wait(2)
						v4.StartHop("RipIndra")
					end
				else
					local Longma = tbl9.GetBoss("Longma")

					if Longma then
						tbl9.Kill(Longma, "Auto Tushita")
					else
						v4.HopServers()
					end
				end
			end
		end,
		["Auto Ghoul"] = function()
			if attribute == "Sea2" then
				if localPlayer and localPlayer.Data.Race.Value == "Ghoul" then
					v:Notify({
						Title = "Kaitun Ghoul",
						Content = "Your Race Already is Ghoul, Stop Script...",
						Duration = 5,
					})

					wait(6)
					return
				end

				if fn3("Hellfire Torch") then
					if v4.GetMaterial("Ectoplasm") < 100 then
						local v5 = tbl9.GetBoss({ "Ship Deckhand", "Ship Engineer", "Ship Steward" })

						if v5 then
							tbl9.Kill(v5, "Auto Ghoul")
						else
							tbl6.Tweento(CFrame.new(919, 200, 33456))
						end
					else
						tbl9.EquipTool("Hellfire Torch")

						if (Vector3.new(919, 125, 33456) - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
							replicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "BuyCheck", 4)
							replicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
						else
							tbl6.Tweento(CFrame.new(919, 125, 33456))
						end
					end
				else
					local v5 = tbl9.GetBoss("Cursed Captain")

					if v5 then
						tbl9.Kill(v5, "Auto Ghoul")
					else
						wait(1.5)

						if fn3("Hellfire Torch") then
							wait()
						else
							tbl6.Tweento(CFrame.new(919, 9999, 33456))
							v4.StartHop("CursedCaptain")
							wait(2)
						end
					end
				end
			end
		end,
		["Auto True Triple Katana"] = function()
			v:Notify({ Title = "Error!", Content = "This feature is not update!", Duration = 6 })
			tbl10.Features["Auto True Triple Katana"]:SetValue(false)
			wait(0.1)
		end,
	}
end

tbl3.StartFuncs = function()
	tbl3.Thread = {}

	local function fn28(arg, arg2)
		if tbl[arg] and not tbl3.Thread[arg] then
			tbl3.Thread[arg] = true

			spawn(function()
				while tbl[arg] and wait() do
					local ok, result = pcall(arg2)

					if not ok then
						print(arg, result)
					end
				end

				tbl6.StopTween()
				tbl3.Thread[arg] = nil
			end)
		end
	end

	spawn(function()
		while wait() do
			if attribute == "Sea3" and v4.CheckInventory("Valkyrie Helm") then
				flag = true
			end
		end
	end)

	spawn(function()
		while wait() do
			for k, func in pairs(tbl3.Funcs) do
				fn28(k, func)
			end
		end
	end)
end

fn = function()
	if nightHubAuthRewrite.Started then
		return
	end
	nightHubAuthRewrite.Started = true
	tbl3.CheckAndJoinTeam()

	local ok, result = pcall(function()
		local chunk = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"), "=Fluent")
		assert(type(chunk) == "function", "Fluent compile failed")
		v = chunk()
		assert(type(v) == "table", "Fluent load failed")
		tbl11.InitSettings()
		tbl10.StartingUI()
		tbl3.LoadFuncs()
		tbl3.StartFuncs()
	end)

	if ok then
		return
	end
	nightHubAuthRewrite.Started = false
	warn("[Night Hub] " .. tostring(result))
end

if nightHubAuthRewrite.Valid or nightHubAuthRewrite.PendingStart then
	task.spawn(fn)
end
