include "TIKA-26.TikaInitLua"

include "TIKA-26.TikaObjects"
include "TIKA-26.TikaVector"
include "TIKA-26.TikaDraw"

--include "TIKA-26.TIKA3D.TIKA3DIncludeFiles"

local TIKA26 = {}

function TIKA26:TraceVector(get_vector)
	trace(TikaVector:GetVectorString(get_vector))
end

function TIKA26:PrintVector(get_vector)
	print(TikaVector:GetVectorString(get_vector))
end

function TIKA26:TraceError(get_string)
	trace(get_string, 2)
	
	exit()
end

function TIKA26:TraceWarning(get_string)
	trace(get_string, 4)
end