-- Simple Door System (proximity open/close)
-- Put this Script inside a Door model:
-- Door model should contain a Part named "DoorPart" and a ProximityPrompt inside DoorPart

local doorModel = script.Parent
local door = doorModel:WaitForChild("DoorPart")
local prompt = door:FindFirstChildOfClass("ProximityPrompt") or door:WaitForChild("ProximityPrompt")

local CLOSED = door.CFrame
local OPEN = CLOSED * CFrame.new(0, 0, -4) -- move backwards

local isOpen = false
local busy = false

local function setDoor(cf)
	door.CFrame = cf
end

prompt.Triggered:Connect(function()
	if busy then return end
	busy = true

	isOpen = not isOpen
	if isOpen then
		setDoor(OPEN)
	else
		setDoor(CLOSED)
	end

	task.wait(0.2)
	busy = false
end)
