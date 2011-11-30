-- Serialize by nErBoS

function SaveToFile( file, Table, tablename, mode )
	local assert, type = assert, type;
	local function Serialize(tTable, sTableName, sTab)
		assert(tTable, "tTable equals nil");
		assert(sTableName, "sTableName equals nil");
		assert(type(tTable) == "table", "tTable must be a Table!");
		assert(type(sTableName) == "string", "sTableName must be a string!");
		sTab = sTab or "";
		sTmp = ""
		sTmp = sTmp..sTab..sTableName.." = {\n"
		local Serialize, s_format, tostring = Serialize, string.format, tostring;
		for key, value in pairs( tTable ) do
			local sKey = ( type( key ) == "string" ) and s_format( "[%q]", key ) or s_format( "[%d]", key );
			if(type(value) == "table") then
				sTmp = sTmp..Serialize(value, sKey, sTab.."\t");
			else
				local sValue = ( type( value ) == "string") and s_format( "%q", value ) or tostring( value );
				sTmp = sTmp..sTab.."\t"..sKey.." = "..sValue
			end
			sTmp = sTmp..",\n"
		end
		sTmp = sTmp..sTab.."}\n"
		return sTmp
	end
	local handle = io.open( file, mode );
	handle:write( Serialize( Table, tablename ) );
	handle:close( );
end
