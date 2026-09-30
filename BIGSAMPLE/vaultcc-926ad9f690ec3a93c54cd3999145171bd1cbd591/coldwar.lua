local a={cache={}}do do local function b()local function c(d)
	local e = {}

	function e.build(f)
		local g = f.Library
		local h = g:CreateWindow({
			Title = d.title,
			Center = true,
			AutoShow = true,
			TabPadding = 8,
			MenuFadeTime = 0.2,
		})
		f.Window = h
		f.Tabs = {}
		for i, j in d.tabs do
			f.Tabs[j] = h:AddTab(j)
		end
	end

	function e.finish(f)
		local g = f.Tabs
		local h = f.Library
		local i = f.ThemeManager
		local j = f.SaveManager
		local k = g.Settings or g["UI Settings"]
		if not k then
			return
		end
		local l = d.keybind or "menubind"
		local m = k:AddLeftGroupbox("Menu")
		m:AddButton({
			Text = "Unload",
			Func = function()
				h:Unload()
			end,
		})
		m:AddLabel("Menu keybind"):AddKeyPicker(l, {
			Default = d.keybindDefault or "RightShift",
			NoUI = true,
			Text = "Menu keybind",
		})
		h.ToggleKeybind = Options[l]
		if not d.hideKeybindList then
			m
				:AddToggle("ShowKeybindList", { Text = "Show Keybind List", Default = true })
				:OnChanged(function(n)
					if h and h.KeybindFrame then
						h.KeybindFrame.Visible = n
					end
				end)
		end
		i:SetLibrary(h)
		j:SetLibrary(h)
		if j.Parser and j.Parser.Slider then
			local n = j.Parser.Slider.Load
			j.Parser.Slider.Load = function(o, p)
				if Options[o] then
					Options[o]:SetValue(tonumber(p.value) or p.value)
				elseif n then
					n(o, p)
				end
			end
		end
		j:IgnoreThemeSettings()
		j:SetIgnoreIndexes(d.ignore or { l })
		i:SetFolder("VaultCC")
		j:SetFolder(d.folder)
		j:BuildConfigSection(k)
		i:ApplyToTab(k)
		if d.beforeLoad then
			d.beforeLoad(f, m)
		end
		j:LoadAutoloadConfig()
		if d.afterLoad then
			d.afterLoad(f)
		end
		if h.KeybindFrame and not d.hideKeybindList then
			h.KeybindFrame.Visible = Toggles.ShowKeybindList == nil or Toggles.ShowKeybindList.Value ~= false
		end
	end

	function e.step()
	end

	function e.unload()
	end

	return e
end

return {
	create = c,
}
end function a.a()local c=a.cache.a if not c then c={c=b()}a.cache.a=c end return c.c end end do local function b()
local c = workspace.Raycast

local d = {
	Vector3.new(1, 0, 0),
	Vector3.new(-1, 0, 0),
	Vector3.new(0, 0, 1),
	Vector3.new(0, 0, -1),
	Vector3.new(0, 1, 0),
	Vector3.new(0, -1, 0),
}
local e = {
	Vector3.new(0.5, 0, 0),
	Vector3.new(-0.5, 0, 0),
	Vector3.new(0, 0, 0.5),
	Vector3.new(0, 0, -0.5),
	Vector3.new(0, 0.5, 0),
	Vector3.new(0, -0.5, 0),
}
local f = {
	Vector3.new(0.5, 0.5, 0),
	Vector3.new(0.5, -0.5, 0),
	Vector3.new(-0.5, 0.5, 0),
	Vector3.new(-0.5, -0.5, 0),
	Vector3.new(0, 0.5, 0.5),
	Vector3.new(0, -0.5, 0.5),
	Vector3.new(0, 0.5, -0.5),
	Vector3.new(0, -0.5, -0.5),
}

local function g(...)
	local h = {}
	for i = 1, select("#", ...) do
		local j = select(i, ...)
		for k = 1, #j do
			h[#h + 1] = j[k]
		end
	end
	return h
end

local h = {
	Low = d,
	Medium = g(e, d),
	High = g(e, f, d),
}

local i = RaycastParams.new()
i.FilterType = Enum.RaycastFilterType.Exclude
i.IgnoreWater = true

local function j(k, l, m, n, o, p, q)
	LPH_ATTRIBUTES(VM(NONE))
	if typeof(k) ~= "Vector3" or typeof(l) ~= "Vector3" then
		return nil
	end
	if o(k, l) then
		return k
	end
	m = tonumber(m) or 0
	if m <= 0 then
		return nil
	end
	q = tonumber(q)
	local r = h[n] or h.High
	i.FilterDescendantsInstances = p or {}
	for s = 1, #r do
		local t = r[s] * m
		if q and math.abs(t.Y) > q then
			t = Vector3.new(t.X, math.sign(t.Y) * q, t.Z)
		end
		local u = k + t
		if not c(workspace, k, u - k, i) and o(u, l) then
			return u
		end
	end
	return nil
end

return {
	solve = j,
}
end function a.b()local c=a.cache.b if not c then c={c=b()}a.cache.b=c end return c.c end end do local function b()
local c = {}

function c.build(d)
	local e = d.flags
	local f = d.tv
	local g = d.ov
	local h = d.util
	local i = d.Players
	local j = d.RunService
	local k = d.UserInputService
	local l = d.LocalPlayer
	local m = d.RS
	local n = d.Library
	local o = d.Tabs
	local p = d.HttpService
	local q = d.manipulation
	local r = d.RecoilController
	local s = d.AimController
	local t = d.FiremodeController
	local u = d.Trajectory
	local v = d.InventoryController
	local w = d.CameraShaker
	local x = d.paidToggleKeys
	local y = d.paidOptionKeys
	local z = d.Client
	local A = d.Tools
	local B = d.WeaponControllers
	local C = d.cloneOriginal
local D
local E = false
local function F(G)
	LPH_ATTRIBUTES(VM(NONE))
	return type(G) == "table" and G.ExplosionSettings ~= nil
end
local function G(H, I)
	LPH_ATTRIBUTES(VM(NONE))
	return type(H) == "table" and (H.AmmoTypeName == "Rocket" or F(I))
end
local function H(I, J, K, L)
	LPH_ATTRIBUTES(VM(NONE))
	if not (e.rpgprediction and J and K and L) then
		return J.Position
	end
	local M = J.AssemblyLinearVelocity or Vector3.zero
	local N = L.MuzzleVelocity or K.MuzzleVelocity or 0
	if N <= 0 then
		return J.Position
	end

	local O = workspace.Gravity
	local P = J.Position
	local Q = (P - I).Magnitude / N
	for R = 1, 3 do
		P = J.Position + M * Q
		local S = (P - I).Magnitude
		Q = S / N
	end

	local R = math.clamp(g("rpgpredictionstrength", 1), 0, 2)
	return P + Vector3.new(0, O * Q * Q * 0.5 * R, 0)
end

local function I(J)
	LPH_ATTRIBUTES(VM(NONE))
	if not J then
		return false
	end
	local K = J:FindFirstChild("CharacterValues")
	local L = K and K:FindFirstChild("Unconscious")
	return L ~= nil and L.Value == true
end

local J = 0

local function K(L)
	LPH_ATTRIBUTES(VM(NONE))
	if not L or not L.Parent then
		return false
	end
	local M = L.Parent:FindFirstChildOfClass("Humanoid")
	return M ~= nil and M.Health > 0
end

local L = nil
local M = 0
local N = RaycastParams.new()
N.FilterType = Enum.RaycastFilterType.Exclude
local O = {}
local P = nil
local Q = 0

local function R()
	LPH_ATTRIBUTES(VM(NONE))
	local S = os.clock()
	if S - M < 0.05 then
		return L
	end
	M = S

	local T = workspace.CurrentCamera
	if not T then
		L = nil
		return nil
	end

	local U = l
	local V = U.Character
	local W = U.Team
	local X = T.CFrame.Position
	local Y = k:GetMouseLocation()
	local Z, _
	local aa = e.silenttarget
	local ab = e.silentteamcheck
	local ac = e.silentdistancecheck
	local ad = e.silentmaxdistance
	local ae = e.fovenabled
	local af = e.fovsize
	local ag = e.silentvisiblecheck

	table.clear(O)
	if V then
		O[1] = V
	end
	local ah = workspace:FindFirstChild("Ignore")
	if ah then
		O[#O + 1] = ah
	end
	if ag then
		N.FilterDescendantsInstances = O
	end

	for ai, aj in i:GetPlayers() do
		local ak = aj.Character
		if aj ~= U and ak and not I(ak) then
			if not (ab and W and aj.Team == W) then
				local al = ak:FindFirstChild(aa)
				local am = ak:FindFirstChildOfClass("Humanoid")
				if al and am and am.Health > 0 then
					local an = al.Position
					local ao = (an - X).Magnitude
					if (not ac) or ao <= ad then
						local ap, aq = T:WorldToViewportPoint(an)
						if aq and ap.Z > 0 then
							local ar = (Vector2.new(ap.X, ap.Y) - Y).Magnitude
							if ((not ae) or ar <= af) and (not _ or ar < _) then
								local as = true
								if ag then
									local at = workspace:Raycast(X, an - X, N)
									if at and not at.Instance:IsDescendantOf(ak) then
										as = false
									end
								end
								if as then
									Z, _ = al, ar
								end
							end
						end
					end
				end
			end
		end
	end
	L = Z
	return Z
end

h.getTarget = function()
	LPH_ATTRIBUTES(VM(NONE))
	if K(L) then
		return L
	end
	M = 0
	return R()
end

local function aa()
	LPH_ATTRIBUTES(VM(NONE))
	local ab = os.clock()
	if ab == Q then
		return P
	end
	Q = ab
	local ac = v.getEquipped()
	if typeof(ac) == "Instance" and ac:IsA("Tool") and ac:GetAttribute("ToolType") == "Weapon" then
		P = ac
		return ac
	end
	local ad = l.Character
	local ae = ad and ad:FindFirstChildOfClass("Tool")
	if ae and ae:GetAttribute("ToolType") == "Weapon" then
		P = ae
		return ae
	end
	P = nil
	return nil
end

h.getMuzzle = function()
	LPH_ATTRIBUTES(VM(NONE))
	local ab = aa()
	if not ab then
		return nil
	end
	local ac = l.Character
	local ad = ac and ac:FindFirstChild(ab.Name .. "Model")
	local ae = (ad and ad:FindFirstChild("Handle")) or ab:FindFirstChild("Handle")
	return ae and ae:FindFirstChild("Muzzle1")
end

local function ab()
	LPH_ATTRIBUTES(VM(NONE))
	if not (e.silentenabled or e.turretsilentenabled or e.aimbotenabled or e.snaplines) then
		h.target = nil
		return
	end
	h.target = R()
end

local function ac()
	LPH_ATTRIBUTES(VM(NONE))
	if not e.aimbotenabled then
		return
	end
	local ad = false
	if Options and Options.aimbotkey then
		ad = Options.aimbotkey:GetState()
	end
	if not ad then
		return
	end

	local ae = h.getTarget()
	if not (ae and ae.Parent) then
		return
	end

	local af = workspace.CurrentCamera
	if not af then
		return
	end

	local ag = ae.Position
	local ah = math.max(1, g("aimbotsmoothness", 1))

	if g("aimbotmethod", "Camera") == "Mouse" and mousemoverel then
		local ai, aj = af:WorldToViewportPoint(ag)
		if aj and ai.Z > 0 then
			local ak = k:GetMouseLocation()
			local al = (ai.X - ak.X) / ah
			local am = (ai.Y - ak.Y) / ah
			mousemoverel(al, am)
		end
	else

		local ai = af.CFrame
		local aj = CFrame.new(ai.Position, ag)
		if ah == 1 then
			af.CFrame = aj
		else
			af.CFrame = ai:Lerp(aj, 1 / ah)
		end
	end
end

local ad = (function()
local ad = require(A.Weapon.Muzzle.Discharge)
local ae = require(B.WeaponViewmodel)
local af = require(m.Shared.Ballistics.ProjectileCaster)
local ag = require(m.Shared.WeaponConfigManager)
local ah = require(z.Character.stance.MovementTuning)
local ai = require(z.BodyReplication)
local aj = require(z.BodyReplication.BodyRotation)
local ak = require(m.Shared.Vehicle.TurretFireController)
local al = require(z.Tools.Bandage)
local am
pcall(function()
	am = require(l.PlayerScripts.BallisticsClient.FlybySuppression)
end)

local an = debug.getupvalues
local ao = debug.getconstants
local ap = debug.getinfo
local aq = debug.getprotos or getprotos

local function ar(as)
	return type(as) == "function" and (not islclosure or islclosure(as))
end

local function as(at)
	local S, T = pcall(an, at)
	return S and T or {}
end

local function at(S, T)
	local U, V = pcall(ao, S)
	if not U then
		return false
	end
	for W, X in V do
		if X == T then
			return true
		end
	end
	return false
end

local function S(T, U)
	for V, W in as(T) do
		if ar(W) and U(W, V) then
			return W, V
		end
	end
end

local function T(U, V)
	if type(U) ~= "table" then
		return nil
	end
	if V == nil then
		return nil
	end
	for W, X in U do
		if ar(X) and V(X, W) then
			return X, W
		end
	end
end

local function U(V, W, X)
	if type(V) == "table" and ar(V[W]) then
		return V[W], W
	end
	return T(V, X)
end

local function V(W, X, Y, Z)
	if not ar(W) or Y < 0 then
		return nil
	end
	Z = Z or {}
	if Z[W] then
		return nil
	end
	Z[W] = true
	if X(W) then
		return W
	end
	for _, au in as(W) do
		if ar(au) then
			local av = V(au, X, Y - 1, Z)
			if av then
				return av
			end
		elseif type(au) == "table" then
			for av, aw in au do
				if ar(aw) then
					local ax = V(aw, X, Y - 1, Z)
					if ax then
						return ax
					end
				end
			end
		end
	end
	if aq then
		local au, av = pcall(aq, W)
		if au then
			for aw, ax in av do
				if ar(ax) then
					local _ = V(ax, X, Y - 1, Z)
					if _ then
						return _
					end
				end
			end
		end
	end
	return nil
end

local au = {}

local av = U(r, "recoilScale", function(av)
	local aw = as(av)
	local ax, W, X = false, false, false
	for Y, Z in aw do
		if type(Z) == "table" then
			if type(Z.getAlpha) == "function" then
				ax = true
			end
			if type(Z.getCharacterValues) == "function" then
				W = true
			end
			if Z.Crouch ~= nil and Z.Prone ~= nil then
				X = true
			end
		end
	end
	return ax and W and X
end)
au.getRecoilMult = { func = av, upv = av and as(av) or {} }

local aw = U(ad, "fire", function(aw)
	return at(aw, "IsPreparation") and at(aw, "config")
end)
au.fire = { func = aw, upv = aw and as(aw) or {} }
au.spreadVector = {
	func = aw and S(aw, function(ax)
		local W = ap(ax)
		return W.nups == 0 and W.numparams == 2
	end),
}

local ax
if am and ar(am.new) then
	for W, X in as(am.new) do
		if type(X) == "table" and ar(X.fire) then
			ax = X.fire
			break
		end
	end
end
au.flybyFire = { func = ax }

local W = U(s, "flip", function(W)
	return ap(W).numparams == 0 and ap(W).nups >= 1
end)
local X = U(s, "canAim", function(X)
	return at(X, "Stance") and at(X, "Walk")
end)
au.aimtoggle = { func = W, upv = W and as(W) or {} }
au.isaimingavailable = { func = X, upv = X and as(X) or {} }
au.aimupdate = {
	func = S(s.attach, function(Y)
		local Z = as(Y)
		return typeof(Z[1]) == "Instance" and type(Z[2]) == "number" and type(Z[3]) == "number"
	end),
}
au.aimupdate.upv = au.aimupdate.func and as(au.aimupdate.func) or {}

local Y = U(t, "pull", function(Y)
	return at(Y, "isFiring") or ap(Y).numparams == 1
end)
local Z
if ar(t.new) then
	for _, ay in as(t.new) do
		if type(ay) == "table" and ay.Automatic then
			Z = ay
			break
		end
	end
end
au.firemodestart = { func = Y, upv = Z }

local ay
if ar(v.equip) then
	ay = S(v.equip, function(_)
		return at(_, "EquipTool")
	end)
end
au.awaitLength = {
	func = ay and S(ay, function(_)
		return at(_, "Length") and at(_, "isConscious")
	end),
}

au.movementupdate = {
	func = U(ah, "apply", function(_)
		return at(_, "inertialSpeed") and at(_, "sprintHeld")
	end),
}

local _ = S(al.new, function(_)
	return at(_, "HealLimb")
end)
au.healLimb = { func = _, upv = _ and as(_) or {} }

au.muzzlesConfig = {
	func = U(ag, "MuzzleConfigsOf", function(az)
		return ap(az).numparams == 2
	end),
}

local az = S(af.Fire, function(az)
	return at(az, "Alive") and at(az, "OnFinish")
end)
au.onArcEnd = {
	func = az and S(az, function(aA)
		return at(aA, "Segments")
	end),
}

local aA = S(ak.Attach, function(aA)
	return at(aA, "muzzleConfig") and at(aA, "WorldCFrame")
end)
au.fireOnce = { func = aA, upv = aA and as(aA) or {} }

au.sendOwnInfo = {
	func = S(ai.flushNow, function(aB)
		return at(aB, "NewCameraAngle")
	end),
}

au.bodyRotationUpdate = {
	func = U(aj, "UpdateCharacter", function(aB)
		return at(aB, "HumanoidRootPart") and at(aB, "LastUpdate")
	end),
}
au.bodyWallPush = {
	func = au.bodyRotationUpdate.func and S(au.bodyRotationUpdate.func, function(aB)
		return ap(aB).numparams >= 4
	end),
}

au.viewmodelWallPush = {
	func = V(ae.attach, function(aB)
		return at(aB, "viewmodelAttachment") and at(aB, "raise")
	end, 4),
}

local function aB(aC)
	if not ar(aC) then
		return false
	end
	local aD = ap(aC)
	if not aD or (aD.numparams or 0) < 5 then
		return false
	end
	if at(aC, "proj") and at(aC, "seed") and not at(aC, "GetServerTimeNow") then
		return false
	end
	local aE = 0
	if at(aC, "GetServerTimeNow") then
		aE += 1
	end
	if at(aC, "encodeFire") then
		aE += 1
	end
	if at(aC, "Direction") and at(aC, "Seed") then
		aE += 1
	end
	if at(aC, "Unit") then
		aE += 1
	end
	return aE >= 2
end

local function aC(aD)
	if type(aD) ~= "table" then
		return nil
	end
	if aB(aD.fireVolley) then
		return aD.fireVolley
	end
	local aE = aD.fire
	if ar(aE) then
		local aF, aG = pcall(ao, aE)
		if aF then
			for aH, aI in aG do
				if type(aI) == "string" then
					local aJ = aD[aI]
					if ar(aJ) and aJ ~= aE and aB(aJ) then
						return aJ
					end
				end
			end
		end
		for aH, aI in as(aE) do
			if aB(aI) then
				return aI
			end
		end
	end
	for aF, aG in aD do
		if aF ~= "fire" and aB(aG) then
			return aG
		end
	end
	return nil
end

local aD
for aE, aF in au.fire.upv do
	if aC(aF) then
		aD = aF
		break
	end
end
if not aD then
	pcall(function()
		local aE = l:FindFirstChild("PlayerScripts")
		local aF = aE and aE:FindFirstChild("BallisticsClient")
		local aG = aF and aF:FindFirstChild("ClientFire")
		if aG then
			aD = require(aG)
		end
	end)
end
au.volleyFrom = aC
au.fireVolleyFn = aC(aD)

return au
end)()

local function ae(af, ag, ah, ai)
	local aj = af.Transparency
	local ak = 1 - aj
	local al = ah / ai
	local am = ak / al

	task.wait(ag - ah)
	for an = 1, al do
		task.wait(ai)
		af.Transparency += am
	end
	af.Transparency = 1
	af:Destroy()
end

local function af(ag, ah, ai, aj, ak)
	local al = (ah - ag).Magnitude
	if al <= 0.001 then
		return
	end
	local am = (ag + ah) / 2

	local an = g("localtracersmaterial", "Plastic")
	if aj then
		an = g("teamtracersmaterial", "Plastic")
	elseif ak then
		an = g("enemytracersmaterial", "Plastic")
	end

	local ao = g("localtracerscolor", Color3.fromRGB(59, 255, 50))
	if aj then
		ao = g("teamtracerscolor", Color3.fromRGB(59, 144, 204))
	elseif ak then
		ao = g("enemytracerscolor", Color3.fromRGB(255, 60, 60))
	end

	local ap = g("localtracerstransparency", 0.5)
	if aj then
		ap = g("teamtracerstransparency", 0.5)
	elseif ak then
		ap = g("enemytracerstransparency", 0.5)
	end

	local aq = g("bullettracersize", 0.1)

	local ar = Instance.new("Part")
	ar.Name = "tracer"
	ar.Anchored = true
	ar.CanCollide = false
	ar.CanQuery = false
	ar.CanTouch = false
	ar.Material = Enum.Material[an]
	ar.Color = ao
	ar.Size = Vector3.new(aq, aq, al)
	ar.CFrame = CFrame.new(am, ah)
	ar.Parent = workspace:FindFirstChild("Ignore") or workspace
	ar.Transparency = ap

	task.spawn(ae, ar, 3, 1, 0.05)

	return ar
end

local ag = setmetatable({}, { __mode = "k" })
local ah = { origin = nil, at = 0 }
local ai
local aj
local ak

local function al(am, an)
	if an and am and (an - am).Magnitude > 0.05 then
		ah.origin = an
		ah.at = os.clock()
	end
end
if ad.onArcEnd.func then
	local am = C(ad.onArcEnd.func)
	ad.onArcEnd.func = hookfunction(ad.onArcEnd.func, function(...)
		LPH_ATTRIBUTES(VM(NONE))
		local an = { ... }
		local ao = an[1]
		local ap = table.pack(am(...))
		if not ao or ao.Alive or ag[ao] then
			return table.unpack(ap, 1, ap.n)
		end

		ag[ao] = true
		local aq = ao.Owner
		local ar = aq == l
		local as = aq ~= nil and not ar and aq.Team ~= nil and aq.Team == l.Team
		local at = aq ~= nil and not ar and not as
		local au = f("tracersenabled", false)
			and (
				(ar and f("localtracers", false))
				or (at and f("enemytracers", false))
				or (as and f("teamtracers", false))
			)
		if au then
			local av = ar and ah.origin and os.clock() - ah.at < 0.25 and ah.origin
			local aw = ao.Segments or {}
			for ax, ay in ipairs(aw) do
				if typeof(ay.From) == "Vector3" and typeof(ay.To) == "Vector3" then
					local az = ay.From
					if ax == 1 and av and (az - av).Magnitude > 0.15 then
						az = av
					end
					task.spawn(af, az, ay.To, ar, as, at)
				end
			end
		end
		return table.unpack(ap, 1, ap.n)
	end)
end

if ad.flybyFire.func then
	local am = C(ad.flybyFire.func)
	hookfunction(ad.flybyFire.func, function(...)
		LPH_ATTRIBUTES(VM(NONE))
		if e.antisuppression then
			return
		end
		return am(...)
	end)
end

local am = w.Shake
local an = C(am)
w.Shake = function(...)
	LPH_ATTRIBUTES(VM(NONE))
	if e.antisuppression then
		return
	end
	return an(...)
end

if ad.spreadVector.func then
	hookfunction(ad.spreadVector.func, function(ao, ap)
		LPH_ATTRIBUTES(VM(NONE))
		local aq = g("spreadmult", 0)
		if aq == 0 then return ao.Unit end
		local ar = math.atan((ap or 1) / 3570) * aq
		local as = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1)
		return (ao.Unit + as * ar).Unit
	end)
end

local function ao()
	LPH_ATTRIBUTES(VM(NONE))
	local ap, aq, ar = unpack(ad.getRecoilMult.upv)
	local as = aq:getCharacterValues()
	if as then
		as = as:FindFirstChild("Stance")
	end
	return (ap[as and as.Value or "Walk"] or 1) * (1 - (ar.getAlpha() or 0) * 0.25) * g("recoilmult", 0)
end

if ad.getRecoilMult.func then
	for ap, aq in r do
		if aq == ad.getRecoilMult.func then
			r[ap] = ao
			break
		end
	end
	pcall(hookfunction, ad.getRecoilMult.func, ao)
end

if ad.sendOwnInfo.func then
	local ap = C(ad.sendOwnInfo.func)
	hookfunction(ad.sendOwnInfo.func, function(...)
		LPH_ATTRIBUTES(VM(NONE))
		if e.antiaimpitch then
			local aq = debug.getupvalue(ap, 1)
			if aq then
				aq.NewCameraAngle = math.rad(g("antiaimpitchangle", 90))
			end
		end
		return ap(...)
	end)
end

if ad.bodyWallPush.func then
	local ap = C(ad.bodyWallPush.func)
	hookfunction(ad.bodyWallPush.func, function(aq, ...)
		LPH_ATTRIBUTES(VM(NONE))
		if e.gunup and aq and aq.IsOwnCharacter then
			aq.WallPush = aq.WallPush or { push = 0, raise = 0 }
			aq.WallPush.push = 0
			aq.WallPush.raise = math.rad(89)
			return 0, math.rad(89)
		end
		return ap(aq, ...)
	end)
end

if ad.viewmodelWallPush.func then
	local ap = C(ad.viewmodelWallPush.func)
	hookfunction(ad.viewmodelWallPush.func, function(...)
		LPH_ATTRIBUTES(VM(NONE))
		if e.gunup then
			debug.setupvalue(ap, 2, 0)
			debug.setupvalue(ap, 3, math.rad(89))
			return
		end
		return ap(...)
	end)
end

if ad.bodyRotationUpdate.func then
	local ap = C(ad.bodyRotationUpdate.func)
	hookfunction(ad.bodyRotationUpdate.func, function(aq, ar)
		LPH_ATTRIBUTES(VM(NONE))
		if not e.antiaimpitch and not e.gunup then
			return ap(aq, ar)
		end
		if aq ~= l.Character or not ar then
			return ap(aq, ar)
		end

		if e.antiaimpitch then
			local as = math.rad(g("antiaimpitchangle", 90))
			ar.NewCameraAngle = as
			ar.CurrentCameraAngle = as
		end

		local as = ar.StanceValue
		local at
		if e.gunup and as then
			at = as.Value
			as.Value = "Walk"
		end
		local au = table.pack(ap(aq, ar))
		if at ~= nil and as.Parent then
			as.Value = at
		end
		return table.unpack(au, 1, au.n)
	end)
end

if ad.fire.func then
	local ap = C(ad.fire.func)
	hookfunction(ad.fire.func, function(aq, ar)
		LPH_ATTRIBUTES(VM(NONE))
		local as, at, au, av, aw, ax, ay, az, aA, aB, aC, aD =
			unpack(ad.fire.upv)
		local aE = ad.volleyFrom(aD) or ad.fireVolleyFn

		if as.IsPreparation() then
			return
		end
		local aF = aq.config
		local aG = at:getCharacter()
		local aH = aG and aG:FindFirstChild("Right Arm")
		local aI = (au.CFrame.Position - au.Focus.Position).Magnitude <= 0.75 and aq.viewmodelAttachment
			or aq.attachment
		local aJ = aI.WorldPosition
		local S = aI.WorldCFrame.LookVector
		if aH then
			local T = (aJ - aH.CFrame.Position).Magnitude
			av.FilterDescendantsInstances = { aw.Character, workspace.Ignore }
			local U = workspace:Raycast(aJ - S * T, S * T, av)
			if U then
				aJ = U.Position - S * math.min(0.01, U.Distance)
			end
		end

		local T = ax.zeroAngle() or math.rad(aF.DefaultAngle or 0)
		local U = (aI.WorldCFrame * CFrame.Angles(T, 0, 0)).LookVector
		local V = aF.BulletSettings[ar]
		local W = aJ
		local X = aj
		if not X and e.silentenabled then
			local Y = h.getTarget()
			if Y then
				X = G(aF, V)
						and H(aJ, Y, aF, V)
					or Y.Position
				if e.manipulation and ai then
					local Z = {}
					if aw.Character then
						Z[1] = aw.Character
					end
					local _ = workspace:FindFirstChild("Ignore")
					if _ then
						Z[#Z + 1] = _
					end
					local aK = ai(aJ, X, Y.Parent, V and V.Penetration, Z)
					if aK then
						aJ = aK
					end
				end
			end
		elseif ak then
			aJ = ak
		end
		if X then
			local aK = X - aJ
			if aK.Magnitude > 0.001 then
				U = aK.Unit
			end
		end
		al(W, aJ)

		aq.animator:play("GunShoot")
		J = J + 1
		local aK = V.ShotAmount or 1
		local Y = table.create(aK)
		for Z = 1, aK do
			Y[Z] = ay(U, V.Spread or 1)
		end

		local Z = aq.tool.Sounds:FindFirstChild("Muzzle" .. aq.index)
		Z = Z and Z:FindFirstChild("Fire")
		if Z then
			az.Play(Z, aI.WorldPosition, aF.SoundRange or 3000)
		end
		aA.MuzzleFlash(aI, aq.tool.Name)
		E = F(V)
		if aB == nil then
			local _ = aC.Client:FindFirstChild("BodyReplication")
			if _ then
				aB = require(_)
				debug.setupvalue(ap, 10, aB)
				ad.fire.upv[10] = aB
			end
		end
		if aB then
			aB.flushNow()
		end
		if aE then
			aE(aq.tool, aq.index, ar, aJ, Y)
		end
		E = false
		if not aq:isHandAction() then
			aA.Casing(aI, aq.tool.Name)
		end
	end)
end

if ad.fireOnce.func then
	local ap = C(ad.fireOnce.func)
	hookfunction(ad.fireOnce.func, function()
		LPH_ATTRIBUTES(VM(NONE))
		local aq, ar, as, at, au, av =
			unpack(debug.getupvalues(ap))
		if not (aq and aq.muzzle and aq.muzzle.Parent) then
			return
		end
		local aw = ad.volleyFrom(au) or ad.fireVolleyFn

		local ax = aq.muzzleConfig
		local ay = aq.muzzle
		local az = ay.WorldCFrame
		local aA = az.Position
		local aB = (az * CFrame.Angles(math.rad(ax.DefaultAngle or 0), 0, 0)).LookVector
		local aC = ax.BulletSettings and ax.BulletSettings[1] or {}
		if e.turretsilentenabled then
			local aD = h.getTarget()
			if aD then
				local aE = G(ax, aC)
						and H(aA, aD, ax, aC)
					or aD.Position
				local aF = aE - aA
				if aF.Magnitude > 0.001 then
					aB = aF.Unit
				end
			end
		end

		local aD = aC.ShotAmount or 1
		local aE = table.create(aD)
		for aF = 1, aD do
			aE[aF] = ar(aB, aC.Spread or 1)
		end
		if aq.loopSound then
			as.Play(aq.loopSound, aA, ax.SoundRange or 3000)
			if aq.burstTracker then
				aq.burstTracker.onShot(aA)
			end
		elseif aq.fireSound then
			as.Play(aq.fireSound, aA, ax.SoundRange or 3000)
		end
		at.MuzzleFlash(ay, aq.weaponName)
		at.Casing(ay, aq.weaponName)
		E = F(aC)
		if aw then
			aw(aq.weaponName, 1, 1, aA, aE)
		end
		E = false
		av.ApplyRecoil()
	end)
end
if ad.aimtoggle.func then
local ap = C(ad.aimtoggle.func)
ad.aimtoggle.func = hookfunction(ad.aimtoggle.func, function(...)
	LPH_ATTRIBUTES(VM(NONE))
	local aq = ap
	if not e.aimanywhere then
		return aq(...)
	end
	local ar = debug.getupvalue(aq, 1)
	debug.setupvalue(aq, 1, (ar == 0) and 1 or 0)
end)
end

if ad.aimupdate.func then
local ap = C(ad.aimupdate.func)
ad.aimupdate.func = hookfunction(ad.aimupdate.func, function(aq)
	LPH_ATTRIBUTES(VM(NONE))
	local ar = ap
	local as = e.instantads
	local at = e.aimanywhere
	local au = e.noadsslowdown
	if not (as or at or au) then
		return ar(aq)
	end

	local av = debug.getupvalue(ar, 3) == 1
	if as then
		debug.setupvalue(ar, 2, av and 1 or 0)
	end

	ar(aq)

	if at and av then
		debug.setupvalue(ar, 3, 1)
		if as then
			debug.setupvalue(ar, 2, 1)
		end
	end

	if au then
		local aw = debug.getupvalue(ar, 1)
		if typeof(aw) == "Instance" then
			aw.Value = 1
		end
	end
end)
end

if ad.isaimingavailable.func then
local ap = C(ad.isaimingavailable.func)
ad.isaimingavailable.func = hookfunction(ad.isaimingavailable.func, function(...)
	LPH_ATTRIBUTES(VM(NONE))
	if e.aimanywhere then
		return true
	end
	return ap(...)
end)
end

if ad.firemodestart.func then
local ap = C(ad.firemodestart.func)
ad.firemodestart.func = hookfunction(ad.firemodestart.func, function(aq)
	LPH_ATTRIBUTES(VM(NONE))
	local ar = ad.firemodestart.upv

	if not aq.isFiring then
		aq.isFiring = true
		local as = aq:_current()
		if as then
			local at = as.strategy
			if e.forceauto then
				local au = ar and ar.Automatic
				if au and au.strategy then
					at = au.strategy
				end
			end
			if at then
				task.spawn(at.fire, aq)
			end
		end
	end
end)
end

if ad.awaitLength.func then
	local ap = C(ad.awaitLength.func)
	ad.awaitLength.func = hookfunction(ad.awaitLength.func, function(...)
		LPH_ATTRIBUTES(VM(NONE))
		if e.instantequip then
			return false
		end
		return ap(...)
	end)
end

local function ap(aq)
	local function ar(as)
		local at = aq:FindFirstChild(as)
		local au = at and at:FindFirstChild("Health")
		if au then
			local av = au:GetAttribute("MaxHealth")
			if av and av > 0 then
				return au.Value / av
			end
		end
		return nil
	end
	local as, at = ar("Left Leg"), ar("Right Leg")
	if as and at then
		return 0.5 + (as + at) / 4
	end
	return nil
end

if ad.movementupdate.func then
	local aq = C(ad.movementupdate.func)
	ad.movementupdate.func = hookfunction(ad.movementupdate.func, function(ar)
		LPH_ATTRIBUTES(VM(NONE))
		if not e.omnisprint and not e.nohurtslowdown then
			return aq(ar)
		end

		if e.omnisprint and ar then
			ar.firstPerson = false
		end

		aq(ar)

		if e.nohurtslowdown and ar and ar.humanoid and ar.character then
			local as = ap(ar.character)
			if as and as > 0 and as < 1 then
				ar.humanoid.WalkSpeed = ar.humanoid.WalkSpeed / as
				if type(ar.inertialSpeed) == "number" then
					ar.inertialSpeed = ar.inertialSpeed / as
				end
			end
		end
	end)
end

local aq = u.new
u.new = function(ar)
	LPH_ATTRIBUTES(VM(NONE))
	if not E then
		if e.nodrop then
			ar.Gravity = 0
		end
		if e.instantbullet then
			ar.MuzzleSpeed = 1e6
			ar.K = 0
		end
	end
	return aq(ar)
end

local ar = m:WaitForChild("Remotes")

local as = 0
local function at()
	LPH_ATTRIBUTES(VM(NONE))
	local function au(av)
		if not av then
			return nil
		end
		for aw, ax in av:GetChildren() do
			if ax:IsA("Tool") and ax:GetAttribute("ToolType") == "Bandage" then
				local ay = ax:FindFirstChild("Bandages")
				if not ay then
					return ax
				end
				for az, aA in ay:GetChildren() do
					if aA:IsA("IntValue") and aA.Value > 0 then
						return ax
					end
				end
			end
		end
		return nil
	end
	return au(l.Character) or au(l:FindFirstChild("Backpack"))
end
local function au(av)
	LPH_ATTRIBUTES(VM(NONE))
	if not e.autoheal then
		return
	end
	as = as + av
	if not e.instantheal and as < 0.75 then
		return
	end
	as = 0

	local aw = ar:FindFirstChild("Bandage")
	local ax = at()
	local ay = l.Character
	if not (aw and ax and ay) then
		return
	end
	local az = g("autohealmindamage", 30)
	for aA, aB in ay:GetChildren() do
		if aB:IsA("BasePart") and aB.Name ~= "HumanoidRootPart" then
			local aC = aB:FindFirstChild("Health")
			if aC then
				local aD = aC:GetAttribute("MaxHealth")
				if aD and aD > 0 and (aD - aC.Value) / aD * 100 >= az then
					aw:FireServer(ax, "HealLimb", aB)
				end
			end
		end
	end
end

local av = 0
local function aw(ax)
	LPH_ATTRIBUTES(VM(NONE))
	if not e.fastrevive then
		return
	end
	av = av + ax
	if av < 1 then
		return
	end
	av = 0

	local ay = workspace:FindFirstChild("Characters")
	if not ay then
		return
	end
	local az = ay:QueryDescendants("#RevivePrompt")
	for aA, aB in az do
		if aB:IsA("ProximityPrompt") then
			aB.HoldDuration = 3
		end
	end
end

local ax = {
	FinalDrive = 7.5,
	ShiftRPM = 7000,
	IdleRPM = 1000,
	IdleTorque = 140,
	PeakTorque = 520,
	PeakTorqueRPM = 5000,
	RedlineRPM = 9000,
	RedlineTorque = 300,
	HorsepowerLimit = 1000,
	TorqueScale = 6,
	TopSpeed = 220,
	PeakGrip = 2.5,
	SlideGrip = 2.25,
	PeakSlip = 0.5,
	Grip = 40,
	BrakeMultiplier = 10,
	HandBrakeMultiplier = 5.5,
	RollingFriction = 0.05,
	TurningZForceMultiplier = 1,
	TurnRadius = 20,
	SteerSpeed = 2.5,
	HighSpeedSteerReduction = 0.65,
	ForceHeight = 0.75,
	Mass = 750,
	WheelMass = 8,
	SuspensionHeight = 2,
	RideHeight = 1.5,
	WheelOffset = 0.5,
	ReboundDampingModifier = 1.3,
	CompressionDampingModifier = 1,
	DamperActiveness = 0.7,
}
local ay = { AutoShift = true, Ackermann = true }
local az = {
	ChassisType = "Wheeled",
	DriveType = "AWD",
	Differential = "Locked",
}
local aA = {}
local aB = {}
local aC = {}
local aD = "{}"
local aE = {}
local aF = false
local aG = ""
local function aH(aI)
	local aJ = aI.Name or aI.DisplayName or aI.VehicleName or aI.Id or "Unknown Car"
	local aK = aI.Team or aI.Faction or aI.Side or "PACT"
	aK = tostring(aK):upper():find("NATO") and "NATO" or "PACT"
	return tostring(aJ) .. " (" .. aK .. ")"
end
local function aI(aJ)
	local aK
	local S = aJ.Parent
	while S and S ~= m do
		local T = S.Name:upper()
		if T == "PACT" or T == "NATO" then
			aK = T
			break
		end
		S = S.Parent
	end
	if not aK then
		return nil
	end
	return aJ.Name .. " (" .. aK .. ")"
end
local function aJ(aK)
	local S = {}
	if type(aK) == "table" then
		for T, U in pairs(aK) do
			if type(U) ~= "table" then
				S[T] = U
			end
		end
		if type(aK.Ratios) == "table" then
			S.Ratios = {}
			for T, U in pairs(aK.Ratios) do
				S.Ratios[T] = U
			end
		end
		if type(aK.Wheels) == "table" then
			S.Wheels = {}
			for T, U in ipairs(aK.Wheels) do
				S.Wheels[T] = {}
				for V, W in pairs(U) do
					S.Wheels[T][V] = W
				end
			end
		end
	end
	for T, U in pairs(ax) do
		S[T] = aK and aK[T] ~= nil and aK[T] or U
	end
	for T, U in pairs(ay) do
		S[T] = aK and aK[T] ~= nil and aK[T] or U
	end
	for T, U in pairs(az) do
		S[T] = aK and aK[T] ~= nil and aK[T] or U
	end
	return S
end
local function aK()
	aD = p:JSONEncode(aA)
	if Options.carsprofiles and Options.carsprofiles.Value ~= aD and not aF then
		aF = true
		Options.carsprofiles:SetValue(aD)
		aF = false
	end
end
local function S(T)
	if aF then
		return
	end
	if type(T) ~= "string" or T == "" then
		return
	end
	local U, V = pcall(p.JSONDecode, p, T)
	if U and type(V) == "table" then
		for W, X in pairs(V) do
			if type(X) == "table" then
				aA[W] = aJ(X)
			end
		end
	end
end
local function T(U, V)
	if not U or type(V) ~= "table" or type(V.Transmission) ~= "table" then
		return
	end
	if aE[V] then
		return
	end
	aE[V] = true
	aC[U] = V
	aB[#aB + 1] = U
	if aA[U] == nil then
		aA[U] = aJ(V.Transmission)
	end
end
local function U()
	local V = m:FindFirstChild("Shared") and m.Shared:FindFirstChild("VehicleConfigManager")
	if V then
		for W, X in ipairs(V:GetDescendants()) do
			if X:IsA("ModuleScript") then
				local Y = aI(X)
				if Y then
					local Z, _ = pcall(require, X)
					if Z and type(_) == "table" and rawget(_, "Transmission") then
						for aL, aM in pairs(_.Transmission) do
							if type(aM) == "number" and ax[aL] == nil then
								ax[aL] = aM
							elseif type(aM) == "boolean" and ay[aL] == nil then
								ay[aL] = aM
							elseif type(aM) == "string" and az[aL] == nil then
								az[aL] = aM
							end
						end
						T(Y, _)
					end
				end
			end
		end
	end

	if not V then
		for aL, aM in pairs(getgc(true)) do
			if
				typeof(aM) == "table"
				and rawget(aM, "Transmission")
				and rawget(aM, "Damage")
				and rawget(aM, "ShopInfo")
			then
				local W = aM.ShopInfo
				if type(W) == "table" then
					local X = aH(W)
					for Y, Z in pairs(aM.Transmission) do
						if type(Z) == "number" and ax[Y] == nil then
							ax[Y] = Z
						elseif type(Z) == "boolean" and ay[Y] == nil then
							ay[Y] = Z
						elseif type(Z) == "string" and az[Y] == nil then
							az[Y] = Z
						end
					end
					T(X, aM)
				end
			end
		end
	end
	table.sort(aB)
	local aL = table.concat(aB, "\0")
	if Options.carprofile and aL ~= aG then
		aG = aL
		Options.carprofile:SetValues(aB)
	end
end
U()
local aL = { selected = aB[1] }
local function aM()
	if not e.carmods then
		return
	end
	for V, W in pairs(aC) do
		local X = aA[V]
		if X then
			local Y = W.Transmission
			for Z in pairs(ax) do
				if Y[Z] ~= X[Z] then
					Y[Z] = X[Z]
				end
			end
			for Z in pairs(ay) do
				if Y[Z] ~= X[Z] then
					Y[Z] = X[Z]
				end
			end
			for Z in pairs(az) do
				if Y[Z] ~= X[Z] then
					Y[Z] = X[Z]
				end
			end
			if X.Ratios then
				Y.Ratios = Y.Ratios or {}
				for Z, _ in pairs(X.Ratios) do
					if Y.Ratios[Z] ~= _ then
						Y.Ratios[Z] = _
					end
				end
			end
			if X.Wheels then
				Y.Wheels = Y.Wheels or {}
				for Z, _ in ipairs(X.Wheels) do
					Y.Wheels[Z] = Y.Wheels[Z] or {}
					for aN, aO in pairs(_) do
						if Y.Wheels[Z][aN] ~= aO then
							Y.Wheels[Z][aN] = aO
						end
					end
				end
			end
		end
	end
end

local function aN()
	if not aL.selected then
		return nil
	end
	aA[aL.selected] = aA[aL.selected] or aJ()
	return aA[aL.selected]
end
local function aO(V, W)
	local X = aN()
	if not X then
		return
	end
	X[V] = W
	aK()
	aM()
end
local V = 0
local function W(X)
	LPH_ATTRIBUTES(VM(NONE))
	if not e.carmods then
		return
	end
	V = V + X
	if V < 5 then
		return
	end
	V = 0
	U()
	aM()
end

local function X(Y)
	for Z, _ in pairs(Y or {}) do
		if ad.volleyFrom(_) then
			return _
		end
	end
	return Y and Y[12]
end
local Y = X(ad.fire.upv)
local Z = ar:WaitForChild("Weapon")

D = ad.muzzlesConfig.func and debug.getupvalue(ad.muzzlesConfig.func, 1)
local _ = select(
	2,
	pcall(function()
		return require(m:WaitForChild("Shared"):WaitForChild("Ballistics"):WaitForChild("ProjectileMaterials"))
	end)
)
if type(_) ~= "table" then
	_ = nil
end

local function aP(aQ, aR)
	LPH_ATTRIBUTES(VM(NONE))
	local aS = D and D[aQ.Name]
	return aS and aS[aR]
end

local aQ = RaycastParams.new()
aQ.FilterType = Enum.RaycastFilterType.Include
local aR = RaycastParams.new()
aR.FilterType = Enum.RaycastFilterType.Exclude

local function aS(aT, aU, aV)
	LPH_ATTRIBUTES(VM(NONE))
	local aW = aQ
	aW.FilterType = Enum.RaycastFilterType.Include
	aW.FilterDescendantsInstances = { aV }
	local aX = aT + aU * 60
	local aY = workspace:Raycast(aX, -aU * 60, aW)
	return aY and aY.Position or nil
end

local function aT(aU, aV, aW, aX, aY)
	LPH_ATTRIBUTES(VM(NONE))
	if not aX or aX <= 0 then
		return false
	end
	local aZ = aX
	local a_ = aU
	for a0 = 1, 8 do
		local a1 = aV - a_
		local a2 = a1.Magnitude
		if a2 < 0.1 then
			return true
		end
		local a3 = a1.Unit
		aR.FilterDescendantsInstances = aY
		local a4 = workspace:Raycast(a_, a3 * a2, aR)
		if not a4 then
			return true
		end
		if a4.Instance:IsDescendantOf(aW) then
			return true
		end
		local a5 = aS(a4.Position, a3, a4.Instance)
		if not a5 then
			return false
		end
		local a6 = (a5 - a4.Position).Magnitude
		local a7 = _ and _.getPenetration(a4.Material) or 1
		aZ = aZ - a6 * a7
		if aZ <= 0 then
			return false
		end
		a_ = a5 + a3 * 0.05
	end
	return false
end

local function aU(aV, aW, aX, aY, aZ)
	LPH_ATTRIBUTES(VM(NONE))
	local a_ = aW - aV
	aR.FilterDescendantsInstances = aZ
	local a0 = workspace:Raycast(aV, a_, aR)
	if not a0 then
		return true
	end
	if a0.Instance:IsDescendantOf(aX) then
		return true
	end
	if not e.ragebotwallbang then
		return false
	end
	return aT(aV, aW, aX, aY, aZ)
end

ai = function(aV, aW, aX, aY, aZ)
	LPH_ATTRIBUTES(VM(NONE))
	if not e.manipulation or not aV or not aW then
		return aV
	end
	local a_ = q.solve(aV, aW, e.manipulationdistance or 1, e.manipulationdepth or "Low", function(a_, a0)
		if not aX then
			return true
		end
		return aU(a_, a0, aX, aY, aZ)
	end, aZ, 1)
	if not a_ then
		return nil
	end
	return a_
end

local function aV(aW, aX)
	local aY = buffer.create(3)
	buffer.writeu8(aY, 0, 1)
	buffer.writeu8(aY, 1, aW)
	buffer.writeu8(aY, 2, aX)
	Z:FireServer(aY)
end

local aW = { "Head", "Torso", "HumanoidRootPart", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }
local function aX(aY, aZ, a_, a0)
	LPH_ATTRIBUTES(VM(NONE))
	for a1, a2 in aW do
		local a3 = aY:FindFirstChild(a2)
		if a3 and a3:IsA("BasePart") then
			if aU(aZ, a3.Position, aY, a_, a0) then
				return a3, aZ
			end
		end
	end
	return nil
end

local aY = 0
local aZ = 0
local a_ = nil
local a0 = setmetatable({}, { __mode = "k" })
local a1 = require(z.BodyReplication)

local function a2(a3)
	LPH_ATTRIBUTES(VM(NONE))
	local a4 = a0[a3]
	if a4 and rawget(a4, "tool") == a3 and rawget(a4, "currentMuzzle") then
		return a4
	end
	if not getgc then
		return nil
	end
	for a5, a6 in getgc(true) do
		if type(a6) == "table" and rawget(a6, "tool") == a3 and rawget(a6, "currentMuzzle") then
			a0[a3] = a6
			return a6
		end
	end
	return nil
end

local function a3(a4)
	LPH_ATTRIBUTES(VM(NONE))
	local a5 = workspace.CurrentCamera
	if not (a5 and a4) then
		return nil
	end
	local a6 = (a5.CFrame.Position - a5.Focus.Position).Magnitude <= 0.75
	local a7 = a6 and a4.viewmodelAttachment or a4.attachment
	if not a7 then
		return nil
	end
	local a8 = a7.WorldPosition
	local a9 = a7.WorldCFrame.LookVector
	local ba = l.Character
	local bb = ba and ba:FindFirstChild("Right Arm")
	if bb then
		local bc = (a8 - bb.CFrame.Position).Magnitude
		aR.FilterType = Enum.RaycastFilterType.Exclude
		aR.FilterDescendantsInstances = { ba, workspace:FindFirstChild("Ignore") }
		local bd = workspace:Raycast(a8 - a9 * bc, a9 * bc, aR)
		if bd then
			a8 = bd.Position - a9 * math.min(0.01, bd.Distance)
		end
	end
	return a8
end

local function a4()
	LPH_ATTRIBUTES(VM(NONE))
	local a5 = l.Character
	local a6 = ad.volleyFrom(Y) or ad.fireVolleyFn
	if not (a5 and a6) then
		return
	end
	local a7 = aa()
	if not a7 then
		return
	end
	local a8 = a2(a7)
	local a9 = a8 and a8.currentMuzzle
	if not (a9 and a9.tool) then
		return
	end
	local ba = a3(a9)
	if not ba then
		return
	end
	local bb = a9.magazine and a9.magazine:getBulletIndex()
	if not bb then
		return
	end

	local bc = a9.index
	local bd = aP(a7, bc)
	local be = (bd and bd.Firerate) or 600
	local bf = (bd and bd.Ammo) or 30
	local bg = (bd and bd.ReloadTime) or 3
	local bh = bd and bd.BulletSettings and bd.BulletSettings[bb]
	local bi = (bh and bh.Penetration) or 0

	if a7 ~= a_ then
		a_ = a7
		J = 0
		aZ = 0
	end

	if os.clock() < aZ then
		return
	end

	if bf > 0 and J >= bf then
		if e.ragebotautoreload then
			aV(bc, bb)
			aZ = os.clock() + bg
			J = 0
		end
		return
	end

	if os.clock() < aY then
		return
	end

	local bj = { a5 }
	local bk = workspace:FindFirstChild("Ignore")
	if bk then
		bj[#bj + 1] = bk
	end

	local bl = l
	local bm = {}
	for bn, bo in ipairs(i:GetPlayers()) do
		if bo ~= bl and bo.Character and not I(bo.Character) then
			if not (bl.Team and bo.Team == bl.Team) then
				local bp = bo.Character:FindFirstChildOfClass("Humanoid")
				local bq = bo.Character:FindFirstChild("HumanoidRootPart") or bo.Character:FindFirstChild("Head")
				if bp and bp.Health > 0 and bq then
					local br = (bq.Position - ba).Magnitude
					bm[#bm + 1] = { Character = bo.Character, Distance = br }
				end
			end
		end
	end

	table.sort(bm, function(bn, bo)
		return bn.Distance < bo.Distance
	end)
	local bn
	for bo, bp in ipairs(bm) do
		bn = aX(bp.Character, ba, bi, bj)
		if bn then
			break
		end
	end
	local bo = ba
	local bp = bn
	if e.manipulation and ai then
		bp = nil
		bo = nil
		local bq = {}
		if bn then
			bq[1] = bn.Parent
		end
		for br, bs in bm do
			if bs.Character ~= (bn and bn.Parent) then
				bq[#bq + 1] = bs.Character
			end
		end
		for br, bs in bq do
			local bt = bs:FindFirstChild("Head") or bs:FindFirstChild("HumanoidRootPart")
			if bt then
				local bu = ai(ba, bt.Position, bs, bi, bj)
				if bu then
					local bv = aX(bs, bu, bi, bj)
					if bv then
						bp = bv
						bo = bu
						break
					end
				end
			end
		end
	end

	if bp and bo and ad.fire.func then
		aY = os.clock() + 60 / be
		local bq = bp.Position
		if G(bd, bh) then
			bq = H(bo, bp, bd, bh)
		end
		ak = bo
		aj = bq
		local br = pcall(ad.fire.func, a9, bb)
		ak = nil
		aj = nil
		if not br then
			aY = 0
		end
	end
end

local a5 = 0
local function a6()
	LPH_ATTRIBUTES(VM(NONE))
	if not e.ragebottpaura then
		return
	end
	if os.clock() - a5 < 2.0 then
		return
	end

	local a7 = l
	local a8 = a7.Character
	if not a8 then
		return
	end
	local a9 = a8:FindFirstChild("HumanoidRootPart")
	local ba = a8:FindFirstChild("Head") or a9
	if not (a9 and ba) then
		return
	end
	local bb = ba.Position

	local bc = { a8 }
	local bd = workspace:FindFirstChild("Ignore")
	if bd then
		bc[#bc + 1] = bd
	end

	local be = false
	local bf, bg

	for bh, bi in ipairs(i:GetPlayers()) do
		if bi ~= a7 and bi.Character and not I(bi.Character) then
			if not (a7.Team and bi.Team == a7.Team) then
				local bj = bi.Character:FindFirstChildOfClass("Humanoid")
				local bk = bi.Character:FindFirstChild("HumanoidRootPart")
				local bl = bi.Character:FindFirstChild("Head") or bk
				if bj and bj.Health > 0 and bk then
					local bm = bl.Position - bb
					local bn = RaycastParams.new()
					bn.FilterType = Enum.RaycastFilterType.Exclude
					bn.FilterDescendantsInstances = bc
					local bo = workspace:Raycast(bb, bm, bn)

					if not bo or bo.Instance:IsDescendantOf(bi.Character) then
						be = true
						break
					end

					local bp = (bk.Position - bb).Magnitude
					if not bg or bp < bg then
						bf = bi.Character
						bg = bp
					end
				end
			end
		end
	end

	if not be and bf then
		local bh = bf:FindFirstChild("HumanoidRootPart")
		if bh and a9 then
			a5 = os.clock()
			a9.CFrame = bh.CFrame * CFrame.new(0, 0, 3)
		end
	end
end

local a7 = 0
local function a8(a9)
	LPH_ATTRIBUTES(VM(NONE))
	if not (e.ragebot or e.ragebottpaura) then
		return
	end
	a7 = a7 + a9
	if a7 < 0.03 then
		return
	end
	a7 = 0
	if e.ragebot then
		pcall(a4)
	end
	if e.ragebottpaura then
		pcall(a6)
	end
end

local a9
local ba, bb = pcall(function()
	LPH_ATTRIBUTES(VM(NONE))
	return loadstring(
		game:HttpGet("https://raw.githubusercontent.com/ttokennxyz/vaultcc/refs/heads/main/esplibcoldwar.lua")
	)()
end)

if ba and type(bb) == "table" then

	pcall(function()
		bb:Load({ Enabled = false, Players = false, LocalPlayer = false, LimitFPS = 45, DynamicBoxes = false })
		a9 = bb:GetConfig()
	end)
else
	print(bb)
	bb = nil
	n:Notify("Failed to load ESP library.")
end
	d.ESP = bb

local function bc()
	local bd = a9
	if not bd then
		return
	end

	bd.Enabled = Toggles.ESPMaster.Value
	bd.LocalPlayer = false
	bd.MaxDistance = Options.ESPMaxDistance.Value
	bd.LimitFPS = 45
	bd.DynamicBoxes = false
	bd.DynamicBoxesCheap = true
	bd.DynamicBoxesIncludeAll = false

	bd.Boxes = Toggles.ESPBoxes.Value
	bd.BoxType = Options.ESPBoxType.Value
	bd.BoxColor = Options.ESPBoxColor.Value
	bd.BoxThickness = Options.ESPBoxThickness.Value
	bd.Outlines.Style = Toggles.ESPBoxOutline.Value and "Full" or "None"
	bd.Outlines.Color = Options.ESPBoxOutlineColor.Value

	bd.BoxFill.Enabled = Toggles.ESPBoxFill.Value
	bd.BoxFill.Color = Options.ESPBoxFillColor.Value
	bd.BoxFill.Transparency = Options.ESPBoxFillTransparency.Value

	bd.Names = Toggles.ESPNames.Value
	bd.TextColor = Options.ESPNameColor.Value
	bd.TextSize = Options.ESPTextSize.Value
	bd.TextOutline = Toggles.ESPTextOutline.Value
	bd.Distance.Enabled = Toggles.ESPDistance.Value
	bd.Distance.Color = Options.ESPDistanceColor.Value
	bd.Weapon.Enabled = Toggles.ESPWeapon.Value
	bd.Weapon.UseToolFallback = true
	bd.TeamIndicator.Enabled = Toggles.ESPTeam.Value
	bd.FriendlyIndicator.Enabled = Toggles.ESPFriendly.Value
	bd.FriendlyIndicator.CheckTeam = Toggles.ESPFriendly.Value
	bd.FriendlyIndicator.CheckFriends = Toggles.ESPFriendly.Value

	bd.HealthBar.Enabled = Toggles.ESPHealth.Value
	bd.HealthBar.ShowText = true
	bd.HealthBar.Source = (Options.ESPHealthMode.Value == "Target part") and "Part" or "Average"
	bd.HealthBar.Part = g("silenttarget", "Head")

	bd.Chams.Enabled = Toggles.ESPChams.Value
	bd.Chams.Type = Options.ESPChamsType.Value

	local be = Options.ESPChamsFill.Value
	local bf = Options.ESPChamsFillT.Value
	local bg = Options.ESPChamsOutline.Value
	local bh = Options.ESPChamsOutlineT.Value
	local bi = Toggles.ESPChamsVisible.Value

	bd.Chams.Highlight.FillColor = be
	bd.Chams.Highlight.FillTransparency = bf
	bd.Chams.Highlight.OutlineColor = bg
	bd.Chams.Highlight.OutlineTransparency = bh
	bd.Chams.Highlight.VisibleCheck = bi

	bd.Chams.MeshChams.FillColor = be
	bd.Chams.MeshChams.FillTransparency = bf
	bd.Chams.MeshChams.OutlineColor = bg
	bd.Chams.MeshChams.OutlineTransparency = bh
	bd.Chams.MeshChams.VisibleCheck = bi

	bd.Chams.Adornment.Color = be
	bd.Chams.Adornment.Transparency = bf
	bd.Chams.Adornment.VisibleCheck = bi

	bd.Flags.Enabled = Toggles.ESPFlags.Value
	bd.Flags.Options.Idle = Toggles.ESPFlagIdle.Value
	bd.Flags.Options.Moving = Toggles.ESPFlagMoving.Value
	bd.Flags.Options.Jumping = Toggles.ESPFlagJumping.Value
	bd.Flags.Options.Swimming = Toggles.ESPFlagSwimming.Value
	bd.OffScreenArrows.Enabled = Toggles.ESPArrows.Value
	bd.OffScreenArrows.Color = Options.ESPArrowColor.Value
	bd.OffScreenArrows.Size = Options.ESPArrowSize.Value
end

local function bd()
	local be = a9
	if not be then
		return
	end

	local bf = l

	if Toggles.ESPFilterTeam.Value then
		be.Players = false
		local bg = {}
		for bh, bi in ipairs(i:GetPlayers()) do
			if bi ~= bf and bi.Character then

				if not (bf.Team and bi.Team == bf.Team) then
					bg[#bg + 1] = { DisplayName = bi.Name, Path = bi.Character:GetFullName() }
				end
			end
		end
		be.Directories = bg
	else

		be.Players = true
		be.Directories = {}
	end
end

local be = o.Combat:AddRightGroupbox("Gun Mods")
be:AddSlider("recoilmult", { Text = "Recoil Multiplier", Default = 0, Min = 0, Max = 1, Rounding = 2 })
be:AddSlider("spreadmult", { Text = "Spread Multiplier", Default = 0, Min = 0, Max = 1, Rounding = 2 })
be:AddToggle("forceauto", { Text = "Force Auto", Default = true })
be:AddToggle("instantequip", { Text = "Instant Equip", Default = false })
be:AddToggle("nodrop", { Text = "No Bullet Drop", Default = false })
be:AddToggle("instantbullet", { Text = "Instant Bullet", Default = false })
be:AddToggle(
	"rpgprediction",
	{
		Text = "RPG Prediction",
		Default = true,
	}
)
be:AddSlider(
	"rpgpredictionstrength",
	{ Text = "RPG Prediction Strength", Default = 1, Min = 0, Max = 2, Rounding = 2 }
)

local bf = o.Combat:AddLeftGroupbox("Aiming")
bf
	:AddToggle("aimbotenabled", { Text = "Aimbot Enabled", Default = false })
	:AddKeyPicker("aimbotkey", { Default = "R", SyncToggleState = false, Mode = "Hold", Text = "Aimbot Key" })
bf:AddDropdown("aimbotmethod", { Text = "Aim Method", Values = { "Camera", "Mouse" }, Default = 1, Multi = false })
bf:AddDropdown(
	"aimbottarget",
	{
		Text = "Target part",
		Values = { "Head", "Torso", "HumanoidRootPart", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
		Default = 1,
		Multi = false,
	}
)
bf:AddSlider(
	"aimbotsmoothness",
	{
		Text = "Smoothness",
		Default = 1,
		Min = 1,
		Max = 20,
		Rounding = 1,
	}
)
bf:AddToggle("aimanywhere", { Text = "Aim Anywhere", Default = true })
bf:AddToggle("instantads", { Text = "Instant ADS", Default = true })
bf:AddToggle("noadsslowdown", { Text = "No ADS Slowdown", Default = true })

local bg = o.Combat:AddLeftGroupbox("Silent Aim")
bg
	:AddToggle(
		"silentenabled",
		{ Text = "Normal Silent Aim", Default = true }
	)
	:AddKeyPicker(
		"silentbind",
		{ Default = "None", SyncToggleState = true, Mode = "Toggle", Text = "Normal Silent Aim" }
	)
bg
	:AddToggle(
		"turretsilentenabled",
		{ Text = "Turret Silent Aim", Default = true }
	)
	:AddKeyPicker(
		"turretsilentbind",
		{ Default = "None", SyncToggleState = true, Mode = "Toggle", Text = "Turret Silent Aim" }
	)
bg:AddDropdown(
	"silenttarget",
	{
		Text = "Target part",
		Values = { "Head", "Torso", "HumanoidRootPart", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
		Default = 1,
		Multi = false,
	}
)
Options["silenttarget"]:OnChanged(function(bh)
	if a9 then
		a9.HealthBar.Part = bh
	end
end)
bg:AddToggle(
	"silentvisiblecheck",
	{ Text = "Visible Check", Default = false }
)
bg:AddToggle(
	"silentdistancecheck",
	{ Text = "Distance Check", Default = false }
)
bg:AddSlider(
	"silentmaxdistance",
	{ Text = "Max Distance", Default = 500, Min = 10, Max = 2000, Rounding = 0, Suffix = " studs" }
)
bg:AddToggle("fovenabled", { Text = "FOV Circle", Default = false })
bg:AddSlider("fovsize", { Text = "FOV Circle Size", Default = 100, Min = 5, Max = 500, Rounding = 0 })
bg:AddToggle("silentteamcheck", { Text = "Exclude Teammates", Default = true })
bg:AddToggle("fovdraw", { Text = "Draw FOV Circle", Default = false })
bg
	:AddLabel("FOV color")
	:AddColorPicker("fovcolor", { Default = Color3.fromRGB(255, 255, 255), Title = "FOV color" })
bg:AddSlider("fovthickness", { Text = "FOV Thickness", Default = 1, Min = 1, Max = 10, Rounding = 0 })
bg:AddToggle("snaplines", { Text = "Snapline", Default = false })
bg
	:AddLabel("Snapline color")
	:AddColorPicker("snaptargetcolor", { Default = Color3.fromRGB(255, 0, 0), Title = "Snapline color" })

if la_is_premium then

    local bh = o.Combat:AddRightGroupbox("Ragebot")
    bh
    	:AddToggle("ragebot", { Text = "Enabled", Default = false })
    	:AddKeyPicker("ragebotbind", { Default = "None", SyncToggleState = true, Mode = "Toggle", Text = "Ragebot" })
    bh:AddToggle(
    	"ragebotwallbang",
    	{ Text = "Wallbang", Default = false }
    )
    bh:AddToggle(
    	"ragebotautoreload",
    	{ Text = "Auto Reload", Default = false }
    )
    bh:AddToggle(
    	"ragebottpaura",
    	{ Text = "TP Aura", Default = false }
    )
    bh:AddToggle("manipulation", { Text = "Manipulation", Default = false })
    bh:AddSlider("manipulationdistance", {
    	Text = "Manipulation Distance",
    	Default = 1,
    	Min = 0,
    	Max = 4,
    	Rounding = 2,
    	Suffix = " studs",
    })
    bh:AddDropdown("manipulationdepth", {
    	Text = "Scan Depth",
    	Values = { "Low", "Medium", "High" },
    	Default = 1,
    	Multi = false,
    })
end

local bh = Instance.new("ScreenGui")
bh.Name = "cwfov"
bh.IgnoreGuiInset = true
bh.ResetOnSpawn = false
bh.DisplayOrder = 100
bh.Parent = (gethui and gethui()) or game:GetService("CoreGui")

local bi = Instance.new("Frame")
bi.AnchorPoint = Vector2.new(0.5, 0.5)
bi.BackgroundTransparency = 1
bi.BorderSizePixel = 0
bi.Visible = false
bi.Parent = bh

local bj = Instance.new("UICorner")
bj.CornerRadius = UDim.new(1, 0)
bj.Parent = bi

local bk = Instance.new("UIStroke")
bk.Thickness = 1
bk.Color = Color3.fromRGB(255, 255, 255)
bk.Parent = bi

local function bl()
	LPH_ATTRIBUTES(VM(NONE))
	if not e.fovdraw then
		bi.Visible = false
		return
	end

	local bm = k:GetMouseLocation()
	local bn = g("fovsize", 100)
	bi.Size = UDim2.fromOffset(bn * 2, bn * 2)
	bi.Position = UDim2.fromOffset(bm.X, bm.Y)
	bk.Thickness = g("fovthickness", 1)
	bk.Color = g("fovcolor", Color3.new(1, 1, 1))
	bi.Visible = true
end

local bm = Instance.new("ScreenGui")
bm.Name = "cwsnap"
bm.IgnoreGuiInset = true
bm.ResetOnSpawn = false
bm.DisplayOrder = 100
bm.Parent = (gethui and gethui()) or game:GetService("CoreGui")

local bn = Instance.new("Frame")
bn.AnchorPoint = Vector2.new(0.5, 0.5)
bn.BorderSizePixel = 0
bn.Visible = false
bn.Parent = bm

local function bo()
	LPH_ATTRIBUTES(VM(NONE))
	local bp = h.target
	if e.snaplines and bp and bp.Parent then
		local bq = workspace.CurrentCamera
		if bq then
			local br, bs = bq:WorldToViewportPoint(bp.Position)
			if bs and br.Z > 0 then
				local bt = k:GetMouseLocation()
				local bu = Vector2.new(br.X, br.Y)
				local bv = bu - bt
				bn.Size = UDim2.fromOffset(bv.Magnitude, 1)
				bn.Position = UDim2.fromOffset((bt.X + bu.X) / 2, (bt.Y + bu.Y) / 2)
				bn.Rotation = math.deg(math.atan2(bv.Y, bv.X))
				bn.BackgroundColor3 = g("snaptargetcolor", Color3.fromRGB(255, 0, 0))
				bn.Visible = true
				return
			end
		end
	end
	bn.Visible = false
end


	d.functions = ad
	d.espCfg = a9
	d.applyESP = bc
	d.refreshTeamFilter = bd
	d.cars = {
		entries = aB,
		defaults = ax,
		boolDefaults = ay,
		choiceDefaults = az,
		state = aL,
		apply = aM,
		profile = aN,
		setControl = aO,
		syncJson = aK,
		loadJson = S,
	}

	d.combat = {
		targetStep = ab,
		aimbotRenderStep = ac,
		fovRenderStep = bl,
		snapRenderStep = bo,
		rageSchedulerStep = a8,
		autoHealStep = au,
		fastReviveStep = aw,
		carModsStep = W,
		applyESP = bc,
		refreshTeamFilter = bd,
		unload = function()
			if bh then
				bh:Destroy()
				bh = nil
			end
			if bm then
				bm:Destroy()
				bm = nil
			end
		end,
	}
end

function c.step()
end

function c.unload()
end

return c
end function a.c()local aa=a.cache.c if not aa then aa={c=b()}a.cache.c=aa end return aa.c end end do local function aa()
local ab = {}

function ab.build(ac)
	local ad = ac.flags
	local ae = ac.tv
	local af = ac.ov
	local ag = ac.util
	local ah = ac.Players
	local ai = ac.RunService
	local aj = ac.UserInputService
	local ak = ac.LocalPlayer
	local al = ac.RS
	local am = ac.Library
	local an = ac.Tabs
	local ao = ac.HttpService
	local ap = ac.manipulation
	local aq = ac.RecoilController
	local ar = ac.AimController
	local as = ac.FiremodeController
	local at = ac.Trajectory
	local au = ac.InventoryController
	local av = ac.CameraShaker
	local aw = ac.paidToggleKeys
	local ax = ac.paidOptionKeys
local ay = an.ESP:AddLeftGroupbox("Main")
ay:AddToggle("ESPMaster", { Text = "Enabled", Default = false })
ay:AddToggle(
	"ESPFilterTeam",
	{ Text = "Filter teammates", Default = false }
)
ay:AddSlider(
	"ESPMaxDistance",
	{
		Text = "Max distance",
		Default = 0,
		Min = 0,
		Max = 2000,
		Rounding = 0,
		Suffix = " studs",
	}
)

local az = an.ESP:AddLeftGroupbox("Boxes")
az:AddToggle("ESPBoxes", { Text = "Boxes", Default = true })
az:AddDropdown("ESPBoxType", { Text = "Box type", Values = { "Normal", "Corner" }, Default = 1, Multi = false })
az
	:AddLabel("Box color")
	:AddColorPicker("ESPBoxColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Box color" })
az:AddSlider("ESPBoxThickness", { Text = "Box thickness", Default = 1, Min = 1, Max = 6, Rounding = 0 })
az:AddToggle("ESPBoxOutline", { Text = "Box outline", Default = true })
az
	:AddLabel("Outline color")
	:AddColorPicker("ESPBoxOutlineColor", { Default = Color3.fromRGB(0, 0, 0), Title = "Outline color" })
az:AddDivider()
az:AddToggle("ESPBoxFill", { Text = "Box fill", Default = false })
az
	:AddLabel("Fill color")
	:AddColorPicker("ESPBoxFillColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Fill color" })
az:AddSlider(
	"ESPBoxFillTransparency",
	{ Text = "Fill transparency", Default = 0.9, Min = 0, Max = 1, Rounding = 2 }
)

local aA = an.ESP:AddRightGroupbox("Chams")
aA:AddToggle("ESPChams", { Text = "Chams", Default = false })
aA:AddDropdown(
	"ESPChamsType",
	{
		Text = "Chams type",
		Values = { "Highlight", "Adornment", "MeshChams" },
		Default = 1,
		Multi = false,
	}
)
aA
	:AddLabel("Fill color")
	:AddColorPicker("ESPChamsFill", { Default = Color3.fromRGB(59, 144, 204), Title = "Cham fill" })
aA:AddSlider("ESPChamsFillT", { Text = "Fill transparency", Default = 0.6, Min = 0, Max = 1, Rounding = 2 })
aA
	:AddLabel("Outline color")
	:AddColorPicker("ESPChamsOutline", { Default = Color3.fromRGB(255, 255, 255), Title = "Cham outline" })
aA:AddSlider("ESPChamsOutlineT", { Text = "Outline transparency", Default = 0, Min = 0, Max = 1, Rounding = 2 })
aA:AddToggle(
	"ESPChamsVisible",
	{ Text = "Visible check", Default = false }
)

local aB = an.ESP:AddLeftGroupbox("Names & Info")
aB:AddToggle("ESPNames", { Text = "Names", Default = true })
aB
	:AddLabel("Name color")
	:AddColorPicker("ESPNameColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Name color" })
aB:AddSlider("ESPTextSize", { Text = "Text size", Default = 12, Min = 6, Max = 28, Rounding = 0 })
aB:AddToggle("ESPTextOutline", { Text = "Text outline", Default = true })
aB:AddDivider()
aB:AddToggle("ESPDistance", { Text = "Distance", Default = false })
aB
	:AddLabel("Distance color")
	:AddColorPicker("ESPDistanceColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Distance color" })
aB:AddToggle("ESPWeapon", { Text = "Weapon", Default = false })
aB:AddToggle("ESPTeam", { Text = "Team indicator", Default = false })
aB:AddToggle(
	"ESPFriendly",
	{ Text = "Friendly indicator", Default = false }
)

local aC = an.ESP:AddRightGroupbox("Health")
aC:AddToggle("ESPHealth", { Text = "Health", Default = false })
aC:AddDropdown(
	"ESPHealthMode",
	{
		Text = "Health mode",
		Values = { "Average", "Target part" },
		Default = 1,
		Multi = false,
	}
)

local aD = an.ESP:AddRightGroupbox("Flags & Arrows")
aD:AddToggle("ESPFlags", { Text = "Status flags", Default = false })
aD:AddToggle("ESPFlagIdle", { Text = "Flag: Idle", Default = false })
aD:AddToggle("ESPFlagMoving", { Text = "Flag: Moving", Default = false })
aD:AddToggle("ESPFlagJumping", { Text = "Flag: Jumping", Default = false })
aD:AddToggle("ESPFlagSwimming", { Text = "Flag: Swimming", Default = false })
aD:AddDivider()
aD:AddToggle("ESPArrows", { Text = "Off-screen arrows", Default = false })
aD
	:AddLabel("Arrow color")
	:AddColorPicker("ESPArrowColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Arrow color" })
aD:AddSlider("ESPArrowSize", { Text = "Arrow size", Default = 14, Min = 8, Max = 40, Rounding = 0 })

local aE = {
	"ESPMaster",
	"ESPBoxes",
	"ESPBoxOutline",
	"ESPBoxFill",
	"ESPNames",
	"ESPTextOutline",
	"ESPDistance",
	"ESPWeapon",
	"ESPTeam",
	"ESPFriendly",
	"ESPHealth",
	"ESPChams",
	"ESPChamsVisible",
	"ESPFlags",
	"ESPFlagIdle",
	"ESPFlagMoving",
	"ESPFlagJumping",
	"ESPFlagSwimming",
	"ESPArrows",
}
local aF = {
	"ESPMaxDistance",
	"ESPBoxType",
	"ESPBoxColor",
	"ESPBoxThickness",
	"ESPBoxOutlineColor",
	"ESPBoxFillColor",
	"ESPBoxFillTransparency",
	"ESPNameColor",
	"ESPTextSize",
	"ESPDistanceColor",
	"ESPHealthMode",
	"ESPChamsType",
	"ESPChamsFill",
	"ESPChamsFillT",
	"ESPChamsOutline",
	"ESPChamsOutlineT",
	"ESPArrowColor",
	"ESPArrowSize",
}

for aG, aH in ipairs(aE) do
	Toggles[aH]:OnChanged(ac.applyESP)
end
for aG, aH in ipairs(aF) do
	Options[aH]:OnChanged(ac.applyESP)
end

Toggles.ESPFilterTeam:OnChanged(ac.refreshTeamFilter)

ac.applyESP()
ac.refreshTeamFilter()

local aG = 0
local function aH(aI)
	LPH_ATTRIBUTES(VM(NONE))
	if not ac.ESP or not ac.espCfg or not ad.ESPMaster then
		return
	end
	aG = aG + aI
	if aG < 1 then
		return
	end
	aG = 0
	ac.refreshTeamFilter()
end

local aI = game:GetService("Lighting")
local aJ = {
	"GlobalShadows",
	"Brightness",
	"ClockTime",
	"ExposureCompensation",
	"ShadowSoftness",
	"EnvironmentDiffuseScale",
	"EnvironmentSpecularScale",
	"GeographicLatitude",
	"Ambient",
	"OutdoorAmbient",
	"ColorShift_Top",
	"ColorShift_Bottom",
	"FogColor",
	"FogStart",
	"FogEnd",
}
local aK = {
	Atmosphere = { "Color", "Decay", "Density", "Offset", "Haze", "Glare" },
	BloomEffect = { "Enabled", "Intensity", "Size", "Threshold" },
	ColorCorrectionEffect = { "Enabled", "Brightness", "Contrast", "Saturation", "TintColor" },
	SunRaysEffect = { "Enabled", "Intensity", "Spread" },
	DepthOfFieldEffect = { "Enabled", "FarIntensity", "NearIntensity", "FocusDistance", "InFocusRadius" },
	BlurEffect = { "Enabled", "Size" },
}
local aL = { Lighting = {}, Effects = {} }
local aM = {}
for aN, aO in ipairs(aJ) do
	aL.Lighting[aO] = aI[aO]
end
for aN, aO in ipairs(aI:GetDescendants()) do
	local aP = aK[aO.ClassName]
	if aP then
		aM[#aM + 1] = aO
		local aQ = {}
		for aR, aS in ipairs(aP) do
			aQ[aS] = aO[aS]
		end
		aL.Effects[aO] = aQ
	end
end

local aN = aI:FindFirstChildOfClass("Atmosphere")
local aO = aI:FindFirstChildOfClass("BloomEffect")
local aP = aI:FindFirstChildOfClass("ColorCorrectionEffect")
local aQ = aI:FindFirstChildOfClass("SunRaysEffect")
local aR = aI:FindFirstChild("DepthOfField")
local aS = aI:FindFirstChildOfClass("BlurEffect")

local function aT()
	for aU, aV in pairs(aL.Lighting) do
		aI[aU] = aV
	end
	for aU, aV in pairs(aL.Effects) do
		if aU.Parent then
			for aW, aX in pairs(aV) do
				aU[aW] = aX
			end
		end
	end
end

local function aU(aV, aW, aX)
	if aV[aW] ~= aX then
		aV[aW] = aX
	end
end

local function aV()
	LPH_ATTRIBUTES(VM(NONE))
	if not ae("lightingoverride", false) then
		return
	end
	local aW = af("fogstart", aL.Lighting.FogStart)
	aU(aI, "GlobalShadows", ae("globalshadows", aL.Lighting.GlobalShadows))
	aU(aI, "Brightness", af("lightingbrightness", aL.Lighting.Brightness))
	aU(aI, "ClockTime", af("clocktime", aL.Lighting.ClockTime))
	aU(
		aI,
		"ExposureCompensation",
		af("exposure", aL.Lighting.ExposureCompensation)
	)
	aU(aI, "ShadowSoftness", af("shadowsoftness", aL.Lighting.ShadowSoftness))
	aU(
		aI,
		"EnvironmentDiffuseScale",
		af("diffusescale", aL.Lighting.EnvironmentDiffuseScale)
	)
	aU(
		aI,
		"EnvironmentSpecularScale",
		af("specularscale", aL.Lighting.EnvironmentSpecularScale)
	)
	aU(aI, "GeographicLatitude", af("latitude", aL.Lighting.GeographicLatitude))
	aU(aI, "Ambient", af("ambientcolor", aL.Lighting.Ambient))
	aU(aI, "OutdoorAmbient", af("outdoorambient", aL.Lighting.OutdoorAmbient))
	aU(aI, "ColorShift_Top", af("colorshifttop", aL.Lighting.ColorShift_Top))
	aU(
		aI,
		"ColorShift_Bottom",
		af("colorshiftbottom", aL.Lighting.ColorShift_Bottom)
	)
	aU(aI, "FogColor", af("fogcolor", aL.Lighting.FogColor))
	aU(aI, "FogStart", aW)
	aU(aI, "FogEnd", math.max(aW, af("fogend", aL.Lighting.FogEnd)))

	for aX, aY in ipairs(aM) do
		if not aY.Parent then
			continue
		end
		if aY:IsA("Atmosphere") then
			local aZ = aL.Effects[aY]
			local a_ = ae("atmosphereenabled", true)
			aU(aY, "Color", af("atmospherecolor", aZ.Color))
			aU(aY, "Decay", af("atmospheredecay", aZ.Decay))
			aU(aY, "Density", a_ and af("atmospheredensity", aZ.Density) or 0)
			aU(aY, "Offset", af("atmosphereoffset", aZ.Offset))
			aU(aY, "Haze", a_ and af("atmospherehaze", aZ.Haze) or 0)
			aU(aY, "Glare", a_ and af("atmosphereglare", aZ.Glare) or 0)
		elseif aY:IsA("BloomEffect") then
			local aZ = aL.Effects[aY]
			aU(aY, "Enabled", ae("bloomenabled", aZ.Enabled))
			aU(aY, "Intensity", af("bloomintensity", aZ.Intensity))
			aU(aY, "Size", af("bloomsize", aZ.Size))
			aU(aY, "Threshold", af("bloomthreshold", aZ.Threshold))
		elseif aY:IsA("ColorCorrectionEffect") then
			local aZ = aL.Effects[aY]
			aU(aY, "Enabled", ae("colorcorrectionenabled", aZ.Enabled))
			aU(aY, "Brightness", af("ccbrightness", aZ.Brightness))
			aU(aY, "Contrast", af("cccontrast", aZ.Contrast))
			aU(aY, "Saturation", af("ccsaturation", aZ.Saturation))
			aU(aY, "TintColor", af("cctint", aZ.TintColor))
		elseif aY:IsA("SunRaysEffect") then
			local aZ = aL.Effects[aY]
			aU(aY, "Enabled", ae("sunraysenabled", aZ.Enabled))
			aU(aY, "Intensity", af("sunraysintensity", aZ.Intensity))
			aU(aY, "Spread", af("sunraysspread", aZ.Spread))
		elseif aY:IsA("DepthOfFieldEffect") and aY.Name == "DepthOfField" then
			local aZ = aL.Effects[aY]
			aU(aY, "Enabled", ae("dofenabled", aZ.Enabled))
			aU(aY, "FarIntensity", af("doffar", aZ.FarIntensity))
			aU(aY, "NearIntensity", af("dofnear", aZ.NearIntensity))
			aU(aY, "FocusDistance", af("doffocus", aZ.FocusDistance))
			aU(aY, "InFocusRadius", af("dofradius", aZ.InFocusRadius))
		elseif aY:IsA("BlurEffect") then
			local aZ = aL.Effects[aY]
			aU(aY, "Enabled", ae("blurenabled", aZ.Enabled))
			aU(aY, "Size", af("blursize", aZ.Size))
		end
	end
end

local aW = an.Visuals:AddRightGroupbox("Lighting")
aW:AddToggle(
	"lightingoverride",
	{
		Text = "Lighting Override",
		Default = false,
	}
)
Toggles.lightingoverride:OnChanged(function(aX)
	if aX then
		aV()
	else
		aT()
	end
end)
aW:AddToggle("globalshadows", { Text = "Global Shadows", Default = aI.GlobalShadows })
aW:AddSlider(
	"lightingbrightness",
	{ Text = "Brightness", Default = aI.Brightness, Min = 0, Max = 10, Rounding = 2 }
)
aW:AddSlider(
	"clocktime",
	{ Text = "Clock Time", Default = aI.ClockTime, Min = 0, Max = 24, Rounding = 2, Suffix = " h" }
)
aW:AddSlider(
	"exposure",
	{ Text = "Exposure", Default = aI.ExposureCompensation, Min = -5, Max = 5, Rounding = 2 }
)
aW:AddSlider(
	"shadowsoftness",
	{ Text = "Shadow Softness", Default = aI.ShadowSoftness, Min = 0, Max = 1, Rounding = 2 }
)
aW:AddSlider(
	"diffusescale",
	{ Text = "Environment Diffuse", Default = aI.EnvironmentDiffuseScale, Min = 0, Max = 1, Rounding = 2 }
)
aW:AddSlider(
	"specularscale",
	{ Text = "Environment Specular", Default = aI.EnvironmentSpecularScale, Min = 0, Max = 1, Rounding = 2 }
)
aW:AddSlider(
	"latitude",
	{ Text = "Sun Latitude", Default = aI.GeographicLatitude, Min = -180, Max = 180, Rounding = 1, Suffix = "°" }
)
aW:AddLabel("Ambient"):AddColorPicker("ambientcolor", { Default = aI.Ambient, Title = "Ambient" })
aW
	:AddLabel("Outdoor Ambient")
	:AddColorPicker("outdoorambient", { Default = aI.OutdoorAmbient, Title = "Outdoor Ambient" })
aW
	:AddLabel("Color Shift Top")
	:AddColorPicker("colorshifttop", { Default = aI.ColorShift_Top, Title = "Color Shift Top" })
aW
	:AddLabel("Color Shift Bottom")
	:AddColorPicker("colorshiftbottom", { Default = aI.ColorShift_Bottom, Title = "Color Shift Bottom" })

local aX = an.Visuals:AddRightGroupbox("Fog & Atmosphere")
aX:AddLabel("Fog Color"):AddColorPicker("fogcolor", { Default = aI.FogColor, Title = "Fog Color" })
aX:AddSlider(
	"fogstart",
	{ Text = "Fog Start", Default = aI.FogStart, Min = 0, Max = 10000, Rounding = 0, Suffix = " studs" }
)
aX:AddSlider(
	"fogend",
	{
		Text = "Fog End",
		Default = math.min(aI.FogEnd, 100000),
		Min = 0,
		Max = 100000,
		Rounding = 0,
		Suffix = " studs",
	}
)
aX:AddToggle("atmosphereenabled", { Text = "Atmosphere", Default = true })
aX:AddLabel("Atmosphere Color"):AddColorPicker(
	"atmospherecolor",
	{ Default = aN and aN.Color or Color3.new(1, 1, 1), Title = "Atmosphere Color" }
)
aX:AddLabel("Atmosphere Decay"):AddColorPicker(
	"atmospheredecay",
	{ Default = aN and aN.Decay or Color3.new(1, 1, 1), Title = "Atmosphere Decay" }
)
aX:AddSlider(
	"atmospheredensity",
	{ Text = "Density", Default = aN and aN.Density or 0, Min = 0, Max = 1, Rounding = 3 }
)
aX:AddSlider(
	"atmosphereoffset",
	{ Text = "Offset", Default = aN and aN.Offset or 0, Min = -1, Max = 1, Rounding = 3 }
)
aX:AddSlider(
	"atmospherehaze",
	{ Text = "Haze", Default = aN and aN.Haze or 0, Min = 0, Max = 10, Rounding = 2 }
)
aX:AddSlider(
	"atmosphereglare",
	{ Text = "Glare", Default = aN and aN.Glare or 0, Min = 0, Max = 10, Rounding = 2 }
)

local aY = an.Visuals:AddRightGroupbox("Post Processing")
aY:AddToggle("bloomenabled", { Text = "Bloom", Default = aO and aO.Enabled or false })
aY:AddSlider(
	"bloomintensity",
	{ Text = "Bloom Intensity", Default = aO and aO.Intensity or 0, Min = 0, Max = 10, Rounding = 2 }
)
aY:AddSlider(
	"bloomsize",
	{ Text = "Bloom Size", Default = aO and aO.Size or 24, Min = 0, Max = 56, Rounding = 0 }
)
aY:AddSlider(
	"bloomthreshold",
	{ Text = "Bloom Threshold", Default = aO and aO.Threshold or 2, Min = 0, Max = 10, Rounding = 2 }
)
aY:AddToggle(
	"colorcorrectionenabled",
	{ Text = "Color Correction", Default = aP and aP.Enabled or false }
)
aY:AddSlider(
	"ccbrightness",
	{
		Text = "CC Brightness",
		Default = aP and aP.Brightness or 0,
		Min = -1,
		Max = 1,
		Rounding = 2,
	}
)
aY:AddSlider(
	"cccontrast",
	{
		Text = "CC Contrast",
		Default = aP and aP.Contrast or 0,
		Min = -1,
		Max = 1,
		Rounding = 2,
	}
)
aY:AddSlider(
	"ccsaturation",
	{
		Text = "CC Saturation",
		Default = aP and aP.Saturation or 0,
		Min = -1,
		Max = 1,
		Rounding = 2,
	}
)
aY:AddLabel("CC Tint"):AddColorPicker(
	"cctint",
	{
		Default = aP and aP.TintColor or Color3.new(1, 1, 1),
		Title = "Color Correction Tint",
	}
)
aY:AddToggle(
	"sunraysenabled",
	{ Text = "Sun Rays", Default = aQ and aQ.Enabled or false }
)
aY:AddSlider(
	"sunraysintensity",
	{
		Text = "Sun Rays Intensity",
		Default = aQ and aQ.Intensity or 0,
		Min = 0,
		Max = 1,
		Rounding = 3,
	}
)
aY:AddSlider(
	"sunraysspread",
	{ Text = "Sun Rays Spread", Default = aQ and aQ.Spread or 0, Min = 0, Max = 1, Rounding = 3 }
)
aY:AddToggle(
	"dofenabled",
	{ Text = "Depth of Field", Default = aR and aR.Enabled or false }
)
aY:AddSlider(
	"doffar",
	{
		Text = "DOF Far Intensity",
		Default = aR and aR.FarIntensity or 0,
		Min = 0,
		Max = 1,
		Rounding = 3,
	}
)
aY:AddSlider(
	"dofnear",
	{
		Text = "DOF Near Intensity",
		Default = aR and aR.NearIntensity or 0,
		Min = 0,
		Max = 1,
		Rounding = 3,
	}
)
aY:AddSlider(
	"doffocus",
	{
		Text = "DOF Focus Distance",
		Default = aR and aR.FocusDistance or 10,
		Min = 0,
		Max = 500,
		Rounding = 1,
	}
)
aY:AddSlider(
	"dofradius",
	{
		Text = "DOF Focus Radius",
		Default = aR and aR.InFocusRadius or 30,
		Min = 0,
		Max = 500,
		Rounding = 1,
	}
)
aY:AddToggle("blurenabled", { Text = "Blur", Default = aS and aS.Enabled or false })
aY:AddSlider(
	"blursize",
	{ Text = "Blur Size", Default = aS and aS.Size or 0, Min = 0, Max = 56, Rounding = 0 }
)

local aZ = an.Visuals:AddLeftGroupbox("Bullet Tracers")
aZ:AddToggle("tracersenabled", { Text = "Bullet Tracers Enabled", Default = false })

aZ:AddToggle("teamtracers", { Text = "Draw Team Tracers", Default = false })
aZ:AddLabel("Team Tracers Color")
	:AddColorPicker("teamtracerscolor", { Default = Color3.fromRGB(59, 144, 204), Title = "Team Tracer Color" })
aZ:AddDropdown(
	"teamtracersmaterial",
	{
		Text = "Team Tracer Material",
		Values = { "Plastic", "SmoothPlastic", "ForceField", "Neon", "Glass" },
		Default = 1,
		Multi = false,
	}
)
aZ:AddSlider(
	"teamtracerstransparency",
	{
		Text = "Team Tracer Transparency",
		Default = 0.5,
		Min = 0,
		Max = 1,
		Rounding = 2,
	}
)

aZ:AddToggle("enemytracers", { Text = "Draw Enemy Tracers", Default = false })
aZ:AddLabel("Enemy Tracers Color")
	:AddColorPicker("enemytracerscolor", { Default = Color3.fromRGB(255, 60, 60), Title = "Enemy Tracer Color" })
aZ:AddDropdown(
	"enemytracersmaterial",
	{
		Text = "Enemy Tracer Material",
		Values = { "Plastic", "SmoothPlastic", "ForceField", "Neon", "Glass" },
		Default = 1,
		Multi = false,
	}
)
aZ:AddSlider(
	"enemytracerstransparency",
	{
		Text = "Enemy Tracer Transparency",
		Default = 0.5,
		Min = 0,
		Max = 1,
		Rounding = 2,
	}
)
aZ:AddToggle("localtracers", { Text = "Draw Local Tracers", Default = false })
aZ:AddLabel("Local Tracers Color")
	:AddColorPicker("localtracerscolor", { Default = Color3.fromRGB(59, 255, 50), Title = "Local Tracer Color" })
aZ:AddDropdown(
	"localtracersmaterial",
	{
		Text = "Local Tracer Material",
		Values = { "Plastic", "SmoothPlastic", "ForceField", "Neon", "Glass" },
		Default = 1,
		Multi = false,
	}
)
aZ:AddSlider(
	"localtracerstransparency",
	{
		Text = "Local Tracer Transparency",
		Default = 0.5,
		Min = 0,
		Max = 1,
		Rounding = 2,
	}
)
aZ:AddSlider("bullettracersize", { Text = "Bullet Tracer Size", Default = 0.1, Min = 0.01, Max = 1, Rounding = 2 })


	ac.visuals = {
		teamFilterStep = aH,
		applyLighting = aV,
		unload = function()
			aT()
		end,
	}
end

function ab.step()
end

function ab.unload()
end

return ab
end function a.d()local ab=a.cache.d if not ab then ab={c=aa()}a.cache.d=ab end return ab.c end end do local function aa()
local ab = {}

function ab.build(ac)
	local ad = ac.flags
	local ae = ac.tv
	local af = ac.ov
	local ag = ac.util
	local ah = ac.Players
	local ai = ac.RunService
	local aj = ac.UserInputService
	local ak = ac.LocalPlayer
	local al = ac.RS
	local am = ac.Library
	local an = ac.Tabs
	local ao = ac.HttpService
	local ap = ac.manipulation
	local aq = ac.RecoilController
	local ar = ac.AimController
	local as = ac.FiremodeController
	local at = ac.Trajectory
	local au = ac.InventoryController
	local av = ac.CameraShaker
	local aw = ac.paidToggleKeys
	local ax = ac.paidOptionKeys
local ay = true
local az = 10
local aA = 200
local aB = Drawing.new("Text")
aB.Text = "Moderators\nChecking players..."
aB.Position = Vector2.new(az, aA)
aB.Size = 14
aB.Color = Color3.fromRGB(255, 255, 255)
aB.Outline = true
aB.OutlineColor = Color3.fromRGB(0, 0, 0)
aB.Visible = ay
local aC = {}
local aD = {}
local aE
local aF

local function aG()
	LPH_ATTRIBUTES(VM(NONE))
	local aH = {}
	for aI, aJ in pairs(aC) do
		if aI.Parent == ah and aJ.IsModerator then
			local aK = {}
			if aJ.Rank >= 240 then
				aK[#aK + 1] = "Rank " .. aJ.Rank
			end
			if aJ.ControlPanel then
				aK[#aK + 1] = "Control Panel"
			end
			aH[#aH + 1] = {
				SortName = aI.Name:lower(),
				Text = string.format("%s (@%s) [%s]", aI.DisplayName, aI.Name, table.concat(aK, ", ")),
			}
		end
	end
	table.sort(aH, function(aI, aJ)
		return aI.SortName < aJ.SortName
	end)

	local aI = {}
	for aJ, aK in ipairs(aH) do
		aI[#aI + 1] = aK.Text
	end
	if aB then
		aB.Text = "Moderators\n" .. (#aI > 0 and table.concat(aI, "\n") or "No moderators online")
	end
end

local function aH(aI)
	LPH_ATTRIBUTES(VM(NONE))
	if aD[aI] then
		aD[aI]:Disconnect()
	end

	local aJ = aI:GetAttribute("ControlPanelAccess") == true
	local aK = {
		Rank = 0,
		ControlPanel = aJ,
		IsModerator = aJ,
	}
	aC[aI] = aK
	aG()

	aD[aI] = aI:GetAttributeChangedSignal("ControlPanelAccess"):Connect(function()
		aK.ControlPanel = aI:GetAttribute("ControlPanelAccess") == true
		aK.IsModerator = aK.Rank >= 240 or aK.ControlPanel
		aG()
	end)

	task.spawn(function()
		local aL, aM = pcall(aI.GetRankInGroup, aI, 32519006)
		if aC[aI] ~= aK then
			return
		end
		aK.Rank = aL and aM or 0
		aK.IsModerator = aK.Rank >= 240 or aK.ControlPanel
		aG()
	end)
end

local function aI(aJ)
	LPH_ATTRIBUTES(VM(NONE))
	if aD[aJ] then
		aD[aJ]:Disconnect()
		aD[aJ] = nil
	end
	aC[aJ] = nil
	aG()
end

for aJ, aK in ipairs(ah:GetPlayers()) do
	aH(aK)
end
aE = ah.PlayerAdded:Connect(aH)
aF = ah.PlayerRemoving:Connect(aI)

local aJ
local aK
local aL
local function aM(aN)
	if aJ then
		aJ:Disconnect()
		aJ = nil
	end
	local aO = aN
		and (aN:FindFirstChildWhichIsA("Humanoid") or aN:WaitForChild("Humanoid", 5))
	if not aO then
		return
	end
	local aP = false
	local function aQ()
		if not ae("walkspeedenabled", false) or aP then
			return
		end
		aP = true
		aO.WalkSpeed = af("walkspeed", 16)
		aP = false
	end
	aQ()
	aJ = aO:GetPropertyChangedSignal("WalkSpeed"):Connect(aQ)
end
local function aN(aO)
	if aL then
		aL:Disconnect()
		aL = nil
	end
	local aP = aO
		and (aO:FindFirstChildWhichIsA("Humanoid") or aO:WaitForChild("Humanoid", 5))
	if not aP then
		return
	end
	local aQ = false
	local function aR()
		if not ae("jumppowerenabled", false) or aQ then
			return
		end
		aQ = true
		aP.UseJumpPower = true
		aP.JumpPower = af("jumppower", 50)
		aQ = false
	end
	aR()
	aL = aP:GetPropertyChangedSignal("JumpPower"):Connect(aR)
end
aK = ak.CharacterAdded:Connect(function(aO)
	aM(aO)
	aN(aO)
end)
aM(ak.Character)
aN(ak.Character)

local aO
local aP
local aQ = 0
local function aR(aS)
	LPH_ATTRIBUTES(VM(NONE))
	if not ad.antiaimspin and not aO then
		return
	end
	local aT = ak.Character
	local aU = aT and aT:FindFirstChildWhichIsA("Humanoid")
	local aV = aT and aT:FindFirstChild("HumanoidRootPart")
	if not (aU and aV) then
		return
	end
	local aW = aU.Sit
		or aU.SeatPart ~= nil
		or ak:GetAttribute("InVehicle") == true
		or aT:GetAttribute("InVehicle") == true
		or aV:FindFirstChild("SeatWeld") ~= nil

	if ad.antiaimspin and not aW then
		if aO ~= aU then
			if aO and aO.Parent and aP ~= nil then
				aO.AutoRotate = aP
			end
			aO = aU
			aP = aU.AutoRotate
			aQ = select(2, aV.CFrame:ToOrientation())
		end
		aU.AutoRotate = false
	elseif aO then
		if aO.Parent and aP ~= nil then
			aO.AutoRotate = aP
		end
		aO = nil
		aP = nil
	end

	if ad.antiaimspin and not aW then
		aQ = (aQ + math.rad(af("antiaimspinspeed", 180)) * aS) % math.tau
		aV.CFrame = CFrame.new(aV.Position) * CFrame.Angles(0, aQ, 0)
	end
end
if la_is_premium then
    local aS = an.Misc:AddLeftGroupbox("Movement")
    aS:AddToggle(
    	"walkspeedenabled",
    	{ Text = "WalkSpeed", Default = false }
    )
    Toggles.walkspeedenabled:OnChanged(function(aT)
    	aM(ak.Character)
    end)
    aS:AddSlider("walkspeed", { Text = "WalkSpeed Value", Default = 16, Min = 0, Max = 50, Rounding = 0 })
    Options.walkspeed:OnChanged(function(aT)
    	aM(ak.Character)
    end)
    aS:AddToggle(
    	"jumppowerenabled",
    	{ Text = "JumpPower", Default = false }
    )
    Toggles.jumppowerenabled:OnChanged(function(aT)
    	aN(ak.Character)
    end)
    aS:AddSlider(
    	"jumppower",
    	{
    		Text = "JumpPower Value",
    		Default = 50,
    		Min = 0,
    		Max = 100,
    		Rounding = 0,
    	}
    )
    Options.jumppower:OnChanged(function(aT)
    	aN(ak.Character)
    end)
    aS:AddToggle("omnisprint", { Text = "Omni Sprint", Default = false })
    aS:AddToggle(
    	"nohurtslowdown",
    	{ Text = "No Hurt Slowdown", Default = false }
    )

    local aT = an.Misc:AddLeftGroupbox("Anti Aim")
    aT:AddToggle(
    	"antiaimpitch",
    	{
    		Text = "Head Pitch",
    		Default = false,
    	}
    )
    aT:AddSlider(
    	"antiaimpitchangle",
    	{ Text = "Head Pitch Angle", Default = 90, Min = -180, Max = 180, Rounding = 0, Suffix = "°" }
    )
    aT:AddToggle(
    	"gunup",
    	{ Text = "Always Gun Up", Default = false }
    )
    aT:AddToggle("antiaimspin", { Text = "Spin", Default = false })
    Toggles.antiaimspin:OnChanged(function(aU)
    	if not aU and aO then
    		if aO.Parent and aP ~= nil then
    			aO.AutoRotate = aP
    		end
    		aO = nil
    		aP = nil
    	end
    end)
    aT:AddSlider(
    	"antiaimspinspeed",
    	{ Text = "Spin Speed", Default = 180, Min = 0, Max = 1080, Rounding = 0, Suffix = "°/s" }
    )

    local function aU(aV)
    	local aW = aV and aV:FindFirstChild("CharacterValues")
    	if not aW then
    		return
    	end
	if ad.antisuppression then
     		local aX = aW:FindFirstChild("Suppression")
    		local aY = aW:FindFirstChild("Deafening")
    		if aX then
    			aX.Value = 0
    		end
    		if aY then
    			aY.Value = 0
    		end
    	end
    end

    local aV = game:GetService("Lighting"):FindFirstChild("SuppressionDepthOfField")
    local aW = aV and aV.Enabled
    local aX = 0
    function antiEffectsStep(aY)
    	LPH_ATTRIBUTES(VM(NONE))
    	if not (ad.antisuppression or ad.antiflashbang) then
    		return
    	end
    	aX = aX + aY
    	if aX < 0.5 then
    		return
    	end
    	aX = 0
    	aU(ak.Character)

     	if ad.antisuppression then
     		aV = game:GetService("Lighting"):FindFirstChild("SuppressionDepthOfField")
    			or aV
    		if aV and aV:IsA("PostEffect") then
    			aV.Enabled = false
    		end
    	end

     	if ad.antiflashbang then
    		for aZ, a_ in ipairs({ game:GetService("Lighting"), ak:FindFirstChildOfClass("PlayerGui") }) do
    			if a_ then
    				for a0, a1 in ipairs(a_:GetDescendants()) do
    					local a2 = a1.Name:lower()
    					if
    						a2:find("flash", 1, true)
    						or a2:find("stun", 1, true)
    						or a2:find("concussion", 1, true)
    					then
    						if a1:IsA("PostEffect") then
    							a1.Enabled = false
    						elseif a1:IsA("LayerCollector") then
    							a1.Enabled = false
    						elseif a1:IsA("GuiObject") then
    							a1.Visible = false
    						end
    					end
    				end
    			end
    		end
    	end
    end

    local aY = an.Misc:AddLeftGroupbox("Screen Effects")
    aY:AddToggle(
    	"antisuppression",
    	{
    		Text = "Anti Suppression",
    		Default = false,
    	}
    )
    Toggles.antisuppression:OnChanged(function(aZ)
    	if aZ then
    		aU(ak.Character)
    	elseif aV and aV.Parent then
    		aV.Enabled = aW
    	end
    end)
    aY:AddToggle(
    	"antiflashbang",
    	{
    		Text = "Anti Flashbang",
    		Default = false,
    	}
    )

    local aZ = an.Misc:AddRightGroupbox("Healing")
    aZ:AddToggle("autoheal", { Text = "Auto Heal", Default = false })
    aZ:AddSlider("autohealmindamage", {
    	Text = "Min Damage",
    	Default = 30,
    	Min = 0,
    	Max = 100,
    	Rounding = 0,
    	Suffix = "%",
    })
    aZ:AddToggle("instantheal", { Text = "Instant Heal", Default = false })
    local a_ = ac.functions.healLimb.upv and ac.functions.healLimb.upv[7]
    local a0 = {}
    aZ:AddToggle("nobandageslowdown", { Text = "No Bandage Slowdown", Default = false })
    Toggles["nobandageslowdown"]:OnChanged(function(a1)
    	if la_is_premium ~= true or not ac.functions.healLimb.func then return end
    	if a1 then
    		debug.setupvalue(ac.functions.healLimb.func, 7, a0)
    	else
    		debug.setupvalue(ac.functions.healLimb.func, 7, a_)
    	end
    end)
    aZ:AddToggle("fastrevive", { Text = "Fast Revive", Default = false })

    local a1 = an.Misc:AddRightGroupbox("Vehicles")
    a1:AddToggle("carmods", { Text = "Car Mods", Default = false })
    Toggles["carmods"]:OnChanged(function(a2)
    	ac.cars.apply()
    end)
    a1:AddDropdown(
    	"carprofile",
    	{ Text = "Car", Values = ac.cars.entries, Default = 1, Multi = false, AllowNull = true }
    )
    Options.carprofile:OnChanged(function(a2)
    	ac.cars.state.selected = a2
    	local a3 = ac.cars.profile()
    	if not a3 then
    		return
    	end
    	for a4 in pairs(ac.cars.defaults) do
    		if Options["car_" .. a4] then
    			Options["car_" .. a4]:SetValue(a3[a4])
    		end
    	end
    	for a4 in pairs(ac.cars.boolDefaults) do
    		if Toggles["car_" .. a4] then
    			Toggles["car_" .. a4]:SetValue(a3[a4])
    		end
    	end
    	for a4, a5 in pairs({
    		ChassisType = { "Wheeled", "Tracked" },
    		DriveType = { "FWD", "RWD", "AWD" },
    		Differential = { "Open", "Locked" },
    	}) do
    		if Options["car_" .. a4] then
    			Options["car_" .. a4]:SetValue(a3[a4])
    		end
    	end
    	for a4 = -1, 6 do
    		local a5 = a3.Ratios and a3.Ratios[a4] or 0
    		if Options["car_ratio_" .. tostring(a4)] then
    			Options["car_ratio_" .. tostring(a4)]:SetValue(a5)
    		end
    	end
    	for a4 = 1, 4 do
    		local a5 = a3.Wheels and a3.Wheels[a4]
    		if Toggles["car_wheel_" .. a4 .. "_drive"] then
    			Toggles["car_wheel_" .. a4 .. "_drive"]:SetValue(a5 and a5.Drive == true or true)
    		end
    		if Toggles["car_wheel_" .. a4 .. "_steer"] then
    			Toggles["car_wheel_" .. a4 .. "_steer"]:SetValue(a5 and a5.Steer == 1 or a4 <= 2)
    		end
    	end
    	ac.cars.syncJson()
    	ac.cars.apply()
    end)
    a1:AddLabel("Saved profiles are stored per car and faction")

    local a2 = {
    	{ "FinalDrive", "Final Drive", 0, 20, 2 },
    	{ "ShiftRPM", "Shift RPM", 1000, 15000, 0 },
    	{ "IdleRPM", "Idle RPM", 0, 5000, 0 },
    	{ "IdleTorque", "Idle Torque", 0, 2000, 0 },
    	{ "PeakTorque", "Peak Torque", 0, 3000, 0 },
    	{ "PeakTorqueRPM", "Peak Torque RPM", 0, 15000, 0 },
    	{ "RedlineRPM", "Redline RPM", 1000, 20000, 0 },
    	{ "RedlineTorque", "Redline Torque", 0, 3000, 0 },
    	{ "HorsepowerLimit", "Horsepower Limit", 0, 3000, 0 },
    	{ "TorqueScale", "Torque Scale", 0, 20, 2 },
    	{ "TopSpeed", "Top Speed", 0, 500, 0 },
    	{ "PeakGrip", "Peak Grip", 0, 10, 2 },
    	{ "SlideGrip", "Slide Grip", 0, 10, 2 },
    	{ "PeakSlip", "Peak Slip", 0, 5, 2 },
    	{ "Grip", "Grip", 0, 200, 1 },
    	{ "BrakeMultiplier", "Brake Multiplier", 0, 50, 2 },
    	{ "HandBrakeMultiplier", "Handbrake Multiplier", 0, 50, 2 },
    	{ "RollingFriction", "Rolling Friction", 0, 2, 2 },
    	{ "TurningZForceMultiplier", "Turning Z Force", 0, 10, 2 },
    	{ "TurnRadius", "Turn Radius", 0, 100, 1 },
    	{ "SteerSpeed", "Steer Speed", 0, 20, 2 },
    	{ "HighSpeedSteerReduction", "High Speed Steering", 0, 1, 2 },
    	{ "ForceHeight", "Force Height", -5, 5, 2 },
    	{ "Mass", "Mass", 0, 5000, 0 },
    	{ "WheelMass", "Wheel Mass", 0, 100, 1 },
    	{ "SuspensionHeight", "Suspension Height", 0, 10, 2 },
    	{ "RideHeight", "Ride Height", -5, 10, 2 },
    	{ "WheelOffset", "Wheel Offset", -5, 5, 2 },
    	{ "ReboundDampingModifier", "Rebound Damping", 0, 10, 2 },
    	{ "CompressionDampingModifier", "Compression Damping", 0, 10, 2 },
    	{ "DamperActiveness", "Damper Activeness", 0, 2, 2 },
    }
    for a3, a4 in ipairs({ "Reverse", "Neutral", "Gear 1", "Gear 2", "Gear 3", "Gear 4", "Gear 5", "Gear 6" }) do
    	local a5 = a3 - 2
    	local a6 = "car_ratio_" .. tostring(a5)
    	a1:AddSlider(a6, { Text = a4 .. " Ratio", Default = 0, Min = -15, Max = 15, Rounding = 3 })
    	Options[a6]:OnChanged(function(a7)
    		local a8 = ac.cars.profile()
    		if not a8 then
    			return
    		end
    		a8.Ratios = a8.Ratios or {}
    		a8.Ratios[a5] = a7
    		ac.cars.syncJson()
    		ac.cars.apply()
    	end)
    end
    for a3, a4 in ipairs({ "Front Left", "Front Right", "Rear Left", "Rear Right" }) do
    	local a5 = "car_wheel_" .. a3 .. "_"
    	a1:AddToggle(a5 .. "drive", { Text = a4 .. " Drive", Default = true })
    	a1:AddToggle(a5 .. "steer", { Text = a4 .. " Steer", Default = a3 <= 2 })
    	Toggles[a5 .. "drive"]:OnChanged(function(a6)
    		local a7 = ac.cars.profile()
    		if not a7 then
    			return
    		end
    		a7.Wheels = a7.Wheels or {}
    		a7.Wheels[a3] = a7.Wheels[a3]
    			or { Name = a4:gsub(" ", ""), Drive = true, Steer = a3 <= 2 and 1 or 0 }
    		a7.Wheels[a3].Drive = a6
    		ac.cars.syncJson()
    		ac.cars.apply()
    	end)
    	Toggles[a5 .. "steer"]:OnChanged(function(a6)
    		local a7 = ac.cars.profile()
    		if not a7 then
    			return
    		end
    		a7.Wheels = a7.Wheels or {}
    		a7.Wheels[a3] = a7.Wheels[a3]
    			or { Name = a4:gsub(" ", ""), Drive = true, Steer = a3 <= 2 and 1 or 0 }
    		a7.Wheels[a3].Steer = a6 and 1 or 0
    		ac.cars.syncJson()
    		ac.cars.apply()
    	end)
    end
    for a3, a4 in ipairs(a2) do
    	local a5, a6, a7, a8, a9 = table.unpack(a4)
    	a1:AddSlider(
    		"car_" .. a5,
    		{ Text = a6, Default = ac.cars.defaults[a5], Min = a7, Max = a8, Rounding = a9 }
    	)
    	Options["car_" .. a5]:OnChanged(function(b)
    		ac.cars.setControl(a5, b)
    	end)
    end
    for a3, a4 in pairs(ac.cars.boolDefaults) do
    	a1:AddToggle("car_" .. a3, { Text = a3, Default = a4 })
    	Toggles["car_" .. a3]:OnChanged(function(a5)
    		ac.cars.setControl(a3, a5)
    	end)
    end
    for a3, a4 in pairs({
    	ChassisType = { "Wheeled", "Tracked" },
    	DriveType = { "FWD", "RWD", "AWD" },
    	Differential = { "Open", "Locked" },
    }) do
    	a1:AddDropdown(
    		"car_" .. a3,
    		{ Text = a3, Values = a4, Default = ac.cars.choiceDefaults[a3], Multi = false }
    	)
    	Options["car_" .. a3]:OnChanged(function(a5)
    		ac.cars.setControl(a3, a5)
    	end)
    end
    a1:AddInput("carsprofiles", { Text = "Profile data", Default = "{}" })
    Options.carsprofiles:OnChanged(function(a3)
    	ac.cars.loadJson(a3)
    	ac.cars.syncJson()
    	ac.cars.apply()
    end)
if ac.cars.state.selected then
     	Options.carprofile:SetValue(ac.cars.state.selected)
    end
end

	ac.misc = {
		movementStep = aR,
		antiEffectsStep = antiEffectsStep,
		bindSettings = function(aS)
local aT = "NUfjhQcETc"

local function aU(aV)
	local aW = http_request
		or request
		or (syn and syn.request)
		or (fluxus and fluxus.request)
		or (getgenv and getgenv().request)
	if not aW then
		am:Notify("No HTTP request function on this executor.")
		return
	end
	local aX = ao:JSONEncode({
		cmd = "INVITE_BROWSER",
		args = { code = aV },
		nonce = ao:GenerateGUID(false),
	})
	local aY = false
	for aZ = 6463, 6472 do
		local a_, a0 = pcall(aW, {
			Url = ("http://127.0.0.1:%d/rpc?v=1"):format(aZ),
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com",
			},
			Body = aX,
		})
		if a_ and a0 and (a0.StatusCode == 200 or a0.Success) then
			aY = true
			break
		end
	end
	am:Notify(aY and "Opened the invite in Discord." or "Couldn't reach Discord (is it running?).")
end

aS:AddButton({
	Text = "Join Discord",
	Func = function()
		aU(aT)
	end,
})
aS
	:AddToggle(
		"ShowModeratorList",
		{ Text = "Show Moderator List", Default = true }
	)
	:OnChanged(function(aV)
		ay = aV
		if aB then
			aB.Visible = aV
		end
	end)
aS:AddSlider(
	"ModeratorListX",
	{ Text = "Moderator List X", Default = 10, Min = 0, Max = 2000, Rounding = 0, Suffix = " px" }
)
Options.ModeratorListX:OnChanged(function(aV)
	az = aV
	if aB then
		aB.Position = Vector2.new(az, aA)
	end
end)
aS:AddSlider(
	"ModeratorListY",
	{ Text = "Moderator List Y", Default = 200, Min = 0, Max = 1200, Rounding = 0, Suffix = " px" }
)
Options.ModeratorListY:OnChanged(function(aV)
	aA = aV
	if aB then
		aB.Position = Vector2.new(az, aA)
	end
end)

		end,
		unload = function()
			if aJ then
				aJ:Disconnect()
				aJ = nil
			end
			if aL then
				aL:Disconnect()
				aL = nil
			end
			if aK then
				aK:Disconnect()
				aK = nil
			end
			if aO and aO.Parent and aP ~= nil then
				aO.AutoRotate = aP
			end
			aO = nil
			local aS = ak.Character and ak.Character:FindFirstChildWhichIsA("Humanoid")
			if aS then
				aS.PlatformStand = false
			end
			if aE then
				aE:Disconnect()
			end
			if aF then
				aF:Disconnect()
			end
			if aD then
				for aT, aU in pairs(aD) do
					aU:Disconnect()
					aD[aT] = nil
				end
			end
			if aB then
				aB:Remove()
				aB = nil
			end
		end,
	}
end

function ab.step()
end

function ab.unload()
end

return ab
end function a.e()local ab=a.cache.e if not ab then ab={c=aa()}a.cache.e=ab end return ab.c end end end

if not LPH_OBFUSCATED then
	LPH_ATTRIBUTES = function(...) end
	VM = function(...)
		return ...
	end
	NONE = "NONE"
	LPH_NO_UPVALUES = function(aa)
		return function(...)
			return aa(...)
		end
	end
	LPH_ENCSTR = function(...)
		return ...
	end
	LPH_ENCNUM = function(...)
		return ...
	end
	LPH_ENCFUNC = function(aa, ab, ac)
		if ab ~= ac then
			return print("LPH_ENCFUNC mismatch")
		end
		return aa
	end
	LPH_CRASH = function()
		return print(debug.traceback())
	end
end

local aa = game:GetService("HttpService")

local function ab()
    return game:GetService("RbxAnalyticsService"):GetClientId()
end

gethwid = gethwid or ab

local ac = request({
    Url = "https://auth.rbxkey.store/api/auth/verify",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = aa:JSONEncode({
        key = getgenv().script_key or nil,
        executor = identifyexecutor(),
        fingerprint = gethwid()
    })
})

local ad = aa:JSONDecode(ac.Body)

la_is_premium = true

local ae = {
	ragebot = true, ragebotautoreload = true, ragebotwallbang = true,
	walkspeedenabled = true, jumppowerenabled = true, omnisprint = true,
	nohurtslowdown = true, antiaimpitch = true, gunup = true, antiaimspin = true,
	antisuppression = true, antiflashbang = true, autoheal = true, instantheal = true,
	nobandageslowdown = true, fastrevive = true, carmods = true,
}
local af = {
	walkspeed = true, jumppower = true, antiaimpitchangle = true, antiaimspinspeed = true,
	autohealmindamage = true,
}

do
	local ag = game:GetService("Players").LocalPlayer
	ag = ag and ag:FindFirstChild("PlayerScripts")
	ag = ag and ag:FindFirstChild("PlayerModule")
	local ah = ag and getscriptclosure and getscriptclosure(ag)
	local ai = debug.getprotos or getprotos
	if type(ah) == "function" and ai then
		local aj, ak = pcall(ai, ah)
		if aj then
			for al, am in ak do
				if type(am) == "function" then
					local an = {}
					pcall(function()
						an = debug.getconstants(am)
					end)
					local ao, ap, aq, ar, as = false, false, false, false, false
					for at, au in an do
						if au == "StreamingHint" then ao = true end
						if au == "Animator" then ap = true end
						if au == "MovementPing" then as = true end
						if au == "task" then aq = true end
						if au == "random" then ar = true end
					end
					local at = 0
					pcall(function()
						at = debug.getinfo(am).nups or 0
					end)
					if ao or ap or as or (aq and ar and at == 3) then
						pcall(hookfunc, am, function() end)
					elseif not as then
						local au, av = pcall(ai, am)
						if au then
							for aw, ax in av do
								if type(ax) == "function" then
									local ay = {}
									pcall(function()
										ay = debug.getconstants(ax)
									end)
									for az, aA in ay do
										if aA == "MovementPing" then
											pcall(hookfunc, ax, function() end)
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

local ag = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/"

Library = loadstring(game:HttpGet(ag .. "Library.lua"))()
local ah = loadstring(game:HttpGet(ag .. "addons/ThemeManager.lua"))()
local ai = loadstring(game:HttpGet(ag .. "addons/SaveManager.lua"))()

local aj = game:GetService("Players")
local ak = game:GetService("RunService")
local al = game:GetService("UserInputService")
local am = aj.LocalPlayer
local an = game:GetService("ReplicatedStorage")
local ao = an.Client
local ap = ao.Tools
local aq = ap.Weapon.controllers

local ar = require(aq.RecoilController)
local as = require(aq.AimController)
local at = require(ap.Weapon.Muzzle.firemodes.FireController)
local au = require(an:WaitForChild("Shared"):WaitForChild("Ballistics"):WaitForChild("Trajectory"))
local av = require(ao:WaitForChild("Character"):WaitForChild("InventoryController"))
local aw = require(ao:WaitForChild("GGCameraShaker"))

local function ax(ay, az)
	LPH_ATTRIBUTES(VM(NONE))
	if ae[ay] and la_is_premium ~= true then return false end
	local aA = Toggles and Toggles[ay]
	if aA and aA.Value ~= nil then
		return aA.Value
	end
	return az
end

local function ay(az, aA)
	LPH_ATTRIBUTES(VM(NONE))
	if af[az] and la_is_premium ~= true then return aA end
	local aB = Options and Options[az]
	if aB and aB.Value ~= nil then
		return aB.Value
	end
	return aA
end

local az = {
	instantads = true,
	aimanywhere = true,
	noadsslowdown = true,
	omnisprint = false,
	nohurtslowdown = false,
	gunup = false,
	antiaimpitch = false,
	lightingoverride = false,
	forceauto = true,
	silentenabled = true,
	turretsilentenabled = true,
	aimbotenabled = false,
	snaplines = false,
	fovdraw = false,
	silentteamcheck = true,
	silentvisiblecheck = false,
	silentdistancecheck = false,
	silentmaxdistance = 500,
	silenttarget = "Head",
	fovenabled = false,
	fovsize = 100,
	nodrop = false,
	instantbullet = false,
	rpgprediction = true,
	instantequip = false,
	ragebot = false,
	ragebotwallbang = false,
	ragebotautoreload = false,
	ragebottpaura = false,
	manipulation = false,
	manipulationdistance = 1,
	manipulationdepth = "Low",
	autoheal = false,
	instantheal = false,
	fastrevive = false,
	carmods = false,
	antisuppression = false,
	antiflashbang = false,
	antiaimspin = false,
	ESPMaster = false,
}

local function aA(aB)
    return clonefunction and clonefunction(aB) or aB
end

local aB = {}
aB.target = nil


local aC = a.a().create({
	title = "Cold War - vault.cc",
	folder = "VaultCC/ColdWar",
	tabs = { "Combat", "ESP", "Visuals", "Misc", "Settings" },
	keybind = "MenuKeybind",
	ignore = { "MenuKeybind" },
	beforeLoad = function(aC, aD)
		if aC.misc and aC.misc.bindSettings then
			aC.misc.bindSettings(aD)
		end
	end,
})
local aD = a.b()
local aE = a.c()
local aF = a.d()
local aG = a.e()

local aH = {
	Players = aj,
	RunService = ak,
	UserInputService = al,
	LocalPlayer = am,
	RS = an,
	Client = ao,
	Tools = ap,
	WeaponControllers = aq,
	RecoilController = ar,
	AimController = as,
	FiremodeController = at,
	Trajectory = au,
	InventoryController = av,
	CameraShaker = aw,
	cloneOriginal = aA,
	Library = Library,
	ThemeManager = ah,
	SaveManager = ai,
	HttpService = aa,
	paidToggleKeys = ae,
	paidOptionKeys = af,
	flags = az,
	tv = ax,
	ov = ay,
	util = aB,
	manipulation = aD,
}

aC.build(aH)
aE.build(aH)
aF.build(aH)
aG.build(aH)

for aI in az do
	local aJ = Toggles and Toggles[aI]
	if aJ then
		aJ:OnChanged(function(aK)
			if ae[aI] and la_is_premium ~= true then
				az[aI] = false
				return
			end
			az[aI] = aK
		end)
		if aJ.Value ~= nil then
			az[aI] = (ae[aI] and la_is_premium ~= true) and false or aJ.Value
		end
	else
		local aK = Options and Options[aI]
		if aK and aK.Value ~= nil then
			aK:OnChanged(function(aL)
				if af[aI] and la_is_premium ~= true then
					return
				end
				az[aI] = aL
			end)
			az[aI] = aK.Value
		end
	end
end

aC.finish(aH)

local aI = false
local aJ
local function aK()
	if aI then
		return
	end
	aI = true
	if aJ then
		aJ:Disconnect()
		aJ = nil
	end
	pcall(function()
		ak:UnbindFromRenderStep("cwmain")
	end)
	if aH.visuals and aH.visuals.unload then
		aH.visuals.unload()
	end
	if aH.misc and aH.misc.unload then
		aH.misc.unload()
	end
	if aH.combat and aH.combat.unload then
		aH.combat.unload()
	end
	if aH.ESP then
		pcall(function()
			aH.ESP:Unload()
		end)
	end
end

aJ = ak.Heartbeat:Connect(function(aL)
	LPH_ATTRIBUTES(VM(NONE))
	if az.silentenabled or az.turretsilentenabled or az.aimbotenabled or az.snaplines then
		aH.combat.targetStep()
	end
	if la_is_premium then
		if az.antiaimspin then
			aH.misc.movementStep(aL)
		end
		if az.autoheal then
			aH.combat.autoHealStep(aL)
		end
		if az.fastrevive then
			aH.combat.fastReviveStep(aL)
		end
		if az.carmods then
			aH.combat.carModsStep(aL)
		end
		if az.antisuppression or az.antiflashbang then
			aH.misc.antiEffectsStep(aL)
		end
		if az.ragebot or az.ragebottpaura then
			aH.combat.rageSchedulerStep(aL)
		end
	end
	if az.ESPMaster then
		aH.visuals.teamFilterStep(aL)
	end
	if az.lightingoverride then
		aH.visuals.applyLighting()
	end
end)

ak:BindToRenderStep("cwmain", Enum.RenderPriority.Last.Value + 10, function()
	LPH_ATTRIBUTES(VM(NONE))
	if az.aimbotenabled then
		aH.combat.aimbotRenderStep()
	end
	if az.fovdraw then
		aH.combat.fovRenderStep()
	end
	if az.snaplines then
		aH.combat.snapRenderStep()
	end
end)

Library:OnUnload(aK)
Library:Notify("Cold War loaded, made with love by vaultt. <3")
