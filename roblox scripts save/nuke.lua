local Players = game.Players
local ourplayer = Players.LocalPlayer
local ourchar = ourplayer.Character or ourplayer.CharacterAddded:Wait()
local ourhum = ourchar:WaitForChild("Humanoid")
local ourhumrp = ourchar:WaitForChild("HumanoidRootPart")
local ourcharpp = ourchar.PrimaryPart
local ourRunService = game:GetService('RunService')
local Camera = Workspace.CurrentCamera
local charchildren = {"Head", "UpperTorso", "LowerTorso"}
local ourinputservice = game:GetService("UserInputService")
local isplayerdead = false
local curtarget = nil
local ischat = false
local charchildren = {"Head", "UpperTorso", "LowerTorso"}

local dih = {}
local bih = {}
--ourhum.Died:Connect(OnDeath)
for _, v in ipairs(ourchar:GetDescendants()) do
	if v:IsA("BasePart") then
		table.insert(dih, v)
	end
	if v:IsA("BasePart") and v.CanCollide then
		table.insert(bih, v)
	end
end
for _, v in pairs(bih) do
	print(v.Name)
end
print("-----------------")
	


local function OnDeath()
    if isplayerdead then return end
    isplayerdead = true
    ourplayer.CharacterAdded:Wait()
    ourchar = ourplayer.Character
    task.wait(0.3)
    ourhum = ourchar:WaitForChild("Humanoid", 0.1)
    ourhumrp = ourchar:WaitForChild("HumanoidRootPart", 0.1)
    ourcharpp = ourchar.PrimaryPart
    for _, v in pairs(charchildren) do
        ourchar:WaitForChild(v, 0.1)
    end
    ourhum.Died:Connect(OnDeath)
    isplayerdead = false
end

ourhum.Died:Connect(OnDeath)

local target = nil
local dih69 = 0.4
local blacklist = {}	
while task.wait() and not ourinputservice:isKeyDown(Enum.KeyCode.P) do
	for _, v in pairs(Players:GetChildren()) do
		if (ourinputservice:isKeyDown(Enum.KeyCode.P)) then break end
		pcall(function() 
		if not ((v.Character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 1000) or (v.Name == ourplayer.Name or blacklist[v] ~= nil)) then
			print(v.Name)
			while task.wait() do
				
				if (v.Character.HumanoidRootPart.AssemblyLinearVelocity.Magnitude > 1000) or (ourinputservice:isKeyDown(Enum.KeyCode.P)) then break end
				dih69 = dih69 + 0.005
				ourhumrp.CFrame = v.Character.HumanoidRootPart.CFrame + v.Character.HumanoidRootPart.Velocity / Vector3.new(120, 120, 120) + (v.Character.HumanoidRootPart.CFrame.LookVector * -(v.Character.HumanoidRootPart.ExtentsSize.Z - dih69))
				ourhumrp.AssemblyLinearVelocity = ourhumrp.CFrame.LookVector * 99999
				if 0 > (4 - dih69) then 
					table.insert(blacklist, v)
					break
				end
			end
			dih69 = 0
		end
		end)
	end

end