--Include Utilities
include("util.lua")

acerrs = {
	"No target player specified",
	"No usergroup specified"
}

admincommands = {
	
}

--Add commands - They register inside the script
include("usergroup.lua")
include("getplayers.lua")
include("togglefreeze.lua")
include("slay.lua")
include("tp.lua")
--concommand.Add( admincommands..name, admincommands..fun, nil, nil, FCVAR_SERVER_CANNOT_QUERY)