-- GUI + Functions for Build a Boat
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local LaunchRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch")
local ReturnRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return")

-- GUI
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
local LaunchBtn = Instance.new("TextButton", Frame)
local TeleportBtn = Instance.new("TextButton", Frame)
local ReturnBtn = Instance.new("TextButton", Frame)
local ToggleBtn = Instance.new("TextButton", ScreenGui)

-- GUI Styling
ScreenGui.Name = "BABFT_GUI"

Frame.Size = UDim2.new(0, 160, 0, 140)
Frame.Position = UDim2.new(0, 20, 0.5, -70)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0

ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0, 0, 0.5, -20)
ToggleBtn.Text = "🞬"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

local function makeButton(btn, text, posY)
	btn.Size = UDim2.new(1, 0, 0, 40)
	btn.Position = UDim2.new(0, 0, 0, posY)
	btn.Text = text
	btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	btn.TextColor3 = Color3.new(1, 1, 1)
end

makeButton(LaunchBtn, "🚀 Launch", 0)
makeButton(TeleportBtn, "🌀 Teleport", 45)
makeButton(ReturnBtn, "🔁 Return", 90)

-- Actions
LaunchBtn.MouseButton1Click:Connect(function()
    LaunchRemote:FireServer()
end)

TeleportBtn.MouseButton1Click:Connect(function()
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(9000000000e9, 90000000000e9, 9000000000e9)
end)

ReturnBtn.MouseButton1Click:Connect(function()
    ReturnRemote:FireServer()
end)
