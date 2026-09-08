--This could easily just be replaced with bit masks.

tProtoPerms = {
	[1] = {
		[0] = true,
		[1] = true,
		[2] = true,
		[3] = true,
		[4] = false,
		[5] = false,
		[-1] = false,
	},
	[2] = {
		[0] = true,
		[1] = true,
		[2] = true,
		[3] = true,
		[4] = true,
		[5] = true,
		[-1] = true,
	},
	[3] = {
		[1] = true,
		[2] = true,
		[3] = true,
		[4] = true,
		[5] = true,
		[0] = true,
		[-1] = false,
	},
	[4] = {
		[1] = {
			[1] = false,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[0] = false,
			[-1] = true,
		},
		[2] = {
			[1] = false,
			[2] = false,
			[3] = true,
			[4] = true,
			[5] = true,
			[0] = false,
			[-1] = true,
		},
		[3] = {
			[1] = false,
			[2] = false,
			[3] = false,
			[4] = true,
			[5] = true,
			[0] = false,
			[-1] = true,
		},
		[4] = {
			[1] = false,
			[2] = false,
			[3] = false,
			[4] = false,
			[5] = false,
			[0] = false,
			[-1] = true,
		},
		[0] = {
			[1] = false,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = true,
			[0] = false,
			[-1] = true,
		},
		[5] = {
			[1] = false,
			[2] = false,
			[3] = false,
			[4] = false,
			[5] = false,
			[0] = false,
			[-1] = false,
		},
	},
}

tCommandArrivals = {
	--[[ --replace with bitmasks
		Guide to tProtoPerms:
			1 == Op only command.
			2 == All
			3 == Reg-only
			4 == Generic Multi-dimension (for source/target commands)
	]]
	bsshelp = {
		Permissions = tProtoPerms[2],
		sHelp = " - displays this very message (generated dynamically so sort order may change).\n",
	},
	regon = {
		Permissions = tProtoPerms[3],
		sHelp = " - replies with key statistics regarding registered users.\n",
	},
	addreguser = {
		Permissions = tProtoPerms[1],
		sHelp = " <NewUser> <Password> <PriofileName> - Registers new user with given password. Can user 'generatepass' in place of password (credit: Mutor) Try !canreg to check which profiles you can register. \n",
	},
	qreg = {
		Permissions = tProtoPerms[1],
		sHelp = " <NewUser> - makes lowest level user, for quick registration purposes.\n",
	},
	chuserprof = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = false,
			[4] = false,
			[5] = false,
		},
		sHelp = " <UserName> <NewProfile> - changes specified user to new profile, see !canreg first.\n",
	},
	broad = {
		Permissions = tProtoPerms[2],
		sHelp = " <Message> - Sends text to all applicable hubs.\n",
	},
	delreguser = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = false,
			[4] = false,
			[5] = false,
		},
		sHelp = " <UserName> - removes user from the registered users list.\n",
	},
	confirmreg = {
		Permissions = tProtoPerms[3],
		sHelp = " There is no helping you with this command.\n",
	},
	passwd = {
		Permissions = tProtoPerms[3],
		sHelp = " <NewPassword> - changes your login password to a new one.\n",
	},
	regme = {
		Permissions = tProtoPerms[2],
		sHelp = " - Places initial registration request.\n",
	},
	regstatus = {
		Permissions = tProtoPerms[1],
		sHelp = " - Provides you with vital information to maintain registered user queue.\n",
	},
	showreg = {
		Permissions = tProtoPerms[2],
		sHelp = " - Gives a list of every user registered in this hub.\n",
	},
	me = {
		Permissions = tProtoPerms[2],
		sHelp = " <Message> - Speaks in 3rd person.\n",
	},
	topic = {
		Permissions = tProtoPerms[2],
		sHelp = " <Topic> - Changes the topic to Topic, omit parements to display topic.\n",
	},
	history = {
		Permissions = tProtoPerms[2],
		sHelp = " - Displays chat history, to sign up for automatic history upon logon add 'onjoin' parameter.\n",
	},
	time = {
		Permissions = tProtoPerms[2],
		sHelp = " - Displays hub's local time, time zone included! (credit: Mutor)\n",
	},
	showtopic = {
		Permissions = tProtoPerms[2],
		sHelp = " - Same behavior as topic without an argument. Displays topic.\n",
	},
	joinstatus = {
		Permissions = tProtoPerms[2],
		sHelp = " - Displays the current joinsparts settings for each user\n",
	},
	chjoinmsg = {
		Permissions = tProtoPerms[3],
		sHelp = " <Message> - Changes join message to Message. Use with no arguments to change back to default.\n",
	},
	joinmsg = {
		Permissions = tProtoPerms[3],
		sHelp = " <UserName> - Toggles joinsparts off for specified user. User name is optional, without it toggles your own.\n",
	},
	banreason = {
		Permissions = tProtoPerms[2],
		sHelp = " <UserName> or <IP> - Displays information on specific user bans.\n",
	},
	warn = {
		Permissions = tProtoPerms[2],
		sHelp = " <UserName> <Reason> - Fires a warning message directly from you to the user. Reason is optional.\n",
	},
	mmreg = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = true,
			[4] = true,
			[5] = false,
		},
		sHelp = " <Message> - Sends message in PM to all registered users.\n",
	},
	ssgo = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = false,
			[3] = false,
			[4] = false,
			[5] = false,
		},
	},
	go = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = false,
			[4] = false,
			[5] = false,
		},
		sHelp = " <UserName> - Quickly disconnects a user without saying anything to them or the public. Shows up in your op chat.\n",
	},
	mimic = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = false,
			[2] = false,
			[3] = false,
			[4] = false,
			[5] = false,
		},
		sHelp = " <Message> - Displays message raw (without a nick) in main, try it out.\n",
	},
	saypm = {
		Permissions = {
			[-1] = false,
			[0] = true,
			[1] = true,
			[2] = true,
			[3] = false,
			[4] = false,
			[5] = false,
		},
		sHelp = " <Recipient> <FakeSender> <Message> - Masquerade as another user in PM. You can't see what replies you get though.....\n",
	},
	say = {
		Permissions = tProtoPerms[1],
		sHelp = " <FakeSender> <Message> - Masquerade as another user in main.\n",
	},
	getgags = {
		Permissions = tProtoPerms[1],
		sHelp = " - Provides a list of gagged users and their times.\n",
	},
	canreg = {
		Permissions = tProtoPerms[1],
		sHelp = " - Provides a list of the profiles you can register users as.\nl ",
	},
	tempgag = {
		Permissions = tProtoPerms[4],
		sHelp = " <UserName> <Amount><TimeFormat> - gags a user for the specified amount of time formats are single letters (s,m,h,d,w,M,y).\n",
	},
	gag = {
		Permissions = tProtoPerms[4],
		sHelp = " <UserName> - gags a user until they are ungagged.\n",
	},
	ungag = {
		Permissions = tProtoPerms[4],
		sHelp = " <UserName> - removes user from the gag list, see getgags to know who is gagged.\n",
	},
	nick = {
		Permissions = tProtoPerms[3],
		sHelp = " <Alias> - Changes your nick in chat to Alias until you change it back. Omit argument to default.\n",
	},
	aliasstatus = {
		Permissions = tProtoPerms[2],
		sHelp = " - Displays a list of all user's current aliases.\n",
	},
	killalias = {
		Permissions = tProtoPerms[1],
		sHelp = " <UserName> or <Alias> - Changes user to their default nick.\n",
	},
	noalias = {
		Permissions = tProtoPerms[2],
		sHelp = " - Toggles chat to display only real user names. Also used to toggle back.\n",
	},
}

--Welcome Bot commands

function tCommandArrivals.joinmsg:Action(tUser, sMsg)
	if #sMsg > 1 and Core.GetUserValue(tUser, 11) then
		local sMsg = sMsg:sub(1, -2)
		if BSS.WlcBot.tNoWlc[sMsg] then
			if RegMan.GetReg(sMsg) then
				BSS.WlcBot.tNoWlc[sMsg] = nil
				return true, "*** " .. sMsg .. "'s joins/parts announcements have been turned *ON*\124", "PM", sOCName
			else
				return true, "*** The username " .. sMsg .. " is not registered.\124"
			end
		else
			BSS.WlcBot.tNoWlc[sMsg] = true
			return true, "*** " .. sMsg .. "'s joins/parts announcements have been turned *OFF*\124", "PM", sOCName
		end
	elseif BSS.WlcBot.tNoWlc[tUser.sNick] then
		BSS.WlcBot.tNoWlc[tUser.sNick] = nil
		return true, "*** Your joins/parts announcements have been turned *ON*\124", "PM", sOCName
	else
		BSS.WlcBot.tNoWlc[tUser.sNick] = true
		return true, "*** Your joins/parts announcements have been turned *OFF*\124", "PM", sOCName
	end
end

function tCommandArrivals.chjoinmsg:Action(tUser, sMsg)
	if #sMsg > 1 then
		BSS.WlcBot.tWlc[tUser.sNick] = sMsg
		local sMsg = sMsg:sub(1, -2)
		return true,
			"*** Your join announcement message has been changed to: "
				.. sMsg
				.. ", to reset it to default type !chjoinmsg without parameters.\124",
			"PM",
			sOCName
	elseif BSS.WlcBot.tWlc[tUser.sNick] then
		BSS.WlcBot.tWlc[tUser.sNick] = nil
		return true, "*** Your join announcement is now set to default.\124", "PM", sOCName
	else
		return true, "*** Your join announcement is already set to default!\124", "PM", sOCName
	end
end

function tCommandArrivals.joinstatus:Action()
	local disp = ""
	for i, _ in pairs(BSS.WlcBot.tNoWlc) do
		local curEntry = ""
		if BSS.WlcBot.tWlc[i] then
			curEntry = "\n\t\t\7 Username: "
				.. i
				.. "\n\t\t\7 Message: "
				.. BSS.WlcBot.tWlc[i]:sub(1, -2)
				.. "\n\t\t\7 Status: Off\n"
		else
			curEntry = "\n\t\t\7 Username: " .. i .. "\n\t\t\7 Message: Default.\n\t\t\7 Status: Off\n"
		end
		disp = disp .. curEntry
	end
	for i, v in pairs(BSS.WlcBot.tWlc) do
		local curEntry = ""
		if not BSS.WlcBot.tNoWlc[i] then
			curEntry = "\n\t\t\7 Username: " .. i .. "\n\t\t\7 Message: " .. v:sub(1, -2) .. "\n\t\t\7 Status: On\n"
		end
		disp = disp .. curEntry
	end
	return true, "\n\n\t\t\t\t\t*-**-*-Join status-*-**-*\n\n" .. disp, "PM", sOCName
end

tCommandArrivals.history.subroutine = doHistory
--Misc Basic
function tCommandArrivals.history:Action(tUser, sMsg)
	local opt, i, j = sMsg:match("^%s*(%a-)%s*(%-?%d*)%s*(%--%d-)%s*|$")
	if sMsg:match("%S+%s*|$") and not opt and not i and not j then
		return true, self.sHelp
	end
	i, j = tonumber(i), tonumber(j)
	if opt == "onjoin" then --Extend the ShowHistory object to support custom length to onjoin history
		if BSS.ShowHistory[tUser.sNick] then
			BSS.ShowHistory[tUser.sNick] = nil
			return true, "*** You will no longer receive history onjoin.\124"
		else
			BSS.ShowHistory[tUser.sNick] = true
			return true, "*** You will now receive history automatically upon rejoining the hub.\124"
		end
	end
	return true, self.subroutine(ChatHistory, i, j)
end

function tCommandArrivals.time:Action()
	Core.SendToAll(sFromHB .. "*** Local server time: " .. doTime())
	return true
end

function tCommandArrivals.showtopic:Action()
	sTopic = SetMan.GetString(10) or "..but there is no topic. :( Any ideas?\124"
	Core.SendToAll(sFromHB .. "*** Current topic: " .. sTopic)
	return true
end

function tCommandArrivals.topic:Action(tUser, sMsg)
	if #sMsg < 1 then
		return self:subroutine(tUser, sMsg)
	end
end

function tCommandArrivals.broad:Action(tUser, sMsg)
	Core.SendToNick("broad", "<" .. tUser.sNick .. "> " .. sMsg)
	return true
end

tCommandArrivals.topic.subroutine = tCommandArrivals.showtopic.Action

function tCommandArrivals.warn:Action(tUser, sMsg)
	if #sMsg > 1 then
		local victim, reason = sMsg:match("(%S+)%s+(.*)")
		if victim then
			Core.SendToAll(
				sFromHB .. victim .. " was escorted from the hot springs by " .. tUser.sNick .. " because: " .. reason
			)
			if Core.GetUserValue(tUser, 11) then
				local tTargUser = Core.GetUser(victim)
				if tTargUser and tRegStatus[tTargUser.uptr] then
					if tRegStatus[tTargUser.uptr][2] == [[Unconfirmed]] then
						RegMan.DelReg(tTargUser.sNick)
					end
					TmrMan.RemoveTimer(tRegStatus[tTargUser.uptr][3])
					tRegStatus[tTargUser.uptr] = nil
					Core.SendPmToUser(
						tTargUser,
						sHBName,
						"Your registration request has been denied because (read the !rules before requesting again): "
							.. reason
					)
					return true, "*** User's registration status has been cleared and they've received a warning.\124"
				end
			end
			Core.SendPmToNick(victim, tUser.sNick, "Watch out you're being warned because: " .. reason)
			return true
		else
			return true, "*** Syntax error, type: " .. tSettings[1]:sub(4, 4) .. "warn <nick> <reason>\124"
		end
	else
		return true, "*** Syntax error, type: " .. tSettings[1]:sub(4, 4) .. "warn <nick> <reason>\124"
	end
end

function tCommandArrivals.ssgo:Action(tUser, sMsg)
	if #sMsg > 1 then
		sMsg = sMsg:sub(1, -2)
		local vic = Core.GetUser(sMsg)
		if vic then
			Core.Disconnect(vic)
			return true, "*** " .. vic.sNick .. " with IP:  " .. vic.sIP .. " dropped! :D\124"
		else
			return true, "*** User is offline.\124"
		end
	else
		return true, "*** Please specify the nick parameter !ssgo <nick>\124"
	end
end

function tCommandArrivals.go:Action(tUser, sMsg)
	if #sMsg > 1 then
		local ret = { self:subroutine(tCommandArrivals.ssgo, tUser, sMsg) }
		Core.SendPmToOps(sOCName, tUser.sNick .. " dropped " .. sMsg:sub(1, -2) .. " for no apparent reason.\124")
		return unpack(ret)
	else
		return true, "*** Please specify the nick parameter: !go <nick>\124"
	end
end

tCommandArrivals.go.subroutine = tCommandArrivals.ssgo.Action

function tCommandArrivals.mmreg:Action(tUser, sMsg)
	if #sMsg > 1 then
		sMsg = sMsg:sub(1, -2)
		for i = 0, ProfMan.GetProfile(#ProfMan.GetProfiles() - 1).iProfileNumber do
			Core.SendPmToProfile(i, SetMan.GetString(21), sMsg .. " //" .. tUser.sNick)
		end
		return true
	else
		return true, "*** No message parameter provided.\124"
	end
end

function tCommandArrivals.say:Action(tUser, sMsg)
	if #sMsg > 1 then
		local nick, msg = sMsg:match("(%S+)%s+(.*)")
		if msg then
			Core.SendToAll("<" .. nick .. "> " .. msg)
			return true
		else
			return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "say <nick> <message>\124"
		end
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "say <nick> <message>\124"
	end
end

function tCommandArrivals.mimic:Action(tUser, sMsg)
	if #sMsg > 1 then
		Core.SendToAll(sMsg)
		return true
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "mimic <message>\124"
	end
end

function tCommandArrivals.saypm:Action(tUser, sMsg)
	if #sMsg > 1 then
		to, from, msg = sMsg:match("(%S+)%s+(%S+)%s+(.*)")
		if msg then
			Core.SendPmToNick(to, from, msg)
			return true
		else
			return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "saypm <to> <from> <message>\124"
		end
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "saypm <to> <from> <message>\124"
	end
end

function tCommandArrivals.banreason:Action(tUser, sMsg)
	if #sMsg > 1 then
		local sIP, nick =
			sMsg:sub(1, -2):match("^(%d+%.%d+%.%d+%.%d+)$"), sMsg:sub(1, -2):match("^([^%d+%.%d+%.%d+%.%d+]%S+)$")
		local Item = nick or sIP
		local Result
		local tBanned = BanMan.GetBan(Item)
		if tBanned then
			if nick then
				local sUsersIP, sReason, sExpires =
					tBanned.sIP or "N/A", tBanned.sReason or "No reason given, ask " .. tBanned.sBy .. "?	"
				if tBanned.iExpireTime then
					sExpires = os.date("%H:%M - %x", tBanned.iExpireTime)
				else
					sExpires = "Permanent"
				end
				Result = "\n\n\t\t\7 Username:\t "
					.. tBanned.sNick
					.. "\n\t\t\7 IP:\t\t "
					.. sUsersIP
					.. "\n\t\t\7 Reason:\t "
					.. sReason
					.. "\n\t\t\7 Banned By:\t "
					.. tBanned.sBy
					.. "\n\t\t\7 Expires:\t "
					.. sExpires
					.. "\n\124"
			else
				Result = ""
				for i = 1, #tBanned, 1 do
					local sNick, sReason, sExpires =
						tBanned[i].sNick or "N/A",
						tBanned[i].sReason or "No reason given, ask " .. tBanned[i].sBy .. "?"
					if tBanned.iExpireTime then
						sExpires = os.date("%H:%M - %x", tBanned.iExpireTime)
					else
						sExpires = "Permanent"
					end
					local Item = "\n\n\t\t\7 Username:\t"
						.. sNick
						.. "\n\t\t\7 IP:\t\t"
						.. tBanned[i].sIP
						.. "\n\t\t\7 Reason:\t"
						.. sReason
						.. "\n\t\t\7 Banned By:\t"
						.. tBanned[i].sBy
						.. "\n\t\t\7 Expires:\t"
						.. sExpires
						.. "\n\124"
					Result = Item
				end
			end
		elseif sIP then
			Result = "*** The IP supplied (" .. sIP .. ") is not banned! Have a nick?\124"
		else
			Result = "*** The nick supplied (" .. nick .. ") is not banned! Have an IP?\124"
		end
		return true, Result
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "banreason <nick> or <IP>\124"
	end
end

--Gag Commands

function tCommandArrivals.gag:Action(tUser, sMsg)
	if #sMsg > 1 then
		local victim = sMsg:sub(1, -2):lower()
		if not BSS.GagBot.tGagged[victim] then
			local iVicProfNum = (RegMan.GetReg(victim) or {}).iProfile or -1
			if self.Permissions[tUser.iProfile][iVicProfNum] then
				BSS.GagBot.tGagged[victim] = true
				Core.SendToAll("* " .. tUser.sNick .. " puts " .. sMsg:sub(1, -2) .. " in Time Out *\124")
				return true
			else
				local sVicProfName = ProfMan.GetProfile(iVicProfNum).sProfileName or "unregistered user"
				return true, "*** Error, You cannot gag " .. sVicProfName .. "s!\124"
			end
		else
			return true, "*** " .. sMsg:sub(1, -2) .. " is already gagged. Check getgags.\124"
		end
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "gag <nick>\124"
	end
end

function tCommandArrivals.ungag:Action(tUser, sMsg)
	if #sMsg > 1 then
		local victim = sMsg:sub(1, -2):lower()
		if not BSS.GagBot.tGagged[victim] and not BSS.GagBot.tTimedGag[victim] then
			return true, "*** " .. sMsg:sub(1, -2) .. " isn't in Time Out.\124"
		else
			local iVicProfNum = (RegMan.GetReg(victim) or {}).iProfile or -1
			if self.Permissions[tUser.iProfile][iVicProfNum] then
				if BSS.GagBot.tGagged[victim] then
					BSS.GagBot.tGagged[victim] = nil
				else
					BSS.GagBot.tTimedGag[victim] = nil, nil
				end
				Core.SendToAll("* " .. tUser.sNick .. " lets " .. sMsg:sub(1, -2) .. " out of Time Out *\124")
				return true
			else
				local sVicProfName = ProfMan.GetProfile(iVicProfNum).sProfileName or "unregistered user\124"
				return true, "*** Error, You cannot ungag " .. sVicProfName .. "s!"
			end
		end
	else
		return true, "Syntax error, try using " .. tSettings[1]:sub(4, 4) .. "ungag <nick>\124"
	end
end

function tCommandArrivals.getgags:Action()
	local disp = ""
	for i in pairs(BSS.GagBot.tGagged) do
		local line = i
		disp = disp .. "\t \7 " .. line .. "\t\7 Time remaining: Until ungag command ;p\n"
	end
	UpdateTimedTable(BSS.GagBot.tTimedGag)
	for i, v in pairs(BSS.GagBot.tTimedGag) do
		local line = i
		disp = disp .. "\t \7 " .. line .. "\t\7 Time remaining: " .. TimeUnits(v[2]) .. "\n"
	end
	return true, "\n\n\t\t\t\t\t*-**-* Gagged Users (case lowered)*-**-* \n\n" .. disp
end

function tCommandArrivals.tempgag:Action(tUser, sMsg)
	if #sMsg > 1 then
		local vic, iAmount, sFormat = sMsg:match("^(%S+)%s+(%d+)(%w)")
		if vic then
			victim = vic:lower()
			if not BSS.GagBot.tTimedGag[victim] then
				if tTimeTranslate[sFormat][3] < tonumber(iAmount) then
					return true,
						"*** You cannot gag for longer than "
							.. tTimeTranslate[sFormat][3]
							.. tTimeTranslate[sFormat][2]
				else
					local iVicProfNum = (RegMan.GetReg(victim) or {}).iProfile or -1
					if self.Permissions[tUser.iProfile][iVicProfNum] then
						BSS.GagBot.tTimedGag[victim] = {
							TmrMan.AddTimer(tTimeTranslate[sFormat][1] * iAmount),
							tTimeTranslate[sFormat][1] * iAmount,
							os.time(),
						}
						Core.SendToAll(
							"* "
								.. tUser.sNick
								.. " puts "
								.. vic
								.. " in Time Out for "
								.. iAmount
								.. tTimeTranslate[sFormat][2]
								.. " *\124"
						)
						return true
					else
						local sVicProfName = ProfMan.GetProfile(iVicProfNum).sProfileName or "unregistered user"
						return true, "*** Error, You cannot gag " .. sVicProfName .. "s!\124"
					end
				end
			else
				return true, "*** " .. vic .. " is already gagged.\124"
			end
		else
			return true, "*** Error in syntax, <Nick> <Amount><TimeFormat> arguments required.\124"
		end
	else
		return true, "*** Error in syntax, <Nick> <Amount><TimeFormat> arguments required.\124"
	end
end

--RegBot Commands
function tCommandArrivals.regme:Action(tUser)
	if tRegStatus[tUser.uptr] and tRegStatus[tUser.uptr][2] == "Pending" then
		return true, [[You've already sent a request, please wait for our ops to review it.|]]
	elseif tUser.iProfile == 4 or tUser.iProfile == 5 then --Want to allow ops to be able to test, but regs not to request after being registered.
		return true,
			[[You are already registered, if you're experiencing any issues or have received extra nag messages after being registered contact an operator.|]]
	else
		for i, v in pairs(tRegStatus) do
			if v[1].sNick == tUser.sNick then
				return true, [[You've already sent a request, please wait for our ops to review it.|]]
			end
		end
		tRegStatus[tUser.uptr] = { tUser, [[Pending]], TmrMan.AddTimer(6 * 60 * 60 * 1000, "ClearRequest") }
		Core.SendPmToOps(
			sOCName,
			tUser.sNick
				.. " sent a registration request @ "
				.. doTime()
				.. ". Check "
				.. tSettings[1]:sub(4, 4)
				.. "opfaq if you receive this but don't know what to do.\124"
		)
		return true,
			[[Your request has been sent to our ops, please read !rules and !shareinfo while you wait for them to look it over. If you send more than one request you will be disconnected. Please remain online, thank you.|]]
	end
end

function tCommandArrivals.passwd:Action(tUser, sMsg)
	if tRegStatus[tUser.uptr] and tRegStatus[tUser.uptr][2] == "Unconfirmed" then
		return true,
			"*** You cannot use this command until you've confirmed the password sent to you by "
				.. sHBName
				.. ". Use the "
				.. tSettings[1]:sub(4, 4)
				.. "confirmreg <password> command.\124"
	elseif #sMsg < 1 then
		return true,
			"*** Syntax error, try !passwd followed by your desired pass (with no spaces). (Example: !passwd dontusethispass)\124"
	end
end

function tCommandArrivals.canreg:Action(tUser)
	return true,
		"You can register users under the following profiles: "
			.. CanReg(tUser.iProfile):sub(1, -3)
			.. ". This is not a list used with chuserprof.\124"
end

function tCommandArrivals.confirmreg:Action(tUser, sMsg)
	if #sMsg > 1 then
		if tRegStatus[tUser.uptr] and tRegStatus[tUser.uptr][2] == "Unconfirmed" then
			local tRegUser = RegMan.GetReg(tUser.sNick)
			if tRegUser and sMsg:sub(1, -2) == tRegUser.sPassword then
				Core.SendPmToOps(sOCName, tUser.sNick .. " has confirmed his or her reservation information.\124")
				tRegStatus[tUser.uptr] = nil
				return true,
					"*** Your reservation has been confirmed, you can now use !passwd <passwordhere> or keep your current password.\124"
			else
				return true, "*** Given password did not match your current password. Check your PMs from " .. sHBName
			end
		else
			return true,
				"*** You're currently unregistered, if you registered before, and disconnected without confirming please try the registration process again.\124"
		end
	else
		return true,
			"*** Syntax error, try typing "
				.. tSettings[1]:sub(4, 4)
				.. "confirmreg <password> (password is the password you received from "
				.. sHBName
				.. " without the <>).\124"
	end
end

function tCommandArrivals.addreguser:Action(tUser, sMsg)
	if #sMsg > 1 then
		local sNick, sPass, sProfile = sMsg:sub(1, -2):match("^(%S+)%s+(%S+)%s+(%S+)")
		if sNick then
			if RegMan.GetReg(sNick) then
				return true, "*** " .. sNick .. " is already registered.\124"
			elseif sNick:match('[^$\124<>:?*"/\\]') and #sNick <= 64 then
				if sPass:match("[^\124]") and #sPass <= 64 then
					local nProfileNumber = (ProfMan.GetProfile(sProfile) or {}).iProfileNumber
					if nProfileNumber then
						if tUser.iProfile <= nProfileNumber then
							if sPass == "generatepass" then
								---[[ By Mutor -- Modified slightly by amenay
								local t = { { 48, 57 }, { 65, 90 }, { 97, 122 }, { 33, 35 }, { 37, 47 }, { 58, 63 } } --Define a table with three nested sets within,  Numbers, lowercase, and uppercase letters
								sPass = ""
								for i = 1, math.random(7, 14) do --Initialize a loop, with variable i as the iteration count. The amount of iterations is the amount of chars in the output string. (7 - 12 in this case)
									local set = math.random(1, #t)
									sPass = sPass .. string.char(math.random(t[set][1], t[set][2]))
								end
								--]]
							end
							RegMan.AddReg(sNick, sPass, nProfileNumber)
							local NewReg = Core.GetUser(sNick)
							if NewReg then
								if tRegStatus[NewReg.uptr] then
									TmrMan.RemoveTimer(tRegStatus[NewReg.uptr][3])
									tRegStatus[NewReg.uptr][1], tRegStatus[NewReg.uptr][2] = NewReg, [[Unconfirmed]]
								else
									tRegStatus[NewReg.uptr] = { NewReg, [[Unconfirmed]] }
								end
								Core.SendPmToUser(
									NewReg,
									sHBName,
									"*** "
										.. tUser.sNick
										.. " has reserved a room for you at "
										.. SetMan.GetString(0)
										.. ". Changes take place immediately, no need to relog. Registration details are as follows: "
										.. "\n\n\t\t\7 Nickname: "
										.. sNick
										.. "\n\t\t\7 Password: "
										.. sPass
										.. "\n\t\t\7 Profile: "
										.. sProfile
										.. "\n\n\t\7 Now you must confirm your reservation by typing "
										.. tSettings[1]:sub(4, 4)
										.. "confirmreg "
										.. sPass
										.. " After this you can change your password if desired."
										.. "\n\n\t\7 Please remember to /fav our hub! (Adds hub to favorites)\124"
								)
								Core.SendToUser(
									NewReg,
									sFromHB
										.. "You should have a PM from "
										.. sHBName
										.. " with your information, read it carefully. If you didn't receive it, ask for help in main. Please stay connected until you carry out the instructions. If you disconnect before then your account will be removed automatically.\124"
								)
							end
							RegLog(tUser, sNick, sProfile)
							Announce(
								"*** "
									.. tUser.sNick
									.. " booked a room at "
									.. SetMan.GetString(0)
									.. " for "
									.. sNick
									.. "...\124"
							)
							return true
						else
							return true,
								"*** "
									.. ProfMan.GetProfile(tUser.iProfile).sProfileName
									.. "s are not allowed to register "
									.. sProfile
									.. "s.\124"
						end
					else
						return true,
							"*** "
								.. sProfile
								.. " is not a valid profile. Use one of the following profile names: "
								.. CanReg(tUser.iProfile):sub(1, -3)
					end
				else
					return true, "*** " .. sPass .. " contains one or more of the following invalid characters: \124$"
				end
			else
				return true, "*** " .. sNick .. " contains one more more of the following invalid characters: \124$"
			end
		else
			return true,
				"*** Syntax error in command, use "
					.. tSettings[1]:sub(4, 4)
					.. "addreguser <nick> <password> <profilename>. Bad parameters given!\124"
		end
	else
		return true,
			"*** Syntax error in command, use "
				.. tSettings[1]:sub(4, 4)
				.. "addreguser <nick> <password> <profilename>. Bad parameters given!\124"
	end
end

function tCommandArrivals.qreg:Action(tUser, sMsg)
	local sMsg = sMsg:match("^(%S+)|$")
	return self:subroutine(tUser, sMsg .. " generatepass reg|")
end

tCommandArrivals.qreg.subroutine = tCommandArrivals.addreguser.Action

--[[
	The next series of commands will include regstatus, for checking on the status of users going through the registration process, [This doesn't exist: markuser (Me in 2020: WTF is "markuser". Oh well, it works... but is way more than is really needed. lol.) This commands serves as an auxiliary to regstatus, it marks
	the specified as not being eligible in regstatus (with the reason), and sends the reason to the user.]
	Users who left unconfirmed will be left in a status table, even though their actual state is that of a normal non-reg (or a reg if they sueccessfully confirmed)
	this table will be cleared on timer and by the !clrregstat c ommand (actually this probably won't be implemented, it's more likely that each user will only be assigned one state through an ever-present table
	instead of multiple possible states through multiple tables)
	showreg will also be updated, made more easy to read, will report how many regs are online, and which
	After I've redone the data files I will consider having a last seen for the reglist, seculite has a reg cleaner running, but there's no interface for checking how long a user's been inactive..(as to serve manual pruning)
	
]]

function tCommandArrivals.regstatus:Action()
	local sReturn = "Registration status:\n\n"
	for i, v in pairs(tRegStatus) do
		sReturn = sReturn .. "\t\7 " .. v[2] .. ": " .. v[1].sNick .. "\n"
	end
	return true, sReturn .. "\n\124"
end

function tCommandArrivals.delreguser:Action(tUser, sMsg)
	if #sMsg > 1 then
		local sNick = sMsg:sub(1, -2)
		if sNick then
			local usr = RegMan.GetReg(sNick)
			if usr then
				if usr.iProfile >= tUser.iProfile then
					RegMan.DelReg(sNick)
					local tUsr = Core.GetUser(sNick)
					if tUsr and tRegStatus[tUsr.uptr] then
						tRegStatus[tUsr.uptr] = nil
					end
					Core.SendPmToNick(
						sNick,
						sHBName,
						"*** Your nickname has been unregistered by " .. tUser.sNick .. ".\124"
					)
					Announce("*** " .. tUser.sNick .. " removed " .. sNick .. " from the guestlist.\124")
					return true
				else
					return true,
						"*** Account deletion failed, "
							.. sNick
							.. " is registered as a higher profile. Use one of the following profile names: "
							.. CanReg(tUser.iProfile):sub(1, -3)
				end
			else
				return true, "*** Error " .. sNick .. " is not in the hotel guestlist!\124"
			end
		end
	else
		return true,
			"*** Syntax error in command, use "
				.. tSettings[1]:sub(4, 4)
				.. "delreguser <nick>. Bad parameters given!\124"
	end
end

function tCommandArrivals.chuserprof:Action(tUser, sMsg)
	if #sMsg > 1 then
		local sNick, sProfile = sMsg:sub(1, -2):match("^(%S+)%s+(%S+)")
		if sNick then
			local usr = RegMan.GetReg(sNick)
			if usr then
				local nProfileNumber = (ProfMan.GetProfile(sProfile) or {}).iProfileNumber
				if nProfileNumber then
					if nProfileNumber >= tUser.iProfile and usr.iProfile >= tUser.iProfile then
						Core.SendPmToNick(
							sNick,
							sHBName,
							"*** "
								.. tUser.sNick
								.. " has changed your profile from "
								.. ProfMan.GetProfile(usr.iProfile).sProfileName
								.. " to "
								.. sProfile
								.. ".\124"
						)
						Announce(
							"*** "
								.. tUser.sNick
								.. " changed "
								.. sNick
								.. "'s profile from "
								.. ProfMan.GetProfile(usr.iProfile).sProfileName
								.. " to "
								.. sProfile
								.. ".\124"
						)
						RegMan.ChangeReg(sNick, usr.sPassword, nProfileNumber)
						return true
					else
						return true,
							"*** Account changes failed, you cannot alter higher profiles. You can change the following profiles: "
								.. CanReg(tUser.iProfile):sub(1, -3)
					end
				else
					return true,
						"*** "
							.. sProfile
							.. " is not a valid profile. Use one of the following profile names: "
							.. CanReg(tUser.iProfile):sub(1, -3)
				end
			else
				return true, "*** " .. sNick .. " is not registered.\124"
			end
		else
			return true,
				"*** Syntax error in command, use "
					.. tSettings[1]:sub(4, 4)
					.. "chuserprof <nick> <profilename>. Bad parameters given!\124"
		end
	end
end

function tCommandArrivals.showreg:Action()
	local tResults, ret = {}, ""
	for i, v in ipairs({ 0, 1, 2, 3, 4, 5 }) do
		local sProfName, tProfUsers = ProfMan.GetProfile(v).sProfileName, RegMan.GetRegsByProfile(v)
		tResults[sProfName] = {}
		for ind = 1, #tProfUsers do
			table.insert(tResults[sProfName], tProfUsers[ind].sNick)
			table.sort(tResults[sProfName], function(a, b)
				return a:lower() < b:lower()
			end) --fold the case of results
		end
		ret = ret
			.. "\t\t\7\tThere are currently "
			.. #tResults[sProfName]
			.. " "
			.. sProfName
			.. "s (Profile #"
			.. v
			.. ") registered:\n\n\t\t\t"
			.. table.concat(tResults[sProfName], "\n\t\t\t", 1, #tResults[sProfName])
			.. "\n\n"
	end
	return true, "\n\n\t" .. SetMan.GetString(0) .. "'s Guestlist:\n\n" .. ret
end

function tCommandArrivals.regon:Action()
	return true,
		"Out of the "
			.. Core.GetUsersCount()
			.. " online users "
			.. #Core.GetOnlineRegs()
			.. " are registered. That's out of "
			.. #RegMan.GetRegs()
			.. " total reg accounts.\124"
end

---

function tCommandArrivals.bsshelp:Action(tUser)
	local sRet = "\n\n**-*-** "
		.. ScriptMan.GetScript().sName
		.. "  help (use one of these prefixes: "
		.. SetMan.GetString(29)
		.. " **-*-**\n\n"
	for name, obj in pairs(tCommandArrivals) do
		if obj.Permissions[tUser.iProfile] then
			if obj.sHelp then
				sRet = sRet .. "\t\t" .. name .. obj.sHelp
			end
		end
	end
	return true, sRet, true
end

function tCommandArrivals.me:Action(tUser, sMsg)
	local sNick = tUser.sNick
	local ret
	if sNick == "\215" or sNick:lower() == "x" then
		local tReplace = {
			["p%S+p%Sr%s+*"] = " is feeling frisky *\124",
			["^%Smpr%Sgn%St%Ss%s+%S+"] = " does a lil dance *\124",
		}
		for i, v in pairs(tReplace) do
			if sMsg:lower():match(i) then
				Core.SendToAll("* " .. sNick .. v)
				sMsg = v
				ret = true
				break
			end
		end
	end
	ChatHistory[HistoryLines][1], ChatHistory[HistoryLines][2], ChatHistory.Counter =
		os.time(),
		"* " .. sNick .. " " .. (sMsg:sub(1, -2)),
		(ChatHistory.Counter == HistoryLines and HistoryLines) or ChatHistory.Counter + 1
	table.insert(ChatHistory, 1, ChatHistory[HistoryLines])
	table.remove(ChatHistory, HistoryLines + 1)
	if tAlias[sNick] and sMsg then
		if bNoAlias == true then
			local OnlineUsers, SendToUser, tNoAlias = Core.GetOnlineUsers(), Core.SendToUser, tNoAlias
			local sAliased, sNAliased = "* " .. tAlias[sNick] .. " " .. sMsg, "* " .. sNick .. " " .. sMsg
			for i = 1, #OnlineUsers do
				SendToUser(OnlineUsers[i], tNoAlias[OnlineUsers[i].sNick] and sNAliased or sAliased)
			end
			return true
		else
			return Core.SendToAll("* " .. tAlias[sNick] .. sMsg), true
		end
	else
		return ret
	end
end

function tCommandArrivals.nick:Action(tUser, sMsg)
	local sAlias, sNick = sMsg:sub(1, -2), tUser.sNick
	local sAliasLow, sNickLow = sAlias:lower(), sNick:lower()
	local tAlias = tAlias
	local function endCommand(sResponse, v)
		_G.tAlias[tUser.sNick] = v
		return true, sResponse
	end
	if #sAlias > 64 then
		return endCommand("*** Alias must not be more than 64 characters.|", tAlias[sNick])
	elseif #sAlias == 0 or sAliasLow == sNickLow then --Cases: Default nick by no arg; Default nick by explicit arg; Default nick with different case. //Catches when already defaulted.
		local sNewNick -- = sAlias ~= sNick or #sAlias ~= 0 ) and sAlias; -- If not zero length argument or case sensitive match then false else sAlias is passed to endCommand

		if sAlias == sNick or #sAlias == 0 then
			sNewNick = nil
		else
			sNewNick = sAlias
		end
		local sResponse = (
			(tAlias[sNick] and "*** " .. tAlias[sNick] .. " is now known as " .. ((sNewNick and sMsg) or sNick))
			or "*** Your nick is already set to default.|"
		)
		return endCommand(sResponse, sNewNick)
	elseif tReserved[sAliasLow] then
		return true, "*** Requested nick, " .. sAlias .. ", is a reserved nickname.|"
	else
		do --this shows division by task, but more importantly limits the life of this particular blocks local variables.
			local RegUsers = RegMan.GetRegs()
			local nMaxMatch = 5
			local match = string.find
			for i = 1, #RegUsers, 1 do -- fix me --I can't remember whether I fixed this or not. I think so.. but I want it to be smarter (one [potentially expensive] way of doing it could be by making it loop from nMaxMatch to nick length for every reg. )
				local sRegNick = RegUsers[i].sNick:lower() --two calls (per loop) to match, still require table lookups.
				if
					#sRegNick >= nMaxMatch
					and (
						(((match(sAliasLow, sRegNick, 1, true) or 0) >= nMaxMatch) or sAliasLow == sRegNick)
						and not match(sAliasLow, sNickLow, 1, true)
					)
				then
					return true,
						"*** Requested nick, "
							.. sAlias
							.. ", is either a registered nickname or contains a match of one.|"
				end
			end
		end
		do
			local OnlineUser = Core.GetUser(sAlias)
			if OnlineUser then
				return true, "*** Requested nick, " .. sAlias .. ", is in use by an online user.|"
			end
		end
		for i, v in pairs(tAlias) do
			if sAliasLow == v:lower() then
				return true, "*** Requested nick, " .. sAlias .. ", is already in use! Check !as and try another.|"
			end
		end
		if _G.tAlias[sNick] then
			Core.SendToAll("*** " .. _G.tAlias[sNick] .. " is now known as " .. sMsg)
			return endCommand(nil, sAlias)
		else
			Core.SendToAll("*** " .. sNick .. " is now known as " .. sMsg)
			return endCommand(nil, sAlias)
		end
	end
end

function tCommandArrivals.aliasstatus:Action()
	local display = ""
	for i, v in pairs(tAlias) do
		display = string.format("%32s %32s\n", tAlias[i], i) .. display
	end
	return true, "\n\n\t\t(**-*-**-* Alias \t\t~\t Default Nick *-**-*-**)\n\n" .. display
end

function tCommandArrivals.noalias:Action(tUser)
	if bNoAlias then
		if tNoAlias[tUser.sNick] then
			tNoAlias[tUser.sNick] = nil
			return true, "*** Alias chat is now re-enabled.\124"
		else
			tNoAlias[tUser.sNick] = true
			return true, "*** Alias chat is now disabled.\124"
		end
	else
		return true, "*** Noalias functionality is currently unavailable.\124"
	end
end

function tCommandArrivals.killalias:Action(tUser, sMsg)
	local sTarget = sMsg:sub(1, -2) --Add support for 2d permissions.
	if #sTarget > 0 then
		for sNick, sAlias in pairs(tAlias) do
			if sTarget == sNick or sTarget == sAlias then
				local sUserNick = tAlias[tUser.sNick] or tUser.sNick
				Core.SendToAll("*** " .. sAlias .. "'s nick has been restored to " .. sNick .. " by " .. sUserNick)
				tAlias[sNick] = nil
				return true
			end
		end
		return true, "*** Username or alias was not found.|"
	else
		return true,
			"*** Syntax error in command, please type " .. tSettings[1]:sub(4, 4) .. "killalias <nick or Alias>.|"
	end
end
