include "TIKA-26-GDK.TikaInitLua"

include "TIKA-26-GDK.TikaObjects"
include "TIKA-26-GDK.TikaVector"
include "TIKA-26-GDK.TikaDraw"

--include "TIKA-26-GDK.TIKA3D.TIKA3DIncludeFiles"

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