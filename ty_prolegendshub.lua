local TY = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
TY.Name = "TY_PROLEGENDS_HUB" TY.ResetOnSpawn = false

local _G = _G or {}
local rainbowObjs, main = {}

local function createBtn(txt, pos, color, fn)
    local b = Instance.new("TextButton", main)
    b.Size, b.Position, b.BackgroundColor3, b.BackgroundTransparency = UDim2.new(0, 140, 0, 30), pos, Color3.fromRGB(25,25,25), 0.2
    b.Font, b.Text, b.TextColor3, b.TextSize = Enum.Font.SourceSansBold, txt, color, 13
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    local s = Instance.new("UIStroke", b) s.Thickness = 2 table.insert(rainbowObjs, s)
    b.MouseButton1Click:Connect(function() fn(b) end)
    return b
end

local function HopToVipServer(btn)
    btn.Text = "HOPPING..."
    task.spawn(function()
        local Http = game:GetService("HttpService")
        local Teleport = game:GetService("TeleportService")
        local placeId = game.PlaceId
        local cursor = ""
        
        for i = 1, 5 do
            local url = "https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100" .. (cursor ~= "" and "&cursor=" .. cursor or "")
            local success, result = pcall(function() return Http:JSONDecode(game:HttpGet(url)) end)
            
            if success and result and result.data then
                for _, s in ipairs(result.data) do
                    if s.id ~= game.JobId and s.playing < s.maxPlayers then
                        Teleport:TeleportToPlaceInstance(placeId, s.id, game.Players.LocalPlayer)
                        return
                    end
                end
                if result.nextPageCursor then cursor = result.nextPageCursor else break end
            end
            task.wait(0.2)
        end
        btn.Text = "KHÔNG TÌM THẤY!"
        task.wait(1.5)
        btn.Text = "SERVER VIP (1 MÌNH)"
    end)
end

if not TY:FindFirstChild("MainFrame") then
    main = Instance.new("ImageLabel", TY)
    main.Name, main.Size, main.Position = "MainFrame", UDim2.new(0, 160, 0, 405), UDim2.new(0.1, 0, 0.4, 0)
    main.BackgroundColor3, main.Image, main.Active, main.Draggable = Color3.fromRGB(0,0,0), "rbxassetid://72301572453207", true, true
    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)
    table.insert(rainbowObjs, Instance.new("UIStroke", main))

    local title = Instance.new("TextLabel", main)
    title.Size, title.Position, title.BackgroundTransparency, title.Text, title.Font, title.TextSize = UDim2.new(0, 140, 0, 20), UDim2.new(0, 10, 0, 5), 1, "TY_PROLEGENDS HUB", Enum.Font.SourceSansBold, 14
    table.insert(rainbowObjs, title)

    createBtn("RESET CHARACTER", UDim2.new(0,10,0,30), Color3.fromRGB(255,255,255), function() local h = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") if h then h.Health = 0 end end)
    
    local toggles = {
        {"SkipEButton", "SKIP E", 65, "InstantSkipE"},
        {"NoclipButton", "NOCLIP", 100, "Noclip"},
        {"InfJumpButton", "INF JUMP", 135, "InfJump"},
        {"ChatTpButton", "CHAT TP", 170, "ChatTP"},
        {"AutoEButton", "AUTO CLICK E", 205, "AutoClickE"},
        {"EspButton", "ESP", 240, "ESP"}
    }

    for _, v in ipairs(toggles) do
        _G[v[4]] = _G[v[4]] or false
        createBtn(v[2] .. ": " .. (_G[v[4]] and "ON" or "OFF"), UDim2.new(0, 10, 0, v[3]), _G[v[4]] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0), function(btn)
            _G[v[4]] = not _G[v[4]]
            btn.Text = v[2] .. ": " .. (_G[v[4]] and "ON" or "OFF")
            btn.TextColor3 = _G[v[4]] and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)
        end)
    end

    createBtn("SERVER VIP (1 MÌNH)", UDim2.new(0, 10, 0, 275), Color3.fromRGB(255,255,255), HopToVipServer).TextSize = 12

    local sl = Instance.new("TextLabel", main)
    sl.Size, sl.Position, sl.BackgroundTransparency, sl.Text, sl.Font, sl.TextSize = UDim2.new(0, 140, 0, 20), UDim2.new(0, 10, 0, 315), 1, "SPEED: " .. math.floor(_G.WalkSpeedValue or 16), Enum.Font.SourceSansBold, 13
    table.insert(rainbowObjs, sl)

    local sf = Instance.new("Frame", main)
    sf.Size, sf.Position, sf.BackgroundColor3, sf.BackgroundTransparency = UDim2.new(0, 130, 0, 8), UDim2.new(0, 15, 0, 345), Color3.fromRGB(40,40,40), 0.3
    Instance.new("UICorner", sf).CornerRadius = UDim.new(0, 4)
    table.insert(rainbowObjs, Instance.new("UIStroke", sf))

    local sb = Instance.new("TextButton", sf)
    sb.Size, sb.Position, sb.BackgroundColor3, sb.Text = UDim2.new(0, 12, 0, 12), UDim2.new(math.clamp(((_G.WalkSpeedValue or 16) - 16)/184, 0, 1), -6, 0.5, -6), Color3.fromRGB(255,255,255), ""
    Instance.new("UICorner", sb).CornerRadius = UDim.new(1, 0)

    local drag = false
    sb.InputBegan:Connect(function(i) if i.UserInputType.Name:find("Mouse") or i.UserInputType.Name:find("Touch") then drag = true end end)
    game:GetService("UserInputService").InputEnded:Connect(function(i) if i.UserInputType.Name:find("Mouse") or i.UserInputType.Name:find("Touch") then drag = false end end)
    game:GetService("UserInputService").InputChanged:Connect(function(i)
        if drag and (i.UserInputType.Name:find("Mouse") or i.UserInputType.Name:find("Touch")) then
            local p = math.clamp((i.Position.X - sf.AbsolutePosition.X) / sf.AbsoluteSize.X, 0, 1)
            sb.Position = UDim2.new(p, -6, 0.5, -6)
            _G.WalkSpeedValue = 16 + (p * 184) sl.Text = "SPEED: " .. math.floor(_G.WalkSpeedValue)
        end
    end)
end

-- Vòng lặp chính xử lý tính năng (Speed, Skip E, Noclip, Auto E, ESP)
task.spawn(function()
    while task.wait(0.05) do
        local lp = game.Players.LocalPlayer
        if lp.Character then
            if lp.Character:FindFirstChild("Humanoid") then lp.Character.Humanoid.WalkSpeed = _G.WalkSpeedValue or 16 end
            if _G.Noclip then for _, v in pairs(lp.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        end
        if _G.InstantSkipE then for _, v in pairs(workspace:GetDescendants()) do if v:IsA("ProximityPrompt") and v.HoldDuration > 0 then v.HoldDuration = 0 end end end
        if _G.AutoClickE and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.Enabled and v.Parent:IsA("BasePart") and (lp.Character.HumanoidRootPart.Position - v.Parent.Position).Magnitude <= v.MaxActivationDistance then
                    fireproximityprompt(v)
                end
            end
        end
        if _G.ESP then
            for _, p in pairs(game.Players:GetPlayers()) do
                if p ~= lp and p.Character and p.Character:FindFirstChild("Head") then
                    local h = p.Character.Head local e = h:FindFirstChild("TY_ESP") or Instance.new("BillboardGui", h)
                    if e.Name ~= "TY_ESP" then
                        e.Name, e.Size, e.StudsOffset, e.AlwaysOnTop = "TY_ESP", UDim2.new(0, 100, 0, 40), Vector3.new(0, 2, 0), true
                        local l = Instance.new("TextLabel", e) l.Name, l.Size, l.BackgroundTransparency, l.Font, l.TextSize = "EspLabel", UDim2.new(1,0,1,0), 1, Enum.Font.SourceSansBold, 14
                    end
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hum then e.EspLabel.Text = p.Name .. "\nHP: " .. math.floor(hum.Health) end
                end
            end
        else
            for _, p in pairs(game.Players:GetPlayers()) do pcall(function() p.Character.Head.TY_ESP:Destroy() end) end
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJump and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if _G.ChatTP and msg:sub(1,4):lower() == "/tp " then
        local target = msg:sub(5):lower()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Name:lower():find(target) and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame break
            end
        end
    end
end)

local imgBtn = Instance.new("ImageButton", TY)
imgBtn.Size, imgBtn.Position, imgBtn.BackgroundColor3, imgBtn.Image, imgBtn.Draggable = UDim2.new(0,40,0,40), UDim2.new(0.106,0,0.162,0), Color3.fromRGB(0,0,0), "http://www.roblox.com/asset/?id=88859690240621", true
Instance.new("UICorner", imgBtn).CornerRadius = UDim.new(0, 6)
table.insert(rainbowObjs, Instance.new("UIStroke", imgBtn))
imgBtn.MouseButton1Click:Connect(function() main.Visible = not main.Visible end)

local count = 0
task.spawn(function()
    while task.wait(0.02) do
        count = count + 1 local col = Color3.fromHSV((count % 120) / 120, 1, 1)
        for _, obj in pairs(rainbowObjs) do
            if obj:IsA("UIStroke") then obj.Color = col elseif obj:IsA("TextLabel") then obj.TextColor3 = col end
        end
        if _G.ESP then
            for _, p in pairs(game.Players:GetPlayers()) do pcall(function() p.Character.Head.TY_ESP.EspLabel.TextColor3 = col end) end
        end
    end
end)
