-- Anti Speed (server-side check)
-- Put in ServerScriptService or anywhere server runs

local Players = game:GetService("Players")

local MAX_STUDS_PER_SEC = 45
local CHECK_EVERY = 1

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local hrp = char:WaitForChild("HumanoidRootPart")
		local last = hrp.Position
		local strikes = 0

		while char.Parent do
			task.wait(CHECK_EVERY)
			local now = hrp.Position
			local dist = (now - last).Magnitude
			local speed = dist / CHECK_EVERY

			if speed > MAX_STUDS_PER_SEC then
				strikes += 1
				-- soft action: move back
				hrp.CFrame = CFrame.new(last)
				if strikes >= 3 then
					player:Kick("Speed exploit detected")
					break
				end
			else
				strikes = math.max(0, strikes - 1)
			end

			last = hrp.Position
		end
	end)
end)
