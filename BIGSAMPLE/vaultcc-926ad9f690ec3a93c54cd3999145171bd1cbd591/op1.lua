run_on_actor(getactors()[1], [[
    local ESP = nil
    local playerToViewmodel = {}
    local GetTarget
    do
        --// Luraph Macros

        if LPH_OBFUSCATED == nil then -- Must wrap in an "if" statement: "The macro 'LPH_NO_VIRTUALIZE' cannot be assigned to. Check if LPH_OBFUSCATED is nil before assigning to macros."
    	LPH_NO_VIRTUALIZE = function(...)
    		return ...
    	end
        end

        --// Caching

        local game, workspace = game, workspace
        local assert, loadstring, select, next, type, typeof, pcall, setmetatable, tick, warn = assert, loadstring, select, next, type, typeof, pcall, setmetatable, tick, warn
        local mathfloor, mathabs, mathcos, mathsin, mathrad, mathdeg, mathmin, mathmax, mathclamp, mathrandom = math.floor, math.abs, math.cos, math.sin, math.rad, math.deg, math.min, math.max, math.clamp, math.random
        local stringformat, stringfind, stringchar = string.format, string.find, string.char
        local unpack = table.unpack
        local wait, spawn = task.wait, task.spawn
        local getgenv, getrawmetatable, gethiddenproperty, cloneref, clonefunction = getgenv, getrawmetatable, gethiddenproperty or function(self, Index)
    	return self[Index]
        end, cloneref or function(...)
    	return ...
        end, clonefunction or function(...)
    	return ...
        end

        --// Custom Drawing Library

        if not Drawing or not Drawing.new or not Drawing.Fonts then
            game.Players.LocalPlayer:Kick("please use an executor with a drawing library! we recommend synapse z, you can purchase keys at https://rbxkey.store/")
        end

        --// References


            local cloneref = cloneref or function(...)
    	return ...
            end

            local HttpService, ConfigLibrary = cloneref(game:GetService("HttpService")), {}

            ConfigLibrary.Encode = function(Table)
    	assert(Table, "ConfigLibrary.Encode => Parameter \"Table\" is missing!")
    	assert(type(Table) == "table", "ConfigLibrary.Encode => Parameter \"Table\" must be of type <table>. Type given: <"..type(Table)..">")

    	if Table and type(Table) == "table" then
    		return HttpService:JSONEncode(Table)
    	end
            end
            ConfigLibrary.Decode = function(Content)
    	assert(Content, "ConfigLibrary.Decode => Parameter \"Content\" is missing!")
    	assert(type(Content) == "string", "ConfigLibrary.Decode => Parameter \"Content\" must be of type <string>. Type given: <"..type(Content)..">")

    	return HttpService:JSONDecode(Content)
            end

            ConfigLibrary.Recursive = function(self, Table, Callback)
    	assert(Table, "ConfigLibrary.Recursive => Parameter \"Table\" is missing!")
    	assert(Callback, "ConfigLibrary.Recursive => Parameter \"Callback\" is missing!")
    	assert(type(Table) == "table", "ConfigLibrary.Recursive => Parameter \"Table\" must be of type <table>. Type given: <"..type(Table)..">")
    	assert(type(Callback) == "function", "ConfigLibrary.Recursive => Parameter \"Callback\" must be of type <string>. Type given: <"..type(Callback)..">")

    	for Index, Value in next, Table do
    		Callback(Index, Value)

    		if type(Value) == "table" then
    			self:Recursive(Value, Callback)
    		end
    	end
            end

            ConfigLibrary.EditValue = function(Value)
    	if typeof(Value) == "Color3" then
    		return "Color3_("..math.floor(Value.R * 255)..", "..math.floor(Value.G * 255)..", "..math.floor(Value.B * 255)..")"
    	elseif typeof(Value) == "Vector3" or typeof(Value) == "Vector2" or typeof(Value) == "CFrame" then
    		return typeof(Value).."_("..tostring(Value)..")"
    	elseif typeof(Value) == "EnumItem" then
    		return "EnumItem_("..string.match(tostring(Value), "Enum%.(.+)")..")"
    	end

    	return Value
            end

            ConfigLibrary.RestoreValue = function(Value)
    	if type(Value) == "string" then
    		local Type, Content = string.match(Value, "(%w+)_%((.+)%)")

    		if Type == "Color3" then
    			Content = string.split(Content, ", ")

    			for Index, _Value in next, Content do
    				Content[Index] = tonumber(_Value)
    			end

    			return Color3.fromRGB(table.unpack(Content))
    		elseif Type == "Vector3" or Type == "Vector2" or Type == "CFrame" then
    			Content = string.split(Content, ", ")

    			for Index, _Value in next, Content do
    				Content[Index] = tonumber(_Value)
    			end

    			return getfenv()[Type].new(table.unpack(Content))
    		elseif Type == "EnumItem" then
    			return loadstring("return Enum."..Content)()
    		end
    	end

    	return Value
            end

            ConfigLibrary.CloneTable = function(self, Object, Seen)
    	if type(Object) ~= "table" then return Object end
    	if Seen and Seen[Object] then return Seen[Object] end

    	local LocalSeen = Seen or {}
    	local Result = setmetatable({}, getmetatable(Object))

    	LocalSeen[Object] = Result

    	for Index, Value in next, Object do
    		Result[self:CloneTable(Index, LocalSeen)] = self:CloneTable(Value, LocalSeen)
    	end

    	return Result
            end

            ConfigLibrary.ConvertValues = function(self, Data, Method)
    	assert(Data, "ConfigLibrary.ConvertValues => Parameter \"Data\" is missing!")
    	assert(Method, "ConfigLibrary.ConvertValues => Parameter \"Method\" is missing!")
    	assert(type(Data) == "table", "ConfigLibrary.ConvertValues => Parameter \"Data\" must be of type <table>. Type given: <"..type(Data)..">")
    	assert(type(Method) == "string", "ConfigLibrary.ConvertValues => Parameter \"Method\" must be of type <string>. Type given: <"..type(Method)..">")

    	local Passed, Stack = {[Data] = true}, {Data}

    	repeat
    		local Current = table.remove(Stack) -- "Pop"

    		for Index, Value in next, Current do
    			if type(Value) == "table" and not Passed[Value] then
    				Passed[Value] = true
    				Stack[#Stack + 1] = Value -- "Push" to stack
    			else
    				Current[Index] = self[Method.."Value"](Value)
    			end
    		end
    	until #Stack == 0

    	return Data
            end

            ConfigLibrary.SaveConfig = function(self, Path, Data)
    	assert(Path, "ConfigLibrary.SaveConfig => Parameter \"Path\" is missing!")
    	assert(Data, "ConfigLibrary.SaveConfig => Parameter \"Data\" is missing!")
    	assert(type(Path) == "string", "ConfigLibrary.SaveConfig => Parameter \"Path\" must be of type <string>. Type given: <"..type(Path)..">")
    	assert(type(Data) == "table", "ConfigLibrary.SaveConfig => Parameter \"Data\" must be of type <table>. Type given: <"..type(Data)..">")

    	local Result = self.Encode(self:ConvertValues(self:CloneTable(Data), "Edit"))

    	if select(2, pcall(function() readfile(Path) end)) then
    		self.CreatePath(self, Path, Result)
    	end

    	writefile(Path, Result)
            end

            ConfigLibrary.LoadConfig = function(self, Path)
    	assert(Path, "ConfigLibrary.LoadConfig => Parameter \"Path\" is missing!")
    	assert(type(Path) == "string", "ConfigLibrary.LoadConfig => Parameter \"Path\" must be of type <string>. Type given: <"..type(Path)..">")

    	return self:ConvertValues(self.Decode(readfile(Path)), "Restore")
            end

            ConfigLibrary.CreatePath = function(self, Path, Content)
    	assert(Path, "ConfigLibrary.CreatePath => Parameter \"Path\" is missing!")
    	assert(type(Path) == "string", "ConfigLibrary.CreatePath => Parameter \"Path\" must be of type <string>. Type given: <"..type(Path)..">")

    	local Folders, Destination, File = string.split(Path, "/"), ""
    	File = Folders[#Folders]; table.remove(Folders)

    	for Index = 1, #Folders do
    		Destination = Destination..Folders[Index].."/"

    		if not isfolder(Destination) then
    			makefolder(Destination)
    		end
    	end

    	if not isfile(Destination..File) then
    		writefile(Destination..File, Content or "")
    	end
            end


        local Vector2new, Vector3new, Vector3zero, CFramenew, Instancenew = Vector2.new, Vector3.new, Vector3.zero, CFrame.new, Instance.new
        local Drawingnew, DrawingFonts = Drawing and Drawing.new, Drawing and Drawing.Fonts
        local Color3fromRGB, Color3fromHSV = Color3.fromRGB, Color3.fromHSV
        local WorldToViewportPoint, GetPlayers, GetMouseLocation

        local GameMetatable = getrawmetatable and getrawmetatable(game) or {
    	-- Auxillary functions - if the executor doesn't support "getrawmetatable".

    	__index = LPH_NO_VIRTUALIZE(function(self, Index)
    		return self[Index]
    	end),

    	__newindex = LPH_NO_VIRTUALIZE(function(self, Index, Value)
    		self[Index] = Value
    	end)
        }

        local __index = GameMetatable.__index
        local __newindex = GameMetatable.__newindex

        local getrenderproperty, setrenderproperty = getrenderproperty or __index, setrenderproperty or __newindex

        local _get, _set = LPH_NO_VIRTUALIZE(function(self, Index)
    	return self[Index]
        end), LPH_NO_VIRTUALIZE(function(self, Index, Value)
    	self[Index] = Value
        end)

        if identifyexecutor() == "Solara" then
    	local DrawQuad = loadstring(game.HttpGet(game, "https://raw.githubusercontent.com/Exunys/Custom-Quad-Render-Object/main/Main.lua"))() -- Custom Quad Drawing Object
    	local _Drawingnew = clonefunction(Drawing.new)

    	Drawingnew = LPH_NO_VIRTUALIZE(function(...)
    		return ({...})[1] == "Quad" and DrawQuad(...) or _Drawingnew(...)
    	end)
        end

        local _GetService = __index(game, "GetService")
        local FindFirstChild, WaitForChild = __index(game, "FindFirstChild"), __index(game, "WaitForChild")
        local IsA = __index(game, "IsA")

        local GetService = function(Service)
    	return cloneref(_GetService(game, Service))
        end

        local Workspace = GetService("Workspace")
        local Players = GetService("Players")
        local RunService = GetService("RunService")
        local UserInputService = GetService("UserInputService")
        local StateObject = require(cloneref(game:GetService("ReplicatedStorage")).Modules.StateObject)

        local CurrentCamera = __index(Workspace, "CurrentCamera")
        local LocalPlayer = __index(Players, "LocalPlayer")

        local FindFirstChildOfClass = LPH_NO_VIRTUALIZE(function(self, ...)
    	return typeof(self) == "Instance" and self.FindFirstChildOfClass(self, ...)
        end)

        local Cache = {
    	WorldToViewportPoint = __index(CurrentCamera, "WorldToViewportPoint"),
    	GetPlayers = __index(Players, "GetPlayers"),
    	GetPlayerFromCharacter = __index(Players, "GetPlayerFromCharacter"),
    	GetMouseLocation = __index(UserInputService, "GetMouseLocation")
        }

        WorldToViewportPoint = LPH_NO_VIRTUALIZE(function(...)
    	return Cache.WorldToViewportPoint(CurrentCamera, ...)
        end)

        GetPlayers = LPH_NO_VIRTUALIZE(function()
    	return Cache.GetPlayers(Players)
        end)

        GetPlayerFromCharacter = LPH_NO_VIRTUALIZE(function(...)
    	return Cache.GetPlayerFromCharacter(Players, ...)
        end)

        GetMouseLocation = LPH_NO_VIRTUALIZE(function()
    	return Cache.GetMouseLocation(UserInputService)
        end)

        local IsDescendantOf = LPH_NO_VIRTUALIZE(function(self, ...)
    	return typeof(self) == "Instance" and __index(self, "IsDescendantOf")(self, ...)
        end)

        --// Optimized functions / methods

        local Connect, Disconnect = __index(game, "DescendantAdded").Connect

        do
    	local TemporaryConnection = Connect(__index(game, "DescendantAdded"), function() end)
    	Disconnect = TemporaryConnection.Disconnect
    	Disconnect(TemporaryConnection)
        end

        --// Variables

        local Inf, Nan, Loaded, Restarting, CrosshairParts = 1 / 0, 0 / 0, false, false, {}

        local ValidProperties = {
    	--Color = true,
    	Visible = true,
    	Outline = true,
    	Transparency = true,
    	Thickness = true,
    	Center = true,
    	Filled = true,
    	Radius = true,
    	NumSides = true,
    	Font = true
        }

        --// Core Parameters

        local FrameTick = tick()
        local Rainbow = Color3fromRGB(255, 255, 255)
        local CameraCFrame = __index(CurrentCamera, "CFrame")
        local CameraViewportSize = __index(CurrentCamera, "ViewportSize")

        --// Checking for multiple processes

        if ExunysDeveloperESP and ExunysDeveloperESP.Exit then
    	ExunysDeveloperESP:Exit()
        end

        --// Settings

        getgenv().ExunysDeveloperESP = {
    	DeveloperSettings = {
    		Path = "Exunys Developer/Exunys ESP/Configuration.cfg",
    		UnwrapOnCharacterAbsence = false,
    		DisableWarnings = false,
    		UpdateMode = "RenderStepped",
    		TeamCheckOption = "Team",
    		SkeletonR6HeightModifier = 0.35, -- 0.0 - 1.0
    		RainbowSpeed = 1, -- Bigger = Slower
    		WidthBoundary = 1.5, -- Smaller value = Bigger width
    		Throttle = false, -- Update tankier functions less frequently. Instead of 60 updates per second, it will be around 30-40 updates per second. Helps preserve FPS.
    		ThrottleStep = 2 -- 2 - 4 - Higher value = Less updates.
    	},

    	Settings = {
    		Enabled = true,
    		PartsOnly = false,
    		TeamCheck = false,
    		AliveCheck = true,
    		EnableTeamColors = false,
    		TeamColor = Color3fromRGB(170, 170, 255),
    		CachePositions = true,
    		EntityESP = false
    	},

    	Properties = {
    		ESP = {
    			Enabled = true,
    			RainbowColor = false,
    			RainbowOutlineColor = false,
    			Offset = 10,
    			RelativeFontSize = true, -- Font size changes depending on the player's distance. Looks better for longer distances.

    			Color = Color3fromRGB(255, 255, 255),
    			Transparency = 1,
    			Size = 14,
    			Font = DrawingFonts.Plex, -- Direct2D Fonts: {UI, System, Plex, Monospace}; ROBLOX Fonts: {Roboto, Legacy, SourceSans, RobotoMono}

    			OutlineColor = Color3fromRGB(0, 0, 0),
    			Outline = true,

    			DisplayDistance = true,
    			DisplayHealth = false,
    			DisplayName = false,
    			DisplayDisplayName = true,
    			DisplayTool = true
    		},

    		Tracer = {
    			Enabled = true,
    			RainbowColor = false,
    			RainbowOutlineColor = false,
    			Position = 1, -- 1 = Bottom; 2 = Center; 3 = Mouse

    			Transparency = 1,
    			Thickness = 1,
    			Color = Color3fromRGB(255, 255, 255),

    			OutlineColor = Color3fromRGB(0, 0, 0),
    			Outline = true
    		},

    		Box = {
    			Enabled = true,
    			RainbowColor = false,
    			RainbowOutlineColor = false,

    			Type = 1, -- 1 = Square; 2 = Quad; 3 = Corner
    			FillSquare = true,
    			FillColor = Color3fromRGB(255, 255, 255),
    			FillRainbowColor = false,
    			FillTransparency = 0.1,
    			LineSize = 14, -- For corner box option: Min = 2; Max = 20

    			Color = Color3fromRGB(255, 255, 255),
    			Transparency = 1,
    			Thickness = 1,

    			OutlineColor = Color3fromRGB(0, 0, 0),
    			Outline = true
    		},

    		HealthBar = {
    			Enabled = true,
    			RainbowOutlineColor = false,
    			Offset = 4,
    			Blue = 100,
    			Position = 3, -- 1 = Top; 2 = Bottom; 3 = Left; 4 = Right

    			Thickness = 1,
    			Transparency = 1,

    			OutlineColor = Color3fromRGB(0, 0, 0),
    			Outline = true
    		},

    		HeadDot = {
    			Enabled = true,
    			RainbowColor = false,
    			RainbowOutlineColor = false,

    			Color = Color3fromRGB(255, 255, 255),
    			Transparency = 1,
    			Thickness = 1,
    			NumSides = 30,
    			Filled = false,

    			OutlineColor = Color3fromRGB(0, 0, 0),
    			Outline = true
    		},

    		Skeleton = {
    			Enabled = false,
    			RainbowColor = false,

    			Transparency = 1,
    			Thickness = 1,
    			Color = Color3fromRGB(255, 255, 255)
    		},

    	},

    	UtilityAssets = {
    		WrappedObjects = {},
    		ServiceConnections = {}
    	}
        }

        local Environment, _warn = getgenv().ExunysDeveloperESP, clonefunction(warn); warn = function(...)
    	return not Environment.DeveloperSettings.DisableWarnings and _warn(...)
        end

        --// Functions

        local function Recursive(Table, Callback)
    	for Index, Value in next, Table do
    		Callback(Index, Value)

    		if type(Value) == "table" then
    			Recursive(Value, Callback)
    		end
    	end
        end

        local CoreFunctions; LPH_NO_VIRTUALIZE(function()
    	CoreFunctions = {
    		ConvertVector = function(Vector)
    			return Vector2new(Vector.X, Vector.Y)
    		end,

    		GetColorFromHealth = function(Health, MaxHealth, Blue)
    			return Color3fromRGB(255 - mathfloor(Health / MaxHealth * 255), mathfloor(Health / MaxHealth * 255), Blue or 0)
    		end,

    		GetRainbowColor = function()
    			local RainbowSpeed = Environment.DeveloperSettings.RainbowSpeed

    			return Color3fromHSV(FrameTick % RainbowSpeed / RainbowSpeed, 1, 1)
    		end,

    		GetLocalCharacterPosition = function()
    			local LocalCharacter = __index(LocalPlayer, "Character")
    			local LocalPlayerCheckPart = LocalCharacter and (__index(LocalCharacter, "PrimaryPart") or FindFirstChild(LocalCharacter, "Head"))

    			return LocalPlayerCheckPart and __index(LocalPlayerCheckPart, "Position") or CameraCFrame.Position
    		end,

    		GenerateHash = function(Bits)
    			local Result = ""

    			for _ = 1, Bits do
    				Result ..= ("EXUNYS_ESP")[mathrandom(1, 2) == 1 and "upper" or "lower"](stringchar(mathrandom(97, 122)))
    			end

    			return Result
    		end,

    		CalculateParameters = function(Object)
    			Object = type(Object) == "table" and Object.Object or Object

    			local Entry = type(Object) == "table" and Object or nil

    			if Entry then
    				Entry._Cache = Entry._Cache or {}
    				local _Cache = Entry._Cache

    				if _Cache.Tick == FrameTick then
    					return _Cache.Position, _Cache.Size, _Cache.Visible, _Cache.Top, _Cache.Bottom
    				end
    			end

    			local DeveloperSettings = Environment.DeveloperSettings
    			local WidthBoundary = DeveloperSettings.WidthBoundary

    			local IsAPlayer, Part = IsA(Object, "Player")

    			if IsAPlayer then
    				local vm = playerToViewmodel[Object]
    				if vm then
    					Part = (__index(vm, "PrimaryPart") or FindFirstChild(vm, "torso") or FindFirstChild(vm, "head"))
    				end
    			else
    				if IsA(Object, "Model") then
    					Part = __index(Object, "PrimaryPart")
    				else
    					Part = Object
    				end
    			end

    			if not Part or IsA(Part, "Player") or IsA(Part, "Model") or not IsDescendantOf(Part, Workspace) then
    				return nil, nil, false, nil, nil
    			end

    			local PartCFrame, PartPosition = __index(Part, "CFrame"), __index(Part, "Position")
    			local PartUpVector = PartCFrame.UpVector

    			local PartParent = __index(Part, "Parent")
    			local RigType = PartParent and FindFirstChild(PartParent, "Torso") and "R6" or "R15"

    			local CameraUpVector = CameraCFrame.UpVector

    			local Top, TopOnScreen = WorldToViewportPoint(PartPosition + (PartUpVector * (RigType == "R6" and 0.5 or 1.8)) + CameraUpVector)
    			local Bottom, BottomOnScreen = WorldToViewportPoint(PartPosition - (PartUpVector * (RigType == "R6" and 4 or 2.5)) - CameraUpVector)

    			local TopX, TopY = Top.X, Top.Y
    			local BottomX, BottomY = Bottom.X, Bottom.Y

    			local Width = mathmax(mathfloor(mathabs(TopX - BottomX)), 3)
    			local Height = mathmax(mathfloor(mathmax(mathabs(BottomY - TopY), Width / 2)), 3)
    			local BoxSize = Vector2new(mathfloor(mathmax(Height / (IsAPlayer and WidthBoundary or 1), Width)), Height)
    			local BoxPosition = Vector2new(mathfloor(TopX / 2 + BottomX / 2 - BoxSize.X / 2), mathfloor(mathmin(TopY, BottomY)))

    			if Entry then
    				local _Cache = Entry._Cache
    				_Cache.Tick = FrameTick
    				_Cache.Position = BoxPosition
    				_Cache.Size = BoxSize
    				_Cache.Visible = (TopOnScreen and BottomOnScreen)
    				_Cache.Top = Top
    				_Cache.Bottom = Bottom
    			end

    			return BoxPosition, BoxSize, (TopOnScreen and BottomOnScreen), Top, Bottom
    		end,

    		Calculate3DQuad = function(_CFrame, SizeVector, YVector)
    			YVector = YVector or SizeVector

    			return {

    				--// Quad 1 - Front

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, SizeVector.Z).Position) -- Bottom Right
    				},


    				--// Quad 2 - Back

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, -SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, -SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, -SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, -SizeVector.Z).Position) -- Bottom Right
    				},

    				--// Quad 3 - Top

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, -SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, -SizeVector.Z).Position) -- Bottom Right
    				},

    				--// Quad 4 - Bottom

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, -SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, -SizeVector.Z).Position) -- Bottom Right
    				},

    				--// Quad 5 - Right

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, YVector.Y, -SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(SizeVector.X, -YVector.Y, -SizeVector.Z).Position) -- Bottom Right
    				},

    				--// Quad 6 - Left

    				{
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, SizeVector.Z).Position), -- Top Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, YVector.Y, -SizeVector.Z).Position), -- Top Right
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, SizeVector.Z).Position), -- Bottom Left
    					WorldToViewportPoint(_CFrame * CFramenew(-SizeVector.X, -YVector.Y, -SizeVector.Z).Position) -- Bottom Right
    				}
    			}
    		end,

    		GetColor = function(Player, DefaultColor)
    			local Settings = Environment.Settings

    			return Settings.EnableTeamColors and Player:GetAttribute("Team") == LocalPlayer:GetAttribute("Team") and Settings.TeamColor or DefaultColor
    		end
    	}
        end)()

        local UpdatingFunctions; LPH_NO_VIRTUALIZE(function()
    	UpdatingFunctions = {
    		ESP = function(Entry, TopTextObject, BottomTextObject)
    			local Settings = Environment.Properties.ESP

    			local Position, Size, OnScreen, Top, Bottom = CoreFunctions.CalculateParameters(Entry)

    			setrenderproperty(TopTextObject, "Visible", OnScreen)
    			setrenderproperty(BottomTextObject, "Visible", OnScreen)

    			if OnScreen then
    				for Index, Value in next, Settings do
    					if ValidProperties[Index] then
    						setrenderproperty(TopTextObject, Index, Value)
    						setrenderproperty(BottomTextObject, Index, Value)
    					end
    				end

    				local FontSize = Settings.RelativeFontSize and mathclamp(mathabs((Top - Bottom).Y) - 3, 6, Settings.Size) or Settings.Size

    				setrenderproperty(TopTextObject, "Size", FontSize)
    				setrenderproperty(BottomTextObject, "Size", FontSize)

    				local GetColor = CoreFunctions.GetColor

    				local MainColor = GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color)
    				local OutlineColor = Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor

    				setrenderproperty(TopTextObject, "Color", MainColor)
    				setrenderproperty(TopTextObject, "OutlineColor", OutlineColor)
    				setrenderproperty(BottomTextObject, "Color", MainColor)
    				setrenderproperty(BottomTextObject, "OutlineColor", OutlineColor)

    				local Offset = mathclamp(Settings.Offset, 10, 30)
    				local LabelsXPosition = Position.X + (Size.X / 2)

    				local Player, IsAPlayer = Entry.Object, Entry.IsAPlayer
    				local Name, DisplayName = Entry.Name, Entry.DisplayName

    				local Character = IsAPlayer and __index(Player, "Character") or Player
    				local Humanoid = FindFirstChildOfClass(Character, "Humanoid")
    				local Health, MaxHealth = Humanoid and __index(Humanoid, "Health") or Nan, Humanoid and __index(Humanoid, "MaxHealth") or Nan

    				local Tool = Settings.DisplayTool and FindFirstChildOfClass(Character, "Tool")

    				local TopContent = ""

    				if Settings.DisplayDisplayName and Settings.DisplayName and DisplayName ~= Name then
    					TopContent = stringformat("%s (%s)", DisplayName, Name)
    				elseif Settings.DisplayDisplayName and not Settings.DisplayName then
    					TopContent = DisplayName
    				elseif not Settings.DisplayDisplayName and Settings.DisplayName then
    					TopContent = Name
    				elseif Settings.DisplayDisplayName and Settings.DisplayName and DisplayName == Name then
    					TopContent = Name
    				end

    				if Settings.DisplayHealth and IsAPlayer then
    					TopContent = stringformat("[%s / %s] %s", mathfloor(Health), MaxHealth, TopContent)
    				end

    				if Entry._LastTopText ~= TopContent then
    					Entry._LastTopText = TopContent
    					setrenderproperty(TopTextObject, "Text", TopContent)
    				end

    				Entry._DistFrame = (Entry._DistFrame or 0) + 1

    				if Entry._DistFrame % 3 == 0 then
    					local PlayerPosition = __index((IsAPlayer and (__index(Character, "PrimaryPart") or __index(Character, "Head")) or Character), "Position") or Vector3zero
    					Entry._Distance = Settings.DisplayDistance and mathfloor((PlayerPosition - CoreFunctions.GetLocalCharacterPosition()).Magnitude)
    				end

    				local Distance = Entry._Distance

    				local BottomContent = Distance and stringformat("%s Studs", Distance) or ""

    				if Tool then
    					local ToolName = __index(Tool, "Name")
    					BottomContent = BottomContent..((Distance and "\n" or "")..ToolName)
    				end

    				if Entry._LastBottomText ~= BottomContent then
    					Entry._LastBottomText = BottomContent
    					setrenderproperty(BottomTextObject, "Text", BottomContent)
    				end

    				if Entry.PositionChanged then
    					setrenderproperty(TopTextObject, "Position", Vector2new(LabelsXPosition, Top.Y - Offset * 2.05))
    					setrenderproperty(BottomTextObject, "Position", Vector2new(LabelsXPosition, Bottom.Y + Offset / 2))
    				end
    			end
    		end,

    		Tracer = function(Entry, TracerObject, TracerOutlineObject)
    			local Settings = Environment.Properties.Tracer

    			local Position, Size, OnScreen = CoreFunctions.CalculateParameters(Entry)

    			setrenderproperty(TracerObject, "Visible", OnScreen)
    			setrenderproperty(TracerOutlineObject, "Visible", OnScreen and Settings.Outline)

    			if OnScreen then
    				for Index, Value in next, Settings do
    					if ValidProperties[Index] then
    						setrenderproperty(TracerObject, Index, Value)
    					end
    				end

    				setrenderproperty(TracerObject, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))

    				if Settings.Position == 1 then
    					setrenderproperty(TracerObject, "From", Vector2new(CameraViewportSize.X / 2, CameraViewportSize.Y))
    				elseif Settings.Position == 2 then
    					setrenderproperty(TracerObject, "From", CameraViewportSize / 2)
    				elseif Settings.Position == 3 then
    					setrenderproperty(TracerObject, "From", GetMouseLocation())
    				else
    					Settings.Position = 1
    				end

    				if Entry.PositionChanged then
    					setrenderproperty(TracerObject, "To", Vector2new(Position.X + (Size.X / 2), Position.Y + Size.Y))
    				end

    				if Settings.Outline then
    					setrenderproperty(TracerOutlineObject, "Color", Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor)
    					setrenderproperty(TracerOutlineObject, "Thickness", Settings.Thickness + 1)
    					setrenderproperty(TracerOutlineObject, "Transparency", Settings.Transparency)

    					setrenderproperty(TracerOutlineObject, "From", getrenderproperty(TracerObject, "From"))

    					if not Entry.PositionChanged then
    						return
    					end

    					setrenderproperty(TracerOutlineObject, "To", getrenderproperty(TracerObject, "To"))
    				end
    			end
    		end,

    		Box = function(Entry, BoxParts, BoxOutlines, SquareBox, FillBox, Quads)
    			local Settings = Environment.Properties.Box
    			local DeveloperSettings = Environment.DeveloperSettings

    			local Position, Size, OnScreen = CoreFunctions.CalculateParameters(Entry)

    			local ConvertVector = CoreFunctions.ConvertVector

    			local Object = Entry.Object
    			local IsAPlayer = Entry.IsAPlayer

    			local Character = IsAPlayer and __index(Object, "Character") or __index(Object, "Parent")

    			if Character == Players then
    				return
    			end

    			local Primary = Character and (__index(Character, "PrimaryPart") or FindFirstChild(Character, "HumanoidRootPart"))

    			Primary = Primary or not IsAPlayer and Object

    			if not Primary and IsAPlayer then
    				local _vm = playerToViewmodel[Object]
    				Primary = _vm and (FindFirstChild(_vm, "torso") or FindFirstChild(_vm, "head"))
    			end

    			local Type, Fill = Settings.Type, Settings.FillSquare

    			local SquareBoxObject = SquareBox[1]
    			local SquareBoxOutline = SquareBox[2]

    			local Visibility, Visibility3D = function(Value)
    				for Index, _Value in next, BoxParts do
    					setrenderproperty(_Value, "Visible", Value and Type == 3)
    					setrenderproperty(BoxOutlines[Index], "Visible", Value and Settings.Outline and Type == 3)
    				end
    			end, function(Value)
    				for _, _Value in next, Quads do
    					_set(_Value, "Visible", Value and Type == 2)
    				end
    			end

    			if Type == 1 then
    				setrenderproperty(SquareBoxObject, "Visible", OnScreen and Type == 1)
    				setrenderproperty(SquareBoxOutline, "Visible", OnScreen and Settings.Outline and Type == 1)
    				Visibility(false)
    				Visibility3D(false)
    			elseif Type == 2 then
    				setrenderproperty(SquareBoxObject, "Visible", false)
    				setrenderproperty(SquareBoxOutline, "Visible", false)
    				Visibility(false)
    				Visibility3D(OnScreen and Type == 2)
    			elseif Type == 3 then
    				setrenderproperty(SquareBoxObject, "Visible", false)
    				setrenderproperty(SquareBoxOutline, "Visible", false)
    				Visibility(OnScreen and Type == 3)
    				Visibility3D(false)
    			end

    			setrenderproperty(FillBox, "Visible", Fill and OnScreen and Type ~= 2)

    			if not Primary then
    				setrenderproperty(FillBox, "Visible", false)
    				setrenderproperty(SquareBoxObject, "Visible", false)
    				setrenderproperty(SquareBoxOutline, "Visible", false)
    				Visibility(false)
    				Visibility3D(false)

    				return
    			end

    			local PrimaryCFrame, PrimarySize = __index(Primary, "CFrame"), __index(Primary, "Size")
    			local _3DSize = PrimarySize * Vector3new(1.05, 1.5, 0)
    			local Top, Bottom = WorldToViewportPoint((PrimaryCFrame * CFramenew(0, PrimarySize.Y / 2, 0)).Position), WorldToViewportPoint((PrimaryCFrame * CFramenew(0, -PrimarySize.Y / 2, 0)).Position)

    			local LineSize = mathclamp(mathabs((Top - Bottom).Y) - 3, 2, mathmax(Settings.LineSize, 20))

    			if getrenderproperty(BoxParts.TopLeft_Bottom, "Visible") or getrenderproperty(SquareBoxObject, "Visible") or getrenderproperty(Quads.Top, "Visible") then
    				if Fill and Type ~= 2 then
    					setrenderproperty(FillBox, "Transparency", Settings.FillTransparency)
    					setrenderproperty(FillBox, "Thickness", 0)
    					setrenderproperty(FillBox, "Color", CoreFunctions.GetColor(Entry.Object, Settings.FillRainbowColor and Rainbow or Settings.FillColor))

    					if not Entry.PositionChanged then
    						return
    					end

    					setrenderproperty(FillBox, "Position", Position)
    					setrenderproperty(FillBox, "Size", Size)
    				end

    				if Type == 1 then -- Square Box
    					for Index, Value in next, Settings do
    						if ValidProperties[Index] then
    							setrenderproperty(SquareBoxObject, Index, Value)
    						end
    					end

    					setrenderproperty(SquareBoxObject, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))

    					if not Entry.PositionChanged then
    						return
    					end

    					setrenderproperty(SquareBoxObject, "Position", Position)
    					setrenderproperty(SquareBoxObject, "Size", Size)
    				elseif Type == 2 then -- 3D Box
    					if DeveloperSettings.Throttle then
    						Entry._Frame = (Entry._Frame or 0) + 1

    						if Entry._Frame % mathclamp(DeveloperSettings.ThrottleStep, 2, 4) ~= 0 then
    							return
    						end
    					end

    					for Index, Value in next, Settings do
    						for _, RenderObject in next, Quads do
    							if ValidProperties[Index] then
    								_set(RenderObject, Index, Value)
    							end
    						end
    					end

    					for _, Value in next, Quads do
    						_set(Value, "Fill", Fill)
    						_set(Value, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))
    					end

    					if not Entry.PositionChanged then
    						return
    					end

    					local Indexes, Positions = {1, 3, 4, 2}, CoreFunctions.Calculate3DQuad(PrimaryCFrame, PrimarySize, _3DSize)

    					for Index, RenderObject in next, Quads do
    						for _Index = 1, 4 do
                                local tmp = Indexes[_Index]
    							_set(RenderObject, "Point"..stringchar(_Index + 64), ConvertVector(Positions[Index][tmp]))
    						end
    					end
    				elseif Type == 3 then -- Corner Box
    					for Index, Value in next, Settings do
    						for _, RenderObject in next, BoxParts do
    							if ValidProperties[Index] then
    								setrenderproperty(RenderObject, Index, Value)
    							end
    						end
    					end

    					for _, Value in next, BoxParts do
    						setrenderproperty(Value, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))
    					end

    					if not Entry.PositionChanged then
    						return
    					end

    					--// Top Left

    					setrenderproperty(BoxParts.TopLeft_Bottom, "From", Position)
    					setrenderproperty(BoxParts.TopLeft_Bottom, "To", Vector2new(Position.X, Position.Y + LineSize + LineSize / 2))

    					setrenderproperty(BoxParts.TopLeft_Right, "From", Position)
    					setrenderproperty(BoxParts.TopLeft_Right, "To", Vector2new(Position.X + LineSize, Position.Y))

    					--// Top Right

    					setrenderproperty(BoxParts.TopRight_Bottom, "From", Vector2new(Position.X + Size.X, Position.Y))
    					setrenderproperty(BoxParts.TopRight_Bottom, "To", Vector2new(Position.X + Size.X, Position.Y + LineSize + LineSize / 2))

    					setrenderproperty(BoxParts.TopRight_Left, "From", Vector2new(Position.X + Size.X, Position.Y))
    					setrenderproperty(BoxParts.TopRight_Left, "To", Vector2new(Position.X + Size.X - LineSize, Position.Y))

    					--// Bottom Left

    					setrenderproperty(BoxParts.BottomLeft_Top, "From", Vector2new(Position.X, Position.Y + Size.Y - LineSize - LineSize / 2))
    					setrenderproperty(BoxParts.BottomLeft_Top, "To", Vector2new(Position.X, Position.Y + Size.Y))

    					setrenderproperty(BoxParts.BottomLeft_Right, "From", Vector2new(Position.X, Position.Y + Size.Y))
    					setrenderproperty(BoxParts.BottomLeft_Right, "To", Vector2new(Position.X + LineSize, Position.Y + Size.Y))

    					--// Bottom Right

    					setrenderproperty(BoxParts.BottomRight_Top, "From", Vector2new(Position.X + Size.X, Position.Y + Size.Y - LineSize - LineSize / 2))
    					setrenderproperty(BoxParts.BottomRight_Top, "To", Vector2new(Position.X + Size.X, Position.Y + Size.Y))

    					setrenderproperty(BoxParts.BottomRight_Left, "From", Vector2new(Position.X + Size.X, Position.Y + Size.Y))
    					setrenderproperty(BoxParts.BottomRight_Left, "To", Vector2new(Position.X + Size.X - LineSize, Position.Y + Size.Y))
    				end

    				if Settings.Outline then
    					if Type == 1 then
    						setrenderproperty(SquareBoxOutline, "Color", Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor)

    						setrenderproperty(SquareBoxOutline, "Thickness", Settings.Thickness + 1)
    						setrenderproperty(SquareBoxOutline, "Transparency", Settings.Transparency)

    						if not Entry.PositionChanged then
    							return
    						end

    						setrenderproperty(SquareBoxOutline, "Position", Position)
    						setrenderproperty(SquareBoxOutline, "Size", Size)
    					elseif Type == 3 then
    						for Index, Value in next, BoxOutlines do
    							setrenderproperty(Value, "Color", Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor)

    							setrenderproperty(Value, "Thickness", Settings.Thickness + 2)
    							setrenderproperty(Value, "Transparency", Settings.Transparency)

    							if not Entry.PositionChanged then
    								return
    							end

    							setrenderproperty(Value, "From", getrenderproperty(BoxParts[Index], "From"))
    							setrenderproperty(Value, "To", getrenderproperty(BoxParts[Index], "To"))
    						end
    					end
    				end
    			end
    		end,

    		HealthBar = function(Entry, MainObject, OutlineObject, Humanoid)
    			local Settings = Environment.Properties.HealthBar

    			local Position, Size, OnScreen = CoreFunctions.CalculateParameters(Entry)

    			setrenderproperty(MainObject, "Visible", OnScreen)
    			setrenderproperty(OutlineObject, "Visible", OnScreen and Settings.Outline)

    			if OnScreen and Position and Size then
    				for Index, Value in next, Settings do
    					if ValidProperties[Index] then
    						setrenderproperty(MainObject, Index, Value)
    					end
    				end

    				Humanoid = Humanoid or FindFirstChildOfClass(__index(Entry.Object, "Character"), "Humanoid")

    				local MaxHealth = Humanoid and __index(Humanoid, "MaxHealth") or 100
    				local Health = Humanoid and mathclamp(__index(Humanoid, "Health"), 0, MaxHealth) or 0

    				local Offset = mathclamp(Settings.Offset, 4, 12)

    				setrenderproperty(MainObject, "Color", CoreFunctions.GetColorFromHealth(Health, MaxHealth, Settings.Blue))

    				if Settings.Outline then
    					setrenderproperty(OutlineObject, "Color", Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor)

    					setrenderproperty(OutlineObject, "Thickness", Settings.Thickness + 1)
    					setrenderproperty(OutlineObject, "Transparency", Settings.Transparency)
    				end

    				if not Entry.PositionChanged then
    					return
    				end

    				if Settings.Position == 1 then
    					setrenderproperty(MainObject, "From", Vector2new(Position.X, Position.Y - Offset))
    					setrenderproperty(MainObject, "To", Vector2new(Position.X + (Health / MaxHealth) * Size.X, Position.Y - Offset))

    					if Settings.Outline then
    						setrenderproperty(OutlineObject, "From", Vector2new(Position.X - 1, Position.Y - Offset))
    						setrenderproperty(OutlineObject, "To", Vector2new(Position.X + Size.X + 1, Position.Y - Offset))
    					end
    				elseif Settings.Position == 2 then
    					setrenderproperty(MainObject, "From", Vector2new(Position.X, Position.Y + Size.Y + Offset))
    					setrenderproperty(MainObject, "To", Vector2new(Position.X + (Health / MaxHealth) * Size.X, Position.Y + Size.Y + Offset))

    					if Settings.Outline then
    						setrenderproperty(OutlineObject, "From", Vector2new(Position.X - 1, Position.Y + Size.Y + Offset))
    						setrenderproperty(OutlineObject, "To", Vector2new(Position.X + Size.X + 1, Position.Y + Size.Y + Offset))
    					end
    				elseif Settings.Position == 3 then
    					setrenderproperty(MainObject, "From", Vector2new(Position.X - Offset, Position.Y + Size.Y))
    					setrenderproperty(MainObject, "To", Vector2new(Position.X - Offset, getrenderproperty(MainObject, "From").Y - (Health / MaxHealth) * Size.Y))

    					if Settings.Outline then
    						setrenderproperty(OutlineObject, "From", Vector2new(Position.X - Offset, Position.Y + Size.Y + 1))
    						setrenderproperty(OutlineObject, "To", Vector2new(Position.X - Offset, (getrenderproperty(OutlineObject, "From").Y - 1 * Size.Y) - 2))
    					end
    				elseif Settings.Position == 4 then
    					setrenderproperty(MainObject, "From", Vector2new(Position.X + Size.X + Offset, Position.Y + Size.Y))
    					setrenderproperty(MainObject, "To", Vector2new(Position.X + Size.X + Offset, getrenderproperty(MainObject, "From").Y - (Health / MaxHealth) * Size.Y))

    					if Settings.Outline then
    						setrenderproperty(OutlineObject, "From", Vector2new(Position.X + Size.X + Offset, Position.Y + Size.Y + 1))
    						setrenderproperty(OutlineObject, "To", Vector2new(Position.X + Size.X + Offset, (getrenderproperty(OutlineObject, "From").Y - 1 * Size.Y) - 2))
    					end
    				else
    					Settings.Position = 3
    				end
    			end
    		end,

    		HeadDot = function(Entry, CircleObject, CircleOutlineObject)
    			local Settings = Environment.Properties.HeadDot

    			local Head
    			if Entry.IsAPlayer then
    				local vm = playerToViewmodel[Entry.Object]
    				Head = vm and FindFirstChild(vm, "head")
    			else
    				local Character = __index(Entry.Object, "Parent")
    				Head = Character and FindFirstChild(Character, "Head")
    			end

    			if not Head then
    				setrenderproperty(CircleObject, "Visible", false)
    				setrenderproperty(CircleOutlineObject, "Visible", false)
    				return
    			end

    			local HeadCFrame, HeadSize = __index(Head, "CFrame"), __index(Head, "Size")
    			local Vector, OnScreen = WorldToViewportPoint(HeadCFrame.Position)
    			local Top, Bottom = WorldToViewportPoint((HeadCFrame * CFramenew(0, HeadSize.Y / 2, 0)).Position), WorldToViewportPoint((HeadCFrame * CFramenew(0, -HeadSize.Y / 2, 0)).Position)

    			setrenderproperty(CircleObject, "Visible", OnScreen)
    			setrenderproperty(CircleOutlineObject, "Visible", OnScreen and Settings.Outline)

    			if OnScreen then
    				for Index, Value in next, Settings do
    					if ValidProperties[Index] then
    						setrenderproperty(CircleObject, Index, Value)
    						if Settings.Outline then
    							setrenderproperty(CircleOutlineObject, Index, Value)
    						end
    					end
    				end

    				setrenderproperty(CircleObject, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))

    				if Entry.PositionChanged then
    					setrenderproperty(CircleObject, "Position", CoreFunctions.ConvertVector(Vector))
    					setrenderproperty(CircleObject, "Radius", mathabs((Top - Bottom).Y) - 3)
    				end

    				if Settings.Outline then
    					setrenderproperty(CircleOutlineObject, "Color", Settings.RainbowOutlineColor and Rainbow or Settings.OutlineColor)
    					setrenderproperty(CircleOutlineObject, "Thickness", Settings.Thickness + 1)
    					setrenderproperty(CircleOutlineObject, "Transparency", Settings.Transparency)
    					if not Entry.PositionChanged then return end
    					setrenderproperty(CircleOutlineObject, "Position", getrenderproperty(CircleObject, "Position"))
    					setrenderproperty(CircleOutlineObject, "Radius", getrenderproperty(CircleObject, "Radius"))
    				end
    			end
    		end,

    		Skeleton = function(Entry)
    			local Settings = Environment.Properties.Skeleton
    			local DeveloperSettings = Environment.DeveloperSettings

    			local Head, Torso
    			local RigType = Entry.RigType

    			if Entry.IsAPlayer then
    				local vm = playerToViewmodel[Entry.Object]
    				if vm then
    					Head = FindFirstChild(vm, "head")
    					Torso = FindFirstChild(vm, "torso")
    				end
    			else
    				local Character = __index(Entry.Object, "Parent")
    				Head = Character and FindFirstChild(Character, "Head")
    				Torso = Character and (FindFirstChild(Character, "HumanoidRootPart") or FindFirstChild(Character, "Torso"))
    			end

    			local Limbs = {}
    			for Index, Value in next, Entry.Visuals.Skeleton do
    				Limbs[Index] = Value
    			end

    			local Visibility = function(Value)
    				for _, _Value in next, Limbs do
    					setrenderproperty(_Value, "Visible", Value)
    				end
    			end

    			if not Head or not Torso then return Visibility(false) end

    			if DeveloperSettings.Throttle then
    				Entry._Frame = (Entry._Frame or 0) + 1
    				if Entry._Frame % mathclamp(DeveloperSettings.ThrottleStep, 2, 4) ~= 0 then return end
    			end

    			if select(3, CoreFunctions.CalculateParameters(Entry)) then
    				for _, RenderObject in next, Limbs do
    					setrenderproperty(RenderObject, "Visible", true)
    					for _Index, _Value in next, Settings do
    						if ValidProperties[_Index] then
    							setrenderproperty(RenderObject, _Index, _Value)
    						end
    					end
    					setrenderproperty(RenderObject, "Color", CoreFunctions.GetColor(Entry.Object, Settings.RainbowColor and Rainbow or Settings.Color))
    				end

    				if not Entry.PositionChanged then return end

    				local ConvertVector = CoreFunctions.ConvertVector
    				local Head_P  = ConvertVector(WorldToViewportPoint(__index(Head,  "Position")))
    				local Torso_P = ConvertVector(WorldToViewportPoint(__index(Torso, "Position")))

    				if RigType == "Viewmodel" then
    					local vm = playerToViewmodel[Entry.Object]
    					if not vm then return Visibility(false) end
    					local function vp(name) local p = FindFirstChild(vm, name); return p and ConvertVector(WorldToViewportPoint(__index(p, "Position"))) end
    					local S1 = vp("shoulder1"); local S2 = vp("shoulder2")
    					local A1 = vp("arm1");      local A2 = vp("arm2")
    					local H1 = vp("hip1");      local H2 = vp("hip2")
    					local L1 = vp("leg1");      local L2 = vp("leg2")
    					setrenderproperty(Limbs.Spine, "From", Head_P);  setrenderproperty(Limbs.Spine, "To", Torso_P)
    					if S1 and A1 then setrenderproperty(Limbs.LeftArm_Upper,  "From", Torso_P); setrenderproperty(Limbs.LeftArm_Upper,  "To", S1); setrenderproperty(Limbs.LeftArm_Lower,  "From", S1); setrenderproperty(Limbs.LeftArm_Lower,  "To", A1) end
    					if S2 and A2 then setrenderproperty(Limbs.RightArm_Upper, "From", Torso_P); setrenderproperty(Limbs.RightArm_Upper, "To", S2); setrenderproperty(Limbs.RightArm_Lower, "From", S2); setrenderproperty(Limbs.RightArm_Lower, "To", A2) end
    					if H1 and L1 then setrenderproperty(Limbs.LeftLeg_Upper,  "From", Torso_P); setrenderproperty(Limbs.LeftLeg_Upper,  "To", H1); setrenderproperty(Limbs.LeftLeg_Lower,  "From", H1); setrenderproperty(Limbs.LeftLeg_Lower,  "To", L1) end
    					if H2 and L2 then setrenderproperty(Limbs.RightLeg_Upper, "From", Torso_P); setrenderproperty(Limbs.RightLeg_Upper, "To", H2); setrenderproperty(Limbs.RightLeg_Lower, "From", H2); setrenderproperty(Limbs.RightLeg_Lower, "To", L2) end
    				elseif RigType == "R6" then
    					local Character = __index(Entry.Object, "Character") or __index(Entry.Object, "Parent")
    					local HeightModifier = DeveloperSettings.SkeletonR6HeightModifier
    					local function bp(name) local p = FindFirstChild(Character, name); return p end
    					local Torso_  = bp("Torso"); local LA = bp("Left Arm"); local RA = bp("Right Arm"); local LL = bp("Left Leg"); local RL = bp("Right Leg")
    					if not (Torso_ and LA and RA and LL and RL) then return Visibility(false) end
    					local function limb(p, h) local cf = __index(p,"CFrame"); local s = __index(p,"Size").Y/2-h; return ConvertVector(WorldToViewportPoint((cf*CFramenew(0,s,0)).Position)), ConvertVector(WorldToViewportPoint((cf*CFramenew(0,-s,0)).Position)) end
    					local Ts, Te = limb(Torso_, HeightModifier+0.15)
    					local LAs, LAe = limb(LA, HeightModifier); local RAs, RAe = limb(RA, HeightModifier)
    					local LLs, LLe = limb(LL, HeightModifier); local RLs, RLe = limb(RL, HeightModifier)
    					setrenderproperty(Limbs.Spine_Start,"From",Head_P);  setrenderproperty(Limbs.Spine_Start,"To",Ts)
    					setrenderproperty(Limbs.Spine_End,  "From",Ts);      setrenderproperty(Limbs.Spine_End,  "To",Te)
    					setrenderproperty(Limbs.LeftArm_Start, "From",LAs);  setrenderproperty(Limbs.LeftArm_Start, "To",LAe); setrenderproperty(Limbs.LeftArm_End,"From",Ts); setrenderproperty(Limbs.LeftArm_End,"To",LAs)
    					setrenderproperty(Limbs.RightArm_Start,"From",RAs);  setrenderproperty(Limbs.RightArm_Start,"To",RAe); setrenderproperty(Limbs.RightArm_End,"From",Ts); setrenderproperty(Limbs.RightArm_End,"To",RAs)
    					setrenderproperty(Limbs.LeftLeg_Start, "From",LLs);  setrenderproperty(Limbs.LeftLeg_Start, "To",LLe); setrenderproperty(Limbs.LeftLeg_End,"From",Te); setrenderproperty(Limbs.LeftLeg_End,"To",LLs)
    					setrenderproperty(Limbs.RightLeg_Start,"From",RLs);  setrenderproperty(Limbs.RightLeg_Start,"To",RLe); setrenderproperty(Limbs.RightLeg_End,"From",Te); setrenderproperty(Limbs.RightLeg_End,"To",RLs)
    				else
    					Visibility(false)
    				end
    			else
    				Visibility(false)
    			end
    		end
    	}
        end)()

        local CreatingFunctions; LPH_NO_VIRTUALIZE(function()
    	CreatingFunctions = {
    		ESP = function(Entry)
    			local Allowed = Entry.Allowed

    			if type(Allowed) == "table" and type(Allowed.ESP) == "boolean" and not Allowed.ESP then
    				return
    			end

    			local Settings = Environment.Properties.ESP

    			local TopText = Drawingnew("Text")
    			local TopTextObject = TopText

    			setrenderproperty(TopTextObject, "ZIndex", 4)
    			setrenderproperty(TopTextObject, "Center", true)

    			local BottomText = Drawingnew("Text")
    			local BottomTextObject = BottomText

    			setrenderproperty(BottomTextObject, "ZIndex", 4)
    			setrenderproperty(BottomTextObject, "Center", true)

    			Entry.Visuals.ESP[1] = TopText
    			Entry.Visuals.ESP[2] = BottomText

    			Entry.Connections.ESP = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					pcall(TopText.Remove, TopText)
    					pcall(BottomText.Remove, BottomText)

    					return Disconnect(Entry.Connections.ESP)
    				end

    				if Ready then
    					UpdatingFunctions.ESP(Entry, TopTextObject, BottomTextObject)
    				else
    					setrenderproperty(TopTextObject, "Visible", false)
    					setrenderproperty(BottomTextObject, "Visible", false)
    				end
    			end)
    		end,

    		Tracer = function(Entry)
    			local Allowed = Entry.Allowed

    			if type(Allowed) == "table" and type(Allowed.Tracer) == "boolean" and not Allowed.Tracer then
    				return
    			end

    			local Settings = Environment.Properties.Tracer

    			local TracerOutline = Drawingnew("Line")
    			local TracerOutlineObject = TracerOutline

    			local Tracer = Drawingnew("Line")
    			local TracerObject = Tracer

    			Entry.Visuals.Tracer[1] = Tracer
    			Entry.Visuals.Tracer[2] = TracerOutline

    			Entry.Connections.Tracer = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					pcall(Tracer.Remove, Tracer)
    					pcall(TracerOutline.Remove, TracerOutline)

    					return Disconnect(Entry.Connections.Tracer)
    				end

    				if Ready then
    					UpdatingFunctions.Tracer(Entry, TracerObject, TracerOutlineObject)
    				else
    					setrenderproperty(TracerObject, "Visible", false)
    					setrenderproperty(TracerOutlineObject, "Visible", false)
    				end
    			end)
    		end,

    		Box = function(Entry)
    			local Allowed = Entry.Allowed

    			if type(Allowed) == "table" and type(Allowed.Box) == "boolean" and not Allowed.Box then
    				return
    			end

    			local Settings = Environment.Properties.Box

    			local _BoxOutlines = {
    				TopLeft_Bottom = Drawingnew("Line"),
    				TopLeft_Right = Drawingnew("Line"),
    				TopRight_Bottom = Drawingnew("Line"),
    				TopRight_Left = Drawingnew("Line"),
    				BottomLeft_Top = Drawingnew("Line"),
    				BottomLeft_Right = Drawingnew("Line"),
    				BottomRight_Top = Drawingnew("Line"),
    				BottomRight_Left = Drawingnew("Line")
    			}

    			local BoxOutlines = {}

    			local _Quads = {
    				Top = Drawingnew("Quad"),
    				Bottom = Drawingnew("Quad"),
    				Front = Drawingnew("Quad"),
    				Back = Drawingnew("Quad"),
    				Left = Drawingnew("Quad"),
    				Right = Drawingnew("Quad")
    			}

    			local Quads = {}

    			for Index, Value in next, _BoxOutlines do
    				BoxOutlines[Index] = Value
    			end

    			for Index, Value in next, _Quads do
    				Quads[Index] = Value
    			end

    			local _BoxParts, BoxParts = {}, {}

    			for Index, _ in next, BoxOutlines do
    				BoxParts[Index] = Drawingnew("Line")
    				_BoxParts[Index] = _BoxOutlines[Index]
    			end

    			local _SquareBoxOutline = Drawingnew("Square")
    			local _SquareBox = Drawingnew("Square")
    			local SquareBoxOutline = _SquareBoxOutline
    			local SquareBoxObject = _SquareBox

    			setrenderproperty(SquareBoxObject, "ZIndex", 4)
    			setrenderproperty(SquareBoxOutline, "ZIndex", 3)

    			local SquareBox, _FillBox = {SquareBoxObject, SquareBoxOutline}, Drawingnew("Square")
    			local FillBox = _FillBox

    			setrenderproperty(FillBox, "Filled", true)

    			Entry.Visuals.Box[1] = _BoxParts
    			Entry.Visuals.Box[2] = _BoxOutlines
    			Entry.Visuals.Box[3] = {_SquareBox, _SquareBoxOutline}
    			Entry.Visuals.Box[4] = _FillBox
    			Entry.Visuals.Box[5] = _Quads

    			Entry.Connections.Box = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					for Index, Value in next, BoxParts do
    						pcall(Value.Remove, Value)
    						pcall(BoxOutlines[Index].Remove, BoxOutlines[Index])
    					end

    					for _, Value in next, Quads do
    						pcall(Value.Remove, Value)
    					end

    					pcall(SquareBox.Remove, SquareBox)
    					pcall(FillBox.Remove, FillBox)

    					return Disconnect(Entry.Connections.Box)
    				end

    				if Ready then
    					UpdatingFunctions.Box(Entry, BoxParts, BoxOutlines, SquareBox, FillBox, Quads)
    				else
    					setrenderproperty(SquareBoxObject, "Visible", false)
    					setrenderproperty(SquareBoxOutline, "Visible", false)
    					setrenderproperty(FillBox, "Visible", false)

    					for Index, Value in next, BoxParts do
    						setrenderproperty(Value, "Visible", false)
    						setrenderproperty(BoxOutlines[Index], "Visible", false)
    					end

    					for _, Value in next, Quads do
    						setrenderproperty(Value, "Visible", false)
    					end
    				end
    			end)
    		end,

    		HealthBar = function(Entry)
    			local Allowed = Entry.Allowed

    			if type(Allowed) == "table" and type(Allowed.HealthBar) == "boolean" and not Allowed.HealthBar then
    				return
    			end

    			local Humanoid = FindFirstChildOfClass(__index(Entry.Object, "Parent"), "Humanoid")

    			if not Entry.IsAPlayer and not Humanoid then
    				return
    			end

    			local Settings = Environment.Properties.HealthBar

    			local Outline = Drawingnew("Line")
    			local OutlineObject = Outline

    			local Main = Drawingnew("Line")
    			local MainObject = Main

    			Entry.Visuals.HealthBar[1] = Main
    			Entry.Visuals.HealthBar[2] = Outline

    			Entry.Connections.HealthBar = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					pcall(Main.Remove, Main)
    					pcall(Outline.Remove, Outline)

    					return Disconnect(Entry.Connections.HealthBar)
    				end

    				if Ready then
    					UpdatingFunctions.HealthBar(Entry, MainObject, OutlineObject, Humanoid)
    				else
    					setrenderproperty(MainObject, "Visible", false)
    					setrenderproperty(OutlineObject, "Visible", false)
    				end
    			end)
    		end,

    		HeadDot = function(Entry)
    			local Allowed = Entry.Allowed

    			if type(Allowed) == "table" and type(Allowed.HeadDot) == "boolean" and not Allowed.HeadDot then
    				return
    			end

    			local Settings = Environment.Properties.HeadDot

    			local CircleOutline = Drawingnew("Circle")
    			local CircleOutlineObject = CircleOutline
    			local Circle = Drawingnew("Circle")
    			local CircleObject = Circle

    			Entry.Visuals.HeadDot[1] = Circle
    			Entry.Visuals.HeadDot[2] = CircleOutline

    			Entry.Connections.HeadDot = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					pcall(Circle.Remove, Circle)
    					pcall(CircleOutline.Remove, CircleOutline)
    					return Disconnect(Entry.Connections.HeadDot)
    				end

    				if Ready then
    					UpdatingFunctions.HeadDot(Entry, CircleObject, CircleOutlineObject)
    				else
    					setrenderproperty(CircleObject, "Visible", false)
    					setrenderproperty(CircleOutlineObject, "Visible", false)
    				end
    			end)
    		end,

    		Skeleton = function(Entry)
    			local Allowed = Entry.Allowed
    			local Settings = Environment.Properties.Skeleton

    			if type(Allowed) == "table" and type(Allowed.Skeleton) == "boolean" and not Allowed.Skeleton then
    				return
    			end

    			local RigType = Entry.RigType

    			if RigType == "Viewmodel" then
    				Entry.Visuals.Skeleton = {
    					Spine        = Drawingnew("Line"),
    					LeftArm_Upper  = Drawingnew("Line"), LeftArm_Lower  = Drawingnew("Line"),
    					RightArm_Upper = Drawingnew("Line"), RightArm_Lower = Drawingnew("Line"),
    					LeftLeg_Upper  = Drawingnew("Line"), LeftLeg_Lower  = Drawingnew("Line"),
    					RightLeg_Upper = Drawingnew("Line"), RightLeg_Lower = Drawingnew("Line"),
    				}
    			elseif RigType == "R6" then
    				Entry.Visuals.Skeleton = {
    					Spine_Start = Drawingnew("Line"), Spine_End = Drawingnew("Line"),
    					LeftArm_Start = Drawingnew("Line"), LeftArm_End = Drawingnew("Line"),
    					RightArm_Start = Drawingnew("Line"), RightArm_End = Drawingnew("Line"),
    					LeftLeg_Start = Drawingnew("Line"), LeftLeg_End = Drawingnew("Line"),
    					RightLeg_Start = Drawingnew("Line"), RightLeg_End = Drawingnew("Line"),
    				}
    			else
    				return
    			end

    			local SkeletonEntry = Entry.Visuals.Skeleton

    			Entry.Connections.Skeleton = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    				local Primed, Ready = pcall(function()
    					return Environment.Settings.Enabled and Settings.Enabled and Entry.Checks.Ready
    				end)

    				if not Primed then
    					for _, Value in next, SkeletonEntry do pcall(Value.Remove, Value) end
    					return Disconnect(Entry.Connections.Skeleton)
    				end

    				if Ready then
    					UpdatingFunctions.Skeleton(Entry)
    				else
    					for _, Value in next, SkeletonEntry do setrenderproperty(Value, "Visible", false) end
    				end
    			end)
    		end
    	}
        end)()

        local UtilityFunctions; LPH_NO_VIRTUALIZE(function()
    	UtilityFunctions = {
    		InitChecks = function(self, Entry)
    			local Settings = Environment.Settings
    			local DeveloperSettings = Environment.DeveloperSettings

    			local Player = Entry.Object
    			local Checks = Entry.Checks
    			local Hash = Entry.Hash
    			local IsAPlayer = Entry.IsAPlayer
    			local PartHasCharacter = Entry.PartHasCharacter
    			local RenderDistance = Entry.RenderDistance

    			if not IsAPlayer and not PartHasCharacter and not RenderDistance then
    				return
    			end

    			local Top = select(4, CoreFunctions.CalculateParameters(Entry))

    			Entry.OldPosition = Environment.Settings.CachePositions and Top and CoreFunctions.GetLocalCharacterPosition() - select(4, CoreFunctions.CalculateParameters(Entry))

    			Entry.Connections.UpdateChecks = Connect(__index(RunService, DeveloperSettings.UpdateMode), function()
    				if DeveloperSettings.Throttle then
    					Entry._Frame = (Entry._Frame or 0) + 1

    					if Entry._Frame % mathclamp(DeveloperSettings.ThrottleStep, 2, 4) ~= 0 then
    						return
    					end
    				end

    				Top = select(4, CoreFunctions.CalculateParameters(Entry))

    				if Top and Environment.Settings.CachePositions then
    					Entry.Position = CoreFunctions.GetLocalCharacterPosition() - Top
    					Entry.PositionChanged = Entry.OldPosition ~= Entry.Position
    					Entry.OldPosition = Entry.OldPosition == Entry.Position and Entry.OldPosition or Entry.Position
    				else
    					Entry.PositionChanged = true
    				end

    				RenderDistance = Entry.RenderDistance

    				if not Settings.Enabled then
    					Checks.Ready = false
    					Checks.Alive = false
    					Checks.Team = false

    					return
    				end

    				if not IsAPlayer and not PartHasCharacter then -- Part ESP
    					Checks.Ready = (__index(Player, "Position") - CoreFunctions.GetLocalCharacterPosition()).Magnitude <= RenderDistance; return
    				end

    				if not IsAPlayer then -- NPC
    					local PartHumanoid = FindFirstChildOfClass(__index(Player, "Parent"), "Humanoid")

    					Checks.Ready = PartHasCharacter and PartHumanoid and IsDescendantOf(Player, Workspace)

    					if not Checks.Ready then
    						return self.UnwrapObject(Hash)
    					end

    					local IsInDistance = (__index(Player, "Position") - CoreFunctions.GetLocalCharacterPosition()).Magnitude <= RenderDistance

    					if Settings.AliveCheck then
    						Checks.Alive = __index(PartHumanoid, "Health") > 0
    					end

    					Checks.Ready = Checks.Ready and Checks.Alive and IsInDistance and Environment.Settings.EntityESP

    					return
    				end

    				local vm = playerToViewmodel[Player]
    				local vmPart = vm and (FindFirstChild(vm, "torso") or FindFirstChild(vm, "head"))

    				local IsInDistance

    				if vm and vmPart then
    					Checks.Alive = true
    					Checks.Team = true

    					if Settings.AliveCheck then
    						local _char = __index(Player, "Character")
    						local _hum = _char and FindFirstChildOfClass(_char, "Humanoid")
    						Checks.Alive = not _hum or __index(_hum, "Health") > 0
    					end

    					if Settings.TeamCheck then
    						Checks.Team = Player:GetAttribute("Team") ~= LocalPlayer:GetAttribute("Team")
    					end

    					IsInDistance = (__index(vmPart, "Position") - CoreFunctions.GetLocalCharacterPosition()).Magnitude <= RenderDistance
    				else
    					Checks.Alive = false
    					Checks.Team = false

    					if DeveloperSettings.UnwrapOnCharacterAbsence then
    						self.UnwrapObject(Hash)
    					end
    				end

    				Checks.Ready = Checks.Alive and Checks.Team and not Settings.PartsOnly and IsInDistance

    				if Checks.Ready then
    					if Humanoid then
    						Entry.Humanoid = Humanoid
    					end

    					local Part = IsAPlayer and (FindFirstChild(Players, __index(Player, "Name")) and __index(Player, "Character"))
    					Part = IsAPlayer and (Part and (__index(Part, "PrimaryPart") or FindFirstChild(Part, "HumanoidRootPart"))) or Player

    					Entry.RigType = Humanoid and FindFirstChild(__index(Part, "Parent"), "Torso") and "R6" or "R15"
    					Entry.RigType = Entry.RigType == "N/A" and Humanoid and (__index(Humanoid, "RigType") == 0 and "R6" or "R15") or "N/A" -- Deprecated method (might be faulty sometimes)
    					Entry.RigType = Entry.RigType == "N/A" and Humanoid and (__index(Humanoid, "RigType") == Enum.HumanoidRigType.R6 and "R6" or "R15") or "N/A" -- Secondary check
    					if IsAPlayer and Entry.RigType == "N/A" and playerToViewmodel[Player] then
    						Entry.RigType = "Viewmodel"
    					end
    				end
    			end)
    		end,

    		GetObjectEntry = function(Object, Hash)
    			Hash = type(Object) == "string" and Object or Hash

    			for _, Value in next, Environment.UtilityAssets.WrappedObjects do
    				if Hash and Value.Hash == Hash or Value.Object == Object then
    					return Value
    				end
    			end
    		end,

    		WrapObject = function(self, Object, PseudoName, Allowed, RenderDistance)
    			assert(self, "EXUNYS_ESP > UtilityFunctions.WrapObject - Internal error, unassigned parameter \"self\".")

    			--// Because gethiddenproperty behaves differently on Xeno, this part breaks the code. This is the universal solution.

    			-- if pcall(gethiddenproperty, Object, "PrimaryPart") then
    			-- 	Object = __index(Object, "PrimaryPart")
    			-- end

    			do
    				local Signal = {pcall(gethiddenproperty, Object, "PrimaryPart")}

    				if Signal[1] and Signal[2] ~= nil and typeof(Signal[2]) ~= "number" then
    					Object = __index(Object, "PrimaryPart")
    				end
    			end

    			if not Object then
    				return
    			end

    			if Object == LocalPlayer then
    				return
    			end

    			local DeveloperSettings = Environment.DeveloperSettings
    			local WrappedObjects = Environment.UtilityAssets.WrappedObjects

    			for _, Value in next, WrappedObjects do
    				if Value.Object == Object then
    					return
    				end
    			end

    			local Entry = {
    				Hash = CoreFunctions.GenerateHash(0x100),

    				Object = Object,
    				Allowed = Allowed,
    				Name = PseudoName or __index(Object, "Name"),
    				DisplayName = PseudoName or __index(Object, (IsA(Object, "Player") and "Display" or "").."Name"),
    				RenderDistance = RenderDistance or Inf,

    				IsAPlayer = IsA(Object, "Player") or __index(Object, "ClassName") == "Player",
    				PartHasCharacter = false,
    				RigType = "N/A",
    				Humanoid = nil,

    				Checks = {
    					Alive = true,
    					Team = true,
    					Ready = false
    				},

    				Visuals = {
    					ESP = {},
    					Tracer = {},
    					Box = {},
    					HealthBar = {},
    					HeadDot = {},
    					Skeleton = {},
    				},

    				Connections = {}
    			}

    			repeat
    				wait(0)
    			until Entry.IsAPlayer and FindFirstChildOfClass(__index(Entry.Object, "Character"), "Humanoid") or true

    			if not Entry.IsAPlayer then
    				if not pcall(function()
    						return __index(Entry.Object, "Position"), __index(Entry.Object, "CFrame")
    					end) then
    					warn("EXUNYS_ESP > UtilityFunctions.WrapObject - Attempted to wrap object of an unsupported class type: \""..(__index(Entry.Object, "ClassName") or "N / A").."\"")
    					return self.UnwrapObject(Entry.Hash)
    				end

    				Entry.Connections.UnwrapSignal = Connect(Entry.Object.Changed, function(Property)
    					if Property == "Parent" and not IsDescendantOf(__index(Entry.Object, Property), Workspace) then
    						self.UnwrapObject(nil, Entry.Hash)
    					end
    				end)
    			end

    			local Humanoid = Entry.IsAPlayer and FindFirstChildOfClass(__index(Entry.Object, "Character"), "Humanoid") or FindFirstChildOfClass(__index(Entry.Object, "Parent"), "Humanoid")

    			Entry.PartHasCharacter = not Entry.IsAPlayer and Humanoid
    			Entry.RigType = Humanoid and (__index(Humanoid, "RigType") == 0 and "R6" or "R15") or "N/A"
    			Entry.Humanoid = Humanoid

    			self:InitChecks(Entry)

    			spawn(function()
    				repeat
    					wait(0)
    				until Entry.Checks.Ready

    				CreatingFunctions.Box(Entry)
    				CreatingFunctions.Tracer(Entry)
    				CreatingFunctions.HealthBar(Entry)
    				CreatingFunctions.ESP(Entry)
    				CreatingFunctions.HeadDot(Entry)
    				CreatingFunctions.Skeleton(Entry)

    				--delay(1, CoreFunctions.ResetScreenDistortion, CoreFunctions)
    			end)

    			WrappedObjects[Entry.Hash] = Entry

    			Entry.Connections.PlayerUnwrapSignal = Connect(Entry.Object.Changed, function(Property)
    				if DeveloperSettings.UnwrapOnCharacterAbsence and Property == "Parent" and not IsDescendantOf(__index(Entry.Object, (Entry.IsAPlayer and "Character" or Property)), Workspace) then
    					self.UnwrapObject(nil, Entry.Hash)
    				end
    			end)

    			return Entry.Hash
    		end,

    		UnwrapObject = function(Object, Hash)
    			Hash = type(Object) == "string" and Object
    			Object = type(Object) == "string" and nil

    			for _, Value in next, Environment.UtilityAssets.WrappedObjects do
    				if Value.Object == Object or Value.Hash == Hash then
    					for _, _Value in next, Value.Connections do
    						pcall(Disconnect, _Value)
    					end

    					if Value.Visuals then
    						Recursive(Value.Visuals, function(_, _Value)
    							if type(_Value) == "table" and _Value then
    								pcall(_Value.Remove, _Value)
    							end
    						end)
    					end

    					Environment.UtilityAssets.WrappedObjects[Hash] = nil; break
    				end
    			end
    		end
    	}
        end)()

        local LoadESP; LPH_NO_VIRTUALIZE(function()
    	LoadESP = function()
    		local ServiceConnections = Environment.UtilityAssets.ServiceConnections

    		ServiceConnections.UpdateCoreParameters = Connect(__index(RunService, Environment.DeveloperSettings.UpdateMode), function()
    			FrameTick = tick()
    			Rainbow = CoreFunctions.GetRainbowColor()
    			CameraCFrame = __index(CurrentCamera, "CFrame")
    			CameraViewportSize = __index(CurrentCamera, "ViewportSize")
    		end)

    		ServiceConnections.PlayerRemoving = Connect(__index(Players, "PlayerRemoving"), UtilityFunctions.UnwrapObject)

    		local lastStateObjectSync = 0
    		ServiceConnections.StateObjectSync = Connect(__index(RunService, "Heartbeat"), function()
    			local now = tick()
    			if now - lastStateObjectSync < 3 then return end
    			lastStateObjectSync = now

    			local newViewmodelMap = {}

    			for _, character in StateObject.get_all("Character") do
    				local Player = character.owner and character.owner:get()
    				if not Player or Player == LocalPlayer then continue end

    				local vm = character.values and character.values.viewmodels
    				if vm then newViewmodelMap[Player] = vm end

    				local alreadyWrapped = false
    				for _, v in next, Environment.UtilityAssets.WrappedObjects do
    					if v.Object == Player then
    						alreadyWrapped = true
    						break
    					end
    				end

    				if not alreadyWrapped then
    					UtilityFunctions:WrapObject(Player)
    				end
    			end

    			playerToViewmodel = newViewmodelMap
    			local _count = 0; for _ in pairs(newViewmodelMap) do _count += 1 end
    			--print("[ESP sync] playerToViewmodel refreshed, entries: " .. tostring(_count))
    			for player, vm in pairs(newViewmodelMap) do
    				--print("  [" .. tostring(player.Name) .. "] vm=" .. tostring(vm) .. " class=" .. tostring(typeof(vm)) .. " parent=" .. tostring(vm and vm.Parent))
    				if typeof(vm) == "Instance" then
    					for _, child in ipairs(vm:GetChildren()) do
    						--print("    child: " .. child.Name .. " [" .. child.ClassName .. "]")
    					end
    				end
    			end
    		end)

    		--// Wrap all players that currently have an active character via StateObject

    		--print("[ESP init] initial StateObject character scan:")
    		for _, character in StateObject.get_all("Character") do
    			local Player = character.owner and character.owner:get()
    			if Player and Player ~= LocalPlayer then
    				local vm = character.values and character.values.viewmodels
    				--print("  player=" .. tostring(Player and Player.Name) .. " vm=" .. tostring(vm) .. " class=" .. tostring(typeof(vm)) .. " parent=" .. tostring(vm and vm.Parent))
    				if vm and typeof(vm) == "Instance" then
    					for _, child in ipairs(vm:GetChildren()) do
    						--print("    child: " .. child.Name .. " [" .. child.ClassName .. "]")
    					end
    				end
    				if vm then playerToViewmodel[Player] = vm end
    				UtilityFunctions:WrapObject(Player)
    			end
    		end

    		--// Entity ESP

    		for _, Value in next, workspace:GetDescendants() do
    			if Value:IsA("Humanoid") then
    				local PotentialCharacter = Value.Parent:IsA("Model") and Value.Parent

    				if PotentialCharacter and not GetPlayerFromCharacter(PotentialCharacter) and FindFirstChild(PotentialCharacter, "Head") and (__index(PotentialCharacter, "PrimaryPart") or FindFirstChild(PotentialCharacter, "HumanoidRootPart")) then
    					UtilityFunctions:WrapObject(PotentialCharacter, PotentialCharacter.Name)
    				end
    			end
    		end

    		ServiceConnections.Entity_DescendantAdded = Connect(__index(workspace, "DescendantAdded"), function(Value)
    			if Value:IsA("Model") and Value:FindFirstChildOfClass("Humanoid") and not GetPlayerFromCharacter(Value) and (__index(Value, "PrimaryPart") or FindFirstChild(Value, "HumanoidRootPart")) then
    				UtilityFunctions:WrapObject(Value.Parent, Value.Parent.Name)
    			end
    		end)
    	end
        end)()

        setmetatable(Environment, {
    	__call = function()
    		if Loaded then
    			return
    		end

    		Loaded = true
    		return LoadESP()
    	end
        })

        pcall(spawn, function()
    	if Environment.Settings.LoadConfigOnLaunch then
    		repeat wait(0) until Environment.LoadConfiguration

    		Environment:LoadConfiguration()
    	end
        end)

        --// Interactive User Methods

        Environment.UnwrapPlayers = function() -- (<void>) => <boolean> Success Status
    	local UtilityAssets = Environment.UtilityAssets

    	local WrappedObjects = UtilityAssets.WrappedObjects
    	local ServiceConnections = UtilityAssets.ServiceConnections

    	for _, Entry in next, WrappedObjects do
    		pcall(UtilityFunctions.UnwrapObject, Entry.Hash)
    	end

    	for _, ConnectionIndex in next, {"PlayerRemoving", "PlayerAdded", "CharacterAdded"} do
    		pcall(Disconnect, ServiceConnections[ConnectionIndex])
    	end

    	return #WrappedObjects == 0
        end

        Environment.UnwrapAll = function(self) -- (self) => <boolean> Success Status
    	assert(self, "EXUNYS_ESP.UnwrapAll: Missing parameter #1 \"self\" <table>.")

    	self.UnwrapPlayers()

    	return #self.UtilityAssets.WrappedObjects == 0
        end

        Environment.Restart = function(self, RewriteEntries) -- (self[, <bool> Rewrite entries]) => <void>
    	assert(self, "EXUNYS_ESP.Restart: Missing parameter #1 \"self\" <table>.")

    	if Restarting then
    		return
    	end

    	Restarting = true

    	if RewriteEntries then
    		if self:UnwrapAll() then
    			self.Load()
    		end
    	else
    		local Objects = {}

    		for _, Value in next, self.UtilityAssets.WrappedObjects do
    			Objects[#Objects + 1] = {Value.Hash, Value.Object, Value.Name, Value.Allowed, Value.RenderDistance}
    		end

    		for _, Value in next, Objects do
    			self.UnwrapObject(Value[1])
    		end

    		wait(1)

    		for _, Value in next, Objects do
    			self.WrapObject(select(2, unpack(Value)))
    		end

    	end

    	Restarting = false
        end

        Environment.Exit = function(self) -- (self) => <void>
    	assert(self, "EXUNYS_ESP.Exit: Missing parameter #1 \"self\" <table>.")

    	if self:UnwrapAll() then
    		for _, Connection in next, self.UtilityAssets.ServiceConnections do
    			pcall(Disconnect, Connection)
    		end

    		for _, RenderObject in next, CrosshairParts do
    			pcall(RenderObject.Remove, RenderObject)
    		end

    		for _, Table in next, {CoreFunctions, UpdatingFunctions, CreatingFunctions, UtilityFunctions} do
    			for FunctionName, _ in next, Table do
    				Table[FunctionName] = nil
    			end

    			Table = nil
    		end

    		for Index, _ in next, Environment do
    			Environment[Index] = nil
    		end

    		LoadESP = nil; Recursive = nil; Loaded = false

    		if cleardrawcache then
    			cleardrawcache()
    		end

    		getgenv().ExunysDeveloperESP = nil; pcall(collectgarbage, "step", 200)
    	end
        end

        Environment.WrapObject = function(...) -- (<Instance> Object[, <string> Pseudo Name, <table> Allowed Visuals, <uint> Render Distance]) => <string> Hash
    	return UtilityFunctions:WrapObject(...)
        end

        Environment.UnwrapObject = UtilityFunctions.UnwrapObject -- (<Instance/string> Object/Hash[, <string> Hash]) => <void>

        Environment.WrapPlayers = LoadESP -- (<void>) => <void>

        Environment.GetEntry = UtilityFunctions.GetObjectEntry -- (<Instance> Object[, <string> Hash]) => <table> Entry

        Environment.Load = function() -- (<void>) => <void>
    	if Loaded then
    		return
    	end

    	LoadESP(); Loaded = true
        end

        Environment.UpdateConfiguration = function(DeveloperSettings, Settings, Properties) -- (<table> DeveloperSettings, <table> Settings, <table> Properties) => <table> New Environment
    	assert(DeveloperSettings, "EXUNYS_ESP.UpdateConfiguration: Missing parameter #1 \"DeveloperSettings\" <table>.")
    	assert(Settings, "EXUNYS_ESP.UpdateConfiguration: Missing parameter #2 \"Settings\" <table>.")
    	assert(Properties, "EXUNYS_ESP.UpdateConfiguration: Missing parameter #3 \"Properties\" <table>.")

    	getgenv().ExunysDeveloperESP.DeveloperSettings = DeveloperSettings
    	getgenv().ExunysDeveloperESP.Settings = Settings
    	getgenv().ExunysDeveloperESP.Properties = Properties

    	Environment = getgenv().ExunysDeveloperESP

    	return Environment
        end

        Environment.LoadConfiguration = function(self) -- (self) => <void>
    	assert(self, "EXUNYS_ESP.LoadConfiguration: Missing parameter #1 \"self\" <table>.")

    	local Path = self.DeveloperSettings.Path

    	if self:UnwrapAll() then
    		pcall(function()
    			local Configuration, Data = ConfigLibrary:LoadConfig(Path), {}

    			for _, Index in next, {"DeveloperSettings", "Settings", "Properties"} do
    				Data[#Data + 1] = ConfigLibrary:CloneTable(Configuration[Index])
    			end

    			self.UpdateConfiguration(unpack(Data))()
    		end)
    	end
        end

        Environment.SaveConfiguration = function(self) -- (self) => <void>
    	assert(self, "EXUNYS_ESP.SaveConfiguration: Missing parameter #1 \"self\" <table>.")

    	local DeveloperSettings = self.DeveloperSettings

    	ConfigLibrary:SaveConfig(DeveloperSettings.Path, {
    		DeveloperSettings = DeveloperSettings,
    		Settings = self.Settings,
    		Properties = self.Properties
    	})
        end

        ESP = Environment
    end

    ESP.Load()


    do
        local InputService = game:GetService('UserInputService');
        local TextService = game:GetService('TextService');
        local CoreGui = game:GetService('CoreGui');
        local Teams = game:GetService('Teams');
        local Players = game:GetService('Players');
        local RunService = game:GetService('RunService')
        local TweenService = game:GetService('TweenService');
        local RenderStepped = RunService.RenderStepped;
        local LocalPlayer = Players.LocalPlayer;
        local Mouse = LocalPlayer:GetMouse();

        local ProtectGui = protectgui or (syn and syn.protect_gui) or (function() end);

        local ScreenGui = Instance.new('ScreenGui');
        ProtectGui(ScreenGui);

        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global;
        ScreenGui.Parent = CoreGui;

        local Toggles = {};
        local Options = {};

        getgenv().Toggles = Toggles;
        getgenv().Options = Options;

        local Library = {
            Registry = {};
            RegistryMap = {};

            HudRegistry = {};

            FontColor = Color3.fromRGB(255, 255, 255);
            MainColor = Color3.fromRGB(28, 28, 28);
            BackgroundColor = Color3.fromRGB(20, 20, 20);
            AccentColor = Color3.fromRGB(0, 85, 255);
            OutlineColor = Color3.fromRGB(50, 50, 50);
            RiskColor = Color3.fromRGB(255, 50, 50),

            Black = Color3.new(0, 0, 0);
            Font = Enum.Font.Code,

            OpenedFrames = {};
            DependencyBoxes = {};

            Signals = {};
            ScreenGui = ScreenGui;
        };

        local RainbowStep = 0
        local Hue = 0

        table.insert(Library.Signals, RenderStepped:Connect(function(Delta)
            RainbowStep = RainbowStep + Delta

            if RainbowStep >= (1 / 60) then
                RainbowStep = 0

                Hue = Hue + (1 / 400);

                if Hue > 1 then
                    Hue = 0;
                end;

                Library.CurrentRainbowHue = Hue;
                Library.CurrentRainbowColor = Color3.fromHSV(Hue, 0.8, 1);
            end
        end))

        local function GetPlayersString()
            local PlayerList = Players:GetPlayers();

            for i = 1, #PlayerList do
                PlayerList[i] = PlayerList[i].Name;
            end;

            table.sort(PlayerList, function(str1, str2) return str1 < str2 end);

            return PlayerList;
        end;

        local function GetTeamsString()
            local TeamList = Teams:GetTeams();

            for i = 1, #TeamList do
                TeamList[i] = TeamList[i].Name;
            end;

            table.sort(TeamList, function(str1, str2) return str1 < str2 end);

            return TeamList;
        end;

        function Library:SafeCallback(f, ...)
            if (not f) then
                return;
            end;

            if not Library.NotifyOnError then
                return f(...);
            end;

            local success, event = pcall(f, ...);

            if not success then
                local _, i = event:find(":%d+: ");

                if not i then
                    return Library:Notify(event);
                end;

                return Library:Notify(event:sub(i + 1), 3);
            end;
        end;

        function Library:AttemptSave()
            if Library.SaveManager then
                Library.SaveManager:Save();
            end;
        end;

        function Library:Create(Class, Properties)
            local _Instance = Class;

            if type(Class) == 'string' then
                _Instance = Instance.new(Class);
            end;

            for Property, Value in next, Properties do
                _Instance[Property] = Value;
            end;

            return _Instance;
        end;

        function Library:ApplyTextStroke(Inst)
            Inst.TextStrokeTransparency = 1;

            Library:Create('UIStroke', {
                Color = Color3.new(0, 0, 0);
                Thickness = 1;
                LineJoinMode = Enum.LineJoinMode.Miter;
                Parent = Inst;
            });
        end;

        function Library:CreateLabel(Properties, IsHud)
            local _Instance = Library:Create('TextLabel', {
                BackgroundTransparency = 1;
                Font = Library.Font;
                TextColor3 = Library.FontColor;
                TextSize = 16;
                TextStrokeTransparency = 0;
            });

            Library:ApplyTextStroke(_Instance);

            Library:AddToRegistry(_Instance, {
                TextColor3 = 'FontColor';
            }, IsHud);

            return Library:Create(_Instance, Properties);
        end;

        function Library:MakeDraggable(Instance, Cutoff)
            Instance.Active = true;

            Instance.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local ObjPos = Vector2.new(
                        Mouse.X - Instance.AbsolutePosition.X,
                        Mouse.Y - Instance.AbsolutePosition.Y
                    );

                    if ObjPos.Y > (Cutoff or 40) then
                        return;
                    end;

                    while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        Instance.Position = UDim2.new(
                            0,
                            Mouse.X - ObjPos.X + (Instance.Size.X.Offset * Instance.AnchorPoint.X),
                            0,
                            Mouse.Y - ObjPos.Y + (Instance.Size.Y.Offset * Instance.AnchorPoint.Y)
                        );

                        RenderStepped:Wait();
                    end;
                end;
            end)
        end;

        function Library:AddToolTip(InfoStr, HoverInstance)
            local X, Y = Library:GetTextBounds(InfoStr, Library.Font, 14);
            local Tooltip = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor,
                BorderColor3 = Library.OutlineColor,

                Size = UDim2.fromOffset(X + 5, Y + 4),
                ZIndex = 100,
                Parent = Library.ScreenGui,

                Visible = false,
            })

            local Label = Library:CreateLabel({
                Position = UDim2.fromOffset(3, 1),
                Size = UDim2.fromOffset(X, Y);
                TextSize = 14;
                Text = InfoStr,
                TextColor3 = Library.FontColor,
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = Tooltip.ZIndex + 1,

                Parent = Tooltip;
            });

            Library:AddToRegistry(Tooltip, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            Library:AddToRegistry(Label, {
                TextColor3 = 'FontColor',
            });

            local IsHovering = false

            HoverInstance.MouseEnter:Connect(function()
                if Library:MouseIsOverOpenedFrame() then
                    return
                end

                IsHovering = true

                Tooltip.Position = UDim2.fromOffset(Mouse.X + 15, Mouse.Y + 12)
                Tooltip.Visible = true

                while IsHovering do
                    RunService.Heartbeat:Wait()
                    Tooltip.Position = UDim2.fromOffset(Mouse.X + 15, Mouse.Y + 12)
                end
            end)

            HoverInstance.MouseLeave:Connect(function()
                IsHovering = false
                Tooltip.Visible = false
            end)
        end

        function Library:OnHighlight(HighlightInstance, Instance, Properties, PropertiesDefault)
            HighlightInstance.MouseEnter:Connect(function()
                local Reg = Library.RegistryMap[Instance];

                for Property, ColorIdx in next, Properties do
                    Instance[Property] = Library[ColorIdx] or ColorIdx;

                    if Reg and Reg.Properties[Property] then
                        Reg.Properties[Property] = ColorIdx;
                    end;
                end;
            end)

            HighlightInstance.MouseLeave:Connect(function()
                local Reg = Library.RegistryMap[Instance];

                for Property, ColorIdx in next, PropertiesDefault do
                    Instance[Property] = Library[ColorIdx] or ColorIdx;

                    if Reg and Reg.Properties[Property] then
                        Reg.Properties[Property] = ColorIdx;
                    end;
                end;
            end)
        end;

        function Library:MouseIsOverOpenedFrame()
            for Frame, _ in next, Library.OpenedFrames do
                local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

                if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
                    and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

                    return true;
                end;
            end;
        end;

        function Library:IsMouseOverFrame(Frame)
            local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

            if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
                and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

                return true;
            end;
        end;

        function Library:UpdateDependencyBoxes()
            for _, Depbox in next, Library.DependencyBoxes do
                Depbox:Update();
            end;
        end;

        function Library:MapValue(Value, MinA, MaxA, MinB, MaxB)
            return (1 - ((Value - MinA) / (MaxA - MinA))) * MinB + ((Value - MinA) / (MaxA - MinA)) * MaxB;
        end;

        function Library:GetTextBounds(Text, Font, Size, Resolution)
            local Bounds = TextService:GetTextSize(Text, Size, Font, Resolution or Vector2.new(1920, 1080))
            return Bounds.X, Bounds.Y
        end;

        function Library:GetDarkerColor(Color)
            local H, S, V = Color3.toHSV(Color);
            return Color3.fromHSV(H, S, V / 1.5);
        end;
        Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor);

        function Library:AddToRegistry(Instance, Properties, IsHud)
            local Idx = #Library.Registry + 1;
            local Data = {
                Instance = Instance;
                Properties = Properties;
                Idx = Idx;
            };

            table.insert(Library.Registry, Data);
            Library.RegistryMap[Instance] = Data;

            if IsHud then
                table.insert(Library.HudRegistry, Data);
            end;
        end;

        function Library:RemoveFromRegistry(Instance)
            local Data = Library.RegistryMap[Instance];

            if Data then
                for Idx = #Library.Registry, 1, -1 do
                    if Library.Registry[Idx] == Data then
                        table.remove(Library.Registry, Idx);
                    end;
                end;

                for Idx = #Library.HudRegistry, 1, -1 do
                    if Library.HudRegistry[Idx] == Data then
                        table.remove(Library.HudRegistry, Idx);
                    end;
                end;

                Library.RegistryMap[Instance] = nil;
            end;
        end;

        function Library:UpdateColorsUsingRegistry()
            -- TODO: Could have an 'active' list of objects
            -- where the active list only contains Visible objects.

            -- IMPL: Could setup .Changed events on the AddToRegistry function
            -- that listens for the 'Visible' propert being changed.
            -- Visible: true => Add to active list, and call UpdateColors function
            -- Visible: false => Remove from active list.

            -- The above would be especially efficient for a rainbow menu color or live color-changing.

            for Idx, Object in next, Library.Registry do
                for Property, ColorIdx in next, Object.Properties do
                    if type(ColorIdx) == 'string' then
                        Object.Instance[Property] = Library[ColorIdx];
                    elseif type(ColorIdx) == 'function' then
                        Object.Instance[Property] = ColorIdx()
                    end
                end;
            end;
        end;

        function Library:GiveSignal(Signal)
            -- Only used for signals not attached to library instances, as those should be cleaned up on object destruction by Roblox
            table.insert(Library.Signals, Signal)
        end

        function Library:Unload()
            -- Unload all of the signals
            for Idx = #Library.Signals, 1, -1 do
                local Connection = table.remove(Library.Signals, Idx)
                Connection:Disconnect()
            end

            -- Call our unload callback, maybe to undo some hooks etc
            if Library.OnUnload then
                Library.OnUnload()
            end

            ScreenGui:Destroy()
        end

        function Library:OnUnload(Callback)
            Library.OnUnload = Callback
        end

        Library:GiveSignal(ScreenGui.DescendantRemoving:Connect(function(Instance)
            if Library.RegistryMap[Instance] then
                Library:RemoveFromRegistry(Instance);
            end;
        end))

        local BaseAddons = {};

        do
            local Funcs = {};

            function Funcs:AddColorPicker(Idx, Info)
                local ToggleLabel = self.TextLabel;
                -- local Container = self.Container;

                assert(Info.Default, 'AddColorPicker: Missing default value.');

                local ColorPicker = {
                    Value = Info.Default;
                    Transparency = Info.Transparency or 0;
                    Type = 'ColorPicker';
                    Title = type(Info.Title) == 'string' and Info.Title or 'Color picker',
                    Callback = Info.Callback or function(Color) end;
                };

                function ColorPicker:SetHSVFromRGB(Color)
                    local H, S, V = Color3.toHSV(Color);

                    ColorPicker.Hue = H;
                    ColorPicker.Sat = S;
                    ColorPicker.Vib = V;
                end;

                ColorPicker:SetHSVFromRGB(ColorPicker.Value);

                local DisplayFrame = Library:Create('Frame', {
                    BackgroundColor3 = ColorPicker.Value;
                    BorderColor3 = Library:GetDarkerColor(ColorPicker.Value);
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(0, 28, 0, 14);
                    ZIndex = 6;
                    Parent = ToggleLabel;
                });

                -- Transparency image taken from https://github.com/matas3535/SplixPrivateDrawingLibrary/blob/main/Library.lua cus i'm lazy
                local CheckerFrame = Library:Create('ImageLabel', {
                    BorderSizePixel = 0;
                    Size = UDim2.new(0, 27, 0, 13);
                    ZIndex = 5;
                    Image = 'http://www.roblox.com/asset/?id=12977615774';
                    Visible = not not Info.Transparency;
                    Parent = DisplayFrame;
                });

                -- 1/16/23
                -- Rewrote this to be placed inside the Library ScreenGui
                -- There was some issue which caused RelativeOffset to be way off
                -- Thus the color picker would never show

                local PickerFrameOuter = Library:Create('Frame', {
                    Name = 'Color';
                    BackgroundColor3 = Color3.new(1, 1, 1);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Position = UDim2.fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18),
                    Size = UDim2.fromOffset(230, Info.Transparency and 271 or 253);
                    Visible = false;
                    ZIndex = 15;
                    Parent = ScreenGui,
                });

                DisplayFrame:GetPropertyChangedSignal('AbsolutePosition'):Connect(function()
                    PickerFrameOuter.Position = UDim2.fromOffset(DisplayFrame.AbsolutePosition.X, DisplayFrame.AbsolutePosition.Y + 18);
                end)

                local PickerFrameInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 16;
                    Parent = PickerFrameOuter;
                });

                local Highlight = Library:Create('Frame', {
                    BackgroundColor3 = Library.AccentColor;
                    BorderSizePixel = 0;
                    Size = UDim2.new(1, 0, 0, 2);
                    ZIndex = 17;
                    Parent = PickerFrameInner;
                });

                local SatVibMapOuter = Library:Create('Frame', {
                    BorderColor3 = Color3.new(0, 0, 0);
                    Position = UDim2.new(0, 4, 0, 25);
                    Size = UDim2.new(0, 200, 0, 200);
                    ZIndex = 17;
                    Parent = PickerFrameInner;
                });

                local SatVibMapInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 18;
                    Parent = SatVibMapOuter;
                });

                local SatVibMap = Library:Create('ImageLabel', {
                    BorderSizePixel = 0;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 18;
                    Image = 'rbxassetid://4155801252';
                    Parent = SatVibMapInner;
                });

                local CursorOuter = Library:Create('ImageLabel', {
                    AnchorPoint = Vector2.new(0.5, 0.5);
                    Size = UDim2.new(0, 6, 0, 6);
                    BackgroundTransparency = 1;
                    Image = 'http://www.roblox.com/asset/?id=9619665977';
                    ImageColor3 = Color3.new(0, 0, 0);
                    ZIndex = 19;
                    Parent = SatVibMap;
                });

                local CursorInner = Library:Create('ImageLabel', {
                    Size = UDim2.new(0, CursorOuter.Size.X.Offset - 2, 0, CursorOuter.Size.Y.Offset - 2);
                    Position = UDim2.new(0, 1, 0, 1);
                    BackgroundTransparency = 1;
                    Image = 'http://www.roblox.com/asset/?id=9619665977';
                    ZIndex = 20;
                    Parent = CursorOuter;
                })

                local HueSelectorOuter = Library:Create('Frame', {
                    BorderColor3 = Color3.new(0, 0, 0);
                    Position = UDim2.new(0, 208, 0, 25);
                    Size = UDim2.new(0, 15, 0, 200);
                    ZIndex = 17;
                    Parent = PickerFrameInner;
                });

                local HueSelectorInner = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(1, 1, 1);
                    BorderSizePixel = 0;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 18;
                    Parent = HueSelectorOuter;
                });

                local HueCursor = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(1, 1, 1);
                    AnchorPoint = Vector2.new(0, 0.5);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(1, 0, 0, 1);
                    ZIndex = 18;
                    Parent = HueSelectorInner;
                });

                local HueBoxOuter = Library:Create('Frame', {
                    BorderColor3 = Color3.new(0, 0, 0);
                    Position = UDim2.fromOffset(4, 228),
                    Size = UDim2.new(0.5, -6, 0, 20),
                    ZIndex = 18,
                    Parent = PickerFrameInner;
                });

                local HueBoxInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 18,
                    Parent = HueBoxOuter;
                });

                Library:Create('UIGradient', {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 212, 212))
                    });
                    Rotation = 90;
                    Parent = HueBoxInner;
                });

                local HueBox = Library:Create('TextBox', {
                    BackgroundTransparency = 1;
                    Position = UDim2.new(0, 5, 0, 0);
                    Size = UDim2.new(1, -5, 1, 0);
                    Font = Library.Font;
                    PlaceholderColor3 = Color3.fromRGB(190, 190, 190);
                    PlaceholderText = 'Hex color',
                    Text = '#FFFFFF',
                    TextColor3 = Library.FontColor;
                    TextSize = 14;
                    TextStrokeTransparency = 0;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 20,
                    Parent = HueBoxInner;
                });

                Library:ApplyTextStroke(HueBox);

                local RgbBoxBase = Library:Create(HueBoxOuter:Clone(), {
                    Position = UDim2.new(0.5, 2, 0, 228),
                    Size = UDim2.new(0.5, -6, 0, 20),
                    Parent = PickerFrameInner
                });

                local RgbBox = Library:Create(RgbBoxBase.Frame:FindFirstChild('TextBox'), {
                    Text = '255, 255, 255',
                    PlaceholderText = 'RGB color',
                    TextColor3 = Library.FontColor
                });

                local TransparencyBoxOuter, TransparencyBoxInner, TransparencyCursor;

                if Info.Transparency then
                    TransparencyBoxOuter = Library:Create('Frame', {
                        BorderColor3 = Color3.new(0, 0, 0);
                        Position = UDim2.fromOffset(4, 251);
                        Size = UDim2.new(1, -8, 0, 15);
                        ZIndex = 19;
                        Parent = PickerFrameInner;
                    });

                    TransparencyBoxInner = Library:Create('Frame', {
                        BackgroundColor3 = ColorPicker.Value;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, 0, 1, 0);
                        ZIndex = 19;
                        Parent = TransparencyBoxOuter;
                    });

                    Library:AddToRegistry(TransparencyBoxInner, { BorderColor3 = 'OutlineColor' });

                    Library:Create('ImageLabel', {
                        BackgroundTransparency = 1;
                        Size = UDim2.new(1, 0, 1, 0);
                        Image = 'http://www.roblox.com/asset/?id=12978095818';
                        ZIndex = 20;
                        Parent = TransparencyBoxInner;
                    });

                    TransparencyCursor = Library:Create('Frame', {
                        BackgroundColor3 = Color3.new(1, 1, 1);
                        AnchorPoint = Vector2.new(0.5, 0);
                        BorderColor3 = Color3.new(0, 0, 0);
                        Size = UDim2.new(0, 1, 1, 0);
                        ZIndex = 21;
                        Parent = TransparencyBoxInner;
                    });
                end;

                local DisplayLabel = Library:CreateLabel({
                    Size = UDim2.new(1, 0, 0, 14);
                    Position = UDim2.fromOffset(5, 5);
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextSize = 14;
                    Text = ColorPicker.Title,--Info.Default;
                    TextWrapped = false;
                    ZIndex = 16;
                    Parent = PickerFrameInner;
                });


                local ContextMenu = {}
                do
                    ContextMenu.Options = {}
                    ContextMenu.Container = Library:Create('Frame', {
                        BorderColor3 = Color3.new(),
                        ZIndex = 14,

                        Visible = false,
                        Parent = ScreenGui
                    })

                    ContextMenu.Inner = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.fromScale(1, 1);
                        ZIndex = 15;
                        Parent = ContextMenu.Container;
                    });

                    Library:Create('UIListLayout', {
                        Name = 'Layout',
                        FillDirection = Enum.FillDirection.Vertical;
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        Parent = ContextMenu.Inner;
                    });

                    Library:Create('UIPadding', {
                        Name = 'Padding',
                        PaddingLeft = UDim.new(0, 4),
                        Parent = ContextMenu.Inner,
                    });

                    local function updateMenuPosition()
                        ContextMenu.Container.Position = UDim2.fromOffset(
                            (DisplayFrame.AbsolutePosition.X + DisplayFrame.AbsoluteSize.X) + 4,
                            DisplayFrame.AbsolutePosition.Y + 1
                        )
                    end

                    local function updateMenuSize()
                        local menuWidth = 60
                        for i, label in next, ContextMenu.Inner:GetChildren() do
                            if label:IsA('TextLabel') then
                                menuWidth = math.max(menuWidth, label.TextBounds.X)
                            end
                        end

                        ContextMenu.Container.Size = UDim2.fromOffset(
                            menuWidth + 8,
                            ContextMenu.Inner.Layout.AbsoluteContentSize.Y + 4
                        )
                    end

                    DisplayFrame:GetPropertyChangedSignal('AbsolutePosition'):Connect(updateMenuPosition)
                    ContextMenu.Inner.Layout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(updateMenuSize)

                    task.spawn(updateMenuPosition)
                    task.spawn(updateMenuSize)

                    Library:AddToRegistry(ContextMenu.Inner, {
                        BackgroundColor3 = 'BackgroundColor';
                        BorderColor3 = 'OutlineColor';
                    });

                    function ContextMenu:Show()
                        self.Container.Visible = true
                    end

                    function ContextMenu:Hide()
                        self.Container.Visible = false
                    end

                    function ContextMenu:AddOption(Str, Callback)
                        if type(Callback) ~= 'function' then
                            Callback = function() end
                        end

                        local Button = Library:CreateLabel({
                            Active = false;
                            Size = UDim2.new(1, 0, 0, 15);
                            TextSize = 13;
                            Text = Str;
                            ZIndex = 16;
                            Parent = self.Inner;
                            TextXAlignment = Enum.TextXAlignment.Left,
                        });

                        Library:OnHighlight(Button, Button,
                            { TextColor3 = 'AccentColor' },
                            { TextColor3 = 'FontColor' }
                        );

                        Button.InputBegan:Connect(function(Input)
                            if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                                return
                            end

                            Callback()
                        end)
                    end

                    ContextMenu:AddOption('Copy color', function()
                        Library.ColorClipboard = ColorPicker.Value
                        Library:Notify('Copied color!', 2)
                    end)

                    ContextMenu:AddOption('Paste color', function()
                        if not Library.ColorClipboard then
                            return Library:Notify('You have not copied a color!', 2)
                        end
                        ColorPicker:SetValueRGB(Library.ColorClipboard)
                    end)


                    ContextMenu:AddOption('Copy HEX', function()
                        pcall(setclipboard, ColorPicker.Value:ToHex())
                        Library:Notify('Copied hex code to clipboard!', 2)
                    end)

                    ContextMenu:AddOption('Copy RGB', function()
                        pcall(setclipboard, table.concat({ math.floor(ColorPicker.Value.R * 255), math.floor(ColorPicker.Value.G * 255), math.floor(ColorPicker.Value.B * 255) }, ', '))
                        Library:Notify('Copied RGB values to clipboard!', 2)
                    end)

                end

                Library:AddToRegistry(PickerFrameInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor'; });
                Library:AddToRegistry(Highlight, { BackgroundColor3 = 'AccentColor'; });
                Library:AddToRegistry(SatVibMapInner, { BackgroundColor3 = 'BackgroundColor'; BorderColor3 = 'OutlineColor'; });

                Library:AddToRegistry(HueBoxInner, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor'; });
                Library:AddToRegistry(RgbBoxBase.Frame, { BackgroundColor3 = 'MainColor'; BorderColor3 = 'OutlineColor'; });
                Library:AddToRegistry(RgbBox, { TextColor3 = 'FontColor', });
                Library:AddToRegistry(HueBox, { TextColor3 = 'FontColor', });

                local SequenceTable = {};

                for Hue = 0, 1, 0.1 do
                    table.insert(SequenceTable, ColorSequenceKeypoint.new(Hue, Color3.fromHSV(Hue, 1, 1)));
                end;

                local HueSelectorGradient = Library:Create('UIGradient', {
                    Color = ColorSequence.new(SequenceTable);
                    Rotation = 90;
                    Parent = HueSelectorInner;
                });

                HueBox.FocusLost:Connect(function(enter)
                    if enter then
                        local success, result = pcall(Color3.fromHex, HueBox.Text)
                        if success and typeof(result) == 'Color3' then
                            ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color3.toHSV(result)
                        end
                    end

                    ColorPicker:Display()
                end)

                RgbBox.FocusLost:Connect(function(enter)
                    if enter then
                        local r, g, b = RgbBox.Text:match('(%d+),%s*(%d+),%s*(%d+)')
                        if r and g and b then
                            ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib = Color3.toHSV(Color3.fromRGB(r, g, b))
                        end
                    end

                    ColorPicker:Display()
                end)

                function ColorPicker:Display()
                    ColorPicker.Value = Color3.fromHSV(ColorPicker.Hue, ColorPicker.Sat, ColorPicker.Vib);
                    SatVibMap.BackgroundColor3 = Color3.fromHSV(ColorPicker.Hue, 1, 1);

                    Library:Create(DisplayFrame, {
                        BackgroundColor3 = ColorPicker.Value;
                        BackgroundTransparency = ColorPicker.Transparency;
                        BorderColor3 = Library:GetDarkerColor(ColorPicker.Value);
                    });

                    if TransparencyBoxInner then
                        TransparencyBoxInner.BackgroundColor3 = ColorPicker.Value;
                        TransparencyCursor.Position = UDim2.new(1 - ColorPicker.Transparency, 0, 0, 0);
                    end;

                    CursorOuter.Position = UDim2.new(ColorPicker.Sat, 0, 1 - ColorPicker.Vib, 0);
                    HueCursor.Position = UDim2.new(0, 0, ColorPicker.Hue, 0);

                    HueBox.Text = '#' .. ColorPicker.Value:ToHex()
                    RgbBox.Text = table.concat({ math.floor(ColorPicker.Value.R * 255), math.floor(ColorPicker.Value.G * 255), math.floor(ColorPicker.Value.B * 255) }, ', ')

                    Library:SafeCallback(ColorPicker.Callback, ColorPicker.Value);
                    Library:SafeCallback(ColorPicker.Changed, ColorPicker.Value);
                end;

                function ColorPicker:OnChanged(Func)
                    ColorPicker.Changed = Func;
                    Func(ColorPicker.Value)
                end;

                function ColorPicker:Show()
                    for Frame, Val in next, Library.OpenedFrames do
                        if Frame.Name == 'Color' then
                            Frame.Visible = false;
                            Library.OpenedFrames[Frame] = nil;
                        end;
                    end;

                    PickerFrameOuter.Visible = true;
                    Library.OpenedFrames[PickerFrameOuter] = true;
                end;

                function ColorPicker:Hide()
                    PickerFrameOuter.Visible = false;
                    Library.OpenedFrames[PickerFrameOuter] = nil;
                end;

                function ColorPicker:SetValue(HSV, Transparency)
                    local Color = Color3.fromHSV(HSV[1], HSV[2], HSV[3]);

                    ColorPicker.Transparency = Transparency or 0;
                    ColorPicker:SetHSVFromRGB(Color);
                    ColorPicker:Display();
                end;

                function ColorPicker:SetValueRGB(Color, Transparency)
                    ColorPicker.Transparency = Transparency or 0;
                    ColorPicker:SetHSVFromRGB(Color);
                    ColorPicker:Display();
                end;

                SatVibMap.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local MinX = SatVibMap.AbsolutePosition.X;
                            local MaxX = MinX + SatVibMap.AbsoluteSize.X;
                            local MouseX = math.clamp(Mouse.X, MinX, MaxX);

                            local MinY = SatVibMap.AbsolutePosition.Y;
                            local MaxY = MinY + SatVibMap.AbsoluteSize.Y;
                            local MouseY = math.clamp(Mouse.Y, MinY, MaxY);

                            ColorPicker.Sat = (MouseX - MinX) / (MaxX - MinX);
                            ColorPicker.Vib = 1 - ((MouseY - MinY) / (MaxY - MinY));
                            ColorPicker:Display();

                            RenderStepped:Wait();
                        end;

                        Library:AttemptSave();
                    end;
                end);

                HueSelectorInner.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local MinY = HueSelectorInner.AbsolutePosition.Y;
                            local MaxY = MinY + HueSelectorInner.AbsoluteSize.Y;
                            local MouseY = math.clamp(Mouse.Y, MinY, MaxY);

                            ColorPicker.Hue = ((MouseY - MinY) / (MaxY - MinY));
                            ColorPicker:Display();

                            RenderStepped:Wait();
                        end;

                        Library:AttemptSave();
                    end;
                end);

                DisplayFrame.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        if PickerFrameOuter.Visible then
                            ColorPicker:Hide()
                        else
                            ContextMenu:Hide()
                            ColorPicker:Show()
                        end;
                    elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and not Library:MouseIsOverOpenedFrame() then
                        ContextMenu:Show()
                        ColorPicker:Hide()
                    end
                end);

                if TransparencyBoxInner then
                    TransparencyBoxInner.InputBegan:Connect(function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                local MinX = TransparencyBoxInner.AbsolutePosition.X;
                                local MaxX = MinX + TransparencyBoxInner.AbsoluteSize.X;
                                local MouseX = math.clamp(Mouse.X, MinX, MaxX);

                                ColorPicker.Transparency = 1 - ((MouseX - MinX) / (MaxX - MinX));

                                ColorPicker:Display();

                                RenderStepped:Wait();
                            end;

                            Library:AttemptSave();
                        end;
                    end);
                end;

                Library:GiveSignal(InputService.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local AbsPos, AbsSize = PickerFrameOuter.AbsolutePosition, PickerFrameOuter.AbsoluteSize;

                        if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                            or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                            ColorPicker:Hide();
                        end;

                        if not Library:IsMouseOverFrame(ContextMenu.Container) then
                            ContextMenu:Hide()
                        end
                    end;

                    if Input.UserInputType == Enum.UserInputType.MouseButton2 and ContextMenu.Container.Visible then
                        if not Library:IsMouseOverFrame(ContextMenu.Container) and not Library:IsMouseOverFrame(DisplayFrame) then
                            ContextMenu:Hide()
                        end
                    end
                end))

                ColorPicker:Display();
                ColorPicker.DisplayFrame = DisplayFrame

                Options[Idx] = ColorPicker;

                return self;
            end;

            function Funcs:AddKeyPicker(Idx, Info)
                local ParentObj = self;
                local ToggleLabel = self.TextLabel;
                local Container = self.Container;

                assert(Info.Default, 'AddKeyPicker: Missing default value.');

                local KeyPicker = {
                    Value = Info.Default;
                    Toggled = false;
                    Mode = Info.Mode or 'Toggle'; -- Always, Toggle, Hold
                    Type = 'KeyPicker';
                    Callback = Info.Callback or function(Value) end;
                    ChangedCallback = Info.ChangedCallback or function(New) end;

                    SyncToggleState = Info.SyncToggleState or false;
                };

                if KeyPicker.SyncToggleState then
                    Info.Modes = { 'Toggle' }
                    Info.Mode = 'Toggle'
                end

                local PickOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(0, 28, 0, 15);
                    ZIndex = 6;
                    Parent = ToggleLabel;
                });

                local PickInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 7;
                    Parent = PickOuter;
                });

                Library:AddToRegistry(PickInner, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                local DisplayLabel = Library:CreateLabel({
                    Size = UDim2.new(1, 0, 1, 0);
                    TextSize = 13;
                    Text = Info.Default;
                    TextWrapped = true;
                    ZIndex = 8;
                    Parent = PickInner;
                });

                local ModeSelectOuter = Library:Create('Frame', {
                    BorderColor3 = Color3.new(0, 0, 0);
                    Position = UDim2.fromOffset(ToggleLabel.AbsolutePosition.X + ToggleLabel.AbsoluteSize.X + 4, ToggleLabel.AbsolutePosition.Y + 1);
                    Size = UDim2.new(0, 60, 0, 45 + 2);
                    Visible = false;
                    ZIndex = 14;
                    Parent = ScreenGui;
                });

                ToggleLabel:GetPropertyChangedSignal('AbsolutePosition'):Connect(function()
                    ModeSelectOuter.Position = UDim2.fromOffset(ToggleLabel.AbsolutePosition.X + ToggleLabel.AbsoluteSize.X + 4, ToggleLabel.AbsolutePosition.Y + 1);
                end);

                local ModeSelectInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 15;
                    Parent = ModeSelectOuter;
                });

                Library:AddToRegistry(ModeSelectInner, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                Library:Create('UIListLayout', {
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = ModeSelectInner;
                });

                local ContainerLabel = Library:CreateLabel({
                    TextXAlignment = Enum.TextXAlignment.Left;
                    Size = UDim2.new(1, 0, 0, 18);
                    TextSize = 13;
                    Visible = false;
                    ZIndex = 110;
                    Parent = Library.KeybindContainer;
                },  true);

                local Modes = Info.Modes or { 'Always', 'Toggle', 'Hold' };
                local ModeButtons = {};

                for Idx, Mode in next, Modes do
                    local ModeButton = {};

                    local Label = Library:CreateLabel({
                        Active = false;
                        Size = UDim2.new(1, 0, 0, 15);
                        TextSize = 13;
                        Text = Mode;
                        ZIndex = 16;
                        Parent = ModeSelectInner;
                    });

                    function ModeButton:Select()
                        for _, Button in next, ModeButtons do
                            Button:Deselect();
                        end;

                        KeyPicker.Mode = Mode;

                        Label.TextColor3 = Library.AccentColor;
                        Library.RegistryMap[Label].Properties.TextColor3 = 'AccentColor';

                        ModeSelectOuter.Visible = false;
                    end;

                    function ModeButton:Deselect()
                        KeyPicker.Mode = nil;

                        Label.TextColor3 = Library.FontColor;
                        Library.RegistryMap[Label].Properties.TextColor3 = 'FontColor';
                    end;

                    Label.InputBegan:Connect(function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            ModeButton:Select();
                            Library:AttemptSave();
                        end;
                    end);

                    if Mode == KeyPicker.Mode then
                        ModeButton:Select();
                    end;

                    ModeButtons[Mode] = ModeButton;
                end;

                function KeyPicker:Update()
                    if Info.NoUI then
                        return;
                    end;

                    local State = KeyPicker:GetState();

                    ContainerLabel.Text = string.format('[%s] %s (%s)', KeyPicker.Value, Info.Text, KeyPicker.Mode);

                    ContainerLabel.Visible = true;
                    ContainerLabel.TextColor3 = State and Library.AccentColor or Library.FontColor;

                    Library.RegistryMap[ContainerLabel].Properties.TextColor3 = State and 'AccentColor' or 'FontColor';

                    local YSize = 0
                    local XSize = 0

                    for _, Label in next, Library.KeybindContainer:GetChildren() do
                        if Label:IsA('TextLabel') and Label.Visible then
                            YSize = YSize + 18;
                            if (Label.TextBounds.X > XSize) then
                                XSize = Label.TextBounds.X
                            end
                        end;
                    end;

                    Library.KeybindFrame.Size = UDim2.new(0, math.max(XSize + 10, 210), 0, YSize + 23)
                end;

                function KeyPicker:GetState()
                    if KeyPicker.Mode == 'Always' then
                        return true;
                    elseif KeyPicker.Mode == 'Hold' then
                        if KeyPicker.Value == 'None' then
                            return false;
                        end

                        local Key = KeyPicker.Value;

                        if Key == 'MB1' or Key == 'MB2' then
                            return Key == 'MB1' and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
                                or Key == 'MB2' and InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2);
                        else
                            return InputService:IsKeyDown(Enum.KeyCode[KeyPicker.Value]);
                        end;
                    else
                        return KeyPicker.Toggled;
                    end;
                end;

                function KeyPicker:SetValue(Data)
                    local Key, Mode = Data[1], Data[2];
                    DisplayLabel.Text = Key;
                    KeyPicker.Value = Key;
                    ModeButtons[Mode]:Select();
                    KeyPicker:Update();
                end;

                function KeyPicker:OnClick(Callback)
                    KeyPicker.Clicked = Callback
                end

                function KeyPicker:OnChanged(Callback)
                    KeyPicker.Changed = Callback
                    Callback(KeyPicker.Value)
                end

                if ParentObj.Addons then
                    table.insert(ParentObj.Addons, KeyPicker)
                end

                function KeyPicker:DoClick()
                    if ParentObj.Type == 'Toggle' and KeyPicker.SyncToggleState then
                        ParentObj:SetValue(not ParentObj.Value)
                    end

                    Library:SafeCallback(KeyPicker.Callback, KeyPicker.Toggled)
                    Library:SafeCallback(KeyPicker.Clicked, KeyPicker.Toggled)
                end

                local Picking = false;

                PickOuter.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        Picking = true;

                        DisplayLabel.Text = '';

                        local Break;
                        local Text = '';

                        task.spawn(function()
                            while (not Break) do
                                if Text == '...' then
                                    Text = '';
                                end;

                                Text = Text .. '.';
                                DisplayLabel.Text = Text;

                                wait(0.4);
                            end;
                        end);

                        wait(0.2);

                        local Event;
                        Event = InputService.InputBegan:Connect(function(Input)
                            local Key;

                            if Input.UserInputType == Enum.UserInputType.Keyboard then
                                Key = Input.KeyCode.Name;
                            elseif Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                Key = 'MB1';
                            elseif Input.UserInputType == Enum.UserInputType.MouseButton2 then
                                Key = 'MB2';
                            end;

                            Break = true;
                            Picking = false;

                            DisplayLabel.Text = Key;
                            KeyPicker.Value = Key;

                            Library:SafeCallback(KeyPicker.ChangedCallback, Input.KeyCode or Input.UserInputType)
                            Library:SafeCallback(KeyPicker.Changed, Input.KeyCode or Input.UserInputType)

                            Library:AttemptSave();

                            Event:Disconnect();
                        end);
                    elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and not Library:MouseIsOverOpenedFrame() then
                        ModeSelectOuter.Visible = true;
                    end;
                end);

                Library:GiveSignal(InputService.InputBegan:Connect(function(Input)
                    if (not Picking) then
                        if KeyPicker.Mode == 'Toggle' then
                            local Key = KeyPicker.Value;

                            if Key == 'MB1' or Key == 'MB2' then
                                if Key == 'MB1' and Input.UserInputType == Enum.UserInputType.MouseButton1
                                or Key == 'MB2' and Input.UserInputType == Enum.UserInputType.MouseButton2 then
                                    KeyPicker.Toggled = not KeyPicker.Toggled
                                    KeyPicker:DoClick()
                                end;
                            elseif Input.UserInputType == Enum.UserInputType.Keyboard then
                                if Input.KeyCode.Name == Key then
                                    KeyPicker.Toggled = not KeyPicker.Toggled;
                                    KeyPicker:DoClick()
                                end;
                            end;
                        end;

                        KeyPicker:Update();
                    end;

                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local AbsPos, AbsSize = ModeSelectOuter.AbsolutePosition, ModeSelectOuter.AbsoluteSize;

                        if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                            or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                            ModeSelectOuter.Visible = false;
                        end;
                    end;
                end))

                Library:GiveSignal(InputService.InputEnded:Connect(function(Input)
                    if (not Picking) then
                        KeyPicker:Update();
                    end;
                end))

                KeyPicker:Update();

                Options[Idx] = KeyPicker;

                return self;
            end;

            BaseAddons.__index = Funcs;
            BaseAddons.__namecall = function(Table, Key, ...)
                return Funcs[Key](...);
            end;
        end;

        local BaseGroupbox = {};

        do
            local Funcs = {};

            function Funcs:AddBlank(Size)
                local Groupbox = self;
                local Container = Groupbox.Container;

                Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Size = UDim2.new(1, 0, 0, Size);
                    ZIndex = 1;
                    Parent = Container;
                });
            end;

            function Funcs:AddLabel(Text, DoesWrap)
                local Label = {};

                local Groupbox = self;
                local Container = Groupbox.Container;

                local TextLabel = Library:CreateLabel({
                    Size = UDim2.new(1, -4, 0, 15);
                    TextSize = 14;
                    Text = Text;
                    TextWrapped = DoesWrap or false,
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 5;
                    Parent = Container;
                });

                if DoesWrap then
                    local Y = select(2, Library:GetTextBounds(Text, Library.Font, 14, Vector2.new(TextLabel.AbsoluteSize.X, math.huge)))
                    TextLabel.Size = UDim2.new(1, -4, 0, Y)
                else
                    Library:Create('UIListLayout', {
                        Padding = UDim.new(0, 4);
                        FillDirection = Enum.FillDirection.Horizontal;
                        HorizontalAlignment = Enum.HorizontalAlignment.Right;
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        Parent = TextLabel;
                    });
                end

                Label.TextLabel = TextLabel;
                Label.Container = Container;

                function Label:SetText(Text)
                    TextLabel.Text = Text

                    if DoesWrap then
                        local Y = select(2, Library:GetTextBounds(Text, Library.Font, 14, Vector2.new(TextLabel.AbsoluteSize.X, math.huge)))
                        TextLabel.Size = UDim2.new(1, -4, 0, Y)
                    end

                    Groupbox:Resize();
                end

                if (not DoesWrap) then
                    setmetatable(Label, BaseAddons);
                end

                Groupbox:AddBlank(5);
                Groupbox:Resize();

                return Label;
            end;

            function Funcs:AddButton(...)
                -- TODO: Eventually redo this
                local Button = {};
                local function ProcessButtonParams(Class, Obj, ...)
                    local Props = select(1, ...)
                    if type(Props) == 'table' then
                        Obj.Text = Props.Text
                        Obj.Func = Props.Func
                        Obj.DoubleClick = Props.DoubleClick
                        Obj.Tooltip = Props.Tooltip
                    else
                        Obj.Text = select(1, ...)
                        Obj.Func = select(2, ...)
                    end

                    assert(type(Obj.Func) == 'function', 'AddButton: `Func` callback is missing.');
                end

                ProcessButtonParams('Button', Button, ...)

                local Groupbox = self;
                local Container = Groupbox.Container;

                local function CreateBaseButton(Button)
                    local Outer = Library:Create('Frame', {
                        BackgroundColor3 = Color3.new(0, 0, 0);
                        BorderColor3 = Color3.new(0, 0, 0);
                        Size = UDim2.new(1, -4, 0, 20);
                        ZIndex = 5;
                    });

                    local Inner = Library:Create('Frame', {
                        BackgroundColor3 = Library.MainColor;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, 0, 1, 0);
                        ZIndex = 6;
                        Parent = Outer;
                    });

                    local Label = Library:CreateLabel({
                        Size = UDim2.new(1, 0, 1, 0);
                        TextSize = 14;
                        Text = Button.Text;
                        ZIndex = 6;
                        Parent = Inner;
                    });

                    Library:Create('UIGradient', {
                        Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 212, 212))
                        });
                        Rotation = 90;
                        Parent = Inner;
                    });

                    Library:AddToRegistry(Outer, {
                        BorderColor3 = 'Black';
                    });

                    Library:AddToRegistry(Inner, {
                        BackgroundColor3 = 'MainColor';
                        BorderColor3 = 'OutlineColor';
                    });

                    Library:OnHighlight(Outer, Outer,
                        { BorderColor3 = 'AccentColor' },
                        { BorderColor3 = 'Black' }
                    );

                    return Outer, Inner, Label
                end

                local function InitEvents(Button)
                    local function WaitForEvent(event, timeout, validator)
                        local bindable = Instance.new('BindableEvent')
                        local connection = event:Once(function(...)

                            if type(validator) == 'function' and validator(...) then
                                bindable:Fire(true)
                            else
                                bindable:Fire(false)
                            end
                        end)
                        task.delay(timeout, function()
                            connection:disconnect()
                            bindable:Fire(false)
                        end)
                        return bindable.Event:Wait()
                    end

                    local function ValidateClick(Input)
                        if Library:MouseIsOverOpenedFrame() then
                            return false
                        end

                        if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                            return false
                        end

                        return true
                    end

                    Button.Outer.InputBegan:Connect(function(Input)
                        if not ValidateClick(Input) then return end
                        if Button.Locked then return end

                        if Button.DoubleClick then
                            Library:RemoveFromRegistry(Button.Label)
                            Library:AddToRegistry(Button.Label, { TextColor3 = 'AccentColor' })

                            Button.Label.TextColor3 = Library.AccentColor
                            Button.Label.Text = 'Are you sure?'
                            Button.Locked = true

                            local clicked = WaitForEvent(Button.Outer.InputBegan, 0.5, ValidateClick)

                            Library:RemoveFromRegistry(Button.Label)
                            Library:AddToRegistry(Button.Label, { TextColor3 = 'FontColor' })

                            Button.Label.TextColor3 = Library.FontColor
                            Button.Label.Text = Button.Text
                            task.defer(rawset, Button, 'Locked', false)

                            if clicked then
                                Library:SafeCallback(Button.Func)
                            end

                            return
                        end

                        Library:SafeCallback(Button.Func);
                    end)
                end

                Button.Outer, Button.Inner, Button.Label = CreateBaseButton(Button)
                Button.Outer.Parent = Container

                InitEvents(Button)

                function Button:AddTooltip(tooltip)
                    if type(tooltip) == 'string' then
                        Library:AddToolTip(tooltip, self.Outer)
                    end
                    return self
                end


                function Button:AddButton(...)
                    local SubButton = {}

                    ProcessButtonParams('SubButton', SubButton, ...)

                    self.Outer.Size = UDim2.new(0.5, -2, 0, 20)

                    SubButton.Outer, SubButton.Inner, SubButton.Label = CreateBaseButton(SubButton)

                    SubButton.Outer.Position = UDim2.new(1, 3, 0, 0)
                    SubButton.Outer.Size = UDim2.fromOffset(self.Outer.AbsoluteSize.X - 2, self.Outer.AbsoluteSize.Y)
                    SubButton.Outer.Parent = self.Outer

                    function SubButton:AddTooltip(tooltip)
                        if type(tooltip) == 'string' then
                            Library:AddToolTip(tooltip, self.Outer)
                        end
                        return SubButton
                    end

                    if type(SubButton.Tooltip) == 'string' then
                        SubButton:AddTooltip(SubButton.Tooltip)
                    end

                    InitEvents(SubButton)
                    return SubButton
                end

                if type(Button.Tooltip) == 'string' then
                    Button:AddTooltip(Button.Tooltip)
                end

                Groupbox:AddBlank(5);
                Groupbox:Resize();

                return Button;
            end;

            function Funcs:AddDivider()
                local Groupbox = self;
                local Container = self.Container

                local Divider = {
                    Type = 'Divider',
                }

                Groupbox:AddBlank(2);
                local DividerOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(1, -4, 0, 5);
                    ZIndex = 5;
                    Parent = Container;
                });

                local DividerInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = DividerOuter;
                });

                Library:AddToRegistry(DividerOuter, {
                    BorderColor3 = 'Black';
                });

                Library:AddToRegistry(DividerInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                Groupbox:AddBlank(9);
                Groupbox:Resize();
            end

            function Funcs:AddInput(Idx, Info)
                assert(Info.Text, 'AddInput: Missing `Text` string.')

                local Textbox = {
                    Value = Info.Default or '';
                    Numeric = Info.Numeric or false;
                    Finished = Info.Finished or false;
                    Type = 'Input';
                    Callback = Info.Callback or function(Value) end;
                };

                local Groupbox = self;
                local Container = Groupbox.Container;

                local InputLabel = Library:CreateLabel({
                    Size = UDim2.new(1, 0, 0, 15);
                    TextSize = 14;
                    Text = Info.Text;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 5;
                    Parent = Container;
                });

                Groupbox:AddBlank(1);

                local TextBoxOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(1, -4, 0, 20);
                    ZIndex = 5;
                    Parent = Container;
                });

                local TextBoxInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = TextBoxOuter;
                });

                Library:AddToRegistry(TextBoxInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                Library:OnHighlight(TextBoxOuter, TextBoxOuter,
                    { BorderColor3 = 'AccentColor' },
                    { BorderColor3 = 'Black' }
                );

                if type(Info.Tooltip) == 'string' then
                    Library:AddToolTip(Info.Tooltip, TextBoxOuter)
                end

                Library:Create('UIGradient', {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 212, 212))
                    });
                    Rotation = 90;
                    Parent = TextBoxInner;
                });

                local Container = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    ClipsDescendants = true;

                    Position = UDim2.new(0, 5, 0, 0);
                    Size = UDim2.new(1, -5, 1, 0);

                    ZIndex = 7;
                    Parent = TextBoxInner;
                })

                local Box = Library:Create('TextBox', {
                    BackgroundTransparency = 1;

                    Position = UDim2.fromOffset(0, 0),
                    Size = UDim2.fromScale(5, 1),

                    Font = Library.Font;
                    PlaceholderColor3 = Color3.fromRGB(190, 190, 190);
                    PlaceholderText = Info.Placeholder or '';

                    Text = Info.Default or '';
                    TextColor3 = Library.FontColor;
                    TextSize = 14;
                    TextStrokeTransparency = 0;
                    TextXAlignment = Enum.TextXAlignment.Left;

                    ZIndex = 7;
                    Parent = Container;
                });

                Library:ApplyTextStroke(Box);

                function Textbox:SetValue(Text)
                    if Info.MaxLength and #Text > Info.MaxLength then
                        Text = Text:sub(1, Info.MaxLength);
                    end;

                    if Textbox.Numeric then
                        if (not tonumber(Text)) and Text:len() > 0 then
                            Text = Textbox.Value
                        end
                    end

                    Textbox.Value = Text;
                    Box.Text = Text;

                    Library:SafeCallback(Textbox.Callback, Textbox.Value);
                    Library:SafeCallback(Textbox.Changed, Textbox.Value);
                end;

                if Textbox.Finished then
                    Box.FocusLost:Connect(function(enter)
                        if not enter then return end

                        Textbox:SetValue(Box.Text);
                        Library:AttemptSave();
                    end)
                else
                    Box:GetPropertyChangedSignal('Text'):Connect(function()
                        Textbox:SetValue(Box.Text);
                        Library:AttemptSave();
                    end);
                end

                -- https://devforum.roblox.com/t/how-to-make-textboxes-follow-current-cursor-position/1368429/6
                -- thank you nicemike40 :)

                local function Update()
                    local PADDING = 2
                    local reveal = Container.AbsoluteSize.X

                    if not Box:IsFocused() or Box.TextBounds.X <= reveal - 2 * PADDING then
                        -- we aren't focused, or we fit so be normal
                        Box.Position = UDim2.new(0, PADDING, 0, 0)
                    else
                        -- we are focused and don't fit, so adjust position
                        local cursor = Box.CursorPosition
                        if cursor ~= -1 then
                            -- calculate pixel width of text from start to cursor
                            local subtext = string.sub(Box.Text, 1, cursor-1)
                            local width = TextService:GetTextSize(subtext, Box.TextSize, Box.Font, Vector2.new(math.huge, math.huge)).X

                            -- check if we're inside the box with the cursor
                            local currentCursorPos = Box.Position.X.Offset + width

                            -- adjust if necessary
                            if currentCursorPos < PADDING then
                                Box.Position = UDim2.fromOffset(PADDING-width, 0)
                            elseif currentCursorPos > reveal - PADDING - 1 then
                                Box.Position = UDim2.fromOffset(reveal-width-PADDING-1, 0)
                            end
                        end
                    end
                end

                task.spawn(Update)

                Box:GetPropertyChangedSignal('Text'):Connect(Update)
                Box:GetPropertyChangedSignal('CursorPosition'):Connect(Update)
                Box.FocusLost:Connect(Update)
                Box.Focused:Connect(Update)

                Library:AddToRegistry(Box, {
                    TextColor3 = 'FontColor';
                });

                function Textbox:OnChanged(Func)
                    Textbox.Changed = Func;
                    Func(Textbox.Value);
                end;

                Groupbox:AddBlank(5);
                Groupbox:Resize();

                Options[Idx] = Textbox;

                return Textbox;
            end;

            function Funcs:AddToggle(Idx, Info)
                assert(Info.Text, 'AddInput: Missing `Text` string.')

                local Toggle = {
                    Value = Info.Default or false;
                    Type = 'Toggle';

                    Callback = Info.Callback or function(Value) end;
                    Addons = {},
                    Risky = Info.Risky,
                };

                local Groupbox = self;
                local Container = Groupbox.Container;

                local ToggleOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(0, 13, 0, 13);
                    ZIndex = 5;
                    Parent = Container;
                });

                Library:AddToRegistry(ToggleOuter, {
                    BorderColor3 = 'Black';
                });

                local ToggleInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = ToggleOuter;
                });

                Library:AddToRegistry(ToggleInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                local ToggleLabel = Library:CreateLabel({
                    Size = UDim2.new(0, 216, 1, 0);
                    Position = UDim2.new(1, 6, 0, 0);
                    TextSize = 14;
                    Text = Info.Text;
                    TextXAlignment = Enum.TextXAlignment.Left;
                    ZIndex = 6;
                    Parent = ToggleInner;
                });

                Library:Create('UIListLayout', {
                    Padding = UDim.new(0, 4);
                    FillDirection = Enum.FillDirection.Horizontal;
                    HorizontalAlignment = Enum.HorizontalAlignment.Right;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = ToggleLabel;
                });

                local ToggleRegion = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Size = UDim2.new(0, 170, 1, 0);
                    ZIndex = 8;
                    Parent = ToggleOuter;
                });

                Library:OnHighlight(ToggleRegion, ToggleOuter,
                    { BorderColor3 = 'AccentColor' },
                    { BorderColor3 = 'Black' }
                );

                function Toggle:UpdateColors()
                    Toggle:Display();
                end;

                if type(Info.Tooltip) == 'string' then
                    Library:AddToolTip(Info.Tooltip, ToggleRegion)
                end

                function Toggle:Display()
                    ToggleInner.BackgroundColor3 = Toggle.Value and Library.AccentColor or Library.MainColor;
                    ToggleInner.BorderColor3 = Toggle.Value and Library.AccentColorDark or Library.OutlineColor;

                    Library.RegistryMap[ToggleInner].Properties.BackgroundColor3 = Toggle.Value and 'AccentColor' or 'MainColor';
                    Library.RegistryMap[ToggleInner].Properties.BorderColor3 = Toggle.Value and 'AccentColorDark' or 'OutlineColor';
                end;

                function Toggle:OnChanged(Func)
                    Toggle.Changed = Func;
                    Func(Toggle.Value);
                end;

                function Toggle:SetValue(Bool)
                    Bool = (not not Bool);

                    Toggle.Value = Bool;
                    Toggle:Display();

                    for _, Addon in next, Toggle.Addons do
                        if Addon.Type == 'KeyPicker' and Addon.SyncToggleState then
                            Addon.Toggled = Bool
                            Addon:Update()
                        end
                    end

                    Library:SafeCallback(Toggle.Callback, Toggle.Value);
                    Library:SafeCallback(Toggle.Changed, Toggle.Value);
                    Library:UpdateDependencyBoxes();
                end;

                ToggleRegion.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        Toggle:SetValue(not Toggle.Value) -- Why was it not like this from the start?
                        Library:AttemptSave();
                    end;
                end);

                if Toggle.Risky then
                    Library:RemoveFromRegistry(ToggleLabel)
                    ToggleLabel.TextColor3 = Library.RiskColor
                    Library:AddToRegistry(ToggleLabel, { TextColor3 = 'RiskColor' })
                end

                Toggle:Display();
                Groupbox:AddBlank(Info.BlankSize or 5 + 2);
                Groupbox:Resize();

                Toggle.TextLabel = ToggleLabel;
                Toggle.Container = Container;
                setmetatable(Toggle, BaseAddons);

                Toggles[Idx] = Toggle;

                Library:UpdateDependencyBoxes();

                return Toggle;
            end;

            function Funcs:AddSlider(Idx, Info)
                assert(Info.Default, 'AddSlider: Missing default value.');
                assert(Info.Text, 'AddSlider: Missing slider text.');
                assert(Info.Min, 'AddSlider: Missing minimum value.');
                assert(Info.Max, 'AddSlider: Missing maximum value.');
                assert(Info.Rounding, 'AddSlider: Missing rounding value.');

                local Slider = {
                    Value = Info.Default;
                    Min = Info.Min;
                    Max = Info.Max;
                    Rounding = Info.Rounding;
                    MaxSize = 232;
                    Type = 'Slider';
                    Callback = Info.Callback or function(Value) end;
                };

                local Groupbox = self;
                local Container = Groupbox.Container;

                if not Info.Compact then
                    Library:CreateLabel({
                        Size = UDim2.new(1, 0, 0, 10);
                        TextSize = 14;
                        Text = Info.Text;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        TextYAlignment = Enum.TextYAlignment.Bottom;
                        ZIndex = 5;
                        Parent = Container;
                    });

                    Groupbox:AddBlank(3);
                end

                local SliderOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(1, -4, 0, 13);
                    ZIndex = 5;
                    Parent = Container;
                });

                Library:AddToRegistry(SliderOuter, {
                    BorderColor3 = 'Black';
                });

                local SliderInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = SliderOuter;
                });

                Library:AddToRegistry(SliderInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                local Fill = Library:Create('Frame', {
                    BackgroundColor3 = Library.AccentColor;
                    BorderColor3 = Library.AccentColorDark;
                    Size = UDim2.new(0, 0, 1, 0);
                    ZIndex = 7;
                    Parent = SliderInner;
                });

                Library:AddToRegistry(Fill, {
                    BackgroundColor3 = 'AccentColor';
                    BorderColor3 = 'AccentColorDark';
                });

                local HideBorderRight = Library:Create('Frame', {
                    BackgroundColor3 = Library.AccentColor;
                    BorderSizePixel = 0;
                    Position = UDim2.new(1, 0, 0, 0);
                    Size = UDim2.new(0, 1, 1, 0);
                    ZIndex = 8;
                    Parent = Fill;
                });

                Library:AddToRegistry(HideBorderRight, {
                    BackgroundColor3 = 'AccentColor';
                });

                local DisplayLabel = Library:CreateLabel({
                    Size = UDim2.new(1, 0, 1, 0);
                    TextSize = 14;
                    Text = 'Infinite';
                    ZIndex = 9;
                    Parent = SliderInner;
                });

                Library:OnHighlight(SliderOuter, SliderOuter,
                    { BorderColor3 = 'AccentColor' },
                    { BorderColor3 = 'Black' }
                );

                if type(Info.Tooltip) == 'string' then
                    Library:AddToolTip(Info.Tooltip, SliderOuter)
                end

                function Slider:UpdateColors()
                    Fill.BackgroundColor3 = Library.AccentColor;
                    Fill.BorderColor3 = Library.AccentColorDark;
                end;

                function Slider:Display()
                    local Suffix = Info.Suffix or '';

                    if Info.Compact then
                        DisplayLabel.Text = Info.Text .. ': ' .. Slider.Value .. Suffix
                    elseif Info.HideMax then
                        DisplayLabel.Text = string.format('%s', Slider.Value .. Suffix)
                    else
                        DisplayLabel.Text = string.format('%s/%s', Slider.Value .. Suffix, Slider.Max .. Suffix);
                    end

                    local X = math.ceil(Library:MapValue(Slider.Value, Slider.Min, Slider.Max, 0, Slider.MaxSize));
                    Fill.Size = UDim2.new(0, X, 1, 0);

                    HideBorderRight.Visible = not (X == Slider.MaxSize or X == 0);
                end;

                function Slider:OnChanged(Func)
                    Slider.Changed = Func;
                    Func(Slider.Value);
                end;

                local function Round(Value)
                    if Slider.Rounding == 0 then
                        return math.floor(Value);
                    end;


                    return tonumber(string.format('%.' .. Slider.Rounding .. 'f', Value))
                end;

                function Slider:GetValueFromXOffset(X)
                    return Round(Library:MapValue(X, 0, Slider.MaxSize, Slider.Min, Slider.Max));
                end;

                function Slider:SetValue(Str)
                    local Num = tonumber(Str);

                    if (not Num) then
                        return;
                    end;

                    Num = math.clamp(Num, Slider.Min, Slider.Max);

                    Slider.Value = Num;
                    Slider:Display();

                    Library:SafeCallback(Slider.Callback, Slider.Value);
                    Library:SafeCallback(Slider.Changed, Slider.Value);
                end;

                SliderInner.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        local mPos = Mouse.X;
                        local gPos = Fill.Size.X.Offset;
                        local Diff = mPos - (Fill.AbsolutePosition.X + gPos);

                        while InputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                            local nMPos = Mouse.X;
                            local nX = math.clamp(gPos + (nMPos - mPos) + Diff, 0, Slider.MaxSize);

                            local nValue = Slider:GetValueFromXOffset(nX);
                            local OldValue = Slider.Value;
                            Slider.Value = nValue;

                            Slider:Display();

                            if nValue ~= OldValue then
                                Library:SafeCallback(Slider.Callback, Slider.Value);
                                Library:SafeCallback(Slider.Changed, Slider.Value);
                            end;

                            RenderStepped:Wait();
                        end;

                        Library:AttemptSave();
                    end;
                end);

                Slider:Display();
                Groupbox:AddBlank(Info.BlankSize or 6);
                Groupbox:Resize();

                Options[Idx] = Slider;

                return Slider;
            end;

            function Funcs:AddDropdown(Idx, Info)
                if Info.SpecialType == 'Player' then
                    Info.Values = GetPlayersString();
                    Info.AllowNull = true;
                elseif Info.SpecialType == 'Team' then
                    Info.Values = GetTeamsString();
                    Info.AllowNull = true;
                end;

                assert(Info.Values, 'AddDropdown: Missing dropdown value list.');
                assert(Info.AllowNull or Info.Default, 'AddDropdown: Missing default value. Pass `AllowNull` as true if this was intentional.')

                if (not Info.Text) then
                    Info.Compact = true;
                end;

                local Dropdown = {
                    Values = Info.Values;
                    Value = Info.Multi and {};
                    Multi = Info.Multi;
                    Type = 'Dropdown';
                    SpecialType = Info.SpecialType; -- can be either 'Player' or 'Team'
                    Callback = Info.Callback or function(Value) end;
                };

                local Groupbox = self;
                local Container = Groupbox.Container;

                local RelativeOffset = 0;

                if not Info.Compact then
                    local DropdownLabel = Library:CreateLabel({
                        Size = UDim2.new(1, 0, 0, 10);
                        TextSize = 14;
                        Text = Info.Text;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        TextYAlignment = Enum.TextYAlignment.Bottom;
                        ZIndex = 5;
                        Parent = Container;
                    });

                    Groupbox:AddBlank(3);
                end

                for _, Element in next, Container:GetChildren() do
                    if not Element:IsA('UIListLayout') then
                        RelativeOffset = RelativeOffset + Element.Size.Y.Offset;
                    end;
                end;

                local DropdownOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    Size = UDim2.new(1, -4, 0, 20);
                    ZIndex = 5;
                    Parent = Container;
                });

                Library:AddToRegistry(DropdownOuter, {
                    BorderColor3 = 'Black';
                });

                local DropdownInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 6;
                    Parent = DropdownOuter;
                });

                Library:AddToRegistry(DropdownInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                Library:Create('UIGradient', {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 212, 212))
                    });
                    Rotation = 90;
                    Parent = DropdownInner;
                });

                local DropdownArrow = Library:Create('ImageLabel', {
                    AnchorPoint = Vector2.new(0, 0.5);
                    BackgroundTransparency = 1;
                    Position = UDim2.new(1, -16, 0.5, 0);
                    Size = UDim2.new(0, 12, 0, 12);
                    Image = 'http://www.roblox.com/asset/?id=6282522798';
                    ZIndex = 8;
                    Parent = DropdownInner;
                });

                local ItemList = Library:CreateLabel({
                    Position = UDim2.new(0, 5, 0, 0);
                    Size = UDim2.new(1, -5, 1, 0);
                    TextSize = 14;
                    Text = '--';
                    TextXAlignment = Enum.TextXAlignment.Left;
                    TextWrapped = true;
                    ZIndex = 7;
                    Parent = DropdownInner;
                });

                Library:OnHighlight(DropdownOuter, DropdownOuter,
                    { BorderColor3 = 'AccentColor' },
                    { BorderColor3 = 'Black' }
                );

                if type(Info.Tooltip) == 'string' then
                    Library:AddToolTip(Info.Tooltip, DropdownOuter)
                end

                local MAX_DROPDOWN_ITEMS = 8;

                local ListOuter = Library:Create('Frame', {
                    BackgroundColor3 = Color3.new(0, 0, 0);
                    BorderColor3 = Color3.new(0, 0, 0);
                    ZIndex = 20;
                    Visible = false;
                    Parent = ScreenGui;
                });

                local function RecalculateListPosition()
                    ListOuter.Position = UDim2.fromOffset(DropdownOuter.AbsolutePosition.X, DropdownOuter.AbsolutePosition.Y + DropdownOuter.Size.Y.Offset + 1);
                end;

                local function RecalculateListSize(YSize)
                    ListOuter.Size = UDim2.fromOffset(DropdownOuter.AbsoluteSize.X, YSize or (MAX_DROPDOWN_ITEMS * 20 + 2))
                end;

                RecalculateListPosition();
                RecalculateListSize();

                DropdownOuter:GetPropertyChangedSignal('AbsolutePosition'):Connect(RecalculateListPosition);

                local ListInner = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderColor3 = Library.OutlineColor;
                    BorderMode = Enum.BorderMode.Inset;
                    BorderSizePixel = 0;
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 21;
                    Parent = ListOuter;
                });

                Library:AddToRegistry(ListInner, {
                    BackgroundColor3 = 'MainColor';
                    BorderColor3 = 'OutlineColor';
                });

                local Scrolling = Library:Create('ScrollingFrame', {
                    BackgroundTransparency = 1;
                    BorderSizePixel = 0;
                    CanvasSize = UDim2.new(0, 0, 0, 0);
                    Size = UDim2.new(1, 0, 1, 0);
                    ZIndex = 21;
                    Parent = ListInner;

                    TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png',
                    BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png',

                    ScrollBarThickness = 3,
                    ScrollBarImageColor3 = Library.AccentColor,
                });

                Library:AddToRegistry(Scrolling, {
                    ScrollBarImageColor3 = 'AccentColor'
                })

                Library:Create('UIListLayout', {
                    Padding = UDim.new(0, 0);
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = Scrolling;
                });

                function Dropdown:Display()
                    local Values = Dropdown.Values;
                    local Str = '';

                    if Info.Multi then
                        for Idx, Value in next, Values do
                            if Dropdown.Value[Value] then
                                Str = Str .. Value .. ', ';
                            end;
                        end;

                        Str = Str:sub(1, #Str - 2);
                    else
                        Str = Dropdown.Value or '';
                    end;

                    ItemList.Text = (Str == '' and '--' or Str);
                end;

                function Dropdown:GetActiveValues()
                    if Info.Multi then
                        local T = {};

                        for Value, Bool in next, Dropdown.Value do
                            table.insert(T, Value);
                        end;

                        return T;
                    else
                        return Dropdown.Value and 1 or 0;
                    end;
                end;

                function Dropdown:BuildDropdownList()
                    local Values = Dropdown.Values;
                    local Buttons = {};

                    for _, Element in next, Scrolling:GetChildren() do
                        if not Element:IsA('UIListLayout') then
                            Element:Destroy();
                        end;
                    end;

                    local Count = 0;

                    for Idx, Value in next, Values do
                        local Table = {};

                        Count = Count + 1;

                        local Button = Library:Create('Frame', {
                            BackgroundColor3 = Library.MainColor;
                            BorderColor3 = Library.OutlineColor;
                            BorderMode = Enum.BorderMode.Middle;
                            Size = UDim2.new(1, -1, 0, 20);
                            ZIndex = 23;
                            Active = true,
                            Parent = Scrolling;
                        });

                        Library:AddToRegistry(Button, {
                            BackgroundColor3 = 'MainColor';
                            BorderColor3 = 'OutlineColor';
                        });

                        local ButtonLabel = Library:CreateLabel({
                            Active = false;
                            Size = UDim2.new(1, -6, 1, 0);
                            Position = UDim2.new(0, 6, 0, 0);
                            TextSize = 14;
                            Text = Value;
                            TextXAlignment = Enum.TextXAlignment.Left;
                            ZIndex = 25;
                            Parent = Button;
                        });

                        Library:OnHighlight(Button, Button,
                            { BorderColor3 = 'AccentColor', ZIndex = 24 },
                            { BorderColor3 = 'OutlineColor', ZIndex = 23 }
                        );

                        local Selected;

                        if Info.Multi then
                            Selected = Dropdown.Value[Value];
                        else
                            Selected = Dropdown.Value == Value;
                        end;

                        function Table:UpdateButton()
                            if Info.Multi then
                                Selected = Dropdown.Value[Value];
                            else
                                Selected = Dropdown.Value == Value;
                            end;

                            ButtonLabel.TextColor3 = Selected and Library.AccentColor or Library.FontColor;
                            Library.RegistryMap[ButtonLabel].Properties.TextColor3 = Selected and 'AccentColor' or 'FontColor';
                        end;

                        ButtonLabel.InputBegan:Connect(function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                                local Try = not Selected;

                                if Dropdown:GetActiveValues() == 1 and (not Try) and (not Info.AllowNull) then
                                else
                                    if Info.Multi then
                                        Selected = Try;

                                        if Selected then
                                            Dropdown.Value[Value] = true;
                                        else
                                            Dropdown.Value[Value] = nil;
                                        end;
                                    else
                                        Selected = Try;

                                        if Selected then
                                            Dropdown.Value = Value;
                                        else
                                            Dropdown.Value = nil;
                                        end;

                                        for _, OtherButton in next, Buttons do
                                            OtherButton:UpdateButton();
                                        end;
                                    end;

                                    Table:UpdateButton();
                                    Dropdown:Display();

                                    Library:SafeCallback(Dropdown.Callback, Dropdown.Value);
                                    Library:SafeCallback(Dropdown.Changed, Dropdown.Value);

                                    Library:AttemptSave();
                                end;
                            end;
                        end);

                        Table:UpdateButton();
                        Dropdown:Display();

                        Buttons[Button] = Table;
                    end;

                    Scrolling.CanvasSize = UDim2.fromOffset(0, (Count * 20) + 1);

                    local Y = math.clamp(Count * 20, 0, MAX_DROPDOWN_ITEMS * 20) + 1;
                    RecalculateListSize(Y);
                end;

                function Dropdown:SetValues(NewValues)
                    if NewValues then
                        Dropdown.Values = NewValues;
                    end;

                    Dropdown:BuildDropdownList();
                end;

                function Dropdown:OpenDropdown()
                    ListOuter.Visible = true;
                    Library.OpenedFrames[ListOuter] = true;
                    DropdownArrow.Rotation = 180;
                end;

                function Dropdown:CloseDropdown()
                    ListOuter.Visible = false;
                    Library.OpenedFrames[ListOuter] = nil;
                    DropdownArrow.Rotation = 0;
                end;

                function Dropdown:OnChanged(Func)
                    Dropdown.Changed = Func;
                    Func(Dropdown.Value);
                end;

                function Dropdown:SetValue(Val)
                    if Dropdown.Multi then
                        local nTable = {};

                        for Value, Bool in next, Val do
                            if table.find(Dropdown.Values, Value) then
                                nTable[Value] = true
                            end;
                        end;

                        Dropdown.Value = nTable;
                    else
                        if (not Val) then
                            Dropdown.Value = nil;
                        elseif table.find(Dropdown.Values, Val) then
                            Dropdown.Value = Val;
                        end;
                    end;

                    Dropdown:BuildDropdownList();

                    Library:SafeCallback(Dropdown.Callback, Dropdown.Value);
                    Library:SafeCallback(Dropdown.Changed, Dropdown.Value);
                end;

                DropdownOuter.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                        if ListOuter.Visible then
                            Dropdown:CloseDropdown();
                        else
                            Dropdown:OpenDropdown();
                        end;
                    end;
                end);

                InputService.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        local AbsPos, AbsSize = ListOuter.AbsolutePosition, ListOuter.AbsoluteSize;

                        if Mouse.X < AbsPos.X or Mouse.X > AbsPos.X + AbsSize.X
                            or Mouse.Y < (AbsPos.Y - 20 - 1) or Mouse.Y > AbsPos.Y + AbsSize.Y then

                            Dropdown:CloseDropdown();
                        end;
                    end;
                end);

                Dropdown:BuildDropdownList();
                Dropdown:Display();

                local Defaults = {}

                if type(Info.Default) == 'string' then
                    local Idx = table.find(Dropdown.Values, Info.Default)
                    if Idx then
                        table.insert(Defaults, Idx)
                    end
                elseif type(Info.Default) == 'table' then
                    for _, Value in next, Info.Default do
                        local Idx = table.find(Dropdown.Values, Value)
                        if Idx then
                            table.insert(Defaults, Idx)
                        end
                    end
                elseif type(Info.Default) == 'number' and Dropdown.Values[Info.Default] ~= nil then
                    table.insert(Defaults, Info.Default)
                end

                if next(Defaults) then
                    for i = 1, #Defaults do
                        local Index = Defaults[i]
                        if Info.Multi then
                            local tmp = Dropdown.Values[Index]
                            Dropdown.Value[tmp] = true
                        else
                            Dropdown.Value = Dropdown.Values[Index];
                        end

                        if (not Info.Multi) then break end
                    end

                    Dropdown:BuildDropdownList();
                    Dropdown:Display();
                end

                Groupbox:AddBlank(Info.BlankSize or 5);
                Groupbox:Resize();

                Options[Idx] = Dropdown;

                return Dropdown;
            end;

            function Funcs:AddDependencyBox()
                local Depbox = {
                    Dependencies = {};
                };

                local Groupbox = self;
                local Container = Groupbox.Container;

                local Holder = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Size = UDim2.new(1, 0, 0, 0);
                    Visible = false;
                    Parent = Container;
                });

                local Frame = Library:Create('Frame', {
                    BackgroundTransparency = 1;
                    Size = UDim2.new(1, 0, 1, 0);
                    Visible = true;
                    Parent = Holder;
                });

                local Layout = Library:Create('UIListLayout', {
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    Parent = Frame;
                });

                function Depbox:Resize()
                    Holder.Size = UDim2.new(1, 0, 0, Layout.AbsoluteContentSize.Y);
                    Groupbox:Resize();
                end;

                Layout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                    Depbox:Resize();
                end);

                Holder:GetPropertyChangedSignal('Visible'):Connect(function()
                    Depbox:Resize();
                end);

                function Depbox:Update()
                    for _, Dependency in next, Depbox.Dependencies do
                        local Elem = Dependency[1];
                        local Value = Dependency[2];

                        if Elem.Type == 'Toggle' and Elem.Value ~= Value then
                            Holder.Visible = false;
                            Depbox:Resize();
                            return;
                        end;
                    end;

                    Holder.Visible = true;
                    Depbox:Resize();
                end;

                function Depbox:SetupDependencies(Dependencies)
                    for _, Dependency in next, Dependencies do
                        assert(type(Dependency) == 'table', 'SetupDependencies: Dependency is not of type `table`.');
                        assert(Dependency[1], 'SetupDependencies: Dependency is missing element argument.');
                        assert(Dependency[2] ~= nil, 'SetupDependencies: Dependency is missing value argument.');
                    end;

                    Depbox.Dependencies = Dependencies;
                    Depbox:Update();
                end;

                Depbox.Container = Frame;

                setmetatable(Depbox, BaseGroupbox);

                table.insert(Library.DependencyBoxes, Depbox);

                return Depbox;
            end;

            BaseGroupbox.__index = Funcs;
            BaseGroupbox.__namecall = function(Table, Key, ...)
                return Funcs[Key](...);
            end;
        end;

        -- < Create other UI elements >
        do
            Library.NotificationArea = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Position = UDim2.new(0, 0, 0, 40);
                Size = UDim2.new(0, 300, 0, 200);
                ZIndex = 100;
                Parent = ScreenGui;
            });

            Library:Create('UIListLayout', {
                Padding = UDim.new(0, 4);
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = Library.NotificationArea;
            });

            local WatermarkOuter = Library:Create('Frame', {
                BorderColor3 = Color3.new(0, 0, 0);
                Position = UDim2.new(0, 100, 0, -25);
                Size = UDim2.new(0, 213, 0, 20);
                ZIndex = 200;
                Visible = false;
                Parent = ScreenGui;
            });

            local WatermarkInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.AccentColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = UDim2.new(1, 0, 1, 0);
                ZIndex = 201;
                Parent = WatermarkOuter;
            });

            Library:AddToRegistry(WatermarkInner, {
                BorderColor3 = 'AccentColor';
            });

            local InnerFrame = Library:Create('Frame', {
                BackgroundColor3 = Color3.new(1, 1, 1);
                BorderSizePixel = 0;
                Position = UDim2.new(0, 1, 0, 1);
                Size = UDim2.new(1, -2, 1, -2);
                ZIndex = 202;
                Parent = WatermarkInner;
            });

            local Gradient = Library:Create('UIGradient', {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)),
                    ColorSequenceKeypoint.new(1, Library.MainColor),
                });
                Rotation = -90;
                Parent = InnerFrame;
            });

            Library:AddToRegistry(Gradient, {
                Color = function()
                    return ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)),
                        ColorSequenceKeypoint.new(1, Library.MainColor),
                    });
                end
            });

            local WatermarkLabel = Library:CreateLabel({
                Position = UDim2.new(0, 5, 0, 0);
                Size = UDim2.new(1, -4, 1, 0);
                TextSize = 14;
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 203;
                Parent = InnerFrame;
            });

            Library.Watermark = WatermarkOuter;
            Library.WatermarkText = WatermarkLabel;
            Library:MakeDraggable(Library.Watermark);



            local KeybindOuter = Library:Create('Frame', {
                AnchorPoint = Vector2.new(0, 0.5);
                BorderColor3 = Color3.new(0, 0, 0);
                Position = UDim2.new(0, 10, 0.5, 0);
                Size = UDim2.new(0, 210, 0, 20);
                Visible = false;
                ZIndex = 100;
                Parent = ScreenGui;
            });

            local KeybindInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = UDim2.new(1, 0, 1, 0);
                ZIndex = 101;
                Parent = KeybindOuter;
            });

            Library:AddToRegistry(KeybindInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            }, true);

            local ColorFrame = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor;
                BorderSizePixel = 0;
                Size = UDim2.new(1, 0, 0, 2);
                ZIndex = 102;
                Parent = KeybindInner;
            });

            Library:AddToRegistry(ColorFrame, {
                BackgroundColor3 = 'AccentColor';
            }, true);

            local KeybindLabel = Library:CreateLabel({
                Size = UDim2.new(1, 0, 0, 20);
                Position = UDim2.fromOffset(5, 2),
                TextXAlignment = Enum.TextXAlignment.Left,

                Text = 'Keybinds';
                ZIndex = 104;
                Parent = KeybindInner;
            });

            local KeybindContainer = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Size = UDim2.new(1, 0, 1, -20);
                Position = UDim2.new(0, 0, 0, 20);
                ZIndex = 1;
                Parent = KeybindInner;
            });

            Library:Create('UIListLayout', {
                FillDirection = Enum.FillDirection.Vertical;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = KeybindContainer;
            });

            Library:Create('UIPadding', {
                PaddingLeft = UDim.new(0, 5),
                Parent = KeybindContainer,
            })

            Library.KeybindFrame = KeybindOuter;
            Library.KeybindContainer = KeybindContainer;
            Library:MakeDraggable(KeybindOuter);
        end;

        function Library:SetWatermarkVisibility(Bool)
            Library.Watermark.Visible = Bool;
        end;

        function Library:SetWatermark(Text)
            local X, Y = Library:GetTextBounds(Text, Library.Font, 14);
            Library.Watermark.Size = UDim2.new(0, X + 15, 0, (Y * 1.5) + 3);
            Library:SetWatermarkVisibility(true)

            Library.WatermarkText.Text = Text;
        end;

        function Library:Notify(Text, Time)
            local XSize, YSize = Library:GetTextBounds(Text, Library.Font, 14);

            YSize = YSize + 7

            local NotifyOuter = Library:Create('Frame', {
                BorderColor3 = Color3.new(0, 0, 0);
                Position = UDim2.new(0, 100, 0, 10);
                Size = UDim2.new(0, 0, 0, YSize);
                ClipsDescendants = true;
                ZIndex = 100;
                Parent = Library.NotificationArea;
            });

            local NotifyInner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                BorderMode = Enum.BorderMode.Inset;
                Size = UDim2.new(1, 0, 1, 0);
                ZIndex = 101;
                Parent = NotifyOuter;
            });

            Library:AddToRegistry(NotifyInner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            }, true);

            local InnerFrame = Library:Create('Frame', {
                BackgroundColor3 = Color3.new(1, 1, 1);
                BorderSizePixel = 0;
                Position = UDim2.new(0, 1, 0, 1);
                Size = UDim2.new(1, -2, 1, -2);
                ZIndex = 102;
                Parent = NotifyInner;
            });

            local Gradient = Library:Create('UIGradient', {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)),
                    ColorSequenceKeypoint.new(1, Library.MainColor),
                });
                Rotation = -90;
                Parent = InnerFrame;
            });

            Library:AddToRegistry(Gradient, {
                Color = function()
                    return ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Library:GetDarkerColor(Library.MainColor)),
                        ColorSequenceKeypoint.new(1, Library.MainColor),
                    });
                end
            });

            local NotifyLabel = Library:CreateLabel({
                Position = UDim2.new(0, 4, 0, 0);
                Size = UDim2.new(1, -4, 1, 0);
                Text = Text;
                TextXAlignment = Enum.TextXAlignment.Left;
                TextSize = 14;
                ZIndex = 103;
                Parent = InnerFrame;
            });

            local LeftColor = Library:Create('Frame', {
                BackgroundColor3 = Library.AccentColor;
                BorderSizePixel = 0;
                Position = UDim2.new(0, -1, 0, -1);
                Size = UDim2.new(0, 3, 1, 2);
                ZIndex = 104;
                Parent = NotifyOuter;
            });

            Library:AddToRegistry(LeftColor, {
                BackgroundColor3 = 'AccentColor';
            }, true);

            pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, XSize + 8 + 4, 0, YSize), 'Out', 'Quad', 0.4, true);

            task.spawn(function()
                wait(Time or 5);

                pcall(NotifyOuter.TweenSize, NotifyOuter, UDim2.new(0, 0, 0, YSize), 'Out', 'Quad', 0.4, true);

                wait(0.4);

                NotifyOuter:Destroy();
            end);
        end;

        function Library:CreateWindow(...)
            local Arguments = { ... }
            local Config = { AnchorPoint = Vector2.zero }

            if type(...) == 'table' then
                Config = ...;
            else
                Config.Title = Arguments[1]
                Config.AutoShow = Arguments[2] or false;
            end

            if type(Config.Title) ~= 'string' then Config.Title = 'No title' end
            if type(Config.TabPadding) ~= 'number' then Config.TabPadding = 0 end
            if type(Config.MenuFadeTime) ~= 'number' then Config.MenuFadeTime = 0.2 end

            if typeof(Config.Position) ~= 'UDim2' then Config.Position = UDim2.fromOffset(175, 50) end
            if typeof(Config.Size) ~= 'UDim2' then Config.Size = UDim2.fromOffset(550, 600) end

            if Config.Center then
                Config.AnchorPoint = Vector2.new(0.5, 0.5)
                Config.Position = UDim2.fromScale(0.5, 0.5)
            end

            local Window = {
                Tabs = {};
            };

            local Outer = Library:Create('Frame', {
                AnchorPoint = Config.AnchorPoint,
                BackgroundColor3 = Color3.new(0, 0, 0);
                BorderSizePixel = 0;
                Position = Config.Position,
                Size = Config.Size,
                Visible = false;
                ZIndex = 1;
                Parent = ScreenGui;
            });

            Library:MakeDraggable(Outer, 25);

            local Inner = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.AccentColor;
                BorderMode = Enum.BorderMode.Inset;
                Position = UDim2.new(0, 1, 0, 1);
                Size = UDim2.new(1, -2, 1, -2);
                ZIndex = 1;
                Parent = Outer;
            });

            Library:AddToRegistry(Inner, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'AccentColor';
            });

            local WindowLabel = Library:CreateLabel({
                Position = UDim2.new(0, 7, 0, 0);
                Size = UDim2.new(0, 0, 0, 25);
                Text = Config.Title or '';
                TextXAlignment = Enum.TextXAlignment.Left;
                ZIndex = 1;
                Parent = Inner;
            });

            local MainSectionOuter = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Library.OutlineColor;
                Position = UDim2.new(0, 8, 0, 25);
                Size = UDim2.new(1, -16, 1, -33);
                ZIndex = 1;
                Parent = Inner;
            });

            Library:AddToRegistry(MainSectionOuter, {
                BackgroundColor3 = 'BackgroundColor';
                BorderColor3 = 'OutlineColor';
            });

            local MainSectionInner = Library:Create('Frame', {
                BackgroundColor3 = Library.BackgroundColor;
                BorderColor3 = Color3.new(0, 0, 0);
                BorderMode = Enum.BorderMode.Inset;
                Position = UDim2.new(0, 0, 0, 0);
                Size = UDim2.new(1, 0, 1, 0);
                ZIndex = 1;
                Parent = MainSectionOuter;
            });

            Library:AddToRegistry(MainSectionInner, {
                BackgroundColor3 = 'BackgroundColor';
            });

            local TabArea = Library:Create('Frame', {
                BackgroundTransparency = 1;
                Position = UDim2.new(0, 8, 0, 8);
                Size = UDim2.new(1, -16, 0, 21);
                ZIndex = 1;
                Parent = MainSectionInner;
            });

            local TabListLayout = Library:Create('UIListLayout', {
                Padding = UDim.new(0, Config.TabPadding);
                FillDirection = Enum.FillDirection.Horizontal;
                SortOrder = Enum.SortOrder.LayoutOrder;
                Parent = TabArea;
            });

            local TabContainer = Library:Create('Frame', {
                BackgroundColor3 = Library.MainColor;
                BorderColor3 = Library.OutlineColor;
                Position = UDim2.new(0, 8, 0, 30);
                Size = UDim2.new(1, -16, 1, -38);
                ZIndex = 2;
                Parent = MainSectionInner;
            });


            Library:AddToRegistry(TabContainer, {
                BackgroundColor3 = 'MainColor';
                BorderColor3 = 'OutlineColor';
            });

            function Window:SetWindowTitle(Title)
                WindowLabel.Text = Title;
            end;

            function Window:AddTab(Name)
                local Tab = {
                    Groupboxes = {};
                    Tabboxes = {};
                };

                local TabButtonWidth = Library:GetTextBounds(Name, Library.Font, 16);

                local TabButton = Library:Create('Frame', {
                    BackgroundColor3 = Library.BackgroundColor;
                    BorderColor3 = Library.OutlineColor;
                    Size = UDim2.new(0, TabButtonWidth + 8 + 4, 1, 0);
                    ZIndex = 1;
                    Parent = TabArea;
                });

                Library:AddToRegistry(TabButton, {
                    BackgroundColor3 = 'BackgroundColor';
                    BorderColor3 = 'OutlineColor';
                });

                local TabButtonLabel = Library:CreateLabel({
                    Position = UDim2.new(0, 0, 0, 0);
                    Size = UDim2.new(1, 0, 1, -1);
                    Text = Name;
                    ZIndex = 1;
                    Parent = TabButton;
                });

                local Blocker = Library:Create('Frame', {
                    BackgroundColor3 = Library.MainColor;
                    BorderSizePixel = 0;
                    Position = UDim2.new(0, 0, 1, 0);
                    Size = UDim2.new(1, 0, 0, 1);
                    BackgroundTransparency = 1;
                    ZIndex = 3;
                    Parent = TabButton;
                });

                Library:AddToRegistry(Blocker, {
                    BackgroundColor3 = 'MainColor';
                });

                local TabFrame = Library:Create('Frame', {
                    Name = 'TabFrame',
                    BackgroundTransparency = 1;
                    Position = UDim2.new(0, 0, 0, 0);
                    Size = UDim2.new(1, 0, 1, 0);
                    Visible = false;
                    ZIndex = 2;
                    Parent = TabContainer;
                });

                local LeftSide = Library:Create('ScrollingFrame', {
                    BackgroundTransparency = 1;
                    BorderSizePixel = 0;
                    Position = UDim2.new(0, 8 - 1, 0, 8 - 1);
                    Size = UDim2.new(0.5, -12 + 2, 0, 507 + 2);
                    CanvasSize = UDim2.new(0, 0, 0, 0);
                    BottomImage = '';
                    TopImage = '';
                    ScrollBarThickness = 0;
                    ZIndex = 2;
                    Parent = TabFrame;
                });

                local RightSide = Library:Create('ScrollingFrame', {
                    BackgroundTransparency = 1;
                    BorderSizePixel = 0;
                    Position = UDim2.new(0.5, 4 + 1, 0, 8 - 1);
                    Size = UDim2.new(0.5, -12 + 2, 0, 507 + 2);
                    CanvasSize = UDim2.new(0, 0, 0, 0);
                    BottomImage = '';
                    TopImage = '';
                    ScrollBarThickness = 0;
                    ZIndex = 2;
                    Parent = TabFrame;
                });

                Library:Create('UIListLayout', {
                    Padding = UDim.new(0, 8);
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    HorizontalAlignment = Enum.HorizontalAlignment.Center;
                    Parent = LeftSide;
                });

                Library:Create('UIListLayout', {
                    Padding = UDim.new(0, 8);
                    FillDirection = Enum.FillDirection.Vertical;
                    SortOrder = Enum.SortOrder.LayoutOrder;
                    HorizontalAlignment = Enum.HorizontalAlignment.Center;
                    Parent = RightSide;
                });

                for _, Side in next, { LeftSide, RightSide } do
                    Side:WaitForChild('UIListLayout'):GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                        Side.CanvasSize = UDim2.fromOffset(0, Side.UIListLayout.AbsoluteContentSize.Y);
                    end);
                end;

                function Tab:ShowTab()
                    for _, Tab in next, Window.Tabs do
                        Tab:HideTab();
                    end;

                    Blocker.BackgroundTransparency = 0;
                    TabButton.BackgroundColor3 = Library.MainColor;
                    Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'MainColor';
                    TabFrame.Visible = true;
                end;

                function Tab:HideTab()
                    Blocker.BackgroundTransparency = 1;
                    TabButton.BackgroundColor3 = Library.BackgroundColor;
                    Library.RegistryMap[TabButton].Properties.BackgroundColor3 = 'BackgroundColor';
                    TabFrame.Visible = false;
                end;

                function Tab:SetLayoutOrder(Position)
                    TabButton.LayoutOrder = Position;
                    TabListLayout:ApplyLayout();
                end;

                function Tab:AddGroupbox(Info)
                    local Groupbox = {};

                    local BoxOuter = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, 0, 0, 507 + 2);
                        ZIndex = 2;
                        Parent = Info.Side == 1 and LeftSide or RightSide;
                    });

                    Library:AddToRegistry(BoxOuter, {
                        BackgroundColor3 = 'BackgroundColor';
                        BorderColor3 = 'OutlineColor';
                    });

                    local BoxInner = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = Color3.new(0, 0, 0);
                        -- BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, -2, 1, -2);
                        Position = UDim2.new(0, 1, 0, 1);
                        ZIndex = 4;
                        Parent = BoxOuter;
                    });

                    Library:AddToRegistry(BoxInner, {
                        BackgroundColor3 = 'BackgroundColor';
                    });

                    local Highlight = Library:Create('Frame', {
                        BackgroundColor3 = Library.AccentColor;
                        BorderSizePixel = 0;
                        Size = UDim2.new(1, 0, 0, 2);
                        ZIndex = 5;
                        Parent = BoxInner;
                    });

                    Library:AddToRegistry(Highlight, {
                        BackgroundColor3 = 'AccentColor';
                    });

                    local GroupboxLabel = Library:CreateLabel({
                        Size = UDim2.new(1, 0, 0, 18);
                        Position = UDim2.new(0, 4, 0, 2);
                        TextSize = 14;
                        Text = Info.Name;
                        TextXAlignment = Enum.TextXAlignment.Left;
                        ZIndex = 5;
                        Parent = BoxInner;
                    });

                    local Container = Library:Create('Frame', {
                        BackgroundTransparency = 1;
                        Position = UDim2.new(0, 4, 0, 20);
                        Size = UDim2.new(1, -4, 1, -20);
                        ZIndex = 1;
                        Parent = BoxInner;
                    });

                    Library:Create('UIListLayout', {
                        FillDirection = Enum.FillDirection.Vertical;
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        Parent = Container;
                    });

                    function Groupbox:Resize()
                        local Size = 0;

                        for _, Element in next, Groupbox.Container:GetChildren() do
                            if (not Element:IsA('UIListLayout')) and Element.Visible then
                                Size = Size + Element.Size.Y.Offset;
                            end;
                        end;

                        BoxOuter.Size = UDim2.new(1, 0, 0, 20 + Size + 2 + 2);
                    end;

                    Groupbox.Container = Container;
                    setmetatable(Groupbox, BaseGroupbox);

                    Groupbox:AddBlank(3);
                    Groupbox:Resize();

                    Tab.Groupboxes[Info.Name] = Groupbox;

                    return Groupbox;
                end;

                function Tab:AddLeftGroupbox(Name)
                    return Tab:AddGroupbox({ Side = 1; Name = Name; });
                end;

                function Tab:AddRightGroupbox(Name)
                    return Tab:AddGroupbox({ Side = 2; Name = Name; });
                end;

                function Tab:AddTabbox(Info)
                    local Tabbox = {
                        Tabs = {};
                    };

                    local BoxOuter = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = Library.OutlineColor;
                        BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, 0, 0, 0);
                        ZIndex = 2;
                        Parent = Info.Side == 1 and LeftSide or RightSide;
                    });

                    Library:AddToRegistry(BoxOuter, {
                        BackgroundColor3 = 'BackgroundColor';
                        BorderColor3 = 'OutlineColor';
                    });

                    local BoxInner = Library:Create('Frame', {
                        BackgroundColor3 = Library.BackgroundColor;
                        BorderColor3 = Color3.new(0, 0, 0);
                        -- BorderMode = Enum.BorderMode.Inset;
                        Size = UDim2.new(1, -2, 1, -2);
                        Position = UDim2.new(0, 1, 0, 1);
                        ZIndex = 4;
                        Parent = BoxOuter;
                    });

                    Library:AddToRegistry(BoxInner, {
                        BackgroundColor3 = 'BackgroundColor';
                    });

                    local Highlight = Library:Create('Frame', {
                        BackgroundColor3 = Library.AccentColor;
                        BorderSizePixel = 0;
                        Size = UDim2.new(1, 0, 0, 2);
                        ZIndex = 10;
                        Parent = BoxInner;
                    });

                    Library:AddToRegistry(Highlight, {
                        BackgroundColor3 = 'AccentColor';
                    });

                    local TabboxButtons = Library:Create('Frame', {
                        BackgroundTransparency = 1;
                        Position = UDim2.new(0, 0, 0, 1);
                        Size = UDim2.new(1, 0, 0, 18);
                        ZIndex = 5;
                        Parent = BoxInner;
                    });

                    Library:Create('UIListLayout', {
                        FillDirection = Enum.FillDirection.Horizontal;
                        HorizontalAlignment = Enum.HorizontalAlignment.Left;
                        SortOrder = Enum.SortOrder.LayoutOrder;
                        Parent = TabboxButtons;
                    });

                    function Tabbox:AddTab(Name)
                        local Tab = {};

                        local Button = Library:Create('Frame', {
                            BackgroundColor3 = Library.MainColor;
                            BorderColor3 = Color3.new(0, 0, 0);
                            Size = UDim2.new(0.5, 0, 1, 0);
                            ZIndex = 6;
                            Parent = TabboxButtons;
                        });

                        Library:AddToRegistry(Button, {
                            BackgroundColor3 = 'MainColor';
                        });

                        local ButtonLabel = Library:CreateLabel({
                            Size = UDim2.new(1, 0, 1, 0);
                            TextSize = 14;
                            Text = Name;
                            TextXAlignment = Enum.TextXAlignment.Center;
                            ZIndex = 7;
                            Parent = Button;
                        });

                        local Block = Library:Create('Frame', {
                            BackgroundColor3 = Library.BackgroundColor;
                            BorderSizePixel = 0;
                            Position = UDim2.new(0, 0, 1, 0);
                            Size = UDim2.new(1, 0, 0, 1);
                            Visible = false;
                            ZIndex = 9;
                            Parent = Button;
                        });

                        Library:AddToRegistry(Block, {
                            BackgroundColor3 = 'BackgroundColor';
                        });

                        local Container = Library:Create('Frame', {
                            BackgroundTransparency = 1;
                            Position = UDim2.new(0, 4, 0, 20);
                            Size = UDim2.new(1, -4, 1, -20);
                            ZIndex = 1;
                            Visible = false;
                            Parent = BoxInner;
                        });

                        Library:Create('UIListLayout', {
                            FillDirection = Enum.FillDirection.Vertical;
                            SortOrder = Enum.SortOrder.LayoutOrder;
                            Parent = Container;
                        });

                        function Tab:Show()
                            for _, Tab in next, Tabbox.Tabs do
                                Tab:Hide();
                            end;

                            Container.Visible = true;
                            Block.Visible = true;

                            Button.BackgroundColor3 = Library.BackgroundColor;
                            Library.RegistryMap[Button].Properties.BackgroundColor3 = 'BackgroundColor';

                            Tab:Resize();
                        end;

                        function Tab:Hide()
                            Container.Visible = false;
                            Block.Visible = false;

                            Button.BackgroundColor3 = Library.MainColor;
                            Library.RegistryMap[Button].Properties.BackgroundColor3 = 'MainColor';
                        end;

                        function Tab:Resize()
                            local TabCount = 0;

                            for _, Tab in next, Tabbox.Tabs do
                                TabCount = TabCount + 1;
                            end;

                            for _, Button in next, TabboxButtons:GetChildren() do
                                if not Button:IsA('UIListLayout') then
                                    Button.Size = UDim2.new(1 / TabCount, 0, 1, 0);
                                end;
                            end;

                            if (not Container.Visible) then
                                return;
                            end;

                            local Size = 0;

                            for _, Element in next, Tab.Container:GetChildren() do
                                if (not Element:IsA('UIListLayout')) and Element.Visible then
                                    Size = Size + Element.Size.Y.Offset;
                                end;
                            end;

                            BoxOuter.Size = UDim2.new(1, 0, 0, 20 + Size + 2 + 2);
                        end;

                        Button.InputBegan:Connect(function(Input)
                            if Input.UserInputType == Enum.UserInputType.MouseButton1 and not Library:MouseIsOverOpenedFrame() then
                                Tab:Show();
                                Tab:Resize();
                            end;
                        end);

                        Tab.Container = Container;
                        Tabbox.Tabs[Name] = Tab;

                        setmetatable(Tab, BaseGroupbox);

                        Tab:AddBlank(3);
                        Tab:Resize();

                        -- Show first tab (number is 2 cus of the UIListLayout that also sits in that instance)
                        if #TabboxButtons:GetChildren() == 2 then
                            Tab:Show();
                        end;

                        return Tab;
                    end;

                    Tab.Tabboxes[Info.Name or ''] = Tabbox;

                    return Tabbox;
                end;

                function Tab:AddLeftTabbox(Name)
                    return Tab:AddTabbox({ Name = Name, Side = 1; });
                end;

                function Tab:AddRightTabbox(Name)
                    return Tab:AddTabbox({ Name = Name, Side = 2; });
                end;

                TabButton.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Tab:ShowTab();
                    end;
                end);

                -- This was the first tab added, so we show it by default.
                if #TabContainer:GetChildren() == 1 then
                    Tab:ShowTab();
                end;

                Window.Tabs[Name] = Tab;
                return Tab;
            end;

            local ModalElement = Library:Create('TextButton', {
                BackgroundTransparency = 1;
                Size = UDim2.new(0, 0, 0, 0);
                Visible = true;
                Text = '';
                Modal = false;
                Parent = ScreenGui;
            });

            local TransparencyCache = {};
            local Toggled = false;
            local Fading = false;

            function Library:Toggle()
                if Fading then
                    return;
                end;

                local FadeTime = Config.MenuFadeTime;
                Fading = true;
                Toggled = (not Toggled);
                ModalElement.Modal = Toggled;

                if Toggled then
                    -- A bit scuffed, but if we're going from not toggled -> toggled we want to show the frame immediately so that the fade is visible.
                    Outer.Visible = true;

                    task.spawn(function()
                        -- TODO: add cursor fade?
                        local State = InputService.MouseIconEnabled;

                        local Cursor = Drawing.new('Triangle');
                        Cursor.Thickness = 1;
                        Cursor.Filled = true;
                        Cursor.Visible = true;

                        local CursorOutline = Drawing.new('Triangle');
                        CursorOutline.Thickness = 1;
                        CursorOutline.Filled = false;
                        CursorOutline.Color = Color3.new(0, 0, 0);
                        CursorOutline.Visible = true;

                        while Toggled and ScreenGui.Parent do
                            InputService.MouseIconEnabled = false;

                            local mPos = InputService:GetMouseLocation();

                            Cursor.Color = Library.AccentColor;

                            Cursor.PointA = Vector2.new(mPos.X, mPos.Y);
                            Cursor.PointB = Vector2.new(mPos.X + 16, mPos.Y + 6);
                            Cursor.PointC = Vector2.new(mPos.X + 6, mPos.Y + 16);

                            CursorOutline.PointA = Cursor.PointA;
                            CursorOutline.PointB = Cursor.PointB;
                            CursorOutline.PointC = Cursor.PointC;

                            RenderStepped:Wait();
                        end;

                        InputService.MouseIconEnabled = State;

                        Cursor:Remove();
                        CursorOutline:Remove();
                    end);
                end;

                for _, Desc in next, Outer:GetDescendants() do
                    local Properties = {};

                    if Desc:IsA('ImageLabel') then
                        table.insert(Properties, 'ImageTransparency');
                        table.insert(Properties, 'BackgroundTransparency');
                    elseif Desc:IsA('TextLabel') or Desc:IsA('TextBox') then
                        table.insert(Properties, 'TextTransparency');
                    elseif Desc:IsA('Frame') or Desc:IsA('ScrollingFrame') then
                        table.insert(Properties, 'BackgroundTransparency');
                    elseif Desc:IsA('UIStroke') then
                        table.insert(Properties, 'Transparency');
                    end;

                    local Cache = TransparencyCache[Desc];

                    if (not Cache) then
                        Cache = {};
                        TransparencyCache[Desc] = Cache;
                    end;

                    for _, Prop in next, Properties do
                        if not Cache[Prop] then
                            Cache[Prop] = Desc[Prop];
                        end;

                        if Cache[Prop] == 1 then
                            continue;
                        end;

                        TweenService:Create(Desc, TweenInfo.new(FadeTime, Enum.EasingStyle.Linear), { [Prop] = Toggled and Cache[Prop] or 1 }):Play();
                    end;
                end;

                task.wait(FadeTime);

                Outer.Visible = Toggled;

                Fading = false;
            end

            Library:GiveSignal(InputService.InputBegan:Connect(function(Input, Processed)
                if type(Library.ToggleKeybind) == 'table' and Library.ToggleKeybind.Type == 'KeyPicker' then
                    if Input.UserInputType == Enum.UserInputType.Keyboard and Input.KeyCode.Name == Library.ToggleKeybind.Value then
                        task.spawn(Library.Toggle)
                    end
                elseif Input.KeyCode == Enum.KeyCode.RightControl or (Input.KeyCode == Enum.KeyCode.RightShift and (not Processed)) then
                    task.spawn(Library.Toggle)
                end
            end))

            if Config.AutoShow then task.spawn(Library.Toggle) end

            Window.Holder = Outer;

            return Window;
        end;

        local function OnPlayerChange()
            local PlayerList = GetPlayersString();

            for _, Value in next, Options do
                if Value.Type == 'Dropdown' and Value.SpecialType == 'Player' then
                    Value:SetValues(PlayerList);
                end;
            end;
        end;

        Players.PlayerAdded:Connect(OnPlayerChange);
        Players.PlayerRemoving:Connect(OnPlayerChange);

        getgenv().Library = Library
    end
    local Library = getgenv().Library


    do
        local httpService = game:GetService('HttpService')
        local ThemeManager = {} do
    	ThemeManager.Folder = 'LinoriaLibSettings'
    	-- if not isfolder(ThemeManager.Folder) then makefolder(ThemeManager.Folder) end

    	ThemeManager.Library = nil
    	ThemeManager.BuiltInThemes = {
    		['Default'] 		= { 1, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1c1c1c","AccentColor":"0055ff","BackgroundColor":"141414","OutlineColor":"323232"}') },
    		['BBot'] 			= { 2, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}') },
    		['Fatality']		= { 3, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}') },
    		['Jester'] 			= { 4, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
    		['Mint'] 			= { 5, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}') },
    		['Tokyo Night'] 	= { 6, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}') },
    		['Ubuntu'] 			= { 7, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}') },
    		['Quartz'] 			= { 8, httpService:JSONDecode('{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}') },
    	}

    	function ThemeManager:ApplyTheme(theme)
    		local customThemeData = self:GetCustomTheme(theme)
    		local data = customThemeData or self.BuiltInThemes[theme]

    		if not data then return end

    		-- custom themes are just regular dictionaries instead of an array with { index, dictionary }

    		local scheme = data[2]
    		for idx, col in next, customThemeData or scheme do
    			self.Library[idx] = Color3.fromHex(col)

    			if Options[idx] then
    				Options[idx]:SetValueRGB(Color3.fromHex(col))
    			end
    		end

    		self:ThemeUpdate()
    	end

    	function ThemeManager:ThemeUpdate()
    		-- This allows us to force apply themes without loading the themes tab :)
    		local options = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
    		for i, field in next, options do
    			if Options and Options[field] then
    				self.Library[field] = Options[field].Value
    			end
    		end

    		self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor);
    		self.Library:UpdateColorsUsingRegistry()
    	end

    	function ThemeManager:LoadDefault()
    		local theme = 'Default'
    		local content = isfile(self.Folder .. '/themes/default.txt') and readfile(self.Folder .. '/themes/default.txt')

    		local isDefault = true
    		if content then
    			if self.BuiltInThemes[content] then
    				theme = content
    			elseif self:GetCustomTheme(content) then
    				theme = content
    				isDefault = false;
    			end
    		elseif self.BuiltInThemes[self.DefaultTheme] then
    		 	theme = self.DefaultTheme
    		end

    		if isDefault then
    			Options.ThemeManager_ThemeList:SetValue(theme)
    		else
    			self:ApplyTheme(theme)
    		end
    	end

    	function ThemeManager:SaveDefault(theme)
    		writefile(self.Folder .. '/themes/default.txt', theme)
    	end

    	function ThemeManager:CreateThemeManager(groupbox)
    		groupbox:AddLabel('Background color'):AddColorPicker('BackgroundColor', { Default = self.Library.BackgroundColor });
    		groupbox:AddLabel('Main color')	:AddColorPicker('MainColor', { Default = self.Library.MainColor });
    		groupbox:AddLabel('Accent color'):AddColorPicker('AccentColor', { Default = self.Library.AccentColor });
    		groupbox:AddLabel('Outline color'):AddColorPicker('OutlineColor', { Default = self.Library.OutlineColor });
    		groupbox:AddLabel('Font color')	:AddColorPicker('FontColor', { Default = self.Library.FontColor });

    		local ThemesArray = {}
    		for Name, Theme in next, self.BuiltInThemes do
    			table.insert(ThemesArray, Name)
    		end

    		table.sort(ThemesArray, function(a, b) return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1] end)

    		groupbox:AddDivider()
    		groupbox:AddDropdown('ThemeManager_ThemeList', { Text = 'Theme list', Values = ThemesArray, Default = 1 })

    		groupbox:AddButton('Set as default', function()
    			self:SaveDefault(Options.ThemeManager_ThemeList.Value)
    			self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_ThemeList.Value))
    		end)

    		Options.ThemeManager_ThemeList:OnChanged(function()
    			self:ApplyTheme(Options.ThemeManager_ThemeList.Value)
    		end)

    		groupbox:AddDivider()
    		groupbox:AddInput('ThemeManager_CustomThemeName', { Text = 'Custom theme name' })
    		groupbox:AddDropdown('ThemeManager_CustomThemeList', { Text = 'Custom themes', Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 })
    		groupbox:AddDivider()

    		groupbox:AddButton('Save theme', function()
    			self:SaveCustomTheme(Options.ThemeManager_CustomThemeName.Value)

    			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
    			Options.ThemeManager_CustomThemeList:SetValue(nil)
    		end):AddButton('Load theme', function()
    			self:ApplyTheme(Options.ThemeManager_CustomThemeList.Value)
    		end)

    		groupbox:AddButton('Refresh list', function()
    			Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
    			Options.ThemeManager_CustomThemeList:SetValue(nil)
    		end)

    		groupbox:AddButton('Set as default', function()
    			if Options.ThemeManager_CustomThemeList.Value ~= nil and Options.ThemeManager_CustomThemeList.Value ~= '' then
    				self:SaveDefault(Options.ThemeManager_CustomThemeList.Value)
    				self.Library:Notify(string.format('Set default theme to %q', Options.ThemeManager_CustomThemeList.Value))
    			end
    		end)

    		ThemeManager:LoadDefault()

    		local function UpdateTheme()
    			self:ThemeUpdate()
    		end

    		Options.BackgroundColor:OnChanged(UpdateTheme)
    		Options.MainColor:OnChanged(UpdateTheme)
    		Options.AccentColor:OnChanged(UpdateTheme)
    		Options.OutlineColor:OnChanged(UpdateTheme)
    		Options.FontColor:OnChanged(UpdateTheme)
    	end

    	function ThemeManager:GetCustomTheme(file)
    		local path = self.Folder .. '/themes/' .. file
    		if not isfile(path) then
    			return nil
    		end

    		local data = readfile(path)
    		local success, decoded = pcall(httpService.JSONDecode, httpService, data)

    		if not success then
    			return nil
    		end

    		return decoded
    	end

    	function ThemeManager:SaveCustomTheme(file)
    		if file:gsub(' ', '') == '' then
    			return self.Library:Notify('Invalid file name for theme (empty)', 3)
    		end

    		local theme = {}
    		local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }

    		for _, field in next, fields do
    			theme[field] = Options[field].Value:ToHex()
    		end

    		writefile(self.Folder .. '/themes/' .. file .. '.json', httpService:JSONEncode(theme))
    	end

    	function ThemeManager:ReloadCustomThemes()
    		local list = listfiles(self.Folder .. '/themes')

    		local out = {}
    		for i = 1, #list do
    			local file = list[i]
    			if file:sub(-5) == '.json' then
    				-- i hate this but it has to be done ...

    				local pos = file:find('.json', 1, true)
    				local char = file:sub(pos, pos)

    				while char ~= '/' and char ~= '\\' and char ~= '' do
    					pos = pos - 1
    					char = file:sub(pos, pos)
    				end

    				if char == '/' or char == '\\' then
    					table.insert(out, file:sub(pos + 1))
    				end
    			end
    		end

    		return out
    	end

    	function ThemeManager:SetLibrary(lib)
    		self.Library = lib
    	end

    	function ThemeManager:BuildFolderTree()
    		local paths = {}

    		-- build the entire tree if a path is like some-hub/phantom-forces
    		-- makefolder builds the entire tree on Synapse X but not other exploits

    		local parts = self.Folder:split('/')
    		for idx = 1, #parts do
    			paths[#paths + 1] = table.concat(parts, '/', 1, idx)
    		end

    		table.insert(paths, self.Folder .. '/themes')
    		table.insert(paths, self.Folder .. '/settings')

    		for i = 1, #paths do
    			local str = paths[i]
    			if not isfolder(str) then
    				makefolder(str)
    			end
    		end
    	end

    	function ThemeManager:SetFolder(folder)
    		self.Folder = folder
    		self:BuildFolderTree()
    	end

    	function ThemeManager:CreateGroupBox(tab)
    		assert(self.Library, 'Must set ThemeManager.Library first!')
    		return tab:AddLeftGroupbox('Themes')
    	end

    	function ThemeManager:ApplyToTab(tab)
    		assert(self.Library, 'Must set ThemeManager.Library first!')
    		local groupbox = self:CreateGroupBox(tab)
    		self:CreateThemeManager(groupbox)
    	end

    	function ThemeManager:ApplyToGroupbox(groupbox)
    		assert(self.Library, 'Must set ThemeManager.Library first!')
    		self:CreateThemeManager(groupbox)
    	end

    	ThemeManager:BuildFolderTree()
        end

        getgenv().ThemeManager = ThemeManager
    end

    local ThemeManager = getgenv().ThemeManager

    do
        local httpService = game:GetService('HttpService')

        local SaveManager = {} do
    	SaveManager.Folder = 'LinoriaLibSettings'
    	SaveManager.Ignore = {}
    	SaveManager.Parser = {
    		Toggle = {
    			Save = function(idx, object)
    				return { type = 'Toggle', idx = idx, value = object.Value }
    			end,
    			Load = function(idx, data)
    				if Toggles[idx] then
    					Toggles[idx]:SetValue(data.value)
    				end
    			end,
    		},
    		Slider = {
    			Save = function(idx, object)
    				return { type = 'Slider', idx = idx, value = tostring(object.Value) }
    			end,
    			Load = function(idx, data)
    				if Options[idx] then
    					Options[idx]:SetValue(data.value)
    				end
    			end,
    		},
    		Dropdown = {
    			Save = function(idx, object)
    				return { type = 'Dropdown', idx = idx, value = object.Value, mutli = object.Multi }
    			end,
    			Load = function(idx, data)
    				if Options[idx] then
    					Options[idx]:SetValue(data.value)
    				end
    			end,
    		},
    		ColorPicker = {
    			Save = function(idx, object)
    				return { type = 'ColorPicker', idx = idx, value = object.Value:ToHex(), transparency = object.Transparency }
    			end,
    			Load = function(idx, data)
    				if Options[idx] then
    					Options[idx]:SetValueRGB(Color3.fromHex(data.value), data.transparency)
    				end
    			end,
    		},
    		KeyPicker = {
    			Save = function(idx, object)
    				return { type = 'KeyPicker', idx = idx, mode = object.Mode, key = object.Value }
    			end,
    			Load = function(idx, data)
    				if Options[idx] then
    					Options[idx]:SetValue({ data.key, data.mode })
    				end
    			end,
    		},

    		Input = {
    			Save = function(idx, object)
    				return { type = 'Input', idx = idx, text = object.Value }
    			end,
    			Load = function(idx, data)
    				if Options[idx] and type(data.text) == 'string' then
    					Options[idx]:SetValue(data.text)
    				end
    			end,
    		},
    	}

    	function SaveManager:SetIgnoreIndexes(list)
    		for _, key in next, list do
    			self.Ignore[key] = true
    		end
    	end

    	function SaveManager:SetFolder(folder)
    		self.Folder = folder;
    		self:BuildFolderTree()
    	end

    	function SaveManager:Save(name)
    		if (not name) then
    			return false, 'no config file is selected'
    		end

    		local fullPath = self.Folder .. '/settings/' .. name .. '.json'

    		local data = {
    			objects = {}
    		}

    		for idx, toggle in next, Toggles do
    			if self.Ignore[idx] then continue end

    			table.insert(data.objects, self.Parser[toggle.Type].Save(idx, toggle))
    		end

    		for idx, option in next, Options do
    			if not self.Parser[option.Type] then continue end
    			if self.Ignore[idx] then continue end

    			table.insert(data.objects, self.Parser[option.Type].Save(idx, option))
    		end

    		local success, encoded = pcall(httpService.JSONEncode, httpService, data)
    		if not success then
    			return false, 'failed to encode data'
    		end

    		writefile(fullPath, encoded)
    		return true
    	end

    	function SaveManager:Load(name)
    		if (not name) then
    			return false, 'no config file is selected'
    		end

    		local file = self.Folder .. '/settings/' .. name .. '.json'
    		if not isfile(file) then return false, 'invalid file' end

    		local success, decoded = pcall(httpService.JSONDecode, httpService, readfile(file))
    		if not success then return false, 'decode error' end

    		for _, option in next, decoded.objects do
    			if self.Parser[option.type] then
    				task.spawn(function() self.Parser[option.type].Load(option.idx, option) end) -- task.spawn() so the config loading wont get stuck.
    			end
    		end

    		return true
    	end

    	function SaveManager:IgnoreThemeSettings()
    		self:SetIgnoreIndexes({
    			"BackgroundColor", "MainColor", "AccentColor", "OutlineColor", "FontColor", -- themes
    			"ThemeManager_ThemeList", 'ThemeManager_CustomThemeList', 'ThemeManager_CustomThemeName', -- themes
    		})
    	end

    	function SaveManager:BuildFolderTree()
    		local paths = {
    			self.Folder,
    			self.Folder .. '/themes',
    			self.Folder .. '/settings'
    		}

    		for i = 1, #paths do
    			local str = paths[i]
    			if not isfolder(str) then
    				makefolder(str)
    			end
    		end
    	end

    	function SaveManager:RefreshConfigList()
    		local list = listfiles(self.Folder .. '/settings')

    		local out = {}
    		for i = 1, #list do
    			local file = list[i]
    			if file:sub(-5) == '.json' then
    				-- i hate this but it has to be done ...

    				local pos = file:find('.json', 1, true)
    				local start = pos

    				local char = file:sub(pos, pos)
    				while char ~= '/' and char ~= '\\' and char ~= '' do
    					pos = pos - 1
    					char = file:sub(pos, pos)
    				end

    				if char == '/' or char == '\\' then
    					table.insert(out, file:sub(pos + 1, start - 1))
    				end
    			end
    		end

    		return out
    	end

    	function SaveManager:SetLibrary(library)
    		self.Library = library
    	end

    	function SaveManager:LoadAutoloadConfig()
    		if isfile(self.Folder .. '/settings/autoload.txt') then
    			local name = readfile(self.Folder .. '/settings/autoload.txt')

    			local success, err = self:Load(name)
    			if not success then
    				return self.Library:Notify('Failed to load autoload config: ' .. err)
    			end

    			self.Library:Notify(string.format('Auto loaded config %q', name))
    		end
    	end


    	function SaveManager:BuildConfigSection(tab)
    		assert(self.Library, 'Must set SaveManager.Library')

    		local section = tab:AddRightGroupbox('Configuration')

    		section:AddInput('SaveManager_ConfigName',    { Text = 'Config name' })
    		section:AddDropdown('SaveManager_ConfigList', { Text = 'Config list', Values = self:RefreshConfigList(), AllowNull = true })

    		section:AddDivider()

    		section:AddButton('Create config', function()
    			local name = Options.SaveManager_ConfigName.Value

    			if name:gsub(' ', '') == '' then
    				return self.Library:Notify('Invalid config name (empty)', 2)
    			end

    			local success, err = self:Save(name)
    			if not success then
    				return self.Library:Notify('Failed to save config: ' .. err)
    			end

    			self.Library:Notify(string.format('Created config %q', name))

    			Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
    			Options.SaveManager_ConfigList:SetValue(nil)
    		end):AddButton('Load config', function()
    			local name = Options.SaveManager_ConfigList.Value

    			local success, err = self:Load(name)
    			if not success then
    				return self.Library:Notify('Failed to load config: ' .. err)
    			end

    			self.Library:Notify(string.format('Loaded config %q', name))
    		end)

    		section:AddButton('Overwrite config', function()
    			local name = Options.SaveManager_ConfigList.Value

    			local success, err = self:Save(name)
    			if not success then
    				return self.Library:Notify('Failed to overwrite config: ' .. err)
    			end

    			self.Library:Notify(string.format('Overwrote config %q', name))
    		end)

    		section:AddButton('Refresh list', function()
    			Options.SaveManager_ConfigList:SetValues(self:RefreshConfigList())
    			Options.SaveManager_ConfigList:SetValue(nil)
    		end)

    		section:AddButton('Set as autoload', function()
    			local name = Options.SaveManager_ConfigList.Value
    			writefile(self.Folder .. '/settings/autoload.txt', name)
    			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
    			self.Library:Notify(string.format('Set %q to auto load', name))
    		end)

    		SaveManager.AutoloadLabel = section:AddLabel('Current autoload config: none', true)

    		if isfile(self.Folder .. '/settings/autoload.txt') then
    			local name = readfile(self.Folder .. '/settings/autoload.txt')
    			SaveManager.AutoloadLabel:SetText('Current autoload config: ' .. name)
    		end

    		SaveManager:SetIgnoreIndexes({ 'SaveManager_ConfigList', 'SaveManager_ConfigName' })
    	end

    	SaveManager:BuildFolderTree()
        end

        getgenv().SaveManager = SaveManager
    end

    local SaveManager = getgenv().SaveManager

    local settings = {
        SilentEnabled = false,
        SilentFovCircle = false,
        SilentFov = 100,
        SilentFovCircleColor = Color3.new(1,1,1),
        RecoilUp = 1,
        RecoilSide = 1,
        Spread = 1,
        HitPart = "torso",
        MeleeLength = 2.95,
        RemoveKickback = false,
        ReloadOverride = false,
        SprintOverride = false,
        OmniSprint = false,
    }

    local function cfr(from, to)
        return CFrame.lookAt(from, to)
    end

    GetTarget = function()
        local cam = game:GetService("Workspace").CurrentCamera
        local viewport = cam.ViewportSize
        local center = Vector2.new(viewport.X / 2, viewport.Y / 2)
        local useFov = settings.SilentFovCircle
        local fovRadius = settings.SilentFov

        local _vmType = type(playerToViewmodel)
        --print("[GetTarget] vmcount =", #playerToViewmodel)
        local _vmCount = 0
        if _vmType == "table" then for _ in next, playerToViewmodel do _vmCount += 1 end end
        --print("[GetTarget] playerToViewmodel type=" .. _vmType .. " count=" .. _vmCount .. " SilentEnabled=" .. tostring(settings.SilentEnabled) .. " useFov=" .. tostring(settings.SilentFovCircle) .. " fov=" .. tostring(settings.SilentFov))

        local bestDist = math.huge
        local bestPart = nil

        for player, vm in next, playerToViewmodel or {} do
            if player == LocalPlayer then continue end

            local hitpart = vm:FindFirstChild(settings.HitPart) or vm:FindFirstChild("torso")
            if not hitpart then continue end

            local screenPos, onScreen = cam:WorldToViewportPoint(hitpart.Position)
            if not onScreen then continue end

            local distFromCenter = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
            if useFov and distFromCenter > fovRadius then continue end

            if distFromCenter < bestDist then
                bestDist = distFromCenter
                bestPart = hitpart
            end
        end

        --print("[GetTarget] result=" .. tostring(bestPart) .. " bestDist=" .. (bestDist == math.huge and "inf" or tostring(bestDist)))
        return bestPart
    end

    local DS = { -- drone settings
        Enabled = true,
        ShowName = true,
        NameColor = Color3.new(1,1,1),
        NameSize = 8,
        NameOutline = true,
        NameOutlineColor = Color3.new(0,0,0),
        ShowDistance = true,
        DistanceColor = Color3.new(1,1,1),
        ShowBox = true,
        BoxColor = Color3.new(1,0,0),
        BoxThickness = 1,
        BoxOutline = true,
        BoxOutlineColor = Color3.new(0,0,0),
        BoxFill = false,
        BoxFillColor = Color3.new(1,1,1),
        BoxFillTransparency = 0.5
    }

    -- potentially could do AntiFlash (line 1462 character.luau)
    -- potentially could do quick vault? (line 1030 character.luau)

    local gc = getgc()

    local recoil_func = nil
    local shoot_func = nil
    local reload_funcs = {}
    local render_running = nil

    local function phookfunction(target, replacement)
        if typeof(target) ~= "function" then
            return nil
        end

        local ok, original = pcall(hookfunction, target, replacement)
        if not ok then
            return nil
        end

        return original
    end

    local function pgetupval(fn, index)
        if typeof(fn) ~= "function" then
            return nil
        end

        local ok, value = pcall(getupvalue, fn, index)
        if not ok then
            return nil
        end

        return value
    end

    local function pgetupvals(fn)
        if typeof(fn) ~= "function" then
            return nil
        end

        local ok, values = pcall(getupvalues, fn)
        if not ok then
            return nil
        end

        return values
    end

    for _,v in pairs(gc) do
        if typeof(v) == 'function' and islclosure(v) then
            local dbg = debug.getinfo(v)
            local name = dbg.name
            local src = dbg.source
            local params = dbg.nparams
            local constants = getconstants(v)
            if dbg.short_src:find("Gun") and name and string.find(name, "recoil_function") then
                recoil_func = v
            elseif dbg.short_src:find("Gun") and name and string.find(name, "send_shoot") then
                shoot_func = v
            elseif table.find(constants, 'owner') and table.find(constants, 'fire') and table.find(constants, 'reload') and table.find(constants, 'reload_thread') and table.find(constants, 'running') and table.find(constants, 'values') and table.find(constants, 'mag_size') and table.find(constants, 'get') and table.find(constants, 'equip_debounce') and table.find(constants, 'can_reload') and table.find(constants, 0) then
                table.insert(reload_funcs, v)
            elseif name == 'render_running' then
                render_running = v
            end
        end
    end

    local old; old = phookfunction(recoil_func, function(...)
        local args = {...}

        local camera_controller = args[2]
        local weapon = args[1]

        local upvalues = pgetupvals(old)
        local v_u_4 = upvalues and upvalues[1]
        local v_u_8 = upvalues and upvalues[2]
        if not (v_u_4 and v_u_8 and v_u_8.tween) then
            return old(...)
        end

        -- upvalues: (copy) v_u_4, (copy) v_u_8
        camera_controller.values.cframes:get("camera"):remove_offset("shoot")
        local shoot_offset = camera_controller.values.cframes:get("camera"):set_offset("shoot")
        local previous_offset_value = shoot_offset.Value
        if camera_controller.values.camera:get() then
            local cam_values = camera_controller.values
            cam_values.old_cam_render = cam_values.old_cam_render * previous_offset_value:Inverse()
        end
        local recoil_up = weapon.states.recoil_up:get() * settings.RecoilUp
        local recoil_side = weapon.states.recoil_side:get() * settings.RecoilSide
        if v_u_4.current_device:get() ~= "pc" then
            recoil_up = recoil_up * 0.7
            recoil_side = recoil_side * 0.7
        end
        if weapon.prone_recoil and camera_controller.states.walk_state:get() == "prone" then
            recoil_up = recoil_up * weapon.prone_recoil
            recoil_side = recoil_side * weapon.prone_recoil
        end
        v_u_8.tween(shoot_offset, TweenInfo.new(0), {
            ["Value"] = CFrame.new()
        })
        shoot_offset.Value = CFrame.new()
        if camera_controller.values.cframes:get("arm2"):current_pivot() == "equipped" then
            recoil_up = recoil_up * 0.8
        end
        local cframe_angles = CFrame.Angles
        local recoil_up_magnitude = math.random() * recoil_up + recoil_up
        local recoil_up_radians = math.rad(recoil_up_magnitude)
        local recoil_side_radians = math.random() * (recoil_side * 2) - recoil_side
        local recoil_cframe = cframe_angles(recoil_up_radians, math.rad(recoil_side_radians), 0)
        local recoil_intensity = (recoil_up * 2 + recoil_side) / 40
        local tween_duration = math.exp(recoil_intensity)
        v_u_8.tween(shoot_offset, TweenInfo.new(tween_duration * 0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Value"] = recoil_cframe
        }).Completed:Wait()
        v_u_8.tween(shoot_offset, TweenInfo.new(tween_duration * 0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            ["Value"] = CFrame.new()
        }).Completed:Wait()
    end)

    function get_circular_spread(p277, p278) -- INT
        local v279 = math.random() * 2 * 3.141592653589793
        local v280 = math.random() ^ 0.35 * p278
        return (p277.RightVector * math.cos(v279) + p277.UpVector * math.sin(v279)) * v280
    end

    local uv_table = {pgetupval(shoot_func, 1), settings}

    local olds; olds = phookfunction(shoot_func, function(...)
        local args = {...}

        local p281 = args[1]
        local v_u_8 = uv_table[1]
        local settings = uv_table[2]
        if not (v_u_8 and v_u_8.validate_position) then
            return olds(...)
        end

        -- upvalues: (copy) v_u_8
        local v282 = p281.owner
        local v283 = p281:get_shoot_look()
        if p281.client_sided_hitscan then
            local v284 = p281.states.pellets:get() > 1
            local v285 = CFrame.new(v_u_8.validate_position(game.Workspace.CurrentCamera.CFrame.Position, v283.Position, v282.values.ray_params)) * v283.Rotation
            local v286 = p281.states.pellets:get()
            local v287 = {}
            for v288 = 1, v286 do
                local v289 = v285.Position
                local v290 = v285.LookVector * 1000
                local v291 = p281.states.spread:get() * 100 * settings.Spread
                local v292 = v290 + (1 - p281.accuracy.Value * (p281.red_dot and p281.red_dot.Transparency == 1 and 0.5 or 1) * math.map(v288, 1, math.max(2, v286), 1, 0)) * get_circular_spread(v285, v291)
                if v284 then
                    v292 = v292 - v292 * 0.75
                end
                local v293 = p281:ray_damage(v289, v292, { v282.values.viewmodels, v282.instance }, nil)
                table.insert(v287, v293)
            end
            p281.states.shoot:fire(v283, v287)
        else
            p281.states.shoot:fire(v283)
        end
    end)

    local rs                    = cloneref(game:GetService('ReplicatedStorage'))
    local gun_handler           = require(rs.Modules.Items.Item.Gun)

    local old_shoot_look; old_shoot_look = phookfunction(gun_handler.get_shoot_look, function(shoot_cframe)
        local result = old_shoot_look(shoot_cframe)

        --print("[hook] get_shoot_look fired, result type=" .. typeof(result))

        if (typeof(result) ~= 'CFrame') then return result end

        local target = GetTarget()

        --print("[hook] target=" .. tostring(target) .. " SilentEnabled=" .. tostring(settings.SilentEnabled))

        if (settings.SilentEnabled and target) then
            --print("[hook] redirecting shot to " .. tostring(target.Name) .. " @ " .. tostring(target.Position))
            return cfr(result.p, target.position)
        end

        return result
    end)

    local send_melee = gun_handler.send_melee
    local meleeLengthConst = nil
    for i,v in pairs(getconstants(send_melee)) do
        if v == 2.95 then
            meleeLengthConst = i
        end
    end

    local input_shoot = gun_handler.input_shoot
    local old_input_shoot; old_input_shoot = phookfunction(input_shoot, function(p303, p304, p305)
        local v_u_11, v_u_9 = pgetupval(old_input_shoot, 1), pgetupval(old_input_shoot, 2)
        local v306 = p303.owner
    	if v306 and (v306.values.equipped == p303 and (not p303.safety:get() or p303.accuracy.Value >= 1)) and not ((not settings.SprintOverride and v306.states.running:get()) or v306.values.equip_debounce:get()) then
    		local v307 = os.clock()
    		local v308 = p303.states.firerate:get()
    		if (p303.burst_left or 0) <= 0 and (p304 and (not p305 or p303.automatic) or not p304 and (p305 and (not p303.automatic and p303.shoot_hold))) and (v308 == 0 or v307 - p303.last_shot > 1 / (v308 / 60)) then
    			if p303.states.mag:get() > 0 and p303.states.chambered:get() then
    				p303.last_shot = v307
    				p303:send_shoot()
    				if p303.burst then
    					p303.burst_left = p303.burst - 1
    				end
    			else
    				p303:reload(v306, false)
    			end
    		end
    	end
    	if v_u_11 and v_u_11.settings and v_u_9 and v_u_9.get and v_u_11.settings.auto_ads and (p305 or not v_u_9.get("ShootJoystickFrame").Visible) then
    		if p304 and not p303.states.sights:get() then
    			p303:input_ads(true, not v_u_11.settings.lock_auto_ads)
    		elseif not (p304 or (v_u_9.get("CancelScope").Visible or v_u_11.settings.lock_auto_ads)) then
    			p303:input_ads(false, true)
    		end
    	end
    	p303.shoot_hold = p304
    end)

    local input_render = gun_handler.input_render
    local old_input_render; old_input_render = phookfunction(input_render, function(self, _)
        local data = pgetupval(old_input_render, 1)
        local data_settings = data and data.settings or {}
        local player = self.owner
    	if player.values.prone_debounce or player.values.equip_debounce:get() then
    		self:reload(player, false)
    		self:cock(player, false)
    	elseif not self.cock_thread.running and (not self.reload_thread.running and (not self.states.chambered:get() and (not player.values.equip_debounce:get() and (not self.states.reload:get() and (player.states.vault:get() == 0 and (self.states.loaded:get() and self.states.mag:get() > 0)))))) then
    		self.states.cock:fire_instant()
    	end
    	local _ = player.values.viewmodels.head
    	if not data_settings.toggle_aim then
    		if self.ads_hold and not (self.reload_thread.running or (self.meleeing or (player.states.running:get() or (player.values.prone_debounce or player.values.equip_debounce:get())))) then
    			self.states.sights:set(true)
    		else
    			self.states.sights:set(false)
    		end
    	end
    	if self.automatic and (self.shoot_hold or self.burst_left and self.burst_left > 0) and ((not self.safety:get() or self.accuracy.Value >= 1) and not (player.values.equip_debounce:get() or (not settings.SprintOverride and player.states.running:get()))) then
    		local now = os.clock()
    		local firerate = self.states.firerate:get()
    		if (firerate == 0 or now - self.last_shot > 1 / (firerate / 60)) and (self.states.mag:get() > 0 and self.states.chambered:get()) then
    			self.last_shot = now
    			self:send_shoot()
    			if self.burst_left then
    				self.burst_left = self.burst_left - 1
    			end
    		end
    	end
    	if self.states.reload:get() and player.values.equip_debounce:get() then
    		self:reload(player, false)
    	end
    end)

    local kickback = gun_handler.kickback
    local oldkickback; oldkickback = phookfunction(kickback, function(...)
        if settings.RemoveKickback then
            return
        else
            return oldkickback(...)
        end
    end)

    local running = gun_handler.running

    local old_running; old_running = phookfunction(running, function(p88, p89, p90)
    local v91 = p89.values.cframes:get("arms"):get_offset("run")
	if p90 and not settings.ReloadOverride then
		p88:running_pivots(p89, true)
		p88.states.sights:set(false)
		if not settings.ReloadOverride then
		    p88:reload(p89, false)
		end
		p89.values.cframes:get("arms"):set_offset("run")
		p88.anim.Run.run_offset(v91)
	else
		p88:running_pivots(p89, false)
		p88.anim.Run.base(v91).Completed:Wait()
		p89.values.cframes:get("arms"):remove_offset("run")
	end
    end)

    for i,v in pairs(reload_funcs) do -- might break? i had stack overflow a couple of times with this
        reload_funcs[i] = phookfunction(reload_funcs[i], function(isDown)
            local self = pgetupval(reload_funcs[i], 1)
            if not self then
                return
            end
            local player = self.owner
            local reloadOverride = settings.ReloadOverride
            local canReload = isDown and (player and (not self.reload_thread.running and (not player.values.equip_debounce:get() and (player.values.equipped == self and (
                (reloadOverride or player.states.vault:get() == 0) and
                (reloadOverride or not player.states.running:get()) and
                (reloadOverride or not player.values.prone_debounce) and
                self.states.bullets:get() > 0
            )))))
            if canReload and self.states.mag:get() - (self.cylinder and 0 or 1) < self.states.mag_size:get() then
                self.states.sights:set(false)
                self.ads_hold = false
                local holding = player.values.holding
                if holding and holding.can_reload == false then
                    player.states.holding:set(player.values.hands)
                    while player.values.equip_debounce:get() or player.values.holding == holding do
                        player.values.equip_debounce:wait()
                    end
                end
                self.states.reload:fire()
            end
        end)
    end

    local StateObject = require(game.ReplicatedStorage.Modules.StateObject)
    local op1_state = getgenv().vault_cc_op1 or {}
    getgenv().vault_cc_op1 = op1_state
    op1_state.characters = op1_state.characters or setmetatable({}, { __mode = "k" })
    local hooked_characters = op1_state.characters

    local function is_local_character(character_object)
        return character_object.owner and character_object.owner.get and character_object.owner:get() == LocalPlayer
    end

    local function get_equipped_weapon(character_object)
        local values = character_object and character_object.values
        local weapon = values and values.equipped
        if weapon and weapon.reload and weapon.cock then
            return weapon
        end
    end

    local function cancel_equipped_weapon(character_object)
        if settings.ReloadOverride or not is_local_character(character_object) then
            return
        end

        local weapon = get_equipped_weapon(character_object)
        if weapon then
            weapon:reload(character_object, false)
            weapon:cock(character_object, false)
        end
    end

    local function hook_character(character_object)
        if hooked_characters[character_object] then
            return
        end

        local states = character_object.states
        if not (states and states.walk_state and states.vault) then
            return
        end

        hooked_characters[character_object] = true

        states.walk_state:hook(function(new_state, old_state)
            if new_state == "prone" or old_state == "prone" then
                cancel_equipped_weapon(character_object)
            end
        end)

        states.vault:hook(function(vault_state)
            if vault_state > 0 then
                cancel_equipped_weapon(character_object)
            end
        end)
    end

    StateObject.hook("Character", hook_character)

    local function applyReloadOverride(weaponObject)
        local reloadEvent = weaponObject.states.reload
        if not reloadEvent or not reloadEvent.pause_hooks then return end

        for i, func in pairs(reloadEvent.pause_hooks) do
            local ok, _, upval = pcall(debug.getupvalue, func, 1)
            if upval == weaponObject then
                local cancellingReload = false
                local old; old = phookfunction(reloadEvent.pause_hooks[i], function(newVal, oldVal)
                    if newVal ~= oldVal and not cancellingReload then
                        if weaponObject.owner then
                            local reloadOverride = settings.ReloadOverride
                            local player = weaponObject.owner
                            local shouldCancel = not reloadOverride and (
                                player.states.vault:get() ~= 0 or
                                player.states.running:get() or
                                player.values.prone_debounce
                            )
                            if shouldCancel then
                                cancellingReload = true
                                weaponObject:reload(weaponObject.owner, false)
                                cancellingReload = false
                            end
                        end
                    end
                end)
                break
            end
        end
    end

    local function hookGunType(folder)
        for _, child in pairs(folder:GetChildren()) do
            if child.Name ~= "Animations" and child.Name ~= "Sounds" then
                StateObject.hook(child.Name, function(weaponObject)
                    applyReloadOverride(weaponObject)
                end)
            end
        end
    end

    local guns = game.ReplicatedStorage.Modules.Items.Item.Gun
    hookGunType(guns.Automatic)

    for _, subfolder in pairs(guns.Semi:GetChildren()) do
        if subfolder.Name ~= "Animations" and subfolder.Name ~= "Sounds" then
            hookGunType(subfolder)
        end
    end

    local old_render_running; old_render_running = phookfunction(render_running, function(p406)
        local v_u_19, v_u_9 = pgetupval(old_render_running, 1), pgetupval(old_render_running, 2)
        if not (v_u_19 and v_u_19.tightspace and v_u_9 and v_u_9.settings) then
            return old_render_running(p406)
        end

        local v407 = p406.values.inputs
        local v408 = p406.states.walk_state:get()
        local v409 = p406.values.equipped
        if (v407:get("run"):holding() or p406.values.running_toggled) and (p406.values.move_vector and (p406.values.move_vector.Magnitude > 0.5 and (v409.states.sights == nil or not v409.states.sights:get())) and (p406.values.walking:get() and (((p406.values.move_direction.Z <= -0.5) or settings.OmniSprint) and (p406.states.climbing:get() == 0 and (p406.states.speed_multiplier:get() >= 1 and (p406.states.vault:get() == 0 and (not p406.values.equip_debounce:get() and (not p406.values.prone_debounce and (p406.values.equipped == nil or (p406.values.equipped.states.melee == nil or not p406.values.equipped.states.melee:get())))))))) and (p406.values.holding == nil or p406.values.holding.can_run ~= false))) then
            if v408 == "stand" or v408 == "prone" and not v_u_19.tightspace(p406, CFrame.new(0, 2, 0)) or v408 == "crouch" and not v_u_19.tightspace(p406, CFrame.new(0, 1.15, 0)) then
                p406.states.running:set(true)
                if v_u_9.settings.auto_vault and p406.values.can_vault then
                    p406.values.can_vault = false
                    task.spawn(v_u_19.vault, p406)
                end
            else
                p406.states.running:set(false)
                p406.values.running_toggled = false
            end
        else
            p406.states.running:set(false)
            p406.values.running_toggled = false
        end
        if v407:get("slow_walk").key then
            if not v_u_9.settings.toggle_slow_walk then
                if v407:get("slow_walk"):holding() and p406.states.running:get() == false then
                    p406.states.walking:set(true)
                else
                    p406.states.walking:set(false)
                end
            end
        else
            local v410 = p406.values.move_vector and (p406.values.move_vector.Magnitude or 0) or 0
            if v410 > 0 and (v410 <= 0.5 and p406.states.running:get() == false) then
                p406.states.walking:set(true)
                return
            end
            p406.states.walking:set(false)
        end
    end)

    local Window = Library:CreateWindow({
        Title = 'vault.cc | Operation One',
        Center = true,
        AutoShow = true,
        TabPadding = 8,
        MenuFadeTime = 0.2
    })

    local Tabs = {
        Main = Window:AddTab('Main'),
        Visuals = Window:AddTab('Visuals'),
        Drones = Window:AddTab('Drones'),
        ['UI Settings'] = Window:AddTab('UI Settings'),
    }

    local SilentGroup = Tabs.Main:AddLeftGroupbox('Silent Aim Settings')
    SilentGroup:AddToggle('SilentEnabled', { Text = 'Enabled', Default = settings.SilentEnabled })
    SilentGroup:AddDropdown('HitPartDropdown', { Text = 'Hit Part', Values = {'torso', 'head'}, Default = 'torso', Callback = function(v) settings.HitPart = v end })
    SilentGroup:AddToggle('FovCircleEnabled', { Text = 'FOV Circle', Default = settings.SilentFovCircle })
    SilentGroup:AddLabel('Color'):AddColorPicker('SilentFovColor', { Text = 'Color', Default = settings.SilentFovCircleColor, Callback = function(v) settings.SilentFovCircleColor = v end })
    SilentGroup:AddSlider('FovSize', { -- 0-1
        Text = 'FOV Size',
        Default = settings.SilentFov,
        Min = 5, Max = 300, Rounding = 0, Suffix = 'px'
    })
    SilentGroup:AddSlider('SpreadMultiplier', { -- 0-1
        Text = 'Spread Amount',
        Default = settings.Spread * 100,
        Min = 0, Max = 100, Rounding = 0, Suffix = '%',
        Tooltip = 'modifies the spread of the gun so bullets are more accurate'
    })
    SilentGroup:AddSlider('RecoilUp', { -- 0-1
        Text = 'Recoil Up',
        Default = settings.RecoilUp * 100,
        Min = 0, Max = 100, Rounding = 0, Suffix = '%',
        Tooltip = 'modifies the amount of recoil on the y-axis for the gun'
    })
    SilentGroup:AddSlider('RecoilSide', { -- 0-1
        Text = 'Recoil Side',
        Default = settings.RecoilSide * 100,
        Min = 0, Max = 100, Rounding = 0, Suffix = '%',
        Tooltip = 'modifies the amount of recoil on the x-axis for the gun'
    })

    SilentGroup:AddToggle('RemoveKickback', { Text = 'Remove Gun Kickback', Default = settings.RemoveKickback, Tooltip = 'removes the gun kickback' })
    SilentGroup:AddToggle('ReloadOverride', { Text = 'Reload Override', Default = settings.ReloadOverride, Tooltip = 'allows you to reload while running, vaulting, etc' })
    SilentGroup:AddToggle('SprintOverride', { Text = 'Sprint Override', Default = settings.SprintOverride, Tooltip = 'allows you to shoot while running' })
    SilentGroup:AddToggle('OmniSprint', { Text = 'Omni Sprint', Default = settings.OmniSprint, Tooltip = 'allows you to run in any direction' })

    Toggles.SilentEnabled:OnChanged(function() settings.SilentEnabled = Toggles.SilentEnabled.Value end)
    Toggles.FovCircleEnabled:OnChanged(function() settings.SilentFovCircle = Toggles.FovCircleEnabled.Value end)
    Options.FovSize:OnChanged(function() settings.SilentFov = Options.FovSize.Value end)
    Options.SilentFovColor:OnChanged(function() settings.SilentFovCircleColor = Options.SilentFovColor.Value end)
    Options.SpreadMultiplier:OnChanged(function() settings.Spread = Options.SpreadMultiplier.Value / 100 end)
    Options.RecoilUp:OnChanged(function() settings.RecoilUp = Options.RecoilUp.Value / 100 end)
    Options.RecoilSide:OnChanged(function() settings.RecoilSide = Options.RecoilSide.Value / 100 end)
    Toggles.RemoveKickback:OnChanged(function() settings.RemoveKickback = Toggles.RemoveKickback.Value end)
    Toggles.ReloadOverride:OnChanged(function() settings.ReloadOverride = Toggles.ReloadOverride.Value end)
    Toggles.SprintOverride:OnChanged(function() settings.SprintOverride = Toggles.SprintOverride.Value end)
    Toggles.OmniSprint:OnChanged(function() settings.OmniSprint = Toggles.OmniSprint.Value end)


    -- ==================== VISUALS ====================

    -- Main ESP
    local MainESPGroup = Tabs.Visuals:AddLeftGroupbox('Main ESP')
    MainESPGroup:AddToggle('ESPEnabled',       { Text = 'ESP Enabled',        Default = ESP.Settings.Enabled,          Callback = function(v) ESP.Settings.Enabled          = v end })
    --MainESPGroup:AddToggle('PartsOnly',        { Text = 'Parts Only',         Default = ESP.Settings.PartsOnly,        Callback = function(v) ESP.Settings.PartsOnly        = v end })
    MainESPGroup:AddToggle('TeamCheck',        { Text = 'Team Check',         Default = ESP.Settings.TeamCheck,        Callback = function(v) ESP.Settings.TeamCheck        = v end })
    MainESPGroup:AddToggle('AliveCheck',       { Text = 'Alive Check',        Default = ESP.Settings.AliveCheck,       Callback = function(v) ESP.Settings.AliveCheck       = v end })
    MainESPGroup:AddToggle('EnableTeamColors', { Text = 'Enable Team Colors', Default = ESP.Settings.EnableTeamColors, Callback = function(v) ESP.Settings.EnableTeamColors = v end })
    MainESPGroup:AddLabel('Team Color'):AddColorPicker('TeamColor', { Text = 'Team Color', Default = ESP.Settings.TeamColor, Callback = function(v) ESP.Settings.TeamColor = v end })
    --MainESPGroup:AddToggle('CachePositions',   { Text = 'Cache Positions',    Default = ESP.Settings.CachePositions,   Callback = function(v) ESP.Settings.CachePositions   = v end })
    --MainESPGroup:AddToggle('EntityESP',        { Text = 'Entity ESP',         Default = ESP.Settings.EntityESP,        Callback = function(v) ESP.Settings.EntityESP        = v end })

    -- Name / Text ESP
    local TextGroup = Tabs.Visuals:AddRightGroupbox('Name / Text ESP')
    TextGroup:AddToggle('TextEnabled',         { Text = 'Text Enabled',        Default = ESP.Properties.ESP.Enabled,            Callback = function(v) ESP.Properties.ESP.Enabled            = v end })
    TextGroup:AddToggle('RainbowText',         { Text = 'Rainbow Color',       Default = ESP.Properties.ESP.RainbowColor,        Callback = function(v) ESP.Properties.ESP.RainbowColor        = v end })
    TextGroup:AddLabel('Text Color'):AddColorPicker('TextColor', { Text = 'Text Color', Default = ESP.Properties.ESP.Color, Callback = function(v) ESP.Properties.ESP.Color = v end })
    TextGroup:AddSlider('TextSize',            { Text = 'Text Size',           Default = ESP.Properties.ESP.Size,               Min = 8, Max = 26, Rounding = 0, Callback = function(v) ESP.Properties.ESP.Size               = v end })
    TextGroup:AddToggle('TextOutline',         { Text = 'Outline',             Default = ESP.Properties.ESP.Outline,            Callback = function(v) ESP.Properties.ESP.Outline            = v end })
    TextGroup:AddLabel('Text Outline Color'):AddColorPicker('TextOutlineColor', { Text = 'Outline Color', Default = ESP.Properties.ESP.OutlineColor, Callback = function(v) ESP.Properties.ESP.OutlineColor = v end })
    TextGroup:AddToggle('DisplayDistance',     { Text = 'Display Distance',    Default = ESP.Properties.ESP.DisplayDistance,    Callback = function(v) ESP.Properties.ESP.DisplayDistance    = v end })
    TextGroup:AddToggle('DisplayHealth',       { Text = 'Display Health',      Default = ESP.Properties.ESP.DisplayHealth,      Callback = function(v) ESP.Properties.ESP.DisplayHealth      = v end })
    TextGroup:AddToggle('DisplayName',         { Text = 'Display Name',        Default = ESP.Properties.ESP.DisplayName,        Callback = function(v) ESP.Properties.ESP.DisplayName        = v end })
    TextGroup:AddToggle('DisplayDisplayName',  { Text = 'Display DisplayName', Default = ESP.Properties.ESP.DisplayDisplayName, Callback = function(v) ESP.Properties.ESP.DisplayDisplayName = v end })
    TextGroup:AddToggle('DisplayTool',         { Text = 'Display Tool',        Default = ESP.Properties.ESP.DisplayTool,        Callback = function(v) ESP.Properties.ESP.DisplayTool        = v end })
    TextGroup:AddToggle('RelativeFontSize',    { Text = 'Relative Font Size',  Default = ESP.Properties.ESP.RelativeFontSize,   Callback = function(v) ESP.Properties.ESP.RelativeFontSize   = v end })

    -- Tracers
    local TracerGroup = Tabs.Visuals:AddLeftGroupbox('Tracers')
    TracerGroup:AddToggle('TracerEnabled',     { Text = 'Enabled',       Default = ESP.Properties.Tracer.Enabled,      Callback = function(v) ESP.Properties.Tracer.Enabled      = v end })
    TracerGroup:AddToggle('RainbowTracer',     { Text = 'Rainbow Color', Default = ESP.Properties.Tracer.RainbowColor, Callback = function(v) ESP.Properties.Tracer.RainbowColor = v end })
    TracerGroup:AddLabel('TracerColor'):AddColorPicker('TracerColor', { Text = 'Color', Default = ESP.Properties.Tracer.Color, Callback = function(v) ESP.Properties.Tracer.Color = v end })
    TracerGroup:AddSlider('TracerThickness',   { Text = 'Thickness',     Default = ESP.Properties.Tracer.Thickness,    Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Tracer.Thickness    = v end })
    TracerGroup:AddToggle('TracerOutline',     { Text = 'Outline',       Default = ESP.Properties.Tracer.Outline,      Callback = function(v) ESP.Properties.Tracer.Outline      = v end })

    -- Box
    local BoxGroup = Tabs.Visuals:AddLeftGroupbox('Box')
    BoxGroup:AddToggle('BoxEnabled',           { Text = 'Enabled',           Default = ESP.Properties.Box.Enabled,         Callback = function(v) ESP.Properties.Box.Enabled         = v end })
    BoxGroup:AddToggle('RainbowBox',           { Text = 'Rainbow Color',     Default = ESP.Properties.Box.RainbowColor,    Callback = function(v) ESP.Properties.Box.RainbowColor    = v end })
    BoxGroup:AddLabel('Box Color'):AddColorPicker('BoxColor', { Text = 'Box Color', Default = ESP.Properties.Box.Color, Callback = function(v) ESP.Properties.Box.Color = v end })
    BoxGroup:AddSlider('BoxThickness',         { Text = 'Thickness',         Default = ESP.Properties.Box.Thickness,       Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Box.Thickness       = v end })
    BoxGroup:AddToggle('BoxOutline',           { Text = 'Outline',           Default = ESP.Properties.Box.Outline,         Callback = function(v) ESP.Properties.Box.Outline         = v end })
    BoxGroup:AddToggle('FillSquare',           { Text = 'Fill Box',          Default = ESP.Properties.Box.FillSquare,      Callback = function(v) ESP.Properties.Box.FillSquare      = v end })
    BoxGroup:AddLabel('Fill Color'):AddColorPicker('FillColor', { Text = 'Fill Color', Default = ESP.Properties.Box.FillColor, Callback = function(v) ESP.Properties.Box.FillColor = v end })
    BoxGroup:AddSlider('FillTransparency',     { Text = 'Fill Transparency', Default = ESP.Properties.Box.FillTransparency * 100, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function(v) ESP.Properties.Box.FillTransparency = v / 100 end })
    BoxGroup:AddDropdown('BoxType', {
        Text = 'Box Type',
        Values = {'Square', 'Quad', 'Corner'},
        Default = ESP.Properties.Box.Type,
        Callback = function(v)
            local map = {Square = 1, Quad = 2, Corner = 3}
            ESP.Properties.Box.Type = map[v] or 1
        end
    })

    -- Health Bar
    local HealthGroup = Tabs.Visuals:AddRightGroupbox('Health Bar')
    HealthGroup:AddToggle('HealthBarEnabled',  { Text = 'Enabled',   Default = ESP.Properties.HealthBar.Enabled,   Callback = function(v) ESP.Properties.HealthBar.Enabled   = v end })
    HealthGroup:AddDropdown('HealthBarPosition', {
        Text = 'Position',
        Values = {'Top', 'Bottom', 'Left', 'Right'},
        Default = ESP.Properties.HealthBar.Position,
        Callback = function(v)
            local map = {Top = 1, Bottom = 2, Left = 3, Right = 4}
            ESP.Properties.HealthBar.Position = map[v] or 3
        end
    })
    HealthGroup:AddSlider('HealthBarThickness',{ Text = 'Thickness', Default = ESP.Properties.HealthBar.Thickness, Min = 1, Max = 6,  Rounding = 0, Callback = function(v) ESP.Properties.HealthBar.Thickness = v end })
    HealthGroup:AddSlider('HealthBarOffset',   { Text = 'Offset',    Default = ESP.Properties.HealthBar.Offset,    Min = 0, Max = 20, Rounding = 0, Callback = function(v) ESP.Properties.HealthBar.Offset    = v end })
    HealthGroup:AddToggle('HealthBarOutline',  { Text = 'Outline',   Default = ESP.Properties.HealthBar.Outline,   Callback = function(v) ESP.Properties.HealthBar.Outline   = v end })

    -- Head Dot
    local HeadDotGroup = Tabs.Visuals:AddLeftGroupbox('Head Dot')
    HeadDotGroup:AddToggle('HeadDotEnabled', { Text = 'Enabled',       Default = ESP.Properties.HeadDot.Enabled,        Callback = function(v) ESP.Properties.HeadDot.Enabled        = v end })
    HeadDotGroup:AddToggle('HeadDotRainbow', { Text = 'Rainbow Color', Default = ESP.Properties.HeadDot.RainbowColor,   Callback = function(v) ESP.Properties.HeadDot.RainbowColor   = v end })
    HeadDotGroup:AddLabel('Color'):AddColorPicker('HeadDotColor', { Default = ESP.Properties.HeadDot.Color, Callback = function(v) ESP.Properties.HeadDot.Color = v end })
    HeadDotGroup:AddSlider('HeadDotThickness', { Text = 'Thickness', Default = ESP.Properties.HeadDot.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.HeadDot.Thickness = v end })
    HeadDotGroup:AddToggle('HeadDotOutline', { Text = 'Outline',       Default = ESP.Properties.HeadDot.Outline,        Callback = function(v) ESP.Properties.HeadDot.Outline        = v end })
    HeadDotGroup:AddLabel('Outline Color'):AddColorPicker('HeadDotOutlineColor', { Default = ESP.Properties.HeadDot.OutlineColor, Callback = function(v) ESP.Properties.HeadDot.OutlineColor = v end })
    HeadDotGroup:AddToggle('HeadDotFilled', { Text = 'Filled',         Default = ESP.Properties.HeadDot.Filled,         Callback = function(v) ESP.Properties.HeadDot.Filled         = v end })

    -- Skeleton
    local SkeletonGroup = Tabs.Visuals:AddRightGroupbox('Skeleton')
    SkeletonGroup:AddToggle('SkeletonEnabled', { Text = 'Enabled',       Default = ESP.Properties.Skeleton.Enabled,      Callback = function(v) ESP.Properties.Skeleton.Enabled      = v end })
    SkeletonGroup:AddToggle('SkeletonRainbow', { Text = 'Rainbow Color', Default = ESP.Properties.Skeleton.RainbowColor, Callback = function(v) ESP.Properties.Skeleton.RainbowColor = v end })
    SkeletonGroup:AddLabel('Color'):AddColorPicker('SkeletonColor', { Default = ESP.Properties.Skeleton.Color, Callback = function(v) ESP.Properties.Skeleton.Color = v end })
    SkeletonGroup:AddSlider('SkeletonThickness', { Text = 'Thickness', Default = ESP.Properties.Skeleton.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Skeleton.Thickness = v end })

    -- ==================== DRONES ====================

    local DroneESPGroup = Tabs.Drones:AddLeftGroupbox('Drone ESP')
    DroneESPGroup:AddToggle('DroneEnabled',              { Text = 'Enabled',       Default = DS.Enabled,          Callback = function(v) DS.Enabled          = v end })
    DroneESPGroup:AddToggle('DroneShowName',             { Text = 'Show Name',     Default = DS.ShowName,         Callback = function(v) DS.ShowName         = v end })
    DroneESPGroup:AddLabel('Name Color'):AddColorPicker('DroneNameColor',             { Default = DS.NameColor,       Callback = function(v) DS.NameColor        = v end })
    DroneESPGroup:AddSlider('DroneNameSize',             { Text = 'Name Size',     Default = DS.NameSize,   Min = 8, Max = 24, Rounding = 0, Callback = function(v) DS.NameSize        = v end })
    DroneESPGroup:AddToggle('DroneNameOutline',          { Text = 'Name Outline',  Default = DS.NameOutline,      Callback = function(v) DS.NameOutline      = v end })
    DroneESPGroup:AddLabel('Name Outline Color'):AddColorPicker('DroneNameOutlineColor', { Default = DS.NameOutlineColor, Callback = function(v) DS.NameOutlineColor = v end })
    DroneESPGroup:AddToggle('DroneShowDistance',         { Text = 'Show Distance', Default = DS.ShowDistance,     Callback = function(v) DS.ShowDistance     = v end })
    DroneESPGroup:AddLabel('Distance Color'):AddColorPicker('DroneDistanceColor',     { Default = DS.DistanceColor,   Callback = function(v) DS.DistanceColor    = v end })

    local DroneBoxGroup = Tabs.Drones:AddRightGroupbox('Drone Box')
    DroneBoxGroup:AddToggle('DroneBoxEnabled',           { Text = 'Enabled',           Default = DS.ShowBox,          Callback = function(v) DS.ShowBox          = v end })
    DroneBoxGroup:AddLabel('Box Color'):AddColorPicker('DroneBoxColor',               { Default = DS.BoxColor,         Callback = function(v) DS.BoxColor         = v end })
    DroneBoxGroup:AddSlider('DroneBoxThickness',         { Text = 'Thickness',         Default = DS.BoxThickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) DS.BoxThickness    = v end })
    DroneBoxGroup:AddToggle('DroneBoxOutline',           { Text = 'Outline',           Default = DS.BoxOutline,       Callback = function(v) DS.BoxOutline       = v end })
    DroneBoxGroup:AddLabel('Outline Color'):AddColorPicker('DroneBoxOutlineColor',    { Default = DS.BoxOutlineColor,  Callback = function(v) DS.BoxOutlineColor  = v end })
    DroneBoxGroup:AddToggle('DroneBoxFill',              { Text = 'Fill Box',          Default = DS.BoxFill,          Callback = function(v) DS.BoxFill          = v end })
    DroneBoxGroup:AddLabel('Fill Color'):AddColorPicker('DroneBoxFillColor',          { Default = DS.BoxFillColor,     Callback = function(v) DS.BoxFillColor     = v end })
    DroneBoxGroup:AddSlider('DroneBoxFillTransp',        { Text = 'Fill Transparency', Default = DS.BoxFillTransparency * 100, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function(v) DS.BoxFillTransparency = v / 100 end })

    -- ==================== UI SETTINGS ====================

    -- FOV Circle (declared here so the OnUnload closure below can reference it)
    local FovCircle = Drawing.new('Circle')
    FovCircle.Visible = settings.SilentFovCircle
    FovCircle.Filled = false
    FovCircle.Thickness = 1
    FovCircle.NumSides = 64
    FovCircle.Color = settings.SilentFovCircleColor

    -- Drone drawings (declared here so OnUnload can reference them)
    local droneDrawings = {}

    local function removeDroneDrawings(drone)
        local d = droneDrawings[drone]
        if not d then return end
        for _, obj in pairs(d) do pcall(function() obj:Remove() end) end
        droneDrawings[drone] = nil
    end

    Library:OnUnload(function()
        settings.SilentEnabled = false
        settings.SilentFovCircle = false

        if ESP then
            ESP.Settings.Enabled = false
            ESP.Properties.ESP.Enabled = false
            ESP.Properties.Tracer.Enabled = false
            ESP.Properties.Box.Enabled = false
            ESP.Properties.HealthBar.Enabled = false
            ESP.Properties.HeadDot.Enabled = false
            ESP.Properties.Skeleton.Enabled = false
        end

        DS.Enabled = false

        FovCircle:Remove()
        for drone in pairs(droneDrawings) do removeDroneDrawings(drone) end

    end)

    local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')
    MenuGroup:AddButton('Unload', function() Library:Unload() end)
    MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

    Library.ToggleKeybind = Options.MenuKeybind

    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

    ThemeManager:SetFolder('vault_cc')
    SaveManager:SetFolder('vault_cc/op1')

    SaveManager:BuildConfigSection(Tabs['UI Settings'])
    ThemeManager:ApplyToTab(Tabs['UI Settings'])

    SaveManager:LoadAutoloadConfig()

    -- Watermark
    Library:SetWatermarkVisibility(true)

    local FrameTimer = tick()
    local FrameCounter = 0
    local FPS = 60

    -- Drone ESP
    local camera = game:GetService('Workspace').CurrentCamera
    local Players = game:GetService('Players')

    local function getDroneDrawings(drone)
        if droneDrawings[drone] then return droneDrawings[drone] end
        local d = {
            boxOutline = Drawing.new('Square'),
            box        = Drawing.new('Square'),
            fill       = Drawing.new('Square'),
            name       = Drawing.new('Text'),
            distance   = Drawing.new('Text'),
        }
        d.boxOutline.Visible = false; d.boxOutline.Filled = false
        d.box.Visible        = false; d.box.Filled        = false
        d.fill.Visible       = false; d.fill.Filled       = true
        d.name.Visible       = false; d.name.Center       = true; d.name.Outline = true
        d.distance.Visible   = false; d.distance.Center   = true; d.distance.Outline = true
        droneDrawings[drone] = d
        return d
    end

    local function getDroneScreenBounds(drone)
        local minX, maxX = math.huge, -math.huge
        local minY, maxY = math.huge, -math.huge
        local anyOnScreen = false
        for _, part in ipairs(drone:GetDescendants()) do
            if part:IsA('BasePart') then
                local sx, sy, sz = part.Size.X / 2, part.Size.Y / 2, part.Size.Z / 2
                local cf = part.CFrame
                for _, offset in ipairs({
                    Vector3.new(-sx, -sy, -sz), Vector3.new(-sx, -sy,  sz),
                    Vector3.new(-sx,  sy, -sz), Vector3.new(-sx,  sy,  sz),
                    Vector3.new( sx, -sy, -sz), Vector3.new( sx, -sy,  sz),
                    Vector3.new( sx,  sy, -sz), Vector3.new( sx,  sy,  sz),
                }) do
                    local sp, onScreen = camera:WorldToViewportPoint(cf:PointToWorldSpace(offset))
                    if onScreen then
                        anyOnScreen = true
                        if sp.X < minX then minX = sp.X end
                        if sp.X > maxX then maxX = sp.X end
                        if sp.Y < minY then minY = sp.Y end
                        if sp.Y > maxY then maxY = sp.Y end
                    end
                end
            end
        end
        return anyOnScreen, minX, minY, maxX, maxY
    end

    game:GetService('RunService').RenderStepped:Connect(function()
        FrameCounter += 1
        if (tick() - FrameTimer) >= 1 then
            FPS = FrameCounter
            FrameTimer = tick()
            FrameCounter = 0
        end
        Library:SetWatermark(('vault.cc | %s fps | %s ms'):format(
            math.floor(FPS),
            math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
        ))

        -- FOV Circle update
        local viewport = camera.ViewportSize
        FovCircle.Visible  = settings.SilentFovCircle
        FovCircle.Radius   = settings.SilentFov
        FovCircle.Color    = settings.SilentFovCircleColor
        FovCircle.Position = Vector2.new(viewport.X / 2, viewport.Y / 2)

        -- Drone ESP update
        if DS.Enabled then
            local activeDrones = {}
            local lp = Players.LocalPlayer
            local lpChar = lp and lp.Character
            local lpRoot = lpChar and lpChar:FindFirstChild('HumanoidRootPart')
            local lpPos = lpRoot and lpRoot.Position or Vector3.new()

            for _, v in ipairs(game:GetService('Workspace'):GetChildren()) do
                if v:IsA('Model') and v.Name == 'Drone' then
                    activeDrones[v] = true
                    local d = getDroneDrawings(v)
                    local anyOnScreen, minX, minY, maxX, maxY = getDroneScreenBounds(v)

                    if anyOnScreen then
                        local w = maxX - minX
                        local h = maxY - minY
                        local cx = minX + w / 2

                        if DS.ShowBox then
                            if DS.BoxOutline then
                                d.boxOutline.Visible   = true
                                d.boxOutline.Position  = Vector2.new(minX - 1, minY - 1)
                                d.boxOutline.Size      = Vector2.new(w + 2, h + 2)
                                d.boxOutline.Color     = DS.BoxOutlineColor
                                d.boxOutline.Thickness = DS.BoxThickness + 1
                            else
                                d.boxOutline.Visible = false
                            end
                            d.box.Visible   = true
                            d.box.Position  = Vector2.new(minX, minY)
                            d.box.Size      = Vector2.new(w, h)
                            d.box.Color     = DS.BoxColor
                            d.box.Thickness = DS.BoxThickness
                            if DS.BoxFill then
                                d.fill.Visible      = true
                                d.fill.Position     = Vector2.new(minX, minY)
                                d.fill.Size         = Vector2.new(w, h)
                                d.fill.Color        = DS.BoxFillColor
                                d.fill.Transparency = 1 - DS.BoxFillTransparency
                            else
                                d.fill.Visible = false
                            end
                        else
                            d.box.Visible = false; d.boxOutline.Visible = false; d.fill.Visible = false
                        end

                        local droneCF = v:GetBoundingBox()
                        local dist = math.floor((droneCF.Position - lpPos).Magnitude)

                        if DS.ShowName then
                            d.name.Visible      = true
                            d.name.Text         = 'Drone'
                            d.name.Size         = DS.NameSize
                            d.name.Color        = DS.NameColor
                            d.name.OutlineColor = DS.NameOutlineColor
                            d.name.Position     = Vector2.new(cx, minY - DS.NameSize - 2)
                        else
                            d.name.Visible = false
                        end

                        if DS.ShowDistance then
                            d.distance.Visible      = true
                            d.distance.Text         = string.format('[%d]', dist)
                            d.distance.Size         = DS.NameSize
                            d.distance.Color        = DS.DistanceColor
                            d.distance.OutlineColor = Color3.new(0, 0, 0)
                            d.distance.Position     = Vector2.new(cx, maxY + 2)
                        else
                            d.distance.Visible = false
                        end
                    else
                        d.box.Visible = false; d.boxOutline.Visible = false
                        d.fill.Visible = false; d.name.Visible = false; d.distance.Visible = false
                    end
                end
            end

            for drone in pairs(droneDrawings) do
                if not activeDrones[drone] or not drone:IsDescendantOf(game:GetService('Workspace')) then
                    removeDroneDrawings(drone)
                end
            end
        else
            for drone, d in pairs(droneDrawings) do
                for _, obj in pairs(d) do obj.Visible = false end
            end
        end
    end)
]])
