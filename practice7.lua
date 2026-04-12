--[[
    PRACTICE7 HUB - VERSÃO PERFEITA
    Aimbot Estável | Voo Estabilizado | ESP Ajustável
    Tecla de Velocidade: V | Sistema de Voo Integrado
]]

-- Serviços
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera

-- Aguardar caractere
repeat wait() until Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

-- Configurações
local Settings = {
    Aimbot = false,
    Fly = false,
    ESP = false,
    Speed = false,
    AntiAfk = false,
    FlySpeed = 75,  -- Velocidade padrão do voo
    WalkSpeed = 55,
    AimbotKey = Enum.KeyCode.K,
    FlyKey = Enum.KeyCode.X,  -- Tecla para ativar/desativar voo
    SpeedKey = Enum.KeyCode.V,
    ESPKey = Enum.KeyCode.J,
    MenuKey = Enum.KeyCode.RightControl,
    MenuVisible = true,
    AimbotFOV = 800,
    AimbotStrength = 1.0,
    AimbotPrediction = 0.1,
    TargetPart = "Head",
    ESPTextSize = 14,
    ESPWidth = 180,
    ESPHeight = 60
}

-- Criar GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Practice7_Perfect"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- Título
local TitleFrame = Instance.new("Frame")
TitleFrame.Size = UDim2.new(1, 0, 0, 50)
TitleFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
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

-- Animação RGB
spawn(function()
    while true do
        for hue = 0, 1, 0.02 do
            Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
            wait(0.03)
        end
    end
end)

-- Container com scroll
local Container = Instance.new("ScrollingFrame")
Container.Size = UDim2.new(1, -20, 1, -70)
Container.Position = UDim2.new(0, 10, 0, 60)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 6
Container.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
Container.CanvasSize = UDim2.new(0, 0, 0, 500)
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
    SectionIcon.TextColor3 = Color3.fromRGB(255, 0, 0)
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
    SectionLine.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    SectionLine.BackgroundTransparency = 0.5
    SectionLine.BorderSizePixel = 0
    SectionLine.Parent = Section
end

-- Função para criar botões toggle
function CreateToggle(text, description, defaultState, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.95, 0, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
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
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -50, 0, 25)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Button
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -50, 0, 15)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = description
    Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
    Desc.Font = Enum.Font.Gotham
    Desc.TextSize = 11
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.Parent = Button
    
    local state = defaultState
    
    Button.MouseButton1Click:Connect(function()
        state = not state
        Button.BackgroundColor3 = state and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
        PowerIndicator.BackgroundColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        callback(state)
    end)
    
    return Button
end

-- Função para criar slider
function CreateSlider(text, min, max, default, color, suffix, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0.95, 0, 0, 60)
    Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Parent = Container
    
    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -30, 0, 20)
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.BackgroundTransparency = 1
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame
    
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
    SliderBg.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
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
    Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Parent = Container
    
    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0.5, -10, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = text
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Frame
    
    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0.4, 0, 0.6, 0)
    Dropdown.Position = UDim2.new(0.55, 0, 0.2, 0)
    Dropdown.BackgroundColor3 = Color3.fromRGB(40, 0, 0)
    Dropdown.BorderSizePixel = 0
    Dropdown.Text = default
    Dropdown.TextColor3 = Color3.fromRGB(255, 0, 0)
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

-- FUNÇÃO DE ESP COM TAMANHO AJUSTÁVEL
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
        bg.BorderSizePixel = 0
        bg.Parent = esp
        
        local bgCorner = Instance.new("UICorner")
        bgCorner.CornerRadius = UDim.new(0, 4)
        bgCorner.Parent = bg
        
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 0, 0, 2)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = player.Name
        nameLabel.TextColor3 = player.Team and player.Team.TeamColor.Color or Color3.fromRGB(255, 0, 0)
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextSize = Settings.ESPTextSize
        nameLabel.Parent = bg
        
        local infoLabel = Instance.new("TextLabel")
        infoLabel.Size = UDim2.new(1, 0, 0.5, 0)
        infoLabel.Position = UDim2.new(0, 0, 0.5, -2)
        infoLabel.BackgroundTransparency = 1
        infoLabel.Text = "0m | ❤️ 100"
        infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
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

-- FUNÇÃO PARA RECRIAR ESP COM NOVOS TAMANHOS
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

-- FUNÇÃO PARA OBTER PARTE DO ALVO
function GetTargetPart(character)
    if Settings.TargetPart == "Head" then
        return character:FindFirstChild("Head")
    elseif Settings.TargetPart == "Torso" then
        return character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
    elseif Settings.TargetPart == "Root" then
        return character:FindFirstChild("HumanoidRootPart")
    else
        return character:FindFirstChild("Head")
    end
end

-- FUNÇÃO DE AIMBOT ESTÁVEL (SEM DESLOCAMENTO)
function UpdateAimbot()
    if not Settings.Aimbot or not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
    
    local closestTarget = nil
    local closestDist = Settings.AimbotFOV
    local mousePos = Vector2.new(Mouse.X, Mouse.Y)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Player and player.Character then
            local targetPart = GetTargetPart(player.Character)
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

-- ===== SISTEMA DE VOO INTEGRADO (DO SEU SCRIPT) =====
-- Variáveis do voo
local FlyEnabled = false  -- Usaremos Settings.Fly ao invés disso
local FlyBV = nil
local FlyBG = nil

-- Função para desabilitar o voo
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

-- Função para atualizar o estado do voo baseado no Settings
local function UpdateFlyState()
    if Settings.Fly then
        -- Voo ativado, não fazemos nada aqui, o RenderStepped cuidará
    else
        DisableFly()
    end
end

-- Loop principal do voo (integrado ao RenderStepped existente)
-- NOTA: Vamos modificar a função UpdateFly() abaixo para usar a lógica do seu script

-- FUNÇÃO DE VOO (USANDO SEU SISTEMA)
function UpdateFly()
    -- Verificar se o voo está ativado nas configurações
    if Settings.Fly and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
        local root = Player.Character.HumanoidRootPart
        local humanoid = Player.Character:FindFirstChild("Humanoid")
        local camera = workspace.CurrentCamera
        
        -- Colocar o personagem em modo plataforma
        if humanoid then
            humanoid.PlatformStand = true
        end
        
        -- Criar BodyVelocity se não existir
        if not FlyBV or not FlyBV.Parent then
            FlyBV = Instance.new("BodyVelocity")
            FlyBV.Name = "FlyBV"
            FlyBV.MaxForce = Vector3.new(1, 1, 1) * 9e9 -- Força máxima
            FlyBV.P = 20000 -- Força de movimento
            FlyBV.Parent = root
        end
        
        -- Criar BodyGyro se não existir (para controle de rotação)
        if not FlyBG or not FlyBG.Parent then
            FlyBG = Instance.new("BodyGyro")
            FlyBG.Name = "FlyBG"
            FlyBG.MaxTorque = Vector3.new(1, 1, 1) * 9e9 -- Torque máximo
            FlyBG.P = 20000
            FlyBG.D = 1000
            FlyBG.Parent = root
        end
        
        -- Manter a rotação alinhada com a câmera
        FlyBG.CFrame = camera.CFrame
        
        -- Calcular direção do movimento baseado nas teclas pressionadas
        local direction = Vector3.new()
        
        -- WASD para movimento horizontal
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
        
        -- Espaço e Ctrl para movimento vertical
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction = direction + Vector3.new(0, 1, 0) -- Sobe
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            direction = direction - Vector3.new(0, 1, 0) -- Desce
        end
        
        -- Aplicar velocidade se houver movimento (usando Settings.FlySpeed)
        if direction.Magnitude > 0 then
            direction = direction.Unit -- Normalizar o vetor
            FlyBV.Velocity = direction * Settings.FlySpeed
        else
            FlyBV.Velocity = Vector3.new() -- Parar se não tiver movimento
        end
        
    elseif FlyBV then
        -- Limpar se o voo estiver desativado
        DisableFly()
    end
end
-- ===== FIM DO SISTEMA DE VOO INTEGRADO =====

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

local AimbotBtn = CreateToggle("AIMBOT", "Ativar mira automática (Botão Direito)", Settings.Aimbot, function(state)
    Settings.Aimbot = state
end)

CreateSlider("FOV", 100, 1200, Settings.AimbotFOV, Color3.fromRGB(0, 200, 255), "", function(value)
    Settings.AimbotFOV = value
end)

CreateSlider("PREVISÃO", 0, 0.5, Settings.AimbotPrediction, Color3.fromRGB(255, 255, 0), "", function(value)
    Settings.AimbotPrediction = value
end)

CreateDropdown("PARTE", {"Head", "Torso", "Root"}, Settings.TargetPart, function(part)
    Settings.TargetPart = part
end)

CreateSection("🚀 VOO", "🚀")

local FlyBtn = CreateToggle("VOO (TECLA X)", "Voe livremente (WASD + Espaço/Ctrl) - Sistema otimizado", Settings.Fly, function(state)
    Settings.Fly = state
    if not state then
        DisableFly()  -- Usa a função de desabilitar do seu sistema
    end
end)

CreateSlider("VELOCIDADE DO VOO", 30, 200, Settings.FlySpeed, Color3.fromRGB(0, 255, 0), "", function(value)
    Settings.FlySpeed = value
    -- A velocidade é usada diretamente no UpdateFly
end)

local SpeedBtn = CreateToggle("SUPER VELOCIDADE (TECLA V)", "Aumenta velocidade de movimento", Settings.Speed, function(state)
    Settings.Speed = state
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = state and Settings.WalkSpeed or 16
    end
end)

CreateSlider("WALK SPEED", 16, 150, Settings.WalkSpeed, Color3.fromRGB(255, 165, 0), "", function(value)
    Settings.WalkSpeed = value
    if Settings.Speed and Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = value
    end
end)

CreateSection("👁️ ESP", "👁️")

local ESPBtn = CreateToggle("ESP (TECLA J)", "Mostra jogadores através das paredes", Settings.ESP, function(state)
    Settings.ESP = state
    for _, esp in pairs(ESPs) do
        if esp and esp.Gui then
            esp.Gui.Enabled = state
        end
    end
end)

CreateSlider("TAMANHO TEXTO", 8, 24, Settings.ESPTextSize, Color3.fromRGB(255, 255, 255), "", function(value)
    Settings.ESPTextSize = value
    RecreateAllESP()
end)

CreateSlider("LARGURA", 100, 300, Settings.ESPWidth, Color3.fromRGB(255, 0, 0), "", function(value)
    Settings.ESPWidth = value
    RecreateAllESP()
end)

CreateSlider("ALTURA", 40, 120, Settings.ESPHeight, Color3.fromRGB(255, 0, 0), "", function(value)
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
    -- Atualizar ESP
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
    
    -- Aimbot
    UpdateAimbot()
    
    -- Voo (usando seu sistema integrado)
    UpdateFly()
end)

-- SISTEMA DE TECLAS
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Settings.AimbotKey then
        Settings.Aimbot = not Settings.Aimbot
        AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
        if AimbotBtn:FindFirstChild("Frame") then
            AimbotBtn:FindFirstChild("Frame").BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        end
    elseif input.KeyCode == Settings.FlyKey then
        Settings.Fly = not Settings.Fly
        FlyBtn.BackgroundColor3 = Settings.Fly and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
        if FlyBtn:FindFirstChild("Frame") then
            FlyBtn:FindFirstChild("Frame").BackgroundColor3 = Settings.Fly and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        end
        if not Settings.Fly then
            DisableFly()  -- Usa a função de desabilitar do seu sistema
        end
    elseif input.KeyCode == Settings.SpeedKey then  -- TECLA V
        Settings.Speed = not Settings.Speed
        SpeedBtn.BackgroundColor3 = Settings.Speed and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
        if SpeedBtn:FindFirstChild("Frame") then
            SpeedBtn:FindFirstChild("Frame").BackgroundColor3 = Settings.Speed and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        end
        if Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = Settings.Speed and Settings.WalkSpeed or 16
        end
    elseif input.KeyCode == Settings.ESPKey then
        Settings.ESP = not Settings.ESP
        ESPBtn.BackgroundColor3 = Settings.ESP and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
        if ESPBtn:FindFirstChild("Frame") then
            ESPBtn:FindFirstChild("Frame").BackgroundColor3 = Settings.ESP and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
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

-- Limpeza quando o personagem morre
Player.CharacterRemoving:Connect(DisableFly)

-- Notificação
local Notif = Instance.new("Frame")
Notif.Size = UDim2.new(0, 350, 0, 60)
Notif.Position = UDim2.new(0.5, -175, 0.1, -100)
Notif.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
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
NotifDesc.Text = "🎯 K | 🚀 X | ⚡ V | 👁️ J | RightControl"
NotifDesc.TextColor3 = Color3.fromRGB(255, 0, 0)
NotifDesc.Font = Enum.Font.GothamBold
NotifDesc.TextSize = 14
NotifDesc.Parent = Notif

-- Animação de entrada
Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, 0), "Out", "Quad", 0.5, true)
wait(3)
Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, -100), "Out", "Quad", 0.5, true)
wait(0.5)
Notif:Destroy()

print("⚡ Practice7 Perfeito carregado!")
print("🎯 Aimbot: K + Botão Direito")
print("🚀 Voo: X + WASD + Espaço/Ctrl (Sistema otimizado)")
print("⚡ Super Velocidade: V")
print("👁️ ESP: J (Tamanho ajustável)")
print("📌 Menu: RightControl")
print("✅ Velocidade do voo ajustável pelo slider no menu!")
