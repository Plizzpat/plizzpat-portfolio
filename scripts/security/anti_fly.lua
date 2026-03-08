-- Anti Fly System (server)
-- Detects players flying too high and resets their position
-- Put in ServerScriptService

local Players = game:GetService("Players")

local MAX_HEIGHT = 150
local CHECK_DELAY = 2

while true do
	task.wait(CHECK_DELAY)

	for _, player in ipairs(Players:GetPlayers()) do
		local character = player.Character
		if character then
			local hrp = character:FindFirstChild("HumanoidRootPart")

			if hrp and hrp.Position.Y > MAX_HEIGHT then
				hrp.CFrame = CFrame.new(hrp.Position.X, 10, hrp.Position.Z)
			end
		end
	end
end
