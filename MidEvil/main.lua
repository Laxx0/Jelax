gamera = require 'include.gamera'
tilecollider = require 'include.tilecollider'
require 'include.map'
require 'include.player'
require 'include.hud'
require 'include.Game'
-------------------------------------------------------------------------------

function love.load()
	love.window.setMode(800, 600, {resizable=true, vsync=false, minwidth=800, minheight=600})
	cam = gamera.new(0,0,mapWidth,mapHeight)
	love.keyboard.setKeyRepeat( enable )
	backspacedtcount = 0
	text = ""
	Game.game = true --Set game state to game true by default. Should be menu
end

function love.textinput(t)
    text = text .. t
end

function love.update(dt)
	if Game.game then
		p1:move(dt)
		cam:setPosition(p1.x, p1.y)
		if love.keyboard.isDown(".") then
			love.window.setMode( 1000, 600 )
		end
		if love.keyboard.isDown("/") then
			love.window.setMode( 800, 600 )
		end
	end
	if Game.menu then
        	back = love.keyboard.isDown( "backspace" )
        	if back and backspacedtcount > 0.10 then
                	text = text:sub(1, #text - 1)
                	backspacedtcount = 0
        	elseif back then
                	backspacedtcount = backspacedtcount + dt
        	end
	end
end


function love.draw()
	if Game.game then
		cam:draw(function(l,t,w,h)
		map_draw()
		p1:draw('fill')
		end)
		hud_draw()
	end
	--love.graphics.print("Speed: " .. p1.v, 20, 20) -- debug
	--love.graphics.print(text, 20, 30) -- debug
end
