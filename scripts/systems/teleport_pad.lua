-- Teleport Pad System (server)
-- Teleports players when they step on the pad
-- Put this Script inside the teleport pad Part

local pad = script.Parent
local COOLDOWN = 2
local TELEPORT_POSITION = Vector3.new(0, 10, 0)

local debounce = {}

pad.Touched:Connect(function(hit)

	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)

	if not player then return end
	if debounce[player] then return end

	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	debounce[player] = true

	hrp.CFrame = CFrame.new(TELEPORT_POSITION)

	task.wait(COOLDOWN)

	debounce[player] = nil

end)
