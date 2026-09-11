--[[ 
Title: Tsundoku
Date: September 2026
Description: Per Event Stacks for PtokaX API
--]]

local M = {}

--dual representaiton maybe
--This is our class
local Tsun = {
	isempty = function() end,
	push = function() end,
	pop = function() end,
	swap = function() end,
}

local tPXEvents = {
	OnStartup,
	OnExit,
	OnTimer,
	UserConnected,
	UserDisconnected,
	RegConnected,
	RegDisconnected,
	OpConnected,
	OpDisconnected,
	OnError,
	SupportsArrival,
	ChatArrival,
	KeyArrival,
	ValidateNickArrival,
	PasswordArrival,
	VersionArrival,
	GetNickListArrival,
	MyINFOArrival,
	GetINFOArrival,
	SearchArrival,
	MultiSearchArrival,
	ToArrival,
	ConnectToMeArrival,
	MultiConnectToMeArrival,
	RevConnectToMeArrival,
	SRArrival,
	UDPSRArrival,
	KickArrival,
	OpForceMoveArrival,
	UnknownArrival,
	BotINFOArrival,
	CloseArrival,
}

--[[
--
--
--]]
