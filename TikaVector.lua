local TikaVector = {}

-- Vector Creation
function TikaVector:CreateVector(get_x, get_y, get_z)
	local new_x = get_x or 0
	local new_y = get_y or 0
	local new_z = get_z or 0
	
	return {x = new_x, y = new_y, z = new_z}
end

function TikaVector:GetVectorString(get_vector)
	local vector_string = "(" .. get_vector.x .. ", " .. get_vector.y .. ", " .. get_vector.z .. ")"

	return vector_string
end

-- Vector Math
function TikaVector:TranslateVectorV(get_vector, position_vector)
	return {x = get_vector.x + position_vector.x,
	        y = get_vector.y + position_vector.y,
	        z = get_vector.z + position_vector.z,
	}
end

function TikaVector:ScaleVectorS(get_vector, scale)
	return {x = get_vector.x * scale,
	        y = get_vector.y * scale,
	        z = get_vector.z * scale,
	}
end

function TikaVector:ScaleVectorV(get_vector, scale_vector)
	return {x = get_vector.x * scale_vector.x,
	        y = get_vector.y * scale_vector.y,
	        z = get_vector.z * scale_vector.z,
	}
end

--[[
function TikaVector:DotProduct(get_vectorA, get_vectorB)
	return get_vectorA.y * get_vectorB.y + get_vectorA.y * get_vectorB.y + get_vectorA.z * get_vectorB.z
end
]]--