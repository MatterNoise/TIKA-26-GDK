-- TikaVector Metatable declaration
local TikaVector = {}

-- Vector Creation
function newTikaVector(get_x, get_y, get_z)
	local new_x = get_x or 0
	local new_y = get_y or 0
	local new_z = get_z or 0
	
	local new_vector = {
		x = new_x,
		y = new_y,
		z = new_z
	}

	setmetatable(new_vector, TikaVector)

	return new_vector
end

-- Vector Tostring
function TikaVector.__tostring(get_vector)
	return "(" .. get_vector.x .. ", " .. get_vector.y .. ", " .. get_vector.z .. ")"
end

-- Vector Operators
function TikaVector.__add(get_vector_a, get_vector_b)
	return newTikaVector(
		get_vector_a.x + get_vector_b.x,
		get_vector_a.y + get_vector_b.y,
		get_vector_a.z + get_vector_b.z
	)
end

function TikaVector.__sub(get_vector_a, get_vector_b)
	return newTikaVector(
		get_vector_a.x - get_vector_b.x,
		get_vector_a.y - get_vector_b.y,
		get_vector_a.z - get_vector_b.z
	)
end
