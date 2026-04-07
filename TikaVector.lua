-- TikaVector Metatable declaration
local TikaVector = {}

TikaVector.__index = TikaVector

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
function TikaVector.__add(get_vector_a, get_value_b)
	if type(get_value_b) == "number" then
		return newTikaVector(
			get_vector_a.x + get_value_b,
			get_vector_a.y + get_value_b,
			get_vector_a.z + get_value_b
		)
	end
	
	return newTikaVector(
		get_vector_a.x + get_value_b.x,
		get_vector_a.y + get_value_b.y,
		get_vector_a.z + get_value_b.z
	)
end

function TikaVector.__sub(get_vector_a, get_value_b)
	if type(get_value_b) == "number" then
		return newTikaVector(
			get_vector_a.x - get_value_b,
			get_vector_a.y - get_value_b,
			get_vector_a.z - get_value_b
		)
	end
	
	return newTikaVector(
		get_vector_a.x - get_value_b.x,
		get_vector_a.y - get_value_b.y,
		get_vector_a.z - get_value_b.z
	)
end

function TikaVector.__mul(get_vector_a, get_value_b)
	if type(get_value_b) == "number" then
		return newTikaVector(
			get_vector_a.x * get_value_b,
			get_vector_a.y * get_value_b,
			get_vector_a.z * get_value_b
		)
	end
	
	return newTikaVector(
		get_vector_a.x * get_value_b.x,
		get_vector_a.y * get_value_b.y,
		get_vector_a.z * get_value_b.z
	)
end

function TikaVector.__div(get_vector_a, get_value_b)
	if type(get_value_b) == "number" then
		return newTikaVector(
			get_vector_a.x / get_value_b,
			get_vector_a.y / get_value_b,
			get_vector_a.z / get_value_b
		)
	end
	
	return newTikaVector(
		get_vector_a.x / get_value_b.x,
		get_vector_a.y / get_value_b.y,
		get_vector_a.z / get_value_b.z
	)
end

-- Vector Methods
function TikaVector.RotateVector2D(self, angle)
	local new_vector = newTikaVector(0, 0)
	
	local cosine_angle = Cos(angle)
	local sine_angle = Sin(angle)
	
	new_vector.x = self.x * cosine_angle - self.y * sine_angle
	new_vector.y = self.x * sine_angle + self.y * cosine_angle 
	
	return new_vector
end

function TikaVector.Distance(self, get_vector)
	local distance_x = get_vector.x - self.x
	local distance_y = get_vector.y - self.y
	local distance_z = get_vector.z - self.z

	return Sqrt(distance_x * distance_x + distance_y * distance_y + distance_z * distance_z)
end

function TikaVector.DotProduct(self, get_vector)
	return (self.x * get_vector.x + self.y * get_vector.y + self.z * get_vector.z)
end

function TikaVector.Length(self)
	return Sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end
