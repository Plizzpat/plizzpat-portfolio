-- Sprint System (client)
-- Put this LocalScript in StarterPlayerScripts

local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local WALK = 16
local SPRINT = 24

local humanoid

local function bindCharacter(char)
	humanoid = char:WaitForChild("Humanoid")
	humanoid.WalkSpeed = WALK
end

if player.Character then bindCharacter(player.Character) end
player.CharacterAdded:Connect(bindCharacter)

UIS.InputBegan:Connect(function(input, gp)
	if gp or not humanoid then return end
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = SPRINT
	end
end)

UIS.InputEnded:Connect(function(input, gp)
	if gp or not humanoid then return end
	if input.KeyCode == Enum.KeyCode.LeftShift then
		humanoid.WalkSpeed = WALK
	end
end)
