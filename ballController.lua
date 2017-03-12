ballController = Script({Ball})


function ballController:update(b, dt)
	if b.pos.x<b.ball.size or b.pos.x>lg.getWidth()-b.ball.size then
		b.ball.direction.x = -b.ball.direction.x
		b.pos.x = clamp(b.pos.x, b.ball.size, lg.getWidth()-b.ball.size)
	end

	if b.pos.y<b.ball.size or b.pos.y>lg.getHeight()-b.ball.size then
		b.ball.direction.y = -b.ball.direction.y
		b.pos.y = clamp(b.pos.y, b.ball.size, lg.getHeight()-b.ball.size)
	end

	if b.pos.z<b.ball.size  or b.pos.z>b.ball.wall.size-b.ball.size then
		b.ball.direction.z = -b.ball.direction.z
		b.pos.z = clamp(b.pos.z, b.ball.size, b.ball.wall.size-b.ball.size)
	end

	b.pos = b.pos + b.ball.direction*b.ball.speed*dt
end

--Colocar isso num renderer, esse arquivo é pra lógica de jogo
function ballController:draw(b)
	lg.setColor(Color(255,255,255):value())
	graphics3D.circle("fill", b.pos, b.ball.size)


love.graphics.setColor(Color.blue:value())
	graphics3D.polygon("line", b.pos.z, Vector3(0,0,b.pos.z), 
			Vector3(W,0,b.pos.z),
			Vector3(W,H,b.pos.z),
			Vector3(0,H,b.pos.z))
	
end