
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local LaunchRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch")
local ReturnRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

LaunchRemote:FireServer()

task.wait(2)
print("telepörting")
character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(9000000000e9, 90000000000e9, 9000000000e9)
print("döne")
task.wait(2)

ReturnRemote:FireServer()
