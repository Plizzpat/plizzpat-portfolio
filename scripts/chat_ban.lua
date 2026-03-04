local Players = game:GetService("Players")

local bannedWords = {
	"plizzpat bad"
}

Players.PlayerAdded:Connect(function(player)

	player.Chatted:Connect(function(message)

		local msg = string.lower(message)

		for _, word in pairs(bannedWords) do
			if string.find(msg, word) then
				player:Kick("Banned word detected")
			end
		end

	end)

end)
