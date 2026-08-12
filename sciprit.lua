loadstring([[
-- Hizmetler
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Ana GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PirexC_Modern_GUI_v9"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- FOV Çemberi (Drawing API)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = false
FOVCircle.Thickness = 1.5
FOVCircle.NumSides = 64
FOVCircle.Color = Color3.fromRGB(180, 130, 220)
FOVCircle.Filled = false
FOVCircle.Transparency = 0.7

-- Özelleştirilebilir Renk Deposu
local CustomConfig = {
	Name = Color3.fromRGB(255, 255, 255),
	HealthDist = Color3.fromRGB(90, 255, 120),
	Box = Color3.fromRGB(200, 150, 255),
	Skeleton = Color3.fromRGB(255, 255, 255),
	GlowEffectType = "Super Nova (Aşırı Parlak Neon)"
}

-- Key Sistemi
local KeySystemFrame = Instance.new("Frame")
KeySystemFrame.Name = "KeySystemFrame"
KeySystemFrame.Parent = ScreenGui
KeySystemFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
KeySystemFrame.BorderSizePixel = 0
KeySystemFrame.Position = UDim2.new(0.5, -160, 0.5, -110)
KeySystemFrame.Size = UDim2.new(0, 320, 0, 220)
KeySystemFrame.Active = true
KeySystemFrame.Draggable = true

local UICornerKey = Instance.new("UICorner")
UICornerKey.CornerRadius = UDim.new(0, 10)
UICornerKey.Parent = KeySystemFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Parent = KeySystemFrame
KeyTitle.BackgroundTransparency = 1
KeyTitle.Position = UDim2.new(0, 0, 0.1, 0)
KeyTitle.Size = UDim2.new(1, 0, 0, 30)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Text = "PirexC • Güvenli Giriş"
KeyTitle.TextColor3 = Color3.fromRGB(200, 150, 255)
KeyTitle.TextSize = 20

local KeyBox = Instance.new("TextBox")
KeyBox.Parent = KeySystemFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
KeyBox.BorderSizePixel = 0
KeyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Font = Enum.Font.Gotham
KeyBox.PlaceholderText = "Key giriniz (sexs)..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
KeyBox.TextSize = 14

local UICornerBox = Instance.new("UICorner")
UICornerBox.CornerRadius = UDim.new(0, 8)
UICornerBox.Parent = KeyBox

local LoginButton = Instance.new("TextButton")
LoginButton.Parent = KeySystemFrame
LoginButton.BackgroundColor3 = Color3.fromRGB(110, 50, 170)
LoginButton.BorderSizePixel = 0
LoginButton.Position = UDim2.new(0.1, 0, 0.72, 0)
LoginButton.Size = UDim2.new(0.8, 0, 0, 40)
LoginButton.Font = Enum.Font.GothamBold
LoginButton.Text = "GİRİŞ YAP"
LoginButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginButton.TextSize = 14

local UICornerBtn = Instance.new("UICorner")
UICornerBtn.CornerRadius = UDim.new(0, 8)
UICornerBtn.Parent = LoginButton

-- Ana Ekran
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 15, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.1, 0)
MainFrame.Size = UDim2.new(0, 380, 0, 440)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local UICornerMain = Instance.new("UICorner")
UICornerMain.CornerRadius = UDim.new(0, 14)
UICornerMain.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(24, 20, 35)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 45)

local UICornerTop = Instance.new("UICorner")
UICornerTop.CornerRadius = UDim.new(0, 14)
UICornerTop.Parent = TopBar

local TopBarCover = Instance.new("Frame")
TopBarCover.Parent = TopBar
TopBarCover.BackgroundColor3 = Color3.fromRGB(24, 20, 35)
TopBarCover.BorderSizePixel = 0
TopBarCover.Position = UDim2.new(0, 0, 0.5, 0)
TopBarCover.Size = UDim2.new(1, 0, 0.5, 0)

local MainTitle = Instance.new("TextLabel")
MainTitle.Parent = TopBar
MainTitle.BackgroundTransparency = 1
MainTitle.Position = UDim2.new(0, 15, 0, 0)
MainTitle.Size = UDim2.new(0, 100, 1, 0)
MainTitle.Font = Enum.Font.GothamBold
MainTitle.Text = "PirexC V3"
MainTitle.TextColor3 = Color3.fromRGB(210, 170, 255)
MainTitle.TextSize = 15
MainTitle.TextXAlignment = Enum.TextXAlignment.Left

local TabAimbotBtn = Instance.new("TextButton")
TabAimbotBtn.Parent = TopBar
TabAimbotBtn.BackgroundColor3 = Color3.fromRGB(110, 50, 170)
TabAimbotBtn.Position = UDim2.new(0, 125, 0, 8)
TabAimbotBtn.Size = UDim2.new(0, 52, 0, 28)
TabAimbotBtn.Font = Enum.Font.GothamBold
TabAimbotBtn.Text = "Aim"
TabAimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TabAimbotBtn.TextSize = 12
local UICornerTab1 = Instance.new("UICorner"); UICornerTab1.CornerRadius = UDim.new(0, 6); UICornerTab1.Parent = TabAimbotBtn

local TabVisualsBtn = Instance.new("TextButton")
TabVisualsBtn.Parent = TopBar
TabVisualsBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
TabVisualsBtn.Position = UDim2.new(0, 182, 0, 8)
TabVisualsBtn.Size = UDim2.new(0, 62, 0, 28)
TabVisualsBtn.Font = Enum.Font.GothamBold
TabVisualsBtn.Text = "Visuals"
TabVisualsBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
TabVisualsBtn.TextSize = 12
local UICornerTab2 = Instance.new("UICorner"); UICornerTab2.CornerRadius = UDim.new(0, 6); UICornerTab2.Parent = TabVisualsBtn

local ThemeButton = Instance.new("TextButton")
ThemeButton.Parent = TopBar
ThemeButton.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
ThemeButton.Position = UDim2.new(1, -78, 0, 8)
ThemeButton.Size = UDim2.new(0, 32, 0, 28)
ThemeButton.Font = Enum.Font.GothamBold
ThemeButton.Text = "🎨"
ThemeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ThemeButton.TextSize = 12
local UICornerTheme = Instance.new("UICorner"); UICornerTheme.CornerRadius = UDim.new(0, 6); UICornerTheme.Parent = ThemeButton

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
MinimizeButton.Position = UDim2.new(1, -40, 0, 8)
MinimizeButton.Size = UDim2.new(0, 32, 0, 28)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 15
local UICornerMin = Instance.new("UICorner"); UICornerMin.CornerRadius = UDim.new(0, 6); UICornerMin.Parent = MinimizeButton

-- Aimbot Sekme
local AimbotContainer = Instance.new("Frame")
AimbotContainer.Parent = MainFrame
AimbotContainer.BackgroundTransparency = 1
AimbotContainer.Position = UDim2.new(0, 0, 0, 50)
AimbotContainer.Size = UDim2.new(1, 0, 1, -50)
AimbotContainer.Visible = true

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Parent = AimbotContainer
AimbotToggle.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
AimbotToggle.Position = UDim2.new(0.06, 0, 0.02, 0)
AimbotToggle.Size = UDim2.new(0.88, 0, 0, 36)
AimbotToggle.Font = Enum.Font.GothamBold
AimbotToggle.Text = "Aimbot: KAPALI"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 90, 90)
AimbotToggle.TextSize = 13
local UICornerAT = Instance.new("UICorner"); UICornerAT.CornerRadius = UDim.new(0, 8); UICornerAT.Parent = AimbotToggle

local ModeButton = Instance.new("TextButton")
ModeButton.Parent = AimbotContainer
ModeButton.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
ModeButton.Position = UDim2.new(0.06, 0, 0.16, 0)
ModeButton.Size = UDim2.new(0.88, 0, 0, 32)
ModeButton.Font = Enum.Font.Gotham
ModeButton.Text = "Mod: Hold (Bas-Tut)"
ModeButton.TextColor3 = Color3.fromRGB(210, 210, 230)
ModeButton.TextSize = 12
local UICornerMB = Instance.new("UICorner"); UICornerMB.CornerRadius = UDim.new(0, 8); UICornerMB.Parent = ModeButton

local KeybindButton = Instance.new("TextButton")
KeybindButton.Parent = AimbotContainer
KeybindButton.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
KeybindButton.Position = UDim2.new(0.06, 0, 0.30, 0)
KeybindButton.Size = UDim2.new(0.88, 0, 0, 32)
KeybindButton.Font = Enum.Font.Gotham
KeybindButton.Text = "Tuş: Sağ Tık (Değiştir)"
KeybindButton.TextColor3 = Color3.fromRGB(210, 210, 230)
KeybindButton.TextSize = 12
local UICornerKB = Instance.new("UICorner"); UICornerKB.CornerRadius = UDim.new(0, 8); UICornerKB.Parent = KeybindButton

local SmoothBox = Instance.new("TextBox")
SmoothBox.Parent = AimbotContainer
SmoothBox.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
SmoothBox.Position = UDim2.new(0.06, 0, 0.44, 0)
SmoothBox.Size = UDim2.new(0.88, 0, 0, 34)
SmoothBox.Font = Enum.Font.Gotham
SmoothBox.PlaceholderText = "Smooth Değeri (Örn: 5)"
SmoothBox.Text = "5"
SmoothBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothBox.TextSize = 12
local UICornerSB = Instance.new("UICorner"); UICornerSB.CornerRadius = UDim.new(0, 8); UICornerSB.Parent = SmoothBox

local FovExpandBtn = Instance.new("TextButton")
FovExpandBtn.Parent = AimbotContainer
FovExpandBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50)
FovExpandBtn.Position = UDim2.new(0.06, 0, 0.58, 0)
FovExpandBtn.Size = UDim2.new(0, 34, 0, 34)
FovExpandBtn.Font = Enum.Font.GothamBold
FovExpandBtn.Text = "+"
FovExpandBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FovExpandBtn.TextSize = 15
local UICornerFEB = Instance.new("UICorner"); UICornerFEB.CornerRadius = UDim.new(0, 8); UICornerFEB.Parent = FovExpandBtn

local FovToggle = Instance.new("TextButton")
FovToggle.Parent = AimbotContainer
FovToggle.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
FovToggle.Position = UDim2.new(0.16, 0, 0.58, 0)
FovToggle.Size = UDim2.new(0.78, 0, 0, 34)
FovToggle.Font = Enum.Font.GothamBold
FovToggle.Text = "FOV Çemberi: KAPALI"
FovToggle.TextColor3 = Color3.fromRGB(255, 90, 90)
FovToggle.TextSize = 12
local UICornerFT = Instance.new("UICorner"); UICornerFT.CornerRadius = UDim.new(0, 8); UICornerFT.Parent = FovToggle

local FovSettingsPanel = Instance.new("Frame")
FovSettingsPanel.Parent = AimbotContainer
FovSettingsPanel.BackgroundColor3 = Color3.fromRGB(22, 18, 30)
FovSettingsPanel.Position = UDim2.new(0.06, 0, 0.70, 0)
FovSettingsPanel.Size = UDim2.new(0.88, 0, 0, 38)
FovSettingsPanel.Visible = false
local UICornerFSP = Instance.new("UICorner"); UICornerFSP.CornerRadius = UDim.new(0, 8); UICornerFSP.Parent = FovSettingsPanel

local FovInputBox = Instance.new("TextBox")
FovInputBox.Parent = FovSettingsPanel
FovInputBox.BackgroundColor3 = Color3.fromRGB(32, 26, 45)
FovInputBox.Position = UDim2.new(0.04, 0, 0.15, 0)
FovInputBox.Size = UDim2.new(0.92, 0, 0, 26)
FovInputBox.Font = Enum.Font.Gotham
FovInputBox.PlaceholderText = "FOV Boyutu (Max: 144)"
FovInputBox.Text = "144"
FovInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FovInputBox.TextSize = 12
local UICornerFIB = Instance.new("UICorner"); UICornerFIB.CornerRadius = UDim.new(0, 6); UICornerFIB.Parent = FovInputBox

local SilentToggle = Instance.new("TextButton")
SilentToggle.Parent = AimbotContainer
SilentToggle.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
SilentToggle.Position = UDim2.new(0.06, 0, 0.83, 0)
SilentToggle.Size = UDim2.new(0.88, 0, 0, 34)
SilentToggle.Font = Enum.Font.GothamBold
SilentToggle.Text = "Silent Aim: KAPALI"
SilentToggle.TextColor3 = Color3.fromRGB(255, 90, 90)
SilentToggle.TextSize = 12
local UICornerST = Instance.new("UICorner"); UICornerST.CornerRadius = UDim.new(0, 8); UICornerST.Parent = SilentToggle

-- Visuals Sekme
local VisualsContainer = Instance.new("ScrollingFrame")
VisualsContainer.Parent = MainFrame
VisualsContainer.BackgroundTransparency = 1
VisualsContainer.Position = UDim2.new(0, 0, 0, 50)
VisualsContainer.Size = UDim2.new(1, 0, 1, -50)
VisualsContainer.Visible = false
VisualsContainer.CanvasSize = UDim2.new(0, 0, 0, 410)
VisualsContainer.ScrollBarThickness = 4

local function createColorPicker(parentBtn, colorKey)
	local picker = Instance.new("Frame")
	picker.Parent = VisualsContainer
	picker.BackgroundColor3 = Color3.fromRGB(20, 16, 28)
	picker.Position = UDim2.new(0.06, 0, 0, parentBtn.Position.Y.Offset + 42)
	picker.Size = UDim2.new(0.88, 0, 0, 155)
	picker.Visible = false
	picker.ZIndex = 15
	local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 8); corner.Parent = picker

	local lbl = Instance.new("TextLabel")
	lbl.Parent = picker; lbl.BackgroundTransparency = 1; lbl.Position = UDim2.new(0, 10, 0, 5); lbl.Size = UDim2.new(1, -20, 0, 20)
	lbl.Font = Enum.Font.GothamBold; lbl.Text = "Renk Düzenle (Palet)"; lbl.TextColor3 = Color3.fromRGB(200, 150, 255); lbl.TextSize = 12; lbl.ZIndex = 16

	local palette = Instance.new("TextButton")
	palette.Parent = picker; palette.BackgroundColor3 = Color3.fromRGB(255, 255, 255); palette.Position = UDim2.new(0.04, 0, 0.22, 0); palette.Size = UDim2.new(0, 170, 0, 110); palette.Text = ""; palette.ZIndex = 16
	local uig = Instance.new("UIGradient")
	uig.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
		ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 255, 0)),
		ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
		ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),
		ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 0, 255)),
		ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
		ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))
	})
	uig.Parent = palette

	local sliderBar = Instance.new("TextButton")
	sliderBar.Parent = picker; sliderBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255); sliderBar.Position = UDim2.new(0, 195, 0.22, 0); sliderBar.Size = UDim2.new(0, 22, 0, 110); sliderBar.Text = ""; sliderBar.ZIndex = 16
	local sbGrad = Instance.new("UIGradient")
	sbGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(128, 128, 128)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))})
	sbGrad.Rotation = 90; sbGrad.Parent = sliderBar

	local previewBox = Instance.new("Frame")
	previewBox.Parent = picker; previewBox.BackgroundColor3 = CustomConfig[colorKey]; previewBox.Position = UDim2.new(0, 230, 0.22, 0); previewBox.Size = UDim2.new(0, 68, 0, 110); previewBox.ZIndex = 16
	local pCorner = Instance.new("UICorner"); pCorner.CornerRadius = UDim.new(0, 6); pCorner.Parent = previewBox

	local hVal, sVal, vVal = 0, 1, 1
	local function updateColor()
		local finalColor = Color3.fromHSV(hVal, sVal, vVal)
		CustomConfig[colorKey] = finalColor
		previewBox.BackgroundColor3 = finalColor
	end

	palette.MouseButton1Down:Connect(function()
		local connection
		connection = RunService.RenderStepped:Connect(function()
			if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then connection:Disconnect() return end
			local mousePos = UserInputService:GetMouseLocation()
			local absPos = palette.AbsolutePosition
			local absSize = palette.AbsoluteSize
			hVal = math.clamp((mousePos.X - absPos.X) / absSize.X, 0, 1)
			sVal = 1 - math.clamp((mousePos.Y - absPos.Y) / absSize.Y, 0, 1)
			updateColor()
		end)
	end)

	sliderBar.MouseButton1Down:Connect(function()
		local connection
		connection = RunService.RenderStepped:Connect(function()
			if not UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then connection:Disconnect() return end
			local mousePos = UserInputService:GetMouseLocation()
			local absPos = sliderBar.AbsolutePosition
			local absSize = sliderBar.AbsoluteSize
			vVal = 1 - math.clamp((mousePos.Y - absPos.Y) / absSize.Y, 0, 1)
			updateColor()
		end)
	end)

	parentBtn.MouseButton1Click:Connect(function() picker.Visible = not picker.Visible end)
end

local function createGlowEffectSelector(parentBtn)
	local picker = Instance.new("Frame")
	picker.Parent = VisualsContainer
	picker.BackgroundColor3 = Color3.fromRGB(20, 16, 28)
	picker.Position = UDim2.new(0.06, 0, 0, parentBtn.Position.Y.Offset + 42)
	picker.Size = UDim2.new(0.88, 0, 0, 225)
	picker.Visible = false
	picker.ZIndex = 15
	local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 8); corner.Parent = picker

	local lbl = Instance.new("TextLabel")
	lbl.Parent = picker; lbl.BackgroundTransparency = 1; lbl.Position = UDim2.new(0, 10, 0, 5); lbl.Size = UDim2.new(1, -20, 0, 20)
	lbl.Font = Enum.Font.GothamBold; lbl.Text = "Süper Parlak Glow / Aura Stilleri"; lbl.TextColor3 = Color3.fromRGB(200, 150, 255); lbl.TextSize = 12; lbl.ZIndex = 16

	local effects = {
		"Super Nova (Aşırı Parlak Neon)",
		"Laser Beam (Göz Alıcı Mor Işın)",
		"Neon Pulse (Nefes Alma)",
		"Cyber Matrix (Yeşil Hacker)",
		"Fire Aura (Cehennem Alevi)",
		"Electric Plasma (Mimari Şimşek)",
		"Rainbow Rave (Rengarenk Diskotek)"
	}

	for i, effName in ipairs(effects) do
		local effBtn = Instance.new("TextButton")
		effBtn.Parent = picker
		effBtn.BackgroundColor3 = Color3.fromRGB(35, 28, 48)
		effBtn.Position = UDim2.new(0.04, 0, 0, 28 + ((i - 1) * 27))
		effBtn.Size = UDim2.new(0.92, 0, 0, 24)
		effBtn.Font = Enum.Font.Gotham
		effBtn.Text = effName
		effBtn.TextColor3 = Color3.fromRGB(220, 220, 240)
		effBtn.TextSize = 11
		effBtn.ZIndex = 16
		local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0, 6); c.Parent = effBtn

		effBtn.MouseButton1Click:Connect(function()
			CustomConfig.GlowEffectType = effName
			parentBtn.Text = "✓"
			picker.Visible = false
		end)
	end

	parentBtn.MouseButton1Click:Connect(function() picker.Visible = not picker.Visible end)
end

local function addVisualElement(posY, text, colorKey, isGlow)
	local toggleBtn = Instance.new("TextButton")
	toggleBtn.Parent = VisualsContainer
	toggleBtn.BackgroundColor3 = Color3.fromRGB(28, 24, 40)
	toggleBtn.Position = UDim2.new(0.06, 0, 0, posY)
	toggleBtn.Size = UDim2.new(0.72, 0, 0, 38)
	toggleBtn.Font = Enum.Font.GothamBold
	toggleBtn.Text = text .. ": KAPALI"
	toggleBtn.TextColor3 = Color3.fromRGB(255, 90, 90)
	toggleBtn.TextSize = 12
	local c1 = Instance.new("UICorner"); c1.CornerRadius = UDim.new(0, 8); c1.Parent = toggleBtn

	local colorBtn = Instance.new("TextButton")
	colorBtn.Parent = VisualsContainer
	colorBtn.BackgroundColor3 = Color3.fromRGB(45, 35, 65)
	colorBtn.Position = UDim2.new(0.80, 0, 0, posY + 4)
	colorBtn.Size = UDim2.new(0, 30, 0, 30)
	colorBtn.Font = Enum.Font.GothamBold
	colorBtn.Text = "+"
	colorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	colorBtn.TextSize = 14
	local c2 = Instance.new("UICorner"); c2.CornerRadius = UDim.new(0, 6); c2.Parent = colorBtn

	if isGlow then
		createGlowEffectSelector(colorBtn)
	elseif colorKey then
		createColorPicker(colorBtn, colorKey)
	else
		colorBtn.Visible = false
		toggleBtn.Size = UDim2.new(0.88, 0, 0, 38)
	end

	return toggleBtn
end

local NameEspToggle = addVisualElement(15, "İsim Göster", "Name")
local HealthEspToggle = addVisualElement(60, "Can Göster", "HealthDist")
local DistEspToggle = addVisualElement(105, "Mesafe Göster", "HealthDist")
local BoxEspToggle = addVisualElement(150, "Kutu (Box ESP)", "Box")
local SkeletonToggle = addVisualElement(195, "İskelet (Skeleton)", "Skeleton")
local GlowToggle = addVisualElement(240, "Glow / Aura Efekti", nil, true)
local CowboyHatToggle = addVisualElement(285, "Rainbow Cowboy Şapkası", nil, false)

-- Mantık Fonksiyonları
local aimbotEnabled, silentEnabled, fovEnabled = false, false, false
local aimKey = Enum.UserInputType.MouseButton2
local isKeyDown, bindingKey, toggleActiveState = false, false, false
local aimMode = "Hold"

local nameEspEnabled, healthEspEnabled, distEspEnabled, boxEspEnabled, skeletonEnabled, glowEnabled, cowboyHatEnabled = false, false, false, false, false, false, false
local espCache = {}

TabAimbotBtn.MouseButton1Click:Connect(function()
	AimbotContainer.Visible = true; VisualsContainer.Visible = false
	TabAimbotBtn.BackgroundColor3 = Color3.fromRGB(110, 50, 170); TabAimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabVisualsBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50); TabVisualsBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
end)

TabVisualsBtn.MouseButton1Click:Connect(function()
	AimbotContainer.Visible = false; VisualsContainer.Visible = true
	TabVisualsBtn.BackgroundColor3 = Color3.fromRGB(110, 50, 170); TabVisualsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabAimbotBtn.BackgroundColor3 = Color3.fromRGB(35, 30, 50); TabAimbotBtn.TextColor3 = Color3.fromRGB(150, 150, 170)
end)

LoginButton.MouseButton1Click:Connect(function()
	if KeyBox.Text == "sexs" then
		KeySystemFrame.Visible = false; MainFrame.Visible = true
	else
		KeyBox.Text = ""; KeyBox.PlaceholderText = "Hatalı! Key: sexs"
	end
end)

local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		MainFrame.Size = UDim2.new(0, 380, 0, 45); AimbotContainer.Visible = false; VisualsContainer.Visible = false; MinimizeButton.Text = "+"
	else
		MainFrame.Size = UDim2.new(0, 380, 0, 440)
		if TabAimbotBtn.BackgroundColor3 == Color3.fromRGB(110, 50, 170) then AimbotContainer.Visible = true else VisualsContainer.Visible = true end
		MinimizeButton.Text = "-"
	end
end)

local fovPanelOpen = false
FovExpandBtn.MouseButton1Click:Connect(function()
	fovPanelOpen = not fovPanelOpen
	FovSettingsPanel.Visible = fovPanelOpen
	FovExpandBtn.Text = fovPanelOpen and "-" or "+"
end)

AimbotToggle.MouseButton1Click:Connect(function()
	aimbotEnabled = not aimbotEnabled
	AimbotToggle.Text = "Aimbot: " .. (aimbotEnabled and "AÇIK" or "KAPALI")
	AimbotToggle.TextColor3 = aimbotEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
	if not aimbotEnabled then toggleActiveState = false end
end)

ModeButton.MouseButton1Click:Connect(function()
	if aimMode == "Hold" then aimMode = "Toggle"; ModeButton.Text = "Mod: Toggle (Tek Tıkla)" else aimMode = "Hold"; ModeButton.Text = "Mod: Hold (Bas-Tut)" end
	toggleActiveState = false
end)

KeybindButton.MouseButton1Click:Connect(function() bindingKey = true; KeybindButton.Text = "Bir tuşa basın..." end)

UserInputService.InputBegan:Connect(function(input)
	if bindingKey then
		if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.MouseButton1 then
			aimKey = input.KeyCode ~= Enum.KeyCode.Unknown and input.KeyCode or input.UserInputType
			KeybindButton.Text = "Tuş: " .. (input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or tostring(input.UserInputType):gsub("Enum.UserInputType.", ""))
			bindingKey = false
		end
	else
		if input.UserInputType == aimKey or input.KeyCode == aimKey then
			if aimMode == "Hold" then isKeyDown = true elseif aimMode == "Toggle" then toggleActiveState = not toggleActiveState end
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if aimMode == "Hold" and (input.UserInputType == aimKey or input.KeyCode == aimKey) then isKeyDown = false end
end)

FovToggle.MouseButton1Click:Connect(function()
	fovEnabled = not fovEnabled
	FovToggle.Text = "FOV Çemberi: " .. (fovEnabled and "AÇIK" or "KAPALI")
	FovToggle.TextColor3 = fovEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
	FOVCircle.Visible = fovEnabled
end)

SilentToggle.MouseButton1Click:Connect(function()
	silentEnabled = not silentEnabled
	SilentToggle.Text = "Silent Aim: " .. (silentEnabled and "AÇIK" or "KAPALI")
	SilentToggle.TextColor3 = silentEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

NameEspToggle.MouseButton1Click:Connect(function()
	nameEspEnabled = not nameEspEnabled
	NameEspToggle.Text = "İsim Göster: " .. (nameEspEnabled and "AÇIK" or "KAPALI")
	NameEspToggle.TextColor3 = nameEspEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

HealthEspToggle.MouseButton1Click:Connect(function()
	healthEspEnabled = not healthEspEnabled
	HealthEspToggle.Text = "Can Göster: " .. (healthEspEnabled and "AÇIK" or "KAPALI")
	HealthEspToggle.TextColor3 = healthEspEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

DistEspToggle.MouseButton1Click:Connect(function()
	distEspEnabled = not distEspEnabled
	DistEspToggle.Text = "Mesafe Göster: " .. (distEspEnabled and "AÇIK" or "KAPALI")
	DistEspToggle.TextColor3 = distEspEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

BoxEspToggle.MouseButton1Click:Connect(function()
	boxEspEnabled = not boxEspEnabled
	BoxEspToggle.Text = "Kutu (Box ESP): " .. (boxEspEnabled and "AÇIK" or "KAPALI")
	BoxEspToggle.TextColor3 = boxEspEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

SkeletonToggle.MouseButton1Click:Connect(function()
	skeletonEnabled = not skeletonEnabled
	SkeletonToggle.Text = "İskelet (Skeleton): " .. (skeletonEnabled and "AÇIK" or "KAPALI")
	SkeletonToggle.TextColor3 = skeletonEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

GlowToggle.MouseButton1Click:Connect(function()
	glowEnabled = not glowEnabled
	GlowToggle.Text = "Glow / Aura: " .. (glowEnabled and "AÇIK" or "KAPALI")
	GlowToggle.TextColor3 = glowEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

CowboyHatToggle.MouseButton1Click:Connect(function()
	cowboyHatEnabled = not cowboyHatEnabled
	CowboyHatToggle.Text = "Rainbow Cowboy Şapkası: " .. (cowboyHatEnabled and "AÇIK" or "KAPALI")
	CowboyHatToggle.TextColor3 = cowboyHatEnabled and Color3.fromRGB(90, 255, 90) or Color3.fromRGB(255, 90, 90)
end)

local function getClampedFOV()
	return math.clamp(tonumber(FovInputBox.Text) or 144, 1, 144)
end

local function getClosestPlayerInFOV()
	local closestPlayer = nil
	local fovRadius = getClampedFOV()
	local shortestDistance = fovEnabled and fovRadius or math.huge
	local viewportSize = Camera.ViewportSize
	local aspectRatio = viewportSize.X / viewportSize.Y

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
			local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid.Health > 0 then
				local pos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
				if onScreen then
					local mousePos = Vector2.new(Mouse.X, Mouse.Y)
					local targetPos = Vector2.new(pos.X, pos.Y)
					local delta = targetPos - mousePos
					local magnitude = Vector2.new(delta.X / aspectRatio, delta.Y).Magnitude

					if magnitude < shortestDistance then
						shortestDistance = magnitude
						closestPlayer = player
					end
				end
			end
		end
	end
	return closestPlayer
end

RunService.RenderStepped:Connect(function()
	local smoothVal = math.max(1, tonumber(SmoothBox.Text) or 5)
	local currentFOV = getClampedFOV()

	if fovEnabled then
		FOVCircle.Visible = true
		FOVCircle.Radius = currentFOV
		FOVCircle.Position = Vector2.new(Mouse.X, Mouse.Y + 36)
	else
		FOVCircle.Visible = false
	end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			local char = player.Character
			if char and char:FindFirstChild("Head") and char:FindFirstChildOfClass("Humanoid") then
				local humanoid = char:FindFirstChildOfClass("Humanoid")
				local head = char.Head
				local rootPart = char:FindFirstChild("HumanoidRootPart")
				
				local hatModel = char:FindFirstChild("PirexCCowboyHat")
				if cowboyHatEnabled and humanoid.Health > 0 then
					if not hatModel then
						hatModel = Instance.new("Model"); hatModel.Name = "PirexCCowboyHat"; hatModel.Parent = char
						local base = Instance.new("Part"); base.Name = "Base"; base.Size = Vector3.new(1.3, 0.6, 1.3); base.CanCollide = false; base.Parent = hatModel
						local brim = Instance.new("Part"); brim.Name = "Brim"; brim.Size = Vector3.new(2.3, 0.12, 2.3); brim.CanCollide = false; brim.Parent = hatModel
						local w1 = Instance.new("WeldConstraint"); w1.Part0 = head; w1.Part1 = base; w1.Parent = hatModel
						local w2 = Instance.new("WeldConstraint"); w2.Part0 = base; w2.Part1 = brim; w2.Parent = hatModel
						base.CFrame = head.CFrame * CFrame.new(0, 1.05, 0)
						brim.CFrame = head.CFrame * CFrame.new(0, 0.75, 0)
					else
						local rainbowColor = Color3.fromHSV((tick() * 0.4) % 1, 1, 1)
						for _, p in ipairs(hatModel:GetChildren()) do if p:IsA("Part") then p.Color = rainbowColor end end
					end
				else
					if hatModel then hatModel:Destroy() end
				end

				local auraFolder = char:FindFirstChild("PirexCAuraFolder")
				if glowEnabled and humanoid.Health > 0 then
					if not auraFolder then
						auraFolder = Instance.new("Folder"); auraFolder.Name = "PirexCAuraFolder"; auraFolder.Parent = char
						for _, part in ipairs(char:GetChildren()) do
							if part:IsA("Part") and part.Name ~= "HumanoidRootPart" then
								local boxBox = Instance.new("SelectionBox"); boxBox.Name = "AuraBox"; boxBox.Adornee = part; boxBox.Parent = auraFolder
							end
						end
					end
					
					local mode = CustomConfig.GlowEffectType
					for _, box in ipairs(auraFolder:GetChildren()) do
						if box:IsA("SelectionBox") then
							if mode == "Super Nova (Aşırı Parlak Neon)" then
								local pulse = (math.sin(tick() * 8) + 1) / 2
								box.Color3 = Color3.fromRGB(255, 50, 255); box.LineThickness = 0.08 + (pulse * 0.06); box.Transparency = 0.05
							elseif mode == "Laser Beam (Göz Alıcı Mor Işın)" then
								box.Color3 = Color3.fromRGB(180, 0, 255); box.LineThickness = 0.1; box.Transparency = 0.0
							elseif mode == "Neon Pulse (Nefes Alma)" then
								local pulse = (math.sin(tick() * 4) + 1) / 2
								box.Color3 = Color3.fromRGB(150, 50, 255); box.LineThickness = 0.03 + (pulse * 0.04); box.Transparency = 0.2 + (pulse * 0.4)
							elseif mode == "Cyber Matrix (Yeşil Hacker)" then
								box.Color3 = Color3.fromRGB(0, 255, 100); box.LineThickness = 0.07; box.Transparency = 0.1
							elseif mode == "Fire Aura (Cehennem Alevi)" then
								box.Color3 = Color3.fromRGB(255, 120 + math.random(0, 130), 0); box.LineThickness = 0.08; box.Transparency = math.random() * 0.2
							elseif mode == "Electric Plasma (Mimari Şimşek)" then
								box.Color3 = Color3.fromRGB(0, 220, 255); box.LineThickness = 0.06; box.Transparency = 0.05
							elseif mode == "Rainbow Rave (Rengarenk Diskotek)" then
								box.Color3 = Color3.fromHSV((tick() * 0.8 + (box.Adornee.Position.X * 0.02)) % 1, 1, 1); box.LineThickness = 0.08; box.Transparency = 0.1
							end
						end
					end
				else
					if auraFolder then auraFolder:Destroy() end
				end
				
				local cacheKey = player.Name
				if not espCache[cacheKey] then
					espCache[cacheKey] = {
						NameText = Drawing.new("Text"), InfoText = Drawing.new("Text"),
						BoxOutline = Drawing.new("Square"), Box = Drawing.new("Square"),
						Skeleton = {HeadToTorso = Drawing.new("Line"), TorsoToLeftArm = Drawing.new("Line"), TorsoToRightArm = Drawing.new("Line"), TorsoToLeftLeg = Drawing.new("Line"), TorsoToRightLeg = Drawing.new("Line")}
					}
					local c = espCache[cacheKey]
					c.NameText.Size = 12; c.NameText.Center = true; c.NameText.Outline = true
					c.InfoText.Size = 11; c.InfoText.Center = true; c.InfoText.Outline = true
					c.BoxOutline.Thickness = 3; c.BoxOutline.Filled = false; c.BoxOutline.Color = Color3.fromRGB(0, 0, 0); c.BoxOutline.Transparency = 0.7
					c.Box.Thickness = 1; c.Box.Filled = false
					for _, line in pairs(c.Skeleton) do line.Thickness = 1.5 end
				end

				local c = espCache[cacheKey]
				c.NameText.Color = CustomConfig.Name
				c.InfoText.Color = CustomConfig.HealthDist
				c.Box.Color = CustomConfig.Box
				for _, line in pairs(c.Skeleton) do line.Color = CustomConfig.Skeleton end

				if rootPart and humanoid.Health > 0 then
					local vector, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
					local topVector, topOnScreen = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
					local legVector, legOnScreen = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

					if onScreen and topOnScreen and legOnScreen then
						local height = math.abs(topVector.Y - legVector.Y)
						local width = height / 2
						local boxPos = Vector2.new(topVector.X - width / 2, topVector.Y)
						local boxSize = Vector2.new(width, height)

						if boxEspEnabled then
							c.BoxOutline.Visible = true; c.BoxOutline.Position = boxPos; c.BoxOutline.Size = boxSize
							c.Box.Visible = true; c.Box.Position = boxPos; c.Box.Size = boxSize
						else
							c.BoxOutline.Visible = false; c.Box.Visible = false
						end

						if nameEspEnabled then
							c.NameText.Visible = true; c.NameText.Text = player.Name; c.NameText.Position = Vector2.new(topVector.X, topVector.Y - 16)
						else
							c.NameText.Visible = false
						end

						local infoStr = ""
						if healthEspEnabled then infoStr = "HP: " .. math.floor(humanoid.Health) end
						if distEspEnabled then
							local dist = math.floor((rootPart.Position - Camera.CFrame.Position).Magnitude)
							infoStr = (infoStr ~= "") and (infoStr .. " | " .. dist .. "m") or (dist .. "m")
						end

						if (healthEspEnabled or distEspEnabled) and infoStr ~= "" then
							c.InfoText.Visible = true; c.InfoText.Text = infoStr; c.InfoText.Position = Vector2.new(legVector.X, legVector.Y + 4)
						else
							c.InfoText.Visible = false
						end

						if skeletonEnabled and char:FindFirstChild("Left Arm") and char:FindFirstChild("Right Arm") and char:FindFirstChild("Left Leg") and char:FindFirstChild("Right Leg") then
							local lHead = Camera:WorldToViewportPoint(head.Position)
							local lTorso = Camera:WorldToViewportPoint(rootPart.Position)
							local lLArm = Camera:WorldToViewportPoint(char["Left Arm"].Position)
							local lRArm = Camera:WorldToViewportPoint(char["Right Arm"].Position)
							local lLLeg = Camera:WorldToViewportPoint(char["Left Leg"].Position)
							local lRLeg = Camera:WorldToViewportPoint(char["Right Leg"].Position)

							c.Skeleton.HeadToTorso.Visible = true; c.Skeleton.HeadToTorso.From = Vector2.new(lHead.X, lHead.Y); c.Skeleton.HeadToTorso.To = Vector2.new(lTorso.X, lTorso.Y)
							c.Skeleton.TorsoToLeftArm.Visible = true; c.Skeleton.TorsoToLeftArm.From = Vector2.new(lTorso.X, lTorso.Y); c.Skeleton.TorsoToLeftArm.To = Vector2.new(lLArm.X, lLArm.Y)
							c.Skeleton.TorsoToRightArm.Visible = true; c.Skeleton.TorsoToRightArm.From = Vector2.new(lTorso.X, lTorso.Y); c.Skeleton.TorsoToRightArm.To = Vector2.new(lRArm.X, lRArm.Y)
							c.Skeleton.TorsoToLeftLeg.Visible = true; c.Skeleton.TorsoToLeftLeg.From = Vector2.new(lTorso.X, lTorso.Y); c.Skeleton.TorsoToLeftLeg.To = Vector2.new(lLLeg.X, lLLeg.Y)
							c.Skeleton.TorsoToRightLeg.Visible = true; c.Skeleton.TorsoToRightLeg.From = Vector2.new(lTorso.X, lTorso.Y); c.Skeleton.TorsoToRightLeg.To = Vector2.new(lRLeg.X, lRLeg.Y)
						else
							for _, line in pairs(c.Skeleton) do line.Visible = false end
						end
					else
						c.NameText.Visible = false; c.InfoText.Visible = false; c.BoxOutline.Visible = false; c.Box.Visible = false
						for _, line in pairs(c.Skeleton) do line.Visible = false end
					end
				else
					c.NameText.Visible = false; c.InfoText.Visible = false; c.BoxOutline.Visible = false; c.Box.Visible = false
					for _, line in pairs(c.Skeleton) do line.Visible = false end
				end
			end
		end
	end

	local shouldAim = aimbotEnabled and ((aimMode == "Hold" and isKeyDown) or (aimMode == "Toggle" and toggleActiveState))
	if shouldAim then
		local target = getClosestPlayerInFOV()
		if target and target.Character and target.Character:FindFirstChild("Head") then
			local targetPos = target.Character.Head.Position
			local curCFrame = Camera.CFrame
			Camera.CFrame = curCFrame:Lerp(CFrame.new(curCFrame.Position, targetPos), 1 / smoothVal)
		end
	end

	if silentEnabled then
		local target = getClosestPlayerInFOV()
		if target and target.Character and target.Character:FindFirstChild("Head") then
			pcall(function()
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
					Mouse.TargetFilter = target.Character
				end
			end)
		end
	end
end)
]])()
