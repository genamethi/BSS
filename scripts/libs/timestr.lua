--maybe this shold be timestr or something.

function doTime() --copied mostly from a function by Mutor.
	local os = os
	local h, m = math.modf((os.time() - os.time(os.date("!*t"))) / 3600)
	return os.date("%x @ %X") .. " (" .. (h + (60 * m)) .. " UTC)"
end

tTimeTranslate = {
	s = { 1000, " second(s)", 1e+015 },
	m = { 60000, " minute(s)", 16666666666667 },
	h = { 60 * 60000, " hour(s)", 277777777777.78 },
	d = { 1440 * 60000, " day(s)", 11574074074.074 },
	w = { 10080 * 60000, " week(s)", 1653439153.4392 },
	M = { 43200 * 60000, " month(s)", 385802469.1358 },
	y = { 512640 * 60000, " year(s)", 32511444.028298 },
}

setmetatable(tTimeTranslate, {
	__index = function(t, k)
		local units = { "s", "m", "h", "d", "w", "M", "y" }
		return t[units[k]]
	end,
})

---
function TimeUnits(inms)
	local s_format, tTimeTranslate = string.format, tTimeTranslate
	for i = 7, 1, -1 do
		if inms >= tTimeTranslate[i][1] then
			return s_format("%.5f", inms / tTimeTranslate[i][1]) .. tTimeTranslate[i][2]
		end
	end
	return s_format("%.5f", inms) .. " milisecond(s)"
end
