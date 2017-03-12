wallRenderer = Script({Wall})


function wallRenderer:init()

	W = lg.getWidth()
	H = lg.getHeight()


	centro = Vector2(W/2, H/2)
end

function wallRenderer:updateOnce(dt)
	graphics3D.centro.x = W/2 + (love.mouse.getX()-(W/2))/10
	graphics3D.centro.y = H/2 + (love.mouse.getY()-(H/2))/10
end

near = 1

function wallRenderer:draw(w)

	--Desenha fundo das paredes
	love.graphics.setColor(Color.black:value())
	graphics3D.polygon("fill", 9999, Vector3(0,0,near), Vector3(0,0,w.wall.size), Vector3(W,0,w.wall.size), Vector3(W,0,near))
	graphics3D.polygon("fill", 9999, Vector3(W,0,near), Vector3(W,0,w.wall.size), Vector3(W,H,w.wall.size), Vector3(W,H,near))
	graphics3D.polygon("fill", 9999, Vector3(W,H,near), Vector3(W,H,w.wall.size), Vector3(0,H,w.wall.size), Vector3(0,H,near))
	graphics3D.polygon("fill", 9999, Vector3(0,H,near), Vector3(0,H,w.wall.size), Vector3(0,0,w.wall.size), Vector3(0,0,near))

	love.graphics.setColor(Color.green:value())
	local numLinhas = 5
	local numLinhasZ = 5

	--Desenha linhas topo/baixo
	local passoW = W/(numLinhas-1)
	for i=0, W, passoW do
		graphics3D.line(Vector3(i,0,near), Vector3(i,0,w.wall.size))
		graphics3D.line(Vector3(i,H,near), Vector3(i,H,w.wall.size))
	end

	--Desenha linhas laterais
	local passoH = H/(numLinhas-1)
	for i=0, H, passoH do
		graphics3D.line(Vector3(0,i,near), Vector3(0,i,w.wall.size))
		graphics3D.line(Vector3(W,i,near), Vector3(W,i,w.wall.size))
	end

	--Desenha linhas de profundidade
	local passoZ = (w.wall.size-1)/(numLinhasZ+1)
	for i=near,w.wall.size,passoZ do
		graphics3D.polygon("line", i, Vector3(0,0,i), 
			Vector3(W,0,i),
			Vector3(W,H,i),
			Vector3(0,H,i))
	end
	
	
end