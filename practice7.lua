--[[
    PRACTICE7 CHEAT - VERSÃO SIMPLIFICADA
    Apenas usuários autorizados podem usar
--]]

-- Lista de keys válidas
local ValidKeys = {
    ["PRACTICE7-FREE-TRIAL"] = {user = "Demonstração", expires = "2025-12-31"},
    ["NATHAN-2024-001"] = {user = "Nathan", expires = "2026-12-31"},
    ["COMPRADOR1-2024"] = {user = "João", expires = "2025-06-30"}
}

local Player = game:GetService("Players").LocalPlayer

-- FUNÇÃO PARA VERIFICAR KEY
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

-- TELA DE KEY
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Practice7_KeySystem"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

-- Fundo
local Background = Instance.new("Frame")
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.7
Background.Parent = ScreenGui

-- Card
local Card = Instance.new("Frame")
Card.Size = UDim2.new(0, 400, 0, 300)
Card.Position = UDim2.new(0.5, -200, 0.5, -150)
Card.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
Card.BorderSizePixel = 2
Card.BorderColor3 = Color3.fromRGB(255, 0, 0)
Card.Parent = ScreenGui

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 15)
CardCorner.Parent = Card

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "PRACTICE7 CHEAT"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = Card

-- Subtítulo
local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, 0, 0, 30)
Subtitle.Position = UDim2.new(0, 0, 0, 60)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "INSIRA SUA KEY"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 14
Subtitle.Parent = Card

-- Campo de key
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 40)
KeyInput.Position = UDim2.new(0.1, 0, 0, 110)
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
KeyInput.BorderSizePixel = 0
KeyInput.PlaceholderText = "Digite sua key aqui"
KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 0, 0)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = Card

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

-- Botão
local VerifyButton = Instance.new("TextButton")
VerifyButton.Size = UDim2.new(0.8, 0, 0, 40)
VerifyButton.Position = UDim2.new(0.1, 0, 0, 170)
VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
VerifyButton.BorderSizePixel = 0
VerifyButton.Text = "VERIFICAR"
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyButton.Font = Enum.Font.GothamBold
VerifyButton.TextSize = 16
VerifyButton.Parent = Card

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = VerifyButton

-- Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
StatusLabel.Position = UDim2.new(0.05, 0, 0, 230)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Aguardando key..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.Parent = Card

-- FUNÇÃO DO CHEAT (HUB SIMPLES PARA TESTAR)
local function LoadCheat()
    print("Carregando cheat...")
    
    -- Aguardar personagem
    repeat task.wait() until Player.Character
    
    -- Criar HUB simples
    local HubGui = Instance.new("ScreenGui")
    HubGui.Name = "Practice7_Hub"
    HubGui.Parent = Player:WaitForChild("PlayerGui")
    HubGui.ResetOnSpawn = false
    
    -- Frame do hub
    local HubFrame = Instance.new("Frame")
    HubFrame.Size = UDim2.new(0, 250, 0, 300)
    HubFrame.Position = UDim2.new(0.5, -125, 0.5, -150)
    HubFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    HubFrame.BorderSizePixel = 2
    HubFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    HubFrame.Active = true
    HubFrame.Draggable = true
    HubFrame.Parent = HubGui
    
    local HubCorner = Instance.new("UICorner")
    HubCorner.CornerRadius = UDim.new(0, 10)
    HubCorner.Parent = HubFrame
    
    -- Título do hub
    local HubTitle = Instance.new("TextLabel")
    HubTitle.Size = UDim2.new(1, 0, 0, 40)
    HubTitle.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    HubTitle.Text = "PRACTICE7"
    HubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    HubTitle.Font = Enum.Font.GothamBold
    HubTitle.TextSize = 20
    HubTitle.Parent = HubFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 10)
    TitleCorner.Parent = HubTitle
    
    -- Botão Aimbot
    local AimbotBtn = Instance.new("TextButton")
    AimbotBtn.Size = UDim2.new(0.9, 0, 0, 40)
    AimbotBtn.Position = UDim2.new(0.05, 0, 0, 55)
    AimbotBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    AimbotBtn.Text = "AIMBOT [DESLIGADO]"
    AimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    AimbotBtn.Font = Enum.Font.GothamBold
    AimbotBtn.TextSize = 14
    AimbotBtn.Parent = HubFrame
    
    local AimbotCorner = Instance.new("UICorner")
    AimbotCorner.CornerRadius = UDim.new(0, 8)
    AimbotCorner.Parent = AimbotBtn
    
    -- Botão Voo
    local FlyBtn = Instance.new("TextButton")
    FlyBtn.Size = UDim2.new(0.9, 0, 0, 40)
    FlyBtn.Position = UDim2.new(0.05, 0, 0, 105)
    FlyBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    FlyBtn.Text = "VOO [DESLIGADO]"
    FlyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlyBtn.Font = Enum.Font.GothamBold
    FlyBtn.TextSize = 14
    FlyBtn.Parent = HubFrame
    
    local FlyCorner = Instance.new("UICorner")
    FlyCorner.CornerRadius = UDim.new(0, 8)
    FlyCorner.Parent = FlyBtn
    
    -- Botão Velocidade
    local SpeedBtn = Instance.new("TextButton")
    SpeedBtn.Size = UDim2.new(0.9, 0, 0, 40)
    SpeedBtn.Position = UDim2.new(0.05, 0, 0, 155)
    SpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    SpeedBtn.Text = "SUPER VELOCIDADE [DESLIGADO]"
    SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBtn.Font = Enum.Font.GothamBold
    SpeedBtn.TextSize = 14
    SpeedBtn.Parent = HubFrame
    
    local SpeedCorner = Instance.new("UICorner")
    SpeedCorner.CornerRadius = UDim.new(0, 8)
    SpeedCorner.Parent = SpeedBtn
    
    -- Botão ESP
    local ESPBtn = Instance.new("TextButton")
    ESPBtn.Size = UDim2.new(0.9, 0, 0, 40)
    ESPBtn.Position = UDim2.new(0.05, 0, 0, 205)
    ESPBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    ESPBtn.Text = "ESP [DESLIGADO]"
    ESPBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    ESPBtn.Font = Enum.Font.GothamBold
    ESPBtn.TextSize = 14
    ESPBtn.Parent = HubFrame
    
    local ESPCorner = Instance.new("UICorner")
    ESPCorner.CornerRadius = UDim.new(0, 8)
    ESPCorner.Parent = ESPBtn
    
    -- Variáveis
    local aimbotActive = false
    local flyActive = false
    local speedActive = false
    local espActive = false
    local FlyBV = nil
    local ESPs = {}
    
    -- Função do Aimbot
    local function UpdateAimbot()
        if not aimbotActive then return end
        local Camera = workspace.CurrentCamera
        local Mouse = Player:GetMouse()
        
        if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
        
        local closestPlayer = nil
        local closestDist = 800
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closestPlayer = player
                    end
                end
            end
        end
        
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestPlayer.Character.Head.Position)
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
        local Camera = workspace.CurrentCamera
        
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
            FlyBV.Velocity = direction.Unit * 75
        else
            FlyBV.Velocity = Vector3.new()
        end
    end
    
    -- Função do ESP
    local function CreateESP(player)
        if player == Player then return end
        
        player.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            local head = char:FindFirstChild("Head")
            if head then
                local esp = Instance.new("BillboardGui")
                esp.Size = UDim2.new(0, 150, 0, 40)
                esp.AlwaysOnTop = true
                esp.Enabled = espActive
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
                label.TextSize = 12
                label.Parent = frame
                
                ESPs[player] = esp
            end
        end)
        
        if player.Character then
            task.wait(0.5)
            local head = player.Character:FindFirstChild("Head")
            if head then
                local esp = Instance.new("BillboardGui")
                esp.Size = UDim2.new(0, 150, 0, 40)
                esp.AlwaysOnTop = true
                esp.Enabled = espActive
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
                label.TextSize = 12
                label.Parent = frame
                
                ESPs[player] = esp
            end
        end
    end
    
    -- Atualizar ESP
    local function UpdateESP()
        for player, esp in pairs(ESPs) do
            if esp and esp.Parent then
                esp.Enabled = espActive
            end
        end
    end
    
    -- Criar ESP para todos os players
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
    
    Players.PlayerAdded:Connect(CreateESP)
    
    -- Ações dos botões
    local aimbotState = false
    local flyState = false
    local speedState = false
    local espState = false
    
    AimbotBtn.MouseButton1Click:Connect(function()
        aimbotState = not aimbotState
        aimbotActive = aimbotState
        AimbotBtn.Text = aimbotState and "AIMBOT [LIGADO]" or "AIMBOT [DESLIGADO]"
        AimbotBtn.BackgroundColor3 = aimbotState and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(30, 0, 0)
    end)
    
    FlyBtn.MouseButton1Click:Connect(function()
        flyState = not flyState
        flyActive = flyState
        FlyBtn.Text = flyState and "VOO [LIGADO]" or "VOO [DESLIGADO]"
        FlyBtn.BackgroundColor3 = flyState and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(30, 0, 0)
    end)
    
    SpeedBtn.MouseButton1Click:Connect(function()
        speedState = not speedState
        speedActive = speedState
        SpeedBtn.Text = speedState and "SUPER VELOCIDADE [LIGADO]" or "SUPER VELOCIDADE [DESLIGADO]"
        SpeedBtn.BackgroundColor3 = speedState and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(30, 0, 0)
        
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = speedState and 55 or 16
        end
    end)
    
    ESPBtn.MouseButton1Click:Connect(function()
        espState = not espState
        espActive = espState
        ESPBtn.Text = espState and "ESP [LIGADO]" or "ESP [DESLIGADO]"
        ESPBtn.BackgroundColor3 = espState and Color3.fromRGB(0, 100, 0) or Color3.fromRGB(30, 0, 0)
        UpdateESP()
    end)
    
    -- Loop principal
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:Connect(function()
        UpdateAimbot()
        UpdateFly()
        
        if speedActive and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = 55
        end
    end)
    
    -- Notificação
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(0, 300, 0, 50)
    Notif.Position = UDim2.new(0.5, -150, 0.1, -50)
    Notif.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Notif.BorderSizePixel = 2
    Notif.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Notif.Parent = HubGui
    
    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 10)
    NotifCorner.Parent = Notif
    
    local NotifText = Instance.new("TextLabel")
    NotifText.Size = UDim2.new(1, 0, 1, 0)
    NotifText.BackgroundTransparency = 1
    NotifText.Text = "PRACTICE7 CARREGADO COM SUCESSO!"
    NotifText.TextColor3 = Color3.fromRGB(255, 0, 0)
    NotifText.Font = Enum.Font.GothamBold
    NotifText.TextSize = 14
    NotifText.Parent = Notif
    
    Notif:TweenPosition(UDim2.new(0.5, -150, 0.1, 0), "Out", "Quad", 0.5, true)
    task.wait(3)
    Notif:TweenPosition(UDim2.new(0.5, -150, 0.1, -50), "Out", "Quad", 0.5, true)
    task.wait(0.5)
    Notif:Destroy()
    
    print("✅ Practice7 Cheat carregado!")
end

-- VERIFICAR KEY
local function AttemptVerification()
    local key = KeyInput.Text
    if key == "" then
        StatusLabel.Text = "Digite uma key!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        return
    end
    
    StatusLabel.Text = "Verificando..."
    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    
    local success, message = CheckKey(key)
    
    if success then
        StatusLabel.Text = "✅ " .. message
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        -- Fechar tela de key
        ScreenGui:Destroy()
        
        -- Carregar cheat
        task.wait(0.5)
        LoadCheat()
    else
        StatusLabel.Text = "❌ " .. message
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
end

VerifyButton.MouseButton1Click:Connect(AttemptVerification)
KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then AttemptVerification() end
end)
