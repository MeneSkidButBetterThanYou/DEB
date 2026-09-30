local UserInputService = game:GetService("UserInputService")

local function isMobileDevice()
	local ok, platform = pcall(function()
		return UserInputService:GetPlatform()
	end)
	if ok and (platform == Enum.Platform.IOS or platform == Enum.Platform.Android) then
		return true
	end
	return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local env = (getgenv and getgenv()) or _G

if not isMobileDevice() then
	local LinoriaRepo = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"
	local Library = loadstring(game:HttpGet(LinoriaRepo .. "Library.lua"))()
	local ThemeManager = loadstring(game:HttpGet(LinoriaRepo .. "addons/ThemeManager.lua"))()
	local SaveManager = loadstring(game:HttpGet(LinoriaRepo .. "addons/SaveManager.lua"))()
	return Library, ThemeManager, SaveManager
end

local darius = loadstring(game:HttpGet("https://raw.githubusercontent.com/idonthaveoneatm/darius/refs/heads/main/bundled.luau"))()

local Toggles = {}
local Options = {}
env.Toggles = Toggles
env.Options = Options

local unloadCallbacks = {}
local settingsCreated = false
local dwindow

local Library = {
	KeybindFrame = { Visible = false },
	ToggleKeybind = nil,
	IsMobile = true,
}

local function noop() end

local function toColor3(v)
	if typeof(v) == "Color3" then
		return v
	end
	if type(v) == "table" then
		if typeof(v.color) == "Color3" then
			return v.color
		end
		if type(v.color) == "string" then
			local ok, c = pcall(Color3.fromHex, v.color)
			if ok then
				return c
			end
		end
	end
	if type(v) == "string" then
		local ok, c = pcall(Color3.fromHex, v)
		if ok then
			return c
		end
	end
	return Color3.new(1, 1, 1)
end

local function toBool(v)
	if type(v) == "boolean" then
		return v
	end
	if type(v) == "table" and v.boolean ~= nil then
		return v.boolean == true
	end
	return v == true
end

local function toMultiMap(v)
	local map = {}
	if type(v) ~= "table" then
		return map
	end
	if v[1] ~= nil then
		for _, name in v do
			map[tostring(name)] = true
		end
		return map
	end
	for name, on in v do
		if on == true then
			map[tostring(name)] = true
		end
	end
	return map
end

local function keyToEnum(name)
	if type(name) ~= "string" or name == "" or name == "None" or name == "MB1" or name == "MB2" then
		return nil
	end
	local ok, key = pcall(function()
		return Enum.KeyCode[name]
	end)
	if ok and typeof(key) == "EnumItem" then
		return key
	end
	return nil
end

local function keyFromFlag(v)
	if type(v) == "table" and type(v.keycode) == "string" then
		return v.keycode
	end
	if typeof(v) == "EnumItem" then
		return v.Name
	end
	if type(v) == "string" then
		return v
	end
	return "None"
end

local function dropdownDefault(info)
	if info.Multi then
		if type(info.Default) == "table" then
			if info.Default[1] ~= nil then
				return info.Default
			end
			local list = {}
			for name, on in info.Default do
				if on then
					table.insert(list, name)
				end
			end
			return list
		end
		if type(info.Default) == "number" and info.Values then
			local item = info.Values[info.Default]
			if item then
				return { item }
			end
		end
		return {}
	end
	if type(info.Default) == "number" and info.Values then
		return info.Values[info.Default]
	end
	return info.Default
end

local function attachChanged(object)
	function object:OnChanged(fn)
		self.Changed = fn
		fn(self.Value)
		return self
	end
end

local function fireChanged(object)
	if object.Changed then
		object.Changed(object.Value)
	end
end

local function wrapGroupbox(tab, title)
	tab:Divider()
	tab:Label(title)
	if title == "Menu" then
		tab:KeybindList()
	end

	local box = {}

	local function addColorPicker(idx, info)
		info = info or {}
		local obj = {
			Value = info.Default or Color3.new(1, 1, 1),
			Type = "ColorPicker",
		}
		attachChanged(obj)
		tab:ColorPicker({
			Name = info.Title or info.Text or idx,
			FLAG = idx,
			Color = obj.Value,
			HideTransparency = true,
			Callback = function(color)
				obj.Value = toColor3(color)
				fireChanged(obj)
			end,
		})
		function obj:SetValue(v)
			self.Value = toColor3(v)
		end
		function obj:SetValueRGB(v)
			self.Value = toColor3(v)
		end
		Options[idx] = obj
		return obj
	end

	local function addKeyPicker(idx, info, parentToggle)
		info = info or {}
		local mode = info.Mode or "Toggle"
		if info.SyncToggleState then
			mode = "Toggle"
		end
		local picker = {
			Value = info.Default or "None",
			Toggled = false,
			Mode = mode,
			Type = "KeyPicker",
			SyncToggleState = info.SyncToggleState == true,
		}
		attachChanged(picker)

		function picker:GetState()
			if self.Mode == "Always" then
				return true
			end
			local keyName = self.Value
			if not keyName or keyName == "None" or keyName == "" then
				return Library.IsMobile
			end
			if self.Mode == "Hold" then
				if Library.IsMobile and not UserInputService.KeyboardEnabled then
					return true
				end
				if keyName == "MB1" then
					return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
				end
				if keyName == "MB2" then
					return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
				end
				local key = keyToEnum(keyName)
				if not key then
					return Library.IsMobile
				end
				local ok, down = pcall(function()
					return UserInputService:IsKeyDown(key)
				end)
				return ok and down or false
			end
			return self.Toggled
		end

		function picker:SetValue(data)
			if type(data) == "table" then
				self.Value = data[1] or self.Value
				self.Mode = data[2] or self.Mode
			elseif type(data) == "string" then
				self.Value = data
			end
			fireChanged(self)
		end

		if not info.NoUI then
			tab:Keybind({
				Name = info.Text or idx,
				FLAG = idx,
				Bind = keyToEnum(picker.Value),
				Callback = function()
					if picker.Mode == "Toggle" then
						picker.Toggled = not picker.Toggled
						if picker.SyncToggleState and parentToggle then
							parentToggle:SetValue(not parentToggle.Value)
						end
					end
				end,
			})
			task.defer(function()
				local flag = darius.flags[idx]
				if flag and flag.OnChange then
					flag.OnChange:Connect(function(v)
						picker.Value = keyFromFlag(v)
						fireChanged(picker)
					end)
				end
			end)
		end

		Options[idx] = picker
		return picker
	end

	function box:AddToggle(idx, info)
		info = info or {}
		local obj = {
			Value = info.Default == true,
			Type = "Toggle",
		}
		attachChanged(obj)
		local dtoggle = tab:Toggle({
			Name = info.Text or idx,
			FLAG = idx,
			Default = obj.Value,
			Callback = function(v)
				obj.Value = toBool(v)
				fireChanged(obj)
			end,
		})
		function obj:SetValue(v)
			dtoggle:SetValue(v == true)
		end
		function obj:AddKeyPicker(kidx, kinfo)
			addKeyPicker(kidx, kinfo, obj)
			return obj
		end
		function obj:AddColorPicker(cidx, cinfo)
			addColorPicker(cidx, cinfo)
			return obj
		end
		Toggles[idx] = obj
		return obj
	end

	function box:AddSlider(idx, info)
		info = info or {}
		local obj = {
			Value = info.Default or info.Min or 0,
			Type = "Slider",
		}
		attachChanged(obj)
		local dslider = tab:Slider({
			Name = info.Text or idx,
			FLAG = idx,
			Min = info.Min or 0,
			Max = info.Max or 100,
			Default = obj.Value,
			DecimalPlace = info.Rounding,
			Callback = function(v)
				obj.Value = tonumber(v) or v
				fireChanged(obj)
			end,
		})
		function obj:SetValue(v)
			dslider:SetValue(tonumber(v) or v)
		end
		Options[idx] = obj
		return obj
	end

	function box:AddDropdown(idx, info)
		info = info or {}
		local multi = info.Multi == true
		local default = dropdownDefault(info)
		local obj = {
			Value = multi and toMultiMap(default) or default,
			Type = "Dropdown",
			Multi = multi,
		}
		attachChanged(obj)
		local ddrop = tab:Dropdown({
			Name = info.Text or idx,
			FLAG = idx,
			Items = info.Values or {},
			Default = default,
			Multiselect = multi,
			Callback = function(v)
				obj.Value = multi and toMultiMap(v) or v
				fireChanged(obj)
			end,
		})
		function obj:SetValue(v)
			if multi then
				local list
				if type(v) == "table" and v[1] == nil then
					list = {}
					for name, on in v do
						if on then
							table.insert(list, name)
						end
					end
				else
					list = v
				end
				if ddrop.SelectItems then
					ddrop:SelectItems(list)
				end
				obj.Value = toMultiMap(list)
			else
				if ddrop.SelectItem then
					ddrop:SelectItem(v)
				end
				obj.Value = v
			end
		end
		Options[idx] = obj
		return obj
	end

	function box:AddLabel(text)
		tab:Label(tostring(text))
		local label = {}
		function label:AddColorPicker(idx, info)
			addColorPicker(idx, info)
			return label
		end
		function label:AddKeyPicker(idx, info)
			addKeyPicker(idx, info)
			return label
		end
		function label:SetText(v)
			return label
		end
		return label
	end

	function box:AddColorPicker(idx, info)
		addColorPicker(idx, info)
		return box
	end

	function box:AddKeyPicker(idx, info)
		addKeyPicker(idx, info)
		return box
	end

	function box:AddDivider()
		tab:Divider()
		return box
	end

	function box:AddButton(info, func)
		if type(info) == "string" then
			info = { Text = info, Func = func }
		end
		info = info or {}
		tab:Button({
			Name = info.Text or "Button",
			Callback = info.Func or noop,
		})
		return box
	end

	function box:AddInput(idx, info)
		info = info or {}
		local obj = {
			Value = info.Default or "",
			Type = "Input",
		}
		attachChanged(obj)
		local dbox = tab:TextBox({
			Name = info.Text or idx,
			FLAG = idx,
			Default = obj.Value,
			PlaceHolderText = info.Placeholder or "",
			OnLeave = info.Finished == true,
			Callback = function(v)
				obj.Value = tostring(v or "")
				fireChanged(obj)
			end,
		})
		function obj:SetValue(v)
			if dbox.SetInput then
				dbox:SetInput(tostring(v or ""))
			end
			self.Value = tostring(v or "")
		end
		Options[idx] = obj
		return obj
	end

	return box
end

local function wrapTab(dtab)
	return {
		AddLeftGroupbox = function(_, title)
			return wrapGroupbox(dtab, title)
		end,
		AddRightGroupbox = function(_, title)
			return wrapGroupbox(dtab, title)
		end,
		AddGroupbox = function(_, title)
			return wrapGroupbox(dtab, title)
		end,
	}
end

local function bindDestruction()
	local signal = darius and darius.OnDestruction
	if typeof(signal) == "RBXScriptSignal" or (type(signal) == "table" and type(signal.Connect) == "function") then
		signal:Connect(function()
			for _, callback in unloadCallbacks do
				pcall(callback)
			end
			table.clear(unloadCallbacks)
		end)
	end
end

function Library:CreateWindow(info)
	info = info or {}
	dwindow = darius:Window({
		Title = info.Title or "vault.cc",
		Description = "vault.cc",
		HideBind = Enum.KeyCode.RightShift,
		UseConfig = true,
		Workspace = "VaultCC",
		IsMobile = true,
	})
	bindDestruction()
	return {
		AddTab = function(_, name)
			return wrapTab(dwindow:Tab({ Name = name }))
		end,
	}
end

function Library:OnUnload(callback)
	table.insert(unloadCallbacks, callback)
end

function Library:Unload()
	for _, callback in unloadCallbacks do
		pcall(callback)
	end
	table.clear(unloadCallbacks)
	if darius and not darius.Destroyed then
		darius:Destroy()
	end
end

function Library:Notify(text, duration)
	darius:Notify({
		Title = "vault.cc",
		Body = tostring(text),
		Duration = duration or 3,
	})
end

local ThemeManager = {}
function ThemeManager:SetLibrary() end
function ThemeManager:SetFolder() end
function ThemeManager:ApplyToTab() end

local SaveManager = {}
function SaveManager:SetLibrary() end
function SaveManager:IgnoreThemeSettings() end
function SaveManager:SetIgnoreIndexes() end
function SaveManager:SetFolder() end
function SaveManager:BuildConfigSection()
	if not settingsCreated then
		settingsCreated = true
		darius:CreateSettings()
	end
end
function SaveManager:LoadAutoloadConfig() end

return Library, ThemeManager, SaveManager
