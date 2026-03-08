-- NPC Attack System (server)
-- NPC damages players when they get close
-- Put inside NPC Model

local npc = script.Parent
local DAMAGE = 10
local ATTACK_DISTANCE = 5
local COOLDOWN = 1

local Players = game:GetService("Players")

while true do
	task.wait(COOLDOWN)

	for _,player in ipairs(Players:GetPlayers()) do
		local char = player.Character

		if char and char:FindFirstChild("HumanoidRootPart") then

			local dist = (char.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude

			if dist < ATTACK_DISTANCE then

				local hum = char:FindFirstChildOfClass("Humanoid")

				if hum then
					hum:TakeDamage(DAMAGE)
				end

			end
		end
	end
end
