--[[Here will be commands specific to a general command module. This will use
the current tCommandArrivals structure, and provide functionality for:

  - Drop in commands per script. Module scans directory.
  - Simple hooks for command detection and execution.
  - Control over ordering? (if it comes up)
  - Logic for rebuilding help commands per profile and outputting to text.
  
  ]]
--

local cmd = {}

cmd.execute = function(tUser, msg, cmd, where)
	local bRet, sMsg, sWhere, sFrom = tCommandArrivals[cmd]:Action(tUser, msg)
	if sWhere then
		where = sWhere
	end
	if sMsg then
		if where == "PM" then
			if sFrom then
				return Core.SendPmToUser(tUser, sFrom, sMsg), true
			else
				return Core.SendPmToUser(tUser, sHBName, sMsg), true
			end
		else
			if sFrom then
				return Core.SendToUser(tUser, "<" .. sFrom .. "> " .. sMsg), true
			else
				return Core.SendToUser(tUser, sFromHB .. sMsg), true
			end
		end
	else
		return bRet
	end
end

return cmd
