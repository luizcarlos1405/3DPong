
local gameZ = 800

Wall = Component("wall", {size = gameZ})
Pos3D = Component("pos", Vector3())
Box = Component("box", {size = Vector3(), angles = Vector3(0, 0, 0), vectors = {}})
Pad = Component("pad", {color = Color(50,50,250,200)})
Ball = Component("ball", {direction = Vector3(), speed = 20, size = 40, wall = {}})

require "wallRenderer"
require "padController"
require "ballController"
require "boxSetup"
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
				color = Color(250,50,50,200)
			}),
            Box({size = Vector3(250, 150, 20)})
		})


	playerPad = Coisa("playerPad", {
			Pos3D(Vector3(love.graphics.getWidth()/2, love.graphics.getHeight()/2, 20)),
			Pad({}),
            Box({size = Vector3(250, 150, 20)})
		})


end



return gameScene
