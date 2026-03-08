-- Stamina System (server)
-- Players lose stamina when running and recover it while walking
-- Put in ServerScriptService

local Players = game:GetService("Players")

local MAX_STAMINA = 100
local RUN_SPEED = 24
local WALK_SPEED = 16

Players.PlayerAdded:Connect(function(player)

	local stamina = MAX_STAMINA

	player.CharacterAdded:Connect(function(char)

		local hum = char:WaitForChild("Humanoid")

		while hum.Parent do
			task.wait(0.1)

			if hum.WalkSpeed > WALK_SPEED then
				stamina -= 1
			else
				stamina += 1
			end

			stamina = math.clamp(stamina,0,MAX_STAMINA)

			if stamina <= 0 then
				hum.WalkSpeed = WALK_SPEED
			end
		end
	end)
end)
