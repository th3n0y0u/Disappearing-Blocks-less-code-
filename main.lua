local count = 1
local paths = script.Parent:FindFirstChild("Disappear") 
local touchedscript = script.Parent:FindFirstChild("TouchedScript") 

-- Duplicates the script to each of the paths in the "Paths" folder
for _,v in pairs(paths:GetChildren()) do
	local path = paths:FindFirstChild(tostring(count)) 
	local clone = touchedscript:Clone()
	clone.Parent = path
	clone.Disabled = false
	count += 1
end  

-- Touched Script
local pathnumber = script.Parent:FindFirstChild("PathNumber")

script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		if hit.Parent.Humanoid.Health > 0 then
			while script.Parent.Transparency < 1 do
				script.Parent.Transparency += 0.05
				wait(0.04)
			end
			script.Parent.CanCollide = false
			wait(2.5)
			while script.Parent.Transparency > 0 do
				script.Parent.Transparency -= 0.05
				wait(0.04)
			end
			script.Parent.CanCollide = true
		end
	end
end)