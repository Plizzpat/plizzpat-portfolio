-- NPC Follow System (server)
-- NPC follows the nearest player
-- Put inside NPC Model

local npc = script.Parent
local humanoid = npc:WaitForChild("Humanoid")
local hrp = npc:WaitForChild("HumanoidRootPart")

local Players = game:GetService("Players")

while true do
	task.wait(1)

	local nearest
	local distance = math.huge

	for _,player in ipairs(Players:GetPlayers()) do
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then

			local d = (char.HumanoidRootPart.Position - hrp.Position).Magnitude

			if d < distance then
				distance = d
				nearest = char
			end
		end
	end

	if nearest then
		humanoid:MoveTo(nearest.HumanoidRootPart.Position)
	end
end
