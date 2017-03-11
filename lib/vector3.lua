Vector3 = {}
Vector3.__index = Vector3

Vector3.__tostring = function(v)	return "V3("..v.x..", "..v.y..", "..v.z..")"	end

local function new(x,y,z)
	local v = {}
	setmetatable(v, Vector3)

	v.x = x or 0
	v.y = y or 0
	v.z = z or 0

	return v
end

function Vector3.__add(a,b)
	return new(a.x + b.x, a.y + b.y, a.z + (b.z or 0))
end


function Vector3.__sub(a,b)
	return new(a.x - b.x, a.y - b.y, a.z - (b.z or 0))
end


function Vector3.__mul(a,b)
	return new(a.x*b, a.y*b, a.z*b)
end

setmetatable(Vector3, {__call = function(_, ...) return new(...) end})