padController = Script({Pad})

function padController:init(p)
	p.pad.diff = Vector3()
end

function padController:update(p,dt)
	local newPos = Vector3(love.mouse.getX(), love.mouse.getY(), p.pos.z)

	p.pad.diff.x = approach((newPos - p.pos).x, p.pad.diff.x, dt*5)
	p.pad.diff.y = approach((newPos - p.pos).y, p.pad.diff.y, dt*5)

	p.pos = newPos

    if love.keyboard.isDown("w") then
        p:rotate(-dt, 0, 0)
    end
    if love.keyboard.isDown("s") then
        p:rotate(dt, 0, 0)
    end
    if love.keyboard.isDown("a") then
        p:rotate(0, -dt, 0)
    end
    if love.keyboard.isDown("d") then
        p:rotate(0, dt, 0)
    end
    if love.keyboard.isDown("q") then
        p:rotate(0, 0, dt)
    end
    if love.keyboard.isDown("e") then
        p:rotate(0, 0, -dt)
    end

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

    local points = p:getPoints()

    -- POLYGONS não entendi bem porque, mas não está funcionando
    -- graphics3D.polygon("fill", points.a, points.b, points.c, points.d)

    -- LINES
    graphics3D.line(points.a, points.d)
    graphics3D.line(points.a, points.b)
    graphics3D.line(points.a, points.e)
    graphics3D.line(points.b, points.c)
    graphics3D.line(points.b, points.f)
    graphics3D.line(points.c, points.d)
    graphics3D.line(points.c, points.g)
    graphics3D.line(points.d, points.h)
    graphics3D.line(points.e, points.f)
    graphics3D.line(points.e, points.h)
    graphics3D.line(points.f, points.g)
    graphics3D.line(points.g, points.h)

    love.graphics.setColor(255, 255, 255)
    love.graphics.setPointSize(4)
    love.graphics.points(p.pos.x, p.pos.y)
end
