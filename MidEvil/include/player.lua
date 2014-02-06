-----------------------------------------------------------
-- START create player-------------------------------------
-----------------------------------------------------------
p1  = {x = 128,y = 128, w = 32, h = 32, stam = 100, v = 75, vOld = 75, sprint = false, lBound = 128, tBound = 128, rBound = 3200 - 128 - 32, bBound = 3200 - 128 - 32}
-----------------------------------------------------------
-- END create player---------------------------------------
-----------------------------------------------------------

function p1:unpack()
	return self.x,self.y,self.w,self.h
end

function p1:draw()
	love.graphics.setColor(255,255,0)
	love.graphics.rectangle('fill',self:unpack())
end

function p1:move(dt)
	-----------------------------------------------------------
	-- START sprint control------------------------------------
	-----------------------------------------------------------
	if (love.keyboard.isDown('lshift') or love.keyboard.isDown('rshift')) and (dx ~= 0 or dy ~= 0) then
		if p1.sprint == false and p1.stam > 50 then
			p1.vOld = p1.v
			p1.v = math.ceil(p1.v*1.666)
			p1.sprint = true
		end
	else
		if p1.sprint == true then
			p1.v = p1.vOld
			p1.sprint = false
		end
	end
	if p1.sprint == true and p1.stam > 0 then
		p1.stam = p1.stam - 40 * dt
	elseif p1.sprint == false and p1.stam < 100 then
		p1.stam = p1.stam + 5 * dt
	end
	if p1.stam < 0 then
		p1.stam = 0
		p1.v = p1.vOld
	end
	if p1.stam > 100 then p1.stam = 100 end
	-----------------------------------------------------------
    -- END sprint control--------------------------------------
	-----------------------------------------------------------
	
	-----------------------------------------------------------
	-- START directional velocity control----------------------
	-----------------------------------------------------------
	if (love.keyboard.isDown('left') or love.keyboard.isDown('a') and p1.x >= p1.lBound) and (love.keyboard.isDown('right') or love.keyboard.isDown('d') and p1.x <= p1.rBound) then
		dx = 0
	elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') and p1.x >= p1.lBound then
		dx = -p1.v*dt
	elseif love.keyboard.isDown('right') or love.keyboard.isDown('d') and p1.x <= p1.rBound then
		dx = p1.v*dt
	else 
		dx = 0
	end
	if (love.keyboard.isDown('up') or love.keyboard.isDown('w') and p1.y >= p1.tBound) and (love.keyboard.isDown('down') or love.keyboard.isDown('s') and p1.y <= p1.bBound) then
		dy = 0
	elseif love.keyboard.isDown('up') or love.keyboard.isDown('w') and p1.y >= p1.tBound then
		dy = -p1.v*dt
	elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') and p1.y <= p1.bBound then
		dy = p1.v*dt
	else
		dy = 0
	end
	prevLeftGX,_,prevRightGX = getTileRange(grid.tileWidth,grid.tileHeight,p1:unpack())
	-----------------------------------------------------------
	-- END directional velocity control------------------------
	-----------------------------------------------------------
	
	-----------------------------------------------------------
	-- START move and resolve collisions-----------------------
	-----------------------------------------------------------
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
	-----------------------------------------------------------
	-- END move and resolve collisions-------------------------
	-----------------------------------------------------------
end