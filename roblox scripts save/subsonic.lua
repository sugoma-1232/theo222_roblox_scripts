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

local TweenService = game:GetService("TweenService")

local function addtool(name, tooltip)
	local tool = Instance.new("Tool")
	tool.Name = name
	tool.CanBeDropped = false
	tool.RequiresHandle = false
	tool.ToolTip = tooltip
	tool.Parent = ourplayer:WaitForChild("Backpack")
	return tool
end
local function TweenCFrame(instance, targetCFrame, time, easingStyle, easingDirection)
	local tweenInfo = TweenInfo.new(
		time or 1,
		easingStyle or Enum.EasingStyle.Sine,
		easingDirection or Enum.EasingDirection.Out
	)

	local tween = TweenService:Create(instance, tweenInfo, { CFrame = targetCFrame })
	tween:Play()
	return tween
end



ourinputservice.InputBegan:Connect(function(input,gameProcessedEvent)
	ischat = gameProcessedEvent
end)
ourinputservice.InputChanged:Connect(function(input,gameProcessedEvent)
	ischat = gameProcessedEvent
end)
ourinputservice.InputEnded:Connect(function(input,gameProcessedEvent)
	ischat = gameProcessedEvent
end)
function iskeydown(key)
	return (ourinputservice:IsKeyDown(key) and not ischat)
end
function getdistance(pos1, pos2)
	return (pos1 - pos2).Magnitude
end
function findclosesttarget()
	local index = 1
	local b = false
	while (not b) or curtarget == ourplayer do
		if index > #(Players:GetChildren()) then
			index = 0
			task.wait(1)
		end
		if curtarget ~= nil then
			print(curtarget.Name)
		end

		curtarget = (Players:GetChildren())[index]
		b = pcall(function()
			local dih = curtarget.Character.HumanoidRootPart
		end)
		index = index + 1
		
	end
	for _,v in pairs(Players:GetChildren()) do
		if (not (v == ourplayer)) and (not (v == nil)) then
			pcall(function()
				if getdistance(ourhumrp.CFrame.Position, curtarget.Character.HumanoidRootPart.CFrame.Position) > getdistance(ourhumrp.CFrame.Position, v.Character.HumanoidRootPart.CFrame.Position) then
					curtarget = v
				end
			end)
		end
	end
end
local function OnDeath()
    if not isplayerdead then
    	isplayerdead = true
	end
end
ourhum.Died:Connect(OnDeath)
ourplayer.CharacterAdded:Connect(function()
	task.wait(0.2)
	ourchar = ourplayer.Character
    ourhum = ourchar:WaitForChild("Humanoid", 0.1)
    ourhumrp = ourchar:WaitForChild("HumanoidRootPart", 0.1)
    ourcharpp = ourchar.PrimaryPart
    for _, v in pairs(charchildren) do
        ourchar:WaitForChild(v, 0.1)
    end
    ourhum.Died:Connect(OnDeath)
    isplayerdead = false
end)
local backshot = false
local jitterstrength = 10
local sidejitterstrength = 3
local camerapos = Camera.CFrame
ourRunService.PreSimulation:Connect(function()
	if iskeydown(Enum.KeyCode.RightControl) then
		ourhumrp.CFrame = CFrame.new(0, -0, 0)
	end
	if iskeydown(Enum.KeyCode.X) then
		ourhumrp.CFrame = ourhumrp.CFrame + ourhumrp.CFrame.LookVector * 2
	end
	if iskeydown(Enum.KeyCode.E) then
		findclosesttarget()
	end
	if iskeydown(Enum.KeyCode.Z) then
		ourhumrp.Velocity = ourhumrp.Velocity + Vector3.new(0,10,0)
		--ourhumrp.CFrame = ourhumrp.CFrame + Vector3.new(0,2,0)
	end
	if iskeydown(Enum.KeyCode.P) then
		ourhumrp.Velocity = Vector3.new(0,0,0)
		local a = ourhumrp.CFrame
		ourRunService.PostSimulation:Wait()
		ourhumrp.CFrame = a
	end
	
end)

ourRunService.PostSimulation:Connect(function()
	
	Players = game.Players
	if iskeydown(Enum.KeyCode.V) then
		local dihbih99 = ourhumrp.CFrame
		
		
		--Camera.CFrame = ((ourhumrp.CFrame + ourhumrp.CFrame.LookVector * -10) + Vector3.new(0, 10, 0)) * CFrame.Angles(math.rad(-40), 0, 0)
		local r = (jitterstrength * 100)
        local frfr = ourhumrp.CFrame + Vector3.new(math.random(-r, r) / 100, 0, math.random(-r, r) / 100)
		local pos_before = ourhumrp.CFrame
		ourhumrp.CFrame = frfr
		ourhum.CameraOffset = ((dihbih99:ToObjectSpace(ourhumrp.CFrame)).Position) * Vector3.new(-1, -1, -1)
		--:ToObjectSpace
		ourRunService.Stepped:Wait()
		ourhum.CameraOffset = Vector3.new(0, 0, 0)
		ourhumrp.CFrame = pos_before
		--Camera.CameraSubject = ourhum
		

	end
	if iskeydown(Enum.KeyCode.T) then
	local dihbih99 = ourhumrp.CFrame
		--Camera.CFrame = ((ourhumrp.CFrame + ourhumrp.CFrame.LookVector * -10) + Vector3.new(0, 10, 0)) * CFrame.Angles(math.rad(-40), 0, 0)
		local r = (sidejitterstrength * 100)
        local frfr = ourhumrp.CFrame + ourhumrp.CFrame.RightVector * math.random(-r, r) / 100
		local pos_before = ourhumrp.CFrame
		ourhumrp.CFrame = frfr
		ourhum.CameraOffset = ((dihbih99:ToObjectSpace(ourhumrp.CFrame)).Position) * Vector3.new(-1, -1, -1)
		ourRunService.Stepped:Wait()
		ourhumrp.CFrame = pos_before

	end
	if iskeydown(Enum.KeyCode.C) then
		pcall(function()
			ourhumrp.CFrame = curtarget.Character.HumanoidRootPart.CFrame + curtarget.Character.HumanoidRootPart.CFrame.LookVector * -4
		end)
	end	
end)

ourRunService.Heartbeat:Connect(function()
	if iskeydown(Enum.KeyCode.R) then
		backshot = not backshot
		if backshot then
			pcall(function()
				ourhumrp.CFrame = curtarget.Character.Torso:GetRenderCFrame() + curtarget.Character.Torso:GetRenderCFrame().LookVector * -1
                ourhumrp.Velocity = Vector3.new(0, 0, 0)
			end)
		else 
			pcall(function()
				ourhumrp.CFrame = curtarget.Character.Torso:GetRenderCFrame() + curtarget.Character.Torso:GetRenderCFrame().LookVector * -2
                ourhumrp.Velocity = Vector3.new(0, 0, 0)
			end)
		end
	end
end)