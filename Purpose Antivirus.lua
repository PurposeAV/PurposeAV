local BootGUI = script.Parent:WaitForChild("Boot");
local AlertGUI = script.Parent:WaitForChild("RemovedThreat");
local IsScanning = false;

AlertGUI.Visible = false;
BootGUI.Visible = false;

wait(1)

BootGUI.Visible = true;

wait(5)

BootGUI.Visible = false;

wait(1)

IsScanning = true;

local function scan()
	local function scanInstance(instance, location)
		if string.lower(instance.Name) == "virus" or string.lower(instance.Name) == "anti lag" or string.lower(instance.Name) == "lag" or string.lower(instance.name) == "lag virus" then
			local threatName = instance.Name;
			print("Positive Detection!");
			instance:Remove();
			print("Successfully Removed '"..instance.Name.."' in "..location);
			AlertGUI:WaitForChild("Note").Text = "'"..instance.Name.."' in game/"..location..".";
			AlertGUI.Visible = true;
			wait(2)
			AlertGUI.Visible = false;
		end
		if instance:IsA("Model") then
			for k_, index in pairs(instance:GetChildren()) do
				scanInstance(index);
			end
		end
	end

	for k_, index in pairs(game.Workspace:GetChildren()) do
		scanInstance(index, "Workspace");
	end
	
	for k_, index in pairs(game.Players:GetChildren()) do
		scanInstance(index, "Players");
	end
	
	for k_, index in pairs(game.Lighting:GetChildren()) do
		scanInstance(index, "Lighting");
	end
	
	for k_, index in pairs(game.MaterialService:GetChildren()) do
		scanInstance(index, "MaterialService");
	end
	
	for k_, index in pairs(game.NetworkClient:GetChildren()) do
		scanInstance(index, "NetworkClient");
	end
	
	for k_, index in pairs(game.ReplicatedFirst:GetChildren()) do
		scanInstance(index, "ReplicatedFirst");
	end
	
	for k_, index in pairs(game.ReplicatedStorage:GetChildren()) do
		scanInstance(index, "ReplicatedStorage");
	end
	
	for k_, index in pairs(game.ServerScriptService:GetChildren()) do
		scanInstance(index, "ServerScriptService");
	end
	
	for k_, index in pairs(game.ServerStorage:GetChildren()) do
		scanInstance(index, "ServerStorage");
	end
	
	for k_, index in pairs(game.StarterGui:GetChildren()) do
		scanInstance(index, "StarterGui");
	end
	
	for k_, index in pairs(game.StarterPack:GetChildren()) do
		scanInstance(index, "StarterPack");
	end
	
	for k_, index in pairs(game.StarterPlayer:GetChildren()) do
		scanInstance(index, "StarterPlayer");
	end
	
	for k_, index in pairs(game.Teams:GetChildren()) do
		scanInstance(index, "Teams");
	end
	
	for k_, index in pairs(game.SoundService:GetChildren()) do
		scanInstance(index, "SoundService");
	end
	
	for k_, index in pairs(game.TextChatService:GetChildren()) do
		scanInstance(index, "TextChatService");
	end
	
end

while true do
	
	if IsScanning == true then
			
		scan();
		
		wait(1)
		
	end
	
end
