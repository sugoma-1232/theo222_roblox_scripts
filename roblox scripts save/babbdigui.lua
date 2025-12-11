--loadstring(game:HttpGet('https://raw.githubusercontent.com/sugoma-1232/theo222_roblox_scripts/refs/heads/main/roblox%20scripts%20save/babbdigui.lua'))()
repeat
	task.wait()

until game:IsLoaded()
local Players = game.Players
local ourplayer = Players.LocalPlayer
local ourchar = ourplayer.Character or ourplayer.CharacterAddded:Wait()
local ourhum = ourchar:WaitForChild("Humanoid")
local ourhumrp = ourchar:WaitForChild("HumanoidRootPart")
local ourcharpp = ourchar.PrimaryPart
local ourlighting = game:WaitForChild("Lighting")
local Objectlist = game.workspace:GetDescendants()
local ourRunService = game:GetService('RunService')
local Camera = Workspace.CurrentCamera

local humanoidhipheight = ourhum.HipHeight
if ourhum.HipHeight < 0.5 and ourhum.RigType.Value == 0 then
	humanoidhipheight = ourchar:WaitForChild("Left Leg").Size.Y
elseif ourhum.HipHeight < 0.5 and ourhum.RigType.Value == 1 then
	print("dih")
end
humanoidhipheight += (10 / math.huge)
local dospeed = false
local dojump = false
local walkspeedvar = 400
local jumppowervar = ourhum.JumpPower
local highlightplayers = false
local washighlightingplayers = false

local charchildren = {"Head", "UpperTorso", "LowerTorso"}

local inputservice = game:GetService("UserInputService")

local isplayerdead = false

local airwalk = false
local airwalkpart = workspace:FindFirstChild("airwalkpart")

local fullbright = false

local fling = false

local antifling = false
local wasantifling = false
local antiflinglist = {}

local dotptool = true
local tptool = nil

local dotweentool = false
local tweentool = nil

local noclip = false
local wasnoclip = false
local nocliplist = {}

local wasantitransparency = false
local antitransparency = false
local antitransparencylist = {}
local newobjectlist = game.workspace:GetDescendants()

local touchingplayer = false

local aimbot = false

for _, v in pairs(ourchar:GetChildren()) do
	print(v.Name)
end
local function getdistance(pos1, pos2)
	return (pos1 - pos2).Magnitude
end
local function opendarkdex()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end

local function opensimplespy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end

local function openinfyeild()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source'))()
end
local function rungoonscript()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/sugoma-1232/theo222_roblox_scripts/refs/heads/main/roblox%20scripts%20save/goon.lua'))()
end
local function runspinscript()
	getgenv().spinmethod = false
	getgenv().spinstrength = 40
	loadstring(game:HttpGet('https://raw.githubusercontent.com/sugoma-1232/theo222_roblox_scripts/refs/heads/main/roblox%20scripts%20save/spin.lua'))()
end
local function runnukescript()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/sugoma-1232/theo222_roblox_scripts/refs/heads/main/roblox%20scripts%20save/nuke.lua'))()
end
local function runsubsonicscript()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/sugoma-1232/theo222_roblox_scripts/refs/heads/main/roblox%20scripts%20save/subsonic.lua'))()
end
local function uiinit()
	local function toggleabutton(a)
		local b = a.FontFace["Style"]
		if b == Enum.FontStyle.Italic then
			b = Enum.FontStyle.Normal
		else
			b = Enum.FontStyle.Italic
		end
		a.FontFace = Font.new(a.FontFace["Family"], a.FontFace["Weight"], b)
	end
	local gui = Instance.new("ScreenGui")
	gui.Name = "asdafdss"
	local draghitbox = Instance.new("Frame")
	draghitbox.Transparency = 1
	draghitbox.Size = UDim2.new(0,166,0,21)
	draghitbox.Parent = gui
	local drag = Instance.new("UIDragDetector")
	drag.Parent = draghitbox
	local mainframe = Instance.new("CanvasGroup")
	mainframe.Parent = draghitbox
	mainframe.Position = UDim2.new(0,0,0,0)
	mainframe.Transparency = 0
	mainframe.BackgroundColor3 = Color3.new(0, 0, 0)
	mainframe.Size = UDim2.new(0,166,0,298)
	mainframe.BackgroundTransparency = 0
	local titlelabel = Instance.new("TextLabel")
	titlelabel.BackgroundTransparency = 1
	titlelabel.Size = UDim2.new(0,166,0,21)
	titlelabel.FontFace = Font.new("rbxasset://fonts/families/Jura.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Italic)
	titlelabel.TextColor3 = Color3.new(1, 1, 1)
	titlelabel.TextScaled = false
	titlelabel.TextSize = 25
	titlelabel.Text = "BABBDI gui"
	titlelabel.Parent = mainframe
	local gradient = Instance.new("UIGradient")
	gradient.Parent = mainframe
	gradient.Rotation = 90
	gradient.Transparency = NumberSequence.new{
    	NumberSequenceKeypoint.new(0, 0),
    	NumberSequenceKeypoint.new(0.0187, 0),
		NumberSequenceKeypoint.new(0.0996, 0.256),
    	NumberSequenceKeypoint.new(0.144, 0.363),
		NumberSequenceKeypoint.new(0.188, 0.456),
		NumberSequenceKeypoint.new(0.249, 0.544),
		NumberSequenceKeypoint.new(0.303, 0.637),
		NumberSequenceKeypoint.new(0.354, 0.694),
		NumberSequenceKeypoint.new(0.396, 0.744),
		NumberSequenceKeypoint.new(0.8, 0.94),
		NumberSequenceKeypoint.new(1, 1)
	}
	local scrollingframe = Instance.new("ScrollingFrame")
	scrollingframe.Position = UDim2.new(0,0,0,21)
	scrollingframe.Size = UDim2.new(0,166,0,277)
	scrollingframe.BackgroundTransparency = 1
	scrollingframe.Parent = mainframe
	scrollingframe.BorderSizePixel = 0
	scrollingframe.ScrollBarThickness = 5
	scrollingframe.CanvasSize = UDim2.new(0,0,3,0)
	scrollingframe.ScrollingDirection = Enum.ScrollingDirection.Y
	scrollingframe.ScrollBarImageTransparency = 0.4
	scrollingframe.ScrollBarImageColor3 = Color3.new(0, 0, 0)
	local buttontemplate = Instance.new("TextButton")
	buttontemplate.Size = UDim2.new(0,150,0,21)
	buttontemplate.BackgroundTransparency = 1
	buttontemplate.TextXAlignment = Enum.TextXAlignment.Left
	buttontemplate.TextYAlignment = Enum.TextYAlignment.Bottom
	buttontemplate.TextScaled = false
	buttontemplate.TextSize = 25
	buttontemplate.FontFace = Font.new("rbxasset://fonts/families/Jura.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	buttontemplate.Text = "template"
	buttontemplate.TextColor3 = Color3.new(1, 1, 1)
	
	------------------------------------------------

	local noclipbutton = buttontemplate:Clone();noclipbutton.Text = "noclip";noclipbutton.Parent = scrollingframe;noclipbutton.Position = UDim2.new(0,0,0,0);noclipbutton.MouseEnter:Connect(function() noclipbutton.Position = noclipbutton.Position + UDim2.new(0,0,0,2) end);noclipbutton.MouseLeave:Connect(function() noclipbutton.Position = noclipbutton.Position - UDim2.new(0,0,0,2) end)
	local flingbutton = buttontemplate:Clone();flingbutton.Text = "fling";flingbutton.Parent = scrollingframe;flingbutton.Position = UDim2.new(0,0,0,(21 * 1));flingbutton.MouseEnter:Connect(function() flingbutton.Position = flingbutton.Position + UDim2.new(0,0,0,2) end);flingbutton.MouseLeave:Connect(function() flingbutton.Position = flingbutton.Position - UDim2.new(0,0,0,2) end)
	local antiflingbutton = buttontemplate:Clone();antiflingbutton.Text = "antifling";antiflingbutton.Parent = scrollingframe;antiflingbutton.Position = UDim2.new(0,0,0,(21 * 2));antiflingbutton.MouseEnter:Connect(function() antiflingbutton.Position = antiflingbutton.Position + UDim2.new(0,0,0,2) end);antiflingbutton.MouseLeave:Connect(function() antiflingbutton.Position = antiflingbutton.Position - UDim2.new(0,0,0,2) end)
	local airwalkbutton = buttontemplate:Clone();airwalkbutton.Text = "airwalk";airwalkbutton.Parent = scrollingframe;airwalkbutton.Position = UDim2.new(0,0,0,(21 * 3));airwalkbutton.MouseEnter:Connect(function() airwalkbutton.Position = airwalkbutton.Position + UDim2.new(0,0,0,2) end);airwalkbutton.MouseLeave:Connect(function() airwalkbutton.Position = airwalkbutton.Position - UDim2.new(0,0,0,2) end)
	local espbutton = buttontemplate:Clone();espbutton.Text = "esp";espbutton.Parent = scrollingframe;espbutton.Position = UDim2.new(0,0,0,(21 * 4));espbutton.MouseEnter:Connect(function() espbutton.Position = espbutton.Position + UDim2.new(0,0,0,2) end);espbutton.MouseLeave:Connect(function() espbutton.Position = espbutton.Position - UDim2.new(0,0,0,2) end)
	local antiinvisbutton = buttontemplate:Clone();antiinvisbutton.Text = "anti invis";antiinvisbutton.Parent = scrollingframe;antiinvisbutton.Position = UDim2.new(0,0,0,(21 * 5));antiinvisbutton.MouseEnter:Connect(function() antiinvisbutton.Position = antiinvisbutton.Position + UDim2.new(0,0,0,2) end);antiinvisbutton.MouseLeave:Connect(function() antiinvisbutton.Position = antiinvisbutton.Position - UDim2.new(0,0,0,2) end)
	local fullbrightbutton = buttontemplate:Clone();fullbrightbutton.Text = "fullbright";fullbrightbutton.Parent = scrollingframe;fullbrightbutton.Position = UDim2.new(0,0,0,(21 * 6));fullbrightbutton.MouseEnter:Connect(function() fullbrightbutton.Position = fullbrightbutton.Position + UDim2.new(0,0,0,2) end);fullbrightbutton.MouseLeave:Connect(function() fullbrightbutton.Position = fullbrightbutton.Position - UDim2.new(0,0,0,2) end)
	local aimbotbutton = buttontemplate:Clone();aimbotbutton.Text = "aimbot(wip)";aimbotbutton.Parent = scrollingframe;aimbotbutton.Position = UDim2.new(0,0,0,(21 * 7));aimbotbutton.MouseEnter:Connect(function() aimbotbutton.Position = aimbotbutton.Position + UDim2.new(0,0,0,2) end);aimbotbutton.MouseLeave:Connect(function() aimbotbutton.Position = aimbotbutton.Position - UDim2.new(0,0,0,2) end)
	local darkdexbutton = buttontemplate:Clone();darkdexbutton.Text = "darkdex";darkdexbutton.Parent = scrollingframe;darkdexbutton.Position = UDim2.new(0,0,0,(21 * 8));darkdexbutton.MouseEnter:Connect(function() darkdexbutton.Position = darkdexbutton.Position + UDim2.new(0,0,0,2) end);darkdexbutton.MouseLeave:Connect(function() darkdexbutton.Position = darkdexbutton.Position - UDim2.new(0,0,0,2) end)
	local simplespybutton = buttontemplate:Clone();simplespybutton.Text = "simplespy";simplespybutton.Parent = scrollingframe;simplespybutton.Position = UDim2.new(0,0,0,(21 * 9));simplespybutton.MouseEnter:Connect(function() simplespybutton.Position = simplespybutton.Position + UDim2.new(0,0,0,2) end);simplespybutton.MouseLeave:Connect(function() simplespybutton.Position = simplespybutton.Position - UDim2.new(0,0,0,2) end)
	local yeildbutton = buttontemplate:Clone();yeildbutton.Text = "inf yeild";yeildbutton.Parent = scrollingframe;yeildbutton.Position = UDim2.new(0,0,0,(21 * 10));yeildbutton.MouseEnter:Connect(function() yeildbutton.Position = yeildbutton.Position + UDim2.new(0,0,0,2) end);yeildbutton.MouseLeave:Connect(function() yeildbutton.Position = yeildbutton.Position - UDim2.new(0,0,0,2) end)
	local goonbutton = buttontemplate:Clone();goonbutton.Text = "goon scr(n)";goonbutton.Parent = scrollingframe;goonbutton.Position = UDim2.new(0,0,0,(21 * 11));goonbutton.MouseEnter:Connect(function() goonbutton.Position = goonbutton.Position + UDim2.new(0,0,0,2) end);goonbutton.MouseLeave:Connect(function() goonbutton.Position = goonbutton.Position - UDim2.new(0,0,0,2) end)
	local spinbutton = buttontemplate:Clone();spinbutton.Text = "spin scr(p)";spinbutton.Parent = scrollingframe;spinbutton.Position = UDim2.new(0,0,0,(21 * 12));spinbutton.MouseEnter:Connect(function() spinbutton.Position = spinbutton.Position + UDim2.new(0,0,0,2) end);spinbutton.MouseLeave:Connect(function() spinbutton.Position = spinbutton.Position - UDim2.new(0,0,0,2) end)
	local nukebutton = buttontemplate:Clone();nukebutton.Text = "nuke scr(p)";nukebutton.Parent = scrollingframe;nukebutton.Position = UDim2.new(0,0,0,(21 * 13));nukebutton.MouseEnter:Connect(function() nukebutton.Position = nukebutton.Position + UDim2.new(0,0,0,2) end);nukebutton.MouseLeave:Connect(function() nukebutton.Position = nukebutton.Position - UDim2.new(0,0,0,2) end)
	local movescriptbutton = buttontemplate:Clone();movescriptbutton.Text = "tp scr(...)";movescriptbutton.Parent = scrollingframe;movescriptbutton.Position = UDim2.new(0,0,0,(21 * 14));movescriptbutton.MouseEnter:Connect(function() movescriptbutton.Position = movescriptbutton.Position + UDim2.new(0,0,0,2) end);movescriptbutton.MouseLeave:Connect(function() movescriptbutton.Position = movescriptbutton.Position - UDim2.new(0,0,0,2) end)
	if noclip then toggleabutton(noclipbutton) end
	if fling then toggleabutton(flingbutton) end
	if antifling then toggleabutton(antiflingbutton) end
	if airwalk then toggleabutton(airwalkbutton) end
	if esp then toggleabutton(espbutton) end
	if antitransparency then toggleabutton(antiinvisbutton) end
	if fullbright then toggleabutton(fullbrightbutton) end
	if aimbot then toggleabutton(aimbotbutton) end
	noclipbutton.MouseButton1Click:Connect(function()
		toggleabutton(noclipbutton)
		noclip = not noclip
	end)
	flingbutton.MouseButton1Click:Connect(function()
		toggleabutton(flingbutton)
		fling = not fling
	end)
	antiflingbutton.MouseButton1Click:Connect(function()
		toggleabutton(antiflingbutton)
		antifling = not antifling
	end)
	airwalkbutton.MouseButton1Click:Connect(function()
		toggleabutton(airwalkbutton)
		airwalk = not airwalk
	end)
	espbutton.MouseButton1Click:Connect(function()
		toggleabutton(espbutton)
		highlightplayers = not highlightplayers
	end)
	antiinvisbutton.MouseButton1Click:Connect(function()
		toggleabutton(antiinvisbutton)
		antitransparency = not antitransparency
	end)
	fullbrightbutton.MouseButton1Click:Connect(function()
		toggleabutton(fullbrightbutton)
		fullbright = not fullbright
	end)
	aimbotbutton.MouseButton1Click:Connect(function()
		toggleabutton(aimbotbutton)
		aimbot = not aimbot
	end)
	darkdexbutton.MouseButton1Click:Connect(function()
		opendarkdex()
	end)
	simplespybutton.MouseButton1Click:Connect(function()
		opensimplespy()
	end)
	yeildbutton.MouseButton1Click:Connect(function()
		openinfyeild()
	end)
	movescriptbutton.MouseButton1Click:Connect(function()
		task.spawn(runsubsonicscript)
	end)
	goonbutton.MouseButton1Click:Connect(function()
		task.spawn(rungoonscript)
	end)
	spinbutton.MouseButton1Click:Connect(function()
		task.spawn(runspinscript)
	end)
	nukebutton.MouseButton1Click:Connect(function()
		task.spawn(runnukescript)
	end)
	gui.Parent = ourplayer.PlayerGui

end
function findclosestplayer()
	local index = 1
	local b = false
	local curtarget = (Players:GetChildren())[1]
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
	for _,v in pairs(Players:GetPlayers()) do
		if (not (v == ourplayer)) and (not (v == nil)) then
			-- for _, d in pairs(v:GetDescendants()) do
			-- 	print(d.Name)
			-- end
			pcall(function()
				if (getdistance(ourhumrp.CFrame.Position, curtarget.Character.HumanoidRootPart.CFrame.Position) > getdistance(ourhumrp.CFrame.Position, v.Character.HumanoidRootPart.CFrame.Position)) then
					curtarget = v
				end
			end)
		end
	end
	return curtarget
end

game.workspace.DescendantAdded:Connect(function(obj)
    table.insert(Objectlist, obj)
    table.insert(newobjectlist, obj)
end)
local movel = 0.1
ourRunService.Heartbeat:Connect(function()
    if not isplayerdead then
        if fling then

            local vel = ourhumrp.Velocity
            if not isplayerdead then
                ourhumrp.Velocity = Vector3.new(ourhumrp.CFrame.LookVector.x * math.random(999,99999), 0, ourhumrp.CFrame.LookVector.z * math.random(999,99999))
            end
            ourRunService.RenderStepped:Wait()
            if not isplayerdead then
                ourhumrp.Velocity = vel
            end
            ourRunService.Stepped:Wait()
            
        end
    end
end)
local function highlightObj(Obj, Red, Green, Blue, Transparency, OutlineRed, OutlineGreen, OutlineBlue, OutlineTransparency)
    -- Prevent duplicates
    if Obj:FindFirstChild("objESP_Highlight") then Obj:FindFirstChild("objESP_Highlight"):Destroy() end

    local highlight = Instance.new("Highlight")
    highlight.Name = "objESP_Highlight"
    highlight.FillColor = Color3.fromRGB(Red, Green, Blue)
    highlight.OutlineColor = Color3.fromRGB(OutlineRed, OutlineGreen, OutlineBlue)
    highlight.FillTransparency = Transparency
    highlight.OutlineTransparency = OutlineTransparency
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Adornee = Obj
    highlight.Parent = Obj
end
ourRunService.PostSimulation:Connect(function()
	if airwalk then
        if not airwalkpart then
            airwalkpart = Instance.new("Part")
	    	airwalkpart.Size = Vector3.new(4, 1, 4)
	    	airwalkpart.Anchored = true
    	    airwalkpart.Material = Enum.Material.Concrete
    	    airwalkpart.Color = Color3.fromRGB(200, 200, 200)
    	    airwalkpart.Name = "airwalkpart"
    	    airwalkpart.Parent = workspace
		end
        if inputservice:isKeyDown(Enum.KeyCode.LeftAlt) then
            airwalkpart.Position = ourhumrp.Position - Vector3.new(0, (ourhumrp.Size.Y/2 + humanoidhipheight) + (airwalkpart.Size.Y/2) + 1, 0)
            airwalkpart.CanCollide = false
        else
            airwalkpart.Position = ourhumrp.Position - Vector3.new(0, (ourhumrp.Size.Y/2 + humanoidhipheight) + (airwalkpart.Size.Y/2), 0)
            airwalkpart.CanCollide = true
        end
    end
    if noclip then
        wasnoclip = true
        for _, v in pairs(ourchar:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
                table.insert(nocliplist, v)
            end
        end
    elseif wasnoclip and #nocliplist > 0 then
        wasnoclip = false
        for _, v in pairs(nocliplist) do
            v.CanCollide = true
        end
        nocliplist = {}
    end
	if fullbright then
        ourlighting.FogEnd = math.huge
        ourlighting.FogStart = math.huge
        ourlighting.ClockTime = 16
        ourlighting.Brightness = 2
        ourlighting.GlobalShadows = false
		ourlighting.Technology = Enum.Technology.Compatibility
		--ourlighting.LightingStyle = Enum.LightingStyle.Soft
		ourlighting.EnvironmentSpecularScale = 0
    end
end)
ourRunService.PreSimulation:Connect(function()
    if airwalk then
        if not airwalkpart then
            airwalkpart = Instance.new("Part")
	    	airwalkpart.Size = Vector3.new(4, 1, 4)
	    	airwalkpart.Anchored = true
    	    airwalkpart.Material = Enum.Material.Concrete
    	    airwalkpart.Color = Color3.fromRGB(200, 200, 200)
    	    airwalkpart.Name = "airwalkpart"
    	    airwalkpart.Parent = workspace
		end
        if inputservice:isKeyDown(Enum.KeyCode.LeftAlt) then
            airwalkpart.Position = ourhumrp.Position - Vector3.new(0, (ourhumrp.Size.Y/2 + humanoidhipheight) + (airwalkpart.Size.Y/2) + 1, 0)
            airwalkpart.CanCollide = false
        else
            airwalkpart.Position = ourhumrp.Position - Vector3.new(0, (ourhumrp.Size.Y/2 + humanoidhipheight) + (airwalkpart.Size.Y/2), 0)
            airwalkpart.CanCollide = true
        end
    end
    if antifling then
        wasantifling = true
        for _, p in pairs(Players:GetChildren()) do
            if p.Character and p ~= ourplayer then
                for _, v in pairs(p.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                        table.insert(antiflinglist, v)
                    end
                end
            end
        end
    elseif wasantifling and #antiflinglist > 0 then
        wasantifling = false
        for _, v in pairs(antiflinglist) do
            v.CanCollide = true
        end
        antiflinglist = {}
    end
    
end)
ourRunService.Stepped:Connect(function()
    if dospeed then pcall(function()ourhum.WalkSpeed = walkspeedvar end) end
    if dojump then pcall(function()ourhum.JumpPower = jumppowervar end) end
end)
ourRunService.PreAnimation:Connect(function()
    if dospeed then pcall(function()ourhum.WalkSpeed = walkspeedvar end) end
    if dojump then pcall(function()ourhum.JumpPower = jumppowervar end) end
end)



ourRunService.RenderStepped:Connect(function()
	Camera = Workspace.CurrentCamera
	if fullbright then
        ourlighting.FogEnd = math.huge
        ourlighting.FogStart = math.huge
        ourlighting.ClockTime = 16
        ourlighting.Brightness = 2
        ourlighting.GlobalShadows = false
		ourlighting.Technology = Enum.Technology.Compatibility
		--ourlighting.LightingStyle = Enum.LightingStyle.Soft
		ourlighting.EnvironmentSpecularScale = 0
    end
	if aimbot then
		--pcall(function()
			Camera.CFrame = CFrame.lookAt(Camera.CFrame.Position, findclosestplayer().Character.Head.Position)
		--end)
	end
    if antitransparency then
		wasantitransparency = true
        for i, v in pairs(newobjectlist) do
            if v:IsA("BasePart") and not (v.Name == "HumanoidRootPart") then
                if v.Transparency > 0.95 then
                    v.Transparency = 0.75
					table.insert(antitransparencylist, v)
                end
            end
        end
        table.clear(newobjectlist)
    elseif wasantitransparency and #antitransparencylist > 0 then
		for _, v in pairs(antitransparencylist) do
			v.Transparency = 1
		end
	end
    if highlightplayers then
        washighlightingplayers = true
        for i, v in pairs(Players:GetChildren()) do
            if not (v.Name == ourplayer.Name) then
                if v.Character then
                    highlightObj(v.Character, 255, 0, 0, 0.5, 255, 0, 0, 0)
                end
            end
        end
    end
    if (not highlightplayers and washighlightingplayers) then
        washighlightingplayers = false
        for i, v in pairs(Players:GetChildren()) do
            if not (v == ourplayer) then
                pcall(function()v.Character.objESP_Highlight:Destroy() end)
            end
        end
    end
end)


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
	uiinit()
end)
uiinit()

