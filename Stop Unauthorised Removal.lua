local AV = script.Parent;

while true do
	
	if #AV:WaitForChild("Purpose Antivirus") < 1 then
			
		for k_, plyr in pairs(game:GetService("Players"):GetPlayers()) do
				
				plyr:Kick("An unauthorised third party attempted to remove PurposeAV.")
				
		end
			
	end
end
