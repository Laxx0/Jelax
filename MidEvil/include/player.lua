-- create player
p1  = {x = 128,y = 128, w = 32, h = 32, v = 200, lBound = 128, tBound = 128, rBound = 3200 - 128 - 32, bBound = 3200 - 128 - 32}

function p1:unpack()
	return self.x,self.y,self.w,self.h
end

function p1:draw()
	love.graphics.setColor(255,255,0)
	love.graphics.rectangle('fill',self:unpack())
end

function p1:move(dt)
	-- directional velocity control
	if love.keyboard.isDown('left') or love.keyboard.isDown('a') and p1.x >= p1.lBound then
		dx = -p1.v*dt
	elseif love.keyboard.isDown('right') or love.keyboard.isDown('d') and p1.x <= p1.rBound then
		dx = p1.v*dt
	else 
		dx = 0
	end
	if love.keyboard.isDown('up') or love.keyboard.isDown('w') and p1.y >= p1.tBound then
		dy = -p1.v*dt
	elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') and p1.y <= p1.bBound then
		dy = p1.v*dt
	else
		dy = 0
	end
	prevLeftGX,_,prevRightGX = getTileRange(grid.tileWidth,grid.tileHeight,p1:unpack())
	
-----------------------------------------------------------
	
	-- move and resolve collisions
	p1.x = p1.x+dx
	if dx > 0 then
		newx = handler:rightResolve(p1:unpack())
	elseif dx < 0 then
		newx = handler:leftResolve(p1:unpack())
	else
		newx = handler:rightResolve(p1:unpack())
		if newx == p1.x then newx = handler:leftResolve(p1:unpack()) end
	end
	p1.x = newx
	
	p1.y = p1.y+dy
	if dy > 0 then
		newy = handler:bottomResolve(p1:unpack())
	elseif dy < 0 then
		newy = handler:topResolve(p1:unpack())
	else
		newy = handler:bottomResolve(p1:unpack())
		if newy == p1.y then newy = handler:topResolve(p1:unpack()) end
	end
	p1.y = newy
end