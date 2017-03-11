
Wall = Component("wall", {size = 4})
Pos3D = Component("pos", Vector3())
Pad = Component("pad", {size = Vector2(), color = Color(50,50,250,200)})
Ball = Component("ball", {direction = Vector3(), speed = 20, size = 40})

require "wallRenderer"
require "padController"
require "ballController"
gameScene = Scene("game")


function gameScene:init()
	love.graphics.setBackgroundColor(100,100,100)

	love.mouse.setVisible(false)

	graphics3D.centro = Vector2(love.graphics.getWidth()/2, love.graphics.getHeight()/2)

	ball = Coisa("ball", {
		Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 2.5)),
		Ball({direction = Vector3(18,10,0.1)})
		})
	opponentPad = Coisa("IAPad", {
			Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 4)),
			Pad({
				size = Vector2(250,150),
				color = Color(250,50,50,200)
			})
		})


	playerPad = Coisa("playerPad", {
			Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 1)),
			Pad({
				size = Vector2(250,150)
			})
		})

	paredes = Coisa("paredes", {Wall})

end



return gameScene