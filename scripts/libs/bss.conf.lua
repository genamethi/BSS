return {

	tWlcMsg = { --Setting

		[0] = [[Anime Hotel's proprietor, nick, has entered the lobby.|]], --Master
		[1] = [[Please give genteel welcome to our honoured guest, nick.|]],
		[2] = [[Cease all other activities and bow for Senior-Op, nick.|]],
		[3] = [[Everyone please give welcome to nick, one of our respected personnel.|]], -- Operator
		[4] = [[Welcome nick! Your room is ready, please enjoy your stay.|]], -- VIP
		[5] = nil, --Reg
	},
	HistoryLines = 150,
	sBlockedMsg = "*** You must be registered to search or download in this hub. Check !reginfo\124",
	bNoAlias = true,
	bUseSim = false,
	--the % signs are added between each element of the prefix for matches. formerly tSettings[1]
	sPrefix = "^[" .. (SetMan.GetString(29):gsub("%p", function(p)
		return "%" .. p
	end)) .. "]",
	--formerly tSettings[2]
	RegInfo = [[


		You're unregged. Read the MOTD to review the restrictions for unregistered users.
		Then if you're interested in becoming registered read !rules and !shareinfo
    Then send !regme if you're willing to comply, you must fully agree to the above mentioned documents before sending !regme.
    Upon recieving the request (our ops are people too; we're not always available), we will check to the best of our abilities
    that you meet our requirements.
    Then you will recieve a PM from our hub bot with further instructions. 
 		
    In short: check the !rules and !shareinfo then type !regme when you have it down.
 		
    (All text files on this server are subject to change at any time, your client, your responsibility, through and through.)
 	
    Self reference: !reginfo
  |]],
}
