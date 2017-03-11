Vector2 = {}
Vector2.__index = Vector2
vector = Vector2

local function new(x, y)
	local v = {}
	setmetatable(v, Vector2)
	v.x = x or 0
	v.y = y or 0
	v.isVector = true

	return v
end

function Vector2.type(a)
	return "Vector2"
end

local function isVector(a)
	return true
end

function Vector2.__tostring(a)
	return "["..a.x..","..a.y.."]"
end

function Vector2.__unm(a)
	return new(-a.x, -a.y)
end

function Vector2.__add(a,b)
	assert(b.isVector, "nao é vetor")
	return new(a.x+b.x, a.y+b.y)
end

function Vector2.__sub(a,b)
	assert(b:isVector(), "Vector expected; Got "..type(b))
	return new(a.x-b.x, a.y-b.y)
end

function Vector2.__mul(a,b)
	if (type(b) == "number") then
		return new(a.x*b, a.y*b)
	else
		if (b:isVector()) then
			return new(a.x*b.x, a.y*b.y)
		else
			error("Number or Vector2 expected; Got "..type(b))
		end
	end
end

function Vector2.__div(a,b)
	assert(type(b) == "number", "Number expected; Got "..type(b))
	return new(a.x/b, a.y/b)
end

function Vector2.__eq(a,b)
	assert(b:isVector(), "Vector expected; Got "..type(b))
	return a.x == b.x and a.y == b.y
end

function Vector2:rotate(o)
	self.x = math.cos(o) * self.x - math.sin(o) * self.y
	self.y = math.sin(o) * self.x + math.cos(o) * self.y
	return self
end

function Vector2.magnitude(a)
	return Vector2.dist(Vector2.zero, a)
end

function Vector2.dist(a,b)
	--assert(a:isVector() and b:isVector(), "Vector expected; Got "..type(a).." and "..type(b))
	return math.sqrt(math.pow(a.x-b.x,2)+math.pow(a.y-b.y,2))
end

function Vector2.fromAngle(r)
	assert(type(r) == "number", "Number expected; Got "..type(r))
	return new(math.cos(r),math.sin(r))
end

function Vector2.angleTo(a, b)
	return math.atan2(b.y-a.y, b.x-a.x)
end

function Vector2.floor(a)
	a.x = math.floor(a.x)
	a.y = math.floor(a.y)
	return a
end

function Vector2.clone(a)
	return Vector2(a.x,a.y)
end

setmetatable(Vector2, {__call = function(_, ...) return new(...) end})


--Constantes
Vector2.zero = Vector2(0,0)
Vector2.forward = Vector2(1,0)
Vector2.back = Vector2(-1,0)

Vector2.up = Vector2(0,-1)
Vector2.right = Vector2(1,0)
Vector2.down = Vector2(0,1)
Vector2.left = Vector2(-1,0)