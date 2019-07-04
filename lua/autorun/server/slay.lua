--Define slay command
local slaycon = {
	name = "slay",
	fun = function ( ply, cmd, args)
		
		--Check if player is superadmin
		if (ply:IsUserGroup("superadmin")) then
			
			--Check if args are nil
			if (args[1] == nil) then print(acerrs[1]) return end
							
			--Get target player
			if(cmd~=admincommands.slaycon.name .. "byid") then
				tarPly = adminfunctions.getplayerbyname(args[1])
			else
				tarPly = adminfunctions.getplayerbyid(args[1])
			end
			if (not tarPly) then return end
			
			tarPly:Kill()
			
			print("Killed " .. tarPly:GetName() .. " | " .. tarPly:SteamID64())
			
		else
			
			print("You are not Super Admin")
			
		end
		
	end
}

--Add to list
table.insert(admincommands, slaycon)

--Register Commands
concommand.Add( admincommands.slaycon.name, admincommands.slaycon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY )
concommand.Add( admincommands.slaycon.name .. "byid", admincommands.slaycon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)