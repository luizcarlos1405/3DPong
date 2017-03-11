
Wall = Component("wall", {size = 4})
Pad = Component("pad", {pos = Vector3(), size = Vector2(), color = Color(50,50,250,200)})

require "wallRenderer"
require "padController"
gameScene = Scene("game")


function gameScene:init()
	love.graphics.setBackgroundColor(100,100,100)

	love.mouse.setVisible(false)

	graphics3D.centro = Vector2(love.graphics.getWidth()/2, love.graphics.getHeight()/2)

	opponentPad = Coisa("IAPad", {
			Pad({
				pos = Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 4),
				size = Vector2(250,150),
				color = Color(250,50,50,200)
			})
		})

	playerPad = Coisa("playerPad", {
			Pad({
				pos = Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 1),
				size = Vector2(250,150)
			})
		})

	paredes = Coisa("paredes", {Wall})

end



return gameScene