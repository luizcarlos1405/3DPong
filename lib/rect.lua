Rect = {}
Rect.__index = Rect

local function new(x, y, w, h)
	local r = {}
	setmetatable(r, Rect)
	r.x = x or 0
	r.y = y or 0
	r.w = w or 0
	r.h = h or 0
	
	return r
end

function Rect:unpack()
	return self.x, self.y, self.w, self.h
end


setmetatable(Rect, {__call = function(_, ...) return new(...) end})