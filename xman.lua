local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local MinimizeButton = Instance.new("TextButton")
local RestoreButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Name = "ModernGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TitleBar.Size = UDim2.new(1, 0, 0, 30)

MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = TitleBar
MinimizeButton.Size = UDim2.new(0, 30, 1, 0)
MinimizeButton.Position = UDim2.new(1, -90, 0, 0)
MinimizeButton.Text = "_"
MinimizeButton.TextScaled = true

RestoreButton.Name = "RestoreButton"
RestoreButton.Parent = TitleBar
RestoreButton.Size = UDim2.new(0, 30, 1, 0)
RestoreButton.Position = UDim2.new(1, -60, 0, 0)
RestoreButton.Text = "□"
RestoreButton.TextScaled = true

CloseButton.Name = "CloseButton"
CloseButton.Parent = TitleBar
CloseButton.Size = UDim2.new(0, 30, 1, 0)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "x"
CloseButton.TextScaled = true

local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local minimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    if not minimized then
        MainFrame.Size = UDim2.new(0, 400, 0, 30)
        minimized = true
    end
end)

RestoreButton.MouseButton1Click:Connect(function()
    if minimized then
        MainFrame.Size = UDim2.new(0, 400, 0, 300)
        minimized = false
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local TabFrame = Instance.new("Frame")
local TabButton1 = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")

TabFrame.Name = "TabFrame"
TabFrame.Parent = MainFrame
TabFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)

TabButton1.Name = "TabButton1"
TabButton1.Parent = TabFrame
TabButton1.Size = UDim2.new(0, 100, 1, 0)
TabButton1.Text = "Tab 1"
TabButton1.TextScaled = true

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
ContentFrame.Size = UDim2.new(1, 0, 1, -60)
ContentFrame.Position = UDim2.new(0, 0, 0, 60)

local ListFrame = Instance.new("ScrollingFrame")
local ToggleButton = Instance.new("TextButton")
local UISizeConstraint = Instance.new("UIListLayout")

ListFrame.Parent = ContentFrame
ListFrame.Size = UDim2.new(1, 0, 1, 0)
ListFrame.ScrollBarThickness = 8

UISizeConstraint.Parent = ListFrame
UISizeConstraint.Padding = UDim.new(0, 10)

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ListFrame
ToggleButton.Size = UDim2.new(0, 200, 0, 50)
ToggleButton.Text = "Toggle"
ToggleButton.TextScaled = true
