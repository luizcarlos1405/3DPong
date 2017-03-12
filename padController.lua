padController = Script({Pad})

function padController:init(p)
	p.pad.diff = Vector3()
end

function padController:update(p,dt)
	local newPos = Vector3(clamp(love.mouse.getX() - p.pad.size.x/2, 0, love.graphics.getWidth()-p.pad.size.x), clamp(love.mouse.getY() - p.pad.size.y/2, 0, love.graphics.getHeight()-p.pad.size.y), p.pos.z)
	
	

	p.pad.diff.x = approach((newPos - p.pos).x, p.pad.diff.x, dt*5)
	p.pad.diff.y = approach((newPos - p.pos).y, p.pad.diff.y, dt*5)

	p.pos = newPos

end

--Colocar isso em outro lugar
function clamp(n, min, max)
	return math.max(math.min(n, max), min)
end

local sensitivity = 0.3

function approach(fim,atual,dt)
	local falta = fim-atual
	if falta > dt then
		return atual + dt
	end
	if falta < -dt then
		return atual - dt
	end
	return fim
end

--Colocar isso num renderer, esse arquivo é pra lógica de jogo
function padController:draw(p)

	love.graphics.setColor(p.pad.color:value())
	
	graphics3D.polygon("fill", p.pos.z, 
		p.pos + Vector3(0,0,(p.pad.diff.x+p.pad.diff.y)/sensitivity), 
		p.pos + Vector3(p.pad.size.x, 0, (-p.pad.diff.x+p.pad.diff.y)/sensitivity), 
		p.pos + Vector3(p.pad.size.x, p.pad.size.y, (-p.pad.diff.x-p.pad.diff.y)/sensitivity),
		p.pos + Vector3(0, p.pad.size.y, (p.pad.diff.x-p.pad.diff.y)/sensitivity))
end