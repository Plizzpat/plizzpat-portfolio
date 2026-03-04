local Players = game:GetService("Players")

local MAX_SPEED = 40

Players.PlayerAdded:Connect(function(player)

	player.CharacterAdded:Connect(function(character)

		local humanoid = character:WaitForChild("Humanoid")
		local root = character:WaitForChild("HumanoidRootPart")

		local lastPosition = root.Position

		while character.Parent do
			task.wait(1)

			local distance = (root.Position - lastPosition).Magnitude
			local speed = distance / 1

			if speed > MAX_SPEED then
				player:Kick("Speed exploit detected")
			end

			lastPosition = root.Position
		end

	end)

end)
