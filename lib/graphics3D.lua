graphics3D = Script()

graphics3D.centro = Vector2(0,0)

graphics3D.drawList = {}

local escala = 200

function graphics3D:drawAfter()
	--graphics3D

	table.sort( graphics3D.drawList, function(a,b) return a.z > b.z end )

	for k,v in pairs(graphics3D.drawList) do
		love.graphics.setColor(v.color:value())
		v.func(unpack(v.args))
	end

	graphics3D.drawList = {}
end

function graphics3D.addToList(func, z, ...)
	graphics3D.drawList[#graphics3D.drawList+1] = {
		func = func,
		color = Color(love.graphics.getColor()),
		z = z,
		args = {...}
	}
end

function graphics3D.to2D(v3)
	return Vector2((v3.x - graphics3D.centro.x)/(v3.z/escala+1) + graphics3D.centro.x, (v3.y - graphics3D.centro.y)/(v3.z/escala+1) + graphics3D.centro.y)
end


function graphics3D.line(v1, v2, z)
	local p1 = graphics3D.to2D(v1)
	local p2 = graphics3D.to2D(v2)
	graphics3D.addToList(love.graphics.line, z or 999, p1.x, p1.y, p2.x, p2.y)
end

function graphics3D.polygon(mode, z, ...)
	local args = {...}
	assert(#args>=3, "Polígono precisa de pelo menos 3 vértices")
	local verts = {}
	for i,v in ipairs(args) do
		args[i] = graphics3D.to2D(v)
		verts[#verts+1] = args[i].x
		verts[#verts+1] = args[i].y
	end

	graphics3D.addToList(love.graphics.polygon, z, mode, verts)
end

function graphics3D.circle(mode, v3, radius, segments)
	local v2 = graphics3D.to2D(v3)
	local surface = v3 + Vector3(0,radius,0)
	local surface2d = graphics3D.to2D(surface)

	local radius2d = v2:dist(surface2d)

	graphics3D.addToList(love.graphics.circle, v3.z, mode, v2.x, v2.y, radius2d, segments)
end
