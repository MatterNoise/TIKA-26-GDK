local Insert = table.insert
local Remove = table.remove

local Floor = math.floor

local MATH_PI = math.pi

local Random = math.random

local Min = math.min
local Max = math.max

local Sqrt = math.sqrt
local Cos = math.cos
local Sin = math.sin

function TikaDegreesToRadians(get_value)
	return get_value * MATH_PI / 180
end

function TikaClampValue(get_value, get_min_value, get_max_value)
	local new_min_value = get_min_value or 0
	local new_max_value = get_max_value or 0
	
	return Max(Min(get_value, get_max_value), new_min_value)
end