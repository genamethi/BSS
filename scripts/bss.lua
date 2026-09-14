--[[

Basic PtokaX script for custom welcome messages w/ toggle, welcome messages per profile, and basic commands.
Each command's permissions is set it's own table within the tCommandArrivals table.

Script: Basic Service Script Creator: amenay
Touched: 2026.09.04

--]]

local BSS
local sim

--For the registration process.
--TODO: Document different statuses
--TODO: RegStatus needs to handle all events that pertain to registered users

--History Defs
--We could use a single object, single instance approach to history
BSS.ChatHistory = table.create(HistoryLines, 1)
BSS.ChatHistory.Counter = 0

function add_settings()
	local ret = {}
	local GetString = SetMan.GetString
	local sHBName = GetString(21)
	local sOCName = GetString(24)
	--Most of the time these are concatenated with < and >. So we do it now.
	ret.sFromHB = "<" .. sHBName .. "> "
	ret.sFromOC = "<" .. sOCName .. "> "

	--Build case-sensitve check to prevent bot impersonation with !nick
	local tTmp = Core.GetBots()
	table.insert(tTmp, sHBName)
	table.insert(tTmp, sOCName)
	for i = 1, #tTmp - 2 do
		tTmp[tTmp[i].sNick:lower()], tTmp[i] = true, nil --What does this acheive? Look at GetBots table
	end
	ret.tReserved = tTmp
	--Should store this in config too
	ret.bUseSim = false
	return ret
end

function OnStartup()
	--two or three functions should be called here
	--init_table, add_settings, add_userprefs
	if BSS.bUseSim then
		sim = require("sim")
		sim.hook_OnStartup({ "#BSSIM", "PtokaX Lua interface via ToArrival", "", true }, { "amenay", "Generic" })
	end
	local sPath = Core.GetPtokaXPath()
	--Maybe I should use the "package" approach with submodules as such (but correctly):
	BSS.UserPrefs = require(sPath .. "cfg/userprefs.lua")
	if not BSS.UserPrefs then
		Core.SendToOps("User preferences file not found. Rename example file or replace data/userprefs.lua")
	end

	UpdateTimedTable(BSS.GagBot.tTimedGag)
	BSS.tRegOnly = { DownloadKey = {}, TimeOut = {} }
	BSS.tRegStatus = {}

	sBlockedMsg = sFromHB .. sBlockedMsg
	math.randomseed(os.time())
	--make keying tables by time units convenient
	TmrMan.AddTimer(math.random(60000, 300000), "SeedGen")
end

function OnExit()
	SaveToFile(sLocation, BSS, "BSS", "w+")
	SaveToFile(fAlias, tAlias, "tAlias", "w+")
	SaveToFile(fAlias, tNoAlias, "tNoAlias", "a+")
	if bUseSim then
		sim.hook_OnExit()
	end
end

if bUseSim then
	OnError = sim.hook_OnError
end

function OnTimer(nTimerId)
	for i, v in pairs(BSS.GagBot.tTimedGag) do
		if v[1] == nTimerId then
			BSS.GagBot.tTimedGag[i] = nil
			TmrMan.RemoveTimer(nTimerId)
			break
		end
	end
end

function RemKey(nTimerId)
	if RegOnly.DownloadKey[RegOnly.TimeOut[nTimerId]] or RegOnly.TimeOut[nTimerId] then
		RegOnly.DownloadKey[RegOnly.TimeOut[nTimerId]] = nil
		RegOnly.TimeOut[nTimerId] = nil
	end
	TmrMan.RemoveTimer(nTimerId)
end

function ClearRequest(nTimerId)
	for i, v in pairs(tRegStatus) do
		if nTimerId == v[3] then
			tRegStatus[i] = nil
			TmrMan.RemoveTimer(nTimerId)
			break
		end
	end
end

function OpConnected(tUser)
	Core.SendToUser(
		tUser,
		"Type !ophelp or !userhelp or !bsshelp in the mainchat to see a list of commands you can use here. *-**-Updated 25.Oct.07-**-*\124Type !history to see the last "
			.. ChatHistory.Counter
			.. ' lines of chat. (Type "!history onjoin" to receive automatically.)\124'
	)
	local sNick = tUser.sNick
	if BSS.ShowHistory[sNick] then
		Core.SendToUser(tUser, sFromHB .. doHistory(ChatHistory))
	end
	if not BSS.WlcBot.tNoWlc[sNick] then
		local sCustom = BSS.WlcBot.tWlc[tUser.sNick]
		if sCustom then
			return Core.SendToAll(sFromOC .. sCustom), Core.SendToUser(tUser, sFromOC .. sCustom), false
		elseif tWlcMsg[tUser.iProfile] then
			local sWlcMsg = tWlcMsg[tUser.iProfile]:gsub("nick", sNick)
			return Core.SendToAll(sFromOC .. sWlcMsg), Core.SendToUser(tUser, sFromOC .. sWlcMsg), false
		end
	end
end

RegConnected = OpConnected

function OpDisconnected(tUser)
	if not BSS.WlcBot.tNoWlc[tUser.sNick] then
		Core.SendToAll(sFromOC .. tUser.sNick .. " just clocked out...\124")
	end
	return RegDisconnected(tUser)
end

function RegDisconnected(tUser)
	if tRegStatus[tUser.uptr] then
		if tRegStatus[tUser.uptr][2] == "Unconfirmed" then
			Core.SendToOps(
				sFromHB
					.. "*** "
					.. tUser.sNick
					.. " was removed from the guestlist due to an unconfirmed reservation.\124"
			)
			RegMan.DelReg(tUser.sNick)
		end
		tRegStatus[tUser.uptr] = nil
	end
	if bUseSim then
		return sim.hook_UserDisconnected(tUser)
	end
end

function SearchArrival(tUser, sData) --Search Blocking
	if tUser.iProfile == -1 then
		return Core.SendToUser(tUser, sBlockedMsg), true
	end
end

function ConnectToMeArrival(tUser, sData) --Download blocking
	if tUser.iProfile == -1 then
		local remnick = sData:match("^(%S+)", 14)
		if RegOnly.DownloadKey[tUser.sNick] ~= remnick then
			return Core.SendToUser(tUser, sBlockedMsg), true
		end
	end
end

function RevConnectToMeArrival(tUser, sData) --More download blocking
	local sendnick = sData:sub(#tUser.sNick + 18, -2)
	local RegOnly = RegOnly
	if tUser.iProfile ~= -1 then
		if RegMan.GetReg(sendnick) then
			return false
		end
		RegOnly.DownloadKey[sendnick], RegOnly.TimeOut[TmrMan.AddTimer(3000, "RemKey")] = tUser.sNick, sendnick --Remote user will only have one user with key to connect..
		_G.RegOnly = RegOnly
		return false
	else
		return Core.SendToUser(tUser, sBlockedMsg), true
	end
end

function UserConnected(tUser)
	Core.SendToUser(tUser, tSettings[2])
end

function ChatArrival(tUser, sData)
	local sNick = tUser.sNick
	if BSS.GagBot.tGagged[sNick:lower()] or BSS.GagBot.tTimedGag[sNick:lower()] then
		return true
	end
	local nInitIndex = #sNick + 4
	if tUser.iProfile == -1 then
		local match = sData:match("%w+%:%/%/%S+", nInitIndex) or sData:match("www%.%S+", nInitIndex)
		if match then
			Core.SendPmToUser(
				tUser,
				sHBName,
				[[Messages containing URLs may not be sent by unregistered users, URL blocked and forwarded to our operators.|]]
			)
			Core.SendPmToOps(
				sOCName,
				sNick .. ", an unregistered user, sent a message to main which contained the URL: " .. match
			)
			return true
		end
	end
	if sData:match(BSS.sPrefix, nInitIndex) then
		local cmd = sData:match("^(%w+)", nInitIndex + 1)
		if cmd then
			cmd = cmd:lower()
			if tCommandArrivals[cmd] then
				if tCommandArrivals[cmd].Permissions[tUser.iProfile] then
					local msg
					if (nInitIndex + #cmd) <= #sData + 1 then
						msg = sData:sub(nInitIndex + #cmd + 2)
					end
					return ExecuteCommand(tUser, msg, cmd, "Main")
				else
					return Core.SendToUser(tUser, sFromHB .. "*** Permission denied.\124"), true
				end
			else
				return false
			end
		end
	end
	if
		sData:match("^is kicking %S+ because:", nInitIndex)
		or sData:match("^is kicking %S+ because:", nInitIndex + #sNick + 1)
	then --Why did I want to block kick messages? Aside from side-effects?
		return false --look at me later. [[Much later... this looks fine...
	else
		ChatHistory[HistoryLines][1], ChatHistory[HistoryLines][2], ChatHistory.Counter =
			(os.time()),
			sData:sub(1, -2),
			(ChatHistory.Counter == HistoryLines and HistoryLines or ChatHistory.Counter + 1)
		table.insert(ChatHistory, 1, ChatHistory[HistoryLines])
		table.remove(ChatHistory, HistoryLines + 1)
	end
	if tAlias[sNick] then
		local data = sData:sub(nInitIndex - 2)
		if bNoAlias then
			local OnlineUsers, SendToUser, tNoAlias = Core.GetOnlineUsers(), Core.SendToUser, tNoAlias
			local sAliased, sNAliased = "<" .. tAlias[sNick] .. data, "<" .. sNick .. data
			for i = 1, #OnlineUsers do
				SendToUser(OnlineUsers[i], tNoAlias[OnlineUsers[i].sNick] and sNAliased or sAliased)
			end
			return true
		else
			return Core.SendToAll("<" .. tAlias[sNick] .. data), true
		end
	end
end

function ToArrival(tUser, sData)
	local sToUser = sData:match("^(%S+)", 6) --these will be in pxcmd now
	local nInitIndex = #sToUser + 18 + #tUser.sNick * 2

	if sData:match(BSS.sPrefix, nInitIndex) then
		local cmd = sData:match("^(%w+)", nInitIndex + 1)
		if cmd then
			cmd = cmd:lower()
			if tCommandArrivals[cmd] then
				if tCommandArrivals[cmd].Permissions[tUser.iProfile] then
					local msg
					if (nInitIndex + #cmd) <= #sData + 2 then
						msg = sData:sub(nInitIndex + #cmd + 2)
					end
					return ExecuteCommand(tUser, msg, cmd, "PM")
				else
					return Core.SendPmToUser(tUser, sHBName, "*** Permission denied.\124"), true
				end
			end
		end
	elseif bUseSim then
		sim.hook_ToArrival(tUser, sData, sToUser, nInitIndex) --Works w/o sToUser and nInitIndex.
	end
	--unregistered
	if tUser.iProfile == -1 then --URL Blocking.. Add Setting for this, move text into string configure file
		local match = sData:match("%w+%:%/%/%S+", nInitIndex) or sData:match("www%.%S+", nInitIndex)
		if match then
			Core.SendPmToUser(
				tUser,
				sHBName,
				"PMs containing URLs may not be sent by unregistered users, URL blocked and forwarded to our operators.\124"
			)
			Core.SendPmToOps(
				sOCName,
				tUser.sNick
					.. ", an unregistered user, sent a PM to "
					.. sToUser
					.. " which contained the URL: "
					.. match
			)
			return true
		end
	end
end
--------
function SeedGen(nTimerId)
	math.randomseed(os.time(), Core.GetCurrentSharedSize() / Core.GetUsersCount() + Core.GetUpTime())
	TmrMan.RemoveTimer(nTimerId)
	TmrMan.AddTimer(math.random(13176, 21600), "SeedGen")
end
--------
function UpdateTimedTable(TimedTable)
	for i in pairs(TimedTable) do
		TimedTable[i][1], TimedTable[i][2], TimedTable[i][3] =
			TmrMan.AddTimer(TimedTable[i][2]),
			TimedTable[i][2] - (os.difftime(os.time(), TimedTable[i][3]) * 1000),
			os.time()
	end
end
--------
--Choose how to be nagged.
function Announce(sMsg)
	if SetMan.GetBool(29) then
		if SetMan.GetBool(30) then
			Core.SendPmToOps(sHBName, sMsg)
		else
			Core.SendToOps(sFromHB .. sMsg)
		end
	end
end
--------
function CanReg(iProfile)
	local Profiles, AvailProfs = ProfMan.GetProfiles(), ""
	for i = 1, #Profiles, 1 do
		if Profiles[i].iProfileNumber >= iProfile then
			AvailProfs = AvailProfs .. Profiles[i].sProfileName .. ", "
		end
	end
	return AvailProfs
end

--start -> s, end -> e
function doHistory(buff, s, e)
	local first = buff.Counter
	if first == 0 then
		return "Sorry, there is no history to be displayed.\124"
	end
	if not s or s == 0 then
		s = first
	elseif s < 0 then
		if math.abs(s) > first then
			s = first
		else
			s = math.abs(s)
		end
	elseif s > first then
		s = 1
	else
		s = first - s + 1
	end

	if not e or e == 0 then
		e = 1
	elseif e < 0 then
		if math.abs(e) > first then
			e = first
		else
			e = math.abs(e)
		end
	elseif e > first then
		e = 1
	else
		e = first - e + 1
	end

	local ret = "Here follows lines " .. first + 1 - s .. " - " .. first + 1 - e .. " of chat\n\n"
	local date = os.date
	for n = s, e, s > e and -1 or 1 do
		ret = ret .. "[" .. date("%x %X", buff[n][1]) .. "] " .. buff[n][2] .. "\n"
	end
	return ret
end
---------
function RegLog(tBy, sNick, sProfile)
	local hFile, sError = io.open(Core.GetPtokaXPath() .. "texts/reglog.txt", "a+")
	hFile:write(
		"\n\t*** "
			.. sNick
			.. " was registered as a "
			.. sProfile
			.. " by "
			.. tBy.sNick
			.. ", "
			.. ProfMan.GetProfile(tBy.iProfile).sProfileName
			.. " on "
			.. doTime()
			.. " local server time"
	)
	hFile:flush()
	hFile:close()
	SetMan.SetBool(31, false)
	SetMan.SetBool(31, true)
end
--
