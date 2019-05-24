adminfunctions = {
	--define ArgChecker 1 is good, 0 is bad
	nilargcheck = function (argstocheck, numofargs, errormessages)
		
		for curarg=1,numofargs do
			
			if(argstocheck[curarg] == nil) then
				print (errormessages[curarg])
				return nil
			end
			
		end
		
		return 1
		
	end,

	--Gets the player by name
	getplayerbyname = function (name) 
		
		--Iterate through each one
		for k, v in ipairs(player.GetAll()) do
			
			if (v:GetName() == name) then
				return v
			end
			
		end
		
		print("Invalid Player Name")
		
		return nil
		
	end,

	getplayerbyid = function (id) 
		
		for k, v in ipairs(player.GetAll()) do
			
			if (v:SteamID64() == id) then
				return v
			end
			
		end
		
		print("Invalid Player ID")
		
		return nil
		
	end
}

acerrs = {
	"No target player specified",
	"No usergroup specified"
}

admincommands = {
	
	togglefreezecon = {
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
	},
	
	--Define usergroup command
	usergroupcon = {
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
				print ( "You are not Super Admin" )
				
			end
			
		end
	},
	
	--Define slay command
	slaycon = {
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
	},
	
	getPlayersCon = {
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
}

--Add commands
concommand.Add( admincommands.togglefreezecon.name, admincommands.togglefreezecon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.togglefreezecon.name .. "byid", admincommands.togglefreezecon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.slaycon.name, admincommands.slaycon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY )
concommand.Add( admincommands.slaycon.name .. "byid", admincommands.slaycon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.usergroupcon.name, admincommands.usergroupcon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.usergroupcon.name .. "byid", admincommands.usergroupcon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
concommand.Add( admincommands.getPlayersCon.name, admincommands.getPlayersCon.fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)
--concommand.Add( admincommands..name, admincommands..fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)