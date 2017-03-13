require("lib.Coisa.coisaCore")

require("lib.graphics3D")
require("lib.vector3")

lg = love.graphics

function love.load()
	cCore.loadScene(R.scene.gameScene)
end

function love.update(dt)
	cCore.update(dt)
end

function love.draw()
	cCore.draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end
