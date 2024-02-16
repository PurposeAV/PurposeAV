local BootGUI = script.Parent:WaitForChild("Boot");
local AlertGUI = script.Parent:WaitForChild("RemovedThreat");
local IsScanning = false;
local Prnt = script.Parent;

AlertGUI.Visible = false;
BootGUI.Visible = false;

wait(1)

BootGUI.Visible = true;

wait(5);

BootGUI.Visible = false;

wait(1);

IsScanning = true;

local function scan()
	local function scanInstance(instance, location)
		
		local blacklistednames = {
			"virus",
			"anti lag",
			"lag",
			"lag virus"
		};
		
		if table.find(blacklistednames, string.lower(instance.Name)) then
			print("Positive Detection!");
			if #instance:GetChildren() > 0 then
				
				for k_, child in ipairs(instance:GetChildren()) do
					
					child:Remove();
					
				end
				
			end
			print("Successfully Removed '"..instance.Name.."' in "..location);
			AlertGUI:WaitForChild("Note").Text = "'"..instance.Name.."' in game."..location..".";
			AlertGUI.Visible = true;
			wait(2);
			AlertGUI.Visible = false;
		end
		
		if #instance:GetChildren() > 0 then
			for k_, child in pairs(instance:GetChildren()) do
				scanInstance(child, instance .. "." .. child.Name);
			end
			
		end
	end

	local targets = {
		
		game.Workspace,
		game.Players,
		game.ServerScriptService,
		game.StarterGui,
		game.StarterPack,
		game.StarterPlayer:WaitForChild("StarterPlayerScripts"),
		game.StarterPlayer:WaitForChild("StarterCharacterScripts")
		
	};
	
	for k_, location in ipairs(targets) do
		
		scanInstance(location, location.Name);
		
	end

end

local function preventUnauthDestruction()

	if #Prnt:WaitForChild("Stop Unauthorised Removal") < 1 then
		
		for k_, plyr in pairs(game:GetService("Players"):GetPlayers()) do
			
			plyr:Kick("An unauthorised third party attempted to remove PurposeAV.");
			
		end
		
	end 
end

while true do
	preventUnauthDestruction();
	if IsScanning then
		scan();
	end
	wait(3);
	
end
