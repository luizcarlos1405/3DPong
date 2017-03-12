
local gameZ = 800

Wall = Component("wall", {size = gameZ})
Pos3D = Component("pos", Vector3())
Pad = Component("pad", {size = Vector2(), color = Color(50,50,250,200)})
Ball = Component("ball", {direction = Vector3(), speed = 20, size = 40, wall = {}})

require "wallRenderer"
require "padController"
require "ballController"
gameScene = Scene("game")


function gameScene:init()
	love.window.setMode(900, 600, {vsync = false})
	love.graphics.setBackgroundColor(100,100,100)

	love.mouse.setVisible(false)

	graphics3D.centro = Vector2(love.graphics.getWidth()/2, love.graphics.getHeight()/2)

	paredes = Coisa("paredes", {Wall({size = gameZ})})
	ball = Coisa("ball", {
		Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, gameZ/2)),
		Ball({direction = Vector3(20,-10,30), wall = paredes.wall})
		})
	opponentPad = Coisa("IAPad", {
			Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, gameZ)),
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


end



return gameScene