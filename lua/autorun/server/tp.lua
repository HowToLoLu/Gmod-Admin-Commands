--Define TP command
local tp_to = {
	name = "tp_to",
	fun = function ( ply, cmd, args)
	
		--Check if args are nil
		if (args[1] == nil) then print(acerrs[1]) return end
		if (ply==nil) then print("You must run this as a player!") return end
		
		--Get target player
		if(cmd~=admincommands.tp_to.name .. "byid") then
			tarPly = adminfunctions.getplayerbyname(args[1])
		else
			tarPly = adminfunctions.getplayerbyid(args[1])
		end
		if (not tarPly) then return end
		
		--Make executing player noclip to avoid death
		ply:ConCommand("noclip")
		
		--Actually TP
		ply:SetPos(tarPly:GetPos())
		
	end
}

local tp_here = {
	name = "tp_here",
	fun = function ( ply, cmd, args)
	
		--Check if args are nil
		if (args[1] == nil) then print(acerrs[1]) return end
		
		--Get target player
		if(cmd~=admincommands.tp_here.name .. "byid") then
			tarPly = adminfunctions.getplayerbyname(args[1])
		else
			tarPly = adminfunctions.getplayerbyid(args[1])
		end
		if (not tarPly) then return end
		
		--Make target player not kill the other
		tarPly:ConCommand("noclip")
		
		--Actually TP
		tarPly:SetPos(ply:GetPos())
		
	end
}

--Add to list
admincommands["tp_to"] = tp_to
admincommands["tp_here"] = tp_here

--Register Commands
concommand.Add( admincommands.tp_to.name, admincommands.tp_to.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY )
concommand.Add( admincommands.tp_to.name .. "byid", admincommands.tp_to.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.tp_here.name, admincommands.tp_here.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY )
concommand.Add( admincommands.tp_here.name .. "byid", admincommands.tp_here.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)