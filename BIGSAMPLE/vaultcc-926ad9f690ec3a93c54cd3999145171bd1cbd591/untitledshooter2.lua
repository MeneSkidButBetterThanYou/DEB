-- dont skid too much please, use it to learn if you want though :)
-- this game detects when you change gun settings (self.settings) so try not to do that

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Exunys-ESP/main/src/ESP.lua"))() -- thx exunys, makes my life much easier <3

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()


ESP.Load()

--[[
TODO:
explore equip function (instant equip maybe)
add option to shoot players through walls by spoofing firepoint position
investigate hooking the projectile function for bullet speed, and just redoing the whole function instead of parameter spoofing since that gets dtc
]]

local silentSettings = {
    Enabled = true,
    AlwaysShoot = true,
    RPMMultiplier = 2,
    NoRecoil = true,
    SpreadMultiplier = 0,
    targetPart = "Head",
    BurstCooldownMultiplier = 1,
    NoDrop = true,
    ReloadTimeMultiplier = 0.1,
    AimTimeMultiplier = 0.01, -- cant be 0, gun cant equip for sum reason then
    InfiniteAmmo = true,
    SpoofMuzzle = true,
    EquipSpeedMultiplier = 0.01,
}


local mouse = LocalPlayer:GetMouse()

local function isFirstPerson()
    local character = LocalPlayer.Character
    if not character then return false end

    local head = character:FindFirstChild("Head")
    if not head then return false end

    -- if camera is very close to head, you're in first person
    return (Camera.CFrame.Position - head.Position).Magnitude < 1
end

local function getClosestPlayerToCursor()
    local closestPlayer = nil
    local shortestDistance = math.huge

    -- decide aiming point
    local screenPoint
    if isFirstPerson() then
        local viewportSize = Camera.ViewportSize
        screenPoint = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    else
        screenPoint = Vector2.new(mouse.X, mouse.Y)
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local character = player.Character
            local root = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")

            if root and humanoid and humanoid.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)

                if onScreen then
                    local playerPos = Vector2.new(screenPos.X, screenPos.Y)
                    local distance = (screenPoint - playerPos).Magnitude

                    if distance < shortestDistance then
                        shortestDistance = distance
                        closestPlayer = player
                    end
                end
            end
        end
    end

    return closestPlayer
end

local gc = getgc()

local fire_func = nil
local proj_func = nil
local reload_func = nil
local aim_func = nil
local equip_func = nil

for _,v in pairs(gc) do
    if typeof(v) == 'function' and islclosure(v) then
        local dbg = debug.getinfo(v)
        local name = dbg.name
        if dbg.short_src:find("Tool") and name and string.find(name, "fire") then -- fire func (ToolFramework)
            fire_func = v
        elseif dbg.short_src:find("Tool") and name and string.find(name, "reload") then -- reload func (ToolFramework)
            reload_func = v
        elseif dbg.short_src:find("Tool") and name and string.find(name, "aim") then -- aim func (ToolFramework)
            aim_func = v
        elseif dbg.short_src:find("Tool") and name and string.find(name, "equip") then -- aim func (ToolFramework)
            equip_func = v
        elseif dbg.short_src:find("Projectile") and name and string.find(name, "fire") then -- fire func (ProjectileFramework)
            proj_func = v
        end
    end
end

local old; old = hookfunction(fire_func, function(...) -- silent aim, always shoot, rpmmultiplier, no recoil, spread multiplier, burst cooldown mult
    local args = {...}

    local settings = silentSettings

    local targetplr = getClosestPlayerToCursor()
    local target = nil

    if targetplr then
        targetchar = targetplr.Character
        if targetchar then
            target = targetchar:FindFirstChild(settings.targetPart) or targetchar:FindFirstChild("HumanoidRootPart")
        end
    end

    local self = args[1]
    local inputBegan = args[2]

    local uv = debug.getupvalues(old)
    local PlayerModule = uv[1]
    local rng = uv[2]
    local ProjectileFramework = uv[3]
    local Assets = uv[4]
    local MuzzleHandler = uv[5]
    local FastWait = uv[6]
    local UserInputService = uv[7]

    if self.equipped then
        if self.actuallyEquipped then
            if self.reloading and not settings.AlwaysShoot then
                return
            elseif self.checkingAmmo and not settings.AlwaysShoot then
                return
            elseif PlayerModule.running and not settings.AlwaysShoot then
                return
            else
                self.firing = inputBegan
                if inputBegan then
                    if self.variables.magazine <= 0 then
                        self.playSound("dryfire")
                        self.playAnim("dryfire")
                        return
                    else
                        local function doShot()
                            local fireInterval = 60 / self.getFiremode().rpm / settings.RPMMultiplier
                            if self.wallShot() then
                                if tick() - (self.lastShot or 0) < fireInterval then
                                    return
                                elseif self.variables.magazine > 0 then
                                    local vars = self.variables
                                    if not settings.InfiniteAmmo then
                                        vars.magazine = vars.magazine - 1 -- remove ammo, maybe would work if i change?
                                    end
                                    if self.variables.magazine == 0 and self.settings.gunSlidelockEnabled then
                                        self.playAnim("firelast")
                                        self.playAnim("slidelock")
                                    else
                                        self.playAnim("fire")
                                    end
                                    local isSuppressed, isSuppressed = self.getAttachment("Barrel")
                                    if isSuppressed then
                                        if isSuppressed then
                                            isSuppressed = isSuppressed.barrelType == "Suppressor"
                                        end
                                    end
                                    self.playSound(isSuppressed and "fire-s" or "fire")
                                    if not settings.NoRecoil then
                                        task.spawn(self.recoilCamera)
                                    end
                                    if not self.settings.gunPump then
                                        task.spawn(self.ejectShell)
                                    end
                                    local firePoint = self.toolModel.RootPart:FindFirstChild("firePoint")
                                    local muzzlePos = firePoint.WorldPosition - firePoint.WorldCFrame.lookVector * 5
                                    local rayParams = RaycastParams.new()
                                    rayParams.FilterDescendantsInstances = { PlayerModule.character, PlayerModule.camera }
                                    local muzzleRay = workspace:Raycast(firePoint.WorldPosition, -firePoint.WorldCFrame.lookVector * 5, rayParams)
                                    if muzzleRay and muzzleRay.Instance then
                                        muzzlePos = muzzleRay.Position
                                    end
                                    if settings.SpoofMuzzle then
                                        muzzlePos = target.Position + Vector3.new(0,0.2,0)
                                    end
                                    local airborneSpread = PlayerModule.humanoid:GetState() == Enum.HumanoidStateType.Freefall and 4 or 0
                                    local movementSpread = (PlayerModule.humanoidRootPart.Velocity * Vector3.new(1, 0, 1)).magnitude * 0.1
                                    local _, sightSettings = self.getAttachment("Sight")
                                    local baseSpread = self.settings.gunSpread or 1
                                    local aimSpreadReduction = self.aiming and (sightSettings.aimSpreadRedution or self.settings.aimSpreadRedution or 0.25) or 0
                                    local crouchMult = PlayerModule.crouching and 0.5 or 1
                                    local selfRef = self
                                    local newSpread = (self.builtSpread or 0) + 0.18 - 0.04
                                    local maxSpread = baseSpread * 2
                                    selfRef.builtSpread = math.min(newSpread, maxSpread)
                                    local spreadEasingMult
                                    if self.easingEnabled then
                                        local shotFraction = (self.shotCount - 1) / 8
                                        local clampedFraction = math.clamp(shotFraction, 0, 1)
                                        spreadEasingMult = clampedFraction * clampedFraction * (3 - clampedFraction * 2) * -1.05 + 1.6
                                    else
                                        spreadEasingMult = 1
                                    end
                                    local totalSpread = ((baseSpread * (1 - aimSpreadReduction) * crouchMult + airborneSpread + movementSpread) * spreadEasingMult + self.builtSpread) * settings.SpreadMultiplier
                                    local crosshairImpulse = totalSpread * 3.5
                                    local crosshairImpulseClamped = math.clamp(crosshairImpulse, 10, 55)
                                    self.springs.crosshair:Impulse(crosshairImpulseClamped)
                                    local bulletDirs = {}
                                    for _ = 1, self.settings.gunBulletsPerShot do
                                        local muzzlePosition = settings.SpoofMuzzle and (target.Position + Vector3.new(0, 0.2, 0)) or firePoint.WorldPosition
                                        local spinCFrame = CFrame.new(Vector3.new(), firePoint.WorldCFrame.lookVector) * CFrame.fromOrientation(0, 0, rng:NextNumber(0, 6.283185307179586))
                                        if settings.Enabled then -- the actual silent aim
                                            local aimDir = (target.Position - muzzlePosition).Unit
                                            spinCFrame = CFrame.new(Vector3.new(), aimDir) * CFrame.fromOrientation(0, 0, rng:NextNumber(0, 6.283185307179586))
                                        end
                                        local fromOrientation = CFrame.fromOrientation
                                        local randAngle = rng:NextNumber(-totalSpread, totalSpread)
                                        local bulletDir = (spinCFrame * fromOrientation(math.rad(randAngle), 0, 0)).LookVector
                                        bulletDirs[#bulletDirs + 1] = bulletDir
                                    end
                                    ProjectileFramework:fire(muzzlePos, bulletDirs, self.settings, PlayerModule.character, {})
                                    local muzzlePoint = self.toolModel.RootPart:FindFirstChild("muzzlePoint")
                                    if muzzlePoint then
                                        local muzzleFlashFolder = isSuppressed and Assets.Framework.Particles.MuzzleFlash.Suppressed or Assets.Framework.Particles.MuzzleFlash.Unsuppressed
                                        MuzzleHandler:visualize(muzzlePoint, self.settings.gunMuzzleFlashParticlesEnabled and muzzleFlashFolder, {
                                            ["enabled"] = self.settings.gunMuzzleFlashLightEnabled,
                                            ["range"] = self.settings.gunMuzzleFlashLightRange,
                                            ["brightness"] = self.settings.gunMuzzleFlashLightBrightness,
                                            ["color"] = self.settings.gunMuzzleFlashLightColor,
                                            ["lifetime"] = self.settings.gunMuzzleFlashLightLifetime
                                        }, nil)
                                    end
                                    task.spawn(function()
                                        Assets.Events.Remotes.SyncAmmo:FireServer(self.variables.magazine, self.variables.reserve, self.tool)
                                    end)
                                    self.lastShot = tick()
                                end
                            else
                                return
                            end
                        end
                        local fireMode = self.getFiremode()
                        if fireMode.type == "semi" then
                            task.spawn(function()
                                doShot()
                            end)
                            return
                        elseif fireMode.type == "burst" then
                            task.spawn(function()
                                local burstCount = fireMode.burstCount or 3
                                local burstDelay = fireMode.burstDelay or 60 / (fireMode.rpm * 2)
                                if settings.RPMMultiplier > 1 then
                                    burstDelay = burstDelay / settings.RPMMultiplier
                                end
                                if tick() - (self.lastBurstShot or 0) < ((fireMode.burstCooldown or 0.35) * settings.BurstCooldownMultiplier) then
                                    return
                                end
                                self.lastBurstShot = tick()
                                for shotIdx = 1, burstCount do
                                    if not self.equipped then
                                        break
                                    end
                                    doShot()
                                    if shotIdx < burstCount then
                                        task.wait(burstDelay)
                                    end
                                end
                            end)
                        elseif fireMode.type == "auto" then
                            task.spawn(function()
                                repeat
                                    FastWait()
                                    doShot()
                                until not (self.firing and self.equipped)
                                self.builtSpread = 0
                                self.shotCount = 0
                                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                                    PlayerModule.sprint(true)
                                end
                            end)
                        end
                    end
                else
                    return
                end
            end
        else
            return
        end
    else
        return
    end
end)

local oldp; oldp = hookfunction(proj_func, function(...) -- no drop, can also do projectile velocity
    local args = {...}

    if args[5].Name ~= LocalPlayer.Name then
        return oldp(unpack(args))
    end

    local settings = silentSettings
--[[
    if args[4].projectileAcceleration then
        args[4].projectileAcceleration *= settings.BulletSpeedMultiplier
    end
    if args[4].projectileVelocity then
        args[4].projectileVelocity *= settings.BulletSpeedMultiplier
    end
    --]]
    if settings.NoDrop and args[4].projectileAcceleration then
        args[4].projectileAcceleration = Vector3.new(args[4].projectileAcceleration.X, 0, args[4].projectileAcceleration.Z)
    elseif settings.NoDrop then
        args[4].projectileAcceleration = Vector3.new(0, 0, 0)
    end


    return oldp(unpack(args))
end)

local oldf; oldf = hookfunction(reload_func, function(...) -- reload time multiplier,
    local args = {...}

    local settings = silentSettings

    local self = args[1]
    local inputBegan = args[2]

    local uv = getupvalues(oldf)

    local PlayerModule = uv[1]
    local UserInputService = uv[2]
    local RenderStepped = uv[3]
    local Assets = uv[4]

    self.reloading2 = inputBegan
    if inputBegan then
        if self.equipped then
            if self.actuallyEquipped then
                if self.reloading then
                    return
                elseif self.checkingAmmo then
                    return
                elseif PlayerModule.running then
                    return
                elseif self.variables.reserve == 0 then
                    return
                elseif self.variables.magazine ~= self.settings.gunMagazineCapacity then
                    task.spawn(function()
                        self.firing = false
                        self.aiming = false
                        self.reloading = true

                        local mult = settings.ReloadTimeMultiplier or 1
                        local gunReloadTime = (self.settings.gunReloadTime or 0) * mult
                        local gunTacticalReloadTime = (self.settings.gunTacticalReloadTime or 0) * mult
                        local GunEmptyReloadTime = self.settings.GunEmptyReloadTime and (self.settings.GunEmptyReloadTime * mult) or gunReloadTime
                        local GunTacReloadTime = self.settings.GunTacReloadTime and (self.settings.GunTacReloadTime * mult) or gunTacticalReloadTime                        local gunClipInTime = (self.settings.gunClipInTime or 0) * mult
                        local gunClipInLastTime = (self.settings.gunClipInLastTime or 0) * mult
                        local gunClipInPreReloadTime = (self.settings.gunClipInPreReloadTime or 0) * mult

                        if self.initialSensitivity then
                            UserInputService.MouseDeltaSensitivity = self.initialSensitivity
                            self.initialSensitivity = nil
                        end
                        local isTactical = self.settings.gunTacticalReloadEnabled
                        if isTactical then
                            isTactical = self.variables.magazine > 0
                        end
                        self.playSound(isTactical and "tacticalreload" or "emptyreload")
                        PlayerModule.toggleBackpack(false)
                        if self.settings.gunClipInReload then
                            if self.settings.gunClipInPreReloadEnabled then
                                self.playAnim("prereload")
                                if isTactical and GunTacReloadTime then
                                    self.setAnimSpeed("prereload", 1 / GunTacReloadTime)
                                elseif not isTactical and GunEmptyReloadTime then
                                    self.setAnimSpeed("prereload", 1 / GunEmptyReloadTime)
                                end
                                local preReloadEnd = tick() + gunClipInPreReloadTime
                                repeat
                                    RenderStepped:Wait()
                                until preReloadEnd < tick() or not self.equipped
                            end
                            if self.equipped then
                                local bulletsNeeded = self.settings.gunMagazineCapacity - self.variables.magazine
                                local reserveAmmo = self.variables.reserve
                                local bulletsToLoad = math.min(bulletsNeeded, reserveAmmo)
                                for bulletIdx = 1, bulletsToLoad do
                                    local clipInsertEnd = tick() + (bulletIdx == bulletsToLoad and gunClipInLastTime or gunClipInTime)
                                    self.playAnim("clipinsert")
                                    if isTactical and GunTacReloadTime then
                                        self.setAnimSpeed("clipinsert", 1 / GunTacReloadTime)
                                    elseif not isTactical and GunEmptyReloadTime then
                                        self.setAnimSpeed("clipinsert", 1 / GunEmptyReloadTime)
                                    end
                                    self.playSound("clipinsert")
                                    repeat
                                        RenderStepped:Wait()
                                    until clipInsertEnd < tick() or not self.equipped
                                    if not self.equipped then
                                        break
                                    end
                                    local vars = self.variables
                                    vars.magazine = vars.magazine + 1
                                    local vars = self.variables
                                    vars.reserve = vars.reserve - 1
                                    if not self.reloading2 then
                                        break
                                    end
                                end
                                self.stopAnim("clipinsert")
                            end
                        end
                        local reloadEnd = tick() + (isTactical and gunTacticalReloadTime or gunReloadTime)
                        if isTactical then
                            self.playAnim("tacticalreload")
                            if GunTacReloadTime then
                                self.setAnimSpeed("tacticalreload", 1 / GunTacReloadTime)
                            end
                        else
                            self.playAnim("reload")
                            if GunEmptyReloadTime then
                                self.setAnimSpeed("reload", 1 / GunEmptyReloadTime)
                            end
                        end
                        self.stopAnim("slidelock")
                        if self.equipped then
                            repeat
                                RenderStepped:Wait()
                            until reloadEnd < tick() or not self.equipped
                        end
                        PlayerModule.toggleBackpack(true)
                        self.reloading = false
                        if self.equipped then
                            if not self.settings.gunClipInReload then
                                local bulletsNeeded = self.settings.gunMagazineCapacity - self.variables.magazine
                                local reserveAmmo = self.variables.reserve
                                local bulletsToLoad = math.min(bulletsNeeded, reserveAmmo)
                                self.variables.magazine = self.variables.magazine + bulletsToLoad
                                self.variables.reserve = self.variables.reserve - bulletsToLoad
                            end
                            task.spawn(function()
                                Assets.Events.Remotes.SyncAmmo:FireServer(self.variables.magazine, self.variables.reserve, self.tool)
                            end)
                            if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                                self:aim(true)
                            end
                        end
                    end)
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end)

local olda; olda = hookfunction(aim_func, function(...) -- aim time multiplier
    local args = {...}

    local settings = silentSettings

    local self = args[1]
    local inputBegan = args[2]

    local uv = getupvalues(olda)
    local PlayerModule = uv[1]
    local UserInputService = uv[2]
    local PlayersService = uv[3]
    local Assets = uv[4]
    local RenderStepped = uv[5]
    local RobloxUtils = uv[6]

    if self.equipped then
        if self.actuallyEquipped then
            if self.reloading then
                return
            elseif self.checkingAmmo then
                return
            elseif PlayerModule.running then
                return
            elseif PlayerModule.firstPerson() then
                self.aiming = inputBegan
                if self.aiming then
                    task.spawn(function()
                        local aimTime = (self.settings.aimTime and 0.28 * self.settings.aimTime or 0.28) * settings.AimTimeMultiplier
                        PlayerModule.springs.aim.t = 1
                        PlayersService.LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
                        PlayerModule.setFOV(0, TweenInfo.new(aimTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
                        local aimInSound = Assets.Framework.Sounds.Character.AimSounds:FindFirstChild("AimIn")
                        if aimInSound then
                            local aimInSoundClone = aimInSound:Clone()
                            aimInSoundClone.Parent = self.toolModel.RootPart
                            aimInSoundClone:Play()
                            aimInSoundClone.Ended:Connect(function()
                                game.Debris:AddItem(aimInSoundClone, 1)
                            end)
                        end
                        if PlayerModule.animations and PlayerModule.animations.headTilt then
                            PlayerModule.animations.headTilt:Play()
                        end
                        self.AIMTIME = 1
                        local sightAttachment, sightSettings = self.getAttachment("Sight")
                        local aimSensitivity = sightSettings.aimSensitivity or self.settings.aimSensitivity
                        if aimSensitivity then
                            self.initialSensitivity = UserInputService.MouseDeltaSensitivity
                            local inputSvc = UserInputService
                            inputSvc.MouseDeltaSensitivity = inputSvc.MouseDeltaSensitivity * aimSensitivity
                        end
                        if sightSettings.scopeEnabled then
                            task.spawn(function()
                                if sightSettings.scopeDelay then
                                    local scopeDelayEnd = tick() + sightSettings.scopeDelay
                                    repeat
                                        RenderStepped:Wait()
                                    until scopeDelayEnd < tick() or not (self.equipped and self.aiming)
                                end
                                if self.equipped and self.aiming then
                                    self.scoping = true
                                    for _, sightPart in pairs(sightAttachment:GetDescendants()) do
                                        if sightPart:IsA("BasePart") then
                                            RobloxUtils.tween(sightPart, TweenInfo.new(0.42, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                                ["LocalTransparencyModifier"] = 1
                                            })
                                        end
                                    end
                                end
                            end)
                        end
                        while self.aiming do
                            RenderStepped:Wait()
                        end
                        if sightSettings.scopeEnabled then
                            for _, sightPart in pairs(sightAttachment:GetDescendants()) do
                                if sightPart:IsA("BasePart") then
                                    RobloxUtils.tween(sightPart, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
                                        ["LocalTransparencyModifier"] = 0
                                    })
                                end
                            end
                        end
                        self.scoping = false
                        if PlayerModule.animations and PlayerModule.animations.headTilt then
                            PlayerModule.animations.headTilt:Stop()
                        end
                        self.stopAnim("sprint", 0)
                        PlayerModule.setFOV(0, TweenInfo.new(aimTime, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
                        local aimOutSound = self.equipped and Assets.Framework.Sounds.Character.AimSounds:FindFirstChild("AimOut")
                        if aimOutSound then
                            local aimOutSoundClone = aimOutSound:Clone()
                            aimOutSoundClone.Parent = self.toolModel.RootPart
                            aimOutSoundClone:Play()
                            aimOutSoundClone.Ended:Connect(function()
                                game.Debris:AddItem(aimOutSoundClone, 1)
                            end)
                        end
                        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                            PlayerModule.sprint(true)
                        end
                        PlayerModule.springs.aim.t = 0
                        PlayersService.LocalPlayer.CameraMode = Enum.CameraMode.Classic
                    end)
                elseif self.initialSensitivity then
                    UserInputService.MouseDeltaSensitivity = self.initialSensitivity
                    self.initialSensitivity = nil
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end)

--[[ detected on gunshot after equipping with any multiplier :wilted_rose:
local olde; olde = hookfunction(equip_func, function(...)
    local args = {...}

    local settings = silentSettings

    local self = args[1]
    local tool = args[2]

    local uv = getupvalues(olde)
    local isClient = uv[1]
    local ReplicatedStorage = uv[2]
    local PlayerModule = uv[3]
    local Assets = uv[4]
    local UserInputService = uv[5]
    local RenderStepped = uv[6]
    local ServerStorage = uv[7]

    if tool then
        if isClient then
            self.toolModel = ReplicatedStorage.Assets.Events.Remotes.EquipTool:InvokeServer(tool)
            if self.toolModel then
                self.gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Tool")
                self.crossParts = {
                    self.gui.Crosshair.Main:WaitForChild("HR"),
                    self.gui.Crosshair.Main:WaitForChild("HL"),
                    self.gui.Crosshair.Main:WaitForChild("VD"),
                    self.gui.Crosshair.Main:WaitForChild("VU")
                }
                self.tool = tool
                self.module = tool:FindFirstChild("settings")
                local settingsModule = self.module
                if settingsModule then
                    settingsModule = require(self.module)
                end
                self.settings = settingsModule
                PlayerModule.setSpeed(0)
                self.attachments = self.toolModel:FindFirstChild("Attachments")
                self.sounds = self.toolModel.PrimaryPart:FindFirstChild("sounds")
                local ammoPart = self.settings.gunMagazineCheckEnabled and self.toolModel:FindFirstChild("AmmoPart")
                if ammoPart then
                    self.ammoGUI = Assets.Framework:FindFirstChild("AmmoGUI"):Clone()
                    self.ammoGUI.Parent = ammoPart
                end
                self.loadData()
                self.playAnim("idle")
                if self.settings.GunEquipTime then
                    self.settings.GunEquipTime *= settings.EquipSpeedMultiplier
                end
                if self.settings.equipTime then
                    self.settings.equipTime *= settings.EquipSpeedMultiplier
                end
                if self.settings.gunSlidelockEnabled and self.variables.magazine == 0 then
                    self.playAnim("emptyequip")
                    if self.settings.GunEquipTime then
                        self.setAnimSpeed("emptyequip", 1 / self.settings.GunEquipTime)
                    end
                    self.playAnim("slidelock")
                    if self.settings.gunEmptyIdleEnabled then
                        self.playAnim("emptyidle")
                    end
                else
                    self.playAnim("equip")
                    if self.settings.GunEquipTime then
                        self.setAnimSpeed("equip", 1 / self.settings.GunEquipTime)
                    end
                end
                self.playSound("equip")
                local equipOffsetVal = self.toolModel:FindFirstChild("equipOffset")
                self.equipOffset = equipOffsetVal and equipOffsetVal.Value or CFrame.new()
                PlayerModule.springs.equip.t = 1
                self.airstrikeStep = 0
                self.airstrikeDisabled = false
                self.builtSpread = 0
                if self.initialSensitivity then
                    UserInputService.MouseDeltaSensitivity = self.initialSensitivity
                    self.initialSensitivity = nil
                end
                local toolGui = self.player.PlayerGui:FindFirstChild("Tool")
                if toolGui then
                    toolGui.Crosshair.Visible = true
                end
                UserInputService.MouseIconEnabled = false
                self.equipped = true
                task.spawn(function()
                    --warn('equip started')
                    --warn('equipspeedmult =', settings.EquipSpeedMultiplier)
                    local equipEndTime = tick() + self.settings.equipTime
                    --warn('equipendtime:', equipEndTime, "| tick():", tick())
                    repeat
                        RenderStepped:Wait()
                    until not self.equipped or equipEndTime < tick()
                    if self.equipped then
                        self.actuallyEquipped = true
                        if PlayerModule.running then
                            self.playAnim("sprint")
                            self.stopAnim("idle", 0.35)
                        end
                    end
                end)
                self.springs.crosshair.t = self.settings.crosshairSize or 5
                self.springs.crosshairScale.t = 1
                self.firemodeIndex = 1
            end
        else
            local v268 = tool:FindFirstChild("settings")
            local v269
            if v268 then
                v269 = require(v268)
            else
                v269 = v268
            end
            if v269 then
                self.tool = tool
                self.module = v268
                self.settings = v269
                self.toolModel = ServerStorage.ServerAssets.Items:FindFirstChild(self.settings.name)
                if self.toolModel then
                    self.toolModel = self.toolModel:Clone()
                    self.toolModel.PrimaryPart = self.toolModel:FindFirstChild("RootPart")
                    for _, v270 in pairs(self.toolModel:GetDescendants()) do
                        if v270:IsA("BasePart") then
                            v270.CanCollide = false
                            v270.CanTouch = false
                        end
                    end
                    self.toolModel.Name = "toolModel"
                    self.toolModel.Parent = self.character
                    local v271 = { "Right Arm" }
                    if v269.gripArm then
                        v271 = v269.gripArm == "Left" and { "Left Arm" } or (v269.gripArm == "Right" and { "Right Arm" } or (v269.gripArm == "Both" and { "Left Arm", "Right Arm" } or v271))
                    end
                    for _, v272 in pairs(v271) do
                        local v273 = self.character:FindFirstChild(v272)
                        if v273 then
                            local v274 = v273:FindFirstChild("toolGrip")
                            if not v274 then
                                v274 = Instance.new("Motor6D")
                                v274.Name = "toolGrip"
                                v274.Part0 = v273
                                v274.Parent = v273
                            end
                            v274.Part1 = self.toolModel.RootPart
                        end
                    end
                    self.variables = self.tool:FindFirstChild("variables")
                    if not self.variables then
                        self.variables = Instance.new("Folder")
                        self.variables.Name = "variables"
                        self.variables.Parent = self.tool
                        local v275 = {}
                        local v276 = self.settings.gunEnabled
                        if v276 then
                            v276 = self.settings.gunMagazineCapacity ~= (1 / 0) and {
                                ["name"] = "magazine",
                                ["class"] = "NumberValue",
                                ["value"] = self.settings.gunMagazineCapacity
                            } or false
                        end
                        v275[1] = v276
                        local v277 = self.settings.gunEnabled
                        if v277 then
                            local v278 = self.settings.gunLimitedAmmo
                            v277 = v278 and {
                                ["name"] = "reserve",
                                ["class"] = "NumberValue",
                                ["value"] = self.settings.gunReserveCapacity
                            } or v278
                        end
                        v275[2] = v277
                        v275[3] = {
                            ["name"] = "easingShootingEnabled",
                            ["class"] = "BoolValue",
                            ["value"] = self.settings.easingShootingEnabled == true
                        }
                        for _, v279 in pairs(v275) do
                            if v279 ~= nil and v279 ~= false then
                                local v280 = Instance.new(v279.class)
                                v280.Name = v279.name
                                v280.Value = v279.value
                                v280.Parent = self.variables
                            end
                        end
                    end
                    self.attachments = self.tool:FindFirstChild("attachments")
                    if not self.attachments then
                        self.attachments = Instance.new("Folder")
                        self.attachments.Name = "attachments"
                        self.attachments.Parent = self.tool
                        for _, v281 in pairs({ "Sight", "Barrel", "Underbarrel" }) do
                            local v282 = Instance.new("StringValue")
                            v282.Name = v281
                            v282.Value = ""
                            v282.Parent = self.attachments
                        end
                    end
                    local v283 = self.toolModel:FindFirstChild("Nodes")
                    for _, v284 in pairs(self.attachments:GetChildren()) do
                        if v284:IsA("StringValue") then
                            local v285 = v284.Value
                            if v285 ~= "" then
                                local v286 = Assets.Framework.Attachments:FindFirstChild(v285)
                                if v286 and v283 then
                                    local v287 = v284.Name == "Sight" and self.toolModel:FindFirstChild("SightRail")
                                    if v287 then
                                        v287.Transparency = 0
                                    end
                                    local v288 = v286:Clone()
                                    local v289 = v288:FindFirstChild("settings")
                                    if v289 then
                                        v289 = require(v289)
                                    end
                                    if v289 then
                                        local v290 = v283:FindFirstChild(v289.type)
                                        if v290 then
                                            local v291 = v288:FindFirstChild("Node")
                                            if v291 then
                                                v288.PrimaryPart = v291
                                                v288.Name = v289.type
                                                for _, v292 in pairs(v288:GetDescendants()) do
                                                    if v292:IsA("BasePart") then
                                                        v292.CanCollide = false
                                                        v292.CanTouch = false
                                                        v292.Anchored = false
                                                        if v292 ~= v291 then
                                                            local v293 = Instance.new("WeldConstraint")
                                                            v293.Part0 = v291
                                                            v293.Part1 = v292
                                                            v293.Name = v292.Name
                                                            v293.Parent = v291
                                                        end
                                                    end
                                                end
                                                local v294 = Instance.new("Weld")
                                                v294.Name = "NodeWeld"
                                                v294.Part0 = v290
                                                v294.Part1 = v291
                                                v294.Parent = v291
                                                v288.Parent = self.toolModel:FindFirstChild("Attachments")
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if self.settings.sounds and #self.settings.sounds > 0 then
                        local v295 = Instance.new("Folder")
                        v295.Name = "sounds"
                        v295.Parent = self.toolModel.PrimaryPart
                        if self.settings.gunLowAmmoEnabled then
                            local v296 = Instance.new("Sound")
                            v296.Name = "lowAmmo"
                            v296.Volume = self.settings.gunLowAmmoVolume or 0.5
                            v296.SoundId = "rbxassetid://" .. self.settings.gunLowAmmoID
                            v296.Parent = v295
                        end
                        for _, v297 in pairs(self.settings.sounds) do
                            local v298 = v295:FindFirstChild(v297.type)
                            if not v298 then
                                v298 = Instance.new("Folder")
                                v298.Name = v297.type
                                v298.Parent = v295
                            end
                            local v299 = Instance.new("Sound")
                            v299.PlaybackSpeed = v297.pitch or 1
                            v299.TimePosition = v297.TimePosition or 0
                            v299.Volume = v297.volume or 0.5
                            v299.SoundId = "rbxassetid://" .. v297.id
                            if v297.type == "fire" or v297.type == "fire-s" then
                                v299.RollOffMinDistance = 100
                                v299.RollOffMaxDistance = 1000
                            else
                                v299.RollOffMaxDistance = 200
                                v299.RollOffMinDistance = 10
                            end
                            v299.Parent = v298
                        end
                    end
                    self.equipped = true
                    return self.toolModel
                end
            end
        end
    else
        return
    end
end)
--]]
local Window = Library:CreateWindow({
    Title = 'vault.cc | Untitled Shooter 2',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local SilentGroup = Tabs.Main:AddLeftGroupbox('Silent Aim Settings')

SilentGroup:AddToggle('SilentEnabled', { Text = 'Enabled', Default = silentSettings.Enabled })
SilentGroup:AddToggle('AlwaysShoot', { Text = 'Always Shoot', Default = silentSettings.AlwaysShoot })
SilentGroup:AddDropdown('TargetPart', {
    Text = 'Target Part',
    Values = {'Head', 'HumanoidRootPart'},
    Default = 1
})
SilentGroup:AddToggle('NoRecoil', { Text = 'No Recoil', Default = silentSettings.NoRecoil })
SilentGroup:AddToggle('NoDrop', { Text = 'No Bullet Drop', Default = silentSettings.NoDrop })
SilentGroup:AddToggle('InfiniteAmmo', { Text = 'Infinite Ammo', Default = silentSettings.InfiniteAmmo })
SilentGroup:AddToggle('SpoofMuzzle', { Text = 'Spoof Muzzle (wallbang)', Default = silentSettings.SpoofMuzzle })

SilentGroup:AddSlider('SpreadMultiplier', { -- 0-1
    Text = 'Spread Amount',
    Default = silentSettings.SpreadMultiplier * 100,
    Min = 0, Max = 100, Rounding = 0, Suffix = '%'
})
--[[
SilentGroup:AddSlider('EquipSpeedMultiplier', { -- 1-100
    Text = 'Equip Speed Multiplier',
    Default = 1 / silentSettings.EquipSpeedMultiplier,
    Min = 1, Max = 100, Rounding = 0, Suffix = 'x'
})
--]]
SilentGroup:AddSlider('RPMMultiplier', { -- 1-10
    Text = 'RPM Multiplier',
    Default = silentSettings.RPMMultiplier,
    Min = 1, Max = 10, Rounding = 1, Suffix = 'x'
})
SilentGroup:AddSlider('BurstCooldownMultiplier', { -- 0.01-1
    Text = 'Burst Cooldown',
    Default = silentSettings.BurstCooldownMultiplier * 100,
    Min = 1, Max = 100, Rounding = 0, Suffix = '%'
})
SilentGroup:AddSlider('ReloadTimeMultiplier', { -- 0.01-1
    Text = 'Reload Time',
    Default = silentSettings.ReloadTimeMultiplier * 100,
    Min = 1, Max = 100, Rounding = 0, Suffix = '%'
})
SilentGroup:AddSlider('AimTimeMultiplier', { -- 0.01-1
    Text = 'Aim Time',
    Default = silentSettings.AimTimeMultiplier * 100,
    Min = 1, Max = 100, Rounding = 0, Suffix = '%'
})

-- Sync Silent Settings to table

Toggles.AlwaysShoot:OnChanged(function() silentSettings.AlwaysShoot = Toggles.AlwaysShoot.Value end)
Toggles.NoRecoil:OnChanged(function() silentSettings.NoRecoil = Toggles.NoRecoil.Value end)
Toggles.NoDrop:OnChanged(function() silentSettings.NoDrop = Toggles.NoDrop.Value end)
Toggles.InfiniteAmmo:OnChanged(function() silentSettings.InfiniteAmmo = Toggles.InfiniteAmmo.Value end)
Toggles.SpoofMuzzle:OnChanged(function() silentSettings.SpoofMuzzle = Toggles.SpoofMuzzle.Value end)
Options.TargetPart:OnChanged(function() silentSettings.targetPart = Options.TargetPart.Value end)
Options.SpreadMultiplier:OnChanged(function() silentSettings.SpreadMultiplier = Options.SpreadMultiplier.Value / 100 end)
Options.RPMMultiplier:OnChanged(function() silentSettings.RPMMultiplier = Options.RPMMultiplier.Value end)
--Options.EquipSpeedMultiplier:OnChanged(function() silentSettings.EquipSpeedMultiplier = 1 / Options.EquipSpeedMultiplier.Value end)
Options.BurstCooldownMultiplier:OnChanged(function() silentSettings.BurstCooldownMultiplier = Options.BurstCooldownMultiplier.Value / 100 end)
Options.ReloadTimeMultiplier:OnChanged(function() silentSettings.ReloadTimeMultiplier = Options.ReloadTimeMultiplier.Value / 100 end)
Options.AimTimeMultiplier:OnChanged(function() silentSettings.AimTimeMultiplier = Options.AimTimeMultiplier.Value / 100 end)

-- ==================== VISUALS TAB - FULL EXUNYS ESP ====================

-- Main ESP Settings
local MainESPGroup = Tabs.Visuals:AddLeftGroupbox('Main ESP')
MainESPGroup:AddToggle('ESPEnabled', { Text = 'ESP Enabled', Default = ESP.Settings.Enabled, Callback = function(v) ESP.Settings.Enabled = v end })
--MainESPGroup:AddToggle('PartsOnly', { Text = 'Parts Only', Default = ESP.Settings.PartsOnly, Callback = function(v) ESP.Settings.PartsOnly = v end })
--MainESPGroup:AddToggle('TeamCheck', { Text = 'Team Check', Default = ESP.Settings.TeamCheck, Callback = function(v) ESP.Settings.TeamCheck = v end })
MainESPGroup:AddToggle('AliveCheck', { Text = 'Alive Check', Default = ESP.Settings.AliveCheck, Callback = function(v) ESP.Settings.AliveCheck = v end })
--MainESPGroup:AddToggle('EnableTeamColors', { Text = 'Enable Team Colors', Default = ESP.Settings.EnableTeamColors, Callback = function(v) ESP.Settings.EnableTeamColors = v end })
--MainESPGroup:AddLabel('Team Color'):AddColorPicker('TeamColor', { Text = 'Team Color', Default = ESP.Settings.TeamColor, Callback = function(v) ESP.Settings.TeamColor = v end })
--MainESPGroup:AddToggle('CachePositions', { Text = 'Cache Positions', Default = ESP.Settings.CachePositions, Callback = function(v) ESP.Settings.CachePositions = v end })
MainESPGroup:AddToggle('EntityESP', { Text = 'Entity ESP', Default = ESP.Settings.EntityESP, Callback = function(v) ESP.Settings.EntityESP = v end })

-- Text ESP
local TextGroup = Tabs.Visuals:AddRightGroupbox('Name / Text ESP')
TextGroup:AddToggle('TextEnabled', { Text = 'Text Enabled', Default = ESP.Properties.ESP.Enabled, Callback = function(v) ESP.Properties.ESP.Enabled = v end })
TextGroup:AddToggle('RainbowText', { Text = 'Rainbow Color', Default = ESP.Properties.ESP.RainbowColor, Callback = function(v) ESP.Properties.ESP.RainbowColor = v end })
TextGroup:AddLabel('Text Color'):AddColorPicker('TextColor', { Text = 'Text Color', Default = ESP.Properties.ESP.Color, Callback = function(v) ESP.Properties.ESP.Color = v end })
TextGroup:AddSlider('TextSize', { Text = 'Text Size', Default = ESP.Properties.ESP.Size, Min = 8, Max = 26, Rounding = 0, Callback = function(v) ESP.Properties.ESP.Size = v end })
TextGroup:AddToggle('TextOutline', { Text = 'Outline', Default = ESP.Properties.ESP.Outline, Callback = function(v) ESP.Properties.ESP.Outline = v end })
TextGroup:AddLabel('Text Outline Color'):AddColorPicker('TextOutlineColor', { Text = 'Outline Color', Default = ESP.Properties.ESP.OutlineColor, Callback = function(v) ESP.Properties.ESP.OutlineColor = v end })
TextGroup:AddToggle('DisplayDistance', { Text = 'Display Distance', Default = ESP.Properties.ESP.DisplayDistance, Callback = function(v) ESP.Properties.ESP.DisplayDistance = v end })
TextGroup:AddToggle('DisplayHealth', { Text = 'Display Health', Default = ESP.Properties.ESP.DisplayHealth, Callback = function(v) ESP.Properties.ESP.DisplayHealth = v end })
TextGroup:AddToggle('DisplayName', { Text = 'Display Name', Default = ESP.Properties.ESP.DisplayName, Callback = function(v) ESP.Properties.ESP.DisplayName = v end })
TextGroup:AddToggle('DisplayDisplayName', { Text = 'Display DisplayName', Default = ESP.Properties.ESP.DisplayDisplayName, Callback = function(v) ESP.Properties.ESP.DisplayDisplayName = v end })
TextGroup:AddToggle('DisplayTool', { Text = 'Display Tool', Default = ESP.Properties.ESP.DisplayTool, Callback = function(v) ESP.Properties.ESP.DisplayTool = v end })
TextGroup:AddToggle('RelativeFontSize', { Text = 'Relative Font Size', Default = ESP.Properties.ESP.RelativeFontSize, Callback = function(v) ESP.Properties.ESP.RelativeFontSize = v end })

-- Tracers
local TracerGroup = Tabs.Visuals:AddLeftGroupbox('Tracers')
TracerGroup:AddToggle('TracerEnabled', { Text = 'Enabled', Default = ESP.Properties.Tracer.Enabled, Callback = function(v) ESP.Properties.Tracer.Enabled = v end })
TracerGroup:AddToggle('RainbowTracer', { Text = 'Rainbow Color', Default = ESP.Properties.Tracer.RainbowColor, Callback = function(v) ESP.Properties.Tracer.RainbowColor = v end })
TracerGroup:AddLabel('TracerColor'):AddColorPicker('TracerColor', { Text = 'Color', Default = ESP.Properties.Tracer.Color, Callback = function(v) ESP.Properties.Tracer.Color = v end })
TracerGroup:AddSlider('TracerThickness', { Text = 'Thickness', Default = ESP.Properties.Tracer.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Tracer.Thickness = v end })
TracerGroup:AddToggle('TracerOutline', { Text = 'Outline', Default = ESP.Properties.Tracer.Outline, Callback = function(v) ESP.Properties.Tracer.Outline = v end })

-- Head Dot
local HeadGroup = Tabs.Visuals:AddRightGroupbox('Head Dot')
HeadGroup:AddToggle('HeadDotEnabled', { Text = 'Enabled', Default = ESP.Properties.HeadDot.Enabled, Callback = function(v) ESP.Properties.HeadDot.Enabled = v end })
HeadGroup:AddToggle('RainbowHeadDot', { Text = 'Rainbow Color', Default = ESP.Properties.HeadDot.RainbowColor, Callback = function(v) ESP.Properties.HeadDot.RainbowColor = v end })
HeadGroup:AddLabel('Head Dot Color'):AddColorPicker('HeadDotColor', { Text = 'Color', Default = ESP.Properties.HeadDot.Color, Callback = function(v) ESP.Properties.HeadDot.Color = v end })
HeadGroup:AddSlider('HeadDotThickness', { Text = 'Thickness', Default = ESP.Properties.HeadDot.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.HeadDot.Thickness = v end })
HeadGroup:AddSlider('HeadDotSides', { Text = 'Sides', Default = ESP.Properties.HeadDot.NumSides, Min = 8, Max = 64, Rounding = 0, Callback = function(v) ESP.Properties.HeadDot.NumSides = v end })
HeadGroup:AddToggle('HeadDotFilled', { Text = 'Filled', Default = ESP.Properties.HeadDot.Filled, Callback = function(v) ESP.Properties.HeadDot.Filled = v end })
HeadGroup:AddToggle('HeadDotOutline', { Text = 'Outline', Default = ESP.Properties.HeadDot.Outline, Callback = function(v) ESP.Properties.HeadDot.Outline = v end })

-- Box
local BoxGroup = Tabs.Visuals:AddLeftGroupbox('Box')
BoxGroup:AddToggle('BoxEnabled', { Text = 'Enabled', Default = ESP.Properties.Box.Enabled, Callback = function(v) ESP.Properties.Box.Enabled = v end })
BoxGroup:AddToggle('RainbowBox', { Text = 'Rainbow Color', Default = ESP.Properties.Box.RainbowColor, Callback = function(v) ESP.Properties.Box.RainbowColor = v end })
BoxGroup:AddLabel('Box Color'):AddColorPicker('BoxColor', { Text = 'Box Color', Default = ESP.Properties.Box.Color, Callback = function(v) ESP.Properties.Box.Color = v end })
BoxGroup:AddSlider('BoxThickness', { Text = 'Thickness', Default = ESP.Properties.Box.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Box.Thickness = v end })
BoxGroup:AddToggle('BoxOutline', { Text = 'Outline', Default = ESP.Properties.Box.Outline, Callback = function(v) ESP.Properties.Box.Outline = v end })
BoxGroup:AddToggle('FillSquare', { Text = 'Fill Box', Default = ESP.Properties.Box.FillSquare, Callback = function(v) ESP.Properties.Box.FillSquare = v end })
BoxGroup:AddLabel('Fill Color'):AddColorPicker('FillColor', { Text = 'Fill Color', Default = ESP.Properties.Box.FillColor, Callback = function(v) ESP.Properties.Box.FillColor = v end })
BoxGroup:AddSlider('FillTransparency', { Text = 'Fill Transparency', Default = ESP.Properties.Box.FillTransparency * 100, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function(v) ESP.Properties.Box.FillTransparency = v/100 end })
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
HealthGroup:AddToggle('HealthBarEnabled', { Text = 'Enabled', Default = ESP.Properties.HealthBar.Enabled, Callback = function(v) ESP.Properties.HealthBar.Enabled = v end })
HealthGroup:AddDropdown('HealthBarPosition', {
    Text = 'Position',
    Values = {'Top', 'Bottom', 'Left', 'Right'},
    Default = ESP.Properties.HealthBar.Position,
    Callback = function(v)
        local map = {Top=1, Bottom=2, Left=3, Right=4}
        ESP.Properties.HealthBar.Position = map[v] or 3
    end
})
HealthGroup:AddSlider('HealthBarThickness', { Text = 'Thickness', Default = ESP.Properties.HealthBar.Thickness, Min = 1, Max = 6, Rounding = 0, Callback = function(v) ESP.Properties.HealthBar.Thickness = v end })
HealthGroup:AddSlider('HealthBarOffset', { Text = 'Offset', Default = ESP.Properties.HealthBar.Offset, Min = 0, Max = 20, Rounding = 0, Callback = function(v) ESP.Properties.HealthBar.Offset = v end })
HealthGroup:AddToggle('HealthBarOutline', { Text = 'Outline', Default = ESP.Properties.HealthBar.Outline, Callback = function(v) ESP.Properties.HealthBar.Outline = v end })

-- Misc Visuals (Chams, Skeleton, Highlight)
local MiscVisuals = Tabs.Visuals:AddLeftGroupbox('Misc Visuals')
MiscVisuals:AddToggle('ChamsEnabled', { Text = 'Chams', Default = ESP.Properties.Chams.Enabled, Callback = function(v) ESP.Properties.Chams.Enabled = v end })
MiscVisuals:AddToggle('RainbowChams', { Text = 'Rainbow Chams', Default = ESP.Properties.Chams.RainbowColor, Callback = function(v) ESP.Properties.Chams.RainbowColor = v end })
MiscVisuals:AddLabel('Chams Color'):AddColorPicker('ChamsColor', { Text = 'Chams Color', Default = ESP.Properties.Chams.Color, Callback = function(v) ESP.Properties.Chams.Color = v end })
MiscVisuals:AddSlider('ChamsTransparency', { Text = 'Chams Transparency', Default = ESP.Properties.Chams.Transparency * 100, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function(v) ESP.Properties.Chams.Transparency = v/100 end })
MiscVisuals:AddToggle('ChamsFilled', { Text = 'Chams Filled', Default = ESP.Properties.Chams.Filled, Callback = function(v) ESP.Properties.Chams.Filled = v end })

MiscVisuals:AddToggle('SkeletonEnabled', { Text = 'Skeleton', Default = ESP.Properties.Skeleton.Enabled, Callback = function(v) ESP.Properties.Skeleton.Enabled = v end })
MiscVisuals:AddToggle('RainbowSkeleton', { Text = 'Rainbow Skeleton', Default = ESP.Properties.Skeleton.RainbowColor, Callback = function(v) ESP.Properties.Skeleton.RainbowColor = v end })
MiscVisuals:AddLabel('Skeleton Color'):AddColorPicker('SkeletonColor', { Text = 'Skeleton Color', Default = ESP.Properties.Skeleton.Color, Callback = function(v) ESP.Properties.Skeleton.Color = v end })
MiscVisuals:AddSlider('SkeletonThickness', { Text = 'Skeleton Thickness', Default = ESP.Properties.Skeleton.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Skeleton.Thickness = v end })

MiscVisuals:AddToggle('HighlightEnabled', { Text = 'Highlight', Default = ESP.Properties.Highlight.Enabled, Callback = function(v) ESP.Properties.Highlight.Enabled = v end })
MiscVisuals:AddToggle('RainbowHighlight', { Text = 'Rainbow Highlight', Default = ESP.Properties.Highlight.RainbowColor, Callback = function(v) ESP.Properties.Highlight.RainbowColor = v end })
MiscVisuals:AddLabel('Fill Color'):AddColorPicker('HighlightFillColor', { Text = 'Fill Color', Default = ESP.Properties.Highlight.FillColor, Callback = function(v) ESP.Properties.Highlight.FillColor = v end })
MiscVisuals:AddSlider('HighlightFillTransparency', { Text = 'Fill Transparency', Default = ESP.Properties.Highlight.FillTransparency * 100, Min = 0, Max = 100, Rounding = 0, Suffix = '%', Callback = function(v) ESP.Properties.Highlight.FillTransparency = v/100 end })
MiscVisuals:AddToggle('HighlightHealthColor', { Text = 'Health-Based Color', Default = ESP.Properties.Highlight.HealthColor, Callback = function(v) ESP.Properties.Highlight.HealthColor = v end })

-- Crosshair
local CrossGroup = Tabs.Visuals:AddRightGroupbox('Crosshair')
CrossGroup:AddToggle('CrosshairEnabled', { Text = 'Enabled', Default = ESP.Properties.Crosshair.Enabled, Callback = function(v) ESP.Properties.Crosshair.Enabled = v end })
CrossGroup:AddToggle('RainbowCrosshair', { Text = 'Rainbow Color', Default = ESP.Properties.Crosshair.RainbowColor, Callback = function(v) ESP.Properties.Crosshair.RainbowColor = v end })
CrossGroup:AddLabel('Color'):AddColorPicker('CrosshairColor', { Text = 'Color', Default = ESP.Properties.Crosshair.Color, Callback = function(v) ESP.Properties.Crosshair.Color = v end })
CrossGroup:AddSlider('CrosshairSize', { Text = 'Size', Default = ESP.Properties.Crosshair.Size, Min = 4, Max = 40, Rounding = 0, Callback = function(v) ESP.Properties.Crosshair.Size = v end })
CrossGroup:AddSlider('CrosshairGap', { Text = 'Gap Size', Default = ESP.Properties.Crosshair.GapSize, Min = 0, Max = 30, Rounding = 0, Callback = function(v) ESP.Properties.Crosshair.GapSize = v end })
CrossGroup:AddSlider('CrosshairThickness', { Text = 'Thickness', Default = ESP.Properties.Crosshair.Thickness, Min = 1, Max = 5, Rounding = 0, Callback = function(v) ESP.Properties.Crosshair.Thickness = v end })
CrossGroup:AddToggle('CrosshairOutline', { Text = 'Outline', Default = ESP.Properties.Crosshair.Outline, Callback = function(v) ESP.Properties.Crosshair.Outline = v end })

CrossGroup:AddToggle('CenterDotEnabled', { Text = 'Center Dot', Default = ESP.Properties.Crosshair.CenterDot.Enabled, Callback = function(v) ESP.Properties.Crosshair.CenterDot.Enabled = v end })
CrossGroup:AddLabel('Dot Color'):AddColorPicker('CenterDotColor', { Text = 'Dot Color', Default = ESP.Properties.Crosshair.CenterDot.Color, Callback = function(v) ESP.Properties.Crosshair.CenterDot.Color = v end })
CrossGroup:AddSlider('CenterDotRadius', { Text = 'Dot Radius', Default = ESP.Properties.Crosshair.CenterDot.Radius, Min = 1, Max = 10, Rounding = 0, Callback = function(v) ESP.Properties.Crosshair.CenterDot.Radius = v end })

-- ==================== CLEAN UNLOAD FUNCTION ====================
Library:OnUnload(function()
    -- Disable all Silent Aim features
    silentSettings.Enabled = false
    silentSettings.AlwaysShoot = false
    silentSettings.NoRecoil = false
    silentSettings.NoDrop = false
    -- Note: Multipliers are left as-is (they don't "enable" anything when off)

    -- Disable all ESP features
    if ESP then
        ESP.Settings.Enabled = false
        ESP.Properties.ESP.Enabled = false
        ESP.Properties.Tracer.Enabled = false
        ESP.Properties.HeadDot.Enabled = false
        ESP.Properties.Box.Enabled = false
        ESP.Properties.HealthBar.Enabled = false
        ESP.Properties.Chams.Enabled = false
        ESP.Properties.Skeleton.Enabled = false
        ESP.Properties.Highlight.Enabled = false
        ESP.Properties.Crosshair.Enabled = false
        ESP.Properties.Crosshair.CenterDot.Enabled = false
    end

    print('vault.cc | Untitled Shooter 2 unloaded <3')
end)

-- ==================== UI SETTINGS ====================
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('vault_cc')
SaveManager:SetFolder('vault_cc/uts2')

SaveManager:BuildConfigSection(Tabs['UI Settings'])
ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()

-- Watermark
Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0
local FPS = 60

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
end)
