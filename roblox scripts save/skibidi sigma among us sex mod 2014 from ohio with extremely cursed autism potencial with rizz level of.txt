local MaxSpeed = 300 -- Studs per second 380 no flag but kick

local LocalPlayer = game:GetService("Players").LocalPlayer
local Locations = workspace._WorldOrigin.Locations

local UserInputService = game:GetService("UserInputService")

local function getCharacter()
    if not LocalPlayer.Character then
        LocalPlayer.CharacterAdded:Wait()
    end
    LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    return LocalPlayer.Character
end

local function DistanceFromPlrSort(ObjectList: table)
    local RootPart = getCharacter().LowerTorso
    table.sort(ObjectList, function(ChestA, ChestB)
        local RootPos = RootPart.Position
        local DistanceA = (RootPos - ChestA.Position).Magnitude
        local DistanceB = (RootPos - ChestB.Position).Magnitude
        return DistanceA < DistanceB
    end)
end

local UncheckedChests = {}
local FirstRun = true
--local BlackListedChests = {}

local function getChestsSorted()
    if FirstRun then
        FirstRun = false
        local Objects = game:GetDescendants()
        for i, Object in pairs(Objects) do
            if Object.Name:find("Chest") and Object.ClassName == "Part" then
                table.insert(UncheckedChests, Object)
            end
        end
    end
    local Chests = {}
    for i, Chest in pairs(UncheckedChests) do
        if Chest:FindFirstChild("TouchInterest") then
            table.insert(Chests, Chest)
        end
    end
    DistanceFromPlrSort(Chests)
    return Chests
end

local function toggleNoclip(Toggle: boolean)
    for i,v in pairs(getCharacter():GetChildren()) do
        if v.ClassName == "Part" then
            v.CanCollide = not Toggle
        end
    end
end

local function Teleport(Goal: CFrame, Speed)
    if not Speed then
        Speed = MaxSpeed
    end
    toggleNoclip(true)
    local RootPart = getCharacter().HumanoidRootPart
    local Magnitude = (RootPart.Position - Goal.Position).Magnitude

    RootPart.CFrame = RootPart.CFrame
    RootPart.CFrame = CFrame.lookAt(RootPart.CFrame.Position, Vector3.new(Goal.X, RootPart.CFrame.Y, Goal.Z))
    while not (Magnitude < 1) and not UserInputService:IsKeyDown(Enum.KeyCode.P) do
        local Direction = (Goal.Position - RootPart.Position).unit
        RootPart.CFrame = RootPart.CFrame + Direction * (Speed * wait())
        Magnitude = (RootPart.Position - Goal.Position).Magnitude
        

        
    end
    toggleNoclip(false)
end

local function main()
	local stop = false
	local lastchest = nil
	local oldahhlastchest
	local indexcounter = 0

    while wait() and not UserInputService:IsKeyDown(Enum.KeyCode.P) and not stop do
    	indexcounter = indexcounter + 1
        local Chests = getChestsSorted()
        if #Chests > 0 then
        	
        	if indexcounter % 10 == 0 then
        		if lastchest == Chests[1].CFrame then
        			getCharacter():WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        			getCharacter():WaitForChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Landed)
        		else
        			lastchest = Chests[1].CFrame
        		end
        	else
            	Teleport(Chests[1].CFrame)
            end
            if indexcounter % 100 == 0 then
            	if oldahhlastchest == Chests[1].CFrame then
        			stop = true
        		else
        			oldahhlastchest = Chests[1].CFrame
        		end
        	end
        end
        if #Chests < 2 then stop = true end
        
        print(#Chests)
    end
end

wait = task.wait
main()
