-- NPC Patrol (points)
-- Put this Script inside NPC model (Humanoid + HumanoidRootPart)
-- Create folder "PatrolPoints" in Workspace with Parts as points.

local npc = script.Parent
local humanoid = npc:WaitForChild("Humanoid")
local root = npc:WaitForChild("HumanoidRootPart")

local pointsFolder = workspace:WaitForChild("PatrolPoints")
local points = pointsFolder:GetChildren()
table.sort(points, function(a,b) return a.Name < b.Name end)

local index = 1

while npc.Parent do
	if #points == 0 then
		task.wait(1)
		points = pointsFolder:GetChildren()
		continue
	end

	local target = points[index]
	humanoid:MoveTo(target.Position)

	local reached = false
	local conn
	conn = humanoid.MoveToFinished:Connect(function(ok)
		reached = true
		conn:Disconnect()
	end)

	local timeout = 6
	while not reached and timeout > 0 do
		task.wait(0.2)
		timeout -= 0.2
	end

	index += 1
	if index > #points then
		index = 1
	end

	task.wait(0.5)
end
