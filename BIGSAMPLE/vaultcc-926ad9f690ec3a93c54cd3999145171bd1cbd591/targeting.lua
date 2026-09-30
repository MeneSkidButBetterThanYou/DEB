if not LPH_OBFUSCATED then
	LPH_JIT = function(Function)
		return Function
	end
	--
	LPH_JIT_MAX = function(Function)
		return Function
	end
	--
	LPH_NO_VIRTUALIZE = function(Function)
		return Function
	end
	--
	LPH_NO_UPVALUES = function(Function)
		return function(...)
			return Function(...)
		end
	end
	--
	LPH_ENCSTR = function(String)
		return String
	end
	--
	LPH_ENCNUM = function(Number)
		return Number
	end
	--
	LPH_CRASH = function()
		return rconsoleprint("DEBUG: CLIENT CALLED CRASH")
	end
	--

	if not getgenv then
		getgenv = function()
			return _G
		end
	end

	if not cloneref then
		cloneref = function(Reference)
			return Reference
		end
	end

	if not loadfile then
		loadfile = function(...)
			return ...
		end
	end

	if not readfile then
		readfile = function(...)
			return ...
		end
	end

	if not request then
		request = function(...)
			return ...
		end
	end

	if not clonefunction then
		clonefunction = function(f)
			return f
		end
	end

	if not newcclosure then
		newcclosure = function(...)
			return ...
		end
	end

	if not hookfunction then
		hookfunction = function() end
	end

	if not getrenv then
		getrenv = function()
			return {}
		end
	end
end

--local Directories = getgenv().Modules.Directories
--local Entities = getgenv().Modules.Entities
local Entities = { whitelist = {} }
getgenv().Modules = {}

--// Modules

local DataStoreService = game:GetService("DataStoreService")
local Players = game.GetService(game, "Players")
local Workspace = game.GetService(game, "Workspace")
local TweenService = game.GetService(game, "TweenService")
local RunService = game.GetService(game, "RunService")
local UserInputService = game.GetService(game, "UserInputService")
local HttpService = game.GetService(game, "HttpService")
local GuiService = game.GetService(game, "GuiService")
local soundService = game.GetService(game, "SoundService")
local Lighting = game.GetService(game, "Lighting")
local Stats = cloneref(game:GetService("Stats"))
local Terrain = workspace.Terrain

local Camera = Workspace.CurrentCamera
local viewportSize = Camera.ViewportSize
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local GuiSpace = gethui and gethui() or Client.PlayerGui
local Utility = {}
local Requests = {}
local Debris = cloneref(game:GetService("Debris"))
local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)

local function IsPartVisible(origin, targetPart)
	if not origin or not targetPart or not targetPart:IsA("BasePart") then
		return false
	end

	local direction = targetPart.Position - origin
	if direction.Magnitude <= 0 then
		return true
	end

	local raycastParams = RaycastParams.new()
	raycastParams.FilterType = Enum.RaycastFilterType.Exclude
	raycastParams.IgnoreWater = true
	raycastParams.FilterDescendantsInstances = {
		Client.Character,
		Camera,
	}

	local result = Workspace:Raycast(origin, direction, raycastParams)
	if not result then
		return true
	end

	local hit = result.Instance
	local targetModel = targetPart:FindFirstAncestorOfClass("Model")
	return hit == targetPart or (targetModel and hit:IsDescendantOf(targetModel)) == true
end

local RunService = game:GetService("RunService")
local core_gui = game:GetService("CoreGui")
local http_service = game:GetService("HttpService")

local Targeting_Object = {}
Targeting_Object.__index = Targeting_Object

if game.GameId == 1054526971 then -- Blackhawk
	local ClientService
	local ReplicatorService

	for _,v in getgc(false) do
	    if typeof(v) ~= 'function' then
			continue
		end

		local info = debug.getinfo(v)
		local name = info.name or ""
		local line = info.currentline or ""
		local source = info.source or ""

		if name == "_sendInvites" and source:find("ActionInterface") then
		    local upv = debug.getupvalues(v)
			if typeof(upv[1]) ~= 'table' then
				game.Players.LocalPlayer:Kick("err_1 : ClientService upvalue was not a table, script requires update. Please report to dev")
				return
			end

			ClientService = upv[1]
		elseif name == "DoEmote" and source:find("ActionInterface") then
		    local upv = debug.getupvalues(v)
			if typeof(upv[1]) ~= 'table' then
				game.Players.LocalPlayer:Kick("err_2 : ReplicatorService upvalue was not a table, script requires update. Please report to dev")
				return
			end

			ReplicatorService = upv[1]
		end

		if ClientService and ReplicatorService then break end
	end

	local function get_client(entry)
		if not entry then
			return nil
		end
		if type(entry) == "table" then
			if entry.Owner or entry.Character or entry.Actor then
				return entry
			end
		elseif entry:IsA("Player") and ClientService then
			return ClientService.Clients[entry] or ClientService:GetClientFromPlayer(entry)
		end
		return nil
	end

	local function get_actor(entry)
		local client = get_client(entry)
		if client and client.Actor then
			return client.Actor
		end
		if type(entry) == "table" and entry.Character and entry.Owner then
			return entry
		end
		if ReplicatorService and type(entry) == "string" then
			return ReplicatorService.Actors[entry]
		end
		if ReplicatorService and typeof(entry) == "Instance" and entry:IsA("Player") then
			return ReplicatorService:GetFromPlayer(entry)
		end
		return nil
	end

	function Targeting_Object:get_local_client()
	    return ClientService.LocalClient
	end

	function Targeting_Object:get_client(entry)
		return get_client(entry)
	end

	function Targeting_Object:get_actor(entry)
		return get_actor(entry)
	end

	function Targeting_Object:get_clients()
		return ClientService and ClientService:GetClients() or {}
	end

	function Targeting_Object:get_actors()
		return ReplicatorService and ReplicatorService:GetActors() or {}
	end

	function Targeting_Object:get_character(player)
		local actor = get_actor(player)

		if actor and actor.Character then
			return actor.Character
		end
		if type(player) == "table" and player.Character then
			return player.Character
		end
		if typeof(player) == "Instance" and player:IsA("Model") then
			return player
		end
		return nil
	end

	function Targeting_Object:get_owner(entry)
		local actor = get_actor(entry)
		local client = get_client(entry)
		return (actor and actor.Owner) or (client and client.Owner)
	end

	function Targeting_Object:get_uid(entry)
		local actor = get_actor(entry)
		return actor and actor.UID
	end

	function Targeting_Object:is_local(entry)
		local actor = get_actor(entry)
		local client = get_client(entry)
		return (actor and actor.IsLocalPlayer) == true or (client and client.IsLocalClient) == true
	end

	function Targeting_Object:get_weapon(player)
		local character = self:get_character(player)
		if not character then
			return nil
		end

		local holding = character:FindFirstChild("Holding")
		if holding then
			if holding:IsA("ValueBase") and holding.Value ~= nil then
				return tostring(holding.Value)
			end
			return holding.Name
		end

		local tool = character:FindFirstChildWhichIsA("Tool")
		if tool then
			return tool.Name
		end

		-- Blackhawk attaches weapon models directly to the rig.
		local bodyParts = {
			Root = true,
			Head = true,
			FakeHead = true,
			UpperTorso = true,
			LowerTorso = true,
			LeftUpperArm = true,
			LeftLowerArm = true,
			LeftHand = true,
			RightUpperArm = true,
			RightLowerArm = true,
			RightHand = true,
			LeftUpperLeg = true,
			LeftLowerLeg = true,
			LeftFoot = true,
			RightUpperLeg = true,
			RightLowerLeg = true,
			RightFoot = true,
		}
		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("Tool") or child:IsA("Model") or child:IsA("MeshPart") then
				if not bodyParts[child.Name] and child.Name ~= "Humanoid" then
					return child.Name
				end
			end
		end
		return "None"
	end

	function Targeting_Object:is_friendly(player)
		local client = get_client(player)
		local owner = self:get_owner(player)
		if owner and owner == Client then
			return true
		end
		if client and client.Squad and ClientService and ClientService.LocalClient then
			return client.Squad == ClientService.LocalClient.Squad
		end
		local friendly = type(player) == "table" and player.IsFriendly or nil
		return friendly == true
	end

	function Targeting_Object:get_health(player)
		local actor = get_actor(player)
		if actor and actor.Health ~= nil then
			return actor.Health, actor.MaxHealth or 100
		end
		local character = self:get_character(player)
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			return humanoid.Health, humanoid.MaxHealth
		end
		return 100, 100
	end

	function Targeting_Object:getPart(character, part)
		if not character then
			return nil
		end
		if part == "Root" or part == "HumanoidRootPart" then
			return character:FindFirstChild("Root")
				or character:FindFirstChild("HumanoidRootPart")
				or character:FindFirstChild("Torso")
		end
		return character:FindFirstChild(part, true)
	end

	function Targeting_Object:getName(entry)
		if not entry then
			return nil
		end
		local owner = self:get_owner(entry)
		return (owner and owner.Name) or entry.OwnerName or entry.Name or entry.UID
	end
elseif game.GameId == 113491250 then -- PHANTOM FORCES
	function Targeting_Object:get_character(entry)
		if not entry then
			return nil
		end
		if not entry:getThirdPersonObject() then
			return nil
		end
		return entry:getThirdPersonObject()
	end

	function Targeting_Object:is_friendly(entry)
		return not entry:isEnemy() --entry:IsEneny(); -- not not needed
	end

	function Targeting_Object:get_health(entry)
		return entry:getHealth()
	end

	function Targeting_Object:getPart(Entry, part)
		if part == "Root" then
			part = "Torso"
		end
		return Entry:getBodyPart(part)
	end

	function Targeting_Object:getName(entry)
		if not entry then
			return
		end

		return tostring(entry._player)
	end
	--
elseif game.GameId == 7633926880 then -- BS
	function Targeting_Object:get_character(player)
		--print("called",player)
		if player.Character then
			return player.Character
		end
		return nil
	end

	function Targeting_Object:get_weapon(player)
		--print("called",player)
		if player.Character and player.Character:FindFirstChild("EquippedTool") then
			return player.Character.EquippedTool.Value
		end
		return "None"
	end

	function Targeting_Object:is_friendly(player)
		return player:GetAttribute("Team") and player:GetAttribute("Team") == Client:GetAttribute("Team")
	end

	function Targeting_Object:get_health(player)
		if player.Character then
			local hum = player.Character:FindFirstChildOfClass("Humanoid")
			if hum then
				return hum.Health, hum.MaxHealth
			end
		end
		return 50, 100
	end

	function Targeting_Object:getPart(character, part)
		if part == "Root" or part == "HumanoidRootPart" then
			part = "UpperTorso"
		end
		return game.FindFirstChild(character, part)
	end

	function Targeting_Object:getName(entry)
		if not entry then
			return
		end

		return tostring(entry.Name)
	end
elseif game.GameId == 8307114974 then -- op1
    local refresh_cooldown = 5 -- 5 seconds

    local StateObject = require(game.ReplicatedStorage.Modules.StateObject)

    local characters = StateObject.get_all("Character")

    task.spawn(function()
        while task.wait(refresh_cooldown) do
            characters = StateObject.get_all("Character")
        end
    end)

	function Targeting_Object:get_character(player)
		--print("called",player)
		if typeof(player) == "Instance" and player.Name then
			for i,v in characters do
			    if i.Name == player.Name then
					return v, v.instance
				end
			end
		end
		return nil
	end

	function Targeting_Object:get_viewmodel(player)
		--print("called",player)
		if typeof(player) == "Instance" then
		    local char = Targeting_Object:get_character(player)
			if char and char.values then
			    return char.values.viewmodels or nil
			end
			return nil
		end
		return nil
	end

	function Targeting_Object:get_weapon(player)
		--print("called",player)
		if typeof(player) == "Instance" then
		    local char = Targeting_Object:get_character(player)
			if char and char.values then
			    return char.values.weapon or nil
			end
			return nil
		end
		return nil
	end

	function Targeting_Object:get_weapon_name(player)
		--print("called",player)
		if typeof(player) == "Instance" then
		    local char = Targeting_Object:get_character(player)
			if char and char.values and char.values.weapon then
			    return char.values.weapon.name or "None"
			end
			return "None"
		end
		return "None"
	end

	function Targeting_Object:is_friendly(player)
		return player:GetAttribute("Team") and player:GetAttribute("Team") == Client:GetAttribute("Team")
	end

	function Targeting_Object:get_health(player)
        if typeof(player) == "Instance" then
            local char = Targeting_Object:get_character(player)
           	if char and char.instance and game.FindFirstChild(char.instance, "Humanoid") then -- potential optimization? unsure if findfirstchild is necessary
                local Humanoid = char.instance.Humanoid
                return Humanoid.Health, Humanoid.MaxHealth
           	end
           	return "None"
        end
		return 100, 100
	end

	function Targeting_Object:getPart(viewmodel, part)
	    part = part:lower()

		if part == "root" or part == "humanoidrootpart" then
			part = "torso"
		end

		return game.FindFirstChild(viewmodel, part)
	end

	function Targeting_Object:getName(entry)
		if not entry then
			return
		end

		return tostring(entry.Name)
	end
else -- uni
	function Targeting_Object:get_character(player)
		--print("called",player)
		if player.Character then
			return player.Character
		end
		return nil
	end

	function Targeting_Object:get_weapon(player)
		--print("called",player)
		if player.Character and player.Character:FindFirstChild("EquippedTool") then
			return player.Character.EquippedTool.Value
		end
		return "None"
	end

	function Targeting_Object:is_friendly(player)
		return player.Team and player.Team == Client.Team
	end

	function Targeting_Object:get_health(player)
		if player.Character then
			local hum = player.Character:FindFirstChild("Humanoid")
			if hum then
				return hum.Health, hum.MaxHealth
			end
		end
		return 100, 100
	end

	function Targeting_Object:getPart(character, part)
		if part == "Root" then
			part = "HumanoidRootPart"
		end
		return game.FindFirstChild(character, part)
	end

	function Targeting_Object:getName(entry)
		if not entry then
			return
		end

		return tostring(entry.Name)
	end
	--
end

function Targeting_Object:getClosestPlayerToCenter(PlayerTable, PartList, MaxRange, MaxScreenPoint, MinScreenPoint) -- PartList
	local TargetData = {}
	local smallest = math.huge
	MaxRange = (MaxRange and MaxRange > 0) and MaxRange or math.huge

	for i, player in pairs(PlayerTable) do
		if player == Client then
			continue
		end

		if self:is_friendly(player) then
			continue
		end
		--[[
		if table.find(Entities.whitelist, self:getName(player)) then
			--print("skipped whitelist entry")
			continue
		end
		--]]
		local Char = self:get_character(player)

		if not Char then
			continue
		end

		local root = self:getPart(Char, "Root")

		if not root then
			continue
		end

		local healt, _ = self:get_health(player)

		if not (healt > 0) then
			continue
		end

		local WorldPosition = root.CFrame.p

		if not WorldPosition then
			continue
		end

		local WorldDistance = (Camera.CFrame.p - WorldPosition).Magnitude

		local screenPoint, onscreen = Camera:WorldToViewportPoint(WorldPosition)

		if not onscreen then
			continue
		end

		local screendistance = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
		local part
		local smallest2 = math.huge

		if #PartList == 0 then
			part = self:getPart(Char, "Head")
		else
			for _, ListPart in PartList do
				local realpart = self:getPart(Char, ListPart)
				if not realpart then
					continue
				end

				local screendistance2, onscreen2 = Camera:WorldToViewportPoint(realpart.Position)
				local partDistance = (Vector2.new(screendistance2.X, screendistance2.Y) - screenCenter).Magnitude
				if partDistance < smallest2 then
					smallest2 = partDistance
					part = realpart
				end
			end
		end

		if not part then
			continue
		end

		local isVisible = IsPartVisible(Camera.CFrame.Position, part)

		-- Main logic here after compleitng all the checks to validate any targets left in the table

		if
			(WorldDistance < MaxRange)
			and (screendistance < MaxScreenPoint)
			and (screendistance > MinScreenPoint)
			and (screendistance < smallest)
		then
			smallest = screendistance
			TargetData = {
				["Part"] = part,
				["Player"] = player,
				["Character"] = Char,
				["WorldPosition"] = WorldPosition,
				["ScreenPoint"] = screenPoint,
				["Visible"] = isVisible,
			}
		end
	end
	--table.foreach(TargetData,print)
	return TargetData
end

function Targeting_Object:getClosestPlayerToMouse(PlayerTable, PartList, MaxRange, MaxScreenPoint, MinScreenPoint) -- PartList
	local TargetData = {}
	local smallest = math.huge
	MaxRange = (MaxRange and MaxRange > 0) and MaxRange or math.huge
	local screenCenter = UserInputService:GetMouseLocation()

	for i, player in pairs(PlayerTable) do
		if player == Client then
			continue
		end

		if self:is_friendly(player) then
			continue
		end
		--[[
		if table.find(Entities.whitelist, self:getName(player)) then
			--print("skipped whitelist entry")
			continue
		end
		--]]
		local Char = self:get_character(player)

		if not Char then
			continue
		end

		local root = self:getPart(Char, "Root")

		if not root then
			continue
		end

		local healt, _ = self:get_health(player)

		if not (healt > 0) then
			continue
		end

		local WorldPosition = root.CFrame.p

		if not WorldPosition then
			continue
		end

		local WorldDistance = (Camera.CFrame.p - WorldPosition).Magnitude

		local screenPoint, onscreen = Camera:WorldToViewportPoint(WorldPosition)

		if not onscreen then
			continue
		end

		local screendistance = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
		local part
		local smallest2 = math.huge

		if #PartList == 0 then
			part = self:getPart(Char, "Head")
		else
			for _, ListPart in PartList do
				local realpart = self:getPart(Char, ListPart)
				if not realpart then
					continue
				end

				local screendistance2, onscreen2 = Camera:WorldToViewportPoint(realpart.Position)
				local partDistance = (Vector2.new(screendistance2.X, screendistance2.Y) - screenCenter).Magnitude
				if partDistance < smallest2 then
					smallest2 = partDistance
					part = realpart
				end
			end
		end

		if not part then
			continue
		end

		local isVisible = IsPartVisible(Camera.CFrame.Position, part)

		-- Main logic here after compleitng all the checks to validate any targets left in the table

		if
			(WorldDistance < MaxRange)
			and (screendistance < MaxScreenPoint)
			and (screendistance > MinScreenPoint)
			and (screendistance < smallest)
		then
			smallest = screendistance
			TargetData = {
				["Part"] = part,
				["Player"] = player,
				["Character"] = Char,
				["WorldPosition"] = WorldPosition,
				["ScreenPoint"] = screenPoint,
				["Visible"] = isVisible,
			}
		end
	end
	--table.foreach(TargetData,print)
	return TargetData
end

getgenv().Modules.Targeting = Targeting_Object
return Targeting_Object
