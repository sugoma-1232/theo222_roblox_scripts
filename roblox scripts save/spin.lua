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
local a = nil
local strengh = 20
local b = CFrame.Angles(0,math.pi/15 * strengh,0)
local method = false
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
if method then
	while task.wait() and not ourinputservice:isKeyDown(Enum.KeyCode.P) do
		a = CFrame.new(ourhumrp.CFrame.Position.X, ourhumrp.CFrame.Position.Y, ourhumrp.CFrame.Position.Z) * b
		b = b * CFrame.Angles(0,math.pi/15 * strengh, 0)
		ourhumrp.CFrame = a
	end
else
	ourhum.AutoRotate = false
	while task.wait() and not ourinputservice:isKeyDown(Enum.KeyCode.P) do
		ourhum.AutoRotate = false
		ourhumrp.AssemblyAngularVelocity = ourhumrp.AssemblyAngularVelocity + Vector3.new(0, (math.pi/15 * strengh), 0)
		ourhum.AutoRotate = false
	end
end
