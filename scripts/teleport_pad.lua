local pad = script.Parent
local teleportPosition = Vector3.new(0, 50, 0)

pad.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	
	if player then
		local root = character:FindFirstChild("HumanoidRootPart")
		if root then
			root.CFrame = CFrame.new(teleportPosition)
		end
	end
end)
