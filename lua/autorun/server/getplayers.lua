--Create command
local getPlayersCon = {
	name = "getPlayers",
	fun = function (ply, cmd, args)
	
		--Check if player is at least admin
		if (ply:IsUserGroup( "admin" ) or ply:IsUserGroup( "superadmin" )) then
			
			playersWithIds = {
				
			}
			
			for k, v in ipairs(player.GetAll()) do
				playerKeyPair = {
					
				}
				table.insert(playersWithIds, v:GetName() .. " | " .. v:SteamID64())
			end
			
			PrintTable(playersWithIds)
			
		else
			
			print("You are not Admin")
			
		end
	
	end
}

--Add it to the list
table.insert(admincommands, getPlayersCon)

--Register Command
concommand.Add( admincommands.getPlayersCon.name, admincommands.getPlayersCon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)