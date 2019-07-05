--Define usergroup command
local usergroup_con = {
	name = "usergroup",
	fun = function ( ply, cmd, args)
		
		--Check if User is superadmin
		if (ply:IsUserGroup("superadmin")) then
			
			--Check if arguments are nil
			if (not adminfunctions.nilargcheck(args, 2, {acerrs[1], acerrs[2]})) then return end				
			
			--Get target player
			if(cmd~=admincommands.usergroupcon.name .. "byid") then
				tarPly = adminfunctions.getplayerbyname(args[1])
			else
				tarPly = adminfunctions.getplayerbyid(args[1])
			end
			if (not tarPly) then return end
			
			--Actually set the group
			tarPly:SetUserGroup( args[2] )
			
			--Output Success
			print ("Set " .. tarPly:GetName() .. " | " .. tarPly:SteamID64() .. " to usergroup " .. args[2])
			
		else	
			
			--Output Error
			print ( "You are not a Super Admin" )
			
		end
		
	end
}

--Insert command into list
admincommands["usergroup_con"] = usergroup_con

--Register Commands
concommand.Add( admincommands.usergroup_con.name, admincommands.usergroup_con.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.usergroup_con.name .. "byid", admincommands.usergroup_con.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)