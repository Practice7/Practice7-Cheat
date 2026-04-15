--[[
    PRACTICE7 CHEAT - VERSÃO FUNCIONAL
]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Mouse = Player:GetMouse()

-- ============================================
-- SISTEMA DE KEY (SIMPLIFICADO)
-- ============================================

local ValidKeys = {
    ["PRACTICE7-FREE-TRIAL"] = true,
    ["NATHAN-2024-001"] = true,
    ["COMPRADOR1-2024"] = true
}

local keyVerified = false

-- Criar tela de key
local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "KeySystem"
KeyGui.Parent = Player:WaitForChild("PlayerGui")
KeyGui.ResetOnSpawn = false

local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.8
Background.Parent = KeyGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 350, 0, 250)
KeyFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
KeyFrame.BorderSizePixel = 2
KeyFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
KeyFrame.Parent = KeyGui

local KeyFrameCorner = Instance.new("UICorner")
KeyFrameCorner.CornerRadius = UDim.new(0, 10)
KeyFrameCorner.Parent = KeyFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "PRACTICE7 CHEAT"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = KeyFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 30)
SubTitle.Position = UDim2.new(0, 0, 0, 60)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "INSIRA SUA KEY"
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 14
SubTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0, 100)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Cole sua key aqui"
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 0, 0)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 40)
VerifyBtn.Position = UDim2.new(0.1, 0, 0, 155)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
VerifyBtn.BorderSizePixel = 0
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 16
VerifyBtn.Parent = KeyFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 8)
BtnCorner.Parent = VerifyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 30)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 205)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Aguardando key..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.Parent = KeyFrame

-- Função de verificação
local function CheckKey(key)
    if ValidKeys[key] then
        return true
    end
    return false
end

-- ============================================
-- FUNÇÃO DO CHEAT (HUB)
-- ============================================
local function LoadCheat()
    print("Carregando Practice7 Cheat...")
    
    -- Aguardar personagem
    repeat task.wait() until Player.Character
    
    local HubGui = Instance.new("ScreenGui")
    HubGui.Name = "Practice7Hub"
    HubGui.Parent = Player:WaitForChild("PlayerGui")
    HubGui.ResetOnSpawn = false
    
    -- Frame principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 280, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -140, 0.5, -160)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    MainFrame.BorderSizePixel = 2
    MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = HubGui
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame
    
    -- Título
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    TopBar.Parent = MainFrame
    
    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 10)
    TopCorner.Parent = TopBar
    
    local TopTitle = Instance.new("TextLabel")
    TopTitle.Size = UDim2.new(1, 0, 1, 0)
    TopTitle.BackgroundTransparency = 1
    TopTitle.Text = "PRACTICE7 CHEAT"
    TopTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
    TopTitle.Font = Enum.Font.GothamBold
    TopTitle.TextSize = 18
    TopTitle.Parent = TopBar
    
    -- Container
    local Container = Instance.new("ScrollingFrame")
    Container.Size = UDim2.new(1, -10, 1, -50)
    Container.Position = UDim2.new(0, 5, 0, 45)
    Container.BackgroundTransparency = 1
    Container.CanvasSize = UDim2.new(0, 0, 0, 300)
    Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Container.ScrollBarThickness = 4
    Container.Parent = MainFrame
    
    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 5)
    Layout.Parent = Container
    
    -- Variáveis
    local flyActive = false
    local speedActive = false
    local espActive = false
    local FlyBV = nil
    local ESPList = {}
    
    -- Criar botão
    local function CreateButton(text, description, color)
        local Button = Instance.new("TextButton")
        Button.Size = UDim2.new(0.95, 0, 0, 50)
        Button.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
        Button.Text = text
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.Font = Enum.Font.GothamBold
        Button.TextSize = 14
        Button.Parent = Container
        
        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 6)
        BtnCorner.Parent = Button
        
        local Desc = Instance.new("TextLabel")
        Desc.Size = UDim2.new(1, 0, 0, 15)
        Desc.Position = UDim2.new(0, 5, 1, -18)
        Desc.BackgroundTransparency = 1
        Desc.Text = description
        Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
        Desc.Font = Enum.Font.Gotham
        Desc.TextSize = 10
        Desc.TextXAlignment = Enum.TextXAlignment.Left
        Desc.Parent = Button
        
        local Indicator = Instance.new("Frame")
        Indicator.Size = UDim2.new(0, 12, 0, 12)
        Indicator.Position = UDim2.new(1, -18, 0.5, -6)
        Indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Indicator.BorderSizePixel = 0
        Indicator.Parent = Button
        
        local IndCorner = Instance.new("UICorner")
        IndCorner.CornerRadius = UDim.new(1, 0)
        IndCorner.Parent = Indicator
        
        return Button, Indicator
    end
    
    -- Criar slider
    local function CreateSlider(text, min, max, default, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.95, 0, 0, 60)
        Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
        Frame.Parent = Container
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 6)
        FrameCorner.Parent = Frame
        
        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -10, 0, 20)
        Title.Position = UDim2.new(0, 5, 0, 2)
        Title.BackgroundTransparency = 1
        Title.Text = text
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 12
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = Frame
        
        local ValueLabel = Instance.new("TextLabel")
        ValueLabel.Size = UDim2.new(0, 50, 0, 20)
        ValueLabel.Position = UDim2.new(1, -55, 0, 2)
        ValueLabel.BackgroundTransparency = 1
        ValueLabel.Text = tostring(default)
        ValueLabel.TextColor3 = Color3.fromRGB(255, 100, 0)
        ValueLabel.Font = Enum.Font.GothamBold
        ValueLabel.TextSize = 12
        ValueLabel.Parent = Frame
        
        local SliderBg = Instance.new("Frame")
        SliderBg.Size = UDim2.new(0.95, 0, 0, 6)
        SliderBg.Position = UDim2.new(0.025, 0, 0.6, 0)
        SliderBg.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
        SliderBg.BorderSizePixel = 0
        SliderBg.Parent = Frame
        
        local SliderBgCorner = Instance.new("UICorner")
        SliderBgCorner.CornerRadius = UDim.new(1, 0)
        SliderBgCorner.Parent = SliderBg
        
        local SliderFill = Instance.new("Frame")
        SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        SliderFill.BorderSizePixel = 0
        SliderFill.Parent = SliderBg
        
        local FillCorner = Instance.new("UICorner")
        FillCorner.CornerRadius = UDim.new(1, 0)
        FillCorner.Parent = SliderFill
        
        local value = default
        
        SliderBg.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                local connection
                connection = RunService.RenderStepped:Connect(function()
                    local mousePos = UserInputService:GetMouseLocation()
                    local absX = SliderBg.AbsolutePosition.X
                    local absW = SliderBg.AbsoluteSize.X
                    local percent = math.clamp((mousePos.X - absX) / absW, 0, 1)
                    value = math.floor((min + (max - min) * percent) * 10) / 10
                    ValueLabel.Text = tostring(value)
                    SliderFill.Size = UDim2.new(percent, 0, 1, 0)
                    callback(value)
                end)
                
                UserInputService.InputEnded:Connect(function(inputEnd)
                    if inputEnd.UserInputType == Enum.UserInputType.MouseButton1 then
                        connection:Disconnect()
                    end
                end)
            end
        end)
    end
    
    -- Botão Aimbot
    local aimbotActive = false
    local aimbotBtn, aimbotInd = CreateButton("AIMBOT", "Botão direito do mouse mira automaticamente", Color3.fromRGB(255, 0, 0))
    aimbotBtn.MouseButton1Click:Connect(function()
        aimbotActive = not aimbotActive
        aimbotBtn.BackgroundColor3 = aimbotActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
        aimbotInd.BackgroundColor3 = aimbotActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    -- Botão Voo
    local flyBtn, flyInd = CreateButton("VOO", "Tecla X para ativar - WASD + Espaço/Ctrl", Color3.fromRGB(255, 0, 0))
    flyBtn.MouseButton1Click:Connect(function()
        flyActive = not flyActive
        flyBtn.BackgroundColor3 = flyActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
        flyInd.BackgroundColor3 = flyActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    end)
    
    -- Botão Velocidade
    local speedBtn, speedInd = CreateButton("SUPER VELOCIDADE", "Tecla V - Aumenta velocidade", Color3.fromRGB(255, 0, 0))
    speedBtn.MouseButton1Click:Connect(function()
        speedActive = not speedActive
        speedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
        speedInd.BackgroundColor3 = speedActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = speedActive and 55 or 16
        end
    end)
    
    -- Botão ESP
    local espBtn, espInd = CreateButton("ESP", "Tecla J - Mostra jogadores através das paredes", Color3.fromRGB(255, 0, 0))
    espBtn.MouseButton1Click:Connect(function()
        espActive = not espActive
        espBtn.BackgroundColor3 = espActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
        espInd.BackgroundColor3 = espActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        UpdateESP()
    end)
    
    -- Slider de velocidade do voo
    local flySpeed = 75
    CreateSlider("VELOCIDADE DO VOO", 30, 200, 75, function(value)
        flySpeed = value
    end)
    
    -- Slider de walk speed
    local walkSpeed = 55
    CreateSlider("WALK SPEED", 30, 150, 55, function(value)
        walkSpeed = value
        if speedActive and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = value
        end
    end)
    
    -- Função do Aimbot
    local function UpdateAimbot()
        if not aimbotActive then return end
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
        
        local closest = nil
        local closestDist = 800
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = player
                    end
                end
            end
        end
        
        if closest and closest.Character and closest.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Character.Head.Position)
        end
    end
    
    -- Função do Voo
    local function UpdateFly()
        if not flyActive then
            if FlyBV then FlyBV:Destroy() end
            FlyBV = nil
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.PlatformStand = false
            end
            return
        end
        
        if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then return end
        
        local root = Player.Character.HumanoidRootPart
        local humanoid = Player.Character.Humanoid
        
        humanoid.PlatformStand = true
        
        if not FlyBV then
            FlyBV = Instance.new("BodyVelocity")
            FlyBV.MaxForce = Vector3.new(1, 1, 1) * 1e6
            FlyBV.Parent = root
        end
        
        local direction = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction = direction + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then direction = direction - Vector3.new(0, 1, 0) end
        
        if direction.Magnitude > 0 then
            FlyBV.Velocity = direction.Unit * flySpeed
        else
            FlyBV.Velocity = Vector3.new()
        end
    end
    
    -- Função ESP
    local function CreateESP(player)
        if player == Player then return end
        
        local function AddESP(char)
            task.wait(0.5)
            local head = char:FindFirstChild("Head")
            if not head then return end
            
            local esp = Instance.new("BillboardGui")
            esp.Name = "Practice7_ESP"
            esp.Size = UDim2.new(0, 120, 0, 30)
            esp.AlwaysOnTop = true
            esp.Parent = head
            
            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
            frame.BackgroundTransparency = 0.3
            frame.Parent = esp
            
            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = player.Name
            label.TextColor3 = Color3.fromRGB(255, 0, 0)
            label.Font = Enum.Font.GothamBold
            label.TextSize = 11
            label.Parent = frame
            
            ESPList[player] = esp
            esp.Enabled = espActive
        end
        
        AddESP(player.Character)
        player.CharacterAdded:Connect(AddESP)
    end
    
    local function UpdateESP()
        for _, esp in pairs(ESPList) do
            if esp then
                esp.Enabled = espActive
            end
        end
    end
    
    -- Criar ESP para todos
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
    
    Players.PlayerAdded:Connect(CreateESP)
    Players.PlayerRemoving:Connect(function(player)
        if ESPList[player] then
            ESPList[player]:Destroy()
            ESPList[player] = nil
        end
    end)
    
    -- Teclas de atalho
    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.X then
            flyActive = not flyActive
            flyBtn.BackgroundColor3 = flyActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
            flyInd.BackgroundColor3 = flyActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        elseif input.KeyCode == Enum.KeyCode.V then
            speedActive = not speedActive
            speedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
            speedInd.BackgroundColor3 = speedActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.WalkSpeed = speedActive and walkSpeed or 16
            end
        elseif input.KeyCode == Enum.KeyCode.J then
            espActive = not espActive
            espBtn.BackgroundColor3 = espActive and Color3.fromRGB(0, 80, 0) or Color3.fromRGB(30, 0, 0)
            espInd.BackgroundColor3 = espActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
            UpdateESP()
        end
    end)
    
    -- Loop principal
    RunService.RenderStepped:Connect(function()
        UpdateAimbot()
        UpdateFly()
    end)
    
    -- Notificação
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(0, 300, 0, 40)
    Notif.Position = UDim2.new(0.5, -150, 0.1, -40)
    Notif.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Notif.BorderSizePixel = 1
    Notif.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Notif.Parent = HubGui
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = Notif
    
    local NotifText = Instance.new("TextLabel")
    NotifText.Size = UDim2.new(1, 0, 1, 0)
    NotifText.BackgroundTransparency = 1
    NotifText.Text = "PRACTICE7 CHEAT CARREGADO!"
    NotifText.TextColor3 = Color3.fromRGB(255, 0, 0)
    NotifText.Font = Enum.Font.GothamBold
    NotifText.TextSize = 14
    NotifText.Parent = Notif
    
    Notif:TweenPosition(UDim2.new(0.5, -150, 0.1, 0), "Out", "Quad", 0.5, true)
    task.wait(3)
    Notif:TweenPosition(UDim2.new(0.5, -150, 0.1, -40), "Out", "Quad", 0.5, true)
    task.wait(0.5)
    Notif:Destroy()
    
    print("✅ Practice7 Cheat carregado!")
end

-- ============================================
-- VERIFICAÇÃO DA KEY
-- ============================================
VerifyBtn.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key == "" then
        StatusLabel.Text = "Digite uma key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        return
    end
    
    StatusLabel.Text = "Verificando..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    
    if CheckKey(key) then
        StatusLabel.Text = "✅ KEY VÁLIDA!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        KeyGui:Destroy()
        task.wait(0.5)
        LoadCheat()
    else
        StatusLabel.Text = "❌ KEY INVÁLIDA!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end)

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        VerifyBtn.MouseButton1Click:Fire()
    end
end)

print("Sistema de key iniciado. Aguardando input...")
