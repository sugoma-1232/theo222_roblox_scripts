getgenv().JERK_OFF_SPEED = 20
--// self explainatory, the speed of jerking off
getgenv().KEEP_ON_DEATH = true --// if true, gives you the jerk off tool when you
--// Fully made by @sakupenny, comments are made by me too.

--// define locally so they can't be changed mid usage
local JerkOffSpeed = getgenv().JERK_OFF_SPEED
local KeepOnDeath = getgenv().KEEP_ON_DEATH

--// player defintion
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid", 1)
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1) or Character.PrimaryPart
local MAIN_ANIMATIONS = {
    JERK_OFF = "rbxassetid://99198989",
    CLOSER_HANDS = "rbxassetid://168086975",
}

local JerkingOff = false
game.UserInputService.InputBegan:Connect(function(a, b)
	if a.KeyCode == Enum.KeyCode.N then
		JerkingOff = not JerkingOff
	end
end)
Player.CharacterAdded:Connect(function()
    Character = Player.Character
    Humanoid = Character:WaitForChild("Humanoid", 1)
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart", 1) or Character.PrimaryPart

    --// disable on death
    Humanoid.Died:Connect(function()
        JerkingOff = false
        if not KeepOnDeath then
            getgenv().JerkOffExecuted = false
        end
    end)
end)

--// disable on death
Humanoid.Died:Connect(function()
    JerkingOff = false
    if not KeepOnDeath then
        getgenv().JerkOffExecuted = false
    end
	task.wait(3)
	Humanoid = Player.Character.Humanoid
end)

--// main loop
local jerkoffTrack
local closerhandsTrack
local setToOriginalValues = true

game:GetService("RunService").RenderStepped:Connect(function()
    if not Humanoid then
        return --// exit if Humanoid is not defined
    end
    if JerkingOff then
        --Humanoid.WalkSpeed = 0 --// set walk speed to 0 while jerking off
        --Humanoid.JumpPower = 0 --// set jump power to 0 while jerking off

        --// check if jerkoffTrack is not playing
        if not jerkoffTrack and Humanoid.RigType == Enum.HumanoidRigType.R6 then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://72042024"--"rbxassetid://698251653"
            jerkoffTrack = Humanoid:LoadAnimation(anim)
			jerkoffTrack:AdjustSpeed(JerkOffSpeed)
            jerkoffTrack:Play()
		elseif not jerkoffTrack then
			local anim = Instance.new("Animation")
			anim.AnimationId = "rbxassetid://698251653"
            jerkoffTrack = Humanoid:LoadAnimation(anim)
			jerkoffTrack:AdjustSpeed(JerkOffSpeed)
            jerkoffTrack:Play()
		elseif jerkoffTrack.TimePosition > 0.7 then
			jerkoffTrack.TimePosition = 0.6
		elseif jerkoffTrack.IsPlaying == false then
			jerkoffTrack:Play()
		end
			
	end
end)
