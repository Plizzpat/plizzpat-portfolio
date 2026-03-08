-- Simple Admin Commands (server)
-- Commands: ;kick name reason, ;tp name, ;speed name 16
-- Put in ServerScriptService

local Players = game:GetService("Players")

local ADMINS = {
	-- add your UserId here
	-- [123456789] = true
}

local PREFIX = ";"

local function isAdmin(plr)
	return ADMINS[plr.UserId] == true
end

local function findPlayerByName(partial)
	partial = string.lower(partial or "")
	for _, p in ipairs(Players:GetPlayers()) do
		if string.find(string.lower(p.Name), partial, 1, true) then
			return p
		end
	end
end

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if not isAdmin(plr) then return end
		if string.sub(msg, 1, 1) ~= PREFIX then return end

		local args = string.split(string.sub(msg, 2), " ")
		local cmd = string.lower(args[1] or "")

		if cmd == "kick" then
			local target = findPlayerByName(args[2])
			if target then
				local reason = table.concat(args, " ", 3)
				target:Kick(reason ~= "" and reason or "Kicked by admin")
			end

		elseif cmd == "tp" then
			local target = findPlayerByName(args[2])
			if target and plr.Character and target.Character then
				local a = plr.Character:FindFirstChild("HumanoidRootPart")
				local b = target.Character:FindFirstChild("HumanoidRootPart")
				if a and b then
					a.CFrame = b.CFrame * CFrame.new(2, 0, 0)
				end
			end

		elseif cmd == "speed" then
			local target = findPlayerByName(args[2])
			local speed = tonumber(args[3])
			if target and speed and target.Character then
				local hum = target.Character:FindFirstChildOfClass("Humanoid")
				if hum then
					hum.WalkSpeed = math.clamp(speed, 8, 64)
				end
			end
		end
	end)
end)
