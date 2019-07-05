--Define slay command
local slay_con = {
	name = "slay",
	fun = function ( ply, cmd, args)
		
		--Check if player is superadmin
		if (ply:IsUserGroup("superadmin")) then
			
			--Check if args are nil
			if (args[1] == nil) then print(acerrs[1]) return end
							
			--Get target player
			if(cmd~=admincommands.slay_con.name .. "byid") then
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
admincommands["slay_con"] = slay_con

--Register Commands
concommand.Add( admincommands.slay_con.name, admincommands.slay_con.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY )
concommand.Add( admincommands.slay_con.name .. "byid", admincommands.slay_con.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)