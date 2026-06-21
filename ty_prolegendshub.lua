local TY_PROLEGENDS = Instance.new("ScreenGui")
TY_PROLEGENDS.Name = "TY_PROLEGENDS_HUB"
TY_PROLEGENDS.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TY_PROLEGENDS.ResetOnSpawn = false

local MainFrame, ResetButton, SkipEButton, UIStroke1, UIStroke2, FrameStroke
local SliderFrame, SliderButton, SliderLabel, SliderStroke
local TitleLabel, NoclipButton, UIStroke3, InfJumpButton, UIStroke4
local ChatTpButton, UIStroke5
local AutoEButton, UIStroke6 -- Thêm biến cho nút Auto E mới

local _G = _G or {}
_G.InstantSkipE = _G.InstantSkipE or false
_G.WalkSpeedValue = _G.WalkSpeedValue or 16
_G.Noclip = _G.Noclip or false
_G.InfJump = _G.InfJump or false
_G.ChatTP = _G.ChatTP or false
_G.AutoClickE = _G.AutoClickE or false -- Thêm biến trạng thái Auto Click E

local function BuildGUI()
    if not TY_PROLEGENDS:FindFirstChild("MainFrame") then
        MainFrame = Instance.new("ImageLabel")
        MainFrame.Name = "MainFrame"
        MainFrame.Parent = TY_PROLEGENDS
        MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        MainFrame.Image = "rbxassetid://72301572453207"
        MainFrame.ScaleType = Enum.ScaleType.Stretch
        MainFrame.ImageTransparency = 0 
        MainFrame.Position = UDim2.new(0.1, 0, 0.4, 0)
        -- Tăng nhẹ chiều cao Frame từ 300 lên 335 để vừa khít nút Auto E mới
        MainFrame.Size = UDim2.new(0, 160, 0, 335)
        MainFrame.Active = true
        MainFrame.Draggable = true

        local FrameCorner = Instance.new("UICorner")  
        FrameCorner.CornerRadius = UDim.new(0, 10)  
        FrameCorner.Parent = MainFrame  

        FrameStroke = Instance.new("UIStroke")  
        FrameStroke.Thickness = 3  
        FrameStroke.Parent = MainFrame  

        TitleLabel = Instance.new("TextLabel")
        TitleLabel.Name = "TitleLabel"
        TitleLabel.Parent = MainFrame
        TitleLabel.BackgroundTransparency = 1
        TitleLabel.Position = UDim2.new(0, 10, 0, 5)
        TitleLabel.Size = UDim2.new(0, 140, 0, 20)
        TitleLabel.Font = Enum.Font.SourceSansBold
        TitleLabel.Text = "TY_PROLEGENDS HUB"
        TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TitleLabel.TextSize = 14

        ResetButton = Instance.new("TextButton")  
        ResetButton.Name = "ResetButton"  
        ResetButton.Parent = MainFrame  
        ResetButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  
        ResetButton.BackgroundTransparency = 0.2
        ResetButton.Position = UDim2.new(0, 10, 0, 30)  
        ResetButton.Size = UDim2.new(0, 140, 0, 30) 
        ResetButton.Font = Enum.Font.SourceSansBold  
        ResetButton.Text = "RESET CHARACTER"  
        ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)  
        ResetButton.TextSize = 13  

        local UICorner1 = Instance.new("UICorner")  
        UICorner1.CornerRadius = UDim.new(0, 6)  
        UICorner1.Parent = ResetButton  

        UIStroke1 = Instance.new("UIStroke")  
        UIStroke1.Thickness = 2  
        UIStroke1.Parent = ResetButton  

        ResetButton.MouseButton1Click:Connect(function()  
            local player = game.Players.LocalPlayer  
            if player.Character and player.Character:FindFirstChild("Humanoid") then  
                player.Character.Humanoid.Health = 0  
            end  
        end)  

        SkipEButton = Instance.new("TextButton")  
        SkipEButton.Name = "SkipEButton"  
        SkipEButton.Parent = MainFrame  
        SkipEButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  
        SkipEButton.BackgroundTransparency = 0.2
        SkipEButton.Position = UDim2.new(0, 10, 0, 65)  
        SkipEButton.Size = UDim2.new(0, 140, 0, 30)  
        SkipEButton.Font = Enum.Font.SourceSansBold  
        SkipEButton.Text = _G.InstantSkipE and "SKIP E: ON" or "SKIP E: OFF"  
        SkipEButton.TextColor3 = _G.InstantSkipE and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)  
        SkipEButton.TextSize = 13  

        local UICorner2 = Instance.new("UICorner")  
        UICorner2.CornerRadius = UDim.new(0, 6)  
        UICorner2.Parent = SkipEButton  

        UIStroke2 = Instance.new("UIStroke")  
        UIStroke2.Thickness = 2  
        UIStroke2.Parent = SkipEButton  

        SkipEButton.MouseButton1Click:Connect(function()  
            _G.InstantSkipE = not _G.InstantSkipE  
            if _G.InstantSkipE then  
                SkipEButton.Text = "SKIP E: ON"  
                SkipEButton.TextColor3 = Color3.fromRGB(0, 255, 0)  
            else  
                SkipEButton.Text = "SKIP E: OFF"  
                SkipEButton.TextColor3 = Color3.fromRGB(255, 0, 0)  
            end  
        end)  

        NoclipButton = Instance.new("TextButton")
        NoclipButton.Name = "NoclipButton"
        NoclipButton.Parent = MainFrame
        NoclipButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        NoclipButton.BackgroundTransparency = 0.2
        NoclipButton.Position = UDim2.new(0, 10, 0, 100)
        NoclipButton.Size = UDim2.new(0, 140, 0, 30)
        NoclipButton.Font = Enum.Font.SourceSansBold
        NoclipButton.Text = _G.Noclip and "NOCLIP: ON" or "NOCLIP: OFF"
        NoclipButton.TextColor3 = _G.Noclip and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        NoclipButton.TextSize = 13

        local UICornerNoclip = Instance.new("UICorner")
        UICornerNoclip.CornerRadius = UDim.new(0, 6)
        UICornerNoclip.Parent = NoclipButton

        UIStroke3 = Instance.new("UIStroke")
        UIStroke3.Thickness = 2
        UIStroke3.Parent = NoclipButton

        NoclipButton.MouseButton1Click:Connect(function()
            _G.Noclip = not _G.Noclip
            if _G.Noclip then
                NoclipButton.Text = "NOCLIP: ON"
                NoclipButton.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                NoclipButton.Text = "NOCLIP: OFF"
                NoclipButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        InfJumpButton = Instance.new("TextButton")
        InfJumpButton.Name = "InfJumpButton"
        InfJumpButton.Parent = MainFrame
        InfJumpButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        InfJumpButton.BackgroundTransparency = 0.2
        InfJumpButton.Position = UDim2.new(0, 10, 0, 135)
        InfJumpButton.Size = UDim2.new(0, 140, 0, 30)
        InfJumpButton.Font = Enum.Font.SourceSansBold
        InfJumpButton.Text = _G.InfJump and "INF JUMP: ON" or "INF JUMP: OFF"
        InfJumpButton.TextColor3 = _G.InfJump and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        InfJumpButton.TextSize = 13

        local UICornerInf = Instance.new("UICorner")
        UICornerInf.CornerRadius = UDim.new(0, 6)
        UICornerInf.Parent = InfJumpButton

        UIStroke4 = Instance.new("UIStroke")
        UIStroke4.Thickness = 2
        UIStroke4.Parent = InfJumpButton

        InfJumpButton.MouseButton1Click:Connect(function()
            _G.InfJump = not _G.InfJump
            if _G.InfJump then
                InfJumpButton.Text = "INF JUMP: ON"
                InfJumpButton.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                InfJumpButton.Text = "INF JUMP: OFF"
                InfJumpButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        ChatTpButton = Instance.new("TextButton")
        ChatTpButton.Name = "ChatTpButton"
        ChatTpButton.Parent = MainFrame
        ChatTpButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        ChatTpButton.BackgroundTransparency = 0.2
        ChatTpButton.Position = UDim2.new(0, 10, 0, 170)
        ChatTpButton.Size = UDim2.new(0, 140, 0, 30)
        ChatTpButton.Font = Enum.Font.SourceSansBold
        ChatTpButton.Text = _G.ChatTP and "CHAT TP: ON" or "CHAT TP: OFF"
        ChatTpButton.TextColor3 = _G.ChatTP and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        ChatTpButton.TextSize = 13

        local UICornerChat = Instance.new("UICorner")
        UICornerChat.CornerRadius = UDim.new(0, 6)
        UICornerChat.Parent = ChatTpButton

        UIStroke5 = Instance.new("UIStroke")
        UIStroke5.Thickness = 2
        UIStroke5.Parent = ChatTpButton

        ChatTpButton.MouseButton1Click:Connect(function()
            _G.ChatTP = not _G.ChatTP
            if _G.ChatTP then
                ChatTpButton.Text = "CHAT TP: ON"
                ChatTpButton.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                ChatTpButton.Text = "CHAT TP: OFF"
                ChatTpButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        -- [THÊM MỚI] Nút chức năng Auto Click E
        AutoEButton = Instance.new("TextButton")
        AutoEButton.Name = "AutoEButton"
        AutoEButton.Parent = MainFrame
        AutoEButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        AutoEButton.BackgroundTransparency = 0.2
        AutoEButton.Position = UDim2.new(0, 10, 0, 205)
        AutoEButton.Size = UDim2.new(0, 140, 0, 30)
        AutoEButton.Font = Enum.Font.SourceSansBold
        AutoEButton.Text = _G.AutoClickE and "AUTO CLICK E: ON" or "AUTO CLICK E: OFF"
        AutoEButton.TextColor3 = _G.AutoClickE and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        AutoEButton.TextSize = 13

        local UICornerAutoE = Instance.new("UICorner")
        UICornerAutoE.CornerRadius = UDim.new(0, 6)
        UICornerAutoE.Parent = AutoEButton

        UIStroke6 = Instance.new("UIStroke")
        UIStroke6.Thickness = 2
        UIStroke6.Parent = AutoEButton

        AutoEButton.MouseButton1Click:Connect(function()
            _G.AutoClickE = not _G.AutoClickE
            if _G.AutoClickE then
                AutoEButton.Text = "AUTO CLICK E: ON"
                AutoEButton.TextColor3 = Color3.fromRGB(0, 255, 0)
            else
                AutoEButton.Text = "AUTO CLICK E: OFF"
                AutoEButton.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)

        -- Dịch chuyển Slider xuống dưới nút Auto E một chút
        SliderLabel = Instance.new("TextLabel")  
        SliderLabel.Name = "SliderLabel"  
        SliderLabel.Parent = MainFrame  
        SliderLabel.BackgroundTransparency = 1  
        SliderLabel.Position = UDim2.new(0, 10, 0, 245)  
        SliderLabel.Size = UDim2.new(0, 140, 0, 20)  
        SliderLabel.Font = Enum.Font.SourceSansBold  
        SliderLabel.Text = "SPEED: " .. math.floor(_G.WalkSpeedValue)  
        SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
        SliderLabel.TextSize = 13  

        SliderFrame = Instance.new("Frame")  
        SliderFrame.Name = "SliderFrame"  
        SliderFrame.Parent = MainFrame  
        SliderFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  
        SliderFrame.BackgroundTransparency = 0.3
        SliderFrame.Position = UDim2.new(0, 15, 0, 275)  
        SliderFrame.Size = UDim2.new(0, 130, 0, 8)  

        local SliderCorner = Instance.new("UICorner")  
        SliderCorner.CornerRadius = UDim.new(0, 4)  
        SliderCorner.Parent = SliderFrame  

        SliderStroke = Instance.new("UIStroke")  
        SliderStroke.Thickness = 1.5  
        SliderStroke.Parent = SliderFrame  

        SliderButton = Instance.new("TextButton")  
        SliderButton.Name = "SliderButton"  
        SliderButton.Parent = SliderFrame  
        SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  
        -- [CẬP NHẬT] Tính toán phần trăm dựa trên giới hạn mới là 200
        local initialPercent = (_G.WalkSpeedValue - 16) / (200 - 16)  
        SliderButton.Position = UDim2.new(math.clamp(initialPercent, 0, 1), -6, 0.5, -6)  
        SliderButton.Size = UDim2.new(0, 12, 0, 12)  
        SliderButton.Text = ""  

        local ButtonCorner = Instance.new("UICorner")  
        ButtonCorner.CornerRadius = UDim.new(1, 0)  
        ButtonCorner.Parent = SliderButton  

        local UserInputService = game:GetService("UserInputService")  
        local dragging = false  

        SliderButton.InputBegan:Connect(function(input)  
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
                dragging = true  
            end  
        end)  

        UserInputService.InputChanged:Connect(function(input)  
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then  
                local relativeX = input.Position.X - SliderFrame.AbsolutePosition.X  
                local percent = math.clamp(relativeX / SliderFrame.AbsoluteSize.X, 0, 1)  
                SliderButton.Position = UDim2.new(percent, -6, 0.5, -6)  
                  
                -- [CẬP NHẬT] Đổi công thức tính từ 100 thành tối đa 200 speed
                _G.WalkSpeedValue = 16 + (percent * (200 - 16))  
                SliderLabel.Text = "SPEED: " .. math.floor(_G.WalkSpeedValue)  
            end  
        end)  

        UserInputService.InputEnded:Connect(function(input)  
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then  
                dragging = false  
            end  
        end)  
    end
end

BuildGUI()

task.spawn(function()
    while true do
        task.wait(0.1)
        local player = game.Players.LocalPlayer
        
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = _G.WalkSpeedValue
        end

        if _G.InstantSkipE then  
            for _, prompt in pairs(workspace:GetDescendants()) do  
                if prompt:IsA("ProximityPrompt") then  
                    if prompt.HoldDuration > 0 then  
                        prompt.HoldDuration = 0  
                    end  
                end  
            end  
        end

        if _G.Noclip and player.Character then
            for _, v in pairs(player.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- [THÊM MỚI] Vòng lặp tối ưu chạy song song xử lý giật Auto Click E cực nhanh
task.spawn(function()
    while true do
        task.wait(0.01) -- Chạy với tốc độ tối đa của game (nhanh hơn auto click thường rất nhiều)
        if _G.AutoClickE then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local myPos = player.Character.HumanoidRootPart.Position
                for _, prompt in pairs(workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") and prompt.Enabled then
                        -- Kiểm tra khoảng cách để không bị kích hoạt lỗi từ xa
                        local parent = prompt.Parent
                        if parent and parent:IsA("BasePart") then
                            local dist = (myPos - parent.Position).Magnitude
                            if dist <= prompt.MaxActivationDistance then
                                -- Kích hoạt trực tiếp sự kiện nhấn E của prompt đó
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                end
            end
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJump then
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end
end)

game.Players.LocalPlayer.Chatted:Connect(function(msg)
    if _G.ChatTP and string.sub(string.lower(msg), 1, 4) == "/tp " then
        local targetName = string.sub(msg, 5)
        local localPlayer = game.Players.LocalPlayer
        
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= localPlayer and string.find(string.lower(p.Name), string.lower(targetName)) then
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                        localPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
                        break
                    end
                end
            end
        end
    end
end)

local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ImageButton.Parent = TY_PROLEGENDS
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=88859690240621" 

UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = ImageButton

local ImageButtonStroke = Instance.new("UIStroke")
ImageButtonStroke.Thickness = 2
ImageButtonStroke.Parent = ImageButton

ImageButton.MouseButton1Click:Connect(function()
    if MainFrame then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

local runCount = 0
coroutine.wrap(function()
    while true do
        task.wait(0.02)

        if not game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("TY_PROLEGENDS_HUB") then  
            TY_PROLEGENDS.Parent = game.Players.LocalPlayer.PlayerGui  
        end  
        BuildGUI()  
          
        runCount = runCount + 1  
        local hue = (runCount % 120) / 120  
        local rainbowColor = Color3.fromHSV(hue, 1, 1)  
          
        if FrameStroke then FrameStroke.Color = rainbowColor end  
        if UIStroke1 then UIStroke1.Color = rainbowColor end  
        if UIStroke2 then UIStroke2.Color = rainbowColor end  
        if UIStroke3 then UIStroke3.Color = rainbowColor end 
        if UIStroke4 then UIStroke4.Color = rainbowColor end 
        if UIStroke5 then UIStroke5.Color = rainbowColor end 
        if UIStroke6 then UIStroke6.Color = rainbowColor end -- Đồng bộ màu cầu vồng cho nút Auto E mới
        if SliderStroke then SliderStroke.Color = rainbowColor end  
        if SliderLabel then SliderLabel.TextColor3 = rainbowColor end  
        if TitleLabel then TitleLabel.TextColor3 = rainbowColor end   
        if ImageButtonStroke then ImageButtonStroke.Color = rainbowColor end 
    end
end)()
