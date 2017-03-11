wallRenderer = Script({Wall})


function wallRenderer:init()
	love.window.setMode(900, 600, {vsync = false})

	W = lg.getWidth()
	H = lg.getHeight()


	centro = Vector2(W/2, H/2)
end

function wallRenderer:updateOnce(dt)
	graphics3D.centro.x = W/2 + (love.mouse.getX()-(W/2))/10
	graphics3D.centro.y = H/2 + (love.mouse.getY()-(H/2))/10
end

function wallRenderer:draw(w)

	--Desenha fundo das paredes
	love.graphics.setColor(Color.black:value())
	graphics3D.polygon("fill", Vector3(0,0,1), Vector3(0,0,w.wall.size), Vector3(W,0,w.wall.size), Vector3(W,0,1))
	graphics3D.polygon("fill", Vector3(W,0,1), Vector3(W,0,w.wall.size), Vector3(W,H,w.wall.size), Vector3(W,H,1))
	graphics3D.polygon("fill", Vector3(W,H,1), Vector3(W,H,w.wall.size), Vector3(0,H,w.wall.size), Vector3(0,H,1))
	graphics3D.polygon("fill", Vector3(0,H,1), Vector3(0,H,w.wall.size), Vector3(0,0,w.wall.size), Vector3(0,0,1))

	love.graphics.setColor(Color.green:value())
	local numLinhas = 5
	local numLinhasZ = 5

	--Desenha linhas topo/baixo
	local passoW = W/(numLinhas-1)
	for i=0, W, passoW do
		graphics3D.line(Vector3(i,0,1), Vector3(i,0,w.wall.size))
		graphics3D.line(Vector3(i,H,1), Vector3(i,H,w.wall.size))
	end

	--Desenha linhas laterais
	local passoH = H/(numLinhas-1)
	for i=0, H, passoH do
		graphics3D.line(Vector3(0,i,1), Vector3(0,i,w.wall.size))
		graphics3D.line(Vector3(W,i,1), Vector3(W,i,w.wall.size))
	end

	--Desenha linhas de profundidade
	local passoZ = (w.wall.size-1)/(numLinhasZ+1)
	for i=1,w.wall.size,passoZ do
		graphics3D.polygon("line", Vector3(0,0,i), 
			Vector3(W,0,i),
			Vector3(W,H,i),
			Vector3(0,H,i))
	end
	
	
end