--[[
    PRACTICE7 HUB - VERSÃO ORIGINAL
    Aimbot Original | ESP Original (Vermelho/Azul) | Voo no Shift Direito
    Velocidade do Voo: 300 | Interface Azul Gradiente
--]]

-- ============================================
-- SISTEMA DE KEY (VERSÃO OFFLINE)
-- ============================================

-- Lista de keys válidas
local ValidKeys = {
    ["PRACTICE7-FREE-TRIAL"] = {user = "Demonstração", expires = "2025-12-31"},
    ["NATHAN-2024-001"] = {user = "Nathan", expires = "2026-12-31"},
    ["COMPRADOR1-2024"] = {user = "João", expires = "2025-06-30"}
}

local PlayerKey = game:GetService("Players").LocalPlayer

local function CheckKey(key)
    local keyData = ValidKeys[key]
    if not keyData then
        return false, "Key inválida!"
    end
    local currentDate = os.date("%Y-%m-%d")
    if currentDate > keyData.expires then
        return false, "Key expirou em " .. keyData.expires
    end
    return true, "Bem-vindo, " .. keyData.user
end

-- Criar tela de key
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "Practice7_KeySystem"
KeyGui.Parent = PlayerKey:WaitForChild("PlayerGui")
KeyGui.ResetOnSpawn = false

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.8
Background.Parent = KeyGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 400, 0, 300)
KeyFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
KeyFrame.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
KeyFrame.BorderSizePixel = 2
KeyFrame.BorderColor3 = Color3.fromRGB(0, 100, 255)
KeyFrame.Parent = KeyGui

local KeyFrameCorner = Instance.new("UICorner")
KeyFrameCorner.CornerRadius = UDim.new(0, 15)
KeyFrameCorner.Parent = KeyFrame

local TitleGradient = Instance.new("UIGradient")
TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 100, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
}
TitleGradient.Parent = KeyFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "PRACTICE7 CHEAT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 28
Title.Parent = KeyFrame

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 0, 70)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "INSIRA SUA KEY PARA ACESSAR"
Subtitle.TextColor3 = Color3.fromRGB(150, 200, 255)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 14
Subtitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0, 120)
KeyInput.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Cole sua key aqui"
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 150, 200)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 45)
VerifyBtn.Position = UDim2.new(0.1, 0, 0, 180)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 18
VerifyBtn.Parent = KeyFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = VerifyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 30)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 240)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Aguardando key..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.Parent = KeyFrame

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, 0, 0, 25)
InfoLabel.Position = UDim2.new(0, 0, 0, 270)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Text = "💎 Compre sua key com Nathan"
InfoLabel.TextColor3 = Color3.fromRGB(100, 150, 200)
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.TextSize = 11
InfoLabel.Parent = KeyFrame

VerifyBtn.MouseEnter:Connect(function()
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
end)

VerifyBtn.MouseLeave:Connect(function()
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 200)
end)

-- ============================================
-- FUNÇÃO PRINCIPAL DO CHEAT
-- ============================================
local function LoadCheat()
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local Mouse = Player:GetMouse()
    local Camera = workspace.CurrentCamera

    repeat task.wait() until Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

    -- Configurações
    local Settings = {
        Aimbot = false,
        Fly = false,
        ESP = false,
        Speed = false,
        AntiAfk = false,
        FlySpeed = 300,
        WalkSpeed = 55,
        AimbotKey = Enum.KeyCode.K,
        FlyKey = Enum.KeyCode.RightShift,
        SpeedKey = Enum.KeyCode.V,
        ESPKey = Enum.KeyCode.J,
        MenuKey = Enum.KeyCode.RightControl,
        MenuVisible = true,
        AimbotFOV = 800,
        AimbotPrediction = 0.1,
        TargetPart = "Head",
        ESPTextSize = 14,
        ESPWidth = 180,
        ESPHeight = 60
    }

    -- Criar GUI com gradiente azul
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Practice7_Perfect"
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 450)
    MainFrame.Position = UDim2.new(0.5, -160, 0.5, -225)
    MainFrame.BackgroundColor3 = Color3.fromRGB(0, 20, 40)
    MainFrame.BackgroundTransparency = 0.05
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local MainGradient = Instance.new("UIGradient")
    MainGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 40, 80)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 80, 160))
    }
    MainGradient.Parent = MainFrame

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 15)
    UICorner.Parent = MainFrame

    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 0, 1, 0)
    Border.BackgroundTransparency = 1
    Border.BorderSizePixel = 2
    Border.BorderColor3 = Color3.fromRGB(0, 150, 255)
    Border.Parent = MainFrame
    
    local BorderCorner = Instance.new("UICorner")
    BorderCorner.CornerRadius = UDim.new(0, 15)
    BorderCorner.Parent = Border

    local TitleFrame = Instance.new("Frame")
    TitleFrame.Size = UDim2.new(1, 0, 0, 50)
    TitleFrame.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Parent = MainFrame

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 15)
    TitleCorner.Parent = TitleFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "PRACTICE7"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 24
    Title.Parent = TitleFrame

    task.spawn(function()
        while ScreenGui and ScreenGui.Parent do
            for hue = 0, 1, 0.02 do
                if not ScreenGui.Parent then break end
                Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
                task.wait(0.03)
            end
        end
    end)

    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1, -20, 1, -70)
    Container.Position = UDim2.new(0, 10, 0, 60)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 6
    Container.ScrollBarImageColor3 = Color3.fromRGB(0, 150, 255)
    Container.CanvasSize = UDim2.new(0, 0, 0, 600)
    Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Container.Parent = MainFrame

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 8)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = Container

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Container.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
    end)

    -- Função para criar seções
    function CreateSection(title, icon)
        local Section = Instance.new("Frame")
        Section.Size = UDim2.new(0.95, 0, 0, 30)
        Section.BackgroundTransparency = 1
        Section.Parent = Container
        
        local SectionIcon = Instance.new("TextLabel")
        SectionIcon.Size = UDim2.new(0, 25, 0, 25)
        SectionIcon.Position = UDim2.new(0, 5, 0.5, -12.5)
        SectionIcon.BackgroundTransparency = 1
        SectionIcon.Text = icon
        SectionIcon.TextColor3 = Color3.fromRGB(0, 150, 255)
        SectionIcon.Font = Enum.Font.GothamBold
        SectionIcon.TextSize = 20
        SectionIcon.Parent = Section
        
        local SectionTitle = Instance.new("TextLabel")
        SectionTitle.Size = UDim2.new(1, -35, 1, 0)
        SectionTitle.Position = UDim2.new(0, 35, 0, 0)
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Text = title
        SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.Font = Enum.Font.GothamBold
        SectionTitle.TextSize = 16
        SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        SectionTitle.Parent = Section
        
        local SectionLine = Instance.new("Frame")
        SectionLine.Size = UDim2.new(1, -35, 0, 1)
        SectionLine.Position = UDim2.new(0, 35, 1, -1)
        SectionLine.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
        SectionLine.BackgroundTransparency = 0.5
        SectionLine.BorderSizePixel = 0
        SectionLine.Parent = Section
    end

    -- Função para criar botões toggle
    function CreateToggle(text, description, defaultState, callback)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.95, 0, 0, 50)
        Button.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
        Button.BorderSizePixel = 0
        Button.Parent = Container
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Button
        
        local PowerIndicator = Instance.new("Frame")
        PowerIndicator.Size = UDim2.new(0, 16, 0, 16)
        PowerIndicator.Position = UDim2.new(0.95, -25, 0.5, -8)
        PowerIndicator.BackgroundColor3 = defaultState and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        PowerIndicator.BorderSizePixel = 0
        PowerIndicator.Parent = Button
        
        local PowerCorner = Instance.new("UICorner")
        PowerCorner.CornerRadius = UDim.new(1, 0)
        PowerCorner.Parent = PowerIndicator
        
        local BtnTitle = Instance.new("TextLabel")
        BtnTitle.Size = UDim2.new(1, -50, 0, 25)
        BtnTitle.Position = UDim2.new(0, 10, 0, 5)
        BtnTitle.BackgroundTransparency = 1
        BtnTitle.Text = text
        BtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        BtnTitle.Font = Enum.Font.GothamBold
        BtnTitle.TextSize = 16
        BtnTitle.TextXAlignment = Enum.TextXAlignment.Left
        BtnTitle.Parent = Button
        
        local BtnDesc = Instance.new("TextLabel")
        BtnDesc.Size = UDim2.new(1, -50, 0, 15)
        BtnDesc.Position = UDim2.new(0, 10, 0, 30)
        BtnDesc.BackgroundTransparency = 1
        BtnDesc.Text = description
        BtnDesc.TextColor3 = Color3.fromRGB(150, 200, 255)
        BtnDesc.Font = Enum.Font.Gotham
        BtnDesc.TextSize = 11
        BtnDesc.TextXAlignment = Enum.TextXAlignment.Left
        BtnDesc.Parent = Button
        
        local state = defaultState
        
        Button.MouseButton1Click:Connect(function()
            state = not state
            Button.BackgroundColor3 = state and Color3.fromRGB(0, 50, 100) or Color3.fromRGB(0, 30, 60)
            PowerIndicator.BackgroundColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            callback(state)
        end)
        
        return Button
    end

    -- Função para criar slider
    function CreateSlider(text, min, max, default, color, suffix, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.95, 0, 0, 60)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
        Frame.BorderSizePixel = 0
        Frame.Parent = Container
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 8)
        FrameCorner.Parent = Frame
        
        local SliderTitle = Instance.new("TextLabel")
        SliderTitle.Size = UDim2.new(1, -30, 0, 20)
        SliderTitle.Position = UDim2.new(0, 10, 0, 5)
        SliderTitle.BackgroundTransparency = 1
        SliderTitle.Text = text
        SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        SliderTitle.Font = Enum.Font.GothamBold
        SliderTitle.TextSize = 14
        SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
        SliderTitle.Parent = Frame
        
        local ValueLabel = Instance.new("TextLabel")
        ValueLabel.Size = UDim2.new(0, 60, 0, 20)
        ValueLabel.Position = UDim2.new(1, -70, 0, 5)
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Text = default .. suffix
        ValueLabel.TextColor3 = color
        ValueLabel.Font = Enum.Font.GothamBold
        ValueLabel.TextSize = 14
        ValueLabel.Parent = Frame
        
        local SliderBg = Instance.new("Frame")
        SliderBg.Size = UDim2.new(0.9, 0, 0, 6)
        SliderBg.Position = UDim2.new(0.05, 0, 0.7, 0)
        SliderBg.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
        SliderBg.BorderSizePixel = 0
        SliderBg.Parent = Frame
        
        local SliderBgCorner = Instance.new("UICorner")
        SliderBgCorner.CornerRadius = UDim.new(1, 0)
        SliderBgCorner.Parent = SliderBg
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = color
        SliderFill.BorderSizePixel = 0
        SliderFill.Parent = SliderBg
        
        local SliderFillCorner = Instance.new("UICorner")
        SliderFillCorner.CornerRadius = UDim.new(1, 0)
        SliderFillCorner.Parent = SliderFill
        
        local SliderButton = Instance.new("TextButton")
        SliderButton.Size = UDim2.new(1, 0, 1, 0)
        SliderButton.BackgroundTransparency = 1
        SliderButton.Parent = SliderBg
        
        local value = default
        
        SliderButton.MouseButton1Down:Connect(function()
            local connection
            connection = RunService.RenderStepped:Connect(function()
                local mousePos = UserInputService:GetMouseLocation()
                local absX = SliderBg.AbsolutePosition.X
                local absW = SliderBg.AbsoluteSize.X
                local percent = math.clamp((mousePos.X - absX) / absW, 0, 1)
                value = min + (max - min) * percent
                value = math.floor(value * 10) / 10
                ValueLabel.Text = value .. suffix
                SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                callback(value)
            end)
            
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    connection:Disconnect()
                end
            end)
        end)
    end

    -- Função para criar dropdown
    function CreateDropdown(text, options, default, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.95, 0, 0, 50)
        Frame.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
        Frame.BorderSizePixel = 0
        Frame.Parent = Container
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 8)
        FrameCorner.Parent = Frame
        
        local DropTitle = Instance.new("TextLabel")
        DropTitle.Size = UDim2.new(0.5, -10, 1, 0)
        DropTitle.Position = UDim2.new(0, 10, 0, 0)
        DropTitle.BackgroundTransparency = 1
        DropTitle.Text = text
        DropTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        DropTitle.Font = Enum.Font.GothamBold
        DropTitle.TextSize = 14
        DropTitle.TextXAlignment = Enum.TextXAlignment.Left
        DropTitle.Parent = Frame
        
        local Dropdown = Instance.new("TextButton")
        Dropdown.Size = UDim2.new(0.4, 0, 0.6, 0)
        Dropdown.Position = UDim2.new(0.55, 0, 0.2, 0)
        Dropdown.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
        Dropdown.BorderSizePixel = 0
        Dropdown.Text = default
        Dropdown.TextColor3 = Color3.fromRGB(0, 150, 255)
        Dropdown.Font = Enum.Font.GothamBold
        Dropdown.TextSize = 14
        Dropdown.Parent = Frame
        
        local DropdownCorner = Instance.new("UICorner")
        DropdownCorner.CornerRadius = UDim.new(0, 6)
        DropdownCorner.Parent = Dropdown
        
        local currentIndex = 1
        for i, option in ipairs(options) do
            if option == default then
                currentIndex = i
                break
            end
        end
        
        Dropdown.MouseButton1Click:Connect(function()
            currentIndex = currentIndex % #options + 1
            Dropdown.Text = options[currentIndex]
            callback(options[currentIndex])
        end)
    end

    -- Variáveis
    local ESPs = {}
    local FlyBV = nil
    local FlyBG = nil
    local AntiAfkConnection = nil

    -- FUNÇÃO DE ESP ORIGINAL (VERMELHO E AZUL)
    function CreateESP(player)
        if player == Player then return end
        
        local function CreateESPForChar()
            if not player.Character then return end
            
            local head = player.Character:FindFirstChild("Head")
            local humanoid = player.Character:FindFirstChild("Humanoid")
            
            if not head or not humanoid then return end
            
            if ESPs[player] then
                pcall(function() ESPs[player].Gui:Destroy() end)
            end
            
            local esp = Instance.new("BillboardGui")
            esp.Name = "ESP_" .. player.Name
            esp.Size = UDim2.new(0, Settings.ESPWidth, 0, Settings.ESPHeight)
            esp.StudsOffset = Vector3.new(0, 2, 0)
            esp.AlwaysOnTop = true
            esp.Enabled = Settings.ESP
            esp.Parent = head
            
            local bg = Instance.new("Frame")
            bg.Size = UDim2.new(1, 0, 1, 0)
            bg.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
            bg.BackgroundTransparency = 0.2
            bg.BorderSizePixel = 1
            bg.BorderColor3 = Color3.fromRGB(255, 0, 0)
            bg.Parent = esp
            
            local bgCorner = Instance.new("UICorner")
            bgCorner.CornerRadius = UDim.new(0, 4)
            bgCorner.Parent = bg
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.Position = UDim2.new(0, 0, 0, 2)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.TextSize = Settings.ESPTextSize
            nameLabel.Parent = bg
            
            local infoLabel = Instance.new("TextLabel")
            infoLabel.Size = UDim2.new(1, 0, 0.5, 0)
            infoLabel.Position = UDim2.new(0, 0, 0.5, -2)
            infoLabel.BackgroundTransparency = 1
            infoLabel.Text = "0m | ❤️ 100"
            infoLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
            infoLabel.Font = Enum.Font.Gotham
            infoLabel.TextSize = Settings.ESPTextSize - 2
            infoLabel.Parent = bg
            
            ESPs[player] = {
                Gui = esp,
                Head = head,
                Humanoid = humanoid,
                InfoLabel = infoLabel,
                NameLabel = nameLabel
            }
        end
        
        CreateESPForChar()
        
        player.CharacterAdded:Connect(function()
            task.wait(0.5)
            CreateESPForChar()
        end)
    end

    function RecreateAllESP()
        for player, esp in pairs(ESPs) do
            if esp and esp.Gui then
                pcall(function() esp.Gui:Destroy() end)
            end
        end
        ESPs = {}
        for _, player in pairs(Players:GetPlayers()) do
            CreateESP(player)
        end
    end

    -- FUNÇÃO DE AIMBOT ORIGINAL
    function UpdateAimbot()
        if not Settings.Aimbot or not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
        
        local closestTarget = nil
        local closestDist = Settings.AimbotFOV
        local mousePos = Vector2.new(Mouse.X, Mouse.Y)
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetPart = nil
                if Settings.TargetPart == "Head" then
                    targetPart = player.Character:FindFirstChild("Head")
                elseif Settings.TargetPart == "Torso" then
                    targetPart = player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso")
                else
                    targetPart = player.Character:FindFirstChild("HumanoidRootPart")
                end
                
                local humanoid = player.Character:FindFirstChild("Humanoid")
                
                if targetPart and humanoid and humanoid.Health > 0 then
                    local targetPos = targetPart.Position
                    
                    if Settings.AimbotPrediction > 0 then
                        local velocity = humanoid.MoveDirection * humanoid.WalkSpeed
                        targetPos = targetPos + (velocity * Settings.AimbotPrediction)
                    end
                    
                    local pos, onScreen = Camera:WorldToViewportPoint(targetPos)
                    
                    if onScreen then
                        local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                        
                        if dist < closestDist then
                            closestTarget = targetPos
                            closestDist = dist
                        end
                    end
                end
            end
        end
        
        if closestTarget then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget)
        end
    end

    -- FUNÇÃO DE VOO
    local function DisableFly()
        if FlyBV then
            FlyBV:Destroy()
            FlyBV = nil
        end
        if FlyBG then
            FlyBG:Destroy()
            FlyBG = nil
        end
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.PlatformStand = false
        end
    end

    function UpdateFly()
        if Settings.Fly and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local root = Player.Character.HumanoidRootPart
            local humanoid = Player.Character:FindFirstChild("Humanoid")
            local camera = workspace.CurrentCamera
            
            if humanoid then
                humanoid.PlatformStand = true
            end
            
            if not FlyBV or not FlyBV.Parent then
                FlyBV = Instance.new("BodyVelocity")
                FlyBV.Name = "FlyBV"
                FlyBV.MaxForce = Vector3.new(1, 1, 1) * 9e9
                FlyBV.P = 20000
                FlyBV.Parent = root
            end
            
            if not FlyBG or not FlyBG.Parent then
                FlyBG = Instance.new("BodyGyro")
                FlyBG.Name = "FlyBG"
                FlyBG.MaxTorque = Vector3.new(1, 1, 1) * 9e9
                FlyBG.P = 20000
                FlyBG.D = 1000
                FlyBG.Parent = root
            end
            
            FlyBG.CFrame = camera.CFrame
            
            local direction = Vector3.new()
            
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                direction = direction + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                direction = direction - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                direction = direction - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                direction = direction + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                direction = direction - Vector3.new(0, 1, 0)
            end
            
            if direction.Magnitude > 0 then
                direction = direction.Unit
                FlyBV.Velocity = direction * Settings.FlySpeed
            else
                FlyBV.Velocity = Vector3.new()
            end
            
        elseif FlyBV then
            DisableFly()
        end
    end

    -- CRIAR ESP PARA TODOS
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end

    Players.PlayerAdded:Connect(CreateESP)
    Players.PlayerRemoving:Connect(function(player)
        if ESPs[player] then
            pcall(function() ESPs[player].Gui:Destroy() end)
            ESPs[player] = nil
        end
    end)

    -- CRIAR BOTÕES DO MENU
    CreateSection("🎯 AIMBOT", "🎯")

    local AimbotBtn = CreateToggle("AIMBOT (TECLA K)", "Ativar mira automática (Botão Direito)", Settings.Aimbot, function(state)
        Settings.Aimbot = state
    end)

    CreateSlider("FOV", 100, 1200, Settings.AimbotFOV, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.AimbotFOV = value
    end)

    CreateSlider("PREVISÃO", 0, 0.5, Settings.AimbotPrediction, Color3.fromRGB(0, 200, 255), "", function(value)
        Settings.AimbotPrediction = value
    end)

    CreateDropdown("PARTE", {"Head", "Torso", "Root"}, Settings.TargetPart, function(part)
        Settings.TargetPart = part
    end)

    CreateSection("🚀 VOO", "🚀")

    local FlyBtn = CreateToggle("VOO (SHIFT DIREITO)", "Voe livremente (WASD + Espaço/Ctrl) - Velocidade 300", Settings.Fly, function(state)
        Settings.Fly = state
        if not state then
            DisableFly()
        end
    end)

    CreateSlider("VELOCIDADE DO VOO", 30, 500, Settings.FlySpeed, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.FlySpeed = value
    end)

    local SpeedBtn = CreateToggle("SUPER VELOCIDADE (TECLA V)", "Aumenta velocidade de movimento", Settings.Speed, function(state)
        Settings.Speed = state
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = state and Settings.WalkSpeed or 16
        end
    end)

    CreateSlider("WALK SPEED", 16, 150, Settings.WalkSpeed, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.WalkSpeed = value
        if Settings.Speed and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = value
        end
    end)

    CreateSection("👁️ ESP", "👁️")

    local ESPBtn = CreateToggle("ESP (TECLA J)", "Mostra jogadores através das paredes (Nome Vermelho | Info Azul)", Settings.ESP, function(state)
        Settings.ESP = state
        for _, esp in pairs(ESPs) do
            if esp and esp.Gui then
                esp.Gui.Enabled = state
            end
        end
    end)

    CreateSlider("TAMANHO TEXTO", 8, 24, Settings.ESPTextSize, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.ESPTextSize = value
        RecreateAllESP()
    end)

    CreateSlider("LARGURA", 100, 300, Settings.ESPWidth, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.ESPWidth = value
        RecreateAllESP()
    end)

    CreateSlider("ALTURA", 40, 120, Settings.ESPHeight, Color3.fromRGB(0, 150, 255), "", function(value)
        Settings.ESPHeight = value
        RecreateAllESP()
    end)

    CreateSection("⚡ EXTRAS", "⚡")

    local AntiAfkBtn = CreateToggle("ANTI AFK", "Evita ser kickado", Settings.AntiAfk, function(state)
        Settings.AntiAfk = state
        
        if state then
            if not AntiAfkConnection then
                AntiAfkConnection = RunService.Heartbeat:Connect(function()
                    local VirtualUser = game:GetService("VirtualUser")
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end
        else
            if AntiAfkConnection then
                AntiAfkConnection:Disconnect()
                AntiAfkConnection = nil
            end
        end
    end)

    -- LOOP PRINCIPAL
    RunService.RenderStepped:Connect(function()
        for player, esp in pairs(ESPs) do
            if esp and esp.Gui and esp.Gui.Parent and player.Character then
                if esp.Head and esp.Head.Parent and esp.Humanoid and esp.Humanoid.Parent then
                    local dist = math.floor((esp.Head.Position - Camera.CFrame.Position).Magnitude)
                    local health = math.floor(esp.Humanoid.Health)
                    local maxHealth = math.floor(esp.Humanoid.MaxHealth)
                    
                    esp.InfoLabel.Text = dist .. "m | ❤️ " .. health .. "/" .. maxHealth
                    
                    if health > 70 then
                        esp.InfoLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                    elseif health > 30 then
                        esp.InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
                    else
                        esp.InfoLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    end
                end
            end
        end
        
        UpdateAimbot()
        UpdateFly()
    end)

    -- SISTEMA DE TECLAS
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Settings.AimbotKey then
            Settings.Aimbot = not Settings.Aimbot
            if AimbotBtn then
                AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 50, 100) or Color3.fromRGB(0, 30, 60)
                local powerInd = AimbotBtn:FindFirstChildWhichIsA("Frame")
                if powerInd then
                    powerInd.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                end
            end
        elseif input.KeyCode == Settings.FlyKey then
            Settings.Fly = not Settings.Fly
            if FlyBtn then
                FlyBtn.BackgroundColor3 = Settings.Fly and Color3.fromRGB(0, 50, 100) or Color3.fromRGB(0, 30, 60)
                local powerInd = FlyBtn:FindFirstChildWhichIsA("Frame")
                if powerInd then
                    powerInd.BackgroundColor3 = Settings.Fly and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                end
            end
            if not Settings.Fly then
                DisableFly()
            end
        elseif input.KeyCode == Settings.SpeedKey then
            Settings.Speed = not Settings.Speed
            if SpeedBtn then
                SpeedBtn.BackgroundColor3 = Settings.Speed and Color3.fromRGB(0, 50, 100) or Color3.fromRGB(0, 30, 60)
                local powerInd = SpeedBtn:FindFirstChildWhichIsA("Frame")
                if powerInd then
                    powerInd.BackgroundColor3 = Settings.Speed and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                end
            end
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.WalkSpeed = Settings.Speed and Settings.WalkSpeed or 16
            end
        elseif input.KeyCode == Settings.ESPKey then
            Settings.ESP = not Settings.ESP
            if ESPBtn then
                ESPBtn.BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 50, 100) or Color3.fromRGB(0, 30, 60)
                local powerInd = ESPBtn:FindFirstChildWhichIsA("Frame")
                if powerInd then
                    powerInd.BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                end
            end
            for _, esp in pairs(ESPs) do
                if esp and esp.Gui then
                    esp.Gui.Enabled = Settings.ESP
                end
            end
        elseif input.KeyCode == Settings.MenuKey then
            Settings.MenuVisible = not Settings.MenuVisible
            MainFrame.Visible = Settings.MenuVisible
        end
    end)

    Player.CharacterRemoving:Connect(DisableFly)

    -- Notificação
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(0, 350, 0, 60)
    Notif.Position = UDim2.new(0.5, -175, 0.1, -100)
    Notif.BackgroundColor3 = Color3.fromRGB(0, 30, 60)
    Notif.BorderSizePixel = 0
    Notif.Parent = ScreenGui

    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 10)
    NotifCorner.Parent = Notif

    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Size = UDim2.new(1, 0, 0.6, 0)
    NotifTitle.Position = UDim2.new(0, 0, 0, 5)
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Text = "⚡ PRACTICE7 PERFEITO ⚡"
    NotifTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotifTitle.Font = Enum.Font.GothamBold
    NotifTitle.TextSize = 20
    NotifTitle.Parent = Notif

    local NotifDesc = Instance.new("TextLabel")
    NotifDesc.Size = UDim2.new(1, 0, 0.4, 0)
    NotifDesc.Position = UDim2.new(0, 0, 0.6, -5)
    NotifDesc.BackgroundTransparency = 1
    NotifDesc.Text = "🎯 Aimbot | 🚀 Voo: Shift Direito | 👁️ ESP (Vermelho/Azul)"
    NotifDesc.TextColor3 = Color3.fromRGB(0, 150, 255)
    NotifDesc.Font = Enum.Font.GothamBold
    NotifDesc.TextSize = 14
    NotifDesc.Parent = Notif

    Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, 0), "Out", "Quad", 0.5, true)
    task.wait(3)
    Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, -100), "Out", "Quad", 0.5, true)
    task.wait(0.5)
    Notif:Destroy()

    print("⚡ Practice7 Perfeito carregado!")
    print("🎯 Aimbot: K + Botão Direito")
    print("🚀 Voo: SHIFT DIREITO + WASD + Espaço/Ctrl (Velocidade 300)")
    print("⚡ Super Velocidade: V")
    print("👁️ ESP: J (Nome Vermelho | Info Azul)")
    print("📌 Menu: RightControl")
end

-- ============================================
-- VERIFICAÇÃO DA KEY
-- ============================================
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key == "" then
        StatusLabel.Text = "⚠️ Digite uma key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        return
    end
    
    StatusLabel.Text = "🔍 Verificando key..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    
    local success, message = CheckKey(key)
    
    if success then
        StatusLabel.Text = "✅ " .. message
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        KeyGui:Destroy()
        task.wait(0.5)
        LoadCheat()
    else
        StatusLabel.Text = "❌ " .. message
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        VerifyBtn.MouseButton1Click:Fire()
    end
end)

print("🔐 Sistema de key ativado. Aguardando input...")
