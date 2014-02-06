gamera = require 'include.gamera'
tilecollider = require 'include.tilecollider'
require 'include.map'
require 'include.player'
require 'include.hud'
-------------------------------------------------------------------------------

function love.load()
	cam = gamera.new(0,0,3200,3200)
end


function love.update(dt)
	p1:move(dt)
	cam:setPosition(p1.x, p1.y)
end


function love.draw()

	cam:draw(function(l,t,w,h)
	map_draw()
	p1:draw('fill')
	end)
	hud_draw()
	love.graphics.print("Speed: " .. p1.v, 20, 20) -- debug
end