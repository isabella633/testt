return {
    Y = function(P1)
        local V1 = P1[5]
        local V2 = P1[7]
        local V3 = P1[0]
        local V4 = P1[2]
        local V5 = P1[3]
        local V6 = P1[6]
        local V7 = P1[4]
        local V8 = P1[8]
        local V9 = P1[1]
        return function(P2)
            if V1[1][V1[3]] then
                return
            end
            xpcall(function()
                local MainKiller, V11, Part
                if not P2.Parent then
                    return
                elseif not P2.Parent.Parent then
                    return
                else
                    local SkinName = P2.Parent.Parent.Name == "Guest1337" and P2.Parent.Parent:GetAttribute("SkinName")
                    if SkinName == "" then
                        SkinName = nil
                    end
                    local V12 = require(V8.Guest1337.Config)
                    local V13 = SkinName and require(V2.Guest1337[SkinName].Config) or V12
                    if P2:IsA("Sound") then
                        if P2.Name == "rbxassetid://109931874166612" and V4.Flags.SilenceRageSFX.CurrentValue then
                            P2:Destroy()
                        end
                        if P2.Name
                            == (V13.Sounds and V13.Sounds.BlockSuccess and V13.Sounds.BlockSuccess
                                or V12.Sounds.BlockSuccess) then
                            local V14 = false
                            if audiochanger_Block_Id and audiochanger_Block_Id ~= "" then
                                V14 = true
                                InterceptAudio(P2, audiochanger_Block_Id)
                            end
                            if audiochanger_Block_File and audiochanger_Block_File ~= "" and not V14 then
                                InterceptAudio(P2, audiochanger_Block_File)
                            end
                        end
                        if P2.SoundId == (V13.Sounds and V13.Sounds.Parry and V13.Sounds.Parry or V12.Sounds.Parry) then
                            local V15 = false
                            if audiochanger_Parry_Id and audiochanger_Parry_Id ~= "" then
                                V15 = true
                                InterceptAudio(P2, audiochanger_Parry_Id)
                            end
                            if audiochanger_Parry_File and audiochanger_Parry_File ~= "" and not V15 then
                                InterceptAudio(P2, audiochanger_Parry_File)
                            end
                        end
                        if P2.SoundId == (V13.Sounds and V13.Sounds.Punch and V13.Sounds.Punch or V12.Sounds.Punch) then
                            local AudiochangerPunchId = audiochanger_Punch_Id
                            local V16 = false
                            if AudiochangerPunchId and audiochanger_Punch_Id ~= "" then
                                InterceptAudio(P2, audiochanger_Punch_Id)
                                V16 = true
                            end
                            if audiochanger_Punch_File and audiochanger_Punch_File ~= "" and not V16 then
                                InterceptAudio(P2, audiochanger_Punch_File)
                            end
                        end
                        MainKiller = V3.MainKiller
                        if MainKiller and P2.Parent.Parent == MainKiller and not IsKiller() then
                            if V9.Character.Name == "007n7" and V4.Flags.AutoCloneToggle.CurrentValue
                                and table.find(V3.Metas.SoundMetas.AutoCloneSounds, P2.SoundId) then
                                V11 = V3.Metas.AttackIdToName[P2.SoundId]
                                if not V11 then
                                    return V5("[auto clone] attack name nil")
                                end
                                Part = Instance.new("Part")
                                Part.Parent = workspace
                                Part.Anchored = true
                                Part.CanCollide = false
                                Part.Transparency = 0.5
                                Part.Color = Color3.fromRGB(255, 0, 0)
                                Part.Material = Enum.Material.Air
                                local V17 = tick()
                                while P2.IsPlaying and tick() - V17 <= V3.HitboxesDuration do
                                    if HasAbilityReady("Clone") then
                                        local HumanoidRootPart = MainKiller.HumanoidRootPart
                                        local HumanoidRootPart2 = V9.Character.HumanoidRootPart
                                        local Magnitude = (HumanoidRootPart2.Position - HumanoidRootPart.Position).Magnitude
                                        local CurrentValue = V4.Flags.NGAutoBlockHitboxCheck.CurrentValue
                                        local V18 = CurrentValue or Magnitude <= V4.Flags.RagingPaceRange.CurrentValue
                                        local V19 = V18
                                        if V18 then
                                            local V20 = Magnitude <= 5
                                            local V21 = V20
                                            V21 = V20 or not V4.Flags.RagingPaceFaceCheck.CurrentValue
                                                or IsFacing2(HumanoidRootPart2, HumanoidRootPart, 0.707, 1)
                                            local V22 = V21
                                            if V21 then
                                                local V23 = not CurrentValue
                                                local function F1()
                                                    local V24 = V3.Metas.HitboxSizesMeta[MainKiller.Name .. V11]
                                                        or V3.AttackHitboxes[MainKiller.Name]
                                                    if not V24.fake then
                                                        local Cframe = (V4.Flags.QueryAutoblock.CurrentValue
                                                                and MainKiller.QueryHitbox
                                                            or MainKiller.HumanoidRootPart).CFrame
                                                        Cframe:ToWorldSpace(CFrame.new(-V24.offset))
                                                        local HumanoidRootPart3 = V9.Character.HumanoidRootPart
                                                        local QueryHitbox = V4.Flags.QueryAutoblock.CurrentValue
                                                                and V9.Character.QueryHitbox
                                                            or HumanoidRootPart3
                                                        local V25 = V24.size
                                                            + HumanoidRootPart3.Size / 2
                                                                * (HumanoidRootPart3.AssemblyLinearVelocity.magnitude
                                                                    / 10)
                                                        Part.Size = V25
                                                        Part.CFrame = Cframe + Cframe.LookVector * (V25.Z / 2)
                                                        return arePartsTouching(Part, QueryHitbox)
                                                    end
                                                end
                                                V22 = V23 or F1()
                                            end
                                            V19 = V22
                                        end
                                        if V19 then
                                            if V4.Flags.AutoBlockMS.CurrentValue > 0 then
                                                V6(V4.Flags.AutoBlockMS.CurrentValue)
                                            end
                                            Clone()
                                        end
                                    end
                                    V7.RenderStepped:Wait()
                                end
                                Part:Destroy()
                                return
                            end
                            if table.find(V3.Metas.SoundMetas.AutoblockSounds, P2.SoundId)
                                and V4.Flags.AutoBlockToggle.CurrentValue and V9.Character.Name == "Guest1337" then
                                local HumanoidRootPart4 = V9.Character.HumanoidRootPart
                                local V26 = tick()
                                while P2.IsPlaying and tick() - V26 <= V3.HitboxesDuration do
                                    if HasAbilityReady("Block") then
                                        if Counter(MainKiller, HumanoidRootPart4, track, tick()) then
                                            break
                                        end
                                        V6()
                                    end
                                    V7.RenderStepped:Wait()
                                end
                            end
                        else
                            return
                        end
                    else
                        return
                    end
                end
            end, function(P3) V5("error in sound tracker:", tostring(P3)) end)
        end
    end,
    x = function(P4)
        local V27 = P4[2]
        local V28 = P4[13]
        local V29 = P4[12]
        local V30 = P4[9]
        local V31 = P4[15]
        local V32 = P4[14]
        local V33 = P4[7]
        local V34 = P4[5]
        local V35 = P4[10]
        local V36 = P4[11]
        local V37 = P4[8]
        local V38 = P4[4]
        local V39 = P4[6]
        local V40 = P4[0]
        local V41 = P4[1]
        local V42 = P4[3]
        return function(P5)
            local Character = V39.Character
            setthreadidentity(8)
            local V43 = #V30
            local Count = 0
            while true do
                Count = 1 + Count
                if not (V43 >= Count) then
                    break
                end
                local V44 = V30[Count](P5, Character)
                setthreadidentity(8)
                if V44 ~= nil then
                    return
                end
            end
            if not V28.InstantStaminaRecover then
                local CurrentValue2 = V42.Flags.MaxPenaltyTime.CurrentValue
                if CurrentValue2 < 2 then
                    V40.timeUntilStaminaRecovers = math.min(V40.timeUntilStaminaRecovers, CurrentValue2)
                end
            end
            local function F2()
                if not Character then
                    return
                end
                if (V40.Stamina ~= V40.MaxStamina or not V42.Flags.AutoSprint.CurrentValue) and not V27._SprintDuringSk8 then
                    return
                end
                if Character.Parent == V37 and V42.Flags.AI_Killer_Toggle.CurrentValue
                    or V27._SprintDuringSk8
                    or not V40.IsSprinting and tick() - V27.RoundStart >= 6
                        and not (V42.Flags.AI_Survivor_Toggle.CurrentValue and V39.Character.Parent == V35)
                        and V40.CanSprint and V40.BindsEnabled then
                    V27:Sprint(true)
                end
            end
            F2()
            for I = #V41, 1, -1 do
                local V45 = I
                xpcall(function()
                    local V46 = V41[V45]
                    local Character2 = V46.Character
                    if not Character2 or not Character2.Parent then
                        V46.HealthBarOutline:Destroy()
                        V46.PlayerFlagsFrame:Destroy()
                        table.remove(V41, V45)
                        return
                    else
                        local HealthBar = V46.HealthBar
                        local HealthBarOutline = V46.HealthBarOutline
                        local HpText = V46.HPText
                        local PlayerFlagsFrame = V46.PlayerFlagsFrame
                        local HumanoidRootPart5 = Character2:FindFirstChild("HumanoidRootPart")
                        local Humanoid = Character2:FindFirstChild("Humanoid")
                        local GetPlayerFromCharacter = V31:GetPlayerFromCharacter(Character2)
                        if not (HumanoidRootPart5 and HumanoidRootPart5.Parent and Humanoid and Humanoid.Parent) then
                            HealthBar:Destroy()
                        else
                            local V47, V48 = V34:WorldToScreenPoint(HumanoidRootPart5.Position)
                            if V42.Flags[V46.ToggleFlag].CurrentValue
                                and V48
                                and (V34.CFrame.Position - HumanoidRootPart5.Position).Magnitude
                                    <= _G.ESP_HPBAR_MIN_MAGNITUDE then
                                local V49 = V34.ViewportSize.Y / 2 / (V47.Z * math.tan(math.rad(V34.FieldOfView) / 2))
                                local V50 = 5 * V49
                                HealthBarOutline.Visible = true
                                HealthBar.Size = UDim2.fromScale(1, 1 - Humanoid.Health / Humanoid.MaxHealth)
                                HealthBarOutline.Size = UDim2.fromOffset(3, V50)
                                HealthBarOutline.Position = UDim2.fromOffset(V47.X - 1.8 * V49, V47.Y - V50 / 2)
                                HpText.Text = V42.Flags.HealthBarStyle.CurrentOption[1] == "Percent"
                                        and math.ceil(Humanoid.Health / Humanoid.MaxHealth * 100) .. "%"
                                    or tostring(math.ceil(Humanoid.Health))
                                if GetPlayerFromCharacter then
                                    PlayerFlagsFrame.Visible = true
                                    PlayerFlagsFrame.Size = UDim2.fromOffset(V50 / 3, V50)
                                    PlayerFlagsFrame.Position = UDim2.fromOffset(V47.X + 1.8 * V49, V47.Y - V50 / 2)
                                    if V42.Flags.EspShowItems.CurrentValue then
                                        local Backpack = GetPlayerFromCharacter.Backpack
                                        PlayerFlagsFrame.BloxyCola.Visible = Backpack:FindFirstChild("BloxyCola") ~= nil
                                        local Backpack2 = GetPlayerFromCharacter.Backpack
                                        PlayerFlagsFrame.Medkit.Visible = Backpack2:FindFirstChild("Medkit") ~= nil
                                    else
                                        PlayerFlagsFrame.BloxyCola.Visible = false
                                        PlayerFlagsFrame.Medkit.Visible = false
                                    end
                                    if V42.Flags.EspShowDevice.CurrentValue then
                                        PlayerFlagsFrame.Device.Visible = true
                                        local Device = PlayerFlagsFrame.Device
                                        Device.Image = V36[GetPlayerFromCharacter:GetAttribute("Device")] or V36.Unknown
                                    else
                                        PlayerFlagsFrame.Device.Visible = false
                                    end
                                else
                                    PlayerFlagsFrame.Visible = false
                                end
                            else
                                HealthBarOutline.Visible = false
                                PlayerFlagsFrame.Visible = false
                            end
                        end
                        return
                    end
                end, function(P6) V33("error in box esp:", tostring(P6)) end)
            end
            for J = #V38, 1, -1 do
                local V51 = J
                xpcall(function()
                    local V52 = V38[V51]
                    local Model = V52.Model
                    local Highlight = V52.Highlight
                    Highlight.Enabled = V42.Flags[V52.Flag].CurrentValue
                    if Model:FindFirstChild("Highlight") then
                        Model.Highlight:Destroy()
                    end
                    if Model:FindFirstChild("PlayerAura") then
                        Model.PlayerAura:Destroy()
                    end
                    if not Model or not Model.Parent then
                        Highlight:Destroy()
                        table.remove(V38, V51)
                        return
                    else
                        local CurrentValue3 = V42.Flags.OutlineOnlyESP.CurrentValue or V52.OnlyOutline
                        Highlight.FillTransparency = CurrentValue3 and 1 or 0
                        local Color = V42.Flags[V52.ColorFlag].Color
                        local V53, V54, V55 = Color:ToHSV()
                        if not CurrentValue3 then
                            local V56 = V42.Flags.OutlineWhiteness.CurrentValue / 100
                            V55 = V55 + (1 - V55) * V56
                            V54 = V54 * (1 - V56)
                        end
                        Highlight.OutlineColor = Color3.fromHSV(V53, V54, V55)
                        Highlight.FillColor = Color
                        if V42.Flags.NoOutlineESP.CurrentValue and not V52.OnlyOutline then
                            Highlight.OutlineTransparency = 1
                        else
                            Highlight.OutlineTransparency = 0
                        end
                        return
                    end
                end, function(P7) V33("error in chams esp:", tostring(P7)) end)
            end
            local V57 = #V32 - -1
            while true do
                V57 = -1 + V57
                if not (V57 >= 1 or false) then
                    break
                end
                local V58 = V57
                xpcall(function()
                    local V59 = V32[V58]
                    V59.Circle.Size = Vector3.new(0.2, V59.RangeX * 2, V59.RangeZ * 2)
                    V59.Circle.CFrame = CFrame.new(
                        V59.Object.Position.X, V59.Object.Position.Y + 0.2, V59.Object.Position.Z
                    ) * CFrame.Angles(0, 0, math.rad(90))
                end, function(P8) V33("error in range esp:", tostring(P8)) end)
            end
            for K = #V29, 1, -1 do
                local V60 = K
                xpcall(function()
                    local V61 = V29[V60]
                    local Object = V61.Object
                    local Label = V61.Label
                    local Flag2 = V61.Flag
                    if Object and Object.Parent and Object:IsDescendantOf(workspace) then
                        local V62, V63 = V34:WorldToScreenPoint(Object.Position)
                        if V63 and V42.Flags[Flag2].CurrentValue then
                            local V64 = 0
                            if V61.Display.Offset then
                                local V65 = math.rad(V34.FieldOfView)
                                local V66 = math.tan(V65 / 2)
                                V64 = V61.Display.Offset * (V34.ViewportSize.Y / 2 / (V62.Z * V66))
                            end
                            Label.Position = UDim2.fromOffset(V62.X, V62.Y - V64)
                            Label.Visible = true
                        else
                            Label.Visible = false
                        end
                    else
                        Label:Destroy()
                        table.remove(V29, V60)
                    end
                end, function(P9) V33("error in label esp:", tostring(P9)) end)
            end
        end
    end,
    n = function(P10)
        local V67 = P10[3]
        local V68 = P10[22]
        local V69 = P10[1]
        local V70 = P10[24]
        local V71 = P10[15]
        local V72 = P10[20]
        local V73 = P10[4]
        local V74 = P10[17]
        local V75 = P10[10]
        local V76 = P10[19]
        local V77 = P10[8]
        local V78 = P10[11]
        local V79 = P10[21]
        local V80 = P10[23]
        local V81 = P10[16]
        local V82 = P10[6]
        local V83 = P10[7]
        local V84 = P10[13]
        local V85 = P10[9]
        local V86 = P10[2]
        local V87 = P10[14]
        local V88 = P10[12]
        local V89 = P10[18]
        local V90 = P10[5]
        local V91 = P10[0]
        return function(P11, P12)
            local WaitForChild = P11 and P11:WaitForChild("HumanoidRootPart", 7)
            local WaitForChild2, V92, GetConfig, GetSkinConfig
            if not WaitForChild then
                return
            else
                local WaitForChild3 = WaitForChild and P11:WaitForChild("Humanoid", 7)
                if not WaitForChild3 then
                    return
                end
                WaitForChild2 = WaitForChild3:WaitForChild("Animator", 5)
                if not WaitForChild2 then
                    return
                else
                    V92 = P11 == V73.Character
                    if P11:GetAttribute("SkinName") == "" then
                    end
                    GetConfig = V69:GetConfig(P11)
                    GetSkinConfig = V69:GetSkinConfig(P11)
                    require(V89[P11.Parent.Name][P11.Name].Behavior)
                    local AnimationPlayed = WaitForChild2.AnimationPlayed
                    V69.Disconnectables[#V69.Disconnectables + 1] = AnimationPlayed:Connect(function(P13)
                        local V93 = V69.Metas.AttackIdToName[P13.Animation.AnimationId]
                        task.spawn(function()
                            if V92 and V77.Flags.GhostAnims.CurrentValue then
                                for Key, Value in pairs(V69.Metas.GhostAnimations) do
                                    if P11.Name == Key then
                                        for Index, Value2 in ipairs(Value) do
                                            if table.find(GetSelectedGhostAnims(), Key .. Value2.Flag) then
                                                for Index2, Value3 in ipairs(Value2.AnimationKeys) do
                                                    local Animations = GetSkinConfig and GetSkinConfig.Animations
                                                            and GetSkinConfig.Animations[Value3]
                                                        or GetConfig.Animations[Value3]
                                                    if not Animations then
                                                        V85("Ghost animations:", Value3, "nil in", Value2.Flag)
                                                    elseif Animations == P13.Animation.AnimationId then
                                                        GhostAnim(P13, Value2.Method)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if IsKiller() and V77.Flags.GhostM1.CurrentValue then
                                    local Animations2 = GetSkinConfig and GetSkinConfig.Animations
                                            and GetSkinConfig.Animations
                                        or GetConfig.Animations
                                    local V94 = "Slash"
                                    if P11.Name == "Noli" then
                                        V94 = "Stab"
                                    elseif P11.Name == "c00lkidd" then
                                        V94 = "Attack"
                                    elseif P11.Name == "Azure" then
                                        V94 = P11:GetAttribute("FootstepOverride") == "GolemFootsteps" and "GolemSlash"
                                            or "Slash"
                                    end
                                    local V95 = Animations2[V94]
                                    if not V95 then
                                        return V85("Ghost animations: M1 nil in", P11.Name .. " (skin: \"" .. tostring(P11:GetAttribute("SkinName"))
                                            .. "\")")
                                    end
                                    if V95 == P13.Animation.AnimationId then
                                        P13:Stop()
                                    end
                                    return
                                end
                                return
                            end
                        end)
                        local V96 = {
                            "rbxassetid://127802146383565", "rbxassetid://82691533602949",
                            "rbxassetid://128943791000974", "rbxassetid://122604262087779",
                            "rbxassetid://139901321415812", "rbxassetid://130355934640695",
                        }
                        local V97 = V92 and V72[1][V72[3]] and table.find(V96, P13.Animation.AnimationId)
                        local V98, V99, Part2
                        if V97 then
                            V85("stopping generator animation")
                            return P13:Stop()
                        elseif V92
                            and P13.Animation.AnimationId == require(V84["007n7"].Config).Animations.c00lguiStart then
                            V70.c00lguiAnimationTrack = P13
                            return V81("c00lgui track!")
                        else
                            task.spawn(function()
                                local Character3 = V73.Character
                                local Cframe2, V100, V101
                                if V92
                                    and table.find(V69.Metas.AnimationMetas.GeneralAttacks, P13.Animation.AnimationId) then
                                    V100 = 0
                                    local V102 = tick()
                                    local function F3(P14, P15)
                                        return V100 >= P15 and V100 <= P15 + V69.HitboxesDuration
                                    end
                                    V101 = 0
                                    while Character3.Parent and tick() - V102 <= P13.Length
                                        and V77.Flags.HitboxExpander.CurrentValue and V91.Heartbeat:Wait() do
                                        local HumanoidRootPart6 = Character3:FindFirstChild("HumanoidRootPart")
                                        if HumanoidRootPart6 and (tostring(Character3) == "Shedletsky" or IsKiller()) then
                                            local V103 = V69.Metas.AttackIdToWindup[P13.Animation.AnimationId] or -0.01
                                            if V103 < 0 then
                                                V85("that aint supposed to happen")
                                            end
                                            V100 = tick() - V102
                                            if not (F3(P13, V103)
                                                and not Character3.FOVMultipliers:FindFirstChild("HitRegistered")) then
                                                local V104 = math.atan((math.random() * 2 - 1) * 0.2 / 10)
                                                HumanoidRootPart6.CFrame = HumanoidRootPart6.CFrame
                                                    * CFrame.Angles(0, V104 - V101, 0)
                                                V101 = V104
                                            else
                                                local MainKiller2 = nil
                                                local CurrentValue4 = V77.Flags.HitboxExpanderRange.CurrentValue
                                                local V105 = V77.Flags.HitboxExpandMode.CurrentOption[1]
                                                function scanGroup(P16, P17)
                                                    local V106 = V77.Flags.HitboxExpanderMode.CurrentOption[1]
                                                    local Huge = math.huge
                                                    local LookVector = HumanoidRootPart6.CFrame.LookVector
                                                    local Health
                                                    for Index3, Value4 in ipairs(P16) do
                                                        local HumanoidRootPart7 = Value4:FindFirstChild("HumanoidRootPart")
                                                        local Humanoid2 = Value4:FindFirstChild("Humanoid")
                                                        if Value4 ~= Character3 and HumanoidRootPart7 and Humanoid2
                                                            and Humanoid2.Health > 0 then
                                                            local V107 = HumanoidRootPart7.Position
                                                                - HumanoidRootPart6.Position
                                                            local Magnitude2 = V107.Magnitude
                                                            if Magnitude2 > 0 and Magnitude2 <= CurrentValue4 then
                                                                if V106 == "Facing" then
                                                                    Health = -LookVector:Dot(V107.Unit)
                                                                elseif V106 == "Nearest" then
                                                                    Health = Magnitude2
                                                                else
                                                                    Health = Humanoid2.Health
                                                                end
                                                                if Health < Huge then
                                                                    MainKiller2 = Value4
                                                                    Huge = Health
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                                if IsKiller() then
                                                    scanGroup(V69.Survivors)
                                                else
                                                    MainKiller2 = V69.MainKiller
                                                end
                                                if MainKiller2 or V105 ~= "Dynamic" then
                                                    local Z = V69.AttackHitboxes[Character3.Name].offset.Z
                                                    local Z2 = V69.AttackHitboxes[Character3.Name].size.Z
                                                    CurrentValue4 = CurrentValue4 / Z2
                                                    local Cframe3 = HumanoidRootPart6.CFrame
                                                    local V108 = (V100 - V103) / V69.HitboxesDuration
                                                    if V105 == "Dynamic" then
                                                        local Cframe4 = MainKiller2.QueryHitbox.CFrame
                                                        local V109 = MainKiller2.Humanoid:GetMoveVelocity() / 3.5
                                                        local CurrentValue5 = V77.Flags.HitboxExpanderAutoRotate.CurrentValue
                                                                and Cframe4
                                                            or Cframe3.Rotation + Cframe4.Position
                                                        Cframe2 = CurrentValue5 + V109
                                                            - CurrentValue5.LookVector * (Z / 2)
                                                    else
                                                        Cframe2 = Cframe3
                                                            + Cframe3.LookVector * CurrentValue4 * (V108 * Z2)
                                                    end
                                                    HumanoidRootPart6.CFrame = Cframe2
                                                    local V110 = coroutine.running()
                                                    V91:BindToRenderStep("HitboxExpander", Enum.RenderPriority.First.Value, function()
                                                        V91:UnbindFromRenderStep("HitboxExpander")
                                                        local V111 = math.atan((math.random() * 2 - 1) * 0.2 / 10)
                                                        HumanoidRootPart6.CFrame = Cframe3
                                                            * CFrame.Angles(0, V111 - V101, 0)
                                                        V101 = V111
                                                        task.spawn(V110)
                                                    end)
                                                    coroutine.yield()
                                                end
                                            end
                                        end
                                    end
                                end
                            end)
                            task.spawn(function()
                                local V112 = table.find(
                                    V69.Metas.AnimationMetas.TwoTimeStuff, P13.Animation.AnimationId
                                )
                                local V113, V114, F4, CurrentValue6, CurrentValue7, HumanoidRootPart8, V115
                                if V112 and P11.Name == "TwoTime" then
                                    V113 = 0
                                    V114 = tick()
                                    if V77.Flags.Antibackstab.CurrentValue and IsKiller() and not V69.TargetTwoTime then
                                        while P13.IsPlaying and V91.RenderStepped:Wait() do
                                            if (V73.Character.HumanoidRootPart.Position - P11.HumanoidRootPart.Position).magnitude
                                                <= 23 then
                                                V76[1][V76[3]]:Notify({
                                                    Title = "Anti backstab",
                                                    Content = "TwoTime tried to stab you",
                                                    Duration = 6,
                                                    Image = "shield",
                                                })
                                                V69.TargetTwoTime = P11
                                                task.delay(2.381, function() V69.TargetTwoTime = nil end)
                                                task.spawn(function()
                                                    while V69.TargetTwoTime and V73.Character and V69.GameState == 1
                                                        and V67() do
                                                        stareFunc(P11, true)
                                                    end
                                                    V69.TargetTwoTime = nil
                                                end)
                                            end
                                        end
                                        return
                                    elseif V92 then
                                        function F4(P18, P19)
                                            local Position = P18.HumanoidRootPart.Position
                                            local Cframe5 = P19.HumanoidRootPart.CFrame
                                            local V116 = Cframe5.LookVector * -1
                                            local RaycastParams2 = RaycastParams.new()
                                            RaycastParams2.FilterType = Enum.RaycastFilterType.Exclude
                                            RaycastParams2.FilterDescendantsInstances = { P18, P19 }
                                            local V117 = -2
                                            while true do
                                                V117 = 1 + V117
                                                if not (1 >= V117) then
                                                    break
                                                end
                                                local V118 = V117
                                                for M = -2, 2 do
                                                    local V119 = Cframe5 * Vector3.new(V118, M, 0.55)
                                                    if V116:Dot(Position - V119) > math.cos(math.rad(90)) then
                                                        if not workspace:Raycast(Position, V119 - Position, RaycastParams2) then
                                                            return true
                                                        end
                                                    end
                                                end
                                            end
                                            return false
                                        end
                                        task.spawn(function()
                                            xpcall(function()
                                                local V120 = true
                                                while tick() - V114 <= P13.Length and V91.Heartbeat:Wait() do
                                                    V113 = tick() - V114
                                                    local MainKiller3 = V69.MainKiller
                                                    if V77.Flags.GlidestabHelper.CurrentValue and MainKiller3
                                                        and MainKiller3:FindFirstChild("HumanoidRootPart") then
                                                        local HumanoidRootPart9 = V73.Character.HumanoidRootPart
                                                        local V121 = F4(V73.Character, MainKiller3)
                                                        if V121 and V120 then
                                                            return
                                                        end
                                                        V120 = false
                                                        if V121
                                                            and (HumanoidRootPart9.Position
                                                                    - MainKiller3.HumanoidRootPart.Position).magnitude
                                                                <= 14 then
                                                            local Cframe6 = HumanoidRootPart9.CFrame
                                                            local Velocity = HumanoidRootPart9.Velocity
                                                            local Cframe7 = MainKiller3.QueryHitbox.CFrame
                                                            local V122 = MainKiller3.Humanoid:GetMoveVelocity() / 3.5
                                                            if not V69:HasHitReg() then
                                                                HumanoidRootPart9.Velocity = Vector3.zero
                                                                HumanoidRootPart9.CFrame = Cframe7 + V122
                                                                    - Cframe7.LookVector * 5
                                                                local V123 = coroutine.running()
                                                                V91:BindToRenderStep("BackstabAim", Enum.RenderPriority.First.Value, function()
                                                                    V91:UnbindFromRenderStep("BackstabAim")
                                                                    HumanoidRootPart9.Velocity = Velocity
                                                                    HumanoidRootPart9.CFrame = CFrame.new(
                                                                        Cframe6.Position, Cframe7.LookVector
                                                                    )
                                                                    task.spawn(V123)
                                                                end)
                                                                coroutine.yield()
                                                            end
                                                        end
                                                    end
                                                end
                                            end, function(P20) V85("error in backstab aim:", tostring(P20)) end)
                                        end)
                                        CurrentValue6 = V77.Flags.DaggerLungeMul.CurrentValue
                                        CurrentValue7 = V77.Flags.DaggerCrouchLungeMul.CurrentValue
                                        HumanoidRootPart8 = P11.HumanoidRootPart
                                        if V77.Flags.BackstabExploit.CurrentValue and V69.MainKiller then
                                            while tick() - V114 <= P13.Length and not V69:HasHitReg() and V69.MainKiller
                                                and V69.MainKiller.Parent and V91.Heartbeat:Wait() do
                                                if V113 > 0.45 + V73:GetNetworkPing() then
                                                    break
                                                elseif V113 >= 0.2 - V73:GetNetworkPing() then
                                                    local Cframe8 = HumanoidRootPart8.CFrame
                                                    local AssemblyLinearVelocity = HumanoidRootPart8.AssemblyLinearVelocity
                                                    local Cframe9 = V69.MainKiller.QueryHitbox.CFrame
                                                    HumanoidRootPart8.CFrame = Cframe9
                                                            + V69.MainKiller.Humanoid:GetMoveVelocity() / 3.5
                                                        - Cframe9.LookVector * 7
                                                    HumanoidRootPart8.AssemblyLinearVelocity = Vector3.zero
                                                    local V124 = coroutine.running()
                                                    V91:BindToRenderStep("BackstabExploit", Enum.RenderPriority.First.Value, function()
                                                        V91:UnbindFromRenderStep("BackstabExploit")
                                                        HumanoidRootPart8.CFrame = Cframe8
                                                        HumanoidRootPart8.AssemblyLinearVelocity = AssemblyLinearVelocity
                                                        task.spawn(V124)
                                                    end)
                                                    coroutine.yield()
                                                end
                                            end
                                            return
                                        end
                                        if V93 == "Stab" and CurrentValue6 > 1 or CurrentValue7 > 1 then
                                            V115 = 0
                                            while tick() - V114 <= P13.Length and V115 < 1 and V91.Heartbeat:Wait() do
                                                local V125 = V93 == "Stab"
                                                        and P13.Length - (0.25 + V69.HitboxesDuration)
                                                    or 0.6
                                                if V113 >= 0.25 then
                                                    V115 = V113 / V125
                                                    if not xpcall(function()
                                                        local V126 = (V93 == "Stab" and CurrentValue6 or CurrentValue7)
                                                            * V115
                                                        local LookVector2 = HumanoidRootPart8.CFrame.LookVector
                                                        local Cframe10 = HumanoidRootPart8.CFrame
                                                        HumanoidRootPart8.CFrame = Cframe10
                                                            + LookVector2 * (V126 * (V93 == "Stab" and 10 or 30))
                                                        local V127 = coroutine.running()
                                                        V91:BindToRenderStep("LungeRestore", Enum.RenderPriority.First.Value, function()
                                                            V91:UnbindFromRenderStep("LungeRestore")
                                                            HumanoidRootPart8.CFrame = Cframe10
                                                            task.spawn(V127)
                                                        end)
                                                        coroutine.yield()
                                                    end, function(P21)
                                                        V85("error in dagger lunge multiplier:", tostring(P21))
                                                    end) then
                                                        break
                                                    end
                                                end
                                            end
                                            return
                                        end
                                        return
                                    else
                                        return
                                    end
                                else
                                    return
                                end
                            end)
                            task.spawn(function()
                                if P11.Parent ~= V71 then
                                    return
                                elseif not V77.Flags.StunSpy.CurrentValue then
                                    return
                                else
                                    local Start = GetSkinConfig and GetSkinConfig.Animations
                                            and GetSkinConfig.Animations.Stunned
                                            and GetSkinConfig.Animations.Stunned.Start
                                            and GetSkinConfig.Animations.Stunned.Start
                                        or GetConfig.Animations.Stunned.Start
                                    local V128 = GetTrackLength(WaitForChild2, GetSkinConfig and GetSkinConfig.Animations
                                            and GetSkinConfig.Animations.Stunned
                                            and GetSkinConfig.Animations.Stunned.End
                                            and GetSkinConfig.Animations.Stunned.End
                                        or GetConfig.Animations.Stunned.End)
                                    if P13.Animation.AnimationId == Start then
                                        local SlashStunTime = 0
                                        local Character4 = V87[P11:GetAttribute("RecentAttacker")].Character
                                        if Character4.Name == "Shedletsky" then
                                            SlashStunTime = V78.SlashStunTime
                                        elseif Character4.Name == "TwoTime" then
                                            SlashStunTime = tick()
                                                            - (Character4:GetAttribute("LastInvisibilityTime") or 0)
                                                        <= 3
                                                    and 3.5
                                                or 2
                                        elseif Character4.Name == "Guest1337"
                                            and (P11.HumanoidRootPart:FindFirstChild("rbxassetid://13471740561")
                                                or P11.HumanoidRootPart:FindFirstChild("rbxassetid://116900970230089")) then
                                            SlashStunTime = V68.ParryStunTime
                                        elseif Character4.Name == "Chance" then
                                            SlashStunTime = 2
                                        end
                                        if SlashStunTime == 0 then
                                            return V85("cant figure out what stunned")
                                        else
                                            if P11.Name == "Sixer" then
                                                SlashStunTime = SlashStunTime * 0.75
                                            end
                                            local V129 = SlashStunTime + V128
                                            local Stunspybb = Instance.new("BillboardGui")
                                            Stunspybb.Parent = P11.Head
                                            Stunspybb.AlwaysOnTop = true
                                            Stunspybb.StudsOffset = Vector3.new(0, 3, 0)
                                            Stunspybb.Size = UDim2.new(1, 40, 1, 0)
                                            Stunspybb.Name = "stunspybb"
                                            Stunspybb.ResetOnSpawn = false
                                            local TextLabel = Instance.new("TextLabel")
                                            TextLabel.Parent = Stunspybb
                                            TextLabel.Size = UDim2.new(1, 0, 1, 0)
                                            TextLabel.TextSize = 18
                                            TextLabel.Font = Enum.Font.RobotoMono
                                            TextLabel.BackgroundTransparency = 1
                                            TextLabel.TextColor3 = Color3.fromRGB(212, 0, 0)
                                            TextLabel.TextStrokeTransparency = 0
                                            TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                                            local V130 = tick()
                                            while V129 - (tick() - V130) > 0 do
                                                TextLabel.Text = string.format(
                                                    "[STUNNED] %.2fs", V129 - (tick() - V130)
                                                )
                                                V67()
                                            end
                                            Stunspybb:Destroy()
                                            return
                                        end
                                    else
                                        return
                                    end
                                end
                            end)
                            if V93 == "EnragedStart" then
                                P11:SetAttribute("enraged", true)
                                V85("slasher enraged")
                                task.spawn(function()
                                    local V131 = tick()
                                    while P11:GetAttribute("enraged") and not V79[1][V79[3]] and V67() do
                                        if tick() - V131 >= GetConfig.EnragedTime then
                                            V85("slasher stopped enraged naturally")
                                            P11:SetAttribute("enraged", false)
                                        end
                                    end
                                end)
                            elseif V93 == "EnragedBehead" or V93 == "EnragedSlash" or V93 == "GashingWoundStart" then
                                P11:SetAttribute("enraged", false)
                            end
                            if (GetSkinConfig and GetSkinConfig.Animations and GetSkinConfig.Animations.Charge
                                            and GetSkinConfig.Animations.Charge
                                        or GetConfig.Animations.Charge)
                                    == P13.Animation.AnimationId
                                and V92 then
                                V69.IsCharging = true
                                local Destroying = P13.Destroying
                                V69.Disconnectables[#V69.Disconnectables + 1] = Destroying:Once(function()
                                    V69.IsCharging = false
                                end)
                                local Stopped = P13.Stopped
                                V69.Disconnectables[#V69.Disconnectables + 1] = Stopped:Once(function()
                                    V69.IsCharging = false
                                end)
                                task.spawn(function()
                                    local V132
                                    if V77.Flags.GuestNoclip.CurrentValue then
                                        EnableNoclip()
                                        repeat
                                            V67()
                                            V132 = not V69.IsCharging or V69.GameState ~= 1
                                        until V132
                                        DisableNoclip()
                                    end
                                end)
                                task.spawn(function()
                                    if V83[1][V83[3]].Charge then
                                        while V69.IsCharging and V69.GameState == 1 and V67() do
                                            local V133 = GetClosestKiller(V77.Flags.ChargeAimbotThreshold.CurrentValue)
                                            if V133 then
                                                StartAimbotting(V133, function()
                                                    return V69.IsCharging and V69.GameState == 1
                                                end, nil, nil, true)
                                            end
                                        end
                                    end
                                end)
                                task.spawn(function()
                                    local V134
                                    if V77.Flags.Gen1337StopsDoingGeneratorsAndGetsInTheCockpit.CurrentValue then
                                        workspace.Gravity = 0
                                        V73.Character.HumanoidRootPart.Velocity = Vector3.zero
                                        local LinearVelocity = Instance.new("LinearVelocity")
                                        LinearVelocity.Parent = V73.Character.HumanoidRootPart
                                        LinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
                                        LinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
                                        LinearVelocity.Attachment0 = V73.Character.HumanoidRootPart.RootAttachment
                                        LinearVelocity.ForceLimitsEnabled = false
                                        repeat
                                            LinearVelocity.VectorVelocity = V80.CFrame.LookVector
                                                * GetConfig.ChargingSpeed
                                            V67()
                                            V134 = not V69.IsCharging or V69.GameState ~= 1
                                        until V134
                                        LinearVelocity:Destroy()
                                        workspace.Gravity = 196.2
                                    end
                                end)
                            end
                            task.spawn(function()
                                if P11.Name == "Guest1337" then
                                    if TableFindThatWorks(V75[1][V75[3]], P13.Animation.AnimationId) then
                                        if V92 then
                                            V86[1][V86[3]] = true
                                        end
                                        P11:SetAttribute("isblocking", true)
                                        local Stopped2 = P13.Stopped
                                        V69.Disconnectables[#V69.Disconnectables + 1] = Stopped2:Once(function()
                                            P11:SetAttribute("isblocking", false)
                                            if V92 then
                                                V86[1][V86[3]] = false
                                            end
                                        end)
                                        local Destroying2 = P13.Destroying
                                        V69.Disconnectables[#V69.Disconnectables + 1] = Destroying2:Once(function()
                                            P11:SetAttribute("isblocking", false)
                                            if V92 then
                                                V86[1][V86[3]] = false
                                            end
                                        end)
                                        V67(P13.Length)
                                        P11:SetAttribute("isblocking", false)
                                        if V92 then
                                            V86[1][V86[3]] = false
                                        end
                                    end
                                end
                            end)
                            if P12 and IsKiller()
                                and (V73.Character.Name == "Slasher" or V73.Character.Name == "JohnDoe") then
                                if not table.find(V69.Metas.AnimationMetas.SentinelAnimations, P13.Animation.AnimationId) then
                                    return
                                else
                                    local HumanoidRootPart10 = V73.Character.HumanoidRootPart
                                    local HumanoidRootPart11 = P11.HumanoidRootPart
                                    if V77.Flags.QueryAutoblock.CurrentValue then
                                        HumanoidRootPart10 = V73.Character.QueryHitbox
                                        HumanoidRootPart11 = P11.QueryHitbox
                                    end
                                    Part2 = Instance.new("Part")
                                    Part2.Parent = workspace
                                    Part2.Anchored = true
                                    Part2.CanCollide = false
                                    Part2.Transparency = 0.5
                                    Part2.Color = Color3.fromRGB(255, 0, 0)
                                    Part2.Material = Enum.Material.Air
                                    while P13.IsPlaying do
                                        if (V77.Flags.AutoParryToggle.CurrentValue
                                                or V77.Flags.AutoUse404Error.CurrentValue)
                                            and (HasAbilityReady("RagingPace") or HasAbilityReady("404Error")) then
                                            if V73.Character.Name == "Slasher"
                                                and not V77.Flags.AutoParryToggle.CurrentValue then
                                                return
                                            end
                                            if V73.Character.Name == "JohnDoe"
                                                and not V77.Flags.AutoUse404Error.CurrentValue then
                                                return
                                            end
                                            local Magnitude3 = (HumanoidRootPart10.Position - HumanoidRootPart11.Position).Magnitude
                                            local CurrentValue8 = V77.Flags.NGAutoBlockHitboxCheck.CurrentValue
                                            local V135 = CurrentValue8
                                            V135 = CurrentValue8 or Magnitude3 <= V77.Flags.RagingPaceRange.CurrentValue
                                            local V136 = V135
                                            if V135 then
                                                local V137 = not V77.Flags.RagingPaceFaceCheck.CurrentValue
                                                    or IsFacing2(HumanoidRootPart10, HumanoidRootPart11, 0.707, 1)
                                                local V138 = V137
                                                if V137 then
                                                    local V139 = not CurrentValue8
                                                    local function F5()
                                                        local V140 = V69.AttackHitboxes[P11.Name]
                                                        if not V140.fake then
                                                            local Cframe11 = (V77.Flags.QueryAutoblock.CurrentValue
                                                                    and P11.QueryHitbox
                                                                or P11.HumanoidRootPart).CFrame
                                                            Cframe11:ToWorldSpace(CFrame.new(-V140.offset))
                                                            local HumanoidRootPart12 = V73.Character.HumanoidRootPart
                                                            local QueryHitbox2 = V77.Flags.QueryAutoblock.CurrentValue
                                                                    and V73.Character.QueryHitbox
                                                                or HumanoidRootPart12
                                                            local V141 = V140.size
                                                                + HumanoidRootPart12.Size / 2
                                                                    * (HumanoidRootPart12.AssemblyLinearVelocity.magnitude
                                                                        / 10)
                                                            Part2.Size = V141
                                                            Part2.CFrame = Cframe11 + Cframe11.LookVector * (V141.Z / 2)
                                                            return arePartsTouching(Part2, QueryHitbox2)
                                                        end
                                                    end
                                                    V138 = V139 or F5()
                                                end
                                                V136 = V138
                                            end
                                            if V136 then
                                                if V77.Flags.AutoBlockMS.CurrentValue > 0 then
                                                    V67(V77.Flags.AutoBlockMS.CurrentValue)
                                                end
                                                V88:FireServerConnection("UseActorAbility", "REMOTE_EVENT", V73.Character.Name == "JohnDoe" and "404Error"
                                                    or "RagingPace")
                                            end
                                        end
                                        V91.RenderStepped:Wait()
                                    end
                                    Part2:Destroy()
                                    return
                                end
                            else
                                V98 = nil
                                V99 = nil
                                if table.find(V69.WalkspeedOverrideAnimations, P13.Animation.AnimationId) then
                                    V69.UsingWalkspeedOverride = true
                                    V98 = true
                                    V99 = true
                                    task.spawn(function()
                                        local V142 = IsKiller()
                                        local V143
                                        if V142 and V77.Flags.NoclipOverride.CurrentValue then
                                            EnableNoclip()
                                            repeat
                                                V67()
                                                V143 = not IsKiller() or not V69.UsingWalkspeedOverride
                                            until V143
                                            DisableNoclip()
                                        end
                                    end)
                                    task.spawn(function()
                                        if IsKiller() and V83[1][V83[3]]["WS Override"] then
                                            while V69.UsingWalkspeedOverride and V67() do
                                                local V144 = GetClosestSurvivor(V77.Flags.WalkspeedOverrideThreshold.CurrentValue)
                                                if V144 then
                                                    StartAimbotting(V144, function()
                                                        return IsKiller() and V69.UsingWalkspeedOverride
                                                    end, nil, nil, true)
                                                end
                                            end
                                        end
                                    end)
                                end
                                if table.find(V69.WalkspeedOverrideEndedAnims, P13.Animation.AnimationId) then
                                    V69.UsingWalkspeedOverride = false
                                    V69.LungingWalkspeedOverride = false
                                end
                                if table.find(V69.WalkspeedOverrideLoopAnims, P13.Animation.AnimationId) then
                                    local Destroying3 = P13.Destroying
                                    V69.Disconnectables[#V69.Disconnectables + 1] = Destroying3:Once(function()
                                        V69.UsingWalkspeedOverride = false
                                        V69.LungingWalkspeedOverride = false
                                    end)
                                    local Stopped3 = P13.Stopped
                                    V69.Disconnectables[#V69.Disconnectables + 1] = Stopped3:Once(function()
                                        V69.UsingWalkspeedOverride = false
                                        V69.LungingWalkspeedOverride = false
                                    end)
                                    V69.LungingWalkspeedOverride = true
                                end
                                task.spawn(function()
                                    local Name, Name2, Part3, V145, V146, V147, Position2, V148
                                    if V77.Flags.RevealTrajectory.CurrentValue then
                                        Name = "Swords"
                                        Name2 = "Shockwave"
                                        if P11.Name == "1x1x1x1" then
                                            local Instances = (V69:GetSkinConfig(P11) or V69:GetConfig(P11)).Instances
                                                or {}
                                            Name = Instances.SwordsTemplate and Instances.SwordsTemplate.Name or Name
                                            Name2 = Instances.ShockwaveTemplate and Instances.ShockwaveTemplate.Name
                                                or Name2
                                        end
                                        if table.find(
                                            V69.Metas.AnimationMetas.RevealTrajectory, P13.Animation.AnimationId
                                        ) or V98 then
                                            Part3 = Instance.new("Part")
                                            Part3.Parent = workspace
                                            Part3.Anchored = true
                                            Part3.CanCollide = false
                                            Part3.Transparency = 0.7
                                            Part3.Material = Enum.Material.Neon
                                            Part3.Color = Color3.fromRGB(255, 0, 0)
                                            V145 = false
                                            V146 = V93 == "MassInfection" and 5 or 2
                                            V147 = nil
                                            local Total = 0
                                            local Position3 = P11.HumanoidRootPart.Position
                                            local LookVector3 = P11.HumanoidRootPart.CFrame.LookVector
                                            Position2 = nil
                                            V148 = true
                                            task.spawn(function()
                                                local V149 = tick()
                                                while tick() - V149 <= V146 do
                                                    local FindFirstChild = workspace.Map.Ingame:FindFirstChild(Name2)
                                                    local FindFirstChild2 = workspace.Map.Ingame:FindFirstChild(Name)
                                                    local V150 = FindFirstChild or FindFirstChild2
                                                    if P11.Name == "1x1x1x1" and V150 then
                                                        if not Position2 then
                                                            Position2 = P11.HumanoidRootPart.Position
                                                        end
                                                        local GetPivot = V150:GetPivot()
                                                        V147 = true
                                                        if V93 == "MassInfection" and FindFirstChild then
                                                            Part3.CFrame = CFrame.new(Position2, GetPivot.Position)
                                                                * CFrame.new(0, 0, -500)
                                                            V145 = true
                                                        end
                                                        if V93 == "Entanglement" and FindFirstChild2 then
                                                            Part3.CFrame = CFrame.new(Position2, GetPivot.Position)
                                                                * CFrame.new(0, 0, -500)
                                                            V145 = true
                                                        end
                                                        if V145 and not FindFirstChild then
                                                            V81("shockwave deleted")
                                                            break
                                                        end
                                                    end
                                                    V91.RenderStepped:Wait()
                                                end
                                            end)
                                            task.delay(1, function()
                                                if V93 == "Uppercut" then
                                                    V148 = false
                                                end
                                            end)
                                            while (P13.IsPlaying or V69.UsingWalkspeedOverride) and not V147 do
                                                local WalkspeedOverrideSpeed = V99 and V90.WalkspeedOverrideSpeed
                                                local V151 = 6
                                                local V152 = WalkspeedOverrideSpeed or 1000
                                                local V153 = 6
                                                if V93 == "Entanglement" or V93 == "Uppercut" then
                                                    V151 = 3
                                                    V153 = 3
                                                end
                                                if V93 == "CorruptEnergy" then
                                                    V152 = V82.DistanceBetweenSpikes * V82.SpikeAmount
                                                end
                                                if V93 == "Uppercut" then
                                                    V152 = 113.846
                                                end
                                                if V99 then
                                                    V151 = 4
                                                    V153 = 4
                                                end
                                                local Position4 = P11.HumanoidRootPart.Position
                                                local V154 = Position4 - Position3
                                                local Unit = V154.Magnitude > 0.01
                                                        and Vector3.new(V154.X, 0, V154.Z).Unit
                                                    or LookVector3
                                                local V155 = V99
                                                LookVector3 = Unit
                                                if V155 and V69.LungingWalkspeedOverride then
                                                    Total = Total + Vector3.new(V154.X, 0, V154.Z).Magnitude
                                                end
                                                Position3 = Position4
                                                local V156 = math.max(V152 - Total, 0)
                                                if V148 then
                                                    if V99 and V69.LungingWalkspeedOverride then
                                                        Part3.CFrame = CFrame.new(Position4, Position4 + Unit)
                                                            * CFrame.new((V153 - V151) / 2, 0, -(V156 - 0) / 2)
                                                        Part3.Size = Vector3.new(V151 + V153, 10, V156 + 0)
                                                    else
                                                        Part3.CFrame = P11.HumanoidRootPart.CFrame
                                                            * CFrame.new((V153 - V151) / 2, 0, -(V152 - 0) / 2)
                                                        Part3.Size = Vector3.new(V151 + V153, 10, V152 + 0)
                                                    end
                                                end
                                                if V98 and not V69.UsingWalkspeedOverride then
                                                    break
                                                end
                                                if V93 == "Uppercut" and not P11.HookModel.Beam.Enabled then
                                                    break
                                                end
                                                V91.RenderStepped:Wait()
                                            end
                                            Part3.Color = Color3.fromRGB(0, 0, 255)
                                            V74:Create(Part3, TweenInfo.new(V146, Enum.EasingStyle.Linear), {
                                                Transparency = 1,
                                            }):Play()
                                            if not V99 and V93 ~= "Uppercut" then
                                                V67(V146)
                                            end
                                            Part3:Destroy()
                                        end
                                    end
                                end)
                                local V157 = GetClosestKiller(999)
                                if V157
                                    and not IsKiller()
                                    and table.find(
                                        V69.Metas.AnimationMetas.AutoblockAnimations, P13.Animation.AnimationId
                                    )
                                    and (not V77.Flags.AutoblockSounds.CurrentValue or V157.Name == "Slasher")
                                    and V73.Character.Name == "Guest1337" then
                                    local HumanoidRootPart13 = V157:FindFirstChild("HumanoidRootPart")
                                    local HumanoidRootPart14 = V73.Character:FindFirstChild("HumanoidRootPart")
                                    if V77.Flags.QueryAutoblock.CurrentValue then
                                        HumanoidRootPart14 = V73.Character:FindFirstChild("QueryHitbox")
                                        HumanoidRootPart13 = V157:FindFirstChild("QueryHitbox")
                                    end
                                    if not HumanoidRootPart14 or not HumanoidRootPart13 then
                                        return
                                    end
                                    local V158 = tick()
                                    while P13.IsPlaying and tick() - V158 <= V69.HitboxesDuration do
                                        if HasAbilityReady("Block") and V77.Flags.AutoBlockToggle.CurrentValue then
                                            if Counter(V157, WaitForChild, P13, tick()) then
                                                break
                                            end
                                            V67()
                                        end
                                        V91.RenderStepped:Wait()
                                    end
                                    return
                                end
                                return
                            end
                        end
                    end)
                    return
                end
            end
        end
    end,
    m = function(P22)
        local V159 = P22[1]
        local V160 = P22[3]
        local V161 = P22[8]
        local V162 = P22[6]
        local V163 = P22[0]
        local V164 = P22[7]
        local V165 = P22[4]
        local V166 = P22[11]
        local V167 = P22[9]
        local V168 = P22[5]
        local V169 = P22[2]
        return function(P23)
            local function F6()
                if P23.Name == "007n7" then
                    local HumanoidRootPart15 = P23:WaitForChild("HumanoidRootPart")
                    if not HumanoidRootPart15 then
                        return V165("OMFG", P23.PrimaryPart)
                    end
                    AddBoxEsp(P23, "CloneEspColor", "CloneEsp")
                    if V168.Flags.CloneEsp.CurrentValue then
                        AddHighlightEsp(P23, "CloneEspColor", "HIFORSAKEN", true)
                    end
                    V161(HumanoidRootPart15, "CloneEspColor", "CloneEsp")
                    P23:SetAttribute("clone", true)
                    if P23:GetAttribute("Username") == V159.Name then
                        V160.Has007n7Clone = P23
                        local Destroying4 = P23.Destroying
                        V160.Disconnectables[#V160.Disconnectables + 1] = Destroying4:Once(function()
                            V160.Has007n7Clone = nil
                        end)
                        return
                    elseif V168.Flags.AntiClone007n7.CurrentValue then
                        P23:Destroy()
                        V165("destroyed a fake clone")
                        if not V168.Flags.Antis_EnableNotifications.CurrentValue or V160.GameState ~= 1 then
                            return
                        end
                        V163[1][V163[3]]:Notify({
                            Title = "-1255916978",
                            Content = "-364238142",
                            Duration = 6,
                            Image = "ban",
                        })
                        return
                    else
                        return
                    end
                else
                    return
                end
            end
            F6()
            local function F7()
                local V170 = IsKiller()
                local Connect
                if V170 and P23.Name == "Voidstar" then
                    Connect = nil
                    Connect = V167.Heartbeat:Connect(function()
                        local CurrentValue9 = V168.Flags.AutoNova.CurrentValue
                        local V171 = CurrentValue9
                        if CurrentValue9 then
                            local V172 = tick() - V169[1][V169[3]] >= 1
                            local function F8()
                                for Index4, Value5 in ipairs(V160.Survivors) do
                                    if Value5:FindFirstChild("HumanoidRootPart") and Value5 ~= V159.Character then
                                        if (P23.Position - Value5.HumanoidRootPart.Position).Magnitude
                                            <= V166.NovaExplosionRadius / 2 - 3 then
                                            return true
                                        end
                                    end
                                end
                            end
                            V171 = V172 and F8()
                        end
                        if V171 then
                            V162("triggering nova")
                            V169[1][V169[3]] = tick()
                            V164:FireServerConnection("UseActorAbility", "REMOTE_EVENT", "Nova")
                        end
                    end)
                    local Parent = P23:GetPropertyChangedSignal("Parent")
                    V160.Disconnectables[#V160.Disconnectables + 1] = Parent:Once(function() Connect:Disconnect() end)
                end
            end
            F7()
            if P23.Name ~= "PizzaDeliveryRig" and P23.Name ~= "1x1x1x1Zombie" then
                return
            end
            AddBoxEsp(P23, "EntityEspColor", "EntityEsp")
            if V168.Flags.EntityEsp.CurrentValue then
                AddHighlightEsp(Entity, "EntityEspColor", "HIFORSAKEN", true)
            end
            V161(P23:WaitForChild("HumanoidRootPart"), "EntityEspColor", "EntityEsp")
        end
    end,
    r = function(P24)
        local V173 = P24[1]
        local V174 = P24[0]
        local V175 = P24[4]
        local V176 = P24[2]
        local V177 = P24[3]
        return function()
            while V176() do
                pcall(function()
                    if not V173.Flags.AutoFarmSurvivors.CurrentValue then
                        return
                    end
                    if IsKiller() then
                        local V178 = V177.Survivors[math.random(1, #V177.Survivors)]
                        while V178.Parent and V178:FindFirstChild("Humanoid")
                            and V178:FindFirstChild("HumanoidRootPart") and V178.Humanoid.Health > 0 do
                            V175.Character.HumanoidRootPart.CFrame = V178.HumanoidRootPart.CFrame
                            V174:FireServerConnection("UseActorAbility", "REMOTE_EVENT", GetM1Name())
                            V176()
                            if not V173.Flags.AutoFarmSurvivors.CurrentValue then
                                return
                            end
                        end
                        return
                    end
                end)
            end
        end
    end,
    A = function(P25)
        local Fire = P25[9]
        local V179 = P25[5]
        local V180 = P25[14]
        local V181 = P25[3]
        local V182 = P25[15]
        local V183 = P25[2]
        local V184 = P25[8]
        local V185 = P25[12]
        local V186 = P25[7]
        local V187 = P25[10]
        local V188 = P25[18]
        local V189 = P25[6]
        local V190 = P25[0]
        local V191 = P25[1]
        local V192 = P25[4]
        local V193 = P25[16]
        local V194 = P25[11]
        local V195 = P25[17]
        local V196 = P25[13]
        return function(P26, ...)
            local V197 = { ... }
            local V198, V199, V200, V201, V202, V203, CurrentValue10, V204, Stamina, V205
            if V182[1][V182[3]] then
                return V183[1][V183[3]](P26, unpack(V197))
            else
                local V206 = { unpack(V197) }
                if typeof(P26) == "Instance" then
                    if P26 == V189.RemoteEvent then
                        local V207 = ({ unpack(V197) })[2]
                        if type(V207) == "table" and typeof(V207[1]) == "buffer" then
                            if buffer.tostring(V207[1]):find("PlasmaBeam") then
                                WaitAndReset("DusekkarActive")
                            elseif buffer.tostring(V207[1]):find("Nova") then
                                WaitAndReset("NoliActive")
                            elseif buffer.tostring(V207[1]):find("CorruptNature") then
                                WaitAndReset("CoolkidActive")
                            end
                        end
                        return V183[1][V183[3]](P26, unpack(V206))
                    end
                    if P26 == V185 and getnamecallmethod() == "GetAttribute" and V206[1] == "Device"
                        and V181.Flags.DeviceSpoofer.CurrentValue then
                        return V181.Flags.ClientDeviceSpooferValue.CurrentOption[1]
                    end
                    if P26 == V188 and getnamecallmethod() == "BindToRenderStep" and V206[1] == "Sk8" then
                        if V181.Flags.Sk8Autofarm.CurrentValue then
                            while V194.GameState == 1 do
                                V187("tricking")
                                V193:FireServerConnection(V185.Name .. "SkateTrick", "REMOTE_EVENT")
                                V184(V179.Sk8TrickCooldown + 0.05)
                            end
                            return V183[1][V183[3]](P26, unpack(V206))
                        else
                            V199 = require(V195.Utilities.Util)
                            V200 = require(V185.PlayerScripts.PlayerModule.ControlModule)
                            V201 = V206[3]
                            local V208 = V180(V201, 5)
                            function CATSAKEN_NO_SK8_FUNC_ERROR()
                            end
                            local V209 = debug.info(V208 or NO_SK8_FUNC_ERROR, "n")
                            if V209 ~= "stopSkating" then
                                V196("upvalue 5 of", tostring(V208), "was not stopSkating, instead " .. tostring(V209))
                                return V183[1][V183[3]](P26, unpack(V206))
                            end
                            V202 = clonefunction(V208)
                            V203 = nil
                            CurrentValue10 = V181.Flags.Sk8Forever.CurrentValue
                            local V210 = V181.Flags.Sk8ForeverMode.CurrentOption[1]
                            if CurrentValue10 then
                                V194._SprintDuringSk8 = true
                            end
                            V204 = true
                            V192(V201, 5, function(...)
                                local CurrentValue11 = V181.Flags.Sk8AntiCrash.CurrentValue
                                CurrentValue10 = V181.Flags.Sk8Forever.CurrentValue
                                if not CurrentValue10 then
                                    V203 = false
                                end
                                if V191.Stamina <= (V191.MinStamina or 0) and not V203 or not CurrentValue11 then
                                    V194._SprintDuringSk8 = nil
                                    V204 = false
                                    return V202(...)
                                end
                            end)
                            if CurrentValue10 and V210 ~= "Freeze stamina while skating" then
                                V192(V201, 4, {
                                    __sprintedEvent = { Fire = Fire },
                                    Stamina = math.huge,
                                    MinStamina = -math.huge,
                                })
                                V203 = true
                                V187("Patched the 4th upvalue")
                            elseif CurrentValue10 then
                                Stamina = V191.Stamina
                                task.spawn(function()
                                    while V204 and V184() do
                                        V191.Stamina = Stamina
                                    end
                                end)
                                V203 = true
                            end
                            function isheldtrickbutton()
                                local V211 = V180(V201, 32)
                                if type(V211) == "boolean" then
                                    return V211
                                else
                                    local UserInputService = GetService("UserInputService")
                                    return UserInputService:IsKeyDown(Enum.KeyCode.Space) or UserInputService:IsGamepadButtonDown(
                                        Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonX
                                    )
                                end
                            end
                            V205 = false
                            V206[3] = function(P27)
                                local Character5 = V185.Character
                                local PrimaryPart = Character5 and Character5.PrimaryPart
                                if V181.Flags.Sk8Freewalk.CurrentValue then
                                    local GetActor = V199:GetActor(V185)
                                    local Sk8 = GetActor and GetActor.HeldAbilities.Sk8
                                    local V212 = V180(V201, 4)
                                    if PrimaryPart and GetActor and V199:IsAlive(Character5)
                                        and not PrimaryPart.Anchored and not Character5:GetAttribute("Ragdolling")
                                        and V212.Stamina > (V212.MinStamina or 0) and not Sk8
                                        and not isheldtrickbutton() and V200:GetMoveVector().Magnitude < 0.001 then
                                        V205 = true
                                        return
                                    end
                                    if V205 and not Sk8 then
                                        V192(V201, 13, os.clock())
                                    end
                                    V205 = false
                                end
                                local Highlight2 = V186:FindFirstChild("Highlight")
                                local V213 = Highlight2
                                V213 = Highlight2 and V186.Highlight.Adornee == Character5
                                local CurrentValue12 = V181.Flags.Sk8TrickAnywhere.CurrentValue and PrimaryPart
                                    and isheldtrickbutton() and not V213
                                local Unit2
                                if CurrentValue12 then
                                    local AssemblyLinearVelocity2 = PrimaryPart.AssemblyLinearVelocity
                                    local Vector = Vector3.new(AssemblyLinearVelocity2.X, 0, AssemblyLinearVelocity2.Z)
                                    local LookVector4 = PrimaryPart.CFrame.LookVector
                                    Unit2 = (Vector.Magnitude > 0.1 and Vector.Unit
                                        or Vector3.new(LookVector4.X, 0, LookVector4.Z).Unit):Cross(Vector3.yAxis).Unit
                                    V192(V201, 27, Unit2)
                                    V192(V201, 26, os.clock())
                                end
                                V201(P27)
                                if Unit2 and V180(V201, 27) == Unit2 then
                                    local Highlight3 = V186:FindFirstChild("Highlight")
                                    if Highlight3 then
                                        Highlight3.Adornee = nil
                                    end
                                    V192(V201, 27, false)
                                end
                            end
                            return V183[1][V183[3]](P26, unpack(V206))
                        end
                    else
                        if P26 == V190 and getnamecallmethod() == "BindActionAtPriority"
                            and V181.Flags.UnlimitedRunning.CurrentValue
                            and GetInfStamMethod() ~= "Disable stamina loss" then
                            setthreadidentity(2)
                            local V214 = V197[4]
                            local V215 = V197[3]
                            local V216 = V197[1]
                            V198 = V197[2]
                            if V216 == "Sprinting" then
                                return V183[1][V183[3]](P26, V216, function(P28, P29, P30)
                                    setthreadidentity(2)
                                    if P29 == Enum.UserInputState.Begin and canstartsprintzero() then
                                        V194:Sprint(true)
                                        return
                                    end
                                    return V198(P28, P29, P30)
                                end, V215, V214, select(5, unpack(V197)))
                            end
                            return V183[1][V183[3]](P26, unpack(V206))
                        end
                        return V183[1][V183[3]](P26, unpack(V206))
                    end
                else
                    return V183[1][V183[3]](P26, unpack(V206))
                end
            end
        end
    end,
    K = function(P31)
        local V217 = P31[2]
        local V218 = P31[4]
        local V219 = P31[0]
        local V220 = P31[1]
        local V221 = P31[3]
        return function()
            if tick() - V218 <= 0.75 then
                return
            end
            if V219 and V219.Network and V219.__renderer then
                if V220[1][V220[3]]:IsBroken() then
                    V221("Broke lock")
                    V217[1][V217[3]]:Disconnect()
                end
                local GetServerTimeNow = workspace:GetServerTimeNow()
                if V220[1][V220[3]]:IsOnTarget(V220[1][V220[3]]:AngleAt(math.max(
                    GetServerTimeNow, V220[1][V220[3]].State.AnchorTime
                ))) then
                    if V220[1][V220[3]]:Press(GetServerTimeNow) then
                        V219.Network:FireServer("Press", GetServerTimeNow)
                        V219.__renderer:Play(v10)
                    end
                end
            else
                V221("hey that is nil!", V219, V219 and V219.Network, V219 and V219.__renderer)
                V217[1][V217[3]]:Disconnect()
            end
        end
    end,
    C = function(P32)
        local V222 = P32[3]
        local V223 = P32[15]
        local V224 = P32[16]
        local V225 = P32[8]
        local V226 = P32[11]
        local V227 = P32[1]
        local V228 = P32[10]
        local V229 = P32[14]
        local V230 = P32[0]
        local V231 = P32[2]
        local V232 = P32[5]
        local V233 = P32[4]
        local V234 = P32[13]
        local V235 = P32[17]
        local V236 = P32[12]
        local V237 = P32[7]
        local V238 = P32[6]
        local V239 = P32[9]
        return function()
            if isfile("catsakenconfigs.json") then
                V229("catsakenconfigs.json exists, loading " .. V236)
                local V240 = V222[3]
                local V241 = V222[1]
                V241[V240] = V225:JSONDecode(readfile("catsakenconfigs.json"))[V236] or {}
            else
                V238("Creating a default config (" .. V236 .. ")")
                writefile("catsakenconfigs.json", V225:JSONEncode({ [V236] = {} }))
            end
            local V242 = { AccentColorChanged = Instance.new("BindableEvent") }
            local Color2 = Color3.fromRGB(255, 190, 80)
            local V243 = {}
            local V244, V245, V246 = Color2:ToHSV()
            for Key2, Value6 in pairs({
                alt = Color3.fromRGB(255, 173, 80),
                hover = Color3.fromRGB(255, 150, 30),
                mid = Color3.fromRGB(245, 159, 39),
                dark = Color3.fromRGB(140, 85, 15),
                dark2 = Color3.fromRGB(160, 100, 15),
                deep = Color3.fromRGB(110, 65, 5),
                light = Color3.fromRGB(255, 200, 110),
            }) do
                local V247, V248, V249 = Value6:ToHSV()
                V243[Key2] = { V247 - V244, V248 / V245, V249 / V246 }
            end
            local V250 = {}
            local function F9(P33)
                local V251 = P33 and V250[P33]
                if V251 then
                    return V251
                else
                    local V252 = P33 and V243[P33]
                    if not V252 then
                        return Color2
                    else
                        local V253, V254, V255 = Color2:ToHSV()
                        return Color3.fromHSV(
                            (V253 + V252[1]) % 1, math.clamp(V254 * V252[2], 0, 1), math.clamp(V255 * V252[3], 0, 1)
                        )
                    end
                end
            end
            local function F10(Fn)
                Fn()
            end
            local function F11(P34, P35, P36)
                F10(function() P34[P35] = F9(P36) end)
            end
            local function F12(P37)
                return string.format(
                    "rgb(%d, %d, %d)", math.floor(P37.R * 255 + 0.5), math.floor(P37.G * 255 + 0.5),
                    math.floor(P37.B * 255 + 0.5)
                )
            end
            local Event = V242.AccentColorChanged.Event
            V230[#V230 + 1] = Event:Connect(function(P38)
                if typeof(P38) ~= "Color3" then
                    return
                end
                Color2 = P38
            end)
            V242.AccentVariantChanged = Instance.new("BindableEvent")
            V242.AccentShadeNames = { "alt", "hover", "mid", "dark", "dark2", "deep", "light" }
            local Event2 = V242.AccentVariantChanged.Event
            V230[#V230 + 1] = Event2:Connect(function(P39, P40)
                if not V243[P39] then
                    return
                end
                V250[P39] = typeof(P40) == "Color3" and P40 or nil
            end)
            function V242.GetAccent(P41, P42)
                return F9(P42)
            end
            if V228:IsStudio() then
                V232:WaitForChild("PlayerGui"):WaitForChild("debugUi"):Destroy()
            end
            local function F13(P43)
                local Frame = Instance.new("Frame")
                Frame.Size = UDim2.new(1, 0, 0, 80)
                Frame.Position = UDim2.new(0, 0, 1, -80)
                Frame.BackgroundColor3 = Color3.new(0, 0, 0)
                Frame.BackgroundTransparency = 0
                Frame.ZIndex = P43.ZIndex + 1
                Frame.Parent = P43.Parent
                local UiCorner = Instance.new("UICorner")
                UiCorner.Parent = Frame
                UiCorner.CornerRadius = UDim.new(0, 5)
                local UiGradient = Instance.new("UIGradient")
                UiGradient.Rotation = 90
                UiGradient.Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.6),
                })
                UiGradient.Parent = Frame
                local CanvasPosition = P43:GetPropertyChangedSignal("CanvasPosition")
                V230[#V230 + 1] = CanvasPosition:Connect(function()
                    V231:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                        BackgroundTransparency = P43.CanvasPosition.Y + P43.AbsoluteWindowSize.Y + 10
                                    >= P43.AbsoluteCanvasSize.Y - 1
                                and 1
                            or 0,
                    }):Play()
                end)
                return Frame
            end
            local function F14(P44, P45, P46)
                local Ripple = Instance.new("Frame")
                Ripple.Name = "Ripple"
                Ripple.AnchorPoint = Vector2.new(0.5, 0.5)
                Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Ripple.BackgroundTransparency = 0.6
                Ripple.BorderSizePixel = 0
                Ripple.Position = UDim2.fromOffset(P45, P46)
                Ripple.Size = UDim2.fromOffset(0, 0)
                Ripple.ZIndex = P44.ZIndex + 1
                Ripple.ClipsDescendants = false
                local UiCorner2 = Instance.new("UICorner")
                UiCorner2.CornerRadius = UDim.new(1, 0)
                UiCorner2.Parent = Ripple
                Ripple.Parent = P44
                local AbsoluteSize = P44.AbsoluteSize
                local V256 = math.sqrt(AbsoluteSize.X ^ 2 + AbsoluteSize.Y ^ 2) * 0.2
                local Create = GetService("TweenService"):Create(Ripple, TweenInfo.new(
                    0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
                ), {
                    Size = UDim2.fromOffset(V256, V256),
                    BackgroundTransparency = 1,
                })
                Create:Play()
                local Completed = Create.Completed
                V230[#V230 + 1] = Completed:Connect(function() Ripple:Destroy() end)
            end
            local function F15(P47)
                P47.ScrollBarThickness = 0
                local CustomScrollTrack = Instance.new("TextButton")
                CustomScrollTrack.Name = "CustomScrollTrack"
                CustomScrollTrack.Parent = P47.Parent
                CustomScrollTrack.AnchorPoint = Vector2.new(1, 0)
                CustomScrollTrack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                CustomScrollTrack.BackgroundTransparency = 0.45
                CustomScrollTrack.BorderSizePixel = 0
                CustomScrollTrack.ZIndex = P47.ZIndex + 1
                CustomScrollTrack.Text = ""
                local Bar = Instance.new("Frame")
                Bar.Name = "Bar"
                Bar.Parent = CustomScrollTrack
                Bar.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Bar.BackgroundTransparency = 0.2
                Bar.BorderSizePixel = 0
                Bar.Size = UDim2.new(1, 0, 1, 0)
                Bar.Position = UDim2.new(0, 0, 0, 0)
                local function F16()
                    CustomScrollTrack.Position = UDim2.new(1, -2, 0, 0)
                    CustomScrollTrack.Size = UDim2.new(0, 16, 1, 0)
                end
                F16()
                local V257 = false
                local Y = 0
                local Y2 = 0
                local function F17()
                    local Y3 = P47.AbsoluteCanvasSize.Y
                    local Y4 = P47.AbsoluteWindowSize.Y
                    if Y3 <= Y4 + 1 then
                        CustomScrollTrack.Visible = false
                        return
                    else
                        CustomScrollTrack.Visible = true
                        local Y5 = CustomScrollTrack.AbsoluteSize.Y
                        local V258 = math.clamp(Y4 / Y3, 0.05, 1)
                        local V259 = math.max(Y5 * V258, 20)
                        local V260 = Y3 - Y4
                        local V261 = V260 > 0 and P47.CanvasPosition.Y / V260 or 0
                        Bar.Size = UDim2.new(1, 0, 0, V259)
                        Bar.Position = UDim2.new(0, 0, 0, (Y5 - V259) * V261)
                        return
                    end
                end
                local CanvasPosition2 = P47:GetPropertyChangedSignal("CanvasPosition")
                V230[#V230 + 1] = CanvasPosition2:Connect(F17)
                local AbsoluteCanvasSize = P47:GetPropertyChangedSignal("AbsoluteCanvasSize")
                V230[#V230 + 1] = AbsoluteCanvasSize:Connect(F17)
                local AbsoluteWindowSize = P47:GetPropertyChangedSignal("AbsoluteWindowSize")
                V230[#V230 + 1] = AbsoluteWindowSize:Connect(F17)
                local AbsoluteSize2 = CustomScrollTrack:GetPropertyChangedSignal("AbsoluteSize")
                V230[#V230 + 1] = AbsoluteSize2:Connect(F17)
                local AbsolutePosition = P47:GetPropertyChangedSignal("AbsolutePosition")
                V230[#V230 + 1] = AbsolutePosition:Connect(F16)
                local AbsoluteSize3 = P47:GetPropertyChangedSignal("AbsoluteSize")
                V230[#V230 + 1] = AbsoluteSize3:Connect(F16)
                local function F18(P48)
                    local Y6 = Bar.AbsoluteSize.Y
                    local V262 = math.max(P47.AbsoluteCanvasSize.Y - P47.AbsoluteWindowSize.Y, 0)
                    local V263 = math.max(CustomScrollTrack.AbsoluteSize.Y - Y6, 1)
                    local V264 = math.clamp(P48 - CustomScrollTrack.AbsolutePosition.Y - Y6 / 2, 0, V263)
                    P47.CanvasPosition = Vector2.new(P47.CanvasPosition.X, V262 * (V264 / V263))
                end
                local InputChanged = V227.InputChanged
                V230[#V230 + 1] = InputChanged:Connect(function(P49)
                    if V257
                        and (P49.UserInputType == Enum.UserInputType.MouseMovement
                            or P49.UserInputType == Enum.UserInputType.Touch) then
                        local V265 = math.max(P47.AbsoluteCanvasSize.Y - P47.AbsoluteWindowSize.Y, 0)
                        local V266 = math.max(CustomScrollTrack.AbsoluteSize.Y - Bar.AbsoluteSize.Y, 1)
                        P47.CanvasPosition = Vector2.new(
                            P47.CanvasPosition.X, math.clamp(Y2 + (P49.Position.Y - Y) / V266 * V265, 0, V265)
                        )
                    end
                end)
                local InputEnded = V227.InputEnded
                V230[#V230 + 1] = InputEnded:Connect(function(P50)
                    if P50.UserInputType == Enum.UserInputType.MouseButton1
                        or P50.UserInputType == Enum.UserInputType.Touch then
                        V257 = false
                    end
                end)
                local InputBegan = CustomScrollTrack.InputBegan
                V230[#V230 + 1] = InputBegan:Connect(function(P51)
                    if P51.UserInputType ~= Enum.UserInputType.MouseButton1
                        and P51.UserInputType ~= Enum.UserInputType.Touch then
                        return
                    else
                        local Y7 = Bar.AbsolutePosition.Y
                        local Y8 = Bar.AbsoluteSize.Y
                        if P51.Position.Y >= Y7 and P51.Position.Y <= Y7 + Y8 then
                            V257 = true
                            Y = P51.Position.Y
                            Y2 = P47.CanvasPosition.Y
                        else
                            F18(P51.Position.Y)
                        end
                        return
                    end
                end)
                F17()
                return CustomScrollTrack
            end
            local function F19()
                local RunService = GetService("RunService")
                local UserInputService2 = GetService("UserInputService")
                local ContextActionService = GetService("ContextActionService")
                if not RunService:IsClient() then
                    error("SmoothScroll can only be used on the client")
                end
                local PlayerGui = V228:IsStudio() and V232:WaitForChild("PlayerGui") or V223
                local GetMouse = V232:GetMouse()
                local V267 = pairs
                local V268 = ipairs
                V237()
                local V269 = GetMouse.ViewSizeY / 27
                local V270 = {}
                local V271 = false
                local SmoothScroll
                if not UserInputService2.TouchEnabled then
                    SmoothScroll = Instance.new("ScreenGui")
                    SmoothScroll.Name = "SmoothScroll"
                    SmoothScroll.Parent = PlayerGui
                    local Heartbeat = RunService.Heartbeat
                    V230[#V230 + 1] = Heartbeat:Connect(function()
                        for V272, V273 in V267(V270) do
                            if V273.Velocity > 0.05 or V273.Velocity < -0.05 then
                                V273.Velocity = V273.Velocity * V273.Frict
                                if V273.Axis == "X" then
                                    V272.CanvasPosition = Vector2.new(
                                        V272.CanvasPosition.X + V273.Velocity, V272.CanvasPosition.Y
                                    )
                                    if math.abs(V273.LastPos - V272.CanvasPosition.X) == 0 then
                                        V273.Velocity = 0
                                    end
                                    V273.LastPos = V272.CanvasPosition.X
                                else
                                    V272.CanvasPosition = Vector2.new(
                                        V272.CanvasPosition.X, V272.CanvasPosition.Y + V273.Velocity
                                    )
                                    if math.abs(V273.LastPos - V272.CanvasPosition.Y) == 0 then
                                        V273.Velocity = 0
                                    end
                                    V273.LastPos = V272.CanvasPosition.Y
                                end
                            end
                        end
                    end)
                    local PointerAction = UserInputService2.PointerAction
                    V230[#V230 + 1] = PointerAction:Connect(function(P52, P53, P54, P55)
                        if not V271 then
                            for V274, V275 in V268((PlayerGui:GetGuiObjectsAtPosition(GetMouse.X, GetMouse.Y))) do
                                local V276 = V270[V275]
                                if V276 and V276.Visibility.Visible == true then
                                    V276.Velocity = V276.Velocity - V276.Sens * P53.Y * (V276.Inverted and -1 or 1)
                                    break
                                end
                            end
                        end
                    end)
                    ContextActionService:BindActionAtPriority("SmoothScroll", function(P56, P57, P58)
                        if V271 then
                            return Enum.ContextActionResult.Pass
                        else
                            local V277 = false
                            for V278, V279 in V268((PlayerGui:GetGuiObjectsAtPosition(GetMouse.X, GetMouse.Y))) do
                                local V280 = V270[V279]
                                if V280 and V280.Visibility.Visible == true then
                                    V280.Velocity = V280.Velocity
                                        - V280.Sens * P58.Position.Z * (V280.Inverted and -1 or 1)
                                    V277 = true
                                    break
                                end
                            end
                            return V277 and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
                        end
                    end, false, 8000, Enum.UserInputType.MouseWheel)
                end
                local V281 = {}
                V281.__index = V281
                function V281.new(P59)
                    assert(typeof(P59) == "Instance" and P59:IsA("GuiObject"), "Argument #1 expected GuiObject")
                    local BindableEvent = Instance.new("BindableEvent")
                    local V282 = setmetatable({
                        GuiObject = P59,
                        Visible = nil,
                        Changed = BindableEvent.Event,
                        _path = {},
                        _conn = {},
                        _root = nil,
                        _visibleChanged = BindableEvent,
                    }, V281)
                    local function F20()
                        local Enabled = V282._root and V282._root.Enabled or false
                        if Enabled then
                            for V283, V284 in V268(V282._path) do
                                if not V284.Visible then
                                    Enabled = false
                                    break
                                end
                            end
                        end
                        if Enabled ~= V282.Visible then
                            V282.Visible = Enabled
                            BindableEvent:Fire(Enabled)
                        end
                    end
                    local function F21()
                        for V285, V286 in V268(V282._conn) do
                            V286:Disconnect()
                        end
                        local V287 = {}
                        local V288 = {}
                        local Parent2 = P59
                        while Parent2 and (Parent2:IsA("GuiObject") or Parent2:IsA("Folder")) do
                            if Parent2:IsA("GuiObject") then
                                local Visible = Parent2:GetPropertyChangedSignal("Visible")
                                V288[#V288 + 1] = Visible:Connect(F20)
                                V230[#V230 + 1] = V288[#V288]
                                V287[#V287 + 1] = Parent2
                            end
                            Parent2 = Parent2.Parent
                        end
                        local Root
                        if Parent2 and Parent2:IsA("LayerCollector") then
                            local Enabled2 = Parent2:GetPropertyChangedSignal("Enabled")
                            V288[#V288 + 1] = Enabled2:Connect(F20)
                            V230[#V230 + 1] = V288[#V288]
                            Root = Parent2
                        end
                        V282._path = V287
                        V282._conn = V288
                        V282._root = Root
                        F20()
                    end
                    V282._ancestry = P59.AncestryChanged:Connect(function(P60, P61) F21() end)
                    V230[#V230 + 1] = V282._ancestry
                    F21()
                    return V282
                end
                function V281:Destroy()
                    self._visibleChanged:Fire(false)
                    self._visibleChanged:Destroy()
                    self._ancestry:Disconnect()
                    for V289, V290 in V268(self._conn) do
                        V290:Disconnect()
                    end
                end
                local function F22(P62, P63)
                    local V291 = P63
                    V291 = V291 or "Y"
                    local V292 = P62 and typeof(P62) == "Instance" and P62.ClassName == "ScrollingFrame"
                    local TextButton, AbsoluteSize4, V293, V294, Connect2, Connect3, Connect4
                    if not V292 then
                        V238("Invalid frame to create custom bar")
                        return
                    else
                        TextButton = Instance.new("TextButton")
                        TextButton.Name = P62.Name .. "_Scroller_" .. V291
                        TextButton.Text = ""
                        TextButton.BackgroundTransparency = 1
                        TextButton.Visible = V270[P62].Visibility.Visible
                        local AbsolutePosition2 = P62.AbsolutePosition
                        local ScrollBarThickness = P62.ScrollBarThickness
                        AbsoluteSize4 = P62.AbsoluteSize
                        V293 = AbsolutePosition2
                        V294 = ScrollBarThickness
                        Connect2 = nil
                        local MouseButton1Down = TextButton.MouseButton1Down
                        V230[#V230 + 1] = MouseButton1Down:Connect(function()
                            local V295 = not V271 and not Connect2
                            local Vector22
                            if V295 then
                                V271 = true
                                Vector22 = Vector2.new(GetMouse.X, GetMouse.Y)
                                Connect2 = UserInputService2.InputChanged:Connect(function(Input)
                                    if Input.UserInputType == Enum.UserInputType.MouseMovement then
                                        local Vector32 = Vector2.new(Input.Position.X, Input.Position.Y)
                                        local V296 = Vector32 - Vector22
                                        local V297 = (V291 == "Y" and V296.Y or V296.X)
                                            / (V291 == "Y" and P62.AbsoluteWindowSize.Y or P62.AbsoluteWindowSize.X)
                                        local GuiBase2d = P62:FindFirstAncestorWhichIsA("GuiBase2d")
                                        local Vector4 = Vector2.new(P62.CanvasSize.X.Scale * GuiBase2d.AbsoluteSize.X
                                            + P62.CanvasSize.X.Offset, P62.CanvasSize.Y.Scale * GuiBase2d.AbsoluteSize.Y
                                            + P62.CanvasSize.Y.Offset)
                                        P62.CanvasPosition = Vector2.new(P62.CanvasPosition.X
                                            + (V291 == "X" and Vector4.X * V297 or 0), P62.CanvasPosition.Y
                                            + (V291 == "Y" and Vector4.Y * V297 or 0))
                                        Vector22 = Vector32
                                    end
                                end)
                            end
                        end)
                        Connect3 = UserInputService2.InputEnded:Connect(function(Input2)
                            if Input2.UserInputType == Enum.UserInputType.MouseButton1 and Connect2 then
                                V271 = false
                                Connect2:Disconnect()
                                Connect2 = nil
                            end
                        end)
                        V230[#V230 + 1] = Connect3
                        local Changed = V270[P62].Visibility.Changed
                        V230[#V230 + 1] = Changed:Connect(function(P64)
                            TextButton.Visible = P64
                            if not P64 and Connect2 then
                                V271 = false
                                Connect2:Disconnect()
                                Connect2 = nil
                            end
                        end)
                        if V291 == "X" then
                            TextButton.Size = UDim2.new(0, AbsoluteSize4.X, 0, V294)
                            TextButton.Position = UDim2.new(0, V293.X, 0, V293.Y + AbsoluteSize4.Y - V294)
                        else
                            TextButton.Size = UDim2.new(0, V294, 0, AbsoluteSize4.Y)
                            TextButton.Position = UDim2.new(0, P62.VerticalScrollBarPosition
                                        == Enum.VerticalScrollBarPosition.Right
                                    and V293.X + AbsoluteSize4.X - V294
                                or V293.X, 0, V293.Y)
                        end
                        Connect4 = nil
                        Connect4 = P62.Changed:Connect(function(P65)
                            if V270[P62] then
                                if P62:FindFirstAncestorWhichIsA("GuiBase2d") then
                                    if P65 == "AbsoluteSize" or P65 == "AbsolutePosition" or P65 == "AbsolutePosition"
                                        or P65 == "CanvasSize" or P65 == "ScrollBarThickness" then
                                        local AbsolutePosition3 = P62.AbsolutePosition
                                        local ScrollBarThickness2 = P62.ScrollBarThickness
                                        AbsoluteSize4 = P62.AbsoluteSize
                                        V293 = AbsolutePosition3
                                        V294 = ScrollBarThickness2
                                        if V291 == "X" then
                                            TextButton.Size = UDim2.new(0, AbsoluteSize4.X, 0, V294)
                                            TextButton.Position = UDim2.new(
                                                0, V293.X, 0, V293.Y + AbsoluteSize4.Y - V294
                                            )
                                        else
                                            TextButton.Size = UDim2.new(0, V294, 0, AbsoluteSize4.Y)
                                            TextButton.Position = UDim2.new(0, P62.VerticalScrollBarPosition
                                                        == Enum.VerticalScrollBarPosition.Right
                                                    and V293.X + AbsoluteSize4.X - V294
                                                or V293.X, 0, V293.Y)
                                        end
                                    end
                                end
                            else
                                TextButton:Destroy()
                                Connect4:Disconnect()
                                Connect3:Disconnect()
                                if Connect2 then
                                    Connect2:Disconnect()
                                    Connect2 = nil
                                end
                            end
                        end)
                        V230[#V230 + 1] = Connect4
                        TextButton.Parent = SmoothScroll
                        return
                    end
                end
                local V298 = {}
                function V298.Enable(P66, P67, P68, Inverted, P69)
                    local V299 = P69
                    local MouseEnabled = UserInputService2.MouseEnabled
                    local Parent3
                    if MouseEnabled and not UserInputService2.TouchEnabled then
                        if not (P66 and typeof(P66) == "Instance" and P66.ClassName == "ScrollingFrame") then
                            V238("Invalid frame to smooth")
                            return
                        end
                        if not V270[P66] then
                            P66.ScrollingEnabled = false
                            local V300 = {}
                            local V301 = {}
                            for V302, V303 in V268(P66:GetDescendants()) do
                                local V304 = V303
                                if V304:IsA("GuiObject") then
                                    V301[V304] = V304.Active
                                    V304.Active = false
                                    local Active = V304:GetPropertyChangedSignal("Active")
                                    V300[#V300 + 1] = Active:Connect(function() V304.Active = false end)
                                    V230[#V230 + 1] = V300[#V300]
                                end
                            end
                            Parent3 = P66
                            while Parent3 and (Parent3:IsA("GuiObject") or Parent3:IsA("Folder")) do
                                if Parent3:IsA("GuiObject") then
                                    V301[Parent3] = Parent3.Active
                                    Parent3.Active = false
                                    local Active2 = Parent3:GetPropertyChangedSignal("Active")
                                    V300[#V300 + 1] = Active2:Connect(function() Parent3.Active = false end)
                                    V230[#V230 + 1] = V300[#V300]
                                end
                                Parent3 = Parent3.Parent
                            end
                            local DescendantAdded = P66.DescendantAdded
                            V300[#V300 + 1] = DescendantAdded:Connect(function(P70)
                                if P70:IsA("GuiObject") then
                                    V270[P66].Actives[P70] = P70.Active
                                    P70.Active = false
                                    local Active3 = P70:GetPropertyChangedSignal("Active")
                                    V270[P66].Connections[#V270[P66].Connections + 1] = Active3:Connect(function()
                                        P70.Active = false
                                    end)
                                end
                            end)
                            V230[#V230 + 1] = V300[#V300]
                            if V299 and (V299 == "X" or V299 == "Y") then
                            else
                                V299 = "Y"
                                if P66.CanvasSize.Y.Offset > 0 or P66.CanvasSize.Y.Scale > 0 then
                                    V299 = "Y"
                                elseif P66.CanvasSize.X.Offset > 0 or P66.CanvasSize.X.Scale > 0 then
                                    V299 = "X"
                                end
                            end
                            V270[P66] = {
                                Connections = V300,
                                Actives = V301,
                                Velocity = 0,
                                LastPos = 0,
                                Visibility = V281.new(P66),
                                Inverted = Inverted,
                                Axis = V299,
                                Frict = math.clamp(type(P68) == "number" and P68 or 0.78, 0.2, 0.99),
                                Sens = math.clamp(type(P67) == "number" and P67 or V269, 0.01, 100000000000000000),
                            }
                            F22(P66, "X")
                            F22(P66, "Y")
                        else
                            local V305 = V270[P66]
                            V305.Sens = math.clamp(type(P67) == "number" and P67 or V269, 0.01, 100000000000000000)
                            local V306 = V270[P66]
                            V306.Frict = math.clamp(type(P68) == "number" and P68 or 0.78, 0.2, 0.99)
                            V270[P66].Inverted = Inverted
                        end
                        return
                    end
                end
                function V298.Disable(P71)
                    if V270[P71] then
                        P71.ScrollingEnabled = true
                        for V307, V308 in V268(V270[P71].Connections) do
                            V308:Disconnect()
                        end
                        V270[P71].Visibility:Destroy()
                        for V309, V310 in V267(V270[P71].Actives) do
                            V309.Active = V310
                        end
                        V270[P71] = nil
                    end
                end
                return V298
            end
            local V311 = F19()
            local function F23(P72, Parent4)
                local UiDragDetector = Instance.new("UIDragDetector")
                UiDragDetector.Parent = Parent4
                UiDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
                local V312, V313
                UiDragDetector.DragContinue:Connect(function(P73)
                    if not V312 then
                        local Position5 = P72.Position
                        V312 = P73
                        V313 = Position5
                        return
                    else
                        local V314 = P73 - V312
                        V231:Create(P72, TweenInfo.new(0.05), {
                            Position = UDim2.new(
                                V313.X.Scale, V313.X.Offset + V314.X, V313.Y.Scale, V313.Y.Offset + V314.Y
                            ),
                        }):Play()
                        return
                    end
                end)
                UiDragDetector.DragEnd:Connect(function() V312 = nil end)
            end
            function V242.CreateWindow(P74, P75)
                local Translations = P75.Translations
                if not V224 and not Translations then
                    V238("no translations!")
                end
                local V315 = {}
                local LunarBACKGROUND = _G.LUNAR_BACKGROUND or getcustomasset("banner.png")
                if isfolder("lunarbackgrounds") then
                    delfolder("lunarbackgrounds")
                end
                makefolder("lunarbackgrounds")
                function _G.UpdGuiBackground()
                    LunarBACKGROUND = _G.LUNAR_BACKGROUND
                    if LunarBACKGROUND then
                        local V316 = "lunarbackgrounds/" .. randomstring(10)
                        if (LunarBACKGROUND:find("https://") or LunarBACKGROUND:find("http://"))
                            and not LunarBACKGROUND:match("http?.://roblox%.com") then
                            local V317 = safehttpget(LunarBACKGROUND)
                            if V317 and type(V317) == "string" then
                                writefile(V316, V317)
                                LunarBACKGROUND = getcustomasset(V316) or getcustomasset("banner.png")
                            end
                        end
                    else
                        LunarBACKGROUND = getcustomasset("banner.png")
                    end
                end
                _G.UpdGuiBackground()
                local Name3 = P75.Name
                local Icon = P75.Icon
                if typeof(Icon) == "number" then
                    Icon = "rbxassetid://" .. Icon
                end
                local ScreenGui = Instance.new("ScreenGui")
                local Frame2 = Instance.new("Frame")
                local Backgroundimagelabel = Instance.new("ImageLabel")
                local UiCorner3 = Instance.new("UICorner")
                local Frame3 = Instance.new("Frame")
                local UiCorner4 = Instance.new("UICorner")
                local ImageLabel = Instance.new("ImageLabel")
                local TextLabel2 = Instance.new("TextLabel")
                local Search = Instance.new("Frame")
                local UiCorner5 = Instance.new("UICorner")
                local ImageLabel2 = Instance.new("ImageLabel")
                local TextBox = Instance.new("TextBox")
                local UiCorner6 = Instance.new("UICorner")
                local Frame4 = Instance.new("Frame")
                local ScrollingFrame = Instance.new("ScrollingFrame")
                local UiListLayout = Instance.new("UIListLayout")
                F23(Frame2, Frame3)
                local UiShadow = Instance.new("UIShadow")
                UiShadow.Parent = Frame2
                UiShadow.BlurRadius = UDim.new(0, 10)
                ScreenGui.Name = GetService("HttpService"):GenerateGUID()
                ScreenGui.Parent = not V228:IsStudio() and gethui() or V232.PlayerGui
                ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                ScreenGui.ResetOnSpawn = false
                ScreenGui.Enabled = false
                ScreenGui.OnTopOfCoreBlur = true
                ScreenGui.DisplayOrder = 2147483647
                _G.globaluilibrary = ScreenGui
                local InputBegan2 = V227.InputBegan
                V230[#V230 + 1] = InputBegan2:Connect(function(P76, P77)
                    if V235[1][V235[3]] then
                        return
                    end
                    if P77 then
                        return
                    end
                    if P76.KeyCode == Enum.KeyCode.F4 then
                        if V239.MobileToggle and V239.MobileToggle.isSelected then
                            V239.MobileToggle:deselect()
                        elseif V239.MobileToggle then
                            V239.MobileToggle:select()
                        end
                    end
                end)
                local Tooltip = Instance.new("Frame")
                local UiCorner7 = Instance.new("UICorner")
                local UiStroke = Instance.new("UIStroke")
                local UiPadding = Instance.new("UIPadding")
                local TextLabel3 = Instance.new("TextLabel")
                local UiScale = Instance.new("UIScale")
                Tooltip.Name = "Tooltip"
                Tooltip.Parent = ScreenGui
                Tooltip.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Tooltip.BackgroundTransparency = 0.05
                Tooltip.BorderSizePixel = 0
                Tooltip.Size = UDim2.fromOffset(220, 0)
                Tooltip.AutomaticSize = Enum.AutomaticSize.Y
                Tooltip.Visible = false
                Tooltip.ZIndex = 1000
                UiCorner7.CornerRadius = UDim.new(0, 7)
                UiCorner7.Parent = Tooltip
                UiStroke.Color = Color3.fromRGB(65, 65, 65)
                UiStroke.Thickness = 1
                UiStroke.Transparency = 0.15
                UiStroke.Parent = Tooltip
                UiPadding.PaddingLeft = UDim.new(0, 10)
                UiPadding.PaddingRight = UDim.new(0, 10)
                UiPadding.PaddingTop = UDim.new(0, 7)
                UiPadding.PaddingBottom = UDim.new(0, 7)
                UiPadding.Parent = Tooltip
                TextLabel3.Parent = Tooltip
                TextLabel3.BackgroundTransparency = 1
                TextLabel3.BorderSizePixel = 0
                TextLabel3.Size = UDim2.new(1, 0, 0, 0)
                TextLabel3.AutomaticSize = Enum.AutomaticSize.Y
                TextLabel3.Font = Enum.Font.Gotham
                TextLabel3.TextColor3 = Color3.fromRGB(220, 220, 220)
                TextLabel3.TextSize = 12
                TextLabel3.TextWrapped = true
                TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel3.TextYAlignment = Enum.TextYAlignment.Top
                TextLabel3.RichText = true
                TextLabel3.ZIndex = 1001
                UiScale.Scale = 1
                UiScale.Parent = Tooltip
                local V318 = false
                local Count2 = 0
                local V319
                local function F24()
                    if V319 then
                        return V319.Position
                    end
                    return V227:GetMouseLocation()
                end
                local function F25()
                    if not V318 then
                        return
                    else
                        local CurrentCamera = workspace.CurrentCamera
                        if not CurrentCamera then
                            return
                        else
                            local ViewportSize = CurrentCamera.ViewportSize
                            local V320 = F24()
                            local AbsoluteSize5 = Tooltip.AbsoluteSize
                            local V321 = V320.X + 14
                            local V322 = V320.Y - AbsoluteSize5.Y - 14
                            if V321 + AbsoluteSize5.X > ViewportSize.X - 6 then
                                V321 = V320.X - AbsoluteSize5.X - 14
                            end
                            if V322 < 6 then
                                V322 = V320.Y + 14
                            end
                            local V323 = math.clamp(V321, 6, math.max(6, ViewportSize.X - AbsoluteSize5.X - 6))
                            local V324 = math.clamp(V322, 6, math.max(6, ViewportSize.Y - AbsoluteSize5.Y - 6))
                            Tooltip.Position = UDim2.fromOffset(V323, V324)
                            return
                        end
                    end
                end
                local V325
                local function F26(P78, P79)
                    if not P79 or P79 == "" then
                        return
                    end
                    Count2 = Count2 + 1
                    local V326 = Count2
                    V325 = P78
                    V318 = true
                    TextLabel3.Text = P79
                    Tooltip.Visible = true
                    UiScale.Scale = 0.96
                    Tooltip.BackgroundTransparency = 0.05
                    UiStroke.Transparency = 0.15
                    task.defer(function()
                        if V326 ~= Count2 or not V318 then
                            return
                        end
                        F25()
                        V231:Create(UiScale, TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            Scale = 1,
                        }):Play()
                    end)
                end
                local function F27()
                    Count2 = Count2 + 1
                    V325 = nil
                    V318 = false
                    V319 = nil
                    Tooltip.Visible = false
                end
                local function F28(P80, P81)
                    if not P80 or not P81 then
                        return
                    end
                    local ToolTip = P81.ToolTip
                    if not ToolTip or ToolTip == "" then
                        return
                    else
                        P80.Active = true
                        local MouseEnter = P80.MouseEnter
                        V230[#V230 + 1] = MouseEnter:Connect(function()
                            if V233 then
                                return
                            end
                            F26(P80, ToolTip)
                        end)
                        local MouseLeave = P80.MouseLeave
                        V230[#V230 + 1] = MouseLeave:Connect(function()
                            if V233 then
                                return
                            end
                            if V325 == P80 then
                                F27()
                            end
                        end)
                        local InputBegan3 = P80.InputBegan
                        V230[#V230 + 1] = InputBegan3:Connect(function(P82)
                            if P82.UserInputType ~= Enum.UserInputType.Touch then
                                return
                            end
                            V319 = P82
                            Count2 = Count2 + 1
                            local V327 = Count2
                            task.delay(0.28, function()
                                if V327 ~= Count2 then
                                    return
                                end
                                if V319 ~= P82 then
                                    return
                                end
                                F26(P80, ToolTip)
                            end)
                        end)
                        local InputChanged2 = P80.InputChanged
                        V230[#V230 + 1] = InputChanged2:Connect(function(P83)
                            if P83.UserInputType == Enum.UserInputType.Touch then
                                V319 = P83
                                if V325 == P80 then
                                    F25()
                                end
                            end
                        end)
                        local InputEnded2 = P80.InputEnded
                        V230[#V230 + 1] = InputEnded2:Connect(function(P84)
                            if P84.UserInputType == Enum.UserInputType.Touch then
                                if V319 == P84 then
                                    F27()
                                end
                            end
                        end)
                        return
                    end
                end
                local InputChanged3 = V227.InputChanged
                V230[#V230 + 1] = InputChanged3:Connect(function(P85)
                    if P85.UserInputType == Enum.UserInputType.MouseMovement then
                        if V318 then
                            F25()
                        end
                    elseif P85.UserInputType == Enum.UserInputType.Touch then
                        if V318 then
                            V319 = P85
                            F25()
                        end
                    end
                end)
                ScreenGui.IgnoreGuiInset = true
                Frame2.Parent = ScreenGui
                Frame2.AnchorPoint = Vector2.new(0.5, 0.5)
                Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Frame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Frame2.BorderSizePixel = 0
                Frame2.Position = UDim2.new(0.5, 0, 0.5, 0)
                Frame2.Size = (V233 or _G.SINGLE_COLUMNS)
                        and UDim2.new(0, 570, 0, (V233 or _G.SINGLE_COLUMNS) and ScreenGui.AbsoluteSize.Y / 1.4)
                    or UDim2.new(0, 890, 0, 460)
                UiCorner3.TopLeftRadius = UDim.new(0, 5)
                UiCorner3.TopRightRadius = UDim.new(0, 5)
                UiCorner3.BottomRightRadius = UDim.new(0, 5)
                UiCorner3.BottomLeftRadius = UDim.new(0, 5)
                UiCorner3.Parent = Frame2
                local UiStroke2 = Instance.new("UIStroke")
                F11(UiStroke2, "Color")
                UiStroke2.Transparency = 0.75
                UiStroke2.Thickness = 1
                UiStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                UiStroke2.Parent = Frame2
                Frame3.Parent = Frame2
                Frame3.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
                Frame3.BackgroundTransparency = 0.65
                Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Frame3.BorderSizePixel = 0
                Frame3.Size = UDim2.new(1, 0, 0, 50)
                UiCorner4.TopLeftRadius = UDim.new(0, 5)
                UiCorner4.TopRightRadius = UDim.new(0, 5)
                UiCorner4.BottomRightRadius = UDim.new(0, 0)
                UiCorner4.BottomLeftRadius = UDim.new(0, 0)
                UiCorner4.Parent = Frame3
                ImageLabel.Parent = Frame3
                ImageLabel.AnchorPoint = Vector2.new(0, 0.5)
                ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel.BackgroundTransparency = 1
                ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ImageLabel.BorderSizePixel = 0
                ImageLabel.Position = UDim2.new(0, 3, 0.5, 0)
                ImageLabel.Size = UDim2.new(0, 36, 0, 36)
                ImageLabel.Image = Icon
                TextLabel2.Parent = Frame3
                TextLabel2.AnchorPoint = Vector2.new(0, 0.5)
                TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel2.BackgroundTransparency = 1
                TextLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextLabel2.BorderSizePixel = 0
                TextLabel2.Position = UDim2.new(0, 50, 0.5, 0)
                TextLabel2.Size = UDim2.new(0, 200, 0, 20)
                TextLabel2.FontFace = Font.fromName("Arial", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                TextLabel2.Text = Name3
                TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel2.TextSize = 14
                TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel2.RichText = true
                local Clone2 = TextLabel2:Clone()
                Clone2.Parent = Frame3
                Clone2.AnchorPoint = Vector2.new(1, 0.5)
                Clone2.Position = UDim2.new(1, -17, 0.5, 0)
                Clone2.Text = P75.Version or "V0.0"
                Clone2.TextColor3 = Color3.fromRGB(144, 144, 144)
                Clone2.Size = UDim2.new(0, 34, 0, 14)
                Clone2.TextXAlignment = Enum.TextXAlignment.Right
                local UiGradient2 = Instance.new("UIGradient")
                F10(function()
                    UiGradient2.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, F9()), ColorSequenceKeypoint.new(1, F9("alt")),
                    })
                end)
                UiGradient2.Parent = TextLabel2
                function _G.UpdGuiTitle()
                    TextLabel2.Text = type(_G.LUNAR_TITLE) == "string" and _G.LUNAR_TITLE or Name3
                end
                local Color32 = Color3.fromRGB(150, 150, 150)
                local TweenInfo2 = TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                local TweenInfo22 = TweenInfo.new(0.15)
                local V328 = false
                local V329 = false
                V228.RenderStepped:Wait()
                Search.Name = "search"
                Search.Parent = Frame3
                Search.AnchorPoint = Vector2.new(1, 0.5)
                F11(Search, "BackgroundColor3", "dark")
                Search.BackgroundTransparency = 1
                Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Search.BorderSizePixel = 0
                Search.ClipsDescendants = true
                Search.Position = UDim2.new(1, -(22 + Clone2.TextBounds.X + 56), 0.5, 0)
                Search.Size = UDim2.new(0, 28, 1, -24)
                UiCorner5.CornerRadius = UDim.new(0, 5)
                UiCorner5.Parent = Search
                local Search2 = V226("search")
                ImageLabel2.Parent = Search
                ImageLabel2.AnchorPoint = Vector2.new(1, 0.5)
                ImageLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ImageLabel2.BackgroundTransparency = 1
                ImageLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ImageLabel2.BorderSizePixel = 0
                ImageLabel2.Position = UDim2.new(1, -6, 0.5, 0)
                ImageLabel2.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel2.Image = Search2.id
                ImageLabel2.ImageRectOffset = Search2.imageRectOffset
                ImageLabel2.ImageRectSize = Search2.imageRectSize
                ImageLabel2.ImageColor3 = Color32
                TextBox.Parent = Search
                TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.BackgroundTransparency = 1
                TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                TextBox.BorderSizePixel = 0
                TextBox.ClipsDescendants = true
                TextBox.Position = UDim2.new(0, 4, 0, 0)
                TextBox.Size = UDim2.new(1, -34, 1, 0)
                TextBox.Font = Enum.Font.GothamMedium
                TextBox.PlaceholderText = "Search"
                TextBox.Text = ""
                TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextBox.TextSize = 14
                TextBox.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.Visible = false
                local Hit = Instance.new("TextButton")
                Hit.Name = "hit"
                Hit.Parent = Search
                Hit.BackgroundTransparency = 1
                Hit.BorderSizePixel = 0
                Hit.Size = UDim2.new(1, 0, 1, 0)
                Hit.Text = ""
                Hit.AutoButtonColor = false
                Hit.ZIndex = 5
                local function F29()
                    V231:Create(ImageLabel2, TweenInfo22, { ImageColor3 = (V328 or V329) and F9("hover") or Color32 }):Play()
                end
                F10(F29)
                local function F30(P86)
                    V328 = P86
                    V329 = false
                    Hit.Visible = not P86
                    TextBox.Visible = P86
                    V231:Create(Search, TweenInfo2, {
                        Size = UDim2.new(0, P86 and 139 or 28, 1, -24),
                        BackgroundTransparency = P86 and 0.65 or 1,
                    }):Play()
                    F29()
                    if P86 then
                        TextBox:CaptureFocus()
                    end
                end
                local MouseEnter2 = Hit.MouseEnter
                V230[#V230 + 1] = MouseEnter2:Connect(function()
                    V329 = true
                    F29()
                end)
                local MouseLeave2 = Hit.MouseLeave
                V230[#V230 + 1] = MouseLeave2:Connect(function()
                    V329 = false
                    F29()
                end)
                local MouseButton1Click = Hit.MouseButton1Click
                V230[#V230 + 1] = MouseButton1Click:Connect(function()
                    PlaySound("select")
                    F30(true)
                end)
                local FocusLost = TextBox.FocusLost
                V230[#V230 + 1] = FocusLost:Connect(function()
                    if V328 and TextBox.Text == "" then
                        F30(false)
                    end
                end)
                local Settings = Instance.new("Frame")
                Settings.Name = "settings"
                Settings.Parent = Frame3
                Settings.AnchorPoint = Vector2.new(1, 0.5)
                Settings.BackgroundTransparency = 1
                Settings.BorderSizePixel = 0
                Settings.ClipsDescendants = true
                Settings.Position = UDim2.new(1, -(22 + Clone2.TextBounds.X), 0.5, 0)
                Settings.Size = UDim2.new(0, 28, 1, -24)
                local UiCorner8 = Instance.new("UICorner")
                UiCorner8.CornerRadius = UDim.new(0, 5)
                UiCorner8.Parent = Settings
                local Settings2 = V226("settings")
                local ImageLabel3 = Instance.new("ImageLabel")
                ImageLabel3.Parent = Settings
                ImageLabel3.AnchorPoint = Vector2.new(1, 0.5)
                ImageLabel3.BackgroundTransparency = 1
                ImageLabel3.BorderSizePixel = 0
                ImageLabel3.Position = UDim2.new(1, -6, 0.5, 0)
                ImageLabel3.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel3.Image = Settings2.id
                ImageLabel3.ImageRectOffset = Settings2.imageRectOffset
                ImageLabel3.ImageRectSize = Settings2.imageRectSize
                ImageLabel3.ImageColor3 = Color32
                local Hit2 = Instance.new("TextButton")
                Hit2.Name = "hit"
                Hit2.Parent = Settings
                Hit2.BackgroundTransparency = 1
                Hit2.BorderSizePixel = 0
                Hit2.Size = UDim2.new(1, 0, 1, 0)
                Hit2.Text = ""
                Hit2.AutoButtonColor = false
                Hit2.ZIndex = 5
                local function F31(ImageColor3)
                    V231:Create(ImageLabel3, TweenInfo22, { ImageColor3 = ImageColor3 }):Play()
                end
                local MouseEnter3 = Hit2.MouseEnter
                V230[#V230 + 1] = MouseEnter3:Connect(function() F31(F9("hover")) end)
                local MouseLeave3 = Hit2.MouseLeave
                V230[#V230 + 1] = MouseLeave3:Connect(function() F31(Color32) end)
                local MouseButton1Click2 = Hit2.MouseButton1Click
                V230[#V230 + 1] = MouseButton1Click2:Connect(function()
                    if not V242._SettingsTabIndex then
                        V238("yo theres no settings tab wtf")
                    end
                    PlaySound("select")
                    V315:SelectTab(V242._SettingsTabIndex)
                end)
                local Theme = Instance.new("Frame")
                Theme.Name = "theme"
                Theme.Parent = Frame3
                Theme.AnchorPoint = Vector2.new(1, 0.5)
                Theme.BackgroundTransparency = 1
                Theme.BorderSizePixel = 0
                Theme.ClipsDescendants = true
                Theme.Position = UDim2.new(1, -(22 + Clone2.TextBounds.X + 28), 0.5, 0)
                Theme.Size = UDim2.new(0, 28, 1, -24)
                local UiCorner9 = Instance.new("UICorner")
                UiCorner9.CornerRadius = UDim.new(0, 5)
                UiCorner9.Parent = Theme
                local Paintbrush = V226("paintbrush")
                local ImageLabel4 = Instance.new("ImageLabel")
                ImageLabel4.Parent = Theme
                ImageLabel4.AnchorPoint = Vector2.new(1, 0.5)
                ImageLabel4.BackgroundTransparency = 1
                ImageLabel4.BorderSizePixel = 0
                ImageLabel4.Position = UDim2.new(1, -6, 0.5, 0)
                ImageLabel4.Size = UDim2.new(0, 16, 0, 16)
                ImageLabel4.Image = Paintbrush.id
                ImageLabel4.ImageRectOffset = Paintbrush.imageRectOffset
                ImageLabel4.ImageRectSize = Paintbrush.imageRectSize
                ImageLabel4.ImageColor3 = Color32
                local Hit3 = Instance.new("TextButton")
                Hit3.Name = "hit"
                Hit3.Parent = Theme
                Hit3.BackgroundTransparency = 1
                Hit3.BorderSizePixel = 0
                Hit3.Size = UDim2.new(1, 0, 1, 0)
                Hit3.Text = ""
                Hit3.AutoButtonColor = false
                Hit3.ZIndex = 5
                local function F32(ImageColor32)
                    V231:Create(ImageLabel4, TweenInfo22, { ImageColor3 = ImageColor32 }):Play()
                end
                local MouseEnter4 = Hit3.MouseEnter
                V230[#V230 + 1] = MouseEnter4:Connect(function() F32(F9("hover")) end)
                local MouseLeave4 = Hit3.MouseLeave
                V230[#V230 + 1] = MouseLeave4:Connect(function() F32(Color32) end)
                local MouseButton1Click3 = Hit3.MouseButton1Click
                V230[#V230 + 1] = MouseButton1Click3:Connect(function()
                    if not V242._ThemeTabIndex then
                        return V238("no theme tab, call Window:CreateThemeTab()")
                    end
                    PlaySound("select")
                    V315:SelectTab(V242._ThemeTabIndex)
                end)
                Backgroundimagelabel.Name = "backgroundimagelabel"
                Backgroundimagelabel.Parent = Frame2
                Backgroundimagelabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Backgroundimagelabel.BackgroundTransparency = 1
                Backgroundimagelabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Backgroundimagelabel.BorderSizePixel = 0
                Backgroundimagelabel.Size = UDim2.new(1, 0, 1, 0)
                Backgroundimagelabel.ZIndex = 0
                Backgroundimagelabel.Image = LunarBACKGROUND
                Backgroundimagelabel.ImageColor3 = Color3.fromRGB(116, 116, 116)
                Backgroundimagelabel.ScaleType = Enum.ScaleType.Crop
                function v1363()
                    Backgroundimagelabel.Image = LunarBACKGROUND or getcustomasset("banner.png")
                end
                UiCorner6.CornerRadius = UDim.new(0, 5)
                UiCorner6.Parent = Backgroundimagelabel
                Frame4.Parent = Frame2
                Frame4.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Frame4.BackgroundTransparency = 0.65
                Frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Frame4.BorderSizePixel = 0
                Frame4.Position = UDim2.new(0, 1, 0, 50)
                Frame4.Size = UDim2.new(0, P75.TabWidth or 160, 1, -50)
                ScrollingFrame.Parent = Frame4
                ScrollingFrame.Active = true
                ScrollingFrame.AnchorPoint = Vector2.new(0, 0.5)
                ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ScrollingFrame.BackgroundTransparency = 1
                ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                ScrollingFrame.BorderSizePixel = 0
                ScrollingFrame.Position = UDim2.new(0, 0, 0.5, 0)
                ScrollingFrame.Size = UDim2.new(1, 0, 1, -6)
                ScrollingFrame.ScrollBarThickness = 2
                F11(ScrollingFrame, "ScrollBarImageColor3", "mid")
                ScrollingFrame.ScrollBarImageTransparency = 0.4
                ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
                ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
                ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
                ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                ScrollingFrame.ClipsDescendants = true
                F13(ScrollingFrame)
                V311.Enable(ScrollingFrame, 2, 0.9)
                UiListLayout.Parent = ScrollingFrame
                UiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UiListLayout.Padding = UDim.new(0, 4)
                local PageHolder = Instance.new("Frame")
                PageHolder.Name = "PageHolder"
                PageHolder.Parent = Frame2
                PageHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                PageHolder.BackgroundTransparency = 1
                PageHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
                PageHolder.BorderSizePixel = 0
                PageHolder.Position = UDim2.new(0, 161, 0, 50)
                PageHolder.Size = UDim2.new(1, -159, 1, -60)
                PageHolder.ClipsDescendants = true
                local TabWidth = P75.TabWidth or 160
                local V330 = false
                local V331 = {}
                local TweenInfo3 = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
                local function F33(P87, P88, P89)
                    if P89 then
                        for Key3, Value7 in pairs(P88) do
                            P87[Key3] = Value7
                        end
                    else
                        V231:Create(P87, TweenInfo3, P88):Play()
                    end
                end
                UiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                local MenuButton = Instance.new("Frame")
                MenuButton.Name = "MenuButton"
                MenuButton.Parent = ScrollingFrame
                MenuButton.LayoutOrder = -2
                F11(MenuButton, "BackgroundColor3", "deep")
                MenuButton.BackgroundTransparency = 1
                MenuButton.BorderSizePixel = 0
                MenuButton.ClipsDescendants = true
                local Menu = V226("menu")
                local ImageLabel5 = Instance.new("ImageLabel")
                ImageLabel5.Parent = MenuButton
                ImageLabel5.AnchorPoint = Vector2.new(0, 0.5)
                ImageLabel5.BackgroundTransparency = 1
                ImageLabel5.BorderSizePixel = 0
                ImageLabel5.Size = UDim2.fromOffset(16, 16)
                ImageLabel5.Image = Menu.id
                ImageLabel5.ImageRectOffset = Menu.imageRectOffset
                ImageLabel5.ImageRectSize = Menu.imageRectSize
                F11(ImageLabel5, "ImageColor3")
                ImageLabel5.ScaleType = Enum.ScaleType.Fit
                local TextLabel4 = Instance.new("TextLabel")
                TextLabel4.Parent = MenuButton
                TextLabel4.AnchorPoint = Vector2.new(0, 0.5)
                TextLabel4.BackgroundTransparency = 1
                TextLabel4.BorderSizePixel = 0
                TextLabel4.Position = UDim2.new(0, 30, 0.5, 0)
                TextLabel4.Size = UDim2.new(0, 200, 0, 20)
                TextLabel4.Font = Enum.Font.GothamMedium
                TextLabel4.Text = "Collapse"
                F11(TextLabel4, "TextColor3")
                TextLabel4.TextSize = 13
                TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel4.TextTransparency = 1
                local TextButton2 = Instance.new("TextButton")
                TextButton2.Parent = MenuButton
                TextButton2.Text = ""
                TextButton2.ZIndex = 2
                TextButton2.BackgroundTransparency = 1
                TextButton2.BorderSizePixel = 0
                TextButton2.Size = UDim2.fromScale(1, 1)
                local MouseEnter5 = TextButton2.MouseEnter
                V230[#V230 + 1] = MouseEnter5:Connect(function()
                    V231:Create(MenuButton, TweenInfo.new(0.1), { BackgroundTransparency = 0.8 }):Play()
                end)
                local MouseLeave5 = TextButton2.MouseLeave
                V230[#V230 + 1] = MouseLeave5:Connect(function()
                    V231:Create(MenuButton, TweenInfo.new(0.1), { BackgroundTransparency = 1 }):Play()
                end)
                table.insert(V331, function(P90, P91)
                    F33(MenuButton, { Size = P90 and UDim2.new(1, -4, 0, 35) or UDim2.fromOffset(35, 35) }, P91)
                    F33(ImageLabel5, { Position = UDim2.new(0, P90 and 7 or 10, 0.5, 0) }, P91)
                    F33(TextLabel4, { TextTransparency = P90 and 0 or 1 }, P91)
                end)
                local MenuDivider = Instance.new("Frame")
                MenuDivider.Name = "MenuDivider"
                MenuDivider.Parent = ScrollingFrame
                MenuDivider.LayoutOrder = -1
                MenuDivider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                MenuDivider.BackgroundTransparency = 0.5
                MenuDivider.BorderSizePixel = 0
                table.insert(V331, function(P92, P93)
                    F33(MenuDivider, { Size = P92 and UDim2.new(1, -12, 0, 1) or UDim2.fromOffset(28, 1) }, P93)
                end)
                local function F34(P94, P95)
                    V330 = P94
                    local V332 = P94 and TabWidth or 48
                    F33(Frame4, { Size = UDim2.new(0, V332, 1, -50) }, P95)
                    F33(
                        PageHolder,
                        { Position = UDim2.new(0, V332 + 1, 0, 50), Size = UDim2.new(1, -(V332 - 1), 1, -60) }, P95
                    )
                    for Index5, Value8 in ipairs(V331) do
                        Value8(P94, P95)
                    end
                end
                local MouseButton1Click4 = TextButton2.MouseButton1Click
                V230[#V230 + 1] = MouseButton1Click4:Connect(function() F34(not V330) end)
                F34(true, true)
                local V333 = {}
                local F35
                local function F36(P96)
                    local Lower = P96:lower()
                    local V334 = 0
                    local V335
                    for Key4, Value9 in pairs(V333) do
                        if Key4 == V242._SettingsTabIndex or Key4 == V242._ThemeTabIndex then
                        else
                            local Total2 = 0
                            for Key5, Value10 in pairs(Value9.Features) do
                                Total2 = Total2 + F35(Value10, Lower)
                            end
                            Value9.Frame.Visible = Total2 > 0
                            if Total2 > V334 then
                                V335 = Key4
                                V334 = Total2
                            end
                        end
                    end
                    if V335 then
                        V315:SelectTab(V335)
                    end
                end
                function F35(P97, P98)
                    local Lower2 = P97:lower()
                    local Total3 = 0
                    if Lower2 == P98 then
                        return 100
                    else
                        local V336 = {}
                        for Match in P98:gmatch("%S+") do
                            table.insert(V336, Match)
                        end
                        if #V336 > 1 then
                            for Index6, Value11 in ipairs(V336) do
                                if not Lower2:find(Value11, 1, true) then
                                    return 0
                                end
                                Total3 = Total3 + 1
                            end
                            if Lower2:find(P98, 1, true) then
                                Total3 = Total3 + 3
                            end
                            if Lower2 == P98 then
                                return 100
                            end
                            return Total3 - #Lower2 / 20
                        else
                            local Find = Lower2:find(P98, 1, true)
                            if not Find then
                                return 0
                            else
                                local V337 = Total3 + 1
                                if Find == 1 then
                                    V337 = V337 + 4
                                end
                                for Match2 in Lower2:gmatch("%S+") do
                                    if Match2:sub(1, #P98) == P98 then
                                        V337 = V337 + 3
                                        break
                                    elseif Match2 == P98 then
                                        V337 = V337 + 5
                                        break
                                    end
                                end
                                return V337 - #Lower2 / 20
                            end
                        end
                    end
                end
                local Text = TextBox:GetPropertyChangedSignal("Text")
                V230[#V230 + 1] = Text:Connect(function()
                    local Text2 = TextBox.Text
                    if Text2 ~= "" then
                        F36(Text2)
                    else
                        for Key6, Value12 in pairs(V333) do
                            if Key6 == V242._SettingsTabIndex or Key6 == V242._ThemeTabIndex then
                            else
                                Value12.Frame.Visible = true
                            end
                        end
                    end
                end)
                function V315:CreateTab(P99, P100)
                    local V338 = P99
                    local V339 = V338
                    if V338 == "#!SETTINGS" then
                        V338 = "Settings"
                    elseif V338 == "#!THEME" then
                        V338 = "Theme"
                    end
                    local TabButton = Instance.new("Frame")
                    local Frame5 = Instance.new("Frame")
                    local TextLabel5 = Instance.new("TextLabel")
                    local ImageLabel6 = Instance.new("ImageLabel")
                    local V340 = V226(P100)
                    local Page = Instance.new("Frame")
                    local Frame6 = Instance.new("Frame")
                    local TextLabel6 = Instance.new("TextLabel")
                    local ScrollingFrame2 = Instance.new("ScrollingFrame")
                    local ScrollingFrame3 = Instance.new("ScrollingFrame")
                    local UiListLayout2 = Instance.new("UIListLayout")
                    local UiListLayout3 = Instance.new("UIListLayout")
                    local ScrollingFrame4 = ScrollingFrame2
                    Page.Name = "Page"
                    setthreadidentity(8)
                    local CatsakenTabStorage = V239.CatsakenTabStorage or Instance.new("ScreenGui")
                    V239.CatsakenTabStorage = CatsakenTabStorage
                    Page.Parent = nil
                    Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    Page.BackgroundTransparency = 1
                    Page.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Page.BorderSizePixel = 0
                    Page.Position = UDim2.new(0, 0, 0, -30)
                    Page.Size = UDim2.new(1, 0, 1, 0)
                    Page.Visible = false
                    Frame6.Parent = Page
                    Frame6.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    Frame6.BackgroundTransparency = 0.75
                    Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame6.BorderSizePixel = 0
                    Frame6.Size = UDim2.new(1, -1, 0, 28)
                    Frame6.Position = UDim2.fromOffset(-1, 0)
                    TextLabel6.Parent = Frame6
                    TextLabel6.AnchorPoint = Vector2.new(0, 0.5)
                    TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel6.BackgroundTransparency = 1
                    TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel6.BorderSizePixel = 0
                    TextLabel6.Position = UDim2.new(0, 8, 0.5, 0)
                    TextLabel6.Size = UDim2.new(1, 0, 1, 0)
                    TextLabel6.Font = Enum.Font.GothamMedium
                    TextLabel6.Text = V338 .. " <font color=\"rgb(144,144,144)\"> | </font>0 elements"
                    F11(TextLabel6, "TextColor3")
                    TextLabel6.TextSize = 12
                    TextLabel6.RichText = true
                    TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                    for Index7, Value13 in ipairs({ ScrollingFrame2, ScrollingFrame3 }) do
                        Value13.Parent = Page
                        Value13.Active = true
                        Value13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Value13.BackgroundTransparency = 1
                        Value13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Value13.BorderSizePixel = 0
                        Value13.ScrollBarThickness = 0
                        Value13.CanvasSize = UDim2.new(0, 0, 0, 0)
                        Value13.AutomaticCanvasSize = Enum.AutomaticSize.Y
                        Value13.ScrollingDirection = Enum.ScrollingDirection.Y
                        Value13.ClipsDescendants = true
                        V311.Enable(Value13, 4, 0.9)
                    end
                    ScrollingFrame2.Position = UDim2.new(0, 0, 0, 28)
                    local UiPadding2 = Instance.new("UIPadding")
                    UiPadding2.PaddingLeft = UDim.new(0, 6)
                    UiPadding2.Parent = ScrollingFrame2
                    local UiPadding3 = Instance.new("UIPadding")
                    UiPadding3.PaddingLeft = UDim.new(0, 1)
                    UiPadding3.Parent = ScrollingFrame3
                    if V233 or _G.SINGLE_COLUMNS then
                        ScrollingFrame2.Size = UDim2.new(1, 0, 1, -28)
                        ScrollingFrame3.Visible = false
                    else
                        ScrollingFrame2.Size = UDim2.new(0.5, -4, 1, -28)
                        ScrollingFrame3.Position = UDim2.new(0.5, 4, 0, 28)
                        ScrollingFrame3.Size = UDim2.new(0.5, -4, 1, -28)
                    end
                    for Index8, Value14 in ipairs({
                        { UiListLayout2, ScrollingFrame2 }, { UiListLayout3, ScrollingFrame3 },
                    }) do
                        local V341 = Value14[1]
                        V341.Parent = Value14[2]
                        V341.SortOrder = Enum.SortOrder.LayoutOrder
                        if V233 or _G.SINGLE_COLUMNS then
                            V341.HorizontalAlignment = Enum.HorizontalAlignment.Left
                        end
                        V341.Padding = UDim.new(0, 3)
                    end
                    TabButton.Name = "TabButton"
                    TabButton.Parent = ScrollingFrame
                    F11(TabButton, "BackgroundColor3", "deep")
                    TabButton.BackgroundTransparency = 1
                    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TabButton.BorderSizePixel = 0
                    TabButton.Size = UDim2.new(1, -4, 0, 35)
                    Frame5.Parent = TabButton
                    F11(Frame5, "BackgroundColor3")
                    Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    Frame5.BorderSizePixel = 0
                    Frame5.AnchorPoint = Vector2.new(0, 0)
                    Frame5.Position = UDim2.new(0, 0, 0, 0)
                    Frame5.Size = UDim2.new(0, 1, 0, 0)
                    TextLabel5.Parent = TabButton
                    TextLabel5.AnchorPoint = Vector2.new(0, 0.5)
                    TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    TextLabel5.BackgroundTransparency = 1
                    TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    TextLabel5.BorderSizePixel = 0
                    TextLabel5.Position = UDim2.new(0, 30, 0.5, 0)
                    TextLabel5.Size = UDim2.new(0, 200, 0, 20)
                    TextLabel5.Font = Enum.Font.GothamMedium
                    TextLabel5.Text = V338
                    TextLabel5.TextColor3 = Color3.fromRGB(161, 161, 161)
                    TextLabel5.TextSize = 12
                    TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
                    ImageLabel6.Parent = TabButton
                    ImageLabel6.AnchorPoint = Vector2.new(0, 0.5)
                    ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    ImageLabel6.BackgroundTransparency = 1
                    ImageLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    ImageLabel6.BorderSizePixel = 0
                    ImageLabel6.Position = UDim2.new(0, 7, 0.5, 0)
                    ImageLabel6.Size = UDim2.new(0, 16, 0, 16)
                    ImageLabel6.Image = V340.id
                    ImageLabel6.ImageColor3 = Color3.fromRGB(161, 161, 161)
                    ImageLabel6.ImageRectOffset = V340.imageRectOffset
                    ImageLabel6.ImageRectSize = V340.imageRectSize
                    ImageLabel6.ScaleType = Enum.ScaleType.Fit
                    TabButton.ClipsDescendants = true
                    local function F37(P101, P102)
                        F33(TabButton, { Size = P101 and UDim2.new(1, -4, 0, 35) or UDim2.new(0, 36, 0, 35) }, P102)
                        F33(ImageLabel6, { Position = UDim2.new(0, P101 and 7 or 10, 0.5, 0) }, P102)
                        F33(TextLabel5, { TextTransparency = P101 and 0 or 1 }, P102)
                    end
                    table.insert(V331, F37)
                    F37(V330, true)
                    local TweenInfo4 = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
                    local function F38(P103)
                        Frame5.AnchorPoint = Vector2.new(0, P103)
                        Frame5.Position = UDim2.new(0, Frame5.Position.X.Offset, P103, Frame5.Position.Y.Offset)
                    end
                    local Create2, Cancel
                    local function F39(P104, P105)
                        if Cancel then
                            Cancel = Cancel:Cancel()
                        end
                        Page.Position = UDim2.new(0, 0, 0, -10)
                        Page.Visible = false
                        Page.Parent = CatsakenTabStorage
                        V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 1 }):Play()
                        V231:Create(TextLabel5, TweenInfo4, { TextColor3 = Color3.fromRGB(161, 161, 161) }):Play()
                        V231:Create(ImageLabel6, TweenInfo4, { ImageColor3 = Color3.fromRGB(161, 161, 161) }):Play()
                        F38(P104 and 1 or 0)
                        if Create2 then
                            Create2:Cancel()
                        end
                        Create2 = V231:Create(Frame5, TweenInfo4, { Size = UDim2.new(0, 1, 0, 0) })
                        if P105 then
                            local Completed2 = Create2.Completed
                            V230[#V230 + 1] = Completed2:Connect(P105)
                        end
                        Create2:Play()
                    end
                    local function F40(P106)
                        Page.Parent = PageHolder
                        V228.RenderStepped:Wait()
                        Page.Visible = true
                        Cancel = V231:Create(Page, TweenInfo.new(0.2), { Position = UDim2.fromOffset(0, 0) })
                        Cancel:Play()
                        V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 0.65 }):Play()
                        V231:Create(TextLabel5, TweenInfo4, { TextColor3 = F9() }):Play()
                        V231:Create(ImageLabel6, TweenInfo4, { ImageColor3 = F9() }):Play()
                        F38(P106 and 0 or 1)
                        if Create2 then
                            Create2:Cancel()
                        end
                        Frame5.Size = UDim2.new(0, 1, 0, 0)
                        Create2 = V231:Create(Frame5, TweenInfo4, { Size = UDim2.new(0, 1, 1, 0) })
                        Create2:Play()
                    end
                    local V342 = {
                        IsSelected = false,
                        Frame = TabButton,
                        Deselect = function() F39(true) end,
                        Select = function() F40(true) end,
                        DeselectDirectional = F39,
                        SelectDirectional = F40,
                        Index = #V333 + 1,
                        Features = {},
                        NumSections = 0,
                        AutoIndex = 0,
                        NumElements = 0,
                    }
                    V333[#V333 + 1] = V342
                    F10(function()
                        if V342.IsSelected then
                            TextLabel5.TextColor3 = F9()
                            ImageLabel6.ImageColor3 = F9()
                        end
                    end)
                    if V339 == "#!SETTINGS" then
                        V229("settings tab created")
                        TabButton.Visible = false
                        V242._SettingsTabIndex = #V333
                    elseif V339 == "#!THEME" then
                        TabButton.Visible = false
                        V242._ThemeTabIndex = #V333
                    end
                    local TextButton3 = Instance.new("TextButton")
                    TextButton3.Parent = TabButton
                    TextButton3.Text = ""
                    TextButton3.ZIndex = 2
                    TextButton3.BackgroundTransparency = 1
                    TextButton3.BorderSizePixel = 0
                    TextButton3.Size = UDim2.fromScale(1, 1)
                    local MouseEnter6 = TextButton3.MouseEnter
                    V230[#V230 + 1] = MouseEnter6:Connect(function()
                        V342.IsHover = true
                        if not V342.IsSelected then
                            V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 0.8 }):Play()
                        end
                    end)
                    local MouseLeave6 = TextButton3.MouseLeave
                    V230[#V230 + 1] = MouseLeave6:Connect(function()
                        V342.IsHover = false
                        if not V342.IsSelected then
                            V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 1 }):Play()
                        end
                    end)
                    local MouseButton1Down2 = TextButton3.MouseButton1Down
                    V230[#V230 + 1] = MouseButton1Down2:Connect(function()
                        if not V342.IsSelected then
                            V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 0.7 }):Play()
                        end
                    end)
                    local MouseButton1Up = TextButton3.MouseButton1Up
                    V230[#V230 + 1] = MouseButton1Up:Connect(function()
                        if not V342.IsSelected then
                            if V342.IsHover then
                                V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 0.8 }):Play()
                            else
                                V231:Create(TabButton, TweenInfo4, { BackgroundTransparency = 1 }):Play()
                            end
                        end
                    end)
                    local MouseButton1Click5 = TextButton3.MouseButton1Click
                    V230[#V230 + 1] = MouseButton1Click5:Connect(function()
                        local V343
                        if V342.IsSelected then
                            return
                        else
                            PlaySound("select")
                            V343 = true
                            local V344 = nil
                            for Key7, Value15 in pairs(V333) do
                                if Value15.IsSelected then
                                    V343 = V342.Index > Value15.Index
                                    V344 = Value15
                                    break
                                end
                            end
                            for Key8, Value16 in pairs(V333) do
                                Value16.IsSelected = false
                            end
                            V342.IsSelected = true
                            if V344 then
                                V344.DeselectDirectional(V343, function()
                                    if V342.IsSelected then
                                        F40(V343)
                                    end
                                end)
                            else
                                F40(V343)
                            end
                            return
                        end
                    end)
                    local V345 = {}
                    local HiddenElements = Instance.new("Folder")
                    HiddenElements.Name = "HiddenElements"
                    V342.CurrentSection = nil
                    V342.CurrentSectionIndex = V342.CurrentSectionIndex or 0
                    V342.SectionGroups = V342.SectionGroups or {}
                    V342.Columns = V342.Columns or {
                        Left = { ScrollingFrame = ScrollingFrame2, Count = 0, LastSection = nil },
                        Right = { ScrollingFrame = ScrollingFrame3, Count = 0, LastSection = nil },
                    }
                    local function F41(P107, P108)
                        V342.NumElements = V342.NumElements + (P108 and 0 or 1)
                        TextLabel6.Text = V338
                            .. (" <font color=\"rgb(144,144,144)\"> | </font>%d elements"):format(V342.NumElements)
                        if P107.Name ~= "Frame" then
                            local UiStroke3 = Instance.new("UIStroke")
                            UiStroke3.Color = Color3.fromRGB(255, 255, 255)
                            UiStroke3.Transparency = 0.93
                            UiStroke3.Thickness = 1
                            UiStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                            UiStroke3.Parent = P107
                        end
                        local CurrentSection = V342.CurrentSection
                        if CurrentSection then
                            local V346 = V342.SectionGroups[CurrentSection]
                            P107.LayoutOrder = V342.CurrentSectionIndex * 1000 + #V346 + 1
                            table.insert(V346, P107)
                        else
                            P107.LayoutOrder = V342.CurrentSectionIndex * 1000
                        end
                    end
                    if V233 then
                        F15(ScrollingFrame2)
                    end
                    function V345:CreateSection(Text3, P109)
                        V342.NumSections = V342.NumSections + 1
                        local V347
                        if V233 or _G.SINGLE_COLUMNS then
                            V347 = "Left"
                        elseif P109 then
                            V347 = P109
                        else
                            V342.AutoIndex = V342.AutoIndex + 1
                            V347 = V342.AutoIndex % 2 == 1 and "Left" or "Right"
                        end
                        local V348 = V342.Columns[V347]
                        if V348.Count > 0 and V348.LastSection then
                            local V349 = V342.SectionGroups[V348.LastSection]
                            local Frame7 = Instance.new("Frame")
                            Frame7.Parent = V348.ScrollingFrame
                            Frame7.BackgroundTransparency = 1
                            Frame7.Size = UDim2.new(0, 0, 0, 10)
                            Frame7.LayoutOrder = V348.LastSection.LayoutOrder + #V349 + 1
                            table.insert(V349, Frame7)
                        end
                        ScrollingFrame4 = V348.ScrollingFrame
                        local Section = Instance.new("Frame")
                        local TextButton4 = Instance.new("TextButton")
                        Section.Name = "Section"
                        Section.Parent = ScrollingFrame4
                        Section.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Section.BackgroundTransparency = 1
                        Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Section.BorderSizePixel = 0
                        Section.Size = UDim2.new(1, 0, 0, 28)
                        TextButton4.Parent = Section
                        TextButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton4.BackgroundTransparency = 1
                        TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton4.BorderSizePixel = 0
                        TextButton4.Position = UDim2.new(0, 30, 0, 0)
                        TextButton4.Size = UDim2.new(1, -40, 1, 0)
                        TextButton4.Font = Enum.Font.GothamMedium
                        TextButton4.Text = Text3
                        TextButton4.TextColor3 = Color3.fromRGB(199, 199, 199)
                        TextButton4.TextSize = 12
                        TextButton4.TextXAlignment = Enum.TextXAlignment.Left
                        TextButton4.ZIndex = 2
                        local Clone22 = TextButton4:Clone()
                        Clone22.ZIndex = 1
                        Clone22.TextColor3 = Color3.fromRGB(0, 0, 0)
                        Clone22.Position = TextButton4.Position + UDim2.fromOffset(1, 1)
                        Clone22.Parent = TextButton4.Parent
                        Clone22.Active = false
                        local Chevron = Instance.new("ImageLabel")
                        Chevron.Name = "Chevron"
                        Chevron.Parent = Section
                        Chevron.BackgroundTransparency = 1
                        Chevron.AnchorPoint = Vector2.new(0, 0.5)
                        Chevron.Position = UDim2.new(0, 10, 0.5, 0)
                        Chevron.Size = UDim2.fromOffset(14, 14)
                        Chevron.ImageColor3 = Color3.fromRGB(199, 199, 199)
                        Chevron.ZIndex = 2
                        local ChevronDown = V226("chevron-down")
                        Chevron.Image = ChevronDown.id
                        Chevron.ImageRectSize = ChevronDown.imageRectSize
                        Chevron.ImageRectOffset = ChevronDown.imageRectOffset
                        V342.CurrentSectionIndex = V342.CurrentSectionIndex + 1
                        Section.LayoutOrder = V342.CurrentSectionIndex * 1000
                        V342.CurrentSection = Section
                        V342.SectionGroups[Section] = {}
                        V348.Count = V348.Count + 1
                        V348.LastSection = Section
                        local V350 = false
                        local V351 = false
                        local TweenInfo5 = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
                        V348.ScrollingFrame:FindFirstChildOfClass("UIListLayout")
                        local MouseButton1Click6 = TextButton4.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click6:Connect(function()
                            local V352, V353, V354, V355, V356, V357
                            if V351 then
                                return
                            else
                                V351 = true
                                PlaySound("click")
                                V350 = not V350
                                V231:Create(Chevron, TweenInfo5, { Rotation = V350 and -90 or 0 }):Play()
                                V352 = V342.SectionGroups[Section]
                                V353 = #V352
                                local V358 = 0.2 + (V353 > 0 and (V353 - 1) * 0.06 or 0)
                                if V350 then
                                    V354 = {}
                                    V355 = {}
                                    V356 = {}
                                    V357 = {}
                                    local Count3 = 0
                                    while true do
                                        Count3 = 1 + Count3
                                        if not (V353 >= Count3) then
                                            break
                                        end
                                        local V359 = V352[Count3]
                                        V354[V359] = V359.Size
                                        V357[V359] = V359.AutomaticSize
                                        if V359.AutomaticSize ~= Enum.AutomaticSize.None then
                                            V359.AutomaticSize = Enum.AutomaticSize.None
                                        end
                                        V355[V359] = V359.ClipsDescendants
                                        V356[V359] = V359.Position
                                        V359.ClipsDescendants = true
                                    end
                                    for N = V353, 1, -1 do
                                        local V360 = N
                                        local V361 = V352[V360]
                                        local Offset = V354[V361].Y.Offset
                                        task.delay((V353 - V360) * 0.06, function()
                                            V231:Create(V361, TweenInfo5, {
                                                Size = UDim2.new(V361.Size.X.Scale, V361.Size.X.Offset, 0, 0),
                                            }):Play()
                                            local V362 = V360 + 1 - 1
                                            while true do
                                                V362 = 1 + V362
                                                if not (V362 <= V353) then
                                                    break
                                                end
                                                local V363 = V352[V362]
                                                local Position6 = V363.Position
                                                V231:Create(V363, TweenInfo5, {
                                                    Position = UDim2.new(
                                                        Position6.X.Scale, Position6.X.Offset, Position6.Y.Scale,
                                                        Position6.Y.Offset - Offset
                                                    ),
                                                }):Play()
                                            end
                                        end)
                                    end
                                    task.delay(V358, function()
                                        for I6 = 1, V353 do
                                            local V364 = V352[I6]
                                            V364.Parent = HiddenElements
                                            V364.Position = V356[V364]
                                            V364:SetAttribute("__restoreX", V354[V364].X.Scale)
                                            V364:SetAttribute("__restoreXO", V354[V364].X.Offset)
                                            V364:SetAttribute("__restoreY", V354[V364].Y.Scale)
                                            V364:SetAttribute("__restoreYO", V354[V364].Y.Offset)
                                            V364:SetAttribute("__clips", V355[V364])
                                            V364:SetAttribute("__autosize", V357[V364].Name)
                                        end
                                        V351 = false
                                    end)
                                else
                                    local Count4 = 0
                                    while true do
                                        Count4 = 1 + Count4
                                        if not (Count4 <= V353) then
                                            break
                                        end
                                        local V365 = V352[Count4]
                                        local RestoreX = V365:GetAttribute("__restoreX")
                                        local RestoreXO = V365:GetAttribute("__restoreXO")
                                        V365.Size = UDim2.new(RestoreX or 0, RestoreXO or 0, 0, 0)
                                        V365.Parent = V348.ScrollingFrame
                                    end
                                    V237()
                                    local V366 = {}
                                    for I7 = 1, V353 do
                                        V366[V352[I7]] = V352[I7].Position
                                    end
                                    local Count5 = 0
                                    while true do
                                        Count5 = 1 + Count5
                                        if not (Count5 <= V353) then
                                            break
                                        end
                                        local V367 = V352[Count5]
                                        V367.Position = V366[V367]
                                    end
                                    local Count6 = 0
                                    while true do
                                        Count6 = 1 + Count6
                                        if not (V353 >= Count6) then
                                            break
                                        end
                                        local V368 = Count6
                                        local V369 = V352[V368]
                                        local RestoreX2 = V369:GetAttribute("__restoreX") or 0
                                        local RestoreXO2 = V369:GetAttribute("__restoreXO") or 0
                                        local RestoreY = V369:GetAttribute("__restoreY") or 0
                                        local RestoreYO = V369:GetAttribute("__restoreYO") or 0
                                        task.delay((V368 - 1) * 0.06, function()
                                            V231:Create(V369, TweenInfo5, {
                                                Size = UDim2.new(RestoreX2, RestoreXO2, RestoreY, RestoreYO),
                                            }):Play()
                                            local V370 = V368 + 1 - 1
                                            while true do
                                                V370 = 1 + V370
                                                if not (V353 >= V370) then
                                                    break
                                                end
                                                local V371 = V352[V370]
                                                local Position7 = V371.Position
                                                V231:Create(V371, TweenInfo5, {
                                                    Position = UDim2.new(
                                                        Position7.X.Scale, Position7.X.Offset, Position7.Y.Scale,
                                                        Position7.Y.Offset + RestoreYO
                                                    ),
                                                }):Play()
                                            end
                                        end)
                                    end
                                    task.delay(V358, function()
                                        for I8 = 1, V353 do
                                            local V372 = V352[I8]
                                            local Clips = V372:GetAttribute("__clips")
                                            V372.ClipsDescendants = Clips == nil and false or Clips
                                            local Autosize = V372:GetAttribute("__autosize")
                                            if Autosize then
                                                V372.AutomaticSize = Enum.AutomaticSize[Autosize]
                                            end
                                        end
                                        V351 = false
                                    end)
                                end
                                return
                            end
                        end)
                        return {
                            Set = function(P110, Text4)
                                TextButton4.Text = Text4
                                Clone22.Text = Text4
                            end,
                        }
                    end
                    function V345:CreateLabel(Text5)
                        local Toggle = Instance.new("Frame")
                        local TextLabel7 = Instance.new("TextLabel")
                        local UiCorner10 = Instance.new("UICorner")
                        local UiPadding4 = Instance.new("UIPadding")
                        Toggle.Name = "Toggle"
                        Toggle.Parent = ScrollingFrame4
                        F41(Toggle)
                        Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Toggle.BackgroundTransparency = 0.45
                        Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Toggle.BorderSizePixel = 0
                        Toggle.AutomaticSize = Enum.AutomaticSize.Y
                        Toggle.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 28)
                        UiPadding4.Parent = Toggle
                        UiPadding4.PaddingTop = UDim.new(0, 6)
                        UiPadding4.PaddingBottom = UDim.new(0, 6)
                        TextLabel7.Parent = Toggle
                        TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel7.BackgroundTransparency = 1
                        TextLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel7.BorderSizePixel = 0
                        TextLabel7.Position = UDim2.new(0, 10, 0, 0)
                        TextLabel7.Size = UDim2.new(1, -20, 0, 0)
                        TextLabel7.AutomaticSize = Enum.AutomaticSize.Y
                        TextLabel7.TextWrapped = true
                        TextLabel7.Font = Enum.Font.GothamMedium
                        TextLabel7.Text = Text5
                        TextLabel7.TextColor3 = Color3.fromRGB(145, 145, 145)
                        TextLabel7.TextSize = 12
                        TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                        TextLabel7.RichText = true
                        UiCorner10.CornerRadius = UDim.new(0, 5)
                        UiCorner10.Parent = Toggle
                        return { Set = function(P111, Text6) TextLabel7.Text = Text6 end }
                    end
                    function V345.CreateParagraph(P112, P113)
                        return V345:CreateLabel(P113.Content)
                    end
                    function V345:CreateToggle(P114)
                        local Flag22 = P114.Flag
                        local CurrentValue13 = P114.CurrentValue
                        local Name4 = P114.Name
                        local Callback = P114.Callback or function() end
                        local TextMode = P114.TextMode
                        V315.Flags[Flag22] = { CurrentValue = CurrentValue13, __ISTOGGLE = true }
                        table.insert(V342.Features, Name4)
                        local Toggle2 = Instance.new("Frame")
                        local TextButton5 = Instance.new("TextButton")
                        local UiCorner11 = Instance.new("UICorner")
                        Toggle2.Name = "Toggle"
                        Toggle2.Parent = ScrollingFrame4
                        F41(Toggle2)
                        Toggle2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Toggle2.BackgroundTransparency = 0.45
                        Toggle2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Toggle2.BorderSizePixel = 0
                        Toggle2.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 28)
                        TextButton5.Parent = Toggle2
                        TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton5.BackgroundTransparency = 1
                        TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton5.BorderSizePixel = 0
                        TextButton5.Position = UDim2.new(0, 10, 0, 0)
                        TextButton5.Size = UDim2.new(0.5, 0, 0, 28)
                        TextButton5.Font = Enum.Font.GothamMedium
                        TextButton5.Text = Name4
                        TextButton5.TextColor3 = Color3.fromRGB(199, 199, 199)
                        TextButton5.TextSize = 12
                        TextButton5.TextXAlignment = Enum.TextXAlignment.Left
                        TextButton5.RichText = true
                        F28(TextButton5, P114)
                        UiCorner11.CornerRadius = UDim.new(0, 5)
                        UiCorner11.Parent = Toggle2
                        local TextButton6 = Instance.new("TextButton")
                        TextButton6.Text = ""
                        TextButton6.ZIndex = 2
                        TextButton6.BackgroundTransparency = 1
                        TextButton6.BorderSizePixel = 0
                        local TweenInfo6, Switch, Ball, StateLabel, F42
                        if TextMode then
                            StateLabel = Instance.new("TextLabel")
                            StateLabel.Name = "StateLabel"
                            StateLabel.Parent = Toggle2
                            StateLabel.AnchorPoint = Vector2.new(1, 0.5)
                            StateLabel.BackgroundTransparency = 1
                            StateLabel.Position = UDim2.new(1, -10, 0.5, 0)
                            StateLabel.Size = UDim2.new(0, 40, 0, 20)
                            StateLabel.Font = Enum.Font.GothamMedium
                            StateLabel.TextSize = 13
                            StateLabel.TextXAlignment = Enum.TextXAlignment.Right
                            TextButton6.Parent = StateLabel
                            TextButton6.Size = UDim2.fromScale(1, 1)
                            function F42()
                                if CurrentValue13 then
                                    StateLabel.Text = "ON"
                                    StateLabel.TextColor3 = Color3.fromRGB(85, 170, 85)
                                else
                                    StateLabel.Text = "OFF"
                                    StateLabel.TextColor3 = Color3.fromRGB(170, 60, 60)
                                end
                                StateLabel.TextSize = 18
                                V231:Create(
                                    StateLabel, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                                    { TextSize = 13 }
                                ):Play()
                            end
                        else
                            Switch = Instance.new("Frame")
                            local UiCorner12 = Instance.new("UICorner")
                            Ball = Instance.new("Frame")
                            local UiCorner13 = Instance.new("UICorner")
                            Switch.Name = "Switch"
                            Switch.Parent = Toggle2
                            Switch.AnchorPoint = Vector2.new(1, 0)
                            Switch.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
                            Switch.BackgroundTransparency = 0.7
                            Switch.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            Switch.BorderSizePixel = 0
                            Switch.Position = UDim2.new(1, -4, 0, 4)
                            Switch.Size = UDim2.new(0, 48, 0, 20)
                            UiCorner12.CornerRadius = UDim.new(1, 0)
                            UiCorner12.Parent = Switch
                            Ball.Name = "ball"
                            Ball.Parent = Switch
                            Ball.AnchorPoint = Vector2.new(0, 0.5)
                            Ball.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
                            Ball.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            Ball.BorderSizePixel = 0
                            Ball.Position = UDim2.new(0, 2, 0.5, 0)
                            Ball.Size = UDim2.new(0, 16, 0, 16)
                            UiCorner13.CornerRadius = UDim.new(1, 0)
                            UiCorner13.Parent = Ball
                            TextButton6.Parent = Switch
                            TextButton6.Size = UDim2.fromScale(1, 1)
                            TweenInfo6 = TweenInfo.new(0.3, Enum.EasingStyle.Sine)
                            function F42()
                                task.spawn(function()
                                    setthreadidentity(8)
                                    if CurrentValue13 then
                                        V231:Create(Switch, TweenInfo6, { BackgroundColor3 = F9("dark") }):Play()
                                        V231:Create(Ball, TweenInfo6, {
                                            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                                        }):Play()
                                        V231:Create(Ball, TweenInfo6, { Position = UDim2.new(0, 30, 0.5, 0) }):Play()
                                    else
                                        V231:Create(Switch, TweenInfo6, {
                                            BackgroundColor3 = Color3.fromRGB(67, 67, 67),
                                        }):Play()
                                        V231:Create(Ball, TweenInfo6, { BackgroundColor3 = Color3.fromRGB(62, 62, 62) }):Play()
                                        V231:Create(Ball, TweenInfo6, { Position = UDim2.new(0, 2, 0.5, 0) }):Play()
                                    end
                                end)
                            end
                            F10(function()
                                if CurrentValue13 then
                                    Switch.BackgroundColor3 = F9("dark")
                                end
                            end)
                            local InputBegan4 = TextButton6.InputBegan
                            V230[#V230 + 1] = InputBegan4:Connect(function(P115)
                                if P115.UserInputType == Enum.UserInputType.MouseButton1
                                    or P115.UserInputType == Enum.UserInputType.Touch then
                                    V231:Create(Ball, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
                                        Size = UDim2.new(0, 16, 0, 10),
                                    }):Play()
                                end
                            end)
                            local InputEnded3 = TextButton6.InputEnded
                            V230[#V230 + 1] = InputEnded3:Connect(function(P116)
                                if P116.UserInputType == Enum.UserInputType.MouseButton1
                                    or P116.UserInputType == Enum.UserInputType.Touch then
                                    V231:Create(Ball, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
                                        Size = UDim2.new(0, 16, 0, 16),
                                    }):Play()
                                end
                            end)
                        end
                        local V373 = V315.Flags[Flag22]
                        function V373:Set(P117, P118)
                            CurrentValue13 = P117
                            V315.Flags[Flag22].CurrentValue = CurrentValue13
                            F42()
                            if not P118 then
                                PlaySound("switch")
                            end
                            task.spawn(function() V242:SafeCallback(Callback, Name4, "toggle", CurrentValue13, P118) end)
                        end
                        local CurrentValue14
                        if CurrentValue13 then
                            CurrentValue14 = CurrentValue13 ~= nil and CurrentValue13 ~= false and true or nil
                        end
                        if V222[1][V222[3]][Flag22] and V222[1][V222[3]][Flag22].CurrentValue ~= nil and not P114.NoSave then
                            CurrentValue14 = V222[1][V222[3]][Flag22].CurrentValue
                        end
                        if CurrentValue14 ~= nil then
                            V373:Set(CurrentValue14, true)
                        end
                        local MouseButton1Click7 = TextButton6.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click7:Connect(function() V373:Set(not CurrentValue13) end)
                        if not CurrentValue13 and TextMode then
                            F42()
                        end
                        return V373
                    end
                    function V345:CreateButton(P119)
                        local Name5 = P119.Name
                        local Callback2 = P119.Callback or function() end
                        table.insert(V342.Features, Name5)
                        local Button = Instance.new("Frame")
                        local TextLabel8 = Instance.new("TextLabel")
                        local UiCorner14 = Instance.new("UICorner")
                        local ImageLabel7 = Instance.new("ImageLabel")
                        local ImageLabel8 = Instance.new("ImageLabel")
                        Button.Name = "Button"
                        Button.Parent = ScrollingFrame4
                        F41(Button)
                        Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Button.BackgroundTransparency = 0.45
                        Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Button.BorderSizePixel = 0
                        Button.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        Button.ClipsDescendants = true
                        TextLabel8.Parent = Button
                        TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel8.BackgroundTransparency = 1
                        TextLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel8.BorderSizePixel = 0
                        TextLabel8.Position = UDim2.new(0, 10, 0, 0)
                        TextLabel8.Size = UDim2.new(0.5, 0, 0, 32)
                        TextLabel8.Font = Enum.Font.GothamMedium
                        TextLabel8.Text = Name5
                        TextLabel8.TextColor3 = Color3.fromRGB(199, 199, 199)
                        TextLabel8.TextSize = 12
                        TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
                        F28(ImageLabel8, P119)
                        if P119.ToolTip then
                            local Info = V226("info")
                            ImageLabel8.Parent = Button
                            ImageLabel8.AnchorPoint = Vector2.new(1, 0)
                            ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            ImageLabel8.BackgroundTransparency = 1
                            ImageLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                            ImageLabel8.BorderSizePixel = 0
                            ImageLabel8.Position = UDim2.new(1, -30, 0, 6)
                            ImageLabel8.Size = UDim2.new(0, 20, 0, 20)
                            ImageLabel8.Image = Info.id
                            ImageLabel8.ImageRectOffset = Info.imageRectOffset
                            ImageLabel8.ImageRectSize = Info.imageRectSize
                        end
                        UiCorner14.CornerRadius = UDim.new(0, 5)
                        UiCorner14.Parent = Button
                        local MousePointer2 = V226("mouse-pointer-2")
                        ImageLabel7.Parent = Button
                        ImageLabel7.AnchorPoint = Vector2.new(1, 0)
                        ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ImageLabel7.BackgroundTransparency = 1
                        ImageLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ImageLabel7.BorderSizePixel = 0
                        ImageLabel7.Position = UDim2.new(1, -4, 0, 6)
                        ImageLabel7.Size = UDim2.new(0, 20, 0, 20)
                        ImageLabel7.Image = MousePointer2.id
                        ImageLabel7.ImageRectOffset = MousePointer2.imageRectOffset
                        ImageLabel7.ImageRectSize = MousePointer2.imageRectSize
                        local TextButton7 = Instance.new("TextButton")
                        TextButton7.Parent = Button
                        TextButton7.Text = ""
                        TextButton7.BackgroundTransparency = 1
                        TextButton7.Size = UDim2.new(1, -(P119.ToolTip and 57 or 31), 1, 0)
                        local MouseButton1Click8 = TextButton7.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click8:Connect(function()
                            task.spawn(function() V242:SafeCallback(Callback2, Name5, "button") end)
                        end)
                        local MouseButton1Down3 = TextButton7.MouseButton1Down
                        V230[#V230 + 1] = MouseButton1Down3:Connect(function() end)
                        local MouseButton1Up2 = TextButton7.MouseButton1Up
                        V230[#V230 + 1] = MouseButton1Up2:Connect(function() end)
                        local InputBegan5 = TextButton7.InputBegan
                        V230[#V230 + 1] = InputBegan5:Connect(function(P120)
                            if P120.UserInputType == Enum.UserInputType.Touch
                                or P120.UserInputType == Enum.UserInputType.MouseButton1 then
                                local AbsolutePosition4 = Button.AbsolutePosition
                                F14(
                                    Button, P120.Position.X - AbsolutePosition4.X, P120.Position.Y - AbsolutePosition4.Y
                                )
                            end
                        end)
                    end
                    function V345:CreateSlider(P121)
                        local Name6 = P121.Name
                        local Range = P121.Range
                        local V374 = Range[1]
                        local V375 = Range[2]
                        local CurrentValue15 = P121.CurrentValue
                        local Flag3 = P121.Flag
                        V315.Flags[Flag3] = { CurrentValue = CurrentValue15 }
                        local Callback3 = P121.Callback or function() end
                        local Suffix = P121.Suffix or ""
                        local Increment = P121.Increment
                        local FormatType = P121.FormatType
                        table.insert(V342.Features, Name6)
                        local Slider = Instance.new("Frame")
                        local SliderName = Instance.new("TextLabel")
                        local ValueBox = Instance.new("TextBox")
                        local UiCorner15 = Instance.new("UICorner")
                        local Bar2 = Instance.new("Frame")
                        local UiCorner16 = Instance.new("UICorner")
                        local Ball2 = Instance.new("Frame")
                        local UiCorner17 = Instance.new("UICorner")
                        local Fill = Instance.new("Frame")
                        local UiCorner18 = Instance.new("UICorner")
                        Slider.Name = "Slider"
                        Slider.Parent = ScrollingFrame4
                        F41(Slider)
                        Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Slider.BackgroundTransparency = 0.45
                        Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Slider.BorderSizePixel = 0
                        Slider.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        SliderName.Name = "SliderName"
                        SliderName.Parent = Slider
                        SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderName.BackgroundTransparency = 1
                        SliderName.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderName.BorderSizePixel = 0
                        SliderName.Position = UDim2.new(0, 10, 0, 0)
                        SliderName.Size = UDim2.new(0.5, -40, 0, 32)
                        SliderName.Font = Enum.Font.GothamMedium
                        SliderName.Text = Name6
                        SliderName.TextColor3 = Color3.fromRGB(199, 199, 199)
                        SliderName.TextSize = 12
                        SliderName.TextXAlignment = Enum.TextXAlignment.Left
                        SliderName.RichText = true
                        F28(SliderName, P121)
                        ValueBox.Name = "ValueBox"
                        ValueBox.Parent = Slider
                        ValueBox.BackgroundTransparency = 1
                        ValueBox.BorderSizePixel = 0
                        ValueBox.AutomaticSize = Enum.AutomaticSize.X
                        ValueBox.Size = UDim2.new(0, 24, 0, 32)
                        ValueBox.Font = Enum.Font.GothamMedium
                        ValueBox.TextSize = 12
                        ValueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ValueBox.TextXAlignment = Enum.TextXAlignment.Left
                        ValueBox.ClearTextOnFocus = false
                        ValueBox.RichText = true
                        ValueBox.Text = ""
                        UiCorner15.CornerRadius = UDim.new(0, 5)
                        UiCorner15.Parent = Slider
                        Bar2.Name = "Bar"
                        Bar2.Parent = Slider
                        Bar2.AnchorPoint = Vector2.new(1, 0)
                        Bar2.BackgroundColor3 = Color3.fromRGB(109, 109, 129)
                        Bar2.BackgroundTransparency = 0.5
                        Bar2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Bar2.BorderSizePixel = 0
                        Bar2.Position = UDim2.new(1, -16, 0, 13)
                        Bar2.Size = UDim2.new(0, 120, 0, 6)
                        UiCorner16.CornerRadius = UDim.new(1, 0)
                        UiCorner16.Parent = Bar2
                        Ball2.Name = "Ball"
                        Ball2.Parent = Bar2
                        Ball2.AnchorPoint = Vector2.new(0.5, 0.5)
                        Ball2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Ball2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Ball2.BorderSizePixel = 0
                        Ball2.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Ball2.Size = UDim2.new(0, 16, 0, 16)
                        Ball2.ZIndex = 2
                        UiCorner17.CornerRadius = UDim.new(1, 0)
                        UiCorner17.Parent = Ball2
                        Fill.Name = "Fill"
                        Fill.Parent = Bar2
                        F11(Fill, "BackgroundColor3", "mid")
                        Fill.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Fill.BorderSizePixel = 0
                        Fill.Size = UDim2.new(0.5, 0, 1, 0)
                        UiCorner18.CornerRadius = UDim.new(1, 0)
                        UiCorner18.Parent = Fill
                        local UiDragDetector2 = Instance.new("UIDragDetector")
                        UiDragDetector2.Parent = Bar2
                        UiDragDetector2.ResponseStyle = Enum.UIDragDetectorResponseStyle.CustomOffset
                        UiDragDetector2:Clone().Parent = Ball2
                        local Udim = UDim2.new(0, 120, 0, 6)
                        local Udim2 = UDim2.new(0, 120, 0, 9)
                        local Udim3 = UDim2.new(0, 16, 0, 16)
                        local Udim4 = UDim2.new(0, 20, 0, 20)
                        local TweenInfo7 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local V376 = V374 < 0
                        local function F43()
                            ValueBox.Position = UDim2.new(0, 10 + SliderName.TextBounds.X + 4, 0, 0)
                        end
                        F43()
                        local TextBounds = SliderName:GetPropertyChangedSignal("TextBounds")
                        V230[#V230 + 1] = TextBounds:Connect(F43)
                        local function F44(P122)
                            return (P122 - V374) / (V375 - V374)
                        end
                        local function F45(P123)
                            local V377 = math.round((P123 * (V375 - V374) + V374) / Increment)
                            local V378 = math.log10(Increment)
                            local V379 = math.max(0, math.ceil(-V378))
                            return tonumber(string.format("%." .. V379 .. "f", math.clamp(V377 * Increment, V374, V375)))
                        end
                        local function F46(P124)
                            return "<font color=\"" .. F12(F9("mid")) .. "\">"
                                .. (FormatType == "time" and truncatetime(P124) or P124)
                                .. "<font color=\"rgb(141, 141, 141)\">" .. Suffix .. "</font></font>"
                        end
                        local function F47()
                            ValueBox.RichText = true
                            ValueBox.Text = F46(V315.Flags[Flag3].CurrentValue)
                        end
                        local function F48(P125, P126)
                            if not ValueBox:IsFocused() then
                                F47()
                            end
                            local Udim5 = UDim2.new(P125, 0, 1, 0)
                            local Udim6 = UDim2.new(P125, 0, 0.5, 0)
                            if P126 then
                                V231:Create(Fill, TweenInfo7, { Size = Udim5 }):Play()
                                V231:Create(Ball2, TweenInfo7, { Position = Udim6 }):Play()
                            else
                                Fill.Size = Udim5
                                Ball2.Position = Udim6
                            end
                        end
                        if V222[1][V222[3]][Flag3] then
                            CurrentValue15 = V222[1][V222[3]][Flag3].CurrentValue
                            V315.Flags[Flag3] = { CurrentValue = CurrentValue15 }
                            task.spawn(function() V242:SafeCallback(Callback3, Name6, "slider", CurrentValue15) end)
                        end
                        F48(F44(CurrentValue15), false)
                        local V380 = false
                        local F49
                        local function F50(P127)
                            F49(F45((math.clamp((P127 - Bar2.AbsolutePosition.X) / Bar2.AbsoluteSize.X, 0, 1))))
                        end
                        function F49(P128, P129)
                            local V381
                            if P129 then
                                V381 = math.clamp(P128, V374, V375)
                            else
                                V381 = F45(F44(math.clamp(P128, V374, V375)))
                            end
                            if V381 ~= V315.Flags[Flag3].CurrentValue then
                                V315.Flags[Flag3].CurrentValue = V381
                                F48(F44(V381), true)
                                PlaySound("tick", { Volume = 0.1 })
                                V242:SafeCallback(Callback3, Name6, "slider", V381)
                            end
                        end
                        local Focused = ValueBox.Focused
                        V230[#V230 + 1] = Focused:Connect(function()
                            ValueBox.RichText = false
                            ValueBox.Text = tostring(V315.Flags[Flag3].CurrentValue)
                        end)
                        local Text7 = ValueBox:GetPropertyChangedSignal("Text")
                        V230[#V230 + 1] = Text7:Connect(function()
                            if not ValueBox:IsFocused() or ValueBox.RichText then
                                return
                            else
                                local Text8 = ValueBox.Text
                                local V382 = V376 and Text8:sub(1, 1) == "-"
                                local Gsub = Text8:gsub("[^%d%.]", "")
                                local Find2 = Gsub:find(".", 1, true)
                                if Find2 then
                                    Gsub = Gsub:sub(1, Find2) .. Gsub:sub(Find2 + 1):gsub("%.", "")
                                end
                                if V382 then
                                    Gsub = "-" .. Gsub
                                end
                                if Gsub ~= ValueBox.Text then
                                    ValueBox.Text = Gsub
                                end
                                return
                            end
                        end)
                        local FocusLost2 = ValueBox.FocusLost
                        V230[#V230 + 1] = FocusLost2:Connect(function()
                            local V383 = tonumber(ValueBox.Text)
                            if V383 then
                                F49(V383, not P121.StrictIncrement)
                            end
                            F47()
                        end)
                        local V384 = false
                        local V385 = false
                        local MouseEnter7 = Bar2.MouseEnter
                        V230[#V230 + 1] = MouseEnter7:Connect(function()
                            V384 = true
                            V231:Create(Bar2, TweenInfo7, { Size = Udim2 }):Play()
                            V231:Create(Ball2, TweenInfo7, { Size = Udim4 }):Play()
                        end)
                        local MouseLeave7 = Bar2.MouseLeave
                        V230[#V230 + 1] = MouseLeave7:Connect(function()
                            V384 = false
                            if not V385 and not V380 then
                                V231:Create(Bar2, TweenInfo7, { Size = Udim }):Play()
                                V231:Create(Ball2, TweenInfo7, { Size = Udim3 }):Play()
                            end
                        end)
                        local MouseEnter8 = Ball2.MouseEnter
                        V230[#V230 + 1] = MouseEnter8:Connect(function()
                            V385 = true
                            V231:Create(Bar2, TweenInfo7, { Size = Udim2 }):Play()
                            V231:Create(Ball2, TweenInfo7, { Size = Udim4 }):Play()
                        end)
                        local MouseLeave8 = Ball2.MouseLeave
                        V230[#V230 + 1] = MouseLeave8:Connect(function()
                            V385 = false
                            if not V384 and not V380 then
                                V231:Create(Bar2, TweenInfo7, { Size = Udim }):Play()
                                V231:Create(Ball2, TweenInfo7, { Size = Udim3 }):Play()
                            end
                        end)
                        local InputBegan6 = Ball2.InputBegan
                        V230[#V230 + 1] = InputBegan6:Connect(function(P130)
                            if P130.UserInputType == Enum.UserInputType.MouseButton1
                                or P130.UserInputType == Enum.UserInputType.Touch then
                                V380 = true
                                F50(P130.Position.X)
                            end
                        end)
                        local InputBegan7 = Bar2.InputBegan
                        V230[#V230 + 1] = InputBegan7:Connect(function(P131)
                            if P131.UserInputType == Enum.UserInputType.MouseButton1
                                or P131.UserInputType == Enum.UserInputType.Touch then
                                V380 = true
                                F50(P131.Position.X)
                            end
                        end)
                        local InputChanged4 = V227.InputChanged
                        V230[#V230 + 1] = InputChanged4:Connect(function(P132)
                            if V380
                                and (P132.UserInputType == Enum.UserInputType.MouseMovement
                                    or P132.UserInputType == Enum.UserInputType.Touch) then
                                F50(P132.Position.X)
                            end
                        end)
                        local Connect5 = V227.InputEnded:Connect(function(Input3)
                            if V380
                                and (Input3.UserInputType == Enum.UserInputType.MouseButton1
                                    or Input3.UserInputType == Enum.UserInputType.Touch) then
                                V380 = false
                                if Input3.UserInputType == Enum.UserInputType.Touch or not V384 and not V385 then
                                    V231:Create(Bar2, TweenInfo7, { Size = Udim }):Play()
                                    V231:Create(Ball2, TweenInfo7, { Size = Udim3 }):Play()
                                end
                            end
                        end)
                        V230[#V230 + 1] = Connect5
                        F10(function()
                            if not ValueBox:IsFocused() then
                                F47()
                            end
                        end)
                    end
                    function V345:CreateDropdown(P133)
                        local Name7 = P133.Name
                        local Flag4 = P133.Flag
                        local CurrentOption = deepcopy(P133.CurrentOption)
                        local V386 = deepcopy(P133.Options)
                        local MultipleOptions = P133.MultipleOptions
                        local V387 = P133.Searchable == true
                        local V388 = V387 and 28 or 0
                        local Callback4 = P133.Callback or function() end
                        table.insert(V342.Features, Name7)
                        local Dropdown = Instance.new("Frame")
                        local SliderName2 = Instance.new("TextLabel")
                        local UiCorner19 = Instance.new("UICorner")
                        local ImageLabel9 = Instance.new("ImageLabel")
                        local ScrollingFrame5 = Instance.new("ScrollingFrame")
                        local UiListLayout4 = Instance.new("UIListLayout")
                        Dropdown.Name = "Dropdown"
                        Dropdown.Parent = ScrollingFrame4
                        F41(Dropdown)
                        Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Dropdown.BackgroundTransparency = 0.45
                        Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Dropdown.BorderSizePixel = 0
                        Dropdown.ClipsDescendants = true
                        Dropdown.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        Dropdown.ClipsDescendants = true
                        SliderName2.Name = "SliderName"
                        SliderName2.Parent = Dropdown
                        SliderName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderName2.BackgroundTransparency = 1
                        SliderName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderName2.BorderSizePixel = 0
                        SliderName2.Position = UDim2.new(0, 10, 0, 0)
                        SliderName2.Size = UDim2.new(0.5, 0, 0, 32)
                        SliderName2.Font = Enum.Font.GothamMedium
                        SliderName2.TextColor3 = Color3.fromRGB(199, 199, 199)
                        SliderName2.TextSize = 12
                        SliderName2.TextXAlignment = Enum.TextXAlignment.Left
                        SliderName2.RichText = true
                        F28(SliderName2, P133)
                        UiCorner19.CornerRadius = UDim.new(0, 5)
                        UiCorner19.Parent = Dropdown
                        ImageLabel9.Parent = Dropdown
                        ImageLabel9.AnchorPoint = Vector2.new(1, 0)
                        ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ImageLabel9.BackgroundTransparency = 1
                        ImageLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ImageLabel9.BorderSizePixel = 0
                        ImageLabel9.Position = UDim2.new(1, -4, 0, 6)
                        ImageLabel9.Size = UDim2.new(0, 20, 0, 20)
                        ImageLabel9.Image = "rbxassetid://130996747355335"
                        ScrollingFrame5.Parent = Dropdown
                        ScrollingFrame5.Active = true
                        ScrollingFrame5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ScrollingFrame5.BackgroundTransparency = 1
                        ScrollingFrame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ScrollingFrame5.BorderSizePixel = 0
                        ScrollingFrame5.Position = UDim2.new(0, 10, 0, 32 + V388)
                        ScrollingFrame5.Size = UDim2.new(1, -20, 1, -(42 + V388))
                        ScrollingFrame5.ScrollBarThickness = 8
                        ScrollingFrame5.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                        ScrollingFrame5.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                        ScrollingFrame5.AutomaticCanvasSize = Enum.AutomaticSize.Y
                        ScrollingFrame5.CanvasSize = UDim2.new(0, 0, 0, 0)
                        ScrollingFrame5.Visible = false
                        UiListLayout4.Parent = ScrollingFrame5
                        UiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                        UiListLayout4.Padding = UDim.new(0, 4)
                        UiListLayout4.HorizontalAlignment = Enum.HorizontalAlignment.Left
                        local function F51(P134)
                            local V389 = {}
                            for Key9, Value17 in pairs(P134) do
                                if Value17 == true then
                                    table.insert(V389, Key9)
                                end
                            end
                            return V389
                        end
                        local function F52(P135, P136)
                            if type(P135) ~= type(P136) then
                                return false
                            end
                            if type(P135) ~= "table" then
                                return P135 == P136
                            end
                            for Key10, Value18 in pairs(P135) do
                                if not F52(Value18, P136[Key10]) then
                                    return false
                                end
                            end
                            for Key11 in pairs(P136) do
                                if P135[Key11] == nil then
                                    return false
                                end
                            end
                            return true
                        end
                        if (V222[1][V222[3]][Flag4] or {}).CurrentOption
                            and not F52(V222[1][V222[3]][Flag4].CurrentOption, V386) then
                            CurrentOption = V222[1][V222[3]][Flag4].CurrentOption
                            task.spawn(function()
                                V242:SafeCallback(Callback4, Name7, "dropdown", CurrentOption, true)
                            end)
                        end
                        local V390 = {}
                        for Key12, Value19 in pairs(V386) do
                            V390[Value19] = false
                        end
                        for Key13, Value20 in pairs(CurrentOption) do
                            V390[Value20] = true
                        end
                        V315.Flags[Flag4] = { CurrentOption = F51(V390) }
                        local TextButton8 = Instance.new("TextButton")
                        TextButton8.Parent = Dropdown
                        TextButton8.Text = ""
                        TextButton8.ZIndex = 2
                        TextButton8.BackgroundTransparency = 1
                        TextButton8.BorderSizePixel = 0
                        TextButton8.Size = UDim2.new(1, 0, 0, 32)
                        local V391
                        if #V386 > 3 then
                            V391 = F13(ScrollingFrame5)
                            V391.Visible = false
                        end
                        local SearchBox
                        local function F53()
                            if not SearchBox then
                                return
                            else
                                local V392 = {}
                                for Match3 in SearchBox.Text:lower():gmatch("%S+") do
                                    V392[#V392 + 1] = Match3
                                end
                                for Key14, Value21 in pairs(ScrollingFrame5:GetChildren()) do
                                    if Value21.Name == "Option" then
                                        local Lower3 = Value21.OName.Text:lower()
                                        local Visible2 = true
                                        for Index9, Value22 in ipairs(V392) do
                                            if not Lower3:find(Value22, 1, true) then
                                                Visible2 = false
                                                break
                                            end
                                        end
                                        Value21.Visible = Visible2
                                    end
                                end
                                ScrollingFrame5.CanvasPosition = Vector2.new(0, 0)
                                return
                            end
                        end
                        local SearchFrame, UiStroke4
                        if V387 then
                            SearchFrame = Instance.new("Frame")
                            SearchFrame.Name = "SearchFrame"
                            SearchFrame.Parent = Dropdown
                            SearchFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                            SearchFrame.BackgroundTransparency = 0.5
                            SearchFrame.BorderSizePixel = 0
                            SearchFrame.Position = UDim2.new(0, 10, 0, 36)
                            SearchFrame.Size = UDim2.new(1, -20, 0, 22)
                            SearchFrame.ZIndex = 2
                            SearchFrame.Visible = false
                            local UiCorner20 = Instance.new("UICorner")
                            UiCorner20.CornerRadius = UDim.new(0, 5)
                            UiCorner20.Parent = SearchFrame
                            UiStroke4 = Instance.new("UIStroke")
                            UiStroke4.Color = Color3.fromRGB(70, 70, 70)
                            UiStroke4.Thickness = 1
                            UiStroke4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                            UiStroke4.Parent = SearchFrame
                            SearchBox = Instance.new("TextBox")
                            SearchBox.Name = "SearchBox"
                            SearchBox.Parent = SearchFrame
                            SearchBox.BackgroundTransparency = 1
                            SearchBox.BorderSizePixel = 0
                            SearchBox.Position = UDim2.new(0, 8, 0, 0)
                            SearchBox.Size = UDim2.new(1, -16, 1, 0)
                            SearchBox.ZIndex = 3
                            SearchBox.ClearTextOnFocus = false
                            SearchBox.Font = Enum.Font.GothamMedium
                            SearchBox.PlaceholderText = "Search..."
                            SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
                            SearchBox.Text = ""
                            SearchBox.TextColor3 = Color3.fromRGB(199, 199, 199)
                            SearchBox.TextSize = 12
                            SearchBox.TextXAlignment = Enum.TextXAlignment.Left
                            local Text9 = SearchBox:GetPropertyChangedSignal("Text")
                            V230[#V230 + 1] = Text9:Connect(F53)
                            local Focused2 = SearchBox.Focused
                            V230[#V230 + 1] = Focused2:Connect(function()
                                V231:Create(UiStroke4, TweenInfo.new(0.15), { Color = F9("mid") }):Play()
                            end)
                            local Connect6 = SearchBox.FocusLost:Connect(function()
                                V231:Create(UiStroke4, TweenInfo.new(0.15), { Color = Color3.fromRGB(70, 70, 70) }):Play()
                            end)
                            V230[#V230 + 1] = Connect6
                            F10(function()
                                if SearchBox:IsFocused() then
                                    UiStroke4.Color = F9("mid")
                                end
                            end)
                        end
                        local V393 = false
                        local MouseButton1Click9 = TextButton8.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click9:Connect(function(P137)
                            V393 = not V393
                            PlaySound("click")
                            if V391 then
                                V391.Visible = V393
                            end
                            ScrollingFrame5.Visible = V393
                            if SearchFrame then
                                SearchFrame.Visible = V393
                            end
                            if V393 then
                                local V394 = math.clamp(
                                    38 + #V386 * (28 + UiListLayout4.Padding.Offset), 0,
                                    38 + 3 * (28 + UiListLayout4.Padding.Offset)
                                )
                                V231:Create(Dropdown, TweenInfo.new(0.3), {
                                    Size = UDim2.new(
                                        Dropdown.Size.X.Scale, Dropdown.Size.X.Offset, Dropdown.Size.Y.Scale,
                                        V394 + V388
                                    ),
                                }):Play()
                            else
                                if SearchBox then
                                    SearchBox:ReleaseFocus()
                                    SearchBox.Text = ""
                                end
                                ScrollingFrame5.CanvasPosition = Vector2.new(0, 0)
                                V231:Create(Dropdown, TweenInfo.new(0.3), {
                                    Size = UDim2.new(
                                        Dropdown.Size.X.Scale, Dropdown.Size.X.Offset, Dropdown.Size.Y.Scale, 32
                                    ),
                                }):Play()
                            end
                        end)
                        local V395 = { __DropdownOptions = {} }
                        local function F54(P138)
                            local V396 = {}
                            for Key15, Value23 in pairs(P138) do
                                if Value23 == true then
                                    table.insert(V396, tostring(Key15))
                                end
                            end
                            return #V396 == 1 and V396[1] or (#V396 == 0 and "no" or #V396) .. " options"
                        end
                        function V395:SetTitle(P139)
                            Name7 = P139
                            SliderName2.Text = Name7 .. " <font color=\"rgb(100, 100, 100)\">" .. F54(V390) .. "</font>"
                        end
                        V395:SetTitle(Name7)
                        local function F55(P140)
                            V386 = P140
                            for Key16, Value24 in pairs(ScrollingFrame5:GetChildren()) do
                                if Value24.Name == "Option" then
                                    Value24:Destroy()
                                end
                            end
                            for Key17, Value25 in pairs(P140) do
                                local V397 = Value25
                                local Option = Instance.new("Frame")
                                local UiCorner21 = Instance.new("UICorner")
                                local Oname = Instance.new("TextLabel")
                                local OnameShadow = Instance.new("TextLabel")
                                Option.Name = "Option"
                                Option.Parent = ScrollingFrame5
                                Option.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                                Option.BackgroundTransparency = 0.8
                                Option.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                Option.BorderSizePixel = 0
                                Option.Size = UDim2.new(1, 0, 0, 28)
                                Option.ClipsDescendants = true
                                UiCorner21.CornerRadius = UDim.new(0, 5)
                                UiCorner21.Parent = Option
                                Oname.Name = "OName"
                                Oname.Parent = Option
                                Oname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                Oname.BackgroundTransparency = 1
                                Oname.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                Oname.BorderSizePixel = 0
                                Oname.Position = UDim2.new(0, 10, 0, 0)
                                Oname.Size = UDim2.new(1, -20, 1, 0)
                                Oname.ZIndex = 2
                                Oname.Font = Enum.Font.GothamMedium
                                Oname.Text = tostring(V397)
                                Oname.TextColor3 = Color3.fromRGB(199, 199, 199)
                                Oname.TextSize = 12
                                Oname.TextXAlignment = Enum.TextXAlignment.Left
                                OnameShadow.Name = "ONameShadow"
                                OnameShadow.Parent = Option
                                OnameShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                OnameShadow.BackgroundTransparency = 1
                                OnameShadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                OnameShadow.BorderSizePixel = 0
                                OnameShadow.Position = UDim2.new(0, 11, 0, 1)
                                OnameShadow.Size = UDim2.new(1, -20, 1, 0)
                                OnameShadow.Font = Enum.Font.GothamMedium
                                OnameShadow.Text = tostring(V397)
                                OnameShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
                                OnameShadow.TextSize = 12
                                OnameShadow.TextXAlignment = Enum.TextXAlignment.Left
                                local TextButton9 = Instance.new("TextButton")
                                TextButton9.Parent = Option
                                TextButton9.Text = ""
                                TextButton9.ZIndex = 2
                                TextButton9.BackgroundTransparency = 1
                                TextButton9.BorderSizePixel = 0
                                TextButton9.Size = UDim2.fromScale(1, 1)
                                table.insert(V395.__DropdownOptions, {
                                    Title = setmetatable({}, {
                                        __newindex = function(Object2, Key18, Value26)
                                            if Key18 == "Text" then
                                                Oname.Text = Value26
                                                OnameShadow.Text = Value26
                                            end
                                        end,
                                    }),
                                })
                                local TweenInfo8 = TweenInfo.new(0.1, Enum.EasingStyle.Linear)
                                local MouseButton1Click10 = TextButton9.MouseButton1Click
                                V230[#V230 + 1] = MouseButton1Click10:Connect(function()
                                    if V390[V397] == true and not MultipleOptions then
                                        return
                                    end
                                    V390[V397] = not V390[V397]
                                    if not MultipleOptions then
                                        for Key19, Value27 in pairs(V390) do
                                            if Key19 ~= V397 then
                                                V390[Key19] = false
                                            end
                                        end
                                        for Key20, Value28 in pairs(ScrollingFrame5:GetChildren()) do
                                            if Value28.Name == "Option" then
                                                V231:Create(Value28, TweenInfo8, {
                                                    BackgroundColor3 = Color3.fromRGB(100, 100, 100),
                                                }):Play()
                                                V231:Create(Value28.OName, TweenInfo8, {
                                                    TextColor3 = Color3.fromRGB(199, 199, 199),
                                                }):Play()
                                            end
                                        end
                                    end
                                    if V390[V397] then
                                        V231:Create(Option, TweenInfo8, { BackgroundColor3 = F9("mid") }):Play()
                                        V231:Create(Oname, TweenInfo8, { TextColor3 = F9("mid") }):Play()
                                    else
                                        V231:Create(Option, TweenInfo8, {
                                            BackgroundColor3 = Color3.fromRGB(100, 100, 100),
                                        }):Play()
                                        V231:Create(Oname, TweenInfo8, { TextColor3 = Color3.fromRGB(199, 199, 199) }):Play()
                                    end
                                    V395:SetTitle(Name7)
                                    V315.Flags[Flag4] = { CurrentOption = F51(V390) }
                                    task.spawn(function() V242:SafeCallback(Callback4, Name7, "dropdown", F51(V390)) end)
                                end)
                                local InputBegan8 = TextButton9.InputBegan
                                V230[#V230 + 1] = InputBegan8:Connect(function(P141)
                                    if P141.UserInputType == Enum.UserInputType.MouseButton1
                                        or P141.UserInputType == Enum.UserInputType.Touch then
                                        local AbsolutePosition5 = Option.AbsolutePosition
                                        F14(
                                            Option, P141.Position.X - AbsolutePosition5.X,
                                            P141.Position.Y - AbsolutePosition5.Y
                                        )
                                    end
                                end)
                                F10(function()
                                    if V390[V397] then
                                        Option.BackgroundColor3 = F9("mid")
                                        Oname.TextColor3 = F9("mid")
                                    end
                                end)
                            end
                            F53()
                        end
                        F55(V386)
                        function V395:Refresh(P142)
                            F55(P142)
                        end
                        return V395
                    end
                    function V345:CreateKeybind(P143)
                        local CurrentKeybind = P143.CurrentKeybind
                        local Name8 = P143.Name
                        local Callback5 = P143.Callback or function() end
                        table.insert(V342.Features, Name8)
                        if P143.Flag and V222[1][V222[3]][Flag] then
                            CurrentKeybind = V222[1][V222[3]][Flag]
                        end
                        local Keybind = Instance.new("Frame")
                        local KeybindName = Instance.new("TextLabel")
                        local UiCorner22 = Instance.new("UICorner")
                        local Frame8 = Instance.new("Frame")
                        local UiCorner23 = Instance.new("UICorner")
                        local TextButton10 = Instance.new("TextButton")
                        local ImageLabel10 = Instance.new("ImageLabel")
                        Keybind.Name = "Keybind"
                        Keybind.Parent = ScrollingFrame4
                        F41(Keybind)
                        Keybind.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Keybind.BackgroundTransparency = 0.45
                        Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Keybind.BorderSizePixel = 0
                        Keybind.ClipsDescendants = true
                        Keybind.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        KeybindName.Name = "KeybindName"
                        KeybindName.Parent = Keybind
                        KeybindName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        KeybindName.BackgroundTransparency = 1
                        KeybindName.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        KeybindName.BorderSizePixel = 0
                        KeybindName.Position = UDim2.new(0, 10, 0, 0)
                        KeybindName.Size = UDim2.new(0.5, 0, 0, 32)
                        KeybindName.Font = Enum.Font.GothamMedium
                        KeybindName.Text = Name8
                        KeybindName.TextColor3 = Color3.fromRGB(199, 199, 199)
                        KeybindName.TextSize = 12
                        KeybindName.TextXAlignment = Enum.TextXAlignment.Left
                        F28(KeybindName, P143)
                        UiCorner22.CornerRadius = UDim.new(0, 5)
                        UiCorner22.Parent = Keybind
                        Frame8.Parent = Keybind
                        Frame8.AnchorPoint = Vector2.new(1, 0)
                        Frame8.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                        Frame8.BackgroundTransparency = 0.7
                        Frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Frame8.BorderSizePixel = 0
                        Frame8.Position = UDim2.new(1, -4, 0, 4)
                        Frame8.Size = UDim2.new(0, 30, 0, 20)
                        Frame8.ClipsDescendants = true
                        UiCorner23.CornerRadius = UDim.new(0, 5)
                        UiCorner23.Parent = Frame8
                        TextButton10.Parent = Frame8
                        TextButton10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton10.BackgroundTransparency = 1
                        TextButton10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextButton10.BorderSizePixel = 0
                        TextButton10.Size = UDim2.new(1, 0, 1, 0)
                        TextButton10.Font = Enum.Font.GothamMedium
                        TextButton10.Text = CurrentKeybind or ""
                        TextButton10.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextButton10.TextSize = 14
                        TextButton10.ClipsDescendants = true
                        ImageLabel10.Parent = Frame8
                        ImageLabel10.AnchorPoint = Vector2.new(0.5, 0)
                        ImageLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ImageLabel10.BackgroundTransparency = 1
                        ImageLabel10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ImageLabel10.BorderSizePixel = 0
                        ImageLabel10.Position = UDim2.new(0.5, 0, 0, 2)
                        ImageLabel10.Size = UDim2.new(0, 16, 0, 16)
                        ImageLabel10.Image = "rbxassetid://121142147574111"
                        ImageLabel10.Visible = false
                        if CurrentKeybind == nil then
                            ImageLabel10.Visible = true
                        end
                        local V398 = { KeyCode = CurrentKeybind, Callback = Callback5, Pressable = true }
                        table.insert(V315.Keybinds, V398)
                        local V399 = false
                        local V400 = false
                        local TweenInfo9 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
                        local TweenInfo10 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                        local V401
                        local function F56()
                            if V401 then
                                task.cancel(V401)
                            end
                            V231:Create(Frame8, TweenInfo9, {
                                BackgroundColor3 = F9("dark2"),
                                BackgroundTransparency = 0.3,
                            }):Play()
                            V231:Create(TextButton10, TweenInfo9, { TextColor3 = F9("mid") }):Play()
                            V401 = task.spawn(function()
                                while V400 do
                                    V231:Create(
                                        Frame8, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                                        { BackgroundTransparency = 0.1 }
                                    ):Play()
                                    V237(0.5)
                                    V231:Create(
                                        Frame8, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                                        { BackgroundTransparency = 0.4 }
                                    ):Play()
                                    V237(0.5)
                                end
                            end)
                        end
                        local function F57(P144)
                            if V401 then
                                task.cancel(V401)
                                V401 = nil
                            end
                            V231:Create(Frame8, TweenInfo9, {
                                BackgroundColor3 = Color3.fromRGB(60, 180, 80),
                                BackgroundTransparency = 0.2,
                            }):Play()
                            V231:Create(TextButton10, TweenInfo9, { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
                            V237()
                            local V402 = math.max(30, TextButton10.TextBounds.X + 16)
                            local Udim7 = UDim2.new(0, V402 + 8, 0, 24)
                            local Udim8 = UDim2.new(0, V402, 0, 20)
                            V231:Create(Frame8, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = Udim7,
                            }):Play()
                            task.delay(0.1, function() V231:Create(Frame8, TweenInfo10, { Size = Udim8 }):Play() end)
                            task.delay(0.4, function()
                                V231:Create(Frame8, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                                    BackgroundColor3 = Color3.fromRGB(53, 53, 53),
                                    BackgroundTransparency = 0.7,
                                }):Play()
                            end)
                        end
                        local function F58()
                            if V401 then
                                task.cancel(V401)
                                V401 = nil
                            end
                            V231:Create(Frame8, TweenInfo9, {
                                BackgroundColor3 = Color3.fromRGB(53, 53, 53),
                                BackgroundTransparency = 0.7,
                            }):Play()
                            V231:Create(TextButton10, TweenInfo9, { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
                        end
                        local MouseButton1Click11 = TextButton10.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click11:Connect(function()
                            if V399 then
                                return
                            end
                            V399 = true
                            V398.Pressable = false
                            ImageLabel10.Visible = false
                            TextButton10.Text = "..."
                            V400 = true
                            F56()
                            V237(0.1)
                            V399 = false
                        end)
                        local InputBegan9 = V227.InputBegan
                        V230[#V230 + 1] = InputBegan9:Connect(function(P145, P146)
                            if V235[1][V235[3]] then
                                return
                            end
                            if P146 then
                                return
                            end
                            if V400 and P145.KeyCode.Name ~= "Unknown" then
                                local KeyCode = V398.KeyCode
                                V398.KeyCode = P145.KeyCode.Name
                                V400 = false
                                if KeyCode == V398.KeyCode then
                                    V398.KeyCode = nil
                                    ImageLabel10.Visible = true
                                    TextButton10.Text = ""
                                    F58()
                                    return
                                end
                                TextButton10.Text = V398.KeyCode
                                F57(V398.KeyCode)
                                V237(0.1)
                                V398.Pressable = true
                                return
                            end
                            V237(0.1)
                            V398.Pressable = true
                        end)
                        local RenderStepped = V228.RenderStepped
                        V230[#V230 + 1] = RenderStepped:Connect(function()
                            local V403 = math.max(30, TextButton10.TextBounds.X + 16)
                            V231:Create(Frame8, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, V403, 0, 20),
                            }):Play()
                        end)
                    end
                    function V345:CreateInput(P147)
                        local Name9 = P147.Name
                        local Flag5 = P147.Flag
                        local CurrentValue16 = P147.CurrentValue
                        local PlaceholderText = P147.PlaceholderText
                        local Callback6 = P147.Callback or function() end
                        table.insert(V342.Features, Name9)
                        V315.Flags[Flag5] = { CurrentValue = CurrentValue16 }
                        local Input4 = Instance.new("Frame")
                        local KeybindName2 = Instance.new("TextLabel")
                        local UiCorner24 = Instance.new("UICorner")
                        local Frame9 = Instance.new("Frame")
                        local UiCorner25 = Instance.new("UICorner")
                        local TextLabel9 = Instance.new("TextLabel")
                        local ImageLabel11 = Instance.new("ImageLabel")
                        local TextBox2 = Instance.new("TextBox")
                        Input4.Name = "Input"
                        Input4.Parent = ScrollingFrame4
                        F41(Input4)
                        Input4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Input4.BackgroundTransparency = 0.45
                        Input4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Input4.BorderSizePixel = 0
                        Input4.ClipsDescendants = true
                        Input4.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        KeybindName2.Name = "KeybindName"
                        KeybindName2.Parent = Input4
                        KeybindName2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        KeybindName2.BackgroundTransparency = 1
                        KeybindName2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        KeybindName2.BorderSizePixel = 0
                        KeybindName2.Position = UDim2.new(0, 10, 0, 0)
                        KeybindName2.Size = UDim2.new(0.5, 0, 0, 32)
                        KeybindName2.Font = Enum.Font.GothamMedium
                        KeybindName2.Text = Name9
                        KeybindName2.TextColor3 = Color3.fromRGB(199, 199, 199)
                        KeybindName2.TextSize = 12
                        KeybindName2.TextXAlignment = Enum.TextXAlignment.Left
                        F28(KeybindName2, P147)
                        UiCorner24.CornerRadius = UDim.new(0, 5)
                        UiCorner24.Parent = Input4
                        Frame9.Parent = Input4
                        Frame9.AnchorPoint = Vector2.new(1, 0)
                        Frame9.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
                        Frame9.BackgroundTransparency = 0.7
                        Frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Frame9.BorderSizePixel = 0
                        Frame9.ClipsDescendants = true
                        Frame9.Position = UDim2.new(1, -4, 0, 4)
                        Frame9.Size = UDim2.new(0, 0, 0, 20)
                        UiCorner25.CornerRadius = UDim.new(0, 5)
                        UiCorner25.Parent = Frame9
                        TextLabel9.Parent = Frame9
                        TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel9.BackgroundTransparency = 1
                        TextLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextLabel9.BorderSizePixel = 0
                        TextLabel9.Size = UDim2.new(1, 0, 1, 0)
                        TextLabel9.Font = Enum.Font.GothamMedium
                        TextLabel9.Text = ""
                        TextLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
                        TextLabel9.TextSize = 14
                        ImageLabel11.Parent = Frame9
                        ImageLabel11.AnchorPoint = Vector2.new(1, 0)
                        ImageLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ImageLabel11.BackgroundTransparency = 1
                        ImageLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ImageLabel11.BorderSizePixel = 0
                        ImageLabel11.Position = UDim2.new(1, -8, 0, 2)
                        ImageLabel11.Size = UDim2.new(0, 16, 0, 16)
                        ImageLabel11.Image = "rbxassetid://76137750753739"
                        F11(ImageLabel11, "ImageColor3", "light")
                        TextBox2.Parent = Frame9
                        TextBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        TextBox2.BackgroundTransparency = 1
                        TextBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        TextBox2.BorderSizePixel = 0
                        TextBox2.ClipsDescendants = true
                        TextBox2.Position = UDim2.new(0, 7, 0, 0)
                        TextBox2.Size = UDim2.new(1, -40, 1, 0)
                        TextBox2.Font = Enum.Font.GothamMedium
                        TextBox2.PlaceholderColor3 = Color3.fromRGB(127, 127, 127)
                        TextBox2.PlaceholderText = PlaceholderText or "Input Text"
                        TextBox2.Text = CurrentValue16 or ""
                        F11(TextBox2, "TextColor3", "light")
                        TextBox2.TextSize = 12
                        TextBox2.TextXAlignment = Enum.TextXAlignment.Left
                        TextBox2.ClearTextOnFocus = P147.ClearTextOnFocus
                        local FocusLost3 = TextBox2.FocusLost
                        V230[#V230 + 1] = FocusLost3:Connect(function()
                            local Text10 = TextBox2.Text
                            V315.Flags[Flag5] = { CurrentValue = Text10 }
                            if P147.RemoveTextAfterFocusLost then
                                TextBox2.Text = ""
                            end
                            task.spawn(function() V242:SafeCallback(Callback6, Name9, "input", Text10) end)
                        end)
                        if V222[1][V222[3]][Flag5] and not P147.DontSave then
                            V315.Flags[Flag5] = V222[1][V222[3]][Flag5]
                            TextBox2.Text = tostring(V222[1][V222[3]][Flag5].CurrentValue)
                            task.spawn(function() V242:SafeCallback(Callback6, Name9, "input", TextBox2.Text, true) end)
                        end
                        local RenderStepped2 = V228.RenderStepped
                        V230[#V230 + 1] = RenderStepped2:Connect(function()
                            local V404 = math.max(30, TextBox2.TextBounds.X + 50)
                            V231:Create(Frame9, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(0, math.clamp(V404, 0, 160), 0, 20),
                            }):Play()
                        end)
                        return {
                            Set = function(P148, P149)
                                TextBox2.Text = tostring(P149 or "")
                                V315.Flags[Flag5] = { CurrentValue = TextBox2.Text }
                            end,
                        }
                    end
                    function V345:CreateColorPicker(P150)
                        local Name10 = P150.Name
                        local Color4 = P150.Color
                        local Flag6 = P150.Flag
                        local Callback7 = P150.Callback or function() end
                        local function F59(P151)
                            local V405, V406, V407 = unpack(P151:split("/"))
                            return Color3.fromHSV(tonumber(V405), tonumber(V406), tonumber(V407))
                        end
                        if V222[1][V222[3]][Flag6] and V222[1][V222[3]][Flag6].Color and not P150.DontSave then
                            Color4 = F59(V222[1][V222[3]][Flag6].Color)
                        end
                        V315.Flags[Flag6] = { Color = Color4 }
                        table.insert(V342.Features, Name10)
                        local Colorpicker = Instance.new("Frame")
                        local SliderName3 = Instance.new("TextLabel")
                        local UiCorner26 = Instance.new("UICorner")
                        local ColorIndicatorBackground = Instance.new("Frame")
                        local UiCorner27 = Instance.new("UICorner")
                        local ColorIndicator = Instance.new("Frame")
                        local UiCorner28 = Instance.new("UICorner")
                        local ColorSlider = Instance.new("Frame")
                        local UiGradient3 = Instance.new("UIGradient")
                        local UiCorner29 = Instance.new("UICorner")
                        local Base = Instance.new("Frame")
                        local UiCorner30 = Instance.new("UICorner")
                        local UiGradient4 = Instance.new("UIGradient")
                        local Overlay = Instance.new("Frame")
                        local UiCorner31 = Instance.new("UICorner")
                        local UiGradient5 = Instance.new("UIGradient")
                        local HexValue = Instance.new("Frame")
                        local UiCorner32 = Instance.new("UICorner")
                        local HexValueText = Instance.new("TextBox")
                        local FormatIndication = Instance.new("TextLabel")
                        local RgbValue = Instance.new("Frame")
                        local UiCorner33 = Instance.new("UICorner")
                        local RgbValueText = Instance.new("TextBox")
                        local FormatIndication2 = Instance.new("TextLabel")
                        local HsvValue = Instance.new("Frame")
                        local UiCorner34 = Instance.new("UICorner")
                        local HsvValueText = Instance.new("TextBox")
                        local FormatIndication3 = Instance.new("TextLabel")
                        Colorpicker.Name = "Colorpicker"
                        Colorpicker.Parent = ScrollingFrame4
                        F41(Colorpicker)
                        Colorpicker.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                        Colorpicker.BackgroundTransparency = 0.45
                        Colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Colorpicker.BorderSizePixel = 0
                        Colorpicker.ClipsDescendants = true
                        Colorpicker.Size = UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, 32)
                        SliderName3.Name = "SliderName"
                        SliderName3.Parent = Colorpicker
                        SliderName3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        SliderName3.BackgroundTransparency = 1
                        SliderName3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        SliderName3.BorderSizePixel = 0
                        SliderName3.Position = UDim2.new(0, 10, 0, 0)
                        SliderName3.Size = UDim2.new(0.5, 0, 0, 32)
                        SliderName3.Font = Enum.Font.GothamMedium
                        SliderName3.Text = Name10
                        SliderName3.TextColor3 = Color3.fromRGB(199, 199, 199)
                        SliderName3.TextSize = 12
                        SliderName3.TextXAlignment = Enum.TextXAlignment.Left
                        F28(SliderName3, P150)
                        UiCorner26.CornerRadius = UDim.new(0, 5)
                        UiCorner26.Parent = Colorpicker
                        ColorIndicatorBackground.Name = "ColorIndicatorBackground"
                        ColorIndicatorBackground.Parent = Colorpicker
                        ColorIndicatorBackground.AnchorPoint = Vector2.new(1, 0.5)
                        ColorIndicatorBackground.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        ColorIndicatorBackground.BackgroundTransparency = 0.3
                        ColorIndicatorBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ColorIndicatorBackground.BorderSizePixel = 0
                        ColorIndicatorBackground.Position = UDim2.new(1, -4, 0, 16)
                        ColorIndicatorBackground.Size = UDim2.new(0, 50, 0, 20)
                        UiCorner27.CornerRadius = UDim.new(0, 5)
                        UiCorner27.Parent = ColorIndicatorBackground
                        ColorIndicator.Name = "ColorIndicator"
                        ColorIndicator.Parent = Colorpicker
                        ColorIndicator.AnchorPoint = Vector2.new(1, 0.5)
                        ColorIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                        ColorIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ColorIndicator.BorderSizePixel = 0
                        ColorIndicator.Position = UDim2.new(1, -6, 0, 16)
                        ColorIndicator.Size = UDim2.new(0, 46, 0, 16)
                        UiCorner28.CornerRadius = UDim.new(0, 4)
                        UiCorner28.Parent = ColorIndicator
                        ColorSlider.Name = "ColorSlider"
                        ColorSlider.Parent = Colorpicker
                        ColorSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ColorSlider.BorderColor3 = Color3.fromRGB(27, 42, 53)
                        ColorSlider.ClipsDescendants = true
                        ColorSlider.Position = UDim2.new(0, 10, 0, 120)
                        ColorSlider.Size = UDim2.new(0, 173, 0, 12)
                        UiGradient3.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                            ColorSequenceKeypoint.new(0.06, Color3.fromRGB(255, 85, 0)),
                            ColorSequenceKeypoint.new(0.11, Color3.fromRGB(255, 170, 0)),
                            ColorSequenceKeypoint.new(0.17, Color3.fromRGB(254, 255, 0)),
                            ColorSequenceKeypoint.new(0.22, Color3.fromRGB(169, 255, 0)),
                            ColorSequenceKeypoint.new(0.28, Color3.fromRGB(83, 255, 0)),
                            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 1)),
                            ColorSequenceKeypoint.new(0.39, Color3.fromRGB(0, 255, 86)),
                            ColorSequenceKeypoint.new(0.45, Color3.fromRGB(0, 255, 171)),
                            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 252, 255)),
                            ColorSequenceKeypoint.new(0.56, Color3.fromRGB(0, 167, 255)),
                            ColorSequenceKeypoint.new(0.61, Color3.fromRGB(0, 82, 255)),
                            ColorSequenceKeypoint.new(0.67, Color3.fromRGB(2, 0, 255)),
                            ColorSequenceKeypoint.new(0.72, Color3.fromRGB(88, 0, 255)),
                            ColorSequenceKeypoint.new(0.78, Color3.fromRGB(173, 0, 255)),
                            ColorSequenceKeypoint.new(0.84, Color3.fromRGB(255, 0, 251)),
                            ColorSequenceKeypoint.new(0.89, Color3.fromRGB(255, 0, 166)),
                            ColorSequenceKeypoint.new(0.95, Color3.fromRGB(255, 0, 80)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
                        })
                        UiGradient3.Parent = ColorSlider
                        UiCorner29.CornerRadius = UDim.new(0, 6)
                        UiCorner29.Parent = ColorSlider
                        Base.Name = "Base"
                        Base.Parent = Colorpicker
                        Base.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Base.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Base.BorderSizePixel = 0
                        Base.Position = UDim2.new(0, 10, 0, 33)
                        Base.Size = UDim2.new(0, 173, 0, 80)
                        UiCorner30.CornerRadius = UDim.new(0, 6)
                        UiCorner30.Parent = Base
                        local HueThumb = Instance.new("Frame")
                        local UiCorner35 = Instance.new("UICorner")
                        HueThumb.Name = "HueThumb"
                        HueThumb.Parent = ColorSlider
                        HueThumb.AnchorPoint = Vector2.new(0.5, 0.5)
                        HueThumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        HueThumb.BorderSizePixel = 0
                        HueThumb.Size = UDim2.new(0, 6, 0, 6)
                        HueThumb.ZIndex = 10
                        HueThumb.ClipsDescendants = false
                        UiCorner35.CornerRadius = UDim.new(1, 0)
                        UiCorner35.Parent = HueThumb
                        local UiStroke5 = Instance.new("UIStroke")
                        UiStroke5.Color = Color3.fromRGB(0, 0, 0)
                        UiStroke5.Thickness = 1
                        UiStroke5.Parent = HueThumb
                        local ColorThumb = Instance.new("Frame")
                        local UiCorner36 = Instance.new("UICorner")
                        ColorThumb.Name = "ColorThumb"
                        ColorThumb.Parent = Overlay
                        ColorThumb.AnchorPoint = Vector2.new(0.5, 0.5)
                        ColorThumb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        ColorThumb.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        ColorThumb.BorderSizePixel = 0
                        ColorThumb.Size = UDim2.fromOffset(6, 6)
                        ColorThumb.ZIndex = 10
                        ColorThumb.ClipsDescendants = false
                        UiCorner36.CornerRadius = UDim.new(1, 0)
                        UiCorner36.Parent = ColorThumb
                        local UiStroke6 = Instance.new("UIStroke")
                        UiStroke6.Color = Color3.fromRGB(0, 0, 0)
                        UiStroke6.Thickness = 1
                        UiStroke6.Parent = ColorThumb
                        local function F60(P152)
                            return (math.clamp(
                                (P152 - ColorSlider.AbsolutePosition.X) / ColorSlider.AbsoluteSize.X, 0, 1
                            ))
                        end
                        local function F61(P153, P154)
                            return math.clamp((P153 - Overlay.AbsolutePosition.X) / Overlay.AbsoluteSize.X, 0, 1), (math.clamp((P154 - Overlay.AbsolutePosition.Y) / Overlay.AbsoluteSize.Y, 0, 1))
                        end
                        local V408, V409, V410 = Color4:ToHSV()
                        ColorThumb.Position = UDim2.fromScale(1 - V410, 1 - V409)
                        UiGradient4.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                            ColorSequenceKeypoint.new(1, Color3.fromHSV(V408, 1, 1)),
                        })
                        UiGradient4.Rotation = 270
                        UiGradient4.Parent = Base
                        local V411 = V408
                        HueThumb.Position = UDim2.fromScale(V408, 0.5)
                        local Text11, Text12
                        local function F62(P155, P156, P157, P158, P159)
                            local V412 = P158
                            local V413 = P157
                            if not (V413 and V412) then
                                V413, V412 = F61(P155, P156)
                            end
                            V231:Create(ColorThumb, TweenInfo.new(0.1), { Position = UDim2.fromScale(V413, V412) }):Play()
                            local Color5 = Color3.fromHSV(V411, 1 - V412, 1 - V413)
                            ColorIndicatorBackground.BackgroundColor3 = Color5
                            ColorIndicator.BackgroundColor3 = Color5
                            local V414 = tostring(Color5)
                            HsvValueText.Text = string.format(
                                "%s, %s, %s", math.floor(tonumber(V414:split(", ")[1]) * 360),
                                math.floor(tonumber(V414:split(", ")[2]) * 255),
                                math.floor(tonumber(V414:split(", ")[3]) * 255)
                            )
                            local V415 = math.floor(Color5.R * 255 + 0.5)
                            local V416 = math.floor(Color5.G * 255 + 0.5)
                            local V417 = math.floor(Color5.B * 255 + 0.5)
                            RgbValueText.Text = string.format("%s, %s, %s", V415, V416, V417)
                            HexValueText.Text = string.format("#%02x%02x%02x", V415, V416, V417)
                            Text11 = HexValueText.Text
                            Text12 = RgbValueText.Text
                            V315.Flags[Flag6] = { Color = Color5 }
                            if not P159 then
                                task.spawn(function() V242:SafeCallback(Callback7, Name10, "colorpicker", Color5) end)
                            end
                        end
                        local V418 = false
                        local V419 = false
                        local InputBegan10 = ColorSlider.InputBegan
                        local V420
                        V230[#V230 + 1] = InputBegan10:Connect(function(P160)
                            if P160.UserInputType == Enum.UserInputType.MouseButton1
                                or P160.UserInputType == Enum.UserInputType.Touch then
                                V418 = true
                                V420 = P160
                                while V418 and V237() do
                                    local V421 = F60(V420.Position.X)
                                    V411 = V421
                                    V231:Create(HueThumb, TweenInfo.new(0.1), { Position = UDim2.fromScale(V421, 0.5) }):Play()
                                    local Color6 = Color3.fromHSV(V421, 1, 1)
                                    UiGradient4.Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color6),
                                    })
                                    F62(nil, nil, ColorThumb.Position.X.Scale, ColorThumb.Position.Y.Scale)
                                end
                            end
                        end)
                        local InputChanged5 = ColorSlider.InputChanged
                        V230[#V230 + 1] = InputChanged5:Connect(function(P161)
                            if P161.UserInputType == Enum.UserInputType.MouseMovement
                                or P161.UserInputType == Enum.UserInputType.Touch then
                                V420 = P161
                            end
                        end)
                        local InputEnded4 = ColorSlider.InputEnded
                        V230[#V230 + 1] = InputEnded4:Connect(function(P162)
                            if P162.UserInputType == Enum.UserInputType.MouseButton1
                                or P162.UserInputType == Enum.UserInputType.Touch then
                                V418 = false
                            end
                        end)
                        F62(nil, nil, ColorThumb.Position.X.Scale, ColorThumb.Position.Y.Scale, true)
                        local Color7 = V222[1][V222[3]][Flag6] and V222[1][V222[3]][Flag6].Color and not P150.DontSave
                        local Color8
                        if Color7 then
                            Color8 = V315.Flags[Flag6].Color
                            task.spawn(function() V242:SafeCallback(Callback7, Name10, "colorpicker", Color8) end)
                        end
                        local InputBegan11 = Overlay.InputBegan
                        local V422
                        V230[#V230 + 1] = InputBegan11:Connect(function(P163)
                            if P163.UserInputType == Enum.UserInputType.MouseButton1
                                or P163.UserInputType == Enum.UserInputType.Touch then
                                V419 = true
                                V422 = P163
                                while V419 and V237() do
                                    F62(V422.Position.X, V422.Position.Y)
                                end
                            end
                        end)
                        local InputChanged6 = Overlay.InputChanged
                        V230[#V230 + 1] = InputChanged6:Connect(function(P164)
                            if P164.UserInputType == Enum.UserInputType.MouseMovement
                                or P164.UserInputType == Enum.UserInputType.Touch then
                                V422 = P164
                            end
                        end)
                        local InputEnded5 = Overlay.InputEnded
                        V230[#V230 + 1] = InputEnded5:Connect(function(P165)
                            if P165.UserInputType == Enum.UserInputType.MouseButton1
                                or P165.UserInputType == Enum.UserInputType.Touch then
                                V419 = false
                            end
                        end)
                        Overlay.Name = "Overlay"
                        Overlay.Parent = Colorpicker
                        Overlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Overlay.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        Overlay.BorderSizePixel = 0
                        Overlay.Position = UDim2.new(0, 10, 0, 33)
                        Overlay.Size = UDim2.new(0, 173, 0, 80)
                        UiCorner31.CornerRadius = UDim.new(0, 6)
                        UiCorner31.Parent = Overlay
                        UiGradient5.Color = ColorSequence.new({
                            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
                            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0)),
                        })
                        UiGradient5.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0),
                        })
                        UiGradient5.Parent = Overlay
                        HexValue.Name = "HexValue"
                        HexValue.Parent = Colorpicker
                        HexValue.AnchorPoint = Vector2.new(1, 1)
                        HexValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        HexValue.BackgroundTransparency = 0.5
                        HexValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HexValue.BorderSizePixel = 0
                        HexValue.Position = UDim2.new(1, -10, 0, 130)
                        HexValue.Size = UDim2.new(0, 100, 0, 26)
                        UiCorner32.Parent = HexValue
                        HexValueText.Name = "HexValueText"
                        HexValueText.Parent = HexValue
                        HexValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        HexValueText.BackgroundTransparency = 1
                        HexValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HexValueText.BorderSizePixel = 0
                        HexValueText.Size = UDim2.new(1, 0, 1, 0)
                        HexValueText.Font = Enum.Font.GothamMedium
                        HexValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        HexValueText.TextSize = 14
                        HexValueText.ClearTextOnFocus = false
                        local FocusLost4 = HexValueText.FocusLost
                        V230[#V230 + 1] = FocusLost4:Connect(function()
                            local Text13 = HexValueText.Text
                            if Text13:sub(1, 1) == "#" then
                                Text13 = Text13:sub(2)
                            end
                            if not Text13:match("%x+%x+%x+") then
                                HexValueText.Text = Text11
                                return
                            else
                                local Sub = Text13:sub(1, 2)
                                local Sub2 = Text13:sub(3, 4)
                                local Sub3 = Text13:sub(5, 6)
                                local V423 = tonumber(Sub, 16)
                                local V424 = tonumber(Sub2, 16)
                                local V425 = tonumber(Sub3, 16)
                                local V426, V427, V428 = Color3.fromRGB(V423, V424, V425):ToHSV()
                                V411 = V426
                                V231:Create(HueThumb, TweenInfo.new(0.1), { Position = UDim2.fromScale(V426, 0.5) }):Play()
                                UiGradient4.Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                    ColorSequenceKeypoint.new(1, Color3.fromHSV(V426, 1, 1)),
                                })
                                F62(nil, nil, 1 - V428, 1 - V427)
                                return
                            end
                        end)
                        FormatIndication.Name = "FormatIndication"
                        FormatIndication.Parent = HexValue
                        FormatIndication.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        FormatIndication.BackgroundTransparency = 1
                        FormatIndication.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        FormatIndication.BorderSizePixel = 0
                        FormatIndication.Position = UDim2.new(-1, -7, 0, 0)
                        FormatIndication.Size = UDim2.new(1, 0, 1, 0)
                        FormatIndication.Font = Enum.Font.GothamMedium
                        FormatIndication.Text = "HEX"
                        FormatIndication.TextColor3 = Color3.fromRGB(141, 141, 141)
                        FormatIndication.TextSize = 14
                        FormatIndication.TextWrapped = true
                        FormatIndication.TextXAlignment = Enum.TextXAlignment.Right
                        RgbValue.Name = "RgbValue"
                        RgbValue.Parent = Colorpicker
                        RgbValue.AnchorPoint = Vector2.new(1, 1)
                        RgbValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        RgbValue.BackgroundTransparency = 0.5
                        RgbValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        RgbValue.BorderSizePixel = 0
                        RgbValue.Position = UDim2.new(1, -10, 0, 100)
                        RgbValue.Size = UDim2.new(0, 100, 0, 26)
                        UiCorner33.Parent = RgbValue
                        RgbValueText.Name = "RgbValueText"
                        RgbValueText.Parent = RgbValue
                        RgbValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        RgbValueText.BackgroundTransparency = 1
                        RgbValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        RgbValueText.BorderSizePixel = 0
                        RgbValueText.Size = UDim2.new(1, 0, 1, 0)
                        RgbValueText.Font = Enum.Font.GothamMedium
                        RgbValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        RgbValueText.TextSize = 14
                        RgbValueText.ClearTextOnFocus = false
                        local FocusLost5 = RgbValueText.FocusLost
                        V230[#V230 + 1] = FocusLost5:Connect(function()
                            local Gsub2 = RgbValueText.Text:gsub(" ", "")
                            if not Gsub2:match("%d+,%d+,%d+") then
                                RgbValueText.Text = Text12
                                return
                            else
                                local Split = Gsub2:split(",")
                                local Split2 = Gsub2:split(",")
                                local Split3 = Gsub2:split(",")
                                local V429 = tonumber(Split[1])
                                local V430 = tonumber(Split2[2])
                                local V431 = tonumber(Split3[3])
                                if not (V429 and V430 and V431) then
                                    RgbValueText.Text = Text12
                                    return
                                end
                                if V429 < 0 or V429 > 255 or V430 < 0 or V430 > 255 or V431 < 0 or V431 > 255 then
                                    RgbValueText.Text = Text12
                                    return
                                else
                                    local V432, V433, V434 = Color3.fromRGB(V429, V430, V431):ToHSV()
                                    V411 = V432
                                    V231:Create(HueThumb, TweenInfo.new(0.1), { Position = UDim2.fromScale(V432, 0.5) }):Play()
                                    UiGradient4.Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromHSV(V432, 1, 1)),
                                    })
                                    F62(nil, nil, 1 - V434, 1 - V433)
                                    return
                                end
                            end
                        end)
                        FormatIndication2.Name = "FormatIndication"
                        FormatIndication2.Parent = RgbValue
                        FormatIndication2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        FormatIndication2.BackgroundTransparency = 1
                        FormatIndication2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        FormatIndication2.BorderSizePixel = 0
                        FormatIndication2.Position = UDim2.new(-1, -7, 0, 0)
                        FormatIndication2.Size = UDim2.new(1, 0, 1, 0)
                        FormatIndication2.Font = Enum.Font.GothamMedium
                        FormatIndication2.Text = "RGB"
                        FormatIndication2.TextColor3 = Color3.fromRGB(141, 141, 141)
                        FormatIndication2.TextSize = 14
                        FormatIndication2.TextWrapped = true
                        FormatIndication2.TextXAlignment = Enum.TextXAlignment.Right
                        HsvValue.Name = "HsvValue"
                        HsvValue.Parent = Colorpicker
                        HsvValue.AnchorPoint = Vector2.new(1, 1)
                        HsvValue.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                        HsvValue.BackgroundTransparency = 0.5
                        HsvValue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HsvValue.BorderSizePixel = 0
                        HsvValue.Position = UDim2.new(1, -10, 0, 70)
                        HsvValue.Size = UDim2.new(0, 100, 0, 26)
                        UiCorner34.Parent = HsvValue
                        HsvValueText.Name = "HsvValueText"
                        HsvValueText.Parent = HsvValue
                        HsvValueText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        HsvValueText.BackgroundTransparency = 1
                        HsvValueText.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        HsvValueText.BorderSizePixel = 0
                        HsvValueText.Size = UDim2.new(1, 0, 1, 0)
                        HsvValueText.Font = Enum.Font.GothamMedium
                        HsvValueText.TextColor3 = Color3.fromRGB(255, 255, 255)
                        HsvValueText.TextSize = 14
                        local FocusLost6 = HsvValueText.FocusLost
                        V230[#V230 + 1] = FocusLost6:Connect(function()
                            local Gsub3 = HsvValueText.Text:gsub(" ", "")
                            if not Gsub3:match("%d+,%d+,%d+") then
                                HsvValueText.Text = Text12
                                return
                            else
                                local Split4 = Gsub3:split(",")
                                local Split5 = Gsub3:split(",")
                                local Split6 = Gsub3:split(",")
                                local V435 = tonumber(Split4[1])
                                local V436 = tonumber(Split5[2])
                                local V437 = tonumber(Split6[3])
                                if not (V435 and V436 and V437) then
                                    HsvValueText.Text = Text12
                                    return
                                end
                                if V435 < 0 or V435 > 360 or V436 < 0 or V436 > 255 or V437 < 0 or V437 > 255 then
                                    HsvValueText.Text = Text12
                                    return
                                else
                                    local V438 = V435 / 360
                                    local V439 = V436 / 255
                                    local V440 = V437 / 255
                                    local V441, V442, V443 = Color3.fromHSV(V438, V439, V440):ToHSV()
                                    V411 = V441
                                    V231:Create(HueThumb, TweenInfo.new(0.1), { Position = UDim2.fromScale(V441, 0.5) }):Play()
                                    UiGradient4.Color = ColorSequence.new({
                                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                        ColorSequenceKeypoint.new(1, Color3.fromHSV(V441, 1, 1)),
                                    })
                                    F62(nil, nil, 1 - V443, 1 - V442)
                                    return
                                end
                            end
                        end)
                        FormatIndication3.Name = "FormatIndication"
                        FormatIndication3.Parent = HsvValue
                        FormatIndication3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        FormatIndication3.BackgroundTransparency = 1
                        FormatIndication3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        FormatIndication3.BorderSizePixel = 0
                        FormatIndication3.Position = UDim2.new(-1, -7, 0, 0)
                        FormatIndication3.Size = UDim2.new(1, 0, 1, 0)
                        FormatIndication3.Font = Enum.Font.GothamMedium
                        FormatIndication3.Text = "HSV"
                        FormatIndication3.TextColor3 = Color3.fromRGB(141, 141, 141)
                        FormatIndication3.TextSize = 14
                        FormatIndication3.TextWrapped = true
                        FormatIndication3.TextXAlignment = Enum.TextXAlignment.Right
                        local TextButton11 = Instance.new("TextButton")
                        TextButton11.Parent = Colorpicker
                        TextButton11.Text = ""
                        TextButton11.ZIndex = 2
                        TextButton11.BackgroundTransparency = 1
                        TextButton11.BorderSizePixel = 0
                        TextButton11.Size = UDim2.new(1, 0, 0, 32)
                        local V444 = false
                        local function F63(Visible3)
                            HexValue.Visible = Visible3
                            RgbValue.Visible = Visible3
                            HsvValue.Visible = Visible3
                            ColorSlider.Visible = Visible3
                            Overlay.Visible = Visible3
                            Base.Visible = Visible3
                        end
                        local function F64(P166)
                            return UDim2.new(1, -((V233 or _G.SINGLE_COLUMNS) and 29 or 10), 0, P166)
                        end
                        local Count7 = 0
                        local V445 = {
                            { Items = { Base, Overlay }, Delay = 0, Offset = Vector2.new(0, 14) },
                            { Items = { ColorSlider }, Delay = 0.06, Offset = Vector2.new(0, 14) },
                            { Items = { HsvValue }, Delay = 0.1, Offset = Vector2.new(24, 0) },
                            { Items = { RgbValue }, Delay = 0.15, Offset = Vector2.new(24, 0) },
                            { Items = { HexValue }, Delay = 0.2, Offset = Vector2.new(24, 0) },
                        }
                        local function F65(P167)
                            local V446 = {}
                            local function F66(P168)
                                if P168:IsA("GuiObject") then
                                    table.insert(V446, { P168, "BackgroundTransparency", P168.BackgroundTransparency })
                                    if P168:IsA("TextLabel") or P168:IsA("TextBox") then
                                        table.insert(V446, { P168, "TextTransparency", P168.TextTransparency })
                                    end
                                elseif P168:IsA("UIStroke") then
                                    table.insert(V446, { P168, "Transparency", P168.Transparency })
                                end
                            end
                            F66(P167)
                            for Index10, Value29 in ipairs(P167:GetDescendants()) do
                                F66(Value29)
                            end
                            return V446
                        end
                        for Index11, Value30 in ipairs(V445) do
                            Value30.Data = {}
                            for Index12, Value31 in ipairs(Value30.Items) do
                                local Position8 = Value31.Position
                                Value30.Data[Value31] = {
                                    Rest = Position8,
                                    Hidden = UDim2.new(
                                        Position8.X.Scale, Position8.X.Offset + Value30.Offset.X, Position8.Y.Scale,
                                        Position8.Y.Offset + Value30.Offset.Y
                                    ),
                                    Fade = F65(Value31),
                                }
                            end
                        end
                        local function F67(P169)
                            for Index13, Value32 in ipairs(V445) do
                                for Key21, Value33 in pairs(Value32.Data) do
                                    Key21.Position = P169 and Value33.Rest or Value33.Hidden
                                    for Index14, Value34 in ipairs(Value33.Fade) do
                                        local V447 = Value34[1]
                                        local V448 = Value34[2]
                                        V447[V448] = P169 and Value34[3] or 1
                                    end
                                end
                            end
                        end
                        local Create3
                        local function F68(P170)
                            Count7 = Count7 + 1
                            local V449 = Count7
                            if Create3 then
                                Create3:Cancel()
                            end
                            if P170 then
                                F63(true)
                            end
                            Create3 = V231:Create(Colorpicker, TweenInfo.new(
                                P170 and 0.45 or 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out
                            ), { Size = F64(P170 and 140 or 32) })
                            Create3:Play()
                            local V450 = P170 and 0.4 or 0.18
                            local TweenInfo11 = TweenInfo.new(
                                V450, P170 and Enum.EasingStyle.Quint or Enum.EasingStyle.Quad, Enum.EasingDirection.Out
                            )
                            for Index15, Value35 in ipairs(V445) do
                                local V451 = Value35
                                task.delay(P170 and V451.Delay or 0, function()
                                    if V449 ~= Count7 then
                                        return
                                    end
                                    for Key22, Value36 in pairs(V451.Data) do
                                        V231:Create(Key22, TweenInfo11, {
                                            Position = P170 and Value36.Rest or Value36.Hidden,
                                        }):Play()
                                        for Index16, Value37 in ipairs(Value36.Fade) do
                                            V231:Create(Value37[1], TweenInfo11, {
                                                [Value37[2]] = P170 and Value37[3] or 1,
                                            }):Play()
                                        end
                                    end
                                end)
                            end
                            if not P170 then
                                task.delay(0.3, function()
                                    if V449 == Count7 and not V444 then
                                        F63(false)
                                    end
                                end)
                            end
                        end
                        local MouseButton1Click12 = TextButton11.MouseButton1Click
                        V230[#V230 + 1] = MouseButton1Click12:Connect(function()
                            V444 = not V444
                            PlaySound("click")
                            F68(V444)
                        end)
                        Colorpicker.Size = F64(32)
                        F67(false)
                        F63(false)
                        return {
                            Set = function(P171, P172)
                                local V452, V453, V454 = P172:ToHSV()
                                V411 = V452
                                HueThumb.Position = UDim2.fromScale(V452, 0.5)
                                UiGradient4.Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                                    ColorSequenceKeypoint.new(1, Color3.fromHSV(V452, 1, 1)),
                                })
                                F62(nil, nil, 1 - V454, 1 - V453, true)
                            end,
                        }
                    end
                    function V345:CreateDivider()
                        local Frame10 = Instance.new("Frame")
                        Frame10.Parent = ScrollingFrame4
                        F41(Frame10, true)
                        Frame10.BackgroundTransparency = 1
                        Frame10.Size = UDim2.new(1, 0, 0, 18)
                        Frame10.ClipsDescendants = true
                        local Frame11 = Instance.new("Frame")
                        Frame11.Parent = Frame10
                        Frame11.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                        Frame11.Size = UDim2.new(1, -4, 0, 1)
                        Frame11.Position = UDim2.new(0.5, -2, 0.5, 0)
                        Frame11.AnchorPoint = Vector2.new(0.5, 0.5)
                        Frame11.BorderSizePixel = 0
                        Frame11.BackgroundTransparency = 0.5
                    end
                    return V345
                end
                function V315.CreateThemeTab(P173)
                    local ThemeTab = V315:CreateTab("#!THEME", "paintbrush")
                    local V455 = { "Default Catsaken", "Purplesaken", "Greensaken", "Bluesaken" }
                    local V456 = {
                        Purplesaken = {
                            title = "",
                            background = "https://i.pinimg.com/236x/3f/f6/d6/3ff6d6f8e37e18859575e453bd434eb9.jpg",
                            accent = "ae59ff",
                            shades = {
                                alt = "c900ff",
                                hover = "b81eff",
                                mid = "9e27f5",
                                dark = "c900ff",
                                dark2 = "7c0fa0",
                                deep = "84009b",
                                light = "c76eff",
                            },
                        },
                        Greensaken = {
                            title = "",
                            background = "https://img.pixers.pics/pho_wat(s3:700/FO/47/10/76/97/700_FO47107697_297131ab14cff90a0d8e3fe6e39e5b9b.jpg,700,700,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,650,jpg)/wall-murals-green-eco-leaves-seamless-background-pattern.jpg.jpg",
                            accent = "59ff5b",
                            shades = {
                                alt = "00ff0c",
                                hover = "1eff57",
                                mid = "27f53f",
                                dark = "20ff00",
                                dark2 = "0fa034",
                                deep = "00ff4a",
                                light = "6eff70",
                            },
                        },
                        ["Default Catsaken"] = {
                            title = "",
                            background = "https://github.com/aibabylaugh/catsaken/raw/main/patterns.jpg",
                            accent = "ffbe50",
                        },
                        Bluesaken = {
                            title = "",
                            background = "https://w.wallhaven.cc/full/eo/wallhaven-eod8ew.png",
                            accent = "0088ff",
                            shades = {
                                alt = "00a1ff",
                                hover = "00a0ff",
                                mid = "008ef5",
                                dark = "00548c",
                                dark2 = "005ca0",
                                deep = "00416e",
                                light = "2b9eff",
                            },
                        },
                    }
                    local V457 = {}
                    local function F69(P174)
                        return string.format(
                            "%02x%02x%02x", math.floor(P174.R * 255 + 0.5), math.floor(P174.G * 255 + 0.5),
                            math.floor(P174.B * 255 + 0.5)
                        )
                    end
                    local function F70(P175)
                        local Gsub4 = tostring(P175):gsub("#", "")
                        local V458 = tonumber(Gsub4:sub(1, 2), 16)
                        local V459 = tonumber(Gsub4:sub(3, 4), 16)
                        local V460 = tonumber(Gsub4:sub(5, 6), 16)
                        if V458 and V459 and V460 then
                            return Color3.fromRGB(V458, V459, V460)
                        end
                    end
                    local function F71(P176)
                        return tostring(P176 or ""):gsub("[^%w _%-]", ""):match("^%s*(.-)%s*$")
                    end
                    local function F72(P177)
                        return "Catsaken/themes" .. "/" .. P177 .. ".json"
                    end
                    local function F73()
                        local V461 = {
                            title = type(_G.LUNAR_TITLE) == "string" and _G.LUNAR_TITLE or "",
                            background = type(_G.LUNAR_BACKGROUND) == "string" and _G.LUNAR_BACKGROUND or "",
                            accent = F69(F9()),
                            shades = {},
                        }
                        for Index17, Value38 in ipairs(V242.AccentShadeNames) do
                            V461.shades[Value38] = F69(F9(Value38))
                        end
                        return V461
                    end
                    local function F74()
                        local V462 = {}
                        local V463, V464 = pcall(listfiles, "Catsaken/themes")
                        if V463 then
                            for Index18, Value39 in ipairs(V464) do
                                local Json = Value39:match("([^/\\]+)%.json$")
                                if Json then
                                    table.insert(V462, Json)
                                end
                            end
                        end
                        table.sort(V462, function(P178, P179) return P178:lower() < P179:lower() end)
                        return V462
                    end
                    local function F75()
                        local V465 = { unpack(V455) }
                        for Index19, Value40 in ipairs(F74()) do
                            if not V456[Value40] then
                                table.insert(V465, Value40)
                            end
                        end
                        return V465
                    end
                    local function F76(P180)
                        if V456[P180] then
                            return V456[P180]
                        end
                        local V466 = F72(P180)
                        if isfile(V466) then
                            local V467, V468 = pcall(function() return V225:JSONDecode(readfile(V466)) end)
                            if V467 and type(V468) == "table" then
                                return V468
                            end
                            return
                        end
                    end
                    local function F77()
                        if isfile("Catsaken/themes/_autoload.txt") then
                            local SS = readfile("Catsaken/themes/_autoload.txt"):match("^%s*(.-)%s*$")
                            return SS ~= "" and SS or nil
                        end
                    end
                    local Input5, BackgroundURLInput
                    local function F78(P181)
                        local Accent = P181.accent and F70(P181.accent)
                        if Accent then
                            Color2 = Accent
                        end
                        for Index20, Value41 in ipairs(V242.AccentShadeNames) do
                            local Shades = P181.shades and P181.shades[Value41]
                            V250[Value41] = Shades and F70(Shades) or nil
                        end
                        if V457.accent then
                            V457.accent:Set(F9())
                        end
                        for Index21, Value42 in ipairs(V242.AccentShadeNames) do
                            if V457[Value42] then
                                V457[Value42]:Set(F9(Value42))
                            end
                        end
                        if P181.title ~= nil then
                            local V469 = _G
                            V469.LUNAR_TITLE = P181.title ~= "" and P181.title or V234
                            _G.UpdGuiTitle()
                            if Input5 then
                                Input5:Set(P181.title)
                            end
                        end
                        if P181.background ~= nil then
                            local V470 = _G
                            V470.LUNAR_BACKGROUND = P181.background ~= "" and P181.background or nil
                            _G.UpdGuiBackground()
                            if BackgroundURLInput then
                                BackgroundURLInput:Set(P181.background)
                            end
                        end
                    end
                    ThemeTab:CreateSection("Colors", "Left")
                    V457.accent = ThemeTab:CreateColorPicker({
                        Name = "Accent",
                        Color = F9(),
                        Flag = "__ThemeAccent",
                        DontSave = true,
                        Callback = function(Value43)
                            Color2 = Value43
                            for Index22, Value44 in ipairs(V242.AccentShadeNames) do
                                if not V250[Value44] and V457[Value44] then
                                    V457[Value44]:Set(F9(Value44))
                                end
                            end
                        end,
                    })
                    local V471 = {
                        alt = "Title gradient end",
                        hover = "Icon hover",
                        mid = "Slider, dropdown, scrollbar",
                        dark = "Toggle on, search box",
                        dark2 = "Keybind waiting",
                        deep = "Tab hover",
                        light = "Input text",
                    }
                    for Index23, Value45 in ipairs(V242.AccentShadeNames) do
                        local CreateColorPicker = ThemeTab.CreateColorPicker
                        local V472 = Value45
                        V457[V472] = CreateColorPicker(ThemeTab, {
                            Name = V471[V472],
                            Color = F9(V472),
                            Flag = "__ThemeShade_" .. V472,
                            DontSave = true,
                            Callback = function(Value46) V250[V472] = Value46 end,
                        })
                    end
                    ThemeTab:CreateSection("Themes", "Right")
                    local V473 = V455[1]
                    local V474 = ""
                    local Label2
                    local function F79(P182)
                        Label2:Set("Auto-load: " .. (F77() or "none") .. (P182 and "\n" .. P182 or ""))
                    end
                    Label2 = ThemeTab:CreateLabel("")
                    F79()
                    local ThemeDropdown = ThemeTab:CreateDropdown({
                        Name = "Theme",
                        Flag = "__ThemeSelect",
                        Options = F75(),
                        CurrentOption = { V473 },
                        MultipleOptions = false,
                        Callback = function(Value47) V473 = Value47[1] end,
                    })
                    ThemeTab:CreateButton({
                        Name = "Load theme",
                        Callback = function()
                            local V475 = V473 and F76(V473)
                            if not V475 then
                                return F79("Pick a theme first")
                            end
                            F78(V475)
                            F79("Loaded " .. V473)
                        end,
                    })
                    ThemeTab:CreateButton({
                        Name = "Set as auto-load",
                        Callback = function()
                            if not (V473 and F76(V473)) then
                                return F79("Pick a theme first")
                            end
                            writefile("Catsaken/themes/_autoload.txt", V473)
                            F79("Auto-load set to " .. V473)
                        end,
                    })
                    ThemeTab:CreateButton({
                        Name = "Clear auto-load",
                        Callback = function() F79("Auto-load cleared") end,
                    })
                    ThemeTab:CreateButton({
                        Name = "Delete theme",
                        Callback = function()
                            if not V473 then
                                return F79("Pick a theme first")
                            elseif V456[V473] then
                                return F79("Presets can't be deleted")
                            else
                                local V476 = V473
                                pcall(delfile, F72(V476))
                                if F77() == V476 then
                                end
                                V473 = nil
                                ThemeDropdown:Refresh(F75())
                                F79("Deleted " .. V476)
                                return
                            end
                        end,
                    })
                    ThemeTab:CreateInput({
                        Name = "Save current as",
                        Flag = "__ThemeSaveName",
                        PlaceholderText = "Theme name",
                        RemoveTextAfterFocusLost = false,
                        DontSave = true,
                        Callback = function(Value48) V474 = F71(Value48) end,
                    })
                    ThemeTab:CreateButton({
                        Name = "Save theme",
                        Callback = function()
                            if V474 == "" then
                                return F79("Type a theme name first")
                            elseif V456[V474] then
                                return F79(V474 .. " is a preset name")
                            else
                                writefile(F72(V474), V225:JSONEncode(F73()))
                                ThemeDropdown:Refresh(F75())
                                F79("Saved " .. V474)
                                return
                            end
                        end,
                    })
                    ThemeTab:CreateSection("Preview", "Right")
                    ThemeTab:CreateLabel("Everything here uses your colors live.")
                    ThemeTab:CreateToggle({
                        Name = "Example toggle",
                        Flag = "__ThemePreviewToggle",
                        CurrentValue = true,
                        NoSave = true,
                        ToolTip = "Example tooltip",
                        Callback = NULL,
                    })
                    ThemeTab:CreateToggle({
                        Name = "Example text toggle",
                        Flag = "__ThemePreviewTextToggle",
                        CurrentValue = true,
                        TextMode = true,
                        NoSave = true,
                        Callback = NULL,
                        ToolTip = "Used to easily differentiate setting/configurations and actual features",
                    })
                    ThemeTab:CreateSlider({
                        Name = "Example slider",
                        Flag = "__ThemePreviewSlider",
                        Range = { 0, 100 },
                        Increment = 1,
                        Suffix = "%",
                        CurrentValue = 50,
                        Callback = NULL,
                    })
                    ThemeTab:CreateDropdown({
                        Name = "Example dropdown",
                        Flag = "__ThemePreviewDropdown",
                        Options = { "Option 1", "Option 2", "Option 3" },
                        CurrentOption = { "Option 1" },
                        MultipleOptions = false,
                        Callback = NULL,
                    })
                    ThemeTab:CreateKeybind({ Name = "Example keybind", Callback = NULL })
                    ThemeTab:CreateInput({
                        Name = "Example textbox",
                        Flag = "__ThemePreviewInput",
                        PlaceholderText = "Type here",
                        DontSave = true,
                        Callback = NULL,
                    })
                    ThemeTab:CreateColorPicker({
                        Name = "Example color picker",
                        Color = Color3.fromRGB(255, 255, 255),
                        Flag = "__ThemePreviewColor",
                        DontSave = true,
                        Callback = NULL,
                    })
                    ThemeTab:CreateButton({ Name = "Example button", Callback = NULL })
                    ThemeTab:CreateSection("Window", "Left")
                    BackgroundURLInput = ThemeTab:CreateInput({
                        Name = "Background (URL)",
                        CurrentValue = isfile("Catsaken/backgroundimg") and readfile("Catsaken/backgroundimg"),
                        PlaceholderText = "URL",
                        RemoveTextAfterFocusLost = false,
                        Flag = "backgroundimg",
                        DontSave = true,
                        Callback = function(Value49, P183)
                            local V477 = Value49
                            if P183 then
                                return
                            end
                            writefile("Catsaken/backgroundimg", V477)
                            if V477 == "" or not V477:match("http?.://") then
                                V477 = "https://github.com/aibabylaugh/catsaken/raw/main/patterns.jpg"
                            end
                            _G.LUNAR_BACKGROUND = V477
                            _G.UpdGuiBackground()
                        end,
                    })
                    Input5 = ThemeTab:CreateInput({
                        Name = "Window title (html supported)",
                        CurrentValue = isfile("Catsaken/windowtitle") and readfile("Catsaken/windowtitle"),
                        PlaceholderText = "Text",
                        RemoveTextAfterFocusLost = false,
                        Flag = "windowtitle",
                        DontSave = true,
                        Callback = function(Value50, P184)
                            if P184 then
                                return
                            else
                                writefile("Catsaken/windowtitle", Value50)
                                local V478 = _G
                                V478.LUNAR_TITLE = Value50 ~= "" and Value50 or V234
                                _G.UpdGuiTitle()
                                return
                            end
                        end,
                    })
                    if isfile("Catsaken/backgroundimg") then
                        local CatsakenBackgroundimg = readfile("Catsaken/backgroundimg")
                        if CatsakenBackgroundimg == "" or not CatsakenBackgroundimg:match("http?.://") then
                            CatsakenBackgroundimg = "https://github.com/aibabylaugh/catsaken/raw/main/patterns.jpg"
                        end
                        _G.LUNAR_BACKGROUND = CatsakenBackgroundimg
                        _G.UpdGuiBackground()
                    end
                    if isfile("Catsaken/windowtitle") then
                        local CatsakenWindowtitle = readfile("Catsaken/windowtitle")
                        local V479 = _G
                        V479.LUNAR_TITLE = CatsakenWindowtitle ~= "" and CatsakenWindowtitle or V234
                        _G.UpdGuiTitle()
                    end
                    local V480 = F77()
                    local V481 = V480 and F76(V480)
                    if V481 then
                        task.spawn(F78, V481)
                    end
                    return ThemeTab
                end
                V315.Keybinds = {}
                local InputBegan12 = V227.InputBegan
                V230[#V230 + 1] = InputBegan12:Connect(function(P185, P186)
                    if V235[1][V235[3]] then
                        return
                    end
                    if P186 then
                        return
                    end
                    for Key23, Value51 in pairs(V315.Keybinds) do
                        if Value51.Pressable and Value51.KeyCode and P185.KeyCode == Enum.KeyCode[Value51.KeyCode] then
                            Value51.Callback()
                        end
                    end
                end)
                function V315:SelectTab(P187)
                    for Key24, Value52 in pairs(V333) do
                        if Value52 ~= V333[P187] then
                            Value52.IsSelected = false
                            Value52.Deselect()
                        end
                    end
                    V333[P187].IsSelected = true
                    V333[P187].Select()
                end
                V315.Flags = setmetatable({}, {
                    __index = function(Object3, Key25)
                        if not rawget(Object3, Key25) then
                            return { CurrentValue = false, Color = Color3.fromRGB(0, 0, 0), CurrentOption = {} }
                        end
                        return rawget(Object3, Key25)
                    end,
                })
                V242.__Window__ = Frame2
                return V315
            end
            function V242:Destroy()
                pcall(function() V242.__Window__.Parent:Destroy() end)
            end
            function V242:SafeCallback(P188, P189, P190, ...)
                assert(typeof(P188) == "function", "SafeCallback: Callback is not a function")
                assert(typeof(P189) == "string", "SafeCallback: Name is not a string")
                assert(typeof(P190) == "string", "SafeCallback: Type is not a string")
                xpcall(P188, function(P191)
                    V238(string.format(
                        "[UI] error in %s \"%s\"! threw: %s", tostring(P190), tostring(P189), tostring(P191)
                    ))
                end, ...)
            end
            return V242
        end
    end,
    V = function(P192)
        local V482 = P192[13]
        local V483 = P192[4]
        local V484 = P192[5]
        local V485 = P192[14]
        local V486 = P192[8]
        local V487 = P192[2]
        local V488 = P192[11]
        local V489 = P192[1]
        local V490 = P192[6]
        local V491 = P192[12]
        local V492 = P192[9]
        local V493 = P192[3]
        local V494 = P192[10]
        local V495 = P192[7]
        local V496 = P192[0]
        return function()
            while V491(0.3) and not V487[1][V487[3]] do
                xpcall(function()
                    local V497 = {}
                    V497.Survivors = {}
                    V497.MainKiller = nil
                    local GetChildren = workspace:GetChildren()
                    local GetChildren2 = V482:GetChildren()
                    for I9 = 1, #GetChildren2 do
                        local V498 = GetChildren2[I9]
                        if V498:GetAttribute("Username") ~= nil and V495:GetPlayerFromCharacter(V498) ~= nil then
                            V489.MainKiller = V498
                            break
                        end
                    end
                    local GetChildren3 = V486:GetChildren()
                    for I10 = 1, #GetChildren3 do
                        local V499 = GetChildren3[I10]
                        if V499:GetAttribute("InvisibilityTransparency") then
                            V499:SetAttribute("LastInvisibilityTime", tick())
                        end
                        if not table.find(V497.Survivors, V499) then
                            table.insert(V497.Survivors, V499)
                        end
                    end
                    local JaneDoeDoc
                    if GetGameMap() then
                        V497.RoundGenerators = {}
                        V497.Items = {}
                        V497.Gingerbread = {}
                        V497.TaphDebris = {}
                        V497.BuildermanDebris = {}
                        V497.DoeDebris = {}
                        V497.DoeTrailDebris = {}
                        V497.NosDebris = {}
                        V497.VeeDebris = {}
                        V497.AzureDebris = {}
                        V497.GearsDebris = {}
                        V497.Spikes = {}
                        V497.JaneDoeDoc = nil
                        V497.JaneDoeRing = nil
                        for I11 = 1, #V489.Items do
                            local V500 = V489.Items[I11]
                            if V500
                                and (V500.Parent and (V500.Parent.Parent == V486 or V500.Parent.Name == "Backpack")
                                    or not V500.Parent) then
                                table.remove(V489.Items, I11)
                            end
                        end
                        local V501 = GetGameMapObjects()
                        local V502 = #V501
                        local Count8 = 0
                        while true do
                            Count8 = 1 + Count8
                            if not (V502 >= Count8) then
                                break
                            end
                            local V503 = V501[Count8]
                            if V503.Name == "Generator" and not table.find(V497.RoundGenerators, V503) then
                                table.insert(V497.RoundGenerators, V503)
                            elseif V503:IsA("Tool") and not table.find(V497.Items, V503) then
                                table.insert(V497.Items, V503)
                            elseif V503.Name == "GearsTest" then
                                local GetChildren4 = V503:GetChildren()
                                local V504 = #GetChildren4
                                local Count9 = 0
                                while true do
                                    Count9 = 1 + Count9
                                    if not (Count9 <= V504) then
                                        break
                                    end
                                    local V505 = GetChildren4[Count9]
                                    if V505.Name == "Gear" then
                                        if not table.find(V497.GearsDebris, V505) then
                                            table.insert(V497.GearsDebris, V505)
                                        end
                                    end
                                end
                            end
                        end
                        for I12 = 1, #GetChildren do
                            local V506 = GetChildren[I12]
                            if V506:IsA("Tool") and not table.find(V497.Items, V506) then
                                table.insert(V497.Items, V506)
                            elseif V506.Name == "Model" and V506:IsA("MeshPart") then
                                if V506.MeshId == V488 then
                                    V497.JaneDoeRing = V506
                                elseif V506.MeshId == V494 then
                                    V497.JaneDoeDoc = V506
                                end
                            end
                        end
                        local GetChildren5 = workspace.Map.Ingame:GetChildren()
                        local V507 = #GetChildren5
                        local Count10 = 0
                        while true do
                            Count10 = 1 + Count10
                            if not (Count10 <= V507) then
                                break
                            end
                            local V508 = GetChildren5[Count10]
                            if (string.find(V508.Name, "TaphTripwire") or V508.Name == "SubspaceTripmine")
                                and not table.find(V497.TaphDebris, V508) and V508:FindFirstChild("SubspaceBox") then
                                table.insert(V497.TaphDebris, V508)
                            elseif (V508.Name == "BuildermanSentry" or V508.Name == "BuildermanDispenser")
                                and not table.find(V497.BuildermanDebris, V508) then
                                table.insert(V497.BuildermanDebris, V508)
                            elseif V508.Name:sub(-7) == "Shadows" and V508.Name:sub(1, -8) == GetKillerUsername() then
                                for Key26, Value53 in pairs(V508:GetChildren()) do
                                    if not table.find(V497.DoeDebris, Value53) then
                                        table.insert(V497.DoeDebris, Value53)
                                    end
                                end
                            elseif V508.Name:sub(-12) == "JohnDoeTrail"
                                and V508.Name:sub(1, -13) == GetKillerUsername() then
                                for Key27, Value54 in pairs(V508:GetChildren()) do
                                    if not table.find(V497.DoeTrailDebris, Value54) then
                                        table.insert(V497.DoeTrailDebris, Value54)
                                    end
                                end
                            elseif V508.Name:sub(-6) == "Puddle"
                                and V508.Name:sub(1, -7) == GetKillerUsername() and not table.find(V497.NosDebris, V508) then
                                table.insert(V497.NosDebris, V508)
                            elseif V508.Name:sub(-5) == "Spray" and V495:FindFirstChild(V508.Name:sub(1, -6))
                                and not table.find(V497.VeeDebris, V508) then
                                table.insert(V497.VeeDebris, V508)
                            elseif V508.Name == "SpikeCollision" and not table.find(V497.Spikes, V508) then
                                if V493.Flags.SpikeNoclip.CurrentValue then
                                    V508:Destroy()
                                else
                                    table.insert(V497.Spikes, V508)
                                end
                            elseif (V508.Name == "VineModel" or V508.Name == "GroundBulbModel")
                                and not table.find(V497.AzureDebris, V508) then
                                table.insert(V497.AzureDebris, V508)
                            elseif V508:IsA("Tool") and not table.find(V497.Items, V508) then
                                table.insert(V497.Items, V508)
                            end
                        end
                        if workspace.Map.Ingame:FindFirstChild("CurrencyLocations") then
                            local GetChildren6 = workspace.Map.Ingame.CurrencyLocations:GetChildren()
                            local V509 = #GetChildren6
                            local Count11 = 0
                            while true do
                                Count11 = 1 + Count11
                                if not (V509 >= Count11) then
                                    break
                                end
                                local V510 = Count11
                                local V511 = GetChildren6[V510]
                                if V511:FindFirstChildWhichIsA("Part").Position.Y > 0
                                    and not table.find(V497.Gingerbread, V511) then
                                    table.insert(V497.Gingerbread, V511)
                                elseif table.find(V497.Gingerbread, V511) and V511["618714418"].Transparency == 1 then
                                    table.remove(V497.Gingerbread, V510)
                                end
                            end
                        end
                        if V492[1][V492[3]] then
                            FuckingTable = V489.EspAppliedToGenerators
                            for I13 = 1, #V489.RoundGenerators do
                                local V512 = V489.RoundGenerators[I13]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.GeneratorEsp.CurrentValue then
                                    if not V512:FindFirstChildOfClass("Highlight") then
                                    else
                                        V512:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V512] = false
                                    end
                                elseif FuckingTable[V512] then
                                else
                                    FuckingTable[V512] = true
                                    AddHighlightEsp(V512, "GeneratorEspColor")
                                    AddTextLabel(V512.Main, "GeneratorEspColor", "GeneratorEsp", {
                                        Text = function()
                                            local HumanoidRootPart16 = GetGeneratorProgress(V512) and V496.Character
                                                and V489.GameState == 1
                                                and V496.Character:FindFirstChild("HumanoidRootPart")
                                            if HumanoidRootPart16 then
                                                local V513 = GetGeneratorProgress(V512)
                                                return ("%s • %dm • %s"):format("Generator", math.round((V512.Main.Position
                                                        - HumanoidRootPart16.Position).magnitude
                                                    / 3.57), V513 >= 100 and "Done" or V513 .. "%")
                                            end
                                            if GetGeneratorProgress(V512) then
                                                local V514 = GetGeneratorProgress(V512)
                                                return ("%s • %s"):format(
                                                    "Generator", V514 >= 100 and "Done" or V514 .. "%"
                                                )
                                            end
                                            return "Generator"
                                        end,
                                        TextSize = 10,
                                        Font = Enum.Font.RobotoMono,
                                    }, Color3.fromRGB(0, 0, 0))
                                end
                            end
                            FuckingTable = V489.EspAppliedToItems
                            local V515 = #V489.Items
                            local Count12 = 0
                            while true do
                                Count12 = 1 + Count12
                                if not (V515 >= Count12) then
                                    break
                                end
                                local V516 = V489.Items[Count12]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.ItemEsp.CurrentValue then
                                    if not V516:FindFirstChildOfClass("Highlight") then
                                    else
                                        V516:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V516] = false
                                    end
                                elseif FuckingTable[V516] then
                                else
                                    FuckingTable[V516] = true
                                    AddHighlightEsp(V516, "ItemEspColor")
                                    if V516:FindFirstChild("ItemRoot") then
                                        AddTextLabel(V516.ItemRoot, "ItemEspColor", "ItemEsp", {
                                            Text = function()
                                                local HumanoidRootPart17 = V496.Character and V489.GameState == 1
                                                    and V496.Character:FindFirstChild("HumanoidRootPart")
                                                if HumanoidRootPart17 then
                                                    return ("%s • %dm"):format(V516.Name == "BloxyCola"
                                                            and "Bloxy Cola"
                                                        or V516.Name, math.round((V516.ItemRoot.Position
                                                            - HumanoidRootPart17.Position).magnitude
                                                        / 3.57))
                                                end
                                                return V516.Name == "BloxyCola" and "Bloxy Cola" or V516.Name
                                            end,
                                            TextSize = 10,
                                            Font = Enum.Font.RobotoMono,
                                        }, Color3.fromRGB(0, 0, 0))
                                    end
                                end
                            end
                            FuckingTable = V489.EspAppliedToGingerbread
                            for I14 = 1, #V489.Gingerbread do
                                local V517 = V489.Gingerbread[I14]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.GingerbreadEsp.CurrentValue then
                                    if not V517:FindFirstChildOfClass("Highlight") then
                                    else
                                        V517:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V517] = false
                                    end
                                elseif FuckingTable[V517] then
                                else
                                    FuckingTable[V517] = true
                                    AddHighlightEsp(V517, "GingerbreadEspColor")
                                end
                            end
                            FuckingTable = V489.EspAppliedToTaphDebris
                            for I15 = 1, #V489.TaphDebris do
                                local V518 = V489.TaphDebris[I15]
                                if V487[1][V487[3]] then
                                    return
                                end
                                if V493.Flags.TripmineRanges.CurrentValue and V518.Name == "SubspaceTripmine"
                                    and not V518.SubspaceBox:FindFirstChild("RANGEVIS") then
                                    CreateRangeCircle(V518.SubspaceBox, V484.SubspaceRange, V484.SubspaceRange)
                                end
                                if not V493.Flags.TaphEsp.CurrentValue then
                                    if not V518:FindFirstChildOfClass("Highlight") then
                                    elseif not IsKiller() then
                                    else
                                        V518:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V518] = false
                                    end
                                elseif FuckingTable[V518] then
                                else
                                    FuckingTable[V518] = true
                                    AddHighlightEsp(V518, "TaphEspColor")
                                end
                            end
                            FuckingTable = V489.EspAppliedToBuildermanDebris
                            local V519 = #V489.BuildermanDebris
                            local Count13 = 0
                            while true do
                                Count13 = 1 + Count13
                                if not (Count13 <= V519) then
                                    break
                                end
                                local V520 = V489.BuildermanDebris[Count13]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.BuildermanEsp.CurrentValue then
                                    if not V520:FindFirstChildOfClass("Highlight") then
                                    elseif not IsKiller() then
                                    else
                                        V520:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V520] = false
                                    end
                                elseif FuckingTable[V520] then
                                else
                                    FuckingTable[V520] = true
                                    AddHighlightEsp(V520, "BuildermanEspColor")
                                end
                            end
                            FuckingTable = V489.EspAppliedToDoeDebris
                            for I16 = 1, #V489.DoeDebris do
                                local V521 = V489.DoeDebris[I16]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.JohnDoeEsp.CurrentValue then
                                    if not V521:FindFirstChild("Highlight") then
                                    else
                                        V521:FindFirstChild("Highlight"):Destroy()
                                        FuckingTable[V521] = false
                                    end
                                else
                                    if V521:FindFirstChild("PlayerAura") then
                                        V521.PlayerAura:Destroy()
                                    end
                                    if FuckingTable[V521] then
                                    else
                                        FuckingTable[V521] = true
                                        V521.Transparency = 0
                                        AddHighlightEsp(V521, "JohnDoeEspColor")
                                    end
                                end
                            end
                            FuckingTable = V489.EspAppliedToVeeDebris
                            local V522 = #V489.VeeDebris
                            local Count14 = 0
                            while true do
                                Count14 = 1 + Count14
                                if not (V522 >= Count14) then
                                    break
                                end
                                local V523 = V489.VeeDebris[Count14]
                                if V487[1][V487[3]] then
                                    return
                                elseif not V493.Flags.VeeronicaEsp.CurrentValue then
                                    if not V523:FindFirstChildOfClass("Highlight") then
                                    else
                                        V523:FindFirstChildOfClass("Highlight"):Destroy()
                                        FuckingTable[V523] = false
                                    end
                                elseif FuckingTable[V523] then
                                else
                                    FuckingTable[V523] = true
                                    AddHighlightEsp(V523, "VeeronicaEspColor")
                                end
                            end
                            FuckingTable = V489.EspAppliedToAzureDebris
                            for I17 = 1, #V489.AzureDebris do
                                local V524 = V489.AzureDebris[I17]
                                if V487[1][V487[3]] then
                                    return
                                end
                                if V493.Flags.AzureEspRange.CurrentValue
                                    and not V524.RootPart:FindFirstChild("RANGEVIS") then
                                    if V524.Name == "GroundBulbModel" then
                                        CreateRangeCircle(
                                            V524.RootPart, V483.ConstructConfigs.GroundBulb.Radius,
                                            V483.ConstructConfigs.GroundBulb.Radius
                                        )
                                    elseif V524.Name == "VineModel" then
                                        CreateRangeCircle(
                                            V524.RootPart, V483.ConstructConfigs.Vine.Radius,
                                            V483.ConstructConfigs.Vine.Radius
                                        )
                                    end
                                end
                                if not V493.Flags.AzureEsp.CurrentValue then
                                    if V524:FindFirstChild("AZUREHIGHLIGHT") then
                                        V524.AZUREHIGHLIGHT:Destroy()
                                    end
                                    FuckingTable[V524] = false
                                elseif FuckingTable[V524] then
                                else
                                    FuckingTable[V524] = true
                                    AddHighlightEsp(V524, "AzureEspColor", "AZUREHIGHLIGHT")
                                end
                            end
                            if V487[1][V487[3]] then
                                return
                            end
                            JaneDoeDoc = V489.JaneDoeDoc or V489.JaneDoeRing
                            if JaneDoeDoc then
                                if not JaneDoeDoc:FindFirstChildOfClass("EspTL") then
                                    AddTextLabel(JaneDoeDoc, "JaneDoeQuestEspColor", "JaneDoeQuestEsp", {
                                        Text = function()
                                            local HumanoidRootPart18 = V496.Character and V489.GameState == 1
                                                and V496.Character:FindFirstChild("HumanoidRootPart")
                                            if HumanoidRootPart18 then
                                                return ("%s • %dm"):format(JaneDoeDoc == V489.JaneDoeDoc and "Document"
                                                    or "Ring", math.round((JaneDoeDoc.Position
                                                        - HumanoidRootPart18.Position).magnitude
                                                    / 3.57))
                                            end
                                            return JaneDoeDoc == V489.JaneDoeDoc and "Document" or "Ring"
                                        end,
                                        TextSize = 10,
                                        Font = Enum.Font.RobotoMono,
                                    }, Color3.fromRGB(0, 0, 0))
                                end
                            end
                            FuckingTable = V489.EspAppliedToGearsDebris
                            local CurrentValue17 = V493.Flags.GearsEsp.CurrentValue
                            if not CurrentValue17 and V490:FindFirstChild("GearsHighlightStorage") then
                                for Key28, Value55 in pairs(V490.GearsHighlightStorage:GetChildren()) do
                                    Value55.Parent = V489.GearHighlightsStore[Value55]
                                    V489.GearHighlightsStore[Value55] = nil
                                end
                            end
                            local V525 = #V489.GearsDebris
                            local Count15 = 0
                            while true do
                                Count15 = 1 + Count15
                                if not (Count15 <= V525) then
                                    break
                                end
                                local V526 = V489.GearsDebris[Count15]
                                if V487[1][V487[3]] then
                                    return
                                elseif not CurrentValue17 then
                                    if not V526:FindFirstChild("NewGearHighlight") then
                                    else
                                        V526:FindFirstChild("NewGearHighlight"):Destroy()
                                        FuckingTable[V526] = false
                                    end
                                elseif FuckingTable[V526] then
                                else
                                    FuckingTable[V526] = true
                                    pcall(function()
                                        V489.GearHighlightsStore[V526.GearHighlight] = V526
                                        V526.GearHighlight.Parent = V490.GearsHighlightStorage
                                    end)
                                    AddHighlightEsp(V526, "GearsEspColor", "NewGearHighlight")
                                end
                            end
                        end
                        for Key29, Value56 in pairs(V497) do
                            V489[Key29] = Value56
                        end
                        V492[1][V492[3]] = true
                        return
                    end
                    for Key30, Value57 in pairs(V497) do
                        V489[Key30] = Value57
                    end
                    V492[1][V492[3]] = true
                end, function(P193)
                    if V487[1][V487[3]] then
                        return
                    end
                    V485("error in an extremely important loop:", tostring(P193))
                end)
            end
        end
    end,
    Z = function(P194)
        local V527 = P194[5]
        local V528 = P194[8]
        local Callback8 = P194[1]
        local V529 = P194[10]
        local V530 = P194[14]
        local V531 = P194[4]
        local V532 = P194[16]
        local V533 = P194[17]
        local V534 = P194[0]
        local V535 = P194[3]
        local V536 = P194[2]
        local V537 = P194[12]
        local V538 = P194[7]
        local V539 = P194[6]
        local V540 = P194[15]
        local V541 = P194[11]
        local V542 = P194[9]
        local V543 = P194[13]
        return function()
            V535:CreateSection("Movement animations")
            local V544 = {}
            local V545 = {}
            local V546 = {}
            local V547 = {}
            local V548 = {}
            local V549 = {}
            local V550 = {}
            local V551 = {}
            local function F80(P195)
                P195.Walk = {}
                P195.Run = {}
                P195.Idle = {}
                P195.InjuredWalk = {}
                P195.InjuredRun = {}
                P195.InjuredIdle = {}
            end
            F80(V550)
            F80(V551)
            function scan_runwalkidle(P196, P197)
                local GetChildren7 = P196:GetChildren()
                local V552 = #GetChildren7
                local V553
                for I18 = 1, V552 do
                    local V554 = GetChildren7[I18]
                    if V554.Name == "Sixer" or V554.Parent.Name == "Sixer" then
                    elseif P197 and V554.Parent.Parent.Name == "Skins" then
                        scan_runwalkidle(V554, true)
                    elseif V554:IsA("Folder") and V554:FindFirstChild("Config") then
                        local V555 = require(V554.Config)
                        if P197 then
                            local V556 = (V554.Parent.Parent.Name == "Killers" and V529 or V536)[V554.Parent.Name]
                            local V557 = require(V556.Config)
                            V553 = string.format("%s (%s)", V557.DisplayName or V556.Name, V555.DisplayName)
                        else
                            V553 = string.format("%s", V555.DisplayName or V554.Name)
                        end
                        local Animations3 = V555.Animations
                        if Animations3 then
                            if Animations3.Walk and not table.find(V544, Animations3.Walk) then
                                V550.Walk[V553] = Animations3.Walk
                                V551.Walk[#V551.Walk + 1] = V553
                            end
                            if Animations3.Run and not table.find(V545, Animations3.Run) then
                                V550.Run[V553] = Animations3.Run
                                V551.Run[#V551.Run + 1] = V553
                            end
                            if Animations3.Idle and not table.find(V546, Animations3.Idle) then
                                V550.Idle[V553] = Animations3.Idle
                                V551.Idle[#V551.Idle + 1] = V553
                            end
                            if Animations3.InjuredWalk and not table.find(V547, Animations3.InjuredWalk) then
                                V550.InjuredWalk[V553] = Animations3.InjuredWalk
                                V551.InjuredWalk[#V551.InjuredWalk + 1] = V553
                            end
                            if Animations3.InjuredRun and not table.find(V548, Animations3.InjuredRun) then
                                V550.InjuredRun[V553] = Animations3.InjuredRun
                                V551.InjuredRun[#V551.InjuredRun + 1] = V553
                            end
                            if Animations3.InjuredIdle and not table.find(V549, Animations3.InjuredIdle) then
                                V550.InjuredIdle[V553] = Animations3.InjuredIdle
                                V551.InjuredIdle[#V551.InjuredIdle + 1] = V553
                            end
                        end
                    end
                end
            end
            scan_runwalkidle(V529)
            scan_runwalkidle(V536)
            scan_runwalkidle(V543, true)
            scan_runwalkidle(V530, true)
            V532(string.format(
                "[Animations] inserted: %d walk anims, %d run anims, %d idle anims, %d injured walk anims, %d injured run anims, %d injured idle anims",
                #V551.Walk, #V551.Run, #V551.Idle, #V551.InjuredWalk, #V551.InjuredRun, #V551.InjuredIdle
            ))
            local function F81(P198)
                local V558 = { "Default" }
                local V559 = V551[P198]
                for I19 = 1, #V559 do
                    V558[#V558 + 1] = V559[I19]
                end
                return V558
            end
            local function F82(P199)
                local V560 = P199[1]
                V527:PreloadAsync({ V550[V560] })
                V532("cached", V560)
            end
            V535:CreateLabel("Animations are FE — Everyone can see them like you do " .. utf8.char(9989))
            V535:CreateToggle({
                Name = "Replace run animations",
                CurrentValue = false,
                Flag = "ReplaceRunAnims",
                Callback = Callback8,
            })
            V535:CreateDropdown({
                Name = "Basic run",
                Options = F81("Run"),
                CurrentOption = { "Default" },
                Flag = "SelectedRunAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateDropdown({
                Name = "Injured run",
                Options = F81("InjuredRun"),
                CurrentOption = { "Default" },
                Flag = "SelectedInjuredRunAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateToggle({
                Name = "Replace walk animations",
                CurrentValue = false,
                Flag = "ReplaceWalkAnims",
                Callback = Callback8,
            })
            V535:CreateDropdown({
                Name = "Basic walk",
                Options = F81("Walk"),
                CurrentOption = { "Default" },
                Flag = "SelectedWalkAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateDropdown({
                Name = "Injured walk",
                Options = F81("InjuredWalk"),
                CurrentOption = { "Default" },
                Flag = "SelectedInjuredWalkAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateToggle({
                Name = "Replace idle animations",
                CurrentValue = false,
                Flag = "ReplaceIdleAnims",
                Callback = Callback8,
            })
            V535:CreateDropdown({
                Name = "Basic idle",
                Options = F81("Idle"),
                CurrentOption = { "Default" },
                Flag = "SelectedIdleAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateDropdown({
                Name = "Injured idle",
                Options = F81("InjuredIdle"),
                CurrentOption = { "Default" },
                Flag = "SelectedInjuredIdleAnimation",
                Callback = F82,
                Searchable = true,
            })
            V535:CreateToggle({
                Name = "Fake injured animations",
                CurrentValue = false,
                Flag = "FakeInjuredAnims",
                Callback = Callback8,
            })
            V535:CreateSection("Ghost animations")
            V535:CreateToggle({
                Name = "Enable ghost animations",
                CurrentValue = false,
                Flag = "GhostAnims",
                Callback = Callback8,
            })
            V535:CreateDivider()
            V535:CreateToggle({
                Name = "Ghost M1 Animation",
                CurrentValue = false,
                Flag = "GhostM1",
                Callback = Callback8,
            })
            local V561 = #V534.Metas.GhostAnimationsOrder
            local Count16 = 0
            while true do
                Count16 = 1 + Count16
                if not (V561 >= Count16) then
                    break
                end
                local V562 = V534.Metas.GhostAnimationsOrder[Count16]
                local V563 = {}
                for Index24, Value58 in ipairs(V534.Metas.GhostAnimations[V562]) do
                    V563[Index24] = Value58.Flag:sub(#V562 + 1, #Value58.Flag)
                end
                V535:CreateDropdown({
                    Name = V562,
                    Options = V563,
                    CurrentOption = {},
                    Flag = V562 .. "GhostAnimation",
                    MultipleOptions = true,
                    Callback = Callback8,
                    Searchable = true,
                })
            end
            V535:CreateLabel("This section is not finished.")
            local CatsakenANIMS = V537.CATSAKEN_ANIMS or {}
            V537.CATSAKEN_ANIMS = CatsakenANIMS
            for Index25, Value59 in ipairs({ "Walk", "Run", "Idle" }) do
                local Animation = Instance.new("Animation")
                CatsakenANIMS[Value59] = Animation
                CatsakenANIMS["Injured" .. Value59] = Animation
            end
            function getselanim(P200)
                return V539.Flags["Selected" .. P200 .. "Animation"].CurrentOption[1]
            end
            function uwubitch(P201)
                xpcall(function()
                    local WaitForChild4 = P201 and P201:WaitForChild("HumanoidRootPart", 7)
                    if not WaitForChild4 then
                        return
                    end
                    local WaitForChild5 = WaitForChild4 and P201:WaitForChild("Humanoid", 7)
                    if not WaitForChild5 then
                        return
                    end
                    local WaitForChild6 = WaitForChild5:WaitForChild("Animator", 5)
                    if not WaitForChild6 then
                        return
                    end
                    local Run, Walk, Idle, InjuredRun, InjuredWalk, InjuredIdle, F83
                    if not P201.Parent or P201.Parent == V542 then
                        return
                    else
                        local Animations4 = (V534:GetSkinConfig(P201) or {}).Animations
                        if not Animations4 then
                            Animations4 = V534:GetConfig(P201) and V534:GetConfig(P201).Animations
                        end
                        if not Animations4 then
                            return
                        else
                            local V564 = table.clone(V533(V541.ApplySkinDataToActorInfo, 2))
                            Run = Animations4.Run or V564.Run
                            Walk = Animations4.Walk or V564.Walk
                            Idle = Animations4.Idle or V564.Idle
                            InjuredRun = V564.InjuredRun
                            InjuredWalk = V564.InjuredWalk
                            InjuredIdle = V564.InjuredIdle
                            function F83()
                                return WaitForChild6.AnimationPlayed:Connect(function(P202)
                                    if CatsakenANIMS[P202.Animation] then
                                        return
                                    end
                                    local V565 = nil
                                    if P202.Animation.AnimationId == InjuredRun then
                                        V565 = "InjuredRun"
                                    end
                                    if P202.Animation.AnimationId == InjuredWalk then
                                        V565 = "InjuredWalk"
                                    end
                                    if P202.Animation.AnimationId == InjuredIdle then
                                        V565 = "InjuredIdle"
                                    end
                                    if P202.Animation.AnimationId == Run then
                                        V565 = "Run"
                                    end
                                    if P202.Animation.AnimationId == Walk then
                                        V565 = "Walk"
                                    end
                                    if P202.Animation.AnimationId == Idle then
                                        V565 = "Idle"
                                    end
                                    local AnimationId, Priority, LoadAnimation
                                    if not V565 then
                                        return
                                    else
                                        local CurrentValue18 = V539.Flags.FakeInjuredAnims.CurrentValue
                                            and (V565 == "Run" or V565 == "Walk" or V565 == "Idle")
                                        if (V565:find("Idle") and not V539.Flags.ReplaceIdleAnims.CurrentValue
                                                or V565:find("Run") and not V539.Flags.ReplaceRunAnims.CurrentValue
                                                or V565:find("Walk") and not V539.Flags.ReplaceWalkAnims.CurrentValue)
                                            and not CurrentValue18 then
                                            return
                                        else
                                            local V566 = getselanim(V565)
                                            if CurrentValue18 then
                                                AnimationId = V565 == "Run" and InjuredRun
                                                    or V565 == "Walk" and InjuredWalk or InjuredIdle
                                            elseif V566 == "Default" then
                                                return
                                            else
                                                if not V566 then
                                                    return V528("hey!", P202.Animation.AnimationId)
                                                end
                                                AnimationId = V550[V565][V566]
                                            end
                                            Priority = P202.Priority
                                            P202.Priority = Enum.AnimationPriority.Core
                                            local V567 = CatsakenANIMS[V565]
                                            V567.AnimationId = AnimationId
                                            LoadAnimation = WaitForChild5:LoadAnimation(V567)
                                            LoadAnimation.Priority = V565:find("Idle") and Enum.AnimationPriority.Idle
                                                or Enum.AnimationPriority.Movement
                                            TrackingConnection:Disconnect()
                                            LoadAnimation:Play(0.15)
                                            task.spawn(function()
                                                while P202.IsPlaying do
                                                    if V565:find("Run") then
                                                        LoadAnimation:AdjustSpeed(WaitForChild5.WalkSpeed
                                                            / V531.SprintSpeed)
                                                    elseif V565:find("Idle") then
                                                        LoadAnimation:AdjustSpeed(1)
                                                    elseif V565:find("Walk") then
                                                        LoadAnimation:AdjustSpeed(WaitForChild5.WalkSpeed
                                                                / WaitForChild5:GetAttribute("BaseSpeed")
                                                            or 12)
                                                    end
                                                    V540.RenderStepped:Wait()
                                                end
                                                P202.Priority = Priority
                                                LoadAnimation:Stop(0.15)
                                            end)
                                            TrackingConnection = F83()
                                            V534.Disconnectables[#V534.Disconnectables + 1] = TrackingConnection
                                            return
                                        end
                                    end
                                end)
                            end
                            TrackingConnection = F83()
                            V534.Disconnectables[#V534.Disconnectables + 1] = TrackingConnection
                            return
                        end
                    end
                end, function(P203) V528("error in animations tracker func:", tostring(P203)) end)
            end
            local CharacterAdded = V538.CharacterAdded
            V534.Disconnectables[#V534.Disconnectables + 1] = CharacterAdded:Connect(function(P204) uwubitch(P204) end)
            uwubitch(V538.Character)
        end
    end,
    J = function(P205)
        local V568 = P205[2]
        local V569 = P205[4]
        local V570 = P205[0]
        local V571 = P205[1]
        local V572 = P205[3]
        return function(P206, P207)
            xpcall(function()
                setthreadidentity(8)
                local MainKiller4 = V569.MainKiller
                local V573 = true
                if tostring(P207) ~= "Guest1337" and not V570.Flags.AutoBlockVisualizerAlways.CurrentValue
                    or not V570.Flags.AutoBlockVisualizer.CurrentValue then
                    V573 = false
                end
                if V569.GameState ~= 1 then
                    V573 = false
                end
                if not MainKiller4 then
                    V573 = false
                end
                if V573 then
                    V571.Transparency = 0.8
                    V568.Transparency = 0.8
                else
                    V571.Transparency = 1
                    V568.Transparency = 1
                end
                if V570[V569] then
                    return P207(V569 .. " is a preset name")
                end
                writefile(V571(V569), V568:JSONEncode(g[w[8]]()))
                g[w[9]]:Refresh(g[w[10]]())
                P207("Saved " .. V569)
            end, function(P208) V572("error in auto-block hitbox:", tostring(P208)) end)
        end
    end,
    o = function(P209)
        local V574 = P209[2]
        local V575 = P209[3]
        local V576 = P209[1]
        local V577 = P209[0]
        local V578 = P209[4]
        return function()
            while V578() do
                if V576.Flags.AutoBackstab.CurrentValue then
                    local HumanoidRootPart19 = V577.Character and V577.Character:FindFirstChild("HumanoidRootPart")
                    local V579 = GetClosestKiller(15)
                    if V579 and V579:FindFirstChild("HumanoidRootPart") and HumanoidRootPart19
                        and HasAbilityReady("Dagger") then
                        if IsFacingBack(HumanoidRootPart19, V579.HumanoidRootPart) then
                            local V580 = tick()
                            StartAimbotting(V579, function()
                                V574:FireServerConnection("UseActorAbility", "REMOTE_EVENT", "Dagger")
                                ;(V577.Character and V577.Character:FindFirstChild("Humanoid")):MoveTo(V579.HumanoidRootPart.Position)
                                stareFunc(V579)
                                return tick() - V580 <= 2 and V577.Character and V577.Character.Parent == V575
                                    and not HasNotification("stabbed")
                            end)
                        end
                    end
                end
            end
        end
    end,
    z = function(P210)
        local V581 = P210[6]
        local V582 = P210[7]
        local V583 = P210[5]
        local V584 = P210[9]
        local V585 = P210[1]
        local V586 = P210[8]
        local V587 = P210[4]
        local V588 = P210[2]
        local V589 = P210[0]
        local V590 = P210[3]
        return function()
            local Enabled3 = not V589.Character or not V589.Character:FindFirstChild("Humanoid") or V585.GameState == 1
                or workspace.CurrentCamera.CameraSubject ~= V589.Character.Humanoid
            if V587[1][V587[3]] then
                for Key31, Value60 in pairs(V588) do
                    Value60.HealthBarOutline:Destroy()
                    Value60.PlayerFlagsFrame:Destroy()
                end
                for Key32, Value61 in pairs(V581) do
                    Value61.Highlight:Destroy()
                end
                for Key33, Value62 in pairs(V583) do
                    Value62.Circle:Destroy()
                end
                for Key34, Value63 in pairs(V586) do
                    Value63.Label:Destroy()
                end
                table.clear(V588)
                table.clear(V581)
                table.clear(V583)
                table.clear(V586)
                V584[1][V584[3]] = true
                return true
            end
            V582.Enabled = Enabled3
            V590.Enabled = Enabled3
        end
    end,
    v = function(P211)
        local V591 = P211[1]
        local V592 = P211[2]
        local V593 = P211[0]
        return function()
            if HasAbilityReady("FriedChicken") and V592.Character and V592.Character:FindFirstChild("Humanoid") then
                if V592.Character.Humanoid.Health <= V591.Flags.AutoChickenHealth.CurrentValue then
                    local V594 = GetClosestKiller(5000)
                    if not V591.Flags.AutoChickenFar.CurrentValue or not V594
                        or (V592.Character.HumanoidRootPart.Position - V594.HumanoidRootPart.Position).magnitude >= 100 then
                        V593:FireServerConnection("UseActorAbility", "REMOTE_EVENT", "FriedChicken")
                    end
                end
            end
        end
    end,
    P = function(P212)
        local V595 = P212[0]
        local V596 = P212[2]
        local V597 = P212[1]
        local V598 = P212[3]
        local V599 = P212[4]
        return function()
            while V598() and V597.Flags.AutoUseM1.CurrentValue do
                if HasAbilityReady(GetM1Name()) then
                    local CurrentValue19 = V597.Flags.AutoAutoM1Radius.CurrentValue and GetMaxM1Reach()
                        or V597.Flags.AutoM1Radius.CurrentValue
                    local Character6 = V595.Character
                        and (IsKiller() and GetClosestSurvivor(CurrentValue19)
                            or V595.Character.Name == "Shedletsky" and GetClosestKiller(CurrentValue19))
                    if Character6 and Character6:GetAttribute("Invincible") ~= 1
                        and Character6:FindFirstChild("HumanoidRootPart") and V595.Character
                        and V595.Character:FindFirstChild("HumanoidRootPart") and not V596:HasHitReg() then
                        if not V597.Flags.AutoM1FaceCheck.CurrentValue or V597.Flags.Mouse1Aimbot.CurrentValue
                            or IsFacing(Character6.HumanoidRootPart, V595.Character.HumanoidRootPart, 0.73) then
                            V599:FireServerConnection("UseActorAbility", "REMOTE_EVENT", GetM1Name())
                        end
                    end
                end
            end
        end
    end,
    p = function(P213)
        local V600 = P213[0]
        local V601 = P213[1]
        return function(P214, P215)
            local HumanoidRootPart20 = P215 and P215:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPart20 and V601.Flags.AutoPickCloseItems.CurrentValue then
                for Index26, Value64 in ipairs(V600.Items) do
                    if Value64:FindFirstChild("ItemRoot") and Value64.ItemRoot:FindFirstChild("ProximityPrompt") then
                        if (Value64.ItemRoot.Position - HumanoidRootPart20.Position).Magnitude
                            <= Value64.ItemRoot.ProximityPrompt.MaxActivationDistance then
                            fireproximityprompt(Value64.ItemRoot.ProximityPrompt)
                        end
                    end
                end
            end
        end
    end,
    Q = function(P216)
        local V602 = P216[1]
        local V603 = P216[2]
        local V604 = P216[3]
        local V605 = P216[0]
        return function()
            while V604(0.5) do
                V602:Set("Survivors: " .. #V603.Survivors)
                local MainKiller5 = V603.MainKiller
                if MainKiller5 then
                    V605:Set("Killer: @" .. MainKiller5:GetAttribute("Username") .. " [" .. MainKiller5.Name .. "]")
                else
                    V605:Set("Killer: None")
                end
            end
        end
    end,
    N = function(P217)
        local V606 = P217[1]
        local V607 = P217[0]
        return function(P218, P219)
            V606.SprintSpeed = P219 and P219:FindFirstChild("Skateboard") and P219.Skateboard.Transparency ~= 1 and 26
                or V607.Flags.SprintSpeed.CurrentValue
        end
    end,
    c = function(P220)
        local V608 = P220[1]
        local V609 = P220[0]
        return function()
            if not V609:FindFirstChild("c00lkidd") then
                V608.UsingWalkspeedOverride = false
            end
        end
    end,
    H = function(P221)
        local V610 = P221[2]
        local V611 = P221[0]
        local V612 = P221[1]
        return function()
            local PrivacyBypass = false
            local V613 = {}
            local V614 = { "HideKillerWins", "HidePlaytime", "HideSurvivorWins" }
            local function F84(P222)
                if not V613[P222.UserId] then
                    V613[P222.UserId] = {}
                end
                for Index27, Value65 in ipairs(V614) do
                    local FindFirstChild3 = P222:WaitForChild("PlayerData"):WaitForChild("Settings"):WaitForChild("Privacy"):FindFirstChild(Value65)
                    V613[P222.UserId][Value65] = FindFirstChild3.Value
                end
            end
            local function F85(P223)
                for Index28, Value66 in ipairs(V614) do
                    local Privacy = P223:WaitForChild("PlayerData"):WaitForChild("Settings"):WaitForChild("Privacy")
                    Privacy:FindFirstChild(Value66).Value = false
                end
            end
            local function F86(P224)
                if V613[P224.UserId] then
                    for Key35, Value67 in pairs(V613[P224.UserId]) do
                        local Privacy2 = P224:WaitForChild("PlayerData"):WaitForChild("Settings"):WaitForChild("Privacy")
                        Privacy2:FindFirstChild(Key35).Value = Value67
                    end
                end
            end
            local function F87(P225)
                for Index29, Value68 in ipairs(V611:GetPlayers()) do
                    if P225 then
                        F84(Value68)
                        F85(Value68)
                    else
                        F86(Value68)
                    end
                end
            end
            local PlayerAdded = V611.PlayerAdded
            V612.Disconnectables[#V612.Disconnectables + 1] = PlayerAdded:Connect(function(P226)
                if PrivacyBypass == true then
                    F84(P226)
                    F85(P226)
                end
            end)
            V610:CreateToggle({
                Name = "Privacy bypass",
                CurrentValue = false,
                Flag = "PrivacyBypass",
                Callback = function(Value69)
                    PrivacyBypass = Value69
                    F87(Value69)
                end,
                ToolTip = "Let's you see players stats, even when they are hidden",
            })
        end
    end,
    g = function(P227)
        local V615 = P227[1]
        local V616 = P227[0]
        return function(P228, P229)
            local Humanoid3 = P229 and P229:FindFirstChild("HumanoidRootPart") and P229:FindFirstChild("Humanoid")
            if V615.GameState == 1 and Humanoid3 and P229.HumanoidRootPart.Velocity.Magnitude > 1 then
                P229:TranslateBy(Humanoid3.MoveDirection
                    * (V616.Flags.SpeedBoostPercent and V616.Flags.SpeedBoostPercent.CurrentValue / 10 or 7) * P228)
            end
        end
    end,
    D = function(P230)
        local V617 = P230[2]
        local V618 = P230[0]
        local V619 = P230[1]
        return function()
            while V617(0.1) do
                pcall(function()
                    if V619.Flags.WalkOverDF.CurrentValue then
                        for Key36, Value70 in pairs(V618.DoeDebris) do
                            if Value70:FindFirstChild("TouchInterest") then
                                Value70.TouchInterest:Destroy()
                            end
                        end
                    end
                end)
                pcall(function()
                    if V619.Flags.WalkOverTrail.CurrentValue then
                        for Key37, Value71 in pairs(V618.DoeTrailDebris) do
                            if Value71:FindFirstChild("TouchInterest") then
                                Value71.TouchInterest:Destroy()
                            end
                        end
                    end
                end)
                pcall(function()
                    if V619.Flags.WalkOverPuddles.CurrentValue then
                        for Key38, Value72 in pairs(V618.NosDebris) do
                            if Value72:FindFirstChild("TouchInterest") then
                                Value72.TouchInterest:Destroy()
                            end
                        end
                    end
                end)
            end
        end
    end,
    O = function(P231)
        local V620 = P231[1]
        local V621 = P231[0]
        return function()
            Ws_In_The_Chat_For_CursedHub_And_Vexsaken = [[
If you want to weaponize anthrax, you will have to extract it from soil.
            Collect a soil sample from a suitable location and avoid surface debris.
            Dissolve the soil sample in sterile distilled water and perform serial dilution.
            Prepare agar plates and select the appropriate media for the type of bacteria you want to isolate.
            Spread the highest dilution sample over the agar plate and incubate.
            Observe and count the microbial colonies that form on the agar plate and try to extract bacteriums that may be Bacillus anthracis bacterium.
            Additionally, to make it more lethal, perform serial infection in a model organism to select for whatever replicates best in vivo.]]
            local V622 = pcall(workspace.WaitForChild, workspace, Ws_In_The_Chat_For_CursedHub_And_Vexsaken, 0)
            local V623 = { [true] = 1 }
            if V623[V622] then
                pcall(function()
                    while true do
                        print("catsaken is better")
                    end
                end)
            end
            V620[1][V620[3]] = V623
            V621.bruhbruh = "holybrocatsakenissogoodilovecatsaken"
        end
    end,
}
