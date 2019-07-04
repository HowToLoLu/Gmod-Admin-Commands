--Create command
local togglefreezecon = {
	name = "togglefreeze",
	fun = function ( ply, cmd, args)
		
		if(not adminfunctions.nilargcheck(args, 1, {acerrs[1]})) then return end
		
		if(cmd~=admincommands.togglefreezecon.name .. "byid") then
			tarPly = adminfunctions.getplayerbyname(args[1])
		else
			tarPly = adminfunctions.getplayerbyid(args[1])
		end

		if (not tarPly) then return end
		
		if(tarPly:IsFrozen()) then
			tarPly:Freeze()
			mod = "Unf"
		else
			tarPly:Freeze(true)
			mod = "F"
		end
		
		print (mod .. "roze " .. tarPly:GetName() .. " | " .. tarPly:SteamID64())
		
	end
}

--Add to the command list
table.insert(admincommands, togglefreezecon)

--Register Commands
concommand.Add( admincommands.togglefreezecon.name, admincommands.togglefreezecon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.togglefreezecon.name .. "byid", admincommands.togglefreezecon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
