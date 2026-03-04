local npc = script.Parent
local humanoid = npc:WaitForChild("Humanoid")
local root = npc:WaitForChild("HumanoidRootPart")

while true do
	wait(1)
	
	local players = game.Players:GetPlayers()
	local closestPlayer = nil
	local distance = math.huge
	
	for _,player in pairs(players) do
		if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local d = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
			if d < distance then
				distance = d
				closestPlayer = player
			end
		end
	end
	
	if closestPlayer then
		humanoid:MoveTo(closestPlayer.Character.HumanoidRootPart.Position)
	end
end
