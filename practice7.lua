--[[
    PRACTICE7 CHEAT - SISTEMA DE KEY
    Apenas usuários autorizados podem usar
--]]

-- Configuração
local KEY_URL = "https://raw.githubusercontent.com/SEU_USUARIO/Practice7-Cheat/main/keys.json"
local SCRIPT_VERSION = "2.5.0"

-- Variáveis
local KeyVerified = false
local RetryCount = 0
local MaxRetries = 3

-- Serviços
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

-- ============================================
-- FUNÇÃO PARA VERIFICAR KEY
-- ============================================
local function VerifyKey(key)
    local success, response = pcall(function()
        return game:HttpGet(KEY_URL)
    end)
    
    if not success then
        return false, "Não foi possível conectar ao servidor de verificação."
    end
    
    local data = HttpService:JSONDecode(response)
    
    for _, keyData in ipairs(data.keys) do
        if keyData.key == key then
            -- Verificar expiração
            if keyData.expires then
                local currentDate = os.date("%Y-%m-%d")
                if currentDate > keyData.expires then
                    return false, "Sua key expirou!"
                end
            end
            return true, "Key válida! Bem-vindo, " .. keyData.user
        end
    end
    
    return false, "Key inválida! Verifique e tente novamente."
end

-- ============================================
-- INTERFACE DE INSERIR KEY
-- ============================================
local function CreateKeyUI()
    -- Tela escura
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Practice7_KeySystem"
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Fundo
    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 0.7
    Background.Parent = ScreenGui
    
    -- Card principal
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 450, 0, 350)
    Card.Position = UDim2.new(0.5, -225, 0.5, -175)
    Card.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    Card.BorderSizePixel = 0
    Card.Parent = ScreenGui
    
    local CardCorner = Instance.new("UICorner")
    CardCorner.CornerRadius = UDim.new(0, 15)
    CardCorner.Parent = Card
    
    -- Borda vermelha
    local Border = Instance.new("Frame")
    Border.Size = UDim2.new(1, 0, 1, 0)
    Border.BackgroundTransparency = 1
    Border.BorderSizePixel = 2
    Border.BorderColor3 = Color3.fromRGB(255, 0, 0)
    Border.Parent = Card
    
    local BorderCorner = Instance.new("UICorner")
    BorderCorner.CornerRadius = UDim.new(0, 15)
    BorderCorner.Parent = Border
    
    -- Título
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Position = UDim2.new(0, 0, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "🎯 PRACTICE7 CHEAT 🎯"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 28
    Title.Parent = Card
    
    -- Animação RGB no título
    spawn(function()
        while ScreenGui and ScreenGui.Parent do
            for hue = 0, 1, 0.02 do
                if not ScreenGui.Parent then break end
                Title.TextColor3 = Color3.fromHSV(hue, 1, 1)
                wait(0.03)
            end
        end
    end)
    
    -- Subtítulo
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, 0, 0, 30)
    Subtitle.Position = UDim2.new(0, 0, 0, 70)
    Subtitle.BackgroundTransparency = 1
    Subtitle.Text = "INSIRA SUA KEY PARA ACESSAR"
    Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    Subtitle.Font = Enum.Font.Gotham
    Subtitle.TextSize = 14
    Subtitle.Parent = Card
    
    -- Campo de key
    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(0.8, 0, 0, 50)
    KeyInput.Position = UDim2.new(0.1, 0, 0, 120)
    KeyInput.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    KeyInput.BorderSizePixel = 0
    KeyInput.PlaceholderText = "COLE SUA KEY AQUI"
    KeyInput.PlaceholderColor3 = Color3.fromRGB(150, 0, 0)
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.TextSize = 16
    KeyInput.Text = ""
    KeyInput.ClearTextOnFocus = false
    KeyInput.Parent = Card
    
    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 8)
    InputCorner.Parent = KeyInput
    
    -- Botão verificar
    local VerifyButton = Instance.new("TextButton")
    VerifyButton.Size = UDim2.new(0.8, 0, 0, 45)
    VerifyButton.Position = UDim2.new(0.1, 0, 0, 190)
    VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    VerifyButton.BorderSizePixel = 0
    VerifyButton.Text = "VERIFICAR KEY"
    VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyButton.Font = Enum.Font.GothamBold
    VerifyButton.TextSize = 18
    VerifyButton.Parent = Card
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = VerifyButton
    
    -- Mensagem de status
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
    StatusLabel.Position = UDim2.new(0.05, 0, 0, 255)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "Aguardando key..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextSize = 12
    StatusLabel.TextWrapped = true
    StatusLabel.Parent = Card
    
    -- Informações
    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size = UDim2.new(1, 0, 0, 30)
    InfoLabel.Position = UDim2.new(0, 0, 0, 310)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Text = "💎 Compre sua key com Nathan"
    InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    InfoLabel.Font = Enum.Font.Gotham
    InfoLabel.TextSize = 11
    InfoLabel.Parent = Card
    
    -- Efeito hover no botão
    VerifyButton.MouseEnter:Connect(function()
        VerifyButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end)
    
    VerifyButton.MouseLeave:Connect(function()
        VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end)
    
    -- Função de verificação
    local function AttemptVerification()
        local key = KeyInput.Text
        if key == "" then
            StatusLabel.Text = "⚠️ Digite uma key!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            return
        end
        
        StatusLabel.Text = "🔍 Verificando key..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        
        local success, message = VerifyKey(key)
        
        if success then
            StatusLabel.Text = "✅ " .. message
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            KeyVerified = true
            
            -- Animação de fade out
            Card:TweenPosition(UDim2.new(0.5, -225, 0.5, 400), "Out", "Quad", 0.5, true)
            Background:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
            wait(0.5)
            ScreenGui:Destroy()
            
            -- Carregar o cheat
            LoadCheat()
        else
            RetryCount = RetryCount + 1
            local remaining = MaxRetries - RetryCount
            StatusLabel.Text = "❌ " .. message .. " (Restam " .. remaining .. " tentativas)"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            
            if RetryCount >= MaxRetries then
                StatusLabel.Text = "❌ Muitas tentativas inválidas! O cheat será fechado."
                wait(3)
                game:Shutdown()
            end
        end
    end
    
    VerifyButton.MouseButton1Click:Connect(AttemptVerification)
    
    -- Enter no campo também verifica
    KeyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            AttemptVerification()
        end
    end)
    
    return ScreenGui
end

-- ============================================
-- CARREGAR O CHEAT (APÓS KEY VÁLIDA)
-- ============================================
local function LoadCheat()
    print("═══════════════════════════════════════")
    print("     🎯 PRACTICE7 CHEAT CARREGADO 🎯     ")
    print("═══════════════════════════════════════")
    print("⚡ Funcionalidades:")
    print("   • Aimbot Perfeito")
    print("   • Voo (Fly)")
    print("   • ESP Wallhack")
    print("   • Anti AFK")
    print("   • Super Velocidade")
    print("═══════════════════════════════════════")
    print("💎 Criado por Nathan goat aura farmer")
    print("═══════════════════════════════════════")
    
    wait(1)
    
    -- Configurações
    local Settings = {
        Aimbot = false,
        Fly = false,
        ESP = false,
        Speed = false,
        AntiAfk = false,
        FlySpeed = 75,
        WalkSpeed = 55,
        AimbotKey = Enum.KeyCode.K,
        FlyKey = Enum.KeyCode.X,
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
    
    -- Criar GUI (igual ao seu script original)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Practice7_Perfect"
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    
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
        while ScreenGui and ScreenGui.Parent do
            for hue = 0, 1, 0.02 do
                if not ScreenGui.Parent then break end
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
    
    -- Funções auxiliares
    local function CreateSection(title, icon)
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
    
    local function CreateToggle(text, description, defaultState, callback)
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
    
    local function CreateSlider(text, min, max, default, color, suffix, callback)
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
    
    -- Variáveis do cheat
    local ESPs = {}
    local FlyBV = nil
    local FlyBG = nil
    local AntiAfkConnection = nil
    
    -- Funções do cheat (aqui entraria todo o resto do seu script)
    -- [INSIRA AQUI O RESTO DO SEU SCRIPT ORIGINAL]
    
    -- Por enquanto, uma versão simplificada
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local Mouse = Player:GetMouse()
    
    -- Criar menu
    CreateSection("🎯 AIMBOT", "🎯")
    local AimbotBtn = CreateToggle("AIMBOT", "Ativar mira automática (Botão Direito)", Settings.Aimbot, function(state)
        Settings.Aimbot = state
    end)
    
    CreateSlider("FOV", 100, 1200, Settings.AimbotFOV, Color3.fromRGB(0, 200, 255), "", function(value)
        Settings.AimbotFOV = value
    end)
    
    CreateSection("🚀 VOO", "🚀")
    local FlyBtn = CreateToggle("VOO (TECLA X)", "Voe livremente", Settings.Fly, function(state)
        Settings.Fly = state
    end)
    
    CreateSlider("VELOCIDADE DO VOO", 30, 200, Settings.FlySpeed, Color3.fromRGB(0, 255, 0), "", function(value)
        Settings.FlySpeed = value
    end)
    
    CreateSection("👁️ ESP", "👁️")
    local ESPBtn = CreateToggle("ESP (TECLA J)", "Mostra jogadores através das paredes", Settings.ESP, function(state)
        Settings.ESP = state
    end)
    
    CreateSection("⚡ EXTRAS", "⚡")
    local SpeedBtn = CreateToggle("SUPER VELOCIDADE (TECLA V)", "Aumenta velocidade", Settings.Speed, function(state)
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
    
    -- Loop principal simplificado
    RunService.RenderStepped:Connect(function()
        if Settings.Speed and Player.Character and Player.Character:FindFirstChild("Humanoid") then
            Player.Character.Humanoid.WalkSpeed = Settings.WalkSpeed
        end
        
        -- Voo
        if Settings.Fly and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            local root = Player.Character.HumanoidRootPart
            local humanoid = Player.Character:FindFirstChild("Humanoid")
            
            if humanoid then
                humanoid.PlatformStand = true
            end
            
            if not FlyBV or not FlyBV.Parent then
                FlyBV = Instance.new("BodyVelocity")
                FlyBV.MaxForce = Vector3.new(1, 1, 1) * 9e9
                FlyBV.Parent = root
            end
            
            if not FlyBG or not FlyBG.Parent then
                FlyBG = Instance.new("BodyGyro")
                FlyBG.MaxTorque = Vector3.new(1, 1, 1) * 9e9
                FlyBG.Parent = root
            end
            
            FlyBG.CFrame = Camera.CFrame
            
            local direction = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then direction = direction + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then direction = direction - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then direction = direction - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then direction = direction + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then direction = direction + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then direction = direction - Vector3.new(0, 1, 0) end
            
            if direction.Magnitude > 0 then
                FlyBV.Velocity = direction.Unit * Settings.FlySpeed
            else
                FlyBV.Velocity = Vector3.new()
            end
        elseif FlyBV then
            if FlyBV then FlyBV:Destroy() end
            if FlyBG then FlyBG:Destroy() end
            FlyBV = nil
            FlyBG = nil
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.PlatformStand = false
            end
        end
    end)
    
    -- Sistema de teclas
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Settings.AimbotKey then
            Settings.Aimbot = not Settings.Aimbot
            if AimbotBtn then
                AimbotBtn.BackgroundColor3 = Settings.Aimbot and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
            end
        elseif input.KeyCode == Settings.FlyKey then
            Settings.Fly = not Settings.Fly
            if FlyBtn then
                FlyBtn.BackgroundColor3 = Settings.Fly and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
            end
        elseif input.KeyCode == Settings.SpeedKey then
            Settings.Speed = not Settings.Speed
            if SpeedBtn then
                SpeedBtn.BackgroundColor3 = Settings.Speed and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
            end
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.WalkSpeed = Settings.Speed and Settings.WalkSpeed or 16
            end
        elseif input.KeyCode == Settings.ESPKey then
            Settings.ESP = not Settings.ESP
            if ESPBtn then
                ESPBtn.BackgroundColor3 = Settings.ESP and Color3.fromRGB(25, 0, 0) or Color3.fromRGB(20, 0, 0)
            end
        elseif input.KeyCode == Settings.MenuKey then
            Settings.MenuVisible = not Settings.MenuVisible
            MainFrame.Visible = Settings.MenuVisible
        end
    end)
    
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
    NotifTitle.Text = "⚡ PRACTICE7 CARREGADO ⚡"
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
    
    Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, 0), "Out", "Quad", 0.5, true)
    wait(3)
    Notif:TweenPosition(UDim2.new(0.5, -175, 0.1, -100), "Out", "Quad", 0.5, true)
    wait(0.5)
    Notif:Destroy()
    
    print("✅ Practice7 Cheat carregado com sucesso!")
end

-- ============================================
-- INICIAR SISTEMA DE KEY
-- ============================================
CreateKeyUI()
