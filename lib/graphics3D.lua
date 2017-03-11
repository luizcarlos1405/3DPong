graphics3D = {}

graphics3D.centro = Vector2(0,0)



function graphics3D.to2D(v3)
	return Vector2((v3.x - graphics3D.centro.x)/v3.z + graphics3D.centro.x, (v3.y - graphics3D.centro.y)/v3.z + graphics3D.centro.y)
end


function graphics3D.line(v1, v2)
	local p1 = graphics3D.to2D(v1)
	local p2 = graphics3D.to2D(v2)
	love.graphics.line(p1.x, p1.y, p2.x, p2.y)
end

function graphics3D.polygon(mode, ...)
	local args = {...}
	assert(#args>=3, "Polígono precisa de pelo menos 3 vértices")

	local verts = {}
	for i,v in ipairs(args) do
		args[i] = graphics3D.to2D(v)
		verts[#verts+1] = args[i].x
		verts[#verts+1] = args[i].y
	end
	love.graphics.polygon(mode, verts)
end