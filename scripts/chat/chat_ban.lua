-- Chat Ban System (server)
-- Bans players if they say banned words in chat
-- Example banned phrase: "plizzpat bad"
-- Put in ServerScriptService

local Players = game:GetService("Players")

local BANNED_PHRASES = {
	"plizzpat bad"
}

local function containsBannedPhrase(message)
	message = string.lower(message)

	for _, phrase in ipairs(BANNED_PHRASES) do
		if string.find(message, phrase, 1, true) then
			return true
		end
	end

	return false
end

Players.PlayerAdded:Connect(function(player)

	player.Chatted:Connect(function(message)

		if containsBannedPhrase(message) then
			player:Kick("Banned phrase detected in chat")
		end

	end)

end)
