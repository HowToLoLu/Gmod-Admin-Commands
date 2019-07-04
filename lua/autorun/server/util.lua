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
