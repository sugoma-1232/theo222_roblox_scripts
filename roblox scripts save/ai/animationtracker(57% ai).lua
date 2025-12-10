-- Animation Tracker Script (Public Animations Only)
-- Place this in StarterPlayer > StarterCharacterScripts or StarterPlayerScripts

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local player = Players.LocalPlayer
local publiclist = {}
local function isAnimationPublic(animationId)
	local numericId = tonumber(string.match(animationId, "%d+"))
	if not numericId then
		return false
	end
	local success, productInfo = pcall(function()
		return MarketplaceService:GetProductInfo(numericId, Enum.InfoType.Asset)
	end)
	
	if not success or not productInfo then
		return false
	end
	if productInfo.Creator then
		if productInfo.Creator.CreatorType == "User" and productInfo.Creator.CreatorTargetId == 1 then
			return true
		end
	end
	return false
end

-- Wait for character to load
local function onCharacterAdded(character)
	local humanoid = character:WaitForChild("Humanoid")
	
	-- Connect to AnimationPlayed event
	humanoid.AnimationPlayed:Connect(function(animationTrack)
		-- Get the animation ID
		local animation = animationTrack.Animation
		local animationId = animation.AnimationId
		if isAnimationPublic(animationId) then
			print("Public Animation Playing - ID:", animation.AnimationId)
			local isinlist = false
			for _, dih in pairs(publiclist) do
				if dih == tostring(animationId) then
					isinlist = true
					break
				end
			end
			if not isinlist then 
				table.insert(publiclist, tostring(animationId))
			end
			--setclipboard(animationId){
		else
			print("Private Animation Playing - ID:", animationId)
		end
	end)
	
	print("Animation tracker initialized for", player.Name)
end
if player.Character then
	onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)
while task.wait() do
	if game.UserInputService:IsKeyDown(Enum.KeyCode.P) then
		local a = '{'
		for i, v in pairs(publiclist) do
			if (i ~= #publiclist) then
				a = a .. ('"'.. v.. '", ')
			else
				a = a .. ('"'.. v.. '"')
			end
		end
		a = a.."}"
		setclipboard(a)
	end
end
