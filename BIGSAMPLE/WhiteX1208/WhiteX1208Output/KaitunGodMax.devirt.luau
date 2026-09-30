-- Deobfuscated by ccjvwsod on Discord
-- Detected obfuscation: Luraph v15
-- Local names are inferred from use (the original names are not in the bytecode)

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local genv
genv = type(getgenv) == "function" and getgenv() or _G
local nightKaitun = genv.NightKaitun

if type(nightKaitun) == "table" and type(nightKaitun.Stop) == "function" then
	pcall(nightKaitun.Stop)
end

local fn = nil

fn = function(tableValue, arg)
	tableValue = type(tableValue) == "table" and tableValue or {}

	for k, v in pairs(arg) do
		if type(v) == "table" then
			tableValue[k] = fn(tableValue[k], v)
		elseif tableValue[k] == nil then
			tableValue[k] = v
		end
	end

	return tableValue
end

genv.KaitunConfig = fn(genv.KaitunConfig, {
	["Auto Join Team"] = { Enabled = true, Team = "Pirates" },
	Performance = {
		["White Screen"] = false,
		["Lock FPS"] = true,
		FPS = 60,
		["Fix Lag"] = true,
		["Hide Notifications"] = true,
		["Anti AFK"] = true,
	},
	Items = {
		Katana = true,
		Cutlass = true,
		["Dual Katana"] = true,
		["Iron Mace"] = true,
		["Triple Katana"] = true,
		Pipe = true,
		["Dual-Headed Blade"] = true,
		["Soul Cane"] = true,
		Bisento = true,
		Saber = true,
		Godhuman = true,
		["Skull Guitar"] = true,
		["Mirror Fractal"] = true,
		["Cursed Dual Katana"] = true,
		["Shark Anchor"] = true,
		Rengoku = true,
		["Dragon Trident"] = true,
		["Pole V1"] = true,
		["Gravity Blade"] = true,
	},
	Progress = { ["Race V2"] = true, ["Race V3"] = true, ["Pull Lever"] = true, ["Attack Rip Indra"] = true },
	["Server Hop"] = {
		["Avoid Nearby Players"] = false,
		["Nearby Range"] = 500,
		["Rip Indra"] = true,
		["Dough King"] = true,
		["Castle Raid"] = true,
		["Cake Queen"] = true,
		["Soul Reaper"] = true,
		Darkbeard = true,
		["Mirage Island"] = true,
	},
	Farm = {
		Fragments = false,
		["Fragment Goal"] = 50000,
		["Melee Mastery"] = false,
		["Sword Mastery"] = false,
		["Double Quest"] = true,
		["Triple Quest"] = false,
		["Redeem Codes"] = true,
		["Random Fruit"] = true,
	},
	["Auto Stats"] = { Enabled = true, Order = { "Melee", "Defense", "Sword" }, Cap = 2800 },
	Haki = { Enhancement = true, Skyjump = true, ["Flash Step"] = true, Observation = true },
	["Auto Chat"] = { Enabled = false, Message = "" },
})

genv.AutoExecute = genv.AutoExecute ~= false
local kaitunConfig
kaitunConfig = genv.KaitunConfig
kaitunConfig["Reset TP"] = nil
local Players
Players = game:GetService("Players")
local RunService
RunService = game:GetService("RunService")
local ReplicatedStorage
ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace
Workspace = game:GetService("Workspace")
local Lighting
Lighting = game:GetService("Lighting")
local TweenService
TweenService = game:GetService("TweenService")
local HttpService
HttpService = game:GetService("HttpService")
game:GetService("TeleportService")
local UserInputService
UserInputService = game:GetService("UserInputService")
local VirtualInputManager
VirtualInputManager = game:GetService("VirtualInputManager")
local VirtualUser
VirtualUser = game:GetService("VirtualUser")
local localPlayer
localPlayer = Players.LocalPlayer
local tbl

do
	local placeId = game.PlaceId

	local tbl2 = {
		[2753915549] = 1,
		[85211729168715] = 1,
		[4442272183] = 2,
		[79091703265657] = 2,
		[7449423635] = 3,
		[100117331123089] = 3,
	}

	if not tbl2[placeId] then
		error("Wrong game", 0)
	end

	local function fn2()
		local autoJoinTeam = kaitunConfig["Auto Join Team"]
		if not autoJoinTeam.Enabled or localPlayer.Team then
			return true
		end
		local team = autoJoinTeam.Team

		if team ~= "Pirates" and team ~= "Marines" then
			error("Invalid team", 0)
		end

		local commF = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

		repeat
			pcall(commF.InvokeServer, commF, "SetTeam", team)
			task.wait(0.5)
		until localPlayer.Team

		return true
	end

	fn2()

	tbl = {
		Farming = false,
		StartedAt = tick(),
		State = "Boot",
		Detail = "Initializing",
		StateAt = tick(),
		Stopped = false,
		Character = nil,
		Humanoid = nil,
		Root = nil,
		SpawnedAt = 0,
		Connections = {},
		Track = function(arg)
			tbl.Connections[#tbl.Connections + 1] = arg
			return arg
		end,
		Bind = function(character)
			tbl.Character = character
			tbl.Humanoid = character:WaitForChild("Humanoid")
			tbl.Root = character:WaitForChild("HumanoidRootPart")
			tbl.SpawnedAt = tick()
		end,
		SetState = function(state, detail)
			if tbl.State ~= state then
				tbl.State = state
				tbl.StateAt = tick()
				local printFunction = print
				local str = ("[NightKaitun] %*"):format(state)
				printFunction(str)
			end

			tbl.Detail = detail or ""
		end,
		Sea = function()
			return tbl2[placeId]
		end,
		Distance = function(arg)
			local root = tbl.Root
			if not root then
				return math.huge
			end
			local kind = typeof(arg)
			local position = kind == "CFrame" and arg.Position or kind == "Vector3" and arg

			if not position then
				position = kind == "Instance"

				if position then
					position = arg:IsA("Model") and arg:GetPivot().Position or arg.Position
				end
			end

			return position and (root.Position - position).Magnitude or math.huge
		end,
	}
end

tbl.Bind(localPlayer.Character or localPlayer.CharacterAdded:Wait())
tbl.Track(localPlayer.CharacterAdded:Connect(tbl.Bind))
local tbl2
tbl2 = {}

do
	local remotes = ReplicatedStorage:WaitForChild("Remotes")
	local commF = remotes:WaitForChild("CommF_")
	local net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
	tbl2.CommF = commF
	tbl2.CommE = remotes:WaitForChild("CommE")
	tbl2.RegisterAttack = net:WaitForChild("RE/RegisterAttack")
	tbl2.RegisterHit = net:WaitForChild("RE/RegisterHit")
	tbl2.SubmarineIn = net:WaitForChild("RF/SubmarineWorkerSpeak")
	tbl2.SubmarineOut = net:WaitForChild("RF/SubmarineTransportation")

	tbl2.Invoke = function(...)
		local ok, result, result2, result3, result4 = pcall(commF.InvokeServer, commF, ...)
		if ok then
			return result, result2, result3, result4
		end
		return nil, tostring(result)
	end
end

local tbl3
tbl3 = {}
local data = localPlayer:WaitForChild("Data")
tbl3.Level = data:WaitForChild("Level")
tbl3.Beli = data:WaitForChild("Beli")
tbl3.Fragments = data:WaitForChild("Fragments")
tbl3.FruitCap = data:WaitForChild("FruitCap")
tbl3.Race = data:WaitForChild("Race")
tbl3.Points = data:WaitForChild("Points")
tbl3.Stats = data:WaitForChild("Stats")

tbl3.Stat = function(arg)
	local level = tbl3.Stats:FindFirstChild(arg)
	level = level and level:FindFirstChild("Level")
	return level and tonumber(level.Value) or nil
end

tbl3.RaceVersion = function()
	local character = tbl.Character
	if character and character:FindFirstChild("RaceTransformed") then
		return 4
	end

	if tbl2.Invoke("Wenlocktoad", "1") == -2 then
		return 3
	end

	if tbl2.Invoke("Alchemist", "1") == -2 then
		return 2
	end
	return 1
end

local tbl4
tbl4 = { Cache = {}, MasteryCache = {}, MasteryById = {}, UpdatedAt = 0, MasteryUpdatedAt = 0 }

do
	local Inventory = require(ReplicatedStorage.Controllers.UI.Inventory)
	local ItemId = require(ReplicatedStorage.Economy.ItemId)
	local ItemConfig = require(ReplicatedStorage.ItemConfig)
	local CombatUtil = require(ReplicatedStorage.Modules.CombatUtil)
	local ItemReplicationService = require(ReplicatedStorage.ItemReplicationService)
	local KEYS = require(ReplicatedStorage.ItemReplicationService.KEYS)
	tbl4.Service = ItemReplicationService
	tbl4.Controller = Inventory
	tbl4.CombatData = CombatUtil

	local tbl5 = {
		["Black Leg"] = "Dark Step",
		["Dark Step"] = "Black Leg",
		Electro = "Electric",
		Electric = "Electro",
		["Fishman Karate"] = "Water Kung Fu",
		["Water Kung Fu"] = "Fishman Karate",
		["Dragon Claw"] = "Dragon Breath",
		["Dragon Breath"] = "Dragon Claw",
	}

	local function fn2(arg)
		local flag = not arg

		if flag then
			local masteryUpdatedAt = tbl4.MasteryUpdatedAt
			flag = tick() - masteryUpdatedAt < 5
		end

		if flag then
			return tbl4.MasteryById
		end
		local ok, result = pcall(ItemReplicationService.GetItems, ItemReplicationService, KEYS.MASTERY)
		if not ok or type(result) ~= "table" then
			return tbl4.MasteryById
		end
		local masteryById = {}
		local masteryCache = {}

		for _, v in pairs(result) do
			local n = tonumber(v.Value) or 0

			if v.ItemId then
				masteryById[v.ItemId] = n

				local ok2, result2 = pcall(function()
					return ItemConfig.match(v.ItemId):unwrap()
				end)

				local debugLabel = ok2 and result2 and result2.Index and result2.Index.DebugLabel

				if debugLabel and result2.Moveset and result2.Moveset.Type == "FightingStyle" then
					local match = debugLabel:match("^(.-)%s*%[Moveset.-%]$") or debugLabel
					masteryCache[match] = math.max(masteryCache[match] or 0, n)

					if tbl5[match] then
						masteryCache[tbl5[match]] = math.max(masteryCache[tbl5[match]] or 0, n)
					end
				end
			end
		end

		tbl4.MasteryCache = masteryCache
		tbl4.MasteryById = masteryById
		tbl4.MasteryUpdatedAt = tick()
		return masteryById
	end

	tbl4.Refresh = function(arg)
		local flag = not arg

		if flag then
			local updatedAt = tbl4.UpdatedAt
			flag = tick() - updatedAt < 0.35
		end

		if flag then
			return tbl4.Cache
		end

		if not ItemReplicationService.IsInitialized then
			return tbl4.Cache
		end
		local v = fn2(arg)
		local ok, result = pcall(ItemReplicationService.GetItems, ItemReplicationService, KEYS.QUANTITY)
		if not ok or type(result) ~= "table" then
			return tbl4.Cache
		end
		local cache = {}

		for _, v2 in pairs(result) do
			local ok2, result2 = pcall(function()
				return ItemId.getDataFromId(v2.ItemId):unwrap()
			end)

			if ok2 and result2 and result2.StorageKey then
				cache[result2.StorageKey] = {
					Name = result2.StorageKey,
					Count = tonumber(v2.Value) or 0,
					Type = result2.Type,
					ItemId = v2.ItemId,
					Mastery = v[v2.ItemId] or 0,
				}
			end
		end

		tbl4.Cache = cache
		tbl4.UpdatedAt = tick()
		return cache
	end

	tbl4.Get = function(arg)
		local v = tbl4.Refresh()[arg]
		return v and v.Count >= 1 and v or nil
	end

	tbl4.Has = function(arg)
		return tbl4.Get(arg) ~= nil
	end

	tbl4.Quantity = function(arg)
		local v = tbl4.Get(arg)
		return v and v.Count or 0
	end

	tbl4.Mastery = function(arg)
		tbl4.Refresh()
		return tbl4.MasteryCache[arg] or tbl4.MasteryCache[tbl5[arg]] or 0
	end

	tbl4.Swords = function()
		local tbl6 = {}

		for k, v in pairs(tbl4.Refresh()) do
			local ok, result = pcall(CombatUtil.GetWeaponData, CombatUtil, k)

			if ok and result and string.find(tostring(result.WeaponType), "Sword", 1, true) then
				v.Mastery = tbl4.MasteryById[v.ItemId] or v.Mastery or 0
				tbl6[#tbl6 + 1] = v
			end
		end

		table.sort(tbl6, function(arg, arg2)
			if arg.Mastery == arg2.Mastery then
				return arg.Name < arg2.Name
			end
			return arg.Mastery < arg2.Mastery
		end)

		return tbl6
	end
end

local tbl5

local tbl6 = {
	["Dark Step"] = "Black Leg",
	["Black Leg"] = "Dark Step",
	Electric = "Electro",
	Electro = "Electric",
	["Water Kung Fu"] = "Fishman Karate",
	["Fishman Karate"] = "Water Kung Fu",
	["Dragon Breath"] = "Dragon Claw",
	["Dragon Claw"] = "Dragon Breath",
}

tbl5 = {
	Tool = function(arg, arg2)
		local character = tbl.Character
		local backpack = localPlayer:FindFirstChild("Backpack")

		for _, v in pairs({ character, backpack }) do
			if v then
				for _, child in pairs(v:GetChildren()) do
					local flag = not arg or child.Name == arg or child.Name == tbl6[arg] or string.find(child.Name, arg, 1, true)
					if child:IsA("Tool") and flag and (not arg2 or child.ToolTip == arg2) then
						return child
					end
				end
			end
		end

		return nil
	end,
	FruitTool = function()
		local backpack = localPlayer:FindFirstChild("Backpack")

		for _, v in pairs({ tbl.Character, backpack }) do
			if v then
				for _, child in pairs(v:GetChildren()) do
					if child:IsA("Tool") and child:GetAttribute("OriginalName") then
						return child
					end
				end
			end
		end

		return nil
	end,
	Equip = function(arg, arg2)
		local v = tbl5.Tool(arg, arg2) or tbl5.Tool(nil, arg2)
		local humanoid = tbl.Humanoid
		local backpack = localPlayer:FindFirstChild("Backpack")
		if not v or not humanoid then
			return nil
		end

		if backpack and v.Parent == backpack then
			pcall(humanoid.EquipTool, humanoid, v)
		end

		return v.Parent == tbl.Character and v or tbl5.Tool(arg, arg2)
	end,
	Alive = function(arg)
		local humanoid = arg and arg.Parent and arg:FindFirstChildOfClass("Humanoid")
		return humanoid and humanoid.Health > 0 and arg:FindFirstChild("HumanoidRootPart") ~= nil
	end,
	HasFruit = function()
		return tbl5.FruitTool() ~= nil
	end,
}

local tbl7

tbl7 = {
	Active = nil,
	Goal = nil,
	RouteSpeed = nil,
	LastDistance = nil,
	ActiveSpeed = nil,
	SlowUntil = 0,
	PullbackDistance = 18,
	Velocity = nil,
	NoClipCharacter = nil,
	NoClipAdded = nil,
	NoClipStep = nil,
	NoClipParts = setmetatable({}, { __mode = "k" }),
	GatePart = nil,
	GateExit = nil,
	GateKey = nil,
	GateUntil = 0,
	GateTouchAt = 0,
	GateBlocked = setmetatable({}, { __mode = "k" }),
	SubAt = 0,
}

do
	local tbl8 = { Teleport = true, TeleportAway = true, Entrance = true }
	local tbl9 = { TeleportSpawn = true, TeleportPlate = true }
	local tbl10 = { At = 0, Gates = {}, Pads = {} }
	local tbl11 = { ["Submerged Island"] = true, ["Sealed Cavern"] = true }
	local cframe = CFrame.new(-16270, 25, 1379)
	local cframe2 = CFrame.new(11427, -2155, 9730)

	local function fn2(descendant)
		if descendant:IsA("BasePart") then
			tbl7.NoClipParts[descendant] = true
			descendant.CanCollide = false
		end
	end

	tbl7.EnableNoClip = function()
		local character = tbl.Character
		if not character then
			return
		end

		if tbl7.NoClipCharacter ~= character then
			if tbl7.NoClipAdded then
				tbl7.NoClipAdded:Disconnect()
			end

			tbl7.NoClipCharacter = character
			tbl7.NoClipParts = setmetatable({}, { __mode = "k" })

			for _, descendant in pairs(character:GetDescendants()) do
				fn2(descendant)
			end

			tbl7.NoClipAdded = character.DescendantAdded:Connect(fn2)
		end

		if not tbl7.NoClipStep then
			tbl7.NoClipStep = RunService.Stepped:Connect(function()
				for k in pairs(tbl7.NoClipParts) do
					if k.Parent and k.CanCollide then
						k.CanCollide = false
					end
				end
			end)
		end
	end

	tbl7.DisableNoClip = function()
		if tbl7.NoClipAdded then
			tbl7.NoClipAdded:Disconnect()
		end

		if tbl7.NoClipStep then
			tbl7.NoClipStep:Disconnect()
		end

		tbl7.NoClipAdded = nil
		tbl7.NoClipStep = nil
		tbl7.NoClipCharacter = nil
		tbl7.NoClipParts = setmetatable({}, { __mode = "k" })
	end

	tbl7.Stop = function(arg)
		if tbl7.Active then
			tbl7.Active:Disconnect()
			tbl7.Active = nil
		end

		tbl7.Goal = nil
		tbl7.RouteSpeed = nil
		tbl7.LastDistance = nil
		tbl7.ActiveSpeed = nil

		if tbl7.Velocity and not arg then
			tbl7.Velocity:Destroy()
			tbl7.Velocity = nil
		end
	end

	tbl7.Prepare = function()
		local humanoid = tbl.Humanoid
		local root = tbl.Root
		if not tbl.Character or not humanoid or not root or humanoid.Health <= 0 then
			return false
		end
		humanoid.Sit = false
		root.AssemblyLinearVelocity = Vector3.zero

		if not tbl7.Velocity or tbl7.Velocity.Parent ~= root then
			if tbl7.Velocity then
				tbl7.Velocity:Destroy()
			end

			local bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.Name = "NightKaitunVelocity"
			bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bodyVelocity.P = 1250
			bodyVelocity.Velocity = Vector3.zero
			bodyVelocity.Parent = root
			tbl7.Velocity = bodyVelocity
		end

		tbl7.EnableNoClip()
		return true
	end

	local function fn3(goal, routeSpeed)
		tbl7.Stop(true)
		local root = tbl.Root
		if not root or not root.Parent then
			return false
		end
		local v = nil
		tbl7.Goal = goal
		tbl7.RouteSpeed = routeSpeed
		tbl7.LastDistance = (root.Position - goal.Position).Magnitude
		local v2 = tbl7
		local slowUntil = tbl7.SlowUntil
		v2.ActiveSpeed = tick() < slowUntil and 180 or routeSpeed

		tbl7.Active = RunService.Heartbeat:Connect(function(deltaTime)
			if tbl7.Active ~= v then
				return
			end

			if tbl.Root ~= root or not root.Parent or not tbl5.Alive(tbl.Character) then
				tbl7.Stop()
				return
			end
			local now = tick()
			local goal2 = tbl7.Goal
			if not goal2 then
				tbl7.Stop()
				return
			end
			local magnitude = (root.Position - goal2.Position).Magnitude

			if tbl7.LastDistance and magnitude > tbl7.LastDistance + tbl7.PullbackDistance then
				tbl7.SlowUntil = now + 5
			end

			tbl7.ActiveSpeed = now < tbl7.SlowUntil and 180 or tbl7.RouteSpeed or 200

			if magnitude <= 80 then
				root.CFrame = goal2
				tbl7.Stop(true)
				return
			end

			local n = root.Position + (goal2.Position - root.Position).Unit * math.min(magnitude, tbl7.ActiveSpeed * math.min(deltaTime, 0.1))
			root.CFrame = CFrame.new(n)
			tbl7.LastDistance = (n - goal2.Position).Magnitude
		end)

		return true
	end

	local function fn4()
		local at = tbl10.At
		if tick() - at < 10 then
			return tbl10
		end
		tbl10.At = tick()
		local gates = {}
		local pads = {}
		local map = Workspace:FindFirstChild("Map")
		local tableIterator = pairs
		local descendants = map and map:GetDescendants() or {}

		for _, descendant in tableIterator(descendants) do
			if descendant:IsA("BasePart") then
				if tbl8[descendant.Name] and descendant:FindFirstChild("TouchInterest") then
					gates[#gates + 1] = { Part = descendant, Room = descendant.Parent }
				elseif tbl9[descendant.Name] then
					pads[#pads + 1] = { Part = descendant, Room = descendant.Parent }
				end
			end
		end

		tbl10.Gates = gates
		tbl10.Pads = pads
		return tbl10
	end

	local function fn5(arg, arg2)
		for _, v in ipairs(arg) do
			if v.Room == arg2 and v.Part.Parent then
				return true
			end
		end

		return false
	end

	local function fn6(arg)
		local root = tbl.Root
		if not root then
			return nil
		end
		local v = fn4()
		local magnitude = (root.Position - arg.Position).Magnitude
		local v2 = nil
		local part = nil
		local part2 = nil

		for _, gate in ipairs(v.Gates) do
			local v3 = tbl7.GateBlocked[gate.Part]

			if gate.Part.Parent and (not v3 or tick() >= v3) then
				local magnitude2 = (root.Position - gate.Part.Position).Magnitude

				for _, pad in ipairs(v.Pads) do
					if pad.Part.Parent and pad.Room ~= gate.Room and fn5(v.Gates, pad.Room) then
						local n = magnitude2 + (pad.Part.Position - arg.Position).Magnitude

						if n + 500 < magnitude and (not v2 or n < v2) then
							part = gate.Part
							part2 = pad.Part
							v2 = n
						end
					end
				end
			end
		end

		return part, part2
	end

	tbl7.ClearGate = function()
		tbl7.GatePart = nil
		tbl7.GateExit = nil
		tbl7.GateKey = nil
		tbl7.GateUntil = 0
	end

	tbl7.GateFor = function(arg)
		local root = tbl.Root
		if not root then
			return nil
		end
		local floor = math.floor
		local n = arg.Position.Z / 250
		local gateKey = ("%*:%*:%*"):format(math.floor(arg.Position.X / 250), math.floor(arg.Position.Y / 250), floor(n))
		local gatePart = tbl7.GatePart
		local gateExit = tbl7.GateExit

		if tbl7.GateKey == gateKey and gatePart and gatePart.Parent and gateExit and gateExit.Parent then
			if (root.Position - gateExit.Position).Magnitude <= 200 then
				tbl7.ClearGate()
				return nil
			end

			if tbl7.GateUntil <= tick() then
				tbl7.GateBlocked[gatePart] = tick() + 120
				tbl7.ClearGate()
				return nil
			end

			local flag = (root.Position - gatePart.Position).Magnitude <= 25

			if flag then
				local gateTouchAt = tbl7.GateTouchAt
				flag = tick() - gateTouchAt >= 0.5
			end

			if flag then
				tbl7.GateTouchAt = tick()
				pcall(firetouchinterest, root, gatePart, 0)
				pcall(firetouchinterest, root, gatePart, 1)
			end

			return CFrame.new(gatePart.Position)
		end

		if tbl7.GateKey then
			tbl7.ClearGate()
		end

		local v, v2 = fn6(arg)
		if not v then
			return nil
		end
		tbl7.GatePart = v
		tbl7.GateExit = v2
		tbl7.GateKey = gateKey
		tbl7.GateUntil = tick() + 90
		return CFrame.new(v.Position)
	end

	tbl7.Underwater = function(arg)
		local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
		worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")
		if not worldOrigin then
			return false
		end

		for _, child in pairs(worldOrigin:GetChildren()) do
			local mesh = tbl11[child.Name] and child:FindFirstChild("Mesh")
			if mesh and (arg - child.Position).Magnitude <= mesh.Scale.X then
				return true
			end
		end

		return false
	end

	tbl7.Submarine = function(arg)
		local root = tbl.Root
		if not root then
			return false
		end
		local v = tbl7.Underwater(root.Position)
		if v == tbl7.Underwater(arg.Position) then
			return false
		end
		local v2 = v and cframe2 or cframe

		if (root.Position - v2.Position).Magnitude > 30 then
			tbl7.ClearGate()
			tbl7.To(v2, 300)
			return true
		end

		tbl7.Stop()
		local subAt = tbl7.SubAt
		if tick() - subAt < 1.5 then
			return true
		end
		tbl7.SubAt = tick()

		if v then
			pcall(tbl2.SubmarineOut.InvokeServer, tbl2.SubmarineOut, "InitiateTeleport", "Tiki Outpost")
		else
			pcall(tbl2.SubmarineIn.InvokeServer, tbl2.SubmarineIn, "TravelToSubmergedIsland")
		end

		return true
	end

	tbl7.To = function(arg, routeSpeed)
		if typeof(arg) == "Vector3" then
			arg = CFrame.new(arg)
		end

		if typeof(arg) ~= "CFrame" then
			return false
		end

		if not tbl7.Prepare() then
			return false
		end
		local spawnedAt = tbl.SpawnedAt
		if tick() - spawnedAt < 0.5 then
			return true
		end

		if tbl7.Submarine(arg) then
			return true
		end
		local v = tbl7.GateFor(arg) or arg
		local flag = tbl7.Goal and (tbl7.Goal.Position - v.Position).Magnitude <= 18
		local root = tbl.Root
		local v2 = tbl.Distance(v)

		if v2 <= 80 then
			tbl7.Stop(true)
			root.CFrame = v
			return true
		end

		if tbl7.Active then
			tbl7.Goal = v
			tbl7.RouteSpeed = routeSpeed or 200

			if not flag then
				tbl7.LastDistance = v2
			end

			return true
		end

		return fn3(v, routeSpeed or 200)
	end
end

tbl7.Travel = function(arg)
	if tbl.Sea() == arg then
		return true
	end

	if arg == 1 then
		tbl2.Invoke("TravelMain")
	elseif arg == 2 then
		tbl2.Invoke("TravelDressrosa")
	elseif arg == 3 then
		tbl2.Invoke("TravelZou")
	end

	return false
end

local tbl8

tbl8 = {
	PreferredWeapon = nil,
	PreferredType = nil,
	LastBring = 0,
	LastBuso = 0,
	ActiveTarget = nil,
	TargetTouched = false,
	FastTargets = {},
	FastRefresh = 0,
	FastConnection = nil,
	FastFlagged = false,
	HitFunc = nil,
	BringMobs = setmetatable({}, { __mode = "k" }),
	BringStep = nil,
}

do
	local ok, result = pcall(require, ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Flags"))
	tbl8.FastFlagged = ok and result.COMBAT_REMOTE_THREAD or false
end

tbl8.RefreshHitFunc = function()
	if tbl8.HitFunc or not tbl8.FastFlagged or type(getsenv) ~= "function" then
		return
	end
	local playerScripts = localPlayer:FindFirstChild("PlayerScripts")

	if playerScripts then
		for _, child in pairs(playerScripts:GetChildren()) do
			if child:IsA("LocalScript") then
				local ok, result = pcall(getsenv, child)
				local g = ok and type(result) == "table" and result._G
				if type(g) == "table" and type(g.SendHitsToServer) == "function" then
					tbl8.HitFunc = g.SendHitsToServer
					break
				end
			end
		end
	end
end

tbl8.RefreshHitFunc()

tbl8.Enemy = function(arg, arg2)
	local tbl9

	if type(arg) ~= "string" then
		tbl9 = arg
	else
		tbl9 = { arg }
	end

	local tbl10 = { Workspace:FindFirstChild("Enemies") }

	if arg2 then
		tbl10[#tbl10 + 1] = ReplicatedStorage
	end

	local v, v2, v3 = pairs(tbl10)
	local v4 = nil
	local v5 = nil

	for _, v6 in v, v2, v3 do
		if v6 then
			for _, child in pairs(v6:GetChildren()) do
				if table.find(tbl9, child.Name) and tbl5.Alive(child) then
					local v7 = tbl.Distance(child.HumanoidRootPart)

					if not v4 or v7 < v4 then
						v4 = v7
						v5 = child
					end
				end
			end
		end
	end

	return v5
end

tbl8.Targets = function(arg)
	local tbl9 = {}
	local enemies = Workspace:FindFirstChild("Enemies")
	if not enemies then
		return tbl9
	end

	for _, child in pairs(enemies:GetChildren()) do
		local humanoidRootPart = child:FindFirstChild("HumanoidRootPart")
		local upperTorso = child:FindFirstChild("UpperTorso") or humanoidRootPart
		local flag = humanoidRootPart and upperTorso and tbl5.Alive(child)

		if flag then
			flag = tbl.Distance(humanoidRootPart) <= (arg or 120)
		end

		if flag then
			tbl9[#tbl9 + 1] = { child, upperTorso }
		end
	end

	return tbl9
end

tbl8.Buso = function()
	local character = tbl.Character
	local flag = kaitunConfig.Haki.Enhancement and character and not character:FindFirstChild("HasBuso")

	if flag then
		local lastBuso = tbl8.LastBuso
		flag = tick() - lastBuso >= 1
	end

	if flag then
		tbl8.LastBuso = tick()
		tbl2.Invoke("Buso")
	end
end

tbl8.SendHits = function(arg)
	if #arg == 0 then
		return false
	end
	tbl2.RegisterAttack:FireServer(0)
	tbl8.RefreshHitFunc()

	if tbl8.FastFlagged and type(tbl8.HitFunc) == "function" then
		if pcall(tbl8.HitFunc, arg[1][2], arg) then
			return true
		end
	end

	tbl2.RegisterHit:FireServer(arg[1][2], arg)
	return true
end

tbl8.Attack = function(arg)
	local v = arg or tbl8.Targets(120)
	if #v == 0 then
		return false
	end
	tbl8.Buso()
	tbl5.Equip(tbl8.PreferredWeapon, tbl8.PreferredType or "Melee")
	return tbl8.SendHits(v)
end

tbl8.StopAttack = function()
	tbl8.ActiveTarget = nil
	tbl8.FastTargets = {}
	tbl8.FastRefresh = 0
end

tbl8.SetTarget = function(activeTarget)
	if not tbl5.Alive(activeTarget) then
		tbl8.StopAttack()
		return false
	end
	tbl8.TargetTouched = true

	if tbl8.ActiveTarget ~= activeTarget then
		tbl8.ActiveTarget = activeTarget
		tbl8.FastTargets = {}
		tbl8.FastRefresh = 0
	end

	return true
end

tbl8.FastAttack = function()
	local activeTarget = tbl8.ActiveTarget
	if not tbl5.Alive(activeTarget) then
		tbl8.StopAttack()
		return
	end
	local root = tbl.Root
	local humanoidRootPart = activeTarget:FindFirstChild("HumanoidRootPart")
	if not root or not humanoidRootPart or (root.Position - humanoidRootPart.Position).Magnitude > 120 then
		return
	end

	if tbl8.FastRefresh <= tick() then
		tbl8.FastRefresh = tick() + 0.08
		tbl8.FastTargets = tbl8.Targets(120)

		for i, fastTarget in ipairs(tbl8.FastTargets) do
			if fastTarget[1] == activeTarget then
				local fastTargets = tbl8.FastTargets
				local v = tbl8.FastTargets[1]
				tbl8.FastTargets[1] = fastTarget
				fastTargets[i] = v
				break
			end
		end
	end

	if #tbl8.FastTargets > 0 then
		tbl8.SendHits(tbl8.FastTargets)
	end
end

tbl8.Start = function()
	if tbl8.FastConnection then
		return
	end

	tbl8.FastConnection = RunService.Heartbeat:Connect(function()
		if not tbl.Stopped then
			pcall(tbl8.FastAttack)
		end
	end)

	tbl.Track(tbl8.FastConnection)
end

tbl8.AttackTarget = function(arg)
	if not tbl8.SetTarget(arg) then
		return false
	end
	tbl8.Buso()
	tbl5.Equip(tbl8.PreferredWeapon, tbl8.PreferredType or "Melee")
	local upperTorso = arg:FindFirstChild("UpperTorso") or arg:FindFirstChild("HumanoidRootPart")
	if not upperTorso then
		return false
	end
	return tbl8.SendHits({ { arg, upperTorso } })
end

do
	local function fn2(arg)
		if type(isnetworkowner) ~= "function" then
			return false
		end
		local ok, result = pcall(isnetworkowner, arg)
		return ok and result == true
	end

	local function fn3(arg)
		tbl8.BringMobs[arg] = nil
		local nightKaitunLock = arg:FindFirstChild("NightKaitunLock")

		if nightKaitunLock then
			nightKaitunLock:Destroy()
		end
	end

	local function fn4(arg)
		for k, bringMob in pairs(tbl8.BringMobs) do
			if not k.Parent or not tbl5.Alive(bringMob.Mob) or not fn2(k) then
				fn3(k)
			else
				local n = bringMob.Goal.Position - k.Position
				local magnitude = n.Magnitude

				if magnitude <= 12 then
					k.CFrame = bringMob.Goal
				else
					k.CFrame = CFrame.new(k.Position + n.Unit * math.min(magnitude, 250 * math.min(arg, 0.1)))
				end
			end
		end
	end

	tbl8.MoveMob = function(arg, arg2)
		if not tbl5.Alive(arg) or arg:GetAttribute("Boss") then
			return false
		end
		local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
		local humanoid = arg:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not humanoid then
			return false
		end

		if not fn2(humanoidRootPart) then
			fn3(humanoidRootPart)
			return false
		end

		for _, descendant in pairs(arg:GetDescendants()) do
			if descendant:IsA("BasePart") then
				descendant.CanCollide = false
			end
		end

		humanoid.WalkSpeed = 0
		humanoid.JumpPower = 0
		humanoid.AutoRotate = false
		humanoid:ChangeState(Enum.HumanoidStateType.Physics)
		local nightKaitunLock = humanoidRootPart:FindFirstChild("NightKaitunLock") or Instance.new("BodyVelocity")
		nightKaitunLock.Name = "NightKaitunLock"
		nightKaitunLock.MaxForce = Vector3.new(90000, 90000, 90000)
		nightKaitunLock.Velocity = Vector3.zero
		nightKaitunLock.Parent = humanoidRootPart
		tbl8.BringMobs[humanoidRootPart] = { Mob = arg, Goal = arg2 }

		if not tbl8.BringStep then
			tbl8.BringStep = RunService.Heartbeat:Connect(function(deltaTime)
				if tbl.Stopped then
					return
				end
				pcall(fn4, deltaTime)
			end)

			tbl.Track(tbl8.BringStep)
		end

		return true
	end
end

tbl8.Bring = function(arg)
	local flag = not tbl5.Alive(arg)
	local flag2

	if flag then
		flag2 = flag
	else
		local lastBring = tbl8.LastBring
		flag2 = tick() - lastBring < 0.2
	end

	if flag2 then
		return
	end
	tbl8.LastBring = tick()
	local enemies = Workspace:FindFirstChild("Enemies")
	local humanoidRootPart = arg.HumanoidRootPart
	if not enemies or not humanoidRootPart or arg:GetAttribute("Boss") then
		return
	end

	if type(sethiddenproperty) == "function" then
		pcall(sethiddenproperty, localPlayer, "SimulationRadius", 3150)
	end

	for _, child in pairs(enemies:GetChildren()) do
		local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")

		if child ~= arg and child.Name == arg.Name and humanoidRootPart2 and (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= 350 then
			tbl8.MoveMob(child, humanoidRootPart.CFrame)
		end
	end
end

tbl8.CakeSkill = function()
	local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
	local root = tbl.Root
	if not worldOrigin or not root then
		return false
	end

	for _, child in pairs(worldOrigin:GetChildren()) do
		if (child.Name == "Ring" or child.Name == "Fist") and child:IsA("BasePart") and (child.Position - root.Position).Magnitude <= 400 then
			return true
		end
	end

	return false
end

tbl8.Kill = function(arg, arg2)
	local n = 0
	local flag

	while true do
		local flag2 = not tbl.Stopped and tbl5.Alive(tbl.Character) and tbl5.Alive(arg)
		flag = false

		if flag2 then
			local equip, preferredWeapon, preferredType, str, to, cFrame, cframe, n2

			if type(arg2) == "function" and tick() >= n then
				n = tick() + 0.1
				local ok, result = pcall(arg2, arg)

				if not ok or result then
					flag = true
					break
				else
					tbl8.SetTarget(arg)
					tbl8.Buso()
					tbl8.Bring(arg)
					equip = tbl5.Equip
					preferredWeapon = tbl8.PreferredWeapon
					preferredType = tbl8.PreferredType
					str = preferredType or "Melee"
					equip(preferredWeapon, str)
					to = tbl7.To
					cFrame = arg.HumanoidRootPart.CFrame
					cframe = CFrame.new
					n2 = tbl8.CakeSkill() and -30 or 20
					to(cFrame * cframe(0, n2, 0))
					RunService.Heartbeat:Wait()
					continue
				end
			else
				tbl8.SetTarget(arg)
				tbl8.Buso()
				tbl8.Bring(arg)
				equip = tbl5.Equip
				preferredWeapon = tbl8.PreferredWeapon
				preferredType = tbl8.PreferredType
				str = preferredType or "Melee"
				equip(preferredWeapon, str)
				to = tbl7.To
				cFrame = arg.HumanoidRootPart.CFrame
				cframe = CFrame.new
				n2 = tbl8.CakeSkill() and -30 or 20
				to(cFrame * cframe(0, n2, 0))
				RunService.Heartbeat:Wait()
				continue
			end
		end

		break
	end

	if tbl8.ActiveTarget == arg then
		tbl8.StopAttack()
	end

	if flag then
		tbl7.Stop(true)
	end

	return not tbl5.Alive(arg)
end

local tbl9

tbl9 = {
	LastCast = 0,
	Cast = function()
		local lastCast = tbl9.LastCast
		if tick() - lastCast < 0.15 then
			return
		end
		tbl9.LastCast = tick()

		for _, key in ipairs({ "Z", "X", "C", "V", "F" }) do
			VirtualInputManager:SendKeyEvent(true, Enum.KeyCode[key], false, game)
			VirtualInputManager:SendKeyEvent(false, Enum.KeyCode[key], false, game)
		end
	end,
}

local tbl10
tbl10 = { Visited = {}, LastHop = 0, LastSync = 0, APIModule = nil, Registry = "NightHubKaitun/servers" }

local tbl11 = {
	["Rip Indra"] = "RipIndra",
	["Dough King"] = "DoughKing",
	["Castle Raid"] = "CastleRaid",
	["Cake Queen"] = "CakeQueen",
	["Soul Reaper"] = "SoulReaper",
	Darkbeard = "Darkbeard",
	["Mirage Island"] = "Mirage",
}

tbl10.Reservations = function()
	local tbl12 = {}
	if type(listfiles) ~= "function" or type(readfile) ~= "function" then
		return tbl12
	end

	if type(makefolder) == "function" then
		pcall(makefolder, "NightHubKaitun")
		pcall(makefolder, tbl10.Registry)
	end

	local ok, result = pcall(listfiles, tbl10.Registry)
	if not ok then
		return tbl12
	end

	for _, v in pairs(result) do
		local ok2, result2 = pcall(readfile, v)
		local ok3, result3 = pcall(HttpService.JSONDecode, HttpService, ok2 and result2 or "")
		ok3 = ok3 and type(result3) == "table" and result3.User ~= localPlayer.UserId and type(result3.Job) == "string"

		if ok3 then
			ok3 = os.time() - (tonumber(result3.Time) or 0) < 120
		end

		if ok3 then
			tbl12[result3.Job] = math.min(tbl12[result3.Job] or math.huge, tonumber(result3.User) or math.huge)
		end
	end

	return tbl12
end

tbl10.Sync = function()
	local lastSync = tbl10.LastSync
	if tick() - lastSync < 2 then
		return false
	end
	tbl10.LastSync = tick()
	if type(writefile) ~= "function" then
		return false
	end

	if type(makefolder) == "function" then
		pcall(makefolder, "NightHubKaitun")
		pcall(makefolder, tbl10.Registry)
	end

	local v = HttpService
	local jsonEncode = v.JSONEncode
	pcall(writefile, ("%*/%*.json"):format(tbl10.Registry, localPlayer.UserId), jsonEncode(v, { User = localPlayer.UserId, Job = game.JobId, Time = os.time() }))
	local jobId = game.JobId
	local v2 = tbl10.Reservations()[jobId]
	return v2 and v2 < localPlayer.UserId or false
end

tbl10.Reserve = function(arg)
	if type(writefile) == "function" then
		local v = HttpService
		local jsonEncode = v.JSONEncode
		pcall(writefile, ("%*/%*.json"):format(tbl10.Registry, localPlayer.UserId), jsonEncode(v, { User = localPlayer.UserId, Job = arg, Time = os.time() }))
	end
end

tbl10.NearPlayer = function(arg)
	local root = tbl.Root
	if not root then
		return false
	end

	for _, player in pairs(Players:GetPlayers()) do
		local humanoidRootPart = player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			humanoidRootPart = (root.Position - humanoidRootPart.Position).Magnitude <= (arg or 500)
		end

		if humanoidRootPart then
			return true
		end
	end

	return false
end

tbl10.Hop = function()
	local lastHop = tbl10.LastHop
	if tick() - lastHop < 8 then
		return false, "Throttled"
	end
	tbl10.LastHop = tick()
	local serverBrowser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
	if not serverBrowser then
		return false, "No server browser"
	end

	pcall(function()
		localPlayer.PlayerGui.ServerBrowser.Frame.Filters.SearchRegion.TextBox.Text = "Singapore"
	end)

	local v = tbl10.Reservations()
	local tbl12 = {}

	for i = 1, 100 do
		local ok, result = pcall(serverBrowser.InvokeServer, serverBrowser, i)

		if ok and type(result) == "table" then
			for k, v2 in pairs(result) do
				if k ~= game.JobId and not v[k] and not tbl10.Visited[k] and tonumber(v2.Count) and tonumber(v2.Count) < 12 and type(v2.Region) == "string" and string.find(v2.Region, "Singapore", 1, true) then
					tbl12[#tbl12 + 1] = k
				end
			end
		end
	end

	table.sort(tbl12)
	local v2 = tbl12[#tbl12 > 0 and localPlayer.UserId % #tbl12 + 1 or 0]

	if v2 then
		tbl10.Visited[v2] = true
		tbl10.Reserve(v2)
		serverBrowser:InvokeServer("teleport", v2)
		return true
	end

	return false, "No Singapore server"
end

tbl10.HopBoss = function(arg)
	local lastHop = tbl10.LastHop
	if tick() - lastHop < 8 then
		return false, "Throttled"
	end
	tbl10.LastHop = tick()

	if not tbl10.APIModule then
		local ok, apiModule = pcall(function()
			return loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/IDK.luau"))()
		end)

		if not ok or type(apiModule) ~= "table" or type(apiModule.HopApi) ~= "function" then
			return false, "No Hop API"
		end
		tbl10.APIModule = apiModule
	end

	local ok, result, result2 = pcall(tbl10.APIModule.HopApi, "NightHubSerectKey_0001", arg, 11)
	return ok and result == true, ok and result2 or result
end

tbl10.HopConfigured = function(arg)
	local v = tbl11[arg]
	if not kaitunConfig["Server Hop"][arg] then
		return false, "Disabled"
	end

	if not v then
		return false, "No boss route"
	end
	return tbl10.HopBoss(v)
end

local tbl12
tbl12 = { NPC = {}, PositionCache = {}, Current = nil, LastClaim = 0 }

do
	local Quests = require(ReplicatedStorage:WaitForChild("Quests"))
	local GuideModule = require(ReplicatedStorage:WaitForChild("GuideModule"))

	local tbl13 = {
		BanditQuest1 = CFrame.new(1045.96, 27, 1560.82),
		JungleQuest = CFrame.new(-1598.09, 35.55, 153.38),
		BuggyQuest1 = CFrame.new(-1141.07, 4.1, 3831.55),
		DesertQuest = CFrame.new(894.49, 5.14, 4392.43),
		SnowQuest = CFrame.new(1389.74, 88.15, -1298.91),
		MarineQuest2 = CFrame.new(-5039.59, 27.35, 4324.68),
		SkyQuest = CFrame.new(-4839.53, 716.37, -2619.44),
		PrisonerQuest = CFrame.new(5308.93, 1.66, 475.12),
		ColosseumQuest = CFrame.new(-1580.05, 6.35, -2986.48),
		MagmaQuest = CFrame.new(-5313.37, 10.95, 8515.29),
		FishmanQuest = CFrame.new(61122.65, 18.5, 1569.4),
		SkyExp1Quest = CFrame.new(-4721.89, 843.87, -1949.97),
		SkyExp2Quest = CFrame.new(-7906.82, 5634.66, -1411.99),
		FountainQuest = CFrame.new(5259.82, 37.35, 4050.03),
		Area1Quest = CFrame.new(-429.54, 71.77, 1836.18),
		Area2Quest = CFrame.new(638.44, 71.77, 918.28),
		MarineQuest3 = CFrame.new(-2440.8, 71.71, -3216.07),
		ZombieQuest = CFrame.new(-5497.06, 47.59, -795.24),
		SnowMountainQuest = CFrame.new(609.86, 400.12, -5372.26),
		IceSideQuest = CFrame.new(-6064.07, 15.24, -4902.98),
		FireSideQuest = CFrame.new(-5428.03, 15.06, -5299.43),
		ShipQuest1 = CFrame.new(1037.8, 125.09, 32911.6),
		ShipQuest2 = CFrame.new(968.81, 125.09, 33244.13),
		FrostQuest = CFrame.new(5667.66, 26.8, -6486.09),
		ForgottenQuest = CFrame.new(-3054.44, 235.54, -10142.82),
		PiratePortQuest = CFrame.new(-712.83, 98.58, 5711.95),
		AmazonQuest = CFrame.new(6779.03, 111.17, -801.21),
		VenomCrewQuest = CFrame.new(4620.62, 1002.3, 399.09),
		MarineTreeIsland = CFrame.new(2180.54, 27.82, -6741.55),
		DeepForestIsland3 = CFrame.new(-10581.66, 330.87, -8761.19),
		DeepForestIsland = CFrame.new(-13234.04, 331.49, -7625.4),
		DeepForestIsland2 = CFrame.new(-12680.38, 389.97, -9902.02),
		HauntedQuest1 = CFrame.new(-9479.22, 141.22, 5566.09),
		HauntedQuest2 = CFrame.new(-9516.99, 172.02, 6078.47),
		NutsIslandQuest = CFrame.new(-2104.39, 38.1, -10194.22),
		IceCreamIslandQuest = CFrame.new(-820.65, 65.82, -10965.8),
		CakeQuest1 = CFrame.new(-2021.32, 37.8, -12028.73),
		CakeQuest2 = CFrame.new(-1927.92, 37.8, -12842.54),
		ChocQuest1 = CFrame.new(233.23, 29.88, -12201.23),
		ChocQuest2 = CFrame.new(150.51, 30.69, -12774.5),
		CandyQuest1 = CFrame.new(-1150.04, 20.38, -14446.33),
		TikiQuest1 = CFrame.new(-16548.82, 55.61, -172.81),
		TikiQuest2 = CFrame.new(-16538, 55, 1049),
		TikiQuest3 = CFrame.new(-16679.48, 176.75, 1474.4),
		SubmergedQuest1 = CFrame.new(10882.26, -2086.32, 10034.23),
		SubmergedQuest2 = CFrame.new(10882.26, -2086.32, 10034.23),
		SubmergedQuest3 = CFrame.new(9636.52, -1992.2, 9609.53),
		["SkyExp1Quest:2"] = CFrame.new(-7859.1, 5544.19, -381.48),
	}

	local tbl14 = {
		{
			BanditQuest1 = true,
			JungleQuest = true,
			BuggyQuest1 = true,
			DesertQuest = true,
			SnowQuest = true,
			MarineQuest2 = true,
			SkyQuest = true,
			PrisonerQuest = true,
			ColosseumQuest = true,
			MagmaQuest = true,
			FishmanQuest = true,
			SkyExp1Quest = true,
			SkyExp2Quest = true,
			FountainQuest = true,
		},
		{
			Area1Quest = true,
			Area2Quest = true,
			MarineQuest3 = true,
			ZombieQuest = true,
			SnowMountainQuest = true,
			IceSideQuest = true,
			FireSideQuest = true,
			ShipQuest1 = true,
			ShipQuest2 = true,
			FrostQuest = true,
			ForgottenQuest = true,
		},
		{
			PiratePortQuest = true,
			AmazonQuest = true,
			VenomCrewQuest = true,
			MarineTreeIsland = true,
			DeepForestIsland3 = true,
			DeepForestIsland = true,
			DeepForestIsland2 = true,
			HauntedQuest1 = true,
			HauntedQuest2 = true,
			NutsIslandQuest = true,
			IceCreamIslandQuest = true,
			CakeQuest1 = true,
			CakeQuest2 = true,
			ChocQuest1 = true,
			ChocQuest2 = true,
			CandyQuest1 = true,
			TikiQuest1 = true,
			TikiQuest2 = true,
			TikiQuest3 = true,
			SubmergedQuest1 = true,
			SubmergedQuest2 = true,
			SubmergedQuest3 = true,
		},
	}

	local function fn2(arg)
		if not arg then
			return
		end

		for _, child in pairs(arg:GetChildren()) do
			local attribute = child:GetAttribute("FloorPos")

			if typeof(attribute) == "Vector3" then
				tbl12.NPC[child.Name] = CFrame.new(attribute) * CFrame.new(0, 5, -2)
			elseif child:IsA("BasePart") then
				tbl12.NPC[child.Name] = child.CFrame
			end
		end
	end

	local npCs = Workspace:FindFirstChild("NPCs_")

	if npCs then
		npCs:Destroy()
	end

	local folder = Instance.new("Folder")
	folder.Name = "NPCs_"
	folder.Parent = Workspace
	local findFirstChild = ReplicatedStorage.FindFirstChild

	for _, v in pairs({ Workspace:FindFirstChild("NPCs"), findFirstChild(ReplicatedStorage, "NPCs") }) do
		if v then
			for _, child in pairs(v:GetChildren()) do
				local attribute = child:GetAttribute("FloorPos")

				if typeof(attribute) == "Vector3" then
					local part = Instance.new("Part")
					part.Name = child.Name
					part.Size = Vector3.one
					part.Transparency = 1
					part.CanCollide = false
					part.Anchored = true
					part.CFrame = CFrame.new(attribute) * CFrame.new(0, 5, -2)
					part.Parent = folder
				end
			end
		end
	end

	fn2(ReplicatedStorage:FindFirstChild("NPCs"))
	fn2(Workspace:FindFirstChild("NPCs"))
	fn2(folder)

	tbl12.Select = function()
		local tbl15 = tbl14[tbl.Sea()] or {}
		local n = 0
		local current = nil

		for k, Quest in pairs(Quests) do
			for k2, v in pairs(Quest) do
				if tbl15[k] and v.LevelReq <= tbl3.Level.Value and v.LevelReq >= n then
					local tableIterator = pairs
					local task_ = v.Task or {}

					for k3, v2 in tableIterator(task_) do
						if v2 > 1 then
							current = { Name = k, Number = k2, Mob = k3, Level = v.LevelReq }
							n = v.LevelReq
						end
					end
				end
			end
		end

		local v = tbl12.LastQuest()
		local flag = kaitunConfig.Farm["Triple Quest"] == true
		local flag2 = flag or kaitunConfig.Farm["Double Quest"] == true

		if flag and current and not tbl12.Open() then
			local tableIterator = pairs
			local tbl16 = Quests[current.Name] or {}
			local current2 = nil

			for k, v2 in tableIterator(tbl16) do
				if v2.LevelReq <= tbl3.Level.Value then
					local tableIterator2 = pairs
					local task_ = v2.Task or {}

					for k2, v3 in tableIterator2(task_) do
						if v3 == 1 and tbl8.Enemy(k2, true) and (not current2 or v2.LevelReq > current2.Level) then
							current2 = {
								Name = current.Name,
								Number = k,
								Mob = k2,
								Level = v2.LevelReq,
								Boss = true,
							}
						end
					end
				end
			end

			if current2 then
				tbl12.Current = current2
				return current2
			end
		end

		if flag2 and current and not tbl12.Open() and v == current.Mob and tbl12.Unlocked(current.Name) >= 2 then
			local tableIterator = pairs
			local tbl16 = Quests[current.Name] or {}

			for k, v2 in tableIterator(tbl16) do
				local tableIterator2 = pairs
				local task_ = v2.Task or {}

				for k2, v3 in tableIterator2(task_) do
					if k2 ~= current.Mob and v2.LevelReq <= tbl3.Level.Value and v3 >= 5 and v2.Name ~= "Town Raid" then
						local current2 = { Name = current.Name, Number = k, Mob = k2, Level = v2.LevelReq }
						tbl12.Current = current2
						return current2
					end
				end
			end
		end

		tbl12.Current = current
		return current
	end

	tbl12.ValidMob = function(arg)
		local tbl15 = tbl14[tbl.Sea()] or {}

		for k, Quest in pairs(Quests) do
			if tbl15[k] then
				for _, v in pairs(Quest) do
					if v.LevelReq <= tbl3.Level.Value and v.Task and v.Task[arg] then
						return true
					end
				end
			end
		end

		return false
	end

	tbl12.BossMob = function(arg)
		local tbl15 = tbl14[tbl.Sea()] or {}

		for k, Quest in pairs(Quests) do
			if tbl15[k] then
				for _, v in pairs(Quest) do
					if v.LevelReq <= tbl3.Level.Value and v.Task and v.Task[arg] == 1 then
						return true
					end
				end
			end
		end

		return false
	end

	tbl12.LastQuest = function()
		local v = tbl12.Text()

		if v ~= "" then
			local mob = tbl12.Current and tbl12.Current.Mob
			local v2

			if mob then
				local lower = string.lower
				local v3 = string.gsub(mob, "-", "")
				v2 = lower(v3)
			else
				v2 = mob
			end

			if v2 and string.find(v, v2, 1, true) then
				return mob
			end
			local tbl15 = tbl14[tbl.Sea()] or {}
			local n = nil
			local v3 = nil

			for k, Quest in pairs(Quests) do
				if tbl15[k] then
					for _, v4 in pairs(Quest) do
						local tableIterator = pairs
						local task_ = v4.Task or {}

						for k2 in tableIterator(task_) do
							local lower = string.lower
							local v5 = string.gsub(k2, "-", "")
							local v6 = lower(v5)

							if string.find(v, v6, 1, true) and (not n or #v6 > n) then
								n = #v6
								v3 = k2
							end
						end
					end
				end
			end

			if v3 then
				return v3
			end
		end

		local tableIterator = pairs
		local data2 = GuideModule.Data or {}
		local v2 = nil

		for k, v3 in tableIterator(data2) do
			if k == "QuestData" then
				v2 = v3
				break
			else
				v2 = nil
			end
		end

		if v2 and v2.Task then
			local v3, v4, v5 = pairs(v2.Task)
			local v6 = table.pack(W_1())
			if v6[1] then
				return v6[2]
			end
		end

		return false
	end

	tbl12.Unlocked = function(arg)
		local n = 0

		for k, Quest in pairs(Quests) do
			for _, v in pairs(Quest) do
				local tableIterator = pairs
				local task_ = v.Task or {}

				for _, v2 in tableIterator(task_) do
					if k == arg and v.LevelReq <= tbl3.Level.Value and v2 > 1 and v.Name ~= "Town Raid" then
						n += 1
					end
				end
			end
		end

		return n
	end

	tbl12.Frame = function()
		local trackedQuestFrame = localPlayer.PlayerGui:FindFirstChild("TrackedQuestFrame")
		local frame = trackedQuestFrame and trackedQuestFrame:FindFirstChild("Frame")
		if not frame or trackedQuestFrame:IsA("ScreenGui") and not trackedQuestFrame.Enabled or not frame.Visible then
			return nil
		end
		return frame
	end

	tbl12.Text = function()
		local v = tbl12.Frame()
		if not v then
			return ""
		end
		local tbl15 = {}

		for _, descendant in pairs(v:GetDescendants()) do
			if descendant:IsA("TextLabel") and descendant.Visible and descendant.Text ~= "" then
				local n = #tbl15 + 1
				local lower = string.lower
				local v2 = string.gsub(descendant.Text, "-", "")
				tbl15[n] = lower(v2)
			end
		end

		return table.concat(tbl15, "\n")
	end

	tbl12.Visible = function(arg)
		local v = tbl12.Text()
		local lower = string.lower
		local v2 = string.gsub(arg, "-", "")
		local v3 = lower(v2)
		return v ~= "" and string.find(v, v3, 1, true) ~= nil
	end

	tbl12.Position = function(arg)
		local str

		if arg then
			local name = arg.Name
			local number = arg.Number
			str = ("%*:%*:%*"):format(tbl.Sea(), name, number)
		else
			str = arg
		end

		local v = arg and (tbl13[("%*:%*"):format(arg.Name, arg.Number)] or tbl13[arg.Name])
		if v then
			return v
		end

		local function fn3(tableValue)
			if typeof(tableValue) == "CFrame" then
				return tableValue
			end

			if typeof(tableValue) == "Instance" then
				local attribute = tableValue:GetAttribute("FloorPos")
				if typeof(attribute) == "Vector3" then
					return CFrame.new(attribute) * CFrame.new(0, 5, -2)
				end

				if tableValue:IsA("BasePart") then
					return tableValue.CFrame
				end
			end

			if type(tableValue) == "table" and typeof(tableValue.CFrame) == "CFrame" then
				return tableValue.CFrame
			end
			return nil
		end

		local function fn4(arg2, arg3)
			local v2 = fn3(arg3) or fn3(arg2)
			if v2 and tbl.Sea() ~= 3 and v2.Position.Y < -50 then
				return nil
			end
			return v2
		end

		local npcList = GuideModule.Data and GuideModule.Data.NPCList
		local lastClosestNPC = GuideModule.Data and GuideModule.Data.LastClosestNPC

		if arg and type(npcList) == "table" then
			for k, v2 in pairs(npcList) do
				if type(v2) == "table" and v2.NPCName == lastClosestNPC then
					local tableIterator = pairs
					local levels = v2.Levels or {}

					for _, level in tableIterator(levels) do
						if tonumber(level) ~= tonumber(arg.Level) then
							continue
						end
						local v3 = fn4(k, v2)
						if v3 then
							tbl12.PositionCache[str] = v3
							return v3
						end
					end
				end
			end

			for k, v2 in pairs(npcList) do
				local tableIterator = pairs
				local levels = type(v2) == "table" and v2.Levels or {}

				for _, level in tableIterator(levels) do
					if tonumber(level) == tonumber(arg.Level) then
						local v3 = fn4(k, v2)
						if v3 then
							tbl12.PositionCache[str] = v3
							return v3
						end
					end
				end
			end
		end

		local npCs2 = Workspace:FindFirstChild("NPCs_")
		local v2 = lastClosestNPC and npCs2 and npCs2:FindFirstChild(lastClosestNPC)
		if v2 then
			tbl12.PositionCache[str] = v2.CFrame
			return v2.CFrame
		end

		if lastClosestNPC and npCs2 then
			local findFirstChild2 = ReplicatedStorage.FindFirstChild

			for _, v3 in pairs({ Workspace:FindFirstChild("NPCs"), findFirstChild2(ReplicatedStorage, "NPCs") }) do
				v3 = v3 and v3:FindFirstChild(lastClosestNPC)
				v3 = v3 and v3:GetAttribute("FloorPos")

				if typeof(v3) == "Vector3" then
					local part = Instance.new("Part")
					part.Name = lastClosestNPC
					part.Size = Vector3.one
					part.Transparency = 1
					part.CanCollide = false
					part.Anchored = true
					part.CFrame = CFrame.new(v3) * CFrame.new(0, 5, -2)
					part.Parent = npCs2
					tbl12.NPC[lastClosestNPC] = part.CFrame
					tbl12.PositionCache[str] = part.CFrame
					return part.CFrame
				end
			end

			return nil
		end

		return nil
	end
end

tbl12.Open = function()
	return tbl12.Frame() ~= nil
end

tbl12.TPSpawnMob = function(tableValue)
	local fortBuilderReplicatedSpawnPositi = ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
	if not fortBuilderReplicatedSpawnPositi then
		return false
	end
	local tbl13 = type(tableValue) == "table" and tableValue or { tableValue }

	for _, child in pairs(fortBuilderReplicatedSpawnPositi:GetChildren()) do
		if child:IsA("BasePart") and table.find(tbl13, child.Name) and tbl.Distance(child) >= 50 then
			if tbl8.Enemy(tbl13) then
				return true
			end

			while true do
				tbl7.To(child.CFrame * CFrame.new(0, 20, 0))
				task.wait(1)
				if not (tbl.Stopped or not tbl.Character or not tbl.Humanoid or tbl.Humanoid.Health <= 0 or tbl.Distance(child) <= 30 or tbl8.Enemy(tbl13)) then
					continue
				end
				break
			end
		end
	end

	return tbl8.Enemy(tbl13) ~= nil
end

tbl12.Farm = function()
	tbl.Farming = true
	local avoidNearbyPlayers = kaitunConfig["Server Hop"]["Avoid Nearby Players"]

	if avoidNearbyPlayers then
		avoidNearbyPlayers = tbl10.NearPlayer(tonumber(kaitunConfig["Server Hop"]["Nearby Range"]) or 500)
	end

	if avoidNearbyPlayers then
		tbl10.Hop()
		return false, "Avoid player"
	end
	local v = tbl12.Open()
	local v2 = v and tbl12.LastQuest()

	if v and kaitunConfig.Farm["Triple Quest"] and v2 and tbl12.BossMob(v2) and not tbl8.Enemy(v2, true) then
		tbl2.Invoke("AbandonQuest")
		tbl12.Current = nil
		return false, "Boss missing"
	end

	local v3 = tbl12.Select()
	if not v3 then
		return false, "No quest"
	end

	if tbl.Sea() == 1 and v3.Level < 375 and tbl.Root and tbl.Humanoid and tbl.Root.Position.Y < -20 then
		tbl.Humanoid.Health = 0
		return false, "Recovering from ocean"
	end

	if v and v2 and not tbl12.ValidMob(v2) then
		tbl2.Invoke("AbandonQuest")
		return false, "Clear wrong sea quest"
	end

	if not v then
		local v4 = tbl12.Position(v3)
		if not v4 then
			return false, "Locating quest NPC"
		end

		if tbl.Distance(v4) > 50 then
			tbl7.To(v4 * CFrame.new(0, 9, 0))
		else
			tbl7.Stop()

			if tbl12.Open() then
				tbl2.Invoke("AbandonQuest")
			end

			local lastClaim = tbl12.LastClaim

			if tick() - lastClaim >= 0.01 then
				tbl12.LastClaim = tick()
				tbl2.Invoke("StartQuest", v3.Name, v3.Number)
			end
		end

		return false, "Claiming quest"
	end

	local mob = v2 or v3.Mob
	local v4 = tbl8.Enemy(mob)

	if v4 then
		tbl8.Kill(v4, function()
			return not tbl12.Visible(mob)
		end)

		return false, mob
	end

	tbl12.TPSpawnMob(mob)
	return false, (("Waiting %*"):format(mob))
end

local tbl13

tbl13 = {
	PreferredMelee = nil,
	LastCraft = 0,
	LibraryAt = 0,
	StyleCache = {},
	SeaUnlockCache = {},
	GuitarProgress = nil,
	GuitarAt = 0,
	SwampKilling = false,
	SwampEscort = nil,
	SwampGatherAt = 0,
	DarkHopAt = 0,
	DropHopAt = 0,
}

do
	local tbl14 = {
		{ Config = "Pole V1", Item = "Pole (1st Form)", Sea = 1, Level = 150, Boss = "Thunder God" },
		{
			Config = "Dragon Trident",
			Item = "Dragon Trident",
			Sea = 2,
			Level = 700,
			Boss = "Tide Keeper",
		},
		{
			Config = "Gravity Blade",
			Item = "Gravity Blade",
			Sea = 2,
			Level = 900,
			Boss = { "Orbitus", "Fajita" },
		},
		{
			Config = "Rengoku",
			Item = "Rengoku",
			Sea = 2,
			Level = 1400,
			Boss = "Awakened Ice Admiral",
		},
	}

	local tbl15 = {
		{ Name = "Katana", Remote = "Katana", Cost = 1000 },
		{ Name = "Cutlass", Remote = "Cutlass", Cost = 1000 },
		{ Name = "Dual Katana", Remote = "Dual Katana", Cost = 12000 },
		{ Name = "Iron Mace", Remote = "Iron Mace", Cost = 25000 },
		{ Name = "Triple Katana", Remote = "Triple Katana", Cost = 60000 },
		{ Name = "Pipe", Remote = "Pipe", Cost = 100000 },
		{ Name = "Dual-Headed Blade", Remote = "Dual-Headed Blade", Cost = 400000 },
		{ Name = "Soul Cane", Remote = "Soul Cane", Cost = 750000 },
		{ Name = "Bisento", Remote = "Bisento", Cost = 1200000 },
	}

	local tbl16 = {
		{ Name = "Dark Step", Remote = "BuyBlackLeg", Cost = 150000 },
		{ Name = "Electric", Remote = "BuyElectro", Cost = 500000 },
		{ Name = "Water Kung Fu", Remote = "BuyFishmanKarate", Cost = 750000 },
		{ Name = "Dragon Breath", Remote = "BlackbeardReward", Fragments = 1500 },
	}

	local tbl17 = { Name = "Superhuman", Remote = "BuySuperhuman", Cost = 3000000 }
	local n = 400

	local tbl18 = {
		{
			Name = "Death Step",
			Base = "Dark Step",
			Remote = "BuyDeathStep",
			Cost = 2500000,
			Fragments = 5000,
		},
		{
			Name = "Sharkman Karate",
			Base = "Water Kung Fu",
			Remote = "BuySharkmanKarate",
			Cost = 2500000,
			Fragments = 5000,
		},
		{
			Name = "Electric Claw",
			Base = "Electric",
			Remote = "BuyElectricClaw",
			Cost = 3000000,
			Fragments = 5000,
		},
		{
			Name = "Dragon Talon",
			Base = "Dragon Breath",
			Remote = "BuyDragonTalon",
			Cost = 3000000,
			Fragments = 5000,
		},
	}

	local tbl19 = { Name = "Godhuman", Remote = "BuyGodhuman", Cost = 5000000, Fragments = 5000 }

	local tbl20 = {
		["Dark Step"] = "BuyBlackLeg",
		Electric = "BuyElectro",
		["Water Kung Fu"] = "BuyFishmanKarate",
		Superhuman = "BuySuperhuman",
		["Death Step"] = "BuyDeathStep",
		["Sharkman Karate"] = "BuySharkmanKarate",
		["Electric Claw"] = "BuyElectricClaw",
		["Dragon Talon"] = "BuyDragonTalon",
		Godhuman = "BuyGodhuman",
	}

	local tbl21 = {
		["Dark Step"] = "Black Leg",
		Electric = "Electro",
		["Water Kung Fu"] = "Fishman Karate",
		["Dragon Breath"] = "Dragon Claw",
	}

	local tbl22 = {}

	local tbl23 = {
		["Black Leg"] = "Dark Step",
		["Dark Step"] = "Dark Step",
		Electro = "Electric",
		Electric = "Electric",
		["Fishman Karate"] = "Water Kung Fu",
		["Water Kung Fu"] = "Water Kung Fu",
		["Dragon Claw"] = "Dragon Breath",
		["Dragon Breath"] = "Dragon Breath",
		Superhuman = "Superhuman",
		["Death Step"] = "Death Step",
		["Sharkman Karate"] = "Sharkman Karate",
		["Electric Claw"] = "Electric Claw",
		["Dragon Talon"] = "Dragon Talon",
	}

	local tbl24 = {
		["Dark Step"] = {
			CFrame.new(-985, 13, 3988),
			CFrame.new(-4753, 35, -4850),
			(CFrame.new(-5045, 371, -3181)),
		},
		Electric = {
			CFrame.new(-5384, 13, -2148),
			CFrame.new(-4867, 35, -4766),
			(CFrame.new(-4995, 314, -3203)),
		},
		["Water Kung Fu"] = {
			CFrame.new(61585, 18, 987),
			CFrame.new(-4958, 35, -4668),
			(CFrame.new(-5023, 371, -3190)),
		},
		["Dragon Breath"] = { [2] = CFrame.new(701, 187, 655), [3] = CFrame.new(-4981, 371, -3207) },
		Superhuman = { [2] = CFrame.new(1374, 247, -5192), [3] = CFrame.new(-5004, 371, -3198) },
		["Death Step"] = { [2] = CFrame.new(6357, 296, -6762), [3] = CFrame.new(-4999, 314, -3221) },
		["Sharkman Karate"] = { [2] = CFrame.new(-2602, 238, -10316), [3] = CFrame.new(-4972, 314, -3222) },
		["Electric Claw"] = { [3] = CFrame.new(-10371, 331, -10131) },
		["Dragon Talon"] = { [3] = CFrame.new(5661, 1211, 865) },
		Godhuman = { [3] = CFrame.new(-13776, 334, -9879) },
	}

	local tbl25 = {
		["Fish Tail"] = { Sea = 1, Mobs = { "Fishman Warrior", "Fishman Commando" } },
		["Magma Ore"] = { Sea = 2, Mobs = { "Magma Ninja", "Lava Pirate" } },
		["Mystic Droplet"] = { Sea = 2, Mobs = { "Sea Soldier", "Water Fighter" } },
		["Dragon Scale"] = { Sea = 3, Mobs = { "Dragon Crew Warrior", "Dragon Crew Archer" } },
		Ectoplasm = { Sea = 2, Mobs = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" } },
		Bones = { Sea = 3, Mobs = { "Reborn Skeleton", "Living Zombie", "Demonic Soul", "Posessed Mummy" } },
		["Conjured Cocoa"] = {
			Sea = 3,
			Mobs = { "Cocoa Warrior", "Chocolate Bar Battler", "Candy Rebel", "Sweet Thief" },
		},
	}

	for _, v in ipairs(tbl16) do
		tbl22[v.Name] = v
	end

	tbl22[tbl17.Name] = tbl17

	for _, v in ipairs(tbl18) do
		tbl22[v.Name] = v
	end

	tbl22[tbl19.Name] = tbl19

	tbl13.Has = function(arg)
		if tbl4.Has(arg) or tbl4.Mastery(arg) > 0 or tbl5.Tool(arg) ~= nil then
			return true
		end
		return (tbl20[arg] or arg == "Dragon Breath") and tbl13.OwnsStyle and tbl13.OwnsStyle(arg) or false
	end

	tbl13.Load = function(arg)
		local v = tbl21[arg] or arg
		if tbl5.Tool(arg) or tbl5.Tool(v) then
			return true
		end
		tbl2.Invoke("LoadItem", v)
		return tbl5.Tool(arg) ~= nil or tbl5.Tool(v) ~= nil
	end

	tbl13.EquipStyle = function(arg)
		if tbl13.Load(arg) then
			return true
		end
		local v = tbl22[arg]
		if not v then
			return false, (("Missing style %*"):format(arg))
		end
		return tbl13.BuyStyle(v)
	end

	tbl13.FarmMaterial = function(arg)
		local v = tbl25[arg]
		if not v then
			return false, (("No route for %*"):format(arg))
		end

		if not tbl7.Travel(v.Sea) then
			return false, (("Travel Sea %*"):format(v.Sea))
		end
		local v2 = tbl8.Enemy(v.Mobs)
		if v2 then
			tbl8.Kill(v2)
			return false, arg
		end
		tbl12.TPSpawnMob(v.Mobs)
		return false, (("Waiting %*"):format(arg))
	end

	tbl13.NextBeliSword = function()
		for _, v in ipairs(tbl15) do
			if kaitunConfig.Items[v.Name] and not tbl13.Has(v.Name) and tbl3.Beli.Value >= v.Cost then
				return v
			end
		end
	end

	tbl13.BuyBeliSword = function(arg)
		tbl2.Invoke("BuyItem", arg.Remote)
		tbl4.Refresh(true)
		return tbl13.Has(arg.Name), (("Buy %*"):format(arg.Name))
	end

	tbl13.NextSwordMastery = function()
		for _, v in ipairs(tbl4.Swords()) do
			if v.Mastery < 350 then
				return v
			end
		end
	end

	tbl13.CanHopBossDrop = function(arg)
		local v = tbl.Sea()
		if v ~= arg.Sea then
			return false
		end
		local v2 = tbl13.SeaUnlockCache[v]
		local flag

		if v2 then
			local at = v2.At
			flag = tick() - at < 5
		else
			flag = v2
		end

		if flag then
			return v2.Unlocked
		end
		local flag2

		if v == 1 and tbl3.Level.Value >= 700 then
			local DressrosaQuestProgress = tbl2.Invoke("DressrosaQuestProgress")
			flag2 = type(DressrosaQuestProgress) == "table" and DressrosaQuestProgress.KilledIceBoss == true
		else
			local flag3 = v == 2 and tbl3.Level.Value >= 1500
			flag2 = false

			if flag3 then
				flag2 = tbl2.Invoke("ZQuestProgress", "Check") == 1
			end
		end

		tbl13.SeaUnlockCache[v] = { At = tick(), Unlocked = flag2 }
		return flag2
	end

	tbl13.FarmSwordMastery = function(arg)
		tbl13.Load(arg.Name)
		tbl8.PreferredWeapon = arg.Name
		tbl8.PreferredType = "Sword"
		local Bones, v = tbl13.FarmMaterial("Bones")
		return Bones, (("%* : %*/350 â€¢ %*"):format(arg.Name, arg.Mastery, v or "Farm"))
	end

	tbl13.NextBossDrop = function()
		local value = tbl3.Level.Value

		for _, v in ipairs(tbl14) do
			if kaitunConfig.Items[v.Config] and value >= v.Level and not tbl13.Has(v.Item) then
				local v2 = tbl8.Enemy(v.Boss, true)
				local v3 = tbl13.CanHopBossDrop(v)
				if v2 or v3 then
					return v
				end
			end
		end

		return nil
	end

	tbl13.FarmBossDrop = function(arg)
		if tbl3.Level.Value < arg.Level then
			return tbl12.Farm()
		end

		if not tbl7.Travel(arg.Sea) then
			return false, (("Travel Sea %*"):format(arg.Sea))
		end

		if arg.Item == "Rengoku" and tbl5.Tool("Hidden Key") then
			tbl5.Equip("Hidden Key")
			tbl7.To(CFrame.new(6571, 297, -6965))
			return false, "Opening Rengoku chest"
		end

		local v = tbl8.Enemy(arg.Boss, true)

		if v then
			if v.Parent == ReplicatedStorage then
				tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
			else
				tbl8.Kill(v)
			end

			return false, v.Name
		end

		if not tbl13.CanHopBossDrop(arg) then
			return tbl12.Farm()
		end
		local dropHopAt = tbl13.DropHopAt
		if tick() - dropHopAt < 60 then
			return tbl12.Farm()
		end
		tbl13.DropHopAt = tick()
		tbl10.Hop()
		return false, (("Find %*"):format(arg.Item))
	end

	tbl13.Saber = function()
		if not tbl7.Travel(1) then
			return false, "Travel Sea 1"
		end
		local map = Workspace:FindFirstChild("Map")
		local jungle = map and map:FindFirstChild("Jungle")
		map = map and map:FindFirstChild("Desert")
		if not jungle or not map then
			return false, "Missing Saber map"
		end

		if jungle.Final.Part.CanCollide then
			if jungle.QuestPlates.Door.CanCollide then
				for _, child in pairs(jungle.QuestPlates:GetChildren()) do
					local button = child:FindFirstChild("Button")

					if button and button:FindFirstChild("TouchInterest") then
						firetouchinterest(button, tbl.Root, 0)
						firetouchinterest(button, tbl.Root, 1)
					end
				end

				return false, "Jungle plates"
			end

			local burn = map:FindFirstChild("Burn")

			if burn and burn.Part.CanCollide then
				if not tbl5.Tool("Torch") then
					local torch = jungle:FindFirstChild("Torch")
					if not torch then
						return false, "Missing Torch"
					end
					tbl2.Invoke("ProQuestProgress", "GetTorch")

					if not tbl5.Tool("Torch") and torch:IsA("BasePart") then
						firetouchinterest(torch, tbl.Root, 0)
						firetouchinterest(torch, tbl.Root, 1)
					end
				else
					tbl5.Equip("Torch")
					tbl2.Invoke("ProQuestProgress", "DestroyTorch")
					task.wait()

					if burn.Parent then
						burn:Destroy()
					end
				end

				return false, "Desert torch"
			end

			local ProQuestProgress = tbl2.Invoke("ProQuestProgress", "RichSon")

			if ProQuestProgress ~= 0 and ProQuestProgress ~= 1 then
				if not tbl5.Tool("Cup") then
					tbl2.Invoke("ProQuestProgress", "GetCup")
				else
					tbl5.Equip("Cup")
					tbl2.Invoke("ProQuestProgress", "FillCup", tbl.Character:FindFirstChild("Cup"))
					tbl2.Invoke("ProQuestProgress", "SickMan")
				end

				return false, "Sick Man"
			end

			if ProQuestProgress == 0 then
				local v = tbl8.Enemy("Mob Leader", true)

				if v and v.Parent == Workspace.Enemies then
					tbl8.Kill(v)
				elseif v then
					tbl7.To(v.HumanoidRootPart.CFrame)
				end

				return false, "Mob Leader"
			end

			if not tbl5.Tool("Relic") then
				tbl2.Invoke("ProQuestProgress", "RichSon")
			else
				tbl5.Equip("Relic")
				tbl2.Invoke("ProQuestProgress", "PlaceRelic")
			end

			return false, "Place Relic"
		end

		local v = tbl8.Enemy("Saber Expert", true)
		if v and v.Parent == Workspace.Enemies then
			tbl8.Kill(v)
			return false, "Saber Expert"
		end

		if v then
			tbl7.To(v.HumanoidRootPart.CFrame)
			return false, "Waiting Saber Expert"
		end

		if kaitunConfig.Items.Godhuman and not tbl13.Has("Godhuman") then
			return tbl13.Godhuman()
		end
		return tbl12.Farm()
	end

	tbl13.BuyStyle = function(arg)
		local v = tbl24[arg.Name]
		local v2 = tbl.Sea()

		if arg.Name == "Death Step" then
			if tbl2.Invoke(arg.Remote, true) == 3 then
				if v2 ~= 2 then
					tbl7.Travel(2)
					return false, "Travel Sea 2"
				end
				tbl8.StopAttack()
				local libraryAt = tbl13.LibraryAt
				if tick() - libraryAt < 2 then
					return false, "Opening Library"
				end

				if tbl5.Tool("Library Key") then
					tbl5.Equip("Library Key")
					local character = tbl.Character
					if not character or not character:FindFirstChild("Library Key") then
						return false, "Equip Library Key"
					end
					local cframe = CFrame.new(6375.32568, 296.664825, -6842.70605, -0.67479372, -2.92396907e-09, -0.738006353, 2.7116652e-08, 1, -2.87560074e-08, 0.738006353, -3.94166371e-08, -0.67479372)
					if tbl.Distance(cframe) > 10 then
						tbl7.To(cframe)
						return false, "Bring Library Key"
					end
					tbl7.Stop()
					tbl2.Invoke("OpenLibrary")
					tbl13.LibraryAt = tick()
					tbl13.StyleCache[arg.Name] = nil
					return false, "Open Library"
				end

				local v3 = tbl8.Enemy("Awakened Ice Admiral", true)

				if v3 then
					if v3.Parent == Workspace.Enemies then
						tbl8.Kill(v3)
					else
						tbl7.To(v3.HumanoidRootPart.CFrame)
					end
				end

				return false, "Library Key"
			end
		elseif arg.Name == "Electric Claw" then
			local v3 = tbl2.Invoke(arg.Remote, true)
			local cframe = CFrame.new(-12550, 338, -7470)

			if not v3 then
				if not tbl7.Travel(3) then
					return false, "Travel Sea 3"
				end
				tbl7.To(cframe)

				if (cframe.Position - tbl.Root.Position).Magnitude <= 30 then
					tbl2.Invoke(arg.Remote, "Start")
				end

				return false, "Claiming Electric Claw Quest"
			end

			if v3 == 4 then
				tbl2.Invoke(arg.Remote, "Start")
				tbl7.To(CFrame.new(-12550, 338, -7470))
			end
		end

		local v3 = v and v[v2]

		if not v3 and v then
			local n2 = v[2] and 2 or 3
			if n2 == 2 and tbl3.Level.Value < 700 or n2 == 3 and tbl3.Level.Value < 1500 then
				return tbl12.Farm()
			end

			if not tbl7.Travel(n2) then
				return false, (("Travel Sea %*"):format(n2))
			end
			return false, (("Travel Sea %*"):format(n2))
		end

		if v3 and tbl.Distance(v3) > 10 then
			tbl7.To(v3)
			return false, (("Find %* NPC"):format(arg.Name))
		end

		if arg.Name == "Dragon Breath" then
			local BlackbeardReward = tbl2.Invoke("BlackbeardReward", "DragonClaw", "1", true)

			if tbl3.Fragments.Value < 1500 and BlackbeardReward ~= 1 then
				tbl13.FragmentTarget = 1500
				tbl13.FragmentTask = "Dragon Breath"
				return false, "Need Fragments"
			end

			tbl2.Invoke("BlackbeardReward", "DragonClaw", "1")
			tbl2.Invoke("BlackbeardReward", "DragonClaw", "2")
		elseif arg.Name == "Electric Claw" then
			local v4 = tbl2.Invoke(arg.Remote, true)
			local cframe = CFrame.new(-12550, 338, -7470)

			if not v4 then
				if not tbl7.Travel(3) then
					return false, "Travel Sea 3"
				end
				tbl7.To(cframe)

				if (cframe.Position - tbl.Root.Position).Magnitude <= 30 then
					tbl2.Invoke(arg.Remote, "Start")
				end

				return false, "Claiming Electric Claw Quest"
			end

			if v4 == 4 then
				tbl2.Invoke(arg.Remote, "Start")
				tbl7.To(CFrame.new(-12550, 338, -7470))
				return false, "Previous Hero quest"
			end

			tbl2.Invoke(arg.Remote)
		elseif arg.Name == "Death Step" then
			tbl2.Invoke(arg.Remote)
		elseif arg.Name == "Sharkman Karate" then
			local v4 = tbl2.Invoke(arg.Remote, true)

			if type(v4) == "string" and string.find(v4, "house keys", 1, true) then
				local v5 = tbl8.Enemy("Tide Keeper", true)

				if v5 then
					if v5.Parent == Workspace.Enemies then
						tbl8.Kill(v5)
					else
						tbl7.To(v5.HumanoidRootPart.CFrame)
					end
				end

				return false, "Water Key"
			end

			tbl2.Invoke(arg.Remote)
		elseif arg.Name == "Dragon Talon" then
			if tbl2.Invoke(arg.Remote, true) == "Set your heart ablaze." then
				if tbl5.Tool("Fire Essence") then
					tbl2.Invoke(arg.Remote)
					return false, "Use Fire Essence"
				end

				if tbl4.Get("Fire Essence") then
					tbl13.Load("Fire Essence")
				else
					tbl13.FarmMaterial("Bones")
				end

				return false, "Fire Essence"
			end

			tbl2.Invoke(arg.Remote)
		else
			tbl2.Invoke(arg.Remote)
		end

		tbl13.StyleCache[arg.Name] = nil
		return false, (("Buy %*"):format(arg.Name))
	end

	tbl13.OwnsStyle = function(arg, arg2)
		local v = tbl21[arg] or arg
		if tbl5.Tool(arg) or tbl5.Tool(v) or tbl4.Mastery(arg) > 0 then
			return true
		end
		local v2 = tbl13.StyleCache[arg]
		local flag = not arg2 and v2

		if flag then
			local time = v2.Time
			flag = tick() - time < 5
		end

		if flag then
			return v2.Value
		end
		local flag2

		if arg == "Dragon Breath" then
			flag2 = tbl2.Invoke("BlackbeardReward", "DragonClaw", "1", true) == 1
		elseif tbl20[arg] then
			flag2 = tbl2.Invoke(tbl20[arg], true) == 1
		else
			flag2 = false
		end

		tbl13.StyleCache[arg] = { Value = flag2, Time = tick() }
		return flag2
	end

	tbl13.StyleMastery = function(arg)
		local v = tbl4.Mastery(arg)
		local v2 = tbl5.Tool(arg)
		local level

		if v2 then
			level = v2
		else
			level = tbl5.Tool(tbl21[arg] or arg)
		end

		level = level and level:FindFirstChild("Level")
		return math.max(v, level and tonumber(level.Value) or 0)
	end

	tbl13.Godhuman = function()
		tbl4.Refresh()
		local tool = tbl.Character and tbl.Character:FindFirstChildOfClass("Tool")
		local preferredWeapon = tool and tool.ToolTip == "Melee" and tbl23[tool.Name]

		if preferredWeapon and tbl13.StyleMastery(preferredWeapon) < n then
			tbl8.PreferredWeapon = preferredWeapon
			tbl8.PreferredType = "Melee"
			return tbl12.Farm()
		end

		tbl8.PreferredWeapon = nil
		tbl8.PreferredType = "Melee"

		for _, v in ipairs(tbl16) do
			if tbl13.StyleMastery(v.Name) < n then
				if not tbl13.OwnsStyle(v.Name) then
					if tbl3.Fragments.Value < (v.Fragments or 0) then
						tbl13.FragmentTarget = v.Fragments
						tbl13.FragmentTask = v.Name
						return false, "Need Fragments"
					end

					if tbl3.Beli.Value < (v.Cost or 0) then
						return tbl12.Farm()
					end
					local v2, v3 = tbl13.BuyStyle(v)
					tbl4.Refresh(true)
					return v2, v3
				end

				local v2, v3 = tbl13.EquipStyle(v.Name)
				if not v2 then
					return false, v3 or ("Equip %*"):format(v.Name)
				end
				tbl8.PreferredWeapon = v.Name
				tbl8.PreferredType = "Melee"
				return tbl12.Farm()
			end
		end

		if tbl13.StyleMastery(tbl17.Name) < n then
			if not tbl13.OwnsStyle(tbl17.Name) then
				if tbl3.Beli.Value < tbl17.Cost then
					return tbl12.Farm()
				end
				local v, v2 = tbl13.BuyStyle(tbl17)
				tbl4.Refresh(true)
				return v, v2
			end

			local v, v2 = tbl13.EquipStyle(tbl17.Name)
			if not v then
				return false, v2 or ("Equip %*"):format(tbl17.Name)
			end
			tbl8.PreferredWeapon = tbl17.Name
			tbl8.PreferredType = "Melee"
			return tbl12.Farm()
		end

		for _, v in ipairs(tbl18) do
			if tbl13.StyleMastery(v.Base) < n then
				local v2, v3 = tbl13.EquipStyle(v.Base)
				if not v2 then
					return false, v3 or ("Equip %*"):format(v.Base)
				end
				tbl8.PreferredWeapon = v.Base
				tbl8.PreferredType = "Melee"
				return tbl12.Farm()
			end

			if tbl13.StyleMastery(v.Name) < n then
				if not tbl13.OwnsStyle(v.Name) then
					if tbl3.Beli.Value < (v.Cost or 0) then
						return tbl12.Farm()
					end

					if tbl3.Fragments.Value < (v.Fragments or 0) then
						tbl13.FragmentTarget = v.Fragments
						tbl13.FragmentTask = v.Name
						return false, "Need Fragments"
					end

					if v.Name == "Death Step" and tbl2.Invoke(v.Remote, true) == 3 then
						return tbl13.BuyStyle(v)
					end
					local v2, v3 = tbl13.BuyStyle(v)
					tbl4.Refresh(true)
					return v2, v3
				end

				local v2, v3 = tbl13.EquipStyle(v.Name)
				if not v2 then
					return false, v3 or ("Equip %*"):format(v.Name)
				end
				tbl8.PreferredWeapon = v.Name
				tbl8.PreferredType = "Melee"
				return tbl12.Farm()
			end
		end

		for _, v in ipairs({ { "Fish Tail", 20 }, { "Magma Ore", 20 }, { "Mystic Droplet", 10 }, { "Dragon Scale", 10 } }) do
			local v2 = v[2]
			if tbl4.Quantity(v[1]) < v2 then
				return tbl13.FarmMaterial(v[1])
			end
		end

		if tbl3.Beli.Value < 5000000 then
			return tbl12.Farm()
		end

		if tbl3.Fragments.Value < 5000 then
			tbl13.FragmentTarget = 5000
			tbl13.FragmentTask = "Godhuman"
			return false, "Need Fragments"
		end

		local v, v2 = tbl13.BuyStyle(tbl19)
		tbl4.Refresh(true)
		return tbl13.Has("Godhuman") or v, v2 or "Buy Godhuman"
	end
end

tbl13.CraftAnchor = function()
	local lastCraft = tbl13.LastCraft
	if tick() - lastCraft < 10 then
		return
	end
	tbl13.LastCraft = tick()

	if not tbl13.Has("Shark Tooth Necklace") then
		tbl2.Invoke("CraftItem", "Craft", "SharkTooth")
	elseif not tbl13.Has("Terror Jaw") then
		tbl2.Invoke("CraftItem", "Craft", "TerrorJaw")
	end

	tbl2.Invoke("CraftItem", "Craft", "SharkAnchor")
	tbl4.Refresh(true)
end

tbl13.SharkAnchor = function()
	if not tbl7.Travel(3) then
		return false, "Travel Sea 3"
	end
	tbl13.CraftAnchor()
	local v = tbl8.Enemy({ "Terrorshark", "Shark", "Piranha", "Fish Crew Member" })
	if v then
		tbl8.Kill(v)
		return false, v.Name
	end
	local boats = Workspace:FindFirstChild("Boats")
	local v2 = nil

	if boats then
		v2 = nil

		for _, child in pairs(boats:GetChildren()) do
			local owner = child:FindFirstChild("Owner")

			if owner and owner.Value == localPlayer and child:FindFirstChild("VehicleSeat") then
				v2 = child
				break
			else
				v2 = nil
			end
		end
	end

	if not v2 then
		local cframe = CFrame.new(-16921, 9, 471)

		if tbl.Distance(cframe) <= 30 then
			tbl2.Invoke("BuyBoat", "Guardian")
		else
			tbl7.To(cframe)
		end

		return false, "Buy Guardian"
	end

	if tbl.Humanoid.Sit then
		v2.VehicleSeat.CFrame = CFrame.new(-45062, 120, 657)
		return false, "Sailing danger 6"
	end
	tbl7.To(v2.VehicleSeat.CFrame * CFrame.new(0, 2, 0))
	return false, "Board Guardian"
end

tbl13.FullMoon = function()
	local sky = Lighting:FindFirstChildOfClass("Sky")
	return Lighting:GetAttribute("MoonPhase") == 5 or sky and string.find(sky.MoonTextureId, "9709149431", 1, true) ~= nil
end

do
	local cframe = CFrame.new(-10139.538, 139.627, 5954.187)
	local n = 75
	local n2 = 3000
	local n3 = 6

	local function fn2()
		local tbl14 = {}
		local tbl15 = {}
		local enemies = Workspace:FindFirstChild("Enemies")
		local tableIterator = pairs
		enemies = enemies and enemies:GetChildren() or {}

		for _, enemy in tableIterator(enemies) do
			if enemy.Name == "Living Zombie" and tbl5.Alive(enemy) then
				local magnitude = (enemy.HumanoidRootPart.Position - cframe.Position).Magnitude

				if magnitude <= n then
					tbl14[#tbl14 + 1] = enemy
				elseif magnitude <= n2 then
					tbl15[#tbl15 + 1] = enemy
				end
			end
		end

		return tbl14, tbl15
	end

	local function fn3()
		local fortBuilderReplicatedSpawnPositi = ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
		local tableIterator = pairs
		fortBuilderReplicatedSpawnPositi = fortBuilderReplicatedSpawnPositi and fortBuilderReplicatedSpawnPositi:GetChildren() or {}
		local v = nil
		local v2 = nil

		for _, v3 in tableIterator(fortBuilderReplicatedSpawnPositi) do
			if v3:IsA("BasePart") and v3.Name == "Living Zombie" then
				local magnitude = (v3.Position - cframe.Position).Magnitude

				if not v or magnitude < v then
					v = magnitude
					v2 = v3
				end
			end
		end

		return v2
	end

	local function fn4(arg)
		local v = nil
		local v2 = nil

		for _, v3 in ipairs(arg) do
			local v4 = tbl.Distance(v3.HumanoidRootPart)

			if not v or v4 < v then
				v = v4
				v2 = v3
			end
		end

		return v2
	end

	local function fn5()
		local v = tbl13.GetGuitarProgress()
		return type(v) == "table" and v.Swamp == true
	end

	tbl13.Swamp = function()
		if type(sethiddenproperty) == "function" then
			pcall(sethiddenproperty, localPlayer, "SimulationRadius", math.huge)
		end

		local v, v2 = fn2()
		local flag = tbl13.SwampGatherAt > 0

		if flag then
			local swampGatherAt = tbl13.SwampGatherAt
			flag = tick() - swampGatherAt >= 25
		end

		if #v >= n3 or flag and #v > 0 then
			tbl13.SwampKilling = true
		end

		if tbl13.SwampKilling and #v > 0 then
			tbl13.SwampGatherAt = 0
			tbl13.SwampEscort = nil
			tbl7.To(cframe * CFrame.new(0, 20, 0))

			for _, v3 in ipairs(v2) do
				tbl8.MoveMob(v3, cframe)
			end

			tbl8.Kill(fn4(v), fn5)
			return false, (("Swamp kill %* left"):format(#v))
		end

		tbl13.SwampKilling = false

		if tbl13.SwampGatherAt == 0 then
			tbl13.SwampGatherAt = tick()
		end

		if #v == 0 and #v2 == 0 then
			tbl13.SwampEscort = nil
			local v3 = fn3()
			tbl7.To(v3 and v3.CFrame * CFrame.new(0, 20, 0) or cframe * CFrame.new(0, 100, 0))
			return false, "Find Living Zombie"
		end

		local tbl14 = {}
		local n4 = 0

		for _, v3 in ipairs(v2) do
			if tbl8.MoveMob(v3, cframe) then
				n4 += 1
			else
				tbl14[#tbl14 + 1] = v3
			end
		end

		if #v + n4 >= n3 or #tbl14 == 0 then
			tbl7.To(cframe * CFrame.new(0, 100, 0))
			return false, (("Gather zombies %*/%*"):format(#v, 6))
		end
		local swampEscort = tbl13.SwampEscort

		if not swampEscort or not table.find(tbl14, swampEscort) then
			swampEscort = fn4(tbl14)
		end

		tbl13.SwampEscort = swampEscort
		tbl7.To(swampEscort.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
		return false, (("Claim zombie %*/%*"):format(#v + n4, 6))
	end
end

tbl13.GetGuitarProgress = function(arg)
	local flag = not arg
	local flag2

	if flag then
		local guitarAt = tbl13.GuitarAt
		flag2 = tick() - guitarAt < 2
	else
		flag2 = flag
	end

	if flag2 then
		return tbl13.GuitarProgress
	end
	tbl13.GuitarAt = tick()
	tbl13.GuitarProgress = tbl2.Invoke("GuitarPuzzleProgress", "Check")
	return tbl13.GuitarProgress
end

tbl13.CanSkullGuitar = function()
	if type(tbl13.GetGuitarProgress()) == "table" then
		return true
	end
	return tbl13.FullMoon() and (Lighting.ClockTime > 16 or Lighting.ClockTime < 5)
end

tbl13.SkullGuitar = function()
	local v = tbl13.GetGuitarProgress(true)

	if type(v) ~= "table" then
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local cframe = CFrame.new(-8654, 140, 6167)

		if tbl13.FullMoon() and (Lighting.ClockTime > 16 or Lighting.ClockTime < 5) then
			if tbl.Distance(cframe) <= 30 then
				tbl2.Invoke("gravestoneEvent", 2)
				tbl2.Invoke("gravestoneEvent", 2, true)
				tbl13.GuitarAt = 0
			else
				tbl7.To(cframe)
			end

			return false, "Start guitar puzzle"
		end

		tbl7.To(CFrame.new(-9502, 580, 6034))
		return false, "Waiting full moon"
	end

	if not v.Swamp then
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		return tbl13.Swamp()
	end

	tbl13.SwampKilling = false
	tbl13.SwampEscort = nil
	tbl13.SwampGatherAt = 0

	for _, key in ipairs({ "Gravestones", "Ghost", "Pipes", "Trophies" }) do
		if not v[key] then
			if not tbl7.Travel(3) then
				return false, "Travel Sea 3"
			end
			tbl2.Invoke("GuitarPuzzleProgress", key)
			tbl13.GuitarAt = 0
			return false, (("%* puzzle"):format(key))
		end
	end

	if tbl4.Quantity("Ectoplasm") < 250 then
		return tbl13.FarmMaterial("Ectoplasm")
	end

	if tbl4.Quantity("Bones") < 500 then
		return tbl13.FarmMaterial("Bones")
	end

	if tbl4.Quantity("Dark Fragment") < 1 then
		local Darkbeard = tbl8.Enemy("Darkbeard", true)

		if Darkbeard then
			if not tbl7.Travel(2) then
				return false, "Travel Sea 2"
			end

			if Darkbeard.Parent == Workspace.Enemies then
				tbl8.Kill(Darkbeard)
			else
				tbl7.To(CFrame.new(-5719, 48, -782))
			end

			return false, "Darkbeard"
		end

		if tbl5.Tool("Fist of Darkness") then
			if not tbl7.Travel(2) then
				return false, "Travel Sea 2"
			end
			tbl5.Equip("Fist of Darkness")
			tbl7.To(CFrame.new(-5719, 48, -782))
			return false, "Summon Darkbeard"
		end

		local darkbeard = kaitunConfig["Server Hop"].Darkbeard

		if darkbeard then
			local darkHopAt = tbl13.DarkHopAt
			darkbeard = tick() - darkHopAt >= 60
		end

		if darkbeard then
			tbl13.DarkHopAt = tick()
			if tbl10.HopConfigured("Darkbeard") then
				return false, "Hop Darkbeard"
			end
		end

		return tbl12.Farm()
	end

	if tbl3.Fragments.Value < 5000 then
		tbl13.FragmentTarget = 5000
		tbl13.FragmentTask = "Skull Guitar"
		return false, "Need Fragments"
	end

	if not tbl7.Travel(3) then
		return false, "Travel Sea 3"
	end
	tbl2.Invoke("soulGuitarBuy", true)
	tbl2.Invoke("soulGuitarBuy")
	tbl4.Refresh(true)
	return tbl13.Has("Skull Guitar"), "Buy Skull Guitar"
end

local tbl14

tbl14 = {
	IndraColour = 1,
	EliteProgress = 0,
	EliteProgressAt = 0,
	CakeMirrorAt = 0,
	CakeRoute = function(arg)
		local root = tbl.Root
		arg = arg and arg:FindFirstChild("HumanoidRootPart")
		if not root or not arg then
			return false
		end
		local magnitude = (arg.Position - root.Position).Magnitude
		if magnitude < 1500 then
			tbl7.To(arg.CFrame * CFrame.new(0, 30, 0))
			return magnitude < 150
		end
		local map = Workspace:FindFirstChild("Map")
		map = map and map:FindFirstChild("CakeLoaf")
		map = map and map:FindFirstChild("BigMirror")
		map = map and map:FindFirstChild("Main")

		if map and map:FindFirstChild("TouchInterest") then
			local cakeMirrorAt = tbl14.CakeMirrorAt
			if tick() - cakeMirrorAt < 1.5 then
				return false
			end
			tbl14.CakeMirrorAt = tick()
			tbl7.Stop(true)
			tbl7.ClearGate()
			firetouchinterest(root, map, 0)
			task.wait(0.1)
			firetouchinterest(root, map, 1)
			return false
		end

		tbl7.To(CFrame.new(-2124, 69, -12401))
		return false
	end,
	GetEliteProgress = function()
		local eliteProgressAt = tbl14.EliteProgressAt

		if tick() - eliteProgressAt >= 5 then
			tbl14.EliteProgressAt = tick()
			tbl14.EliteProgress = tonumber(tbl2.Invoke("EliteHunter", "Progress")) or tbl14.EliteProgress
		end

		return tbl14.EliteProgress
	end,
	Elite = function()
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local v = tbl8.Enemy({ "Diablo", "Deandre", "Urban" }, true)
		if not v then
			return true, "No elite"
		end

		if not tbl12.Visible(v.Name) then
			tbl2.Invoke("EliteHunter")
			return false, (("Claim %*"):format(v.Name))
		end

		if v.Parent == Workspace.Enemies then
			tbl8.Kill(v, function()
				return not tbl12.Visible(v.Name)
			end)
		else
			tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
		end

		return false, v.Name
	end,
	DoughKing = function()
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local v = tbl8.Enemy("Dough King", true)

		if v then
			if tbl14.CakeRoute(v) then
				if v.Parent == Workspace.Enemies then
					tbl8.Kill(v)
				else
					tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
				end
			end

			return false, "Dough King"
		end

		if tbl5.Tool("God's Chalice") and not tbl5.Tool("Sweet Chalice") then
			if tbl4.Quantity("Conjured Cocoa") < 10 then
				return tbl13.FarmMaterial("Conjured Cocoa")
			end
			tbl2.Invoke("SweetChaliceNpc")
			return false, "Craft Sweet Chalice"
		end

		if tbl5.Tool("Sweet Chalice") then
			tbl5.Equip("Sweet Chalice")
			tbl2.Invoke("CakePrinceSpawner")
			local v2 = tbl8.Enemy({ "Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter" })

			if v2 then
				tbl8.Kill(v2)
			else
				tbl7.To(CFrame.new(-2020, 45, -12029))
			end

			return false, "Summon Dough King"
		end

		if kaitunConfig["Server Hop"]["Dough King"] then
			tbl10.HopConfigured("Dough King")
		end

		return false, "Find Dough King"
	end,
	MirrorFractal = function()
		if tbl4.Has("Mirror Fractal") then
			return true, "Mirror Fractal complete"
		end

		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end

		if tbl8.Enemy("Dough King", true) or tbl5.Tool("God's Chalice") or tbl5.Tool("Sweet Chalice") then
			return tbl14.DoughKing()
		end

		if tbl3.Level.Value < 2800 then
			return false, "Continue leveling"
		end

		if kaitunConfig["Server Hop"]["Dough King"] then
			tbl10.HopConfigured("Dough King")
			return false, "Hop Dough King"
		end
		local v = tbl8.Enemy({ "Diablo", "Deandre", "Urban" }, true)

		if not v then
			tbl2.Invoke("EliteHunter")
			tbl10.HopBoss("Elite")
			return false, "Hop Elite for Chalice"
		end

		if not tbl12.Visible(v.Name) then
			tbl2.Invoke("EliteHunter")
			return false, (("Claim %*"):format(v.Name))
		end

		if v.Parent == Workspace.Enemies then
			tbl8.Kill(v, function()
				return tbl5.Tool("God's Chalice") ~= nil or not tbl12.Visible(v.Name)
			end)
		else
			tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
		end

		return false, (("Chalice : %*"):format(v.Name))
	end,
	CakePrince = function()
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local v = tbl8.Enemy("Cake Prince", true)

		if v then
			if tbl14.CakeRoute(v) then
				if v.Parent == Workspace.Enemies then
					tbl8.Kill(v)
				else
					tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
				end
			end

			return false, "Cake Prince"
		end

		tbl2.Invoke("CakePrinceSpawner")
		local v2 = tbl8.Enemy({ "Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter" })

		if v2 then
			tbl8.Kill(v2)
		else
			tbl12.TPSpawnMob({ "Head Baker", "Baking Staff", "Cake Guard", "Cookie Crafter" })
		end

		return false, "Summon Cake Prince"
	end,
	Darkbeard = function()
		if not tbl7.Travel(2) then
			return false, "Travel Sea 2"
		end
		local Darkbeard = tbl8.Enemy("Darkbeard", true)

		if Darkbeard then
			if Darkbeard.Parent == Workspace.Enemies then
				tbl8.Kill(Darkbeard)
			else
				tbl7.To(CFrame.new(-5719, 48, -782))
			end

			return false, "Darkbeard"
		end

		if tbl5.Tool("Fist of Darkness") then
			tbl5.Equip("Fist of Darkness")
			tbl7.To(CFrame.new(-5719, 48, -782))
			return false, "Summon Darkbeard"
		end

		if kaitunConfig["Server Hop"].Darkbeard then
			tbl10.HopConfigured("Darkbeard")
		end

		return false, "Find Darkbeard"
	end,
	RipIndra = function()
		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local v = tbl8.Enemy({ "rip_indra", "rip_indra True Form" }, true)

		if v then
			if v.Parent == Workspace.Enemies then
				tbl8.Kill(v)
			else
				tbl7.To(CFrame.new(-5359, 424, -2735))
			end

			return false, "rip_indra"
		end

		if tbl5.Tool("God's Chalice") then
			local tbl15 = {}
			local tbl16 = { Name = "Winter Sky", Position = CFrame.new(-5420, 1085, -2667) }
			local tbl17 = { Name = "Pure Red", Position = CFrame.new(-5414, 310, -2212) }
			local tbl18 = { Name = "Snow White", Position = CFrame.new(-4971, 332, -3720) }
			tbl15[1] = tbl16
			tbl15[2] = tbl17
			tbl15[3] = tbl18
			local v2 = tbl15[tbl14.IndraColour]

			if v2 then
				tbl2.Invoke("activateColor", v2.Name)
				tbl7.To(v2.Position)

				if tbl.Distance(v2.Position) <= 10 then
					tbl14.IndraColour = tbl14.IndraColour + 1
				end

				return false, v2.Name
			end

			tbl5.Equip("God's Chalice")
			tbl7.To(CFrame.new(-5564, 320, -2663))
			return false, "Summon rip_indra"
		end

		if kaitunConfig["Server Hop"]["Rip Indra"] then
			tbl10.HopConfigured("Rip Indra")
		end

		return false, "Find rip_indra"
	end,
}

local tbl15

tbl15 = {
	FruitPrices = nil,
	FruitPricesAt = 0,
	TrevorBusy = false,
	HumanV3 = { Index = 1, Targets = nil, Hit = false, WaitUntil = nil },
	UnlockSea2 = function()
		if tbl.Sea() == 2 then
			return true, "Sea 2 unlocked"
		end
		local DressrosaQuestProgress = tbl2.Invoke("DressrosaQuestProgress")

		if type(DressrosaQuestProgress) ~= "table" then
			if tbl2.Invoke("DressrosaQuestProgress", "Dressrosa") == 0 then
				tbl2.Invoke("TravelDressrosa")
			end

			return false, "Checking Sea 2"
		end

		if DressrosaQuestProgress.KilledIceBoss then
			tbl2.Invoke("TravelDressrosa")
			return false, "Travel Dressrosa"
		end

		if not DressrosaQuestProgress.UsedKey then
			if not tbl5.Tool("Key") then
				local cframe = CFrame.new(4851.87, 5.69, 718.47)

				if tbl.Distance(cframe) > 12 then
					tbl7.To(cframe)
				else
					tbl2.Invoke("DressrosaQuestProgress", "Detective")
				end

				return false, "Get Detective Key"
			end

			tbl5.Equip("Key")
			local map = Workspace:FindFirstChild("Map")
			map = map and map:FindFirstChild("Ice")
			map = map and map:FindFirstChild("Door")
			local cFrame = map and map.CFrame or CFrame.new(1347, 37, -1325)

			if tbl.Distance(cFrame) > 12 then
				tbl7.To(cFrame)
			else
				tbl2.Invoke("DressrosaQuestProgress", "UseKey")

				if map and map:FindFirstChild("TouchInterest") then
					firetouchinterest(tbl.Root, map, 0)
					firetouchinterest(tbl.Root, map, 1)
				end
			end

			return false, "Open Ice Door"
		end

		local v = tbl8.Enemy("Ice Admiral", true)

		if v then
			if v.Parent == ReplicatedStorage then
				tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
			else
				tbl8.Kill(v)
			end
		else
			tbl7.To(CFrame.new(1345, 37, -1329))
		end

		return false, "Defeat Ice Admiral"
	end,
	Bartilo = function()
		if not tbl7.Travel(2) then
			return false, "Travel Sea 2"
		end
		local BartiloQuestProgress = tbl2.Invoke("BartiloQuestProgress", "Bartilo")

		if BartiloQuestProgress == 0 then
			if not tbl12.Visible("Swan Pirate") then
				local bartilo = tbl12.NPC.Bartilo

				if bartilo and tbl.Distance(bartilo) > 25 then
					tbl7.To(bartilo)
				else
					tbl2.Invoke("StartQuest", "BartiloQuest", 1)
				end
			else
				local v = tbl8.Enemy("Swan Pirate")

				if v then
					tbl8.Kill(v, function()
						return not tbl12.Visible("Swan Pirate")
					end)
				else
					tbl12.TPSpawnMob("Swan Pirate")
				end
			end

			return false, "Swan Pirate"
		end

		if BartiloQuestProgress == 1 then
			local Jeremy = tbl8.Enemy("Jeremy", true)

			if Jeremy then
				if Jeremy.Parent == Workspace.Enemies then
					tbl8.Kill(Jeremy)
				else
					tbl7.To(Jeremy.HumanoidRootPart.CFrame)
				end
			end

			return false, "Jeremy"
		end

		if BartiloQuestProgress == 2 then
			tbl2.Invoke("BartiloQuestProgress", "DidPlates")
			return false, "Colosseum plates"
		end
		return true, "Bartilo complete"
	end,
	SwanState = function()
		return tbl2.Invoke("ZQuestProgress", "Check")
	end,
	SwanDone = function()
		local v = tbl15.SwanState()
		return v == 0 or v == 1
	end,
	FlamingoAccess = function()
		return tbl2.Invoke("TalkTrevor", "1") == 0
	end,
	GetFruitPrices = function()
		local flag = not tbl15.FruitPrices
		local flag2

		if flag then
			flag2 = flag
		else
			local fruitPricesAt = tbl15.FruitPricesAt
			flag2 = tick() - fruitPricesAt >= 30
		end

		if flag2 then
			local GetFruits = tbl2.Invoke("GetFruits")
			if type(GetFruits) ~= "table" then
				return nil
			end
			tbl15.FruitPrices = GetFruits
			tbl15.FruitPricesAt = tick()
		end

		return tbl15.FruitPrices
	end,
	FruitPrice = function(arg)
		local tableIterator = pairs
		local tbl16 = tbl15.GetFruitPrices() or {}

		for _, v in tableIterator(tbl16) do
			local name = type(v) == "table" and v.Name
			local num = type(v) == "table" and tonumber(v.Price)
			if name and num and string.find(arg, name, 1, true) then
				return num, name
			end
		end

		return 0, nil
	end,
	TrevorFruit = function()
		local v = tbl15.GetFruitPrices()
		if not v then
			return nil
		end
		local v2 = tbl5.FruitTool()

		if v2 then
			local v3, v4 = tbl15.FruitPrice(v2:GetAttribute("OriginalName"))
			if v3 >= 1000000 then
				return v4
			end
		end

		local v3 = nil
		local v4 = nil

		for _, v5 in pairs(v) do
			local name = type(v5) == "table" and v5.Name
			local num = type(v5) == "table" and tonumber(v5.Price)
			local flag = name and num and num >= 1000000

			if flag then
				flag = tbl4.Has(name)

				if not flag then
					local has = tbl4.Has
					local str = ("%* Fruit"):format(name)
					flag = has(str)
				end
			end

			if flag and (not v3 or num < v3) then
				v3 = num
				v4 = name
			end
		end

		return v4
	end,
	CanUnlockSwan = function()
		if tbl15.SwanDone() then
			tbl15.TrevorBusy = false
			return false
		end

		if not tbl15.FlamingoAccess() then
			local flag = tbl15.TrevorFruit() ~= nil

			if not flag then
				tbl15.TrevorBusy = false
			end

			return flag
		end

		tbl15.TrevorBusy = false
		return tbl8.Enemy("Don Swan", true) ~= nil
	end,
	UnlockSwan = function()
		if not tbl7.Travel(2) then
			return false, "Travel Sea 2"
		end

		if tbl15.SwanDone() then
			tbl15.TrevorBusy = false
			return true, "Don Swan complete"
		end

		if not tbl15.FlamingoAccess() then
			tbl15.TrevorBusy = true
			local v = tbl15.TrevorFruit()
			if not v then
				return false, "No Trevor fruit"
			end
			local v2 = tbl5.FruitTool()

			if v2 and tbl15.FruitPrice(v2:GetAttribute("OriginalName")) < 1000000 then
				if tbl.Humanoid then
					tbl.Humanoid.Health = 0
				end

				return false, "Clear cheap fruit"
			end

			if not v2 then
				tbl2.Invoke("LoadFruit", v)
				task.wait(0.5)
				v2 = tbl5.FruitTool()
			end

			if not v2 then
				return false, "Fruit not loaded"
			end
			tbl5.Equip(v2.Name)

			for i = 1, 3 do
				tbl2.Invoke("TalkTrevor", tostring(i))
			end

			return false, "Unlock Don Swan"
		end

		tbl15.TrevorBusy = false
		local v = tbl8.Enemy("Don Swan", true)
		if not v then
			return false, "Wait Don Swan"
		end

		if v.Parent == Workspace:FindFirstChild("Enemies") then
			tbl8.Kill(v)
		else
			tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
		end

		return false, "Don Swan"
	end,
	UnlockSea3 = function()
		if tbl.Sea() == 3 then
			return true, "Sea 3 unlocked"
		end

		if tbl.Sea() ~= 2 then
			tbl7.Travel(2)
			return false, "Travel Sea 2"
		end

		if tbl2.Invoke("BartiloQuestProgress", "Bartilo") ~= 3 then
			return tbl15.Bartilo()
		end
		tbl2.Invoke("TravelZou")
		local v = tbl15.SwanState()

		if v ~= 0 and v ~= 1 then
			if not tbl15.FlamingoAccess() then
				return tbl15.UnlockSwan()
			end
			local v2 = tbl8.Enemy("Don Swan", true)

			if v2 then
				if v2.Parent == Workspace.Enemies then
					tbl8.Kill(v2)
				else
					tbl7.To(v2.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
				end

				return false, "Don Swan"
			end

			tbl10.Hop()
			return false, "Find Don Swan"
		end

		if v == 1 then
			return false, "Travel Sea 3"
		end
		local map = Workspace:FindFirstChild("Map")
		map = map and map:FindFirstChild("IndraIsland")
		map = map and map:FindFirstChild("Part")

		if not map or tbl.Distance(map) > 1000 then
			local cframe = CFrame.new(-1926.78772, 12.1678171, 1739.80884)
			if tbl.Distance(cframe) > 30 then
				tbl7.To(cframe)
				return false, "Go to King Red Head"
			end
			tbl2.Invoke("ZQuestProgress", "Begin")
			return false, "Start Travel Zou quest"
		end

		local v2 = tbl8.Enemy({ "rip_indra", "rip_indra True Form" }, true)

		if v2 then
			tbl2.Invoke("TravelZou")

			if v2.Parent == Workspace.Enemies then
				tbl8.Kill(v2)
			else
				tbl7.To(v2.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
			end

			return false, "Defeat rip_indra"
		end

		return false, "Wait rip_indra"
	end,
	RaceV2 = function()
		if not tbl7.Travel(2) then
			return false, "Travel Sea 2"
		end
		local Alchemist = tbl2.Invoke("Alchemist", "1")
		if Alchemist == 0 then
			tbl2.Invoke("Alchemist", "2")
			return false, "Start Alchemist"
		end

		if Alchemist == 2 then
			tbl2.Invoke("Alchemist", "3")
			return false, "Buy Race V2"
		end

		if Alchemist == -2 then
			return true, "Race V2 complete"
		end

		if not tbl5.Tool("Flower 1") then
			local flower1 = Workspace:FindFirstChild("Flower1")

			if flower1 then
				tbl7.To(flower1.CFrame)
			end

			return false, "Flower 1"
		end

		if not tbl5.Tool("Flower 2") then
			local flower2 = Workspace:FindFirstChild("Flower2")

			if flower2 then
				tbl7.To(flower2.CFrame)
			end

			return false, "Flower 2"
		end

		if not tbl5.Tool("Flower 3") then
			local tbl16 = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" }
			local v = tbl8.Enemy(tbl16)

			if v then
				tbl8.Kill(v, function()
					return tbl5.Tool("Flower 3") ~= nil
				end)
			else
				tbl12.TPSpawnMob(tbl16)
			end

			return false, "Flower 3"
		end

		tbl2.Invoke("Alchemist", "3")
		return false, "Complete Race V2"
	end,
	RaceV3 = function()
		if not tbl7.Travel(2) then
			return false, "Travel Sea 2"
		end
		local Wenlocktoad = tbl2.Invoke("Wenlocktoad", "1")
		if Wenlocktoad == 0 then
			tbl2.Invoke("Wenlocktoad", "2")
			return false, "Start Race V3"
		end

		if Wenlocktoad == -2 then
			return true, "Race V3 complete"
		end
		local value = tbl3.Race.Value

		if value == "Human" then
			local humanV3 = tbl15.HumanV3

			if humanV3.WaitUntil then
				local waitUntil = humanV3.WaitUntil
				if tick() < waitUntil then
					return false, "Confirm Human kills"
				end

				if tbl3.RaceVersion() >= 3 or tbl2.Invoke("Wenlocktoad", "1") == -2 then
					tbl15.HumanV3 = { Index = 1, Targets = nil, Hit = false, WaitUntil = nil }
					return true, "Race V3 complete"
				end
				tbl15.HumanV3 = { Index = 1, Targets = nil, Hit = false, WaitUntil = nil }
				local BartiloQuestProgress = tbl2.Invoke("BartiloQuestProgress", "Bartilo")
				if tbl3.Level.Value < 1000 or tbl3.RaceVersion() ~= 2 or BartiloQuestProgress ~= 3 or not tbl15.SwanDone() or tbl3.Beli.Value < 2000000 then
					return false, "Human V3 requirements changed"
				end
				tbl10.Hop()
				return false, "Retry Human bosses"
			end

			if not humanV3.Targets then
				local targets = {}
				local Diamond = tbl8.Enemy("Diamond", true)
				local Jeremy = tbl8.Enemy("Jeremy", true)
				local enemy = tbl8.Enemy
				targets[1] = Diamond
				targets[2] = Jeremy

				do
					local values = table.pack(enemy({ "Orbitus", "Fajita" }, true))
					table.move(values, 1, values.n, 3, targets)
				end

				if not targets[1] or not targets[2] or not targets[3] then
					tbl10.Hop()
					return false, "Find all Human bosses"
				end
				humanV3.Targets = targets
			end

			local v = humanV3.Targets[humanV3.Index]

			if tbl5.Alive(v) then
				if v.Parent == Workspace.Enemies then
					tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))

					if tbl8.AttackTarget(v) then
						humanV3.Hit = true
					end
				else
					tbl7.To(v.HumanoidRootPart.CFrame)
				end

				return false, v.Name
			end

			if not humanV3.Hit then
				tbl15.HumanV3 = { Index = 1, Targets = nil, Hit = false, WaitUntil = nil }
				return false, "Human boss lost"
			end
			humanV3.Index = humanV3.Index + 1
			humanV3.Hit = false
			if humanV3.Index <= 3 then
				return false, (("Human kill %*/3"):format(humanV3.Index - 1))
			end
			humanV3.WaitUntil = tick() + 10
			tbl2.Invoke("Wenlocktoad", "3")
			return false, "Confirm Human kills"
		end

		if value == "Mink" then
			local tagged = game:GetService("CollectionService"):GetTagged("_ChestTagged")
			local v = nil
			local v2 = nil

			for _, v3 in pairs(tagged) do
				local parent = v3.Parent and tbl.Distance(v3)
				local flag

				if parent then
					flag = not v or parent < v
				else
					flag = parent
				end

				if flag then
					v = parent
					v2 = v3
				end
			end

			if v2 then
				tbl7.To(v2:GetPivot())
			end

			return false, "Collect chests"
		end

		if value == "Fishman" then
			local seaBeasts = Workspace:FindFirstChild("SeaBeasts")
			local v = nil

			if seaBeasts then
				v = nil

				for _, child in pairs(seaBeasts:GetChildren()) do
					local health = child:FindFirstChild("Health")

					if child.Name == "SeaBeast1" and child:FindFirstChild("HumanoidRootPart") and health and health.Value > 0 then
						v = child
						break
					else
						v = nil
					end
				end
			end

			if v then
				tbl.Humanoid.Sit = false
				tbl5.Equip(nil, "Blox Fruit")
				tbl7.To(v.HumanoidRootPart.CFrame * CFrame.new(0, 80, 0))
				tbl9.Cast()
				return false, "Kill Sea Beast"
			end

			tbl10.Hop()
			return false, "Find Sea Beast"
		end

		if value == "Skypiea" or value == "Ghoul" then
			for _, player in pairs(Players:GetPlayers()) do
				local character = player ~= localPlayer and player.Character
				local race = player:FindFirstChild("Data") and player.Data:FindFirstChild("Race")

				if tbl5.Alive(character) and (value == "Ghoul" or race and race.Value == "Skypiea") then
					tbl7.To(character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
					tbl8.AttackTarget(character)
					return false, (("Fight %*"):format(player.Name))
				end
			end

			tbl10.Hop()
			return false, "Find race target"
		end

		if value == "Cyborg" then
			local Fruit = tbl5.Tool("Fruit")

			if not Fruit then
				for k, v in pairs(tbl4.Refresh()) do
					if v.Type == "Blox Fruit" or string.find(k, "Fruit", 1, true) then
						tbl2.Invoke("LoadFruit", k)
						Fruit = tbl5.Tool("Fruit")
						if not Fruit then
							continue
						end
					else
						continue
					end

					break
				end
			end

			if Fruit then
				tbl5.Equip(Fruit.Name)
				tbl2.Invoke("Wenlocktoad", "3")
			end

			return false, "Feed fruit"
		end

		tbl2.Invoke("Wenlocktoad", "3")
		return false, "Complete Race V3"
	end,
}

do
	local function fn2()
		local mysticIsland = Workspace.Map:FindFirstChild("MysticIsland")
		if not mysticIsland then
			return
		end

		for _, child in pairs(mysticIsland:GetChildren()) do
			if child:IsA("MeshPart") and child.MeshId == "rbxassetid://10153114969" then
				return child
			end
		end
	end

	local function fn3()
		local mysticIsland = Workspace.Map:FindFirstChild("MysticIsland")
		if not mysticIsland then
			return
		end

		for _, descendant in pairs(mysticIsland:GetDescendants()) do
			if descendant:IsA("MeshPart") and descendant.MeshId == "rbxassetid://6105779869" then
				return descendant
			end
		end
	end

	tbl15.PullLever = function()
		if tbl2.Invoke("CheckTempleDoor") then
			return true, "Lever complete"
		end

		if not tbl4.Has("Valkyrie Helm") then
			return tbl14.RipIndra()
		end

		if not tbl4.Has("Mirror Fractal") then
			return tbl14.MirrorFractal()
		end
		local RaceV4Progress = tbl2.Invoke("RaceV4Progress", "Check")
		if RaceV4Progress == 1 then
			tbl2.Invoke("RaceV4Progress", "Begin")
			return false, "Begin Temple"
		end

		if RaceV4Progress == 2 then
			local cframe = CFrame.new(3033, 2281, -7324)

			if tbl.Distance(cframe) <= 10 then
				tbl2.Invoke("RaceV4Progress", "Teleport")
			else
				tbl7.To(cframe)
			end

			return false, "Enter Temple"
		end

		if RaceV4Progress == 3 then
			tbl2.Invoke("RaceV4Progress", "Continue")
			return false, "Continue Temple"
		end

		if not Workspace.Map:FindFirstChild("MysticIsland") then
			if kaitunConfig["Server Hop"]["Mirage Island"] then
				tbl10.HopConfigured("Mirage Island")
			end

			return false, "Find Mirage Island"
		end

		local v = fn2()
		if v and v.Transparency == 0 and not v.CanCollide then
			tbl7.To(v.CFrame)
			return false, "Collect Blue Gear"
		end
		local v2 = fn3()

		if v2 then
			tbl7.To(v2.CFrame)

			if tbl.Distance(v2) <= 15 and (Lighting.ClockTime >= 18 or Lighting.ClockTime < 5) then
				local position = Workspace.CurrentCamera.CFrame.Position
				Workspace.CurrentCamera.CFrame = CFrame.lookAt(Workspace.CurrentCamera.CFrame.Position, Lighting:GetMoonDirection() + position)
				tbl2.CommE:FireServer("ActivateAbility")
			end
		end

		return false, "Activate moon"
	end
end

local tbl16
tbl16 = { Boat = 1, LastStart = 0 }

do
	local tbl17 = {}
	local cframe = CFrame.new(-369.507, 6.73, 5190.75)
	local cframe2 = CFrame.new(-9530.968, 7.22, -8375.256)
	local cframe3 = CFrame.new(-6126.134, 16.508, -2251.773)
	local cframe4 = CFrame.new(3234.833, 9.432, 1602.182)
	local cframe5 = CFrame.new(-9549.828, 21.105, 4685.521)
	local cframe6 = CFrame.new(-963.313, 7.768, -10813.18)
	local cframe7 = CFrame.new(-1933.908, 8.049, -11475.199)
	local cframe8 = CFrame.new(-1933.908, 8.049, -11475.199)
	local cframe9 = CFrame.new
	tbl17[1] = cframe
	tbl17[2] = cframe2
	tbl17[3] = cframe3
	tbl17[4] = cframe4
	tbl17[5] = cframe5
	tbl17[6] = cframe6
	tbl17[7] = cframe7
	tbl17[8] = cframe8

	do
		local values = table.pack(cframe9(2222.733, 5.336, -6261.203))
		table.move(values, 1, values.n, 9, tbl17)
	end

	tbl16.Progress = function()
		local tbl18 = { Good = 0, Evil = 0, Finished = false }
		local CDKQuest = tbl2.Invoke("CDKQuest", "Progress", "Good")

		if type(CDKQuest) == "table" then
			for k, v in pairs(CDKQuest) do
				tbl18[k] = v
			end
		end

		return tbl18
	end

	tbl16.Start = function(arg)
		local lastStart = tbl16.LastStart
		if tick() - lastStart < 1 then
			return
		end
		tbl16.LastStart = tick()

		if arg == "Good" then
			tbl2.Invoke("CDKQuest", "OpenDoor")
		elseif arg == "Evil" then
			tbl2.Invoke("CDKQuest", "Progress", "Evil")
			task.wait(1)
		end

		tbl2.Invoke("CDKQuest", "StartTrial", arg)
	end

	tbl16.NearestMob = function()
		local enemies = Workspace:FindFirstChild("Enemies")
		if not enemies then
			return nil
		end
		local v = nil
		local v2 = nil

		for _, child in pairs(enemies:GetChildren()) do
			local humanoidRootPart = child:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and tbl5.Alive(child) then
				local v3 = tbl.Distance(humanoidRootPart)

				if v3 <= 3000 and (not v or v3 < v) then
					v = v3
					v2 = child
				end
			end
		end

		return v2
	end

	tbl16.HazeMob = function(arg)
		local enemies = Workspace:FindFirstChild("Enemies")
		if not enemies then
			return nil
		end
		local v = nil
		local v2 = nil

		for _, child in pairs(enemies:GetChildren()) do
			local humanoidRootPart = child:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and tbl5.Alive(child) and string.find(child.Name, arg, 1, true) then
				local v3 = tbl.Distance(humanoidRootPart)

				if not v or v3 < v then
					v = v3
					v2 = child
				end
			end
		end

		return v2
	end

	tbl16.Haze = function()
		local questHaze = localPlayer:FindFirstChild("QuestHaze")

		if questHaze then
			for _, child in pairs(questHaze:GetChildren()) do
				if tonumber(child.Value) and tonumber(child.Value) ~= 0 then
					local v = tbl16.HazeMob(child.Name)

					if v then
						tbl8.Kill(v, function()
							return not child.Parent or tonumber(child.Value) == 0
						end)
					else
						local fortBuilderReplicatedSpawnPositi = ReplicatedStorage:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")

						if fortBuilderReplicatedSpawnPositi then
							for _, child2 in pairs(fortBuilderReplicatedSpawnPositi:GetChildren()) do
								if child2:IsA("BasePart") and string.find(child2.Name, child.Name, 1, true) then
									tbl7.To(child2.CFrame * CFrame.new(0, 20, 0))
									break
								end
							end
						end
					end

					return false, (("Haze %* : %*"):format(child.Name, child.Value))
				end
			end
		end

		local enemies = Workspace:FindFirstChild("Enemies")
		local tableIterator = pairs
		enemies = enemies and enemies:GetChildren() or {}
		local v = nil

		for _, enemy in tableIterator(enemies) do
			if tbl5.Alive(enemy) and enemy:FindFirstChild("HazeESP") then
				v = enemy
				break
			else
				v = nil
			end
		end

		if v then
			tbl8.Kill(v)
		end

		return false, "Haze trial"
	end

	tbl16.Yama = function()
		if tbl4.Has("Yama") then
			return true, "Yama complete"
		end

		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end

		if (tonumber(tbl2.Invoke("EliteHunter", "Progress")) or 0) < 30 then
			local v = tbl8.Enemy({ "Diablo", "Deandre", "Urban" }, true)

			if v then
				if v.Parent == Workspace.Enemies then
					tbl8.Kill(v)
				else
					tbl2.Invoke("EliteHunter")
				end
			else
				tbl2.Invoke("EliteHunter")
				tbl10.HopBoss("Elite")
			end

			return false, "Elite Hunter"
		end

		local waterfall = Workspace.Map:FindFirstChild("Waterfall")
		waterfall = waterfall and waterfall:FindFirstChild("SealedKatana")

		if waterfall then
			tbl7.To(waterfall.Hitbox.CFrame)

			if tbl.Distance(waterfall.Hitbox) <= 15 then
				fireclickdetector(waterfall.Hitbox.ClickDetector)
			end
		else
			tbl7.To(CFrame.new(5251, 20, 453))
		end

		return false, "Pull Yama"
	end

	tbl16.Tushita = function()
		if tbl4.Has("Tushita") then
			return true, "Tushita complete"
		end

		if not tbl7.Travel(3) then
			return false, "Travel Sea 3"
		end
		local TushitaProgress = tbl2.Invoke("TushitaProgress")

		if type(TushitaProgress) == "table" and TushitaProgress.OpenedDoor then
			local Longma = tbl8.Enemy("Longma", true)

			if Longma then
				if Longma.Parent == Workspace.Enemies then
					tbl8.Kill(Longma)
				else
					tbl12.TPSpawnMob({ "Longma" })
				end
			else
				tbl10.Hop()
			end

			return false, Longma and "Longma" or "Find Longma"
		end

		if not tbl8.Enemy({ "rip_indra", "rip_indra True Form" }, true) then
			return tbl14.RipIndra()
		end

		if not tbl5.Tool("Holy Torch") then
			tbl7.To(CFrame.new(5717, 19, 252))
		else
			tbl5.Equip("Holy Torch")
			local tableIterator = pairs
			local torches = type(TushitaProgress) == "table" and TushitaProgress.Torches or {}

			for k, torche in tableIterator(torches) do
				if not torche then
					tbl2.Invoke("TushitaProgress", "Torch", k)
					break
				end
			end
		end

		return false, "Holy Torch"
	end

	tbl16.Dimension = function(arg)
		local v = Workspace.Map:FindFirstChild(arg)
		local activePlayers = v and v:FindFirstChild("ActivePlayers")
		local value = activePlayers and activePlayers:FindFirstChild("Value")
		local flag

		if value then
			local name = localPlayer.Name
			flag = tostring(value.Value) == name
		else
			flag = value
		end

		local v2 = flag and v

		if not v2 then
			local str = arg == "HellDimension" and "Soul Reaper" or "Cake Queen"
			local v3 = tbl8.Enemy(str)

			if v3 then
				tbl8.Kill(v3, function()
					local activePlayers2 = v and v:FindFirstChild("ActivePlayers")
					activePlayers2 = activePlayers2 and activePlayers2:FindFirstChild("Value")

					if activePlayers2 then
						local name = localPlayer.Name
						activePlayers2 = tostring(activePlayers2.Value) == name
					end

					return activePlayers2
				end)
			elseif arg == "HellDimension" and tbl5.Tool("Hallow Essence") then
				tbl5.Equip("Hallow Essence")
				tbl7.To(CFrame.new(-8932, 146, 6062))
			elseif kaitunConfig["Server Hop"][str == "Soul Reaper" and "Soul Reaper" or "Cake Queen"] then
				tbl10.HopConfigured(str)
			end

			return false, (("Enter %*"):format(arg))
		end

		local exit = v2:FindFirstChild("Exit")
		if exit and #exit:GetChildren() >= 2 then
			tbl7.To(exit.CFrame)
			return false, (("Leave %*"):format(arg))
		end
		local v3 = tbl8.Enemy({ "Cursed Skeleton", "Cursed Skeleton Boss" })

		if v3 then
			tbl8.Kill(v3, function()
				local exit2 = v2:FindFirstChild("Exit")
				local flag2 = not value.Parent

				if not flag2 then
					local name = localPlayer.Name
					flag2 = tostring(value.Value) ~= name
				end

				return flag2 or exit2 and #exit2:GetChildren() >= 2
			end)

			return false, v3.Name
		end

		for _, child in pairs(v2:GetChildren()) do
			local particles = child:FindFirstChild("Particles")
			particles = particles and particles:FindFirstChild("Main")
			local proximityPrompt = child:FindFirstChildOfClass("ProximityPrompt")

			if string.find(child.Name, "Torch", 1, true) and particles and not particles.Enabled and proximityPrompt then
				tbl7.To(child.CFrame)

				if tbl.Distance(child) <= 15 then
					fireproximityprompt(proximityPrompt)
				end

				return false, child.Name
			end
		end

		return false, arg
	end

	tbl16.BoatQuest = function()
		local v = tbl17[tbl16.Boat]
		if tbl.Distance(v) > 10 then
			tbl7.To(v)
			return false, (("Boat dealer %*/%*"):format(tbl16.Boat, #tbl17))
		end
		local npCs = Workspace:FindFirstChild("NPCs")
		npCs = npCs and npCs:FindFirstChild("Luxury Boat Dealer")

		if npCs then
			tbl2.Invoke("CDKQuest", "BoatQuest", npCs)
			tbl2.Invoke("CDKQuest", "BoatQuest", npCs, "Check")
		end

		tbl16.Boat = tbl16.Boat % #tbl17 + 1
		return false, (("Boat dealer %*/%*"):format(tbl16.Boat, #tbl17))
	end
end

tbl16.Run = function()
	if not tbl4.Has("Yama") then
		return tbl16.Yama()
	end

	if not tbl4.Has("Tushita") then
		return tbl16.Tushita()
	end

	for _, v in ipairs({ "Yama", "Tushita" }) do
		if tbl4.Mastery(v) < 350 then
			tbl13.Load(v)
			tbl8.PreferredWeapon = v
			tbl8.PreferredType = "Sword"
			return tbl12.Farm()
		end
	end

	tbl8.PreferredWeapon = nil
	tbl8.PreferredType = nil
	local v = tbl16.Progress()
	local n = tonumber(v.Good) or 0
	local n2 = tonumber(v.Evil) or 0

	if n == 4 and (n2 == 3 or n2 == 4) then
		tbl16.Start("Boss")
		local turtle = Workspace.Map:FindFirstChild("Turtle")
		turtle = turtle and turtle:FindFirstChild("Cursed")
		if not turtle then
			tbl7.To(CFrame.new(-12389, 601, -6548))
			return false, "CDK chamber"
		end
		local v2 = tbl8.Enemy("Cursed Skeleton Boss")

		if v2 then
			local Tushita = tbl5.Tool("Tushita") or tbl5.Tool("Yama")
			if not Tushita then
				tbl13.Load("Tushita")
				return false, "Load CDK sword"
			end
			tbl8.PreferredWeapon = Tushita.Name
			tbl8.PreferredType = "Sword"
			tbl8.Kill(v2)
			return false, "Cursed Skeleton Boss"
		end

		for _, child in pairs(turtle:GetChildren()) do
			local proximityPrompt = child:FindFirstChildOfClass("ProximityPrompt")

			if proximityPrompt and proximityPrompt.Enabled then
				local cFrame = child:IsA("BasePart") and child.CFrame or CFrame.new(-12396, 603, -6502)
				tbl7.To(cFrame)

				if tbl.Distance(cFrame) <= 15 then
					fireproximityprompt(proximityPrompt)
				end

				return false, child.Name
			end
		end

		return false, "CDK boss trial"
	end

	local str = n <= 3 and n ~= -2 and "Good" or "Evil"
	n = str == "Good" and n or n2
	tbl16.Start(str)
	if n >= 0 then
		return false, (("Start %* trial"):format(str))
	end

	if str == "Evil" and n == -3 then
		tbl8.StopAttack()

		if tbl.Humanoid then
			tbl.Humanoid:UnequipTools()
		end

		local v2 = tbl16.NearestMob()
		tbl7.To(v2 and v2.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3) or CFrame.new(-2138.747, 69.983, -12322.691))
		return false, "Pain trial"
	end

	if str == "Evil" and n == -4 then
		return tbl16.Haze()
	end

	if str == "Evil" and n == -5 then
		return tbl16.Dimension("HellDimension")
	end

	if str == "Good" and n == -3 then
		return tbl16.BoatQuest()
	end

	if str == "Good" and n == -4 then
		tbl16.Boat = 1
		local v2 = tbl8.Enemy({ "Forest Pirate", "Mythological Pirate", "Jungle Pirate", "Musketeer Pirate" })

		if v2 then
			tbl8.Kill(v2)
		elseif kaitunConfig["Server Hop"]["Castle Raid"] then
			tbl10.HopConfigured("Castle Raid")
		else
			tbl7.To(CFrame.new(-5043, 548, -3044))
		end

		return false, "Castle raid trial"
	end

	if str == "Good" and n == -5 then
		tbl16.Boat = 1
		return tbl16.Dimension("HeavenlyDimension")
	end
	return false, (("CDK %* %*"):format(str, tostring(n)))
end

local tbl17

tbl17 = {
	"Saber",
	"Yama",
	"Tushita",
	"Godhuman",
	"Skull Guitar",
	"Mirror Fractal",
	"Cursed Dual Katana",
	"Shark Anchor",
	"Rengoku",
	"Dragon Trident",
	"Pole V1",
	"Gravity Blade",
}

local tbl18

tbl18 = {
	Labels = {},
	ItemRows = {},
	Tweens = {},
	Started = tick(),
	Gui = nil,
	Minimized = false,
	Closed = false,
	Anim = 0,
	LastViewport = nil,
}

local tbl19

tbl19 = {
	Main = Color3.fromRGB(13, 19, 27),
	Card = Color3.fromRGB(18, 25, 34),
	Track = Color3.fromRGB(34, 42, 52),
	Stroke = Color3.fromRGB(91, 103, 119),
	Divider = Color3.fromRGB(54, 64, 76),
	Text = Color3.fromRGB(238, 241, 247),
	Subtext = Color3.fromRGB(166, 176, 192),
	Muted = Color3.fromRGB(137, 149, 167),
	Green = Color3.fromRGB(113, 218, 145),
	Green2 = Color3.fromRGB(137, 226, 161),
	Red = Color3.fromRGB(232, 101, 108),
	Button = Color3.fromRGB(31, 39, 50),
}

local v
v = utf8.char(10003)
local v2
v2 = utf8.char(8594)
local fn2

fn2 = function(arg, parent, arg2)
	local instance = Instance.new(arg)
	local tableIterator = pairs
	local tbl20 = arg2 or {}

	for k, v3 in tableIterator(tbl20) do
		instance[k] = v3
	end

	instance.Parent = parent
	return instance
end

local fn3

fn3 = function(arg, arg2)
	return fn2("UICorner", arg, { CornerRadius = UDim.new(0, arg2) })
end

local fn4

fn4 = function(arg, arg2)
	return fn2("UIStroke", arg, { Color = tbl19.Stroke, Transparency = arg2 or 0.48, Thickness = 1 })
end

local fn5

fn5 = function(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
	return fn2("TextLabel", arg, {
		Position = arg3,
		Size = arg4,
		BackgroundTransparency = 1,
		Text = arg2,
		TextColor3 = arg6 or tbl19.Text,
		Font = arg7 or Enum.Font.Gotham,
		TextSize = arg5 or 16,
		TextXAlignment = arg8 or Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextTruncate = Enum.TextTruncate.AtEnd,
	})
end

local fn6, fn7, fn8, ScreenGui, Frame, UIScale, Frame2, UIStroke, starting, TextButton
local TextButton2, TextButton3

do
	local function fn9(arg, arg2, arg3)
		local Frame3 = fn2("Frame", arg, {
			Position = arg2,
			Size = arg3,
			BackgroundColor3 = tbl19.Card,
			BackgroundTransparency = 0.07,
			BorderSizePixel = 0,
		})

		fn3(Frame3, 13)
		fn4(Frame3, 0.48)
		return Frame3
	end

	fn6 = function(arg, arg2, arg3)
		local Frame3 = fn2("Frame", arg, {
			Position = arg2,
			Size = arg3,
			BackgroundColor3 = tbl19.Track,
			BorderSizePixel = 0,
			ClipsDescendants = true,
		})

		fn3(Frame3, 5)
		fn4(Frame3, 0.64)
		local Frame4 = fn2("Frame", Frame3, { Size = UDim2.fromScale(0, 1), BackgroundColor3 = tbl19.Green, BorderSizePixel = 0 })
		fn3(Frame4, 5)
		fn2("UIGradient", Frame4, { Color = ColorSequence.new(tbl19.Green, tbl19.Green2) })
		return Frame4
	end

	fn7 = function(arg, arg2)
		local subtext = tbl19.Subtext
		local gothamMedium = Enum.Font.GothamMedium
		return fn5(arg, arg2, UDim2.fromOffset(19, 8), UDim2.new(1, -38, 0, 22), 13, subtext, gothamMedium)
	end

	fn8 = function(arg, arg2)
		local text = tostring(arg2 or "-")

		if arg and arg.Text ~= text then
			arg.Text = text
		end
	end

	local nightKaitunPepsi = genv.NightKaitunPepsi

	if type(nightKaitunPepsi) == "table" and type(nightKaitunPepsi.unload) == "function" then
		pcall(nightKaitunPepsi.unload)
	end

	genv.NightKaitunPepsi = nil
	local nightKaitun2 = localPlayer.PlayerGui:FindFirstChild("NightKaitun")

	if nightKaitun2 then
		nightKaitun2:Destroy()
	end

	ScreenGui = fn2("ScreenGui", localPlayer.PlayerGui, {
		Name = "NightKaitun",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 50,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = true,
	})

	Frame = fn2("Frame", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(584, 866),
		BackgroundColor3 = tbl19.Main,
		BackgroundTransparency = 0.07,
		BorderSizePixel = 0,
		ClipsDescendants = true,
	})

	UIScale = fn2("UIScale", Frame, { Scale = 1 })
	fn3(Frame, 16)
	fn4(Frame, 0.3)
	local new = ColorSequenceKeypoint.new
	local color = Color3.fromRGB

	fn2("UIGradient", Frame, {
		Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(21, 28, 38)), new(1, color(10, 15, 22)) }),
		Rotation = 90,
	})

	local Frame3 = fn2("Frame", Frame, { Size = UDim2.new(1, 0, 0, 81), BackgroundTransparency = 1, Active = true, ZIndex = 3 })
	local text = tbl19.Text
	local gothamBold = Enum.Font.GothamBold
	fn5(Frame3, "Kaitun", UDim2.fromOffset(27, 12), UDim2.fromOffset(310, 31), 26, text, gothamBold)

	Frame2 = fn2("Frame", Frame3, {
		Position = UDim2.fromOffset(28, 52),
		Size = UDim2.fromOffset(12, 12),
		BackgroundColor3 = tbl19.Green,
		BorderSizePixel = 0,
	})

	fn3(Frame2, 6)
	UIStroke = fn2("UIStroke", Frame2, { Color = tbl19.Green, Transparency = 0.58, Thickness = 4 })
	local text2 = tbl19.Text
	local gotham = Enum.Font.Gotham
	starting = fn5(Frame3, "Starting", UDim2.fromOffset(51, 45), UDim2.fromOffset(260, 24), 16, text2, gotham)

	fn2("Frame", Frame3, {
		Position = UDim2.new(0, 0, 1, -1),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = tbl19.Divider,
		BackgroundTransparency = 0.18,
		BorderSizePixel = 0,
	})

	TextButton = fn2("TextButton", Frame3, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = "",
		AutoButtonColor = false,
		Active = true,
		Selectable = false,
		ZIndex = 4,
	})

	TextButton2 = fn2("TextButton", Frame3, {
		Position = UDim2.new(1, -102, 0, 16),
		Size = UDim2.fromOffset(34, 34),
		BackgroundColor3 = tbl19.Button,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = utf8.char(8212),
		TextColor3 = tbl19.Subtext,
		Font = Enum.Font.GothamMedium,
		TextSize = 22,
		AutoButtonColor = false,
		ZIndex = 5,
	})

	TextButton3 = fn2("TextButton", Frame3, {
		Position = UDim2.new(1, -56, 0, 16),
		Size = UDim2.fromOffset(34, 34),
		BackgroundColor3 = tbl19.Red,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Text = utf8.char(215),
		TextColor3 = tbl19.Subtext,
		Font = Enum.Font.GothamMedium,
		TextSize = 22,
		AutoButtonColor = false,
		ZIndex = 5,
	})

	fn3(TextButton2, 9)
	fn3(TextButton3, 9)

	local Frame4 = fn2("Frame", Frame, {
		Position = UDim2.fromOffset(0, 81),
		Size = UDim2.new(1, 0, 1, -81),
		BackgroundTransparency = 1,
	})

	local udim2 = UDim2.fromOffset
	local v3 = fn9(Frame4, UDim2.fromOffset(20, 11), udim2(544, 140))
	local udim22 = UDim2.fromOffset
	local v4 = fn9(Frame4, UDim2.fromOffset(20, 163), udim22(544, 278))
	local udim23 = UDim2.fromOffset
	local v5 = fn9(Frame4, UDim2.fromOffset(20, 453), udim23(544, 101))
	local udim24 = UDim2.fromOffset
	local v6 = fn9(Frame4, UDim2.fromOffset(20, 566), udim24(544, 201))
	fn7(v3, "CURRENT ACTIVITY")
	local text3 = tbl19.Text
	local gothamMedium = Enum.Font.GothamMedium
	local starting2 = fn5(v3, "Starting", UDim2.fromOffset(19, 32), UDim2.fromOffset(405, 29), 21, text3, gothamMedium)
	local subtext = tbl19.Subtext
	local task_ = fn5(v3, "Task: Initializing", UDim2.fromOffset(19, 61), UDim2.fromOffset(405, 23), 16, subtext)
	local subtext2 = tbl19.Subtext
	local v7 = fn5(v3, "Target: -", UDim2.fromOffset(19, 84), UDim2.fromOffset(405, 23), 16, subtext2)
	local udim25 = UDim2.fromOffset
	local v8 = fn6(v3, UDim2.fromOffset(19, 114), udim25(506, 10))

	local Frame5 = fn2("Frame", v3, {
		Position = UDim2.fromOffset(455, 26),
		Size = UDim2.fromOffset(64, 48),
		BackgroundTransparency = 1,
	})

	local Frame6 = fn2("Frame", Frame5, {
		Position = UDim2.fromOffset(8, 20),
		Size = UDim2.fromOffset(46, 24),
		BackgroundColor3 = tbl19.Subtext,
		BorderSizePixel = 0,
	})

	fn2("Frame", Frame5, {
		Position = UDim2.fromOffset(12, 4),
		Size = UDim2.fromOffset(8, 24),
		BackgroundColor3 = tbl19.Subtext,
		BorderSizePixel = 0,
	})

	fn2("Frame", Frame5, {
		Position = UDim2.fromOffset(32, 12),
		Size = UDim2.fromOffset(10, 15),
		BackgroundColor3 = tbl19.Subtext,
		BorderSizePixel = 0,
		Rotation = -32,
	})

	for i = 0, 2 do
		fn2("Frame", Frame6, {
			Position = UDim2.fromOffset(7 + i * 13, 11),
			Size = UDim2.fromOffset(7, 7),
			BackgroundColor3 = tbl19.Main,
			BorderSizePixel = 0,
		})
	end

	local text4 = tbl19.Text
	local gothamMedium2 = Enum.Font.GothamMedium
	local center = Enum.TextXAlignment.Center
	local kaitun = fn5(v3, "Kaitun", UDim2.fromOffset(435, 78), UDim2.fromOffset(100, 21), 14, text4, gothamMedium2, center)
	local muted = tbl19.Muted
	local gotham2 = Enum.Font.Gotham
	local center2 = Enum.TextXAlignment.Center
	local thirdSea = fn5(v3, "Third Sea", UDim2.fromOffset(435, 98), UDim2.fromOffset(100, 18), 11, muted, gotham2, center2)
	fn7(v4, "ITEM TRACKER")

	local ScrollingFrame = fn2("ScrollingFrame", v4, {
		Position = UDim2.fromOffset(17, 37),
		Size = UDim2.fromOffset(510, 224),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ScrollBarThickness = 6,
		ScrollBarImageColor3 = Color3.fromRGB(91, 101, 116),
		ScrollBarImageTransparency = 0.18,
		CanvasSize = UDim2.fromOffset(0, #tbl17 * 32),
		ScrollingDirection = Enum.ScrollingDirection.Y,
	})

	for i, key in ipairs(tbl17) do
		local Frame7 = fn2("Frame", ScrollingFrame, {
			Position = UDim2.fromOffset(0, (i - 1) * 32),
			Size = UDim2.new(1, -9, 0, 32),
			BackgroundTransparency = 1,
		})

		local Frame8 = fn2("Frame", Frame7, {
			Position = UDim2.fromOffset(5, 7),
			Size = UDim2.fromOffset(17, 17),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		})

		fn3(Frame8, 9)
		fn4(Frame8, 0.05)
		local green = tbl19.Green
		local gothamBold2 = Enum.Font.GothamBold
		local center3 = Enum.TextXAlignment.Center
		local v9 = fn5(Frame7, "", UDim2.fromOffset(2, -1), UDim2.fromOffset(24, 31), 22, green, gothamBold2, center3)
		local text5 = tbl19.Text
		local v10 = fn5(Frame7, key, UDim2.fromOffset(42, 0), UDim2.new(1, -130, 1, 0), 16, text5)
		local subtext3 = tbl19.Subtext
		local gotham3 = Enum.Font.Gotham
		local right = Enum.TextXAlignment.Right
		local v11 = fn5(Frame7, "0/1", UDim2.new(1, -82, 0, 0), UDim2.fromOffset(72, 31), 15, subtext3, gotham3, right)

		fn2("Frame", Frame7, {
			Position = UDim2.new(0, 39, 1, -1),
			Size = UDim2.new(1, -47, 0, 1),
			BackgroundColor3 = tbl19.Divider,
			BackgroundTransparency = 0.5,
			BorderSizePixel = 0,
		})

		tbl18.ItemRows[key] = { Circle = Frame8, Done = v9, Name = v10, Count = v11 }
	end

	fn7(v5, "OVERALL PROGRESS")
	local muted2 = tbl19.Muted
	fn5(v5, "ITEMS", UDim2.fromOffset(19, 35), UDim2.fromOffset(67, 28), 17, muted2)
	local text5 = tbl19.Text
	local gothamMedium3 = Enum.Font.GothamMedium
	local v9 = fn5(v5, "0 / 12", UDim2.fromOffset(94, 35), UDim2.fromOffset(120, 28), 18, text5, gothamMedium3)
	local text6 = tbl19.Text
	local gothamBold2 = Enum.Font.GothamBold
	local right = Enum.TextXAlignment.Right
	local v10 = fn5(v5, "0%", UDim2.new(1, -105, 0, 34), UDim2.fromOffset(84, 29), 20, text6, gothamBold2, right)
	local udim26 = UDim2.fromOffset
	local v11 = fn6(v5, UDim2.fromOffset(19, 75), udim26(506, 10))
	fn7(v6, "FARM STATUS")
	local tbl20 = { "Level", "Location", "Quest", "Target", "State" }

	for i, key in ipairs(tbl20) do
		local n = 34 + (i - 1) * 31
		local subtext3 = tbl19.Subtext
		fn5(v6, key, UDim2.fromOffset(19, n), UDim2.fromOffset(160, 30), 16, subtext3)
		local text7 = tbl19.Text
		tbl18.Labels[key] = fn5(v6, "-", UDim2.fromOffset(179, n), UDim2.fromOffset(346, 30), 16, text7)

		if i < #tbl20 then
			fn2("Frame", v6, {
				Position = UDim2.fromOffset(19, n + 30),
				Size = UDim2.fromOffset(506, 1),
				BackgroundColor3 = tbl19.Divider,
				BackgroundTransparency = 0.54,
				BorderSizePixel = 0,
			})
		end
	end

	local TextButton4 = fn2("TextButton", ScreenGui, {
		Position = UDim2.fromOffset(18, 18),
		Size = UDim2.fromOffset(132, 42),
		BackgroundColor3 = tbl19.Main,
		BackgroundTransparency = 0.07,
		BorderSizePixel = 0,
		Text = "Kaitun  +",
		TextColor3 = tbl19.Text,
		Font = Enum.Font.GothamMedium,
		TextSize = 15,
		AutoButtonColor = false,
		Visible = false,
	})

	fn3(TextButton4, 13)
	fn4(TextButton4, 0.3)
	tbl18.Gui = ScreenGui
	tbl18.Panel = Frame

	local function fn10(arg, arg2, arg3, arg4)
		local v12 = tbl18.Tweens[arg]

		if v12 then
			pcall(v12.Cancel, v12)
		end

		local tween = TweenService:Create(arg2, TweenInfo.new(arg3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), arg4)
		tbl18.Tweens[arg] = tween
		tween:Play()
		return tween
	end

	local function fn11()
		local currentCamera = Workspace.CurrentCamera
		local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
		if tbl18.LastViewport == viewportSize then
			return
		end
		tbl18.LastViewport = viewportSize
		UIScale.Scale = math.clamp(math.min((viewportSize.X - 24) / 584, (viewportSize.Y - 24) / 866), 0.36, 1)
	end

	local function fn12(arg)
		tbl18.Minimized = not arg
		tbl18.Anim = tbl18.Anim + 1
		local anim = tbl18.Anim

		if arg then
			Frame4.Visible = true
			fn10("Panel", Frame, 0.2, { Size = UDim2.fromOffset(584, 866) })
		else
			fn10("Panel", Frame, 0.18, { Size = UDim2.fromOffset(584, 81) })

			task.delay(0.18, function()
				if tbl18.Anim == anim and tbl18.Minimized and ScreenGui.Parent then
					Frame4.Visible = false
				end
			end)
		end
	end

	local function fn13(arg, arg2)
		tbl.Track(arg.MouseEnter:Connect(function()
			fn10(arg.Name, arg, 0.12, { BackgroundTransparency = 0.84, BackgroundColor3 = arg2 })
		end))

		tbl.Track(arg.MouseLeave:Connect(function()
			fn10(arg.Name, arg, 0.12, { BackgroundTransparency = 1 })
		end))
	end

	TextButton2.Name = "Minimize"
	TextButton3.Name = "Close"
	fn13(TextButton2, tbl19.Button)
	fn13(TextButton3, tbl19.Red)

	tbl.Track(TextButton2.Activated:Connect(function()
		fn12(tbl18.Minimized)
	end))

	tbl.Track(TextButton3.Activated:Connect(function()
		tbl18.Closed = true
		Frame.Visible = false
		TextButton4.Visible = true
	end))

	tbl.Track(TextButton4.Activated:Connect(function()
		tbl18.Closed = false
		Frame.Visible = true
		TextButton4.Visible = false
	end))

	local flag = false
	local v12 = nil
	local flag2 = nil
	local position = nil
	local n = nil

	tbl.Track(TextButton.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			flag = true
			v12 = input
			flag2 = input.UserInputType == Enum.UserInputType.Touch and input or nil
			position = input.Position
			n = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
		end
	end))

	tbl.Track(TextButton.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			flag2 = input
		end
	end))

	tbl.Track(UserInputService.InputChanged:Connect(function(input)
		if not flag or input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if flag2 and input ~= flag2 and input.UserInputType == Enum.UserInputType.Touch then
			return
		end
		local currentCamera = Workspace.CurrentCamera
		local viewportSize = currentCamera and currentCamera.ViewportSize or Vector2.new(1920, 1080)
		local absoluteSize = Frame.AbsoluteSize
		local n2 = n + input.Position - position
		local n3 = math.clamp(n2.X, 8 + absoluteSize.X / 2, viewportSize.X - 8 - absoluteSize.X / 2)
		local n4 = math.clamp(n2.Y, 8 + absoluteSize.Y / 2, viewportSize.Y - 8 - absoluteSize.Y / 2)
		Frame.Position = UDim2.fromOffset(n3, n4)
	end))

	tbl.Track(UserInputService.InputEnded:Connect(function(input)
		if input == v12 or v12 and v12.UserInputType == Enum.UserInputType.MouseButton1 and input.UserInputType == Enum.UserInputType.MouseButton1 then
			flag = false
			v12 = nil
			flag2 = nil
		end
	end))

	tbl18.Update = function()
		if not ScreenGui.Parent then
			return
		end
		fn11()
		local flag3 = not tbl.Stopped
		local state = tbl.State or "Starting"
		local detail = tbl.Detail or "Running"
		local progressBar = tbl12.Frame()
		local current = progressBar and tbl12.Current
		local mob = current and current.Mob or "-"
		local v13 = tbl.Sea()
		local str = ({ "First Sea", "Second Sea", "Third Sea" })[v13] or ("Sea %*"):format(v13)
		progressBar = progressBar and progressBar:FindFirstChild("progressBar", true)
		local isGuiObject = progressBar and progressBar:IsA("GuiObject")
		local n2 = 0

		if isGuiObject then
			n2 = math.clamp(progressBar.Size.X.Scale, 0, 1)
		end

		fn8(starting, flag3 and "Farming" or "Stopped")
		Frame2.BackgroundColor3 = flag3 and tbl19.Green or tbl19.Red
		UIStroke.Color = flag3 and tbl19.Green or tbl19.Red
		fn8(starting2, current and ("%*  %*  %*"):format(state, v2, current.Mob) or state)
		local v14 = fn8
		local str2 = ("Quest: %*"):format(mob)
		v14(task_, str2)
		local v15 = fn8
		local str3 = ("Target: %*"):format(detail)
		v15(v7, str3)
		fn8(kaitun, current and current.Mob or state)
		fn8(thirdSea, str)
		fn10("ActivityFill", v8, 0.18, { Size = UDim2.fromScale(n2, 1) })
		local tbl21 = { ["Pole V1"] = "Pole (1st Form)" }
		local n3 = 0

		for _, key in ipairs(tbl17) do
			local v16 = tbl13.Has(tbl21[key] or key)

			if v16 then
				n3 += 1
			end

			local v17 = tbl18.ItemRows[key]
			v17.Circle.Visible = not v16
			fn8(v17.Done, v16 and v or "")
			fn8(v17.Count, v16 and "1/1" or "0/1")
			v17.Name.TextColor3 = v16 and tbl19.Subtext or tbl19.Text
			v17.Count.TextColor3 = v16 and tbl19.Subtext or tbl19.Text
		end

		local n4 = n3 / #tbl17
		local v16 = fn8
		local str4 = ("%* / %*"):format(n3, #tbl17)
		v16(v9, str4)
		local v17 = fn8
		local str5 = ("%*%%"):format(math.floor(n4 * 100 + 0.5))
		v17(v10, str5)
		fn10("OverallFill", v11, 0.22, { Size = UDim2.fromScale(n4, 1) })
		fn8(tbl18.Labels.Level, tbl3.Level.Value)
		fn8(tbl18.Labels.Location, str)
		fn8(tbl18.Labels.Quest, mob)
		fn8(tbl18.Labels.Target, detail)
		fn8(tbl18.Labels.State, flag3 and "Farming" or "Stopped")
		tbl18.Labels.State.TextColor3 = flag3 and tbl19.Green or tbl19.Red
	end

	tbl18.Destroy = function()
		for _, tween in pairs(tbl18.Tweens) do
			pcall(tween.Cancel, tween)
		end

		table.clear(tbl18.Tweens)

		if tbl18.Gui then
			tbl18.Gui:Destroy()
		end

		tbl18.Gui = nil
		table.clear(tbl18.Labels)
		table.clear(tbl18.ItemRows)
	end

	fn11()
end

tbl18.Update()

do
	local tbl20

	tbl20 = {
		WorldFruit = function()
			for _, child in pairs(Workspace:GetChildren()) do
				if (child:IsA("Tool") or child:IsA("Model")) and string.find(child.Name, "Fruit", 1, true) and child:FindFirstChild("Handle") then
					return child
				end
			end
		end,
		Collect = function()
			local v3 = tbl20.WorldFruit()
			if not v3 then
				return true, "No fruit"
			end
			local root = tbl.Root
			if not root then
				return false, "Waiting character"
			end

			if v3.Name == "Fruit " then
				tbl7.To(v3.Handle.CFrame)

				if tbl.Distance(v3.Handle) <= 15 then
					firetouchinterest(v3.Handle, root, 1)
					firetouchinterest(v3.Handle, root, 0)
				end
			else
				firetouchinterest(v3.Handle, root, 1)
				firetouchinterest(v3.Handle, root, 0)
			end

			return false, v3.Name
		end,
		Store = function()
			local backpack = localPlayer:FindFirstChild("Backpack")

			for _, v3 in pairs({ tbl.Character, backpack }) do
				if v3 then
					for _, child in pairs(v3:GetChildren()) do
						local attribute = child:IsA("Tool") and child:GetAttribute("OriginalName")

						if attribute then
							tbl2.Invoke("StoreFruit", attribute, child)
						end
					end
				end
			end
		end,
	}

	local tbl21

	tbl21 = {
		Busy = false,
		Active = function()
			local main = localPlayer.PlayerGui:FindFirstChild("Main")
			main = main and main:FindFirstChild("TopHUDList")
			main = main and main:FindFirstChild("RaidTimer")
			return main and main.Visible or false
		end,
		Island = function()
			local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
			worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")
			if not worldOrigin then
				return
			end

			for i = 5, 1, -1 do
				local findFirstChild = worldOrigin.FindFirstChild
				local str = ("Island %*"):format(i)
				local v3 = findFirstChild(worldOrigin, str)
				if v3 then
					return v3
				end
			end
		end,
		CheapFruit = function()
			local tableIterator = pairs
			local tbl22 = tbl15.GetFruitPrices() or {}
			local v3 = nil
			local v4 = nil

			for _, v5 in tableIterator(tbl22) do
				local name = type(v5) == "table" and v5.Name
				local num = type(v5) == "table" and tonumber(v5.Price)
				local flag = name and num and num < 1000000

				if flag then
					flag = tbl4.Has(name)

					if not flag then
						local has = tbl4.Has
						local str = ("%* Fruit"):format(name)
						flag = has(str)
					end
				end

				if flag and (not v3 or num < v3) then
					v3 = num
					v4 = name
				end
			end

			return v4
		end,
		Fragments = function()
			if tbl.Sea() == 3 then
				tbl21.Busy = false
				local v3 = tbl8.Enemy("Cake Prince", true)

				if v3 then
					if tbl14.CakeRoute(v3) then
						if v3.Parent == Workspace.Enemies then
							tbl8.Kill(v3)
						else
							tbl7.To(v3.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
						end
					end

					return false, "Cake Prince"
				end

				local CakePrince, v4 = tbl10.HopBoss("CakePrince")
				return false, CakePrince and "Hop Cake Prince" or v4 or "Find Cake Prince"
			end

			return tbl21.Run()
		end,
		Run = function()
			if tbl.Sea() == 1 then
				tbl7.Travel(2)
				return false, "Travel Sea 2"
			end

			if tbl21.Active() then
				tbl21.Busy = false
				local v3 = tbl8.Enemy({ "Raid Boss", "Island Boy", "Darkbeard" })

				if not v3 then
					local enemies = Workspace:FindFirstChild("Enemies")

					if enemies then
						for _, child in pairs(enemies:GetChildren()) do
							if tbl5.Alive(child) and tbl.Distance(child.HumanoidRootPart) <= 1200 then
								v3 = child
								break
							end
						end
					end
				end

				if v3 then
					tbl8.Kill(v3, function()
						return not tbl21.Active()
					end)
				else
					local v4 = tbl21.Island()

					if v4 then
						tbl7.To(v4.CFrame * CFrame.new(0, 65, 0))
					end
				end

				return false, "Raid active"
			end

			if not tbl5.Tool("Special Microchip") then
				tbl21.Busy = true
				local v3 = tbl5.FruitTool()

				if v3 then
					if tbl15.FruitPrice(v3:GetAttribute("OriginalName")) >= 1000000 then
						return false, "Keep valuable fruit"
					end
					tbl5.Equip(v3.Name)
					tbl2.Invoke("RaidsNpc", "Select", "Dark")
					return false, "Buy raid chip"
				end

				local v4 = tbl21.CheapFruit()
				if v4 then
					tbl2.Invoke("LoadFruit", v4)
					return false, (("Load %*"):format(v4))
				end
				tbl10.Hop()
				return false, "Find raid fruit"
			end

			tbl21.Busy = false
			local map = Workspace:FindFirstChild("Map")

			if tbl.Sea() == 2 then
				map = map and map:FindFirstChild("CircleIsland")
				map = map and map:FindFirstChild("RaidSummon2")
			else
				map = map and map:FindFirstChild("Boat Castle")
				map = map and map:FindFirstChild("RaidSummon2")
			end

			map = map and map:FindFirstChild("Button")
			local main = map and map:FindFirstChild("Main")
			main = main and main:FindFirstChildOfClass("ClickDetector")

			if main then
				fireclickdetector(main)
			else
				tbl7.To(tbl.Sea() == 2 and CFrame.new(-6438, 250, -4501) or CFrame.new(-5017, 315, -2823))
			end

			return false, "Start raid"
		end,
	}

	local tbl22 = { Started = false }

	local function fn9(descendant)
		pcall(function()
			if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Beam") or descendant:IsA("Smoke") or descendant:IsA("Fire") or descendant:IsA("Sparkles") or descendant:IsA("PostEffect") then
				descendant.Enabled = false
			elseif descendant:IsA("BasePart") then
				descendant.CastShadow = false
				descendant.Reflectance = 0
				descendant.Material = Enum.Material.Plastic
			elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
				descendant.Transparency = 1
			elseif descendant:IsA("Explosion") then
				descendant.Visible = false
			end
		end)
	end

	local function fn10(child)
		if child.Name == "Notifications" and child:IsA("ScreenGui") then
			child.Enabled = false
		end
	end

	tbl22.Apply = function()
		if tbl22.Started then
			return
		end
		tbl22.Started = true

		if kaitunConfig.Performance["Anti AFK"] then
			tbl.Track(localPlayer.Idled:Connect(function()
				pcall(function()
					VirtualUser:CaptureController()
					VirtualUser:Button2Down(Vector2.zero, Workspace.CurrentCamera.CFrame)
					task.wait(0.1)
					VirtualUser:Button2Up(Vector2.zero, Workspace.CurrentCamera.CFrame)
				end)
			end))
		end

		if kaitunConfig.Performance["Hide Notifications"] then
			local playerGui = localPlayer:WaitForChild("PlayerGui")

			for _, child in pairs(playerGui:GetChildren()) do
				fn10(child)
			end

			tbl.Track(playerGui.ChildAdded:Connect(fn10))
		end

		if not kaitunConfig.Performance["Fix Lag"] then
			return
		end

		pcall(function()
			Lighting.GlobalShadows = false
			Lighting.FogEnd = 1e9
			local level01 = Enum.QualityLevel.Level01
			settings().Rendering.QualityLevel = level01
			local terrain = Workspace:FindFirstChildOfClass("Terrain")

			if terrain then
				terrain.WaterWaveSize = 0
				terrain.WaterWaveSpeed = 0
				terrain.WaterReflectance = 0
				terrain.WaterTransparency = 1
				terrain.Decoration = false
			end
		end)

		local assets = ReplicatedStorage:FindFirstChild("Assets")
		assets = assets and assets:FindFirstChild("GUI")
		assets = assets and assets:FindFirstChild("DamageCounter")

		if assets then
			assets.Enabled = false
		end

		for k, descendant in pairs(Workspace:GetDescendants()) do
			fn9(descendant)

			if k % 750 == 0 then
				task.wait()
			end
		end

		for _, descendant in pairs(Lighting:GetDescendants()) do
			fn9(descendant)
		end

		tbl.Track(Workspace.DescendantAdded:Connect(fn9))
		tbl.Track(Lighting.DescendantAdded:Connect(fn9))
	end

	local tbl23 = {
		Current = nil,
		LastHaki = 0,
		LastChat = 0,
		LastCode = 0,
		Code = 0,
		LastStat = 0,
		LastBoneRoll = 0,
		NextFruit = 0,
		FruitCost = 0,
	}

	local tbl24 = {
		Enhancement = { "BuyHaki", "Buso" },
		Skyjump = { "BuyHaki", "Geppo" },
		["Flash Step"] = { "BuyHaki", "Soru" },
		Observation = { "KenTalk", "Buy" },
	}

	local tbl25 = {
		"Sub2Fer999",
		"Enyu_is_Pro",
		"JCWK",
		"StarcodeHEO",
		"MagicBUS",
		"KittGaming",
		"Sub2CaptainMaui",
		"Sub2OfficialNoobie",
		"TheGreatAce",
		"Sub2NoobMaster123",
		"Sub2Daigrock",
		"Axiore",
		"StrawHatMaine",
		"TantaiGaming",
		"Bluxxy",
		"SUB2GAMERROBOT_EXP1",
	}

	local function fn11(arg, arg2)
		return { Name = arg, Run = arg2 }
	end

	tbl23.Services = function()
		tbl22.Apply()

		if kaitunConfig.Performance["Lock FPS"] and type(setfpscap) == "function" then
			pcall(setfpscap, tonumber(kaitunConfig.Performance.FPS) or 60)
		end

		if kaitunConfig.Performance["White Screen"] then
			pcall(RunService.Set3dRenderingEnabled, RunService, false)
		end

		local lastHaki = tbl23.LastHaki

		if tick() - lastHaki >= 30 then
			tbl23.LastHaki = tick()

			for k, v3 in pairs(tbl24) do
				if kaitunConfig.Haki[k] then
					tbl2.Invoke(unpack(v3))
				end
			end
		end

		local flag = kaitunConfig["Auto Chat"].Enabled and kaitunConfig["Auto Chat"].Message ~= ""

		if flag then
			local lastChat = tbl23.LastChat
			flag = tick() - lastChat >= 20
		end

		if flag then
			tbl23.LastChat = tick()
			local rbxGeneral = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXGeneral")

			if rbxGeneral then
				pcall(rbxGeneral.SendAsync, rbxGeneral, kaitunConfig["Auto Chat"].Message)
			end
		end

		local flag2 = kaitunConfig.Farm["Redeem Codes"] and tbl23.Code < #tbl25

		if flag2 then
			local lastCode = tbl23.LastCode
			flag2 = tick() - lastCode >= 1
		end

		if flag2 then
			tbl23.LastCode = tick()
			tbl23.Code = tbl23.Code + 1
			local remotes = ReplicatedStorage:FindFirstChild("Remotes")
			remotes = remotes and remotes:FindFirstChild("Redeem")

			if remotes then
				pcall(remotes.InvokeServer, remotes, tbl25[tbl23.Code])
			end
		end

		local flag3 = kaitunConfig.Farm["Random Fruit"] and tbl3.Level.Value >= 50

		if flag3 then
			local nextFruit = tbl23.NextFruit
			flag3 = tick() >= nextFruit
		end

		if flag3 and (tbl23.FruitCost == 0 or tbl3.Beli.Value >= tbl23.FruitCost) then
			if tbl2.Invoke("Cousin", "CheckTime", "DLCBoxData") == true then
				local Cousin, v3 = tbl2.Invoke("Cousin", "DLCBoxData")

				if Cousin == 1 then
					tbl23.FruitCost = 0
					tbl23.NextFruit = tick() + 7200
				elseif Cousin == 2 then
					tbl23.FruitCost = tonumber(v3) or 0
					tbl23.NextFruit = tick() + 30
				else
					tbl23.NextFruit = tick() + 300
				end
			else
				tbl23.NextFruit = tick() + 300
			end
		end

		local autoStats = kaitunConfig["Auto Stats"]
		local flag4 = autoStats.Enabled and tbl3.Points.Value > 0

		if flag4 then
			local lastStat = tbl23.LastStat
			flag4 = tick() - lastStat >= 0.75
		end

		if flag4 then
			tbl23.LastStat = tick()
			local n = tonumber(autoStats.Cap) or 2800
			local arrayIterator = ipairs
			local order = autoStats.Order or {}

			for _, v3 in arrayIterator(order) do
				local v4 = tbl3.Stat(v3)
				if v4 and v4 < n then
					tbl2.Invoke("AddPoint", v3, math.min(tbl3.Points.Value, n - v4))
					break
				end
			end
		end

		if not tbl15.TrevorBusy and not tbl21.Busy then
			tbl20.Store()
		end
	end

	tbl23.Decide = function()
		if tbl20.WorldFruit() then
			return fn11("Collect fruit", tbl20.Collect)
		end

		if tbl.Sea() == 3 then
			local v3 = tbl8.Enemy({ "rip_indra", "rip_indra True Form" }, true)
			local v4 = tbl13.Has("Valkyrie Helm")
			if kaitunConfig.Items["Mirror Fractal"] and not tbl4.Has("Mirror Fractal") and tbl3.Level.Value >= 2300 and (tbl3.Level.Value >= 2800 or tbl8.Enemy("Dough King", true) or tbl5.Tool("God's Chalice") or tbl5.Tool("Sweet Chalice")) then
				return fn11("Mirror Fractal", tbl14.MirrorFractal)
			end

			if kaitunConfig.Items["Cursed Dual Katana"] and tbl3.Level.Value >= 2800 and not tbl4.Has("Tushita") then
				return fn11("Tushita", tbl16.Tushita)
			end

			if kaitunConfig.Progress["Attack Rip Indra"] and v3 and not v4 then
				return fn11("Attack rip_indra", tbl14.RipIndra)
			end

			if kaitunConfig.Items["Cursed Dual Katana"] and tbl3.Level.Value >= 2800 and not tbl4.Has("Yama") then
				return fn11("Yama", tbl16.Yama)
			end

			if tbl5.Tool("God's Chalice") or tbl5.Tool("Sweet Chalice") then
				return fn11("Dough King", tbl14.DoughKing)
			end
		end

		local flag = kaitunConfig.Items.Godhuman and tbl13.StyleMastery("Dark Step") >= 400 and tbl13.StyleMastery("Superhuman") >= 400 and tbl13.StyleMastery("Death Step") < 400

		if flag and tbl3.Beli.Value >= 2500000 and tbl3.Fragments.Value < 5000 then
			tbl13.FragmentTarget = 5000
			tbl13.FragmentTask = "Death Step"
		end

		if tbl13.FragmentTask and tbl13.Has(tbl13.FragmentTask) then
			tbl13.FragmentTarget = nil
			tbl13.FragmentTask = nil
		end

		local fragmentTarget = kaitunConfig.Farm.Fragments and tonumber(kaitunConfig.Farm["Fragment Goal"]) or tbl13.FragmentTarget
		if fragmentTarget and tbl3.Fragments.Value < fragmentTarget then
			return fn11("Farm Fragments", tbl21.Fragments)
		end

		if tbl13.FragmentTarget and tbl3.Fragments.Value >= tbl13.FragmentTarget then
			tbl13.FragmentTarget = nil
			tbl13.FragmentTask = nil
		end

		local n = tbl.Sea() == 3 and tbl14.GetEliteProgress() or 0
		if kaitunConfig.Items["Cursed Dual Katana"] and n >= 30 and not tbl4.Has("Yama") then
			return fn11("Yama", tbl16.Yama)
		end

		if flag then
			return fn11("Death Step", tbl13.Godhuman)
		end

		if kaitunConfig.Items.Saber and tbl3.Level.Value >= 200 and not tbl13.Has("Saber") then
			return fn11("Saber", tbl13.Saber)
		end
		local v3 = tbl13.NextBossDrop()
		if v3 then
			return fn11(v3.Item, function()
				return tbl13.FarmBossDrop(v3)
			end)
		end

		if kaitunConfig.Items["Cursed Dual Katana"] and tbl.Sea() == 3 and tbl3.Level.Value >= 2800 and tbl4.Has("Yama") and tbl4.Has("Tushita") and not tbl13.Has("Cursed Dual Katana") then
			return fn11("Cursed Dual Katana", tbl16.Run)
		end

		if kaitunConfig.Items["Skull Guitar"] and tbl3.Level.Value >= 2300 and not tbl13.Has("Skull Guitar") and tbl13.CanSkullGuitar() then
			return fn11("Skull Guitar", tbl13.SkullGuitar)
		end

		if kaitunConfig.Items["Shark Anchor"] and tbl3.Level.Value >= 2450 and not tbl13.Has("Shark Anchor") then
			return fn11("Shark Anchor", tbl13.SharkAnchor)
		end

		if tbl3.Level.Value >= 700 and tbl.Sea() == 1 then
			return fn11("Unlock Sea 2", tbl15.UnlockSea2)
		end
		local BartiloQuestProgress = tbl.Sea() == 2 and tbl3.Level.Value >= 850 and tbl2.Invoke("BartiloQuestProgress", "Bartilo")
		if BartiloQuestProgress == 0 or BartiloQuestProgress == 2 or BartiloQuestProgress == 1 and tbl8.Enemy("Jeremy", true) then
			return fn11("Bartilo", tbl15.Bartilo)
		end

		if kaitunConfig.Progress["Race V2"] and tbl3.Level.Value >= 850 and tbl3.RaceVersion() < 2 and BartiloQuestProgress == 3 then
			local Alchemist = tbl2.Invoke("Alchemist", "1")
			local flag2 = Lighting.ClockTime > 3 and Lighting.ClockTime < 16
			if Alchemist ~= 1 or tbl5.Tool("Flower 1") or not flag2 then
				return fn11("Race V2", tbl15.RaceV2)
			end
		end

		if tbl3.Level.Value >= 1500 and tbl.Sea() == 2 then
			return fn11("Unlock Sea 3", tbl15.UnlockSea3)
		end

		if tbl.Sea() == 3 and tbl8.Enemy({ "Diablo", "Deandre", "Urban" }, true) then
			return fn11("Elite Hunter", tbl14.Elite)
		end

		if kaitunConfig.Items.Godhuman and not tbl13.Has("Godhuman") then
			return fn11("Godhuman", tbl13.Godhuman)
		end
		local flag2 = kaitunConfig.Progress["Race V3"] and tbl.Sea() == 2 and tbl3.Level.Value >= 1000 and tbl3.RaceVersion() == 2 and BartiloQuestProgress == 3
		local v4 = flag2 and tbl15.SwanDone()
		if flag2 and not v4 and tbl15.CanUnlockSwan() then
			return fn11("Unlock Don Swan", tbl15.UnlockSwan)
		end

		if flag2 and v4 and tbl3.Beli.Value >= 2000000 then
			return fn11("Race V3", tbl15.RaceV3)
		end

		if kaitunConfig.Progress["Attack Rip Indra"] and not tbl13.Has("Valkyrie Helm") and tbl8.Enemy({ "rip_indra", "rip_indra True Form" }, true) then
			return fn11("rip_indra", tbl14.RipIndra)
		end

		if kaitunConfig.Progress["Pull Lever"] and tbl3.RaceVersion() >= 3 and (tbl4.Has("Mirror Fractal") or tbl3.Level.Value >= 2800) and not tbl2.Invoke("CheckTempleDoor") then
			return fn11("Pull Lever", tbl15.PullLever)
		end

		if kaitunConfig.Farm["Melee Mastery"] then
			tbl8.PreferredWeapon = nil
			tbl8.PreferredType = "Melee"
			return fn11("Melee Mastery", tbl12.Farm)
		end

		if kaitunConfig.Farm["Sword Mastery"] then
			tbl8.PreferredWeapon = nil
			tbl8.PreferredType = "Sword"
			return fn11("Sword Mastery", tbl12.Farm)
		end

		if tbl3.Level.Value >= 2800 then
			local v5 = tbl13.NextSwordMastery()
			if v5 then
				return fn11("Unlock Sword Skills", function()
					return tbl13.FarmSwordMastery(v5)
				end)
			end
			tbl8.PreferredWeapon = nil
			tbl8.PreferredType = nil
			if tbl4.Quantity("Bones") < 5000 then
				return fn11("Farm Bones", function()
					return tbl13.FarmMaterial("Bones")
				end)
			end
			return fn11("Cake Prince", tbl14.CakePrince)
		end

		local avoidNearbyPlayers = kaitunConfig["Server Hop"]["Avoid Nearby Players"]

		if avoidNearbyPlayers then
			avoidNearbyPlayers = tbl10.Sync()

			if not avoidNearbyPlayers then
				avoidNearbyPlayers = tbl10.NearPlayer(tonumber(kaitunConfig["Server Hop"]["Nearby Range"]) or 500)
			end
		end

		if avoidNearbyPlayers then
			return fn11("Avoid player", function()
				return tbl10.Hop()
			end)
		end
		return fn11("Farm Level", tbl12.Farm)
	end

	tbl23.Step = function()
		tbl23.Services()
		tbl4.Refresh()
		local v3 = tbl23.Decide()
		tbl23.Current = v3
		tbl.SetState(v3.Name, "Running")
		tbl.Farming = false
		local flag = v3.Name == "Farm Level" and tbl4.Quantity("Bones") > 50
		local flag2

		if flag then
			local lastBoneRoll = tbl23.LastBoneRoll
			flag2 = tick() - lastBoneRoll >= 1
		else
			flag2 = flag
		end

		if flag2 then
			tbl23.LastBoneRoll = tick()
			tbl2.Invoke("Bones", "Buy", 1, 1)
			tbl4.Refresh(true)
		end

		tbl8.TargetTouched = false
		local ok, result, result2 = pcall(v3.Run)

		if not tbl8.TargetTouched then
			tbl8.StopAttack()
		end

		tbl.Farming = false

		if not ok then
			tbl.Detail = tostring(result)
			local warnFunction = warn
			local str = ("[NightKaitun] %*"):format(tostring(result))
			warnFunction(str)
			return
		end

		tbl.Detail = result2 or result and "Complete" or "Running"
	end

	tbl23.Start = function()
		task.spawn(function()
			while not tbl.Stopped do
				local avoidNearbyPlayers = tbl.Farming and kaitunConfig["Server Hop"]["Avoid Nearby Players"]
				local v3

				if avoidNearbyPlayers then
					v3 = tbl10.NearPlayer(tonumber(kaitunConfig["Server Hop"]["Nearby Range"]) or 500)
				else
					v3 = avoidNearbyPlayers
				end

				if v3 then
					tbl10.Hop()
				end

				task.wait(0.5)
			end
		end)

		task.spawn(function()
			while not tbl.Stopped do
				pcall(tbl18.Update)
				task.wait(0.75)
			end
		end)

		task.spawn(function()
			while not tbl.Stopped do
				pcall(function()
					local v3 = tbl13.NextBeliSword()

					if v3 then
						tbl13.BuyBeliSword(v3)
					end
				end)

				task.wait(1)
			end
		end)

		while not tbl.Stopped do
			local ok, result = pcall(tbl23.Step)

			if not ok then
				tbl.Detail = tostring(result)
				local warnFunction = warn
				local str = ("[NightKaitun] Main: %*"):format(tostring(result))
				warnFunction(str)
			end

			task.wait(0.15)
		end
	end

	genv.NightKaitun = {
		Config = kaitunConfig,
		Context = tbl,
		Inventory = tbl4,
		Scheduler = tbl23,
		Stop = function()
			tbl.Stopped = true
			tbl7.Stop()
			tbl7.DisableNoClip()
			tbl18.Destroy()

			for _, connection in pairs(tbl.Connections) do
				pcall(connection.Disconnect, connection)
			end

			table.clear(tbl.Connections)
			pcall(RunService.Set3dRenderingEnabled, RunService, true)
		end,
	}

	tbl8.Start()
	tbl23.Start()
end
