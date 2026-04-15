--[[
    PRACTICE7 CHEAT - SISTEMA DE KEY
    Apenas usuários autorizados podem usar
    Criado por Nathan goat aura farmer
--]]

-- ============================================
-- SISTEMA DE KEY (VERSÃO OFFLINE)
-- ============================================

-- Lista de keys válidas (você adiciona as keys aqui)
local ValidKeys = {
    -- Key de demonstração
    ["PRACTICE7-FREE-TRIAL"] = {
        user = "Demonstração",
        expires = "2025-12-31",
        type = "Trial"
    },
    -- Key pessoal do Nathan
    ["NATHAN-2024-001"] = {
        user = "Nathan",
        expires = "2026-12-31",
        type = "Vitalício"
    },
    -- Keys para clientes (adicione aqui as keys que você vender)
    ["COMPRADOR1-2024"] = {
        user = "João",
        expires = "2025-06-30",
        type = "Mensal"
    },
    -- Exemplo de key mensal
    ["MENSAL-001-2025"] = {
        user = "Cliente Mensal",
        expires = "2025-05-15",
        type = "Mensal"
    },
    -- Exemplo de key trimestral
    ["TRIMESTRAL-001-2025"] = {
        user = "Cliente Trimestral",
        expires = "2025-07-15",
        type = "Trimestral"
    },
    -- Exemplo de key anual
    ["ANUAL-001-2025"] = {
        user = "Cliente Anual",
        expires = "2026-04-15",
        type = "Anual"
    }
}

-- Variáveis
local KeyVerified = false
local Player = game:GetService("Players").LocalPlayer

-- ============================================
-- FUNÇÃO PARA VERIFICAR KEY
-- ============================================
local function CheckKey(key)
    local keyData = ValidKeys[key]
    
    if not keyData then
        return false, "Key inválida! Verifique e tente novamente."
    end
    
    -- Verificar expiração
    local currentDate = os.date("%Y-%m-%d")
    if currentDate > keyData.expires then
        return false, "Sua key expirou em " .. keyData.expires
    end
    
    return true, "Key válida! Bem-vindo, " .. keyData.user .. " (" .. keyData.type .. ")"
end

-- ============================================
-- INTERFACE PARA INSERIR KEY
-- ============================================
local function CreateKeyUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Practice7_KeySystem"
    ScreenGui.Parent = Player:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Fundo escuro
    local Background = Instance.new("Frame")
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 0.8
    Background.Parent = ScreenGui
    
    -- Card principal
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 450, 0, 380)
    Card.Position = UDim2.new(0.5, -225, 0.5, -190)
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
    
    -- Título animado
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Position = UDim2.new(0, 0, 0, 15)
    Title.BackgroundTransparency = 1
    Title.Text = "🎯 PRACTICE7 CHEAT 🎯"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 28
    Title.Parent = Card
    
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
    
    -- Subtítulo
    local Subtitle = Instance.new("TextLabel")
    Subtitle.Size = UDim2.new(1, 0, 0, 30)
    Subtitle.Position = UDim2.new(0, 0, 0, 75)
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
    
    -- Informações de contato
    local InfoLabel = Instance.new("TextLabel")
    InfoLabel.Size = UDim2.new(1, 0, 0, 40)
    InfoLabel.Position = UDim2.new(0, 0, 0, 310)
    InfoLabel.BackgroundTransparency = 1
    InfoLabel.Text = "💎 Compre sua key com Nathan\n📞 Contato no Discord"
    InfoLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    InfoLabel.Font = Enum.Font.Gotham
    InfoLabel.TextSize = 11
    InfoLabel.Parent = Card
    
    -- Efeitos do botão
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
        
        local success, message = CheckKey(key)
        
        if success then
            StatusLabel.Text = "✅ " .. message
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            KeyVerified = true
            
            -- Animação de saída
            Card:TweenPosition(UDim2.new(0.5, -225, 0.5, 400), "Out", "Quad", 0.5, true)
            Background:TweenSize(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
            wait(0.5)
            ScreenGui:Destroy()
            
            -- Carregar o cheat
            LoadCheat()
        else
            StatusLabel.Text = "❌ " .. message
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
    
    VerifyButton.MouseButton1Click:Connect(AttemptVerification)
    
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
    
    -- Serviços
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local Mouse = Player:GetMouse()
    local Camera = workspace.CurrentCamera
    
    wait(0.5)
    
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
    
    -- Frame principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 320, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 0)
    MainFrame.BackgroundTransparency = 0.05
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui
    MainFrame.Visible = true
    
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
    Container.CanvasSize = UDim2.new(0, 0, 0, 550)
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
    
    -- Função para criar toggle
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
        BtnDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
        BtnDesc.Font = Enum.Font.Gotham
        BtnDesc.TextSize = 11
        BtnDesc.TextXAlignment = Enum.TextXAlignment.Left
        BtnDesc.Parent = Button
        
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
    local function CreateSlider(text, min, max, default, color, suffix, callback)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.95, 0, 0, 60)
        Frame.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
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
    
    -- Criar menu
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
    
    CreateSection("🚀 VOO", "🚀")
    local FlyBtn = CreateToggle("VOO (TECLA X)", "Voe livremente (WASD + Espaço/Ctrl)", Settings.Fly, function(state)
        Settings.Fly = state
        if not state then
            if FlyBV then FlyBV:Destroy() end
            if FlyBG then FlyBG:Destroy() end
            FlyBV = nil
            FlyBG = nil
            if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                Player.Character.Humanoid.PlatformStand = false
            end
        end
    end)
    
    CreateSlider("VELOCIDADE DO VOO", 30, 200, Settings.FlySpeed, Color3.fromRGB(0, 255, 0), "", function(value)
        Settings.FlySpeed = value
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
    
    CreateSection("⚡ EXTRAS", "⚡")
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
    
    -- Função para criar ESP
    local function CreateESP(player)
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
    
    -- Função para atualizar ESP
    local function UpdateESP()
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
    end
    
    -- Função de aimbot
    local function UpdateAimbot()
        if not Settings.Aimbot or not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then return end
        
        local closestTarget = nil
        local closestDist = Settings.AimbotFOV
        local mousePos = Vector2.new(Mouse.X, Mouse.Y)
        
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Player and player.Character then
                local targetPart = player.Character:FindFirstChild(Settings.TargetPart) or player.Character:FindFirstChild("Head")
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
    
    -- Criar ESP para todos
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
    
    -- Anti AFK
    if Settings.AntiAfk then
        local VirtualUser = game:GetService("VirtualUser")
        AntiAfkConnection = RunService.Heartbeat:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
    
    -- Loop principal
    RunService.RenderStepped:Connect(function()
        UpdateESP()
        UpdateAimbot()
        
        -- Sistema de voo
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
    
    -- Notificação de carregamento
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
-- INICIAR O SISTEMA
-- ============================================
CreateKeyUI()
