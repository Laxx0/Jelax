-----------------------------------------------------------
-- START create player-------------------------------------
-----------------------------------------------------------
moveLeft = love.graphics.newQuad(21, 20, 32, 64, 587, 304)
moveRight = love.graphics.newQuad(25, 20, 32, 64, 587, 304)
moveUp = love.graphics.newQuad(19, 117, 32, 64, 587, 304)
moveDown = love.graphics.newQuad(21, 207, 32, 64, 587, 304)

movingLeft = love.graphics.newQuad(21, 20, 32, 64, 587, 304)
movingRight = love.graphics.newQuad(25, 20, 32, 64, 587, 304)
movingUp = love.graphics.newQuad(19, 117, 32, 64, 587, 304)
movingDown = love.graphics.newQuad(21, 207, 32, 64, 587, 304)

p1  = {img = love.graphics.newImage("include/media/player.png"), d = movingDown, dImg = moveDown, x = 128,y = 128, w = 32, h = 64, health = 100, stam = 100, v = 75, vOld = 75, sprint = false, lBound = 128, tBound = 128, rBound = mapWidth - 128 - 32, bBound = mapHeight - 128 - 64, drawBoundBox = false}

-----------------------------------------------------------
-- END create player---------------------------------------
-----------------------------------------------------------

function p1:unpack()
	return self.x,self.y,self.w,self.h
end

function p1:draw()
	if p1.drawBoundBox == true then
		love.graphics.setColor(255,255,0)
		love.graphics.rectangle('fill',self:unpack())
	end
	love.graphics.setColor(255,255,255)
	if p1.d == moveRight then
		love.graphics.draw(p1.img, p1.dImg, p1.x, p1.y, nil, -1, 1, 25)
	else
		love.graphics.draw(p1.img, p1.dImg, p1.x, p1.y)
	end
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
	if (love.keyboard.isDown('up') or love.keyboard.isDown('w') and p1.y >= p1.tBound) and (love.keyboard.isDown('down') or love.keyboard.isDown('s') and p1.y <= p1.bBound) then
		dy = 0
	elseif love.keyboard.isDown('up') or love.keyboard.isDown('w') and p1.y >= p1.tBound then
		dy = -p1.v*dt
		if p1.d ~= moveUp then
			sTime = love.timer.getTime()
		end
		p1.d = moveUp
		eTime = love.timer.getTime()
		if eTime - sTime < .25 then
			movingUp = love.graphics.newQuad(21, 117, 32, 64, 587, 304)
		elseif eTime - sTime < .5 then
			movingUp = love.graphics.newQuad(68, 117, 32, 64, 587, 304)
		elseif eTime - sTime < .75 then
			movingUp = love.graphics.newQuad(120, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 1 then
			movingUp = love.graphics.newQuad(168, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 1.25 then
			movingUp = love.graphics.newQuad(210, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 1.5 then
			movingUp = love.graphics.newQuad(258, 117, 32, 64, 587, 304)	
		elseif eTime - sTime < 1.75 then
			movingUp = love.graphics.newQuad(312, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 2 then
			movingUp = love.graphics.newQuad(372, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 2.25 then
			movingUp = love.graphics.newQuad(418, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 2.5 then
			movingUp = love.graphics.newQuad(472, 117, 32, 64, 587, 304)
		elseif eTime - sTime < 2.75 then
			movingUp = love.graphics.newQuad(518, 117, 32, 64, 587, 304)
		else
			sTime = love.timer.getTime()
		end
		p1.dImg = movingUp
	elseif love.keyboard.isDown('down') or love.keyboard.isDown('s') and p1.y <= p1.bBound then
		dy = p1.v*dt
		if p1.d ~= moveDown then
			sTime = love.timer.getTime()
		end
		p1.d = moveDown
		eTime = love.timer.getTime()
		if eTime - sTime < .25 then
			movingDown = love.graphics.newQuad(21, 207, 32, 64, 587, 304)
		elseif eTime - sTime < .5 then
			movingDown = love.graphics.newQuad(68, 207, 32, 64, 587, 304)
		elseif eTime - sTime < .75 then
			movingDown = love.graphics.newQuad(120, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 1 then
			movingDown = love.graphics.newQuad(168, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 1.25 then
			movingDown = love.graphics.newQuad(210, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 1.5 then
			movingDown = love.graphics.newQuad(258, 207, 32, 64, 587, 304)	
		elseif eTime - sTime < 1.75 then
			movingDown = love.graphics.newQuad(312, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 2 then
			movingDown = love.graphics.newQuad(372, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 2.25 then
			movingDown = love.graphics.newQuad(418, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 2.5 then
			movingDown = love.graphics.newQuad(472, 207, 32, 64, 587, 304)
		elseif eTime - sTime < 2.75 then
			movingDown = love.graphics.newQuad(518, 207, 32, 64, 587, 304)
		else
			sTime = love.timer.getTime()
		end
		p1.dImg = movingDown
	else
		dy = 0
	end
	if (love.keyboard.isDown('left') or love.keyboard.isDown('a') and p1.x >= p1.lBound) and (love.keyboard.isDown('right') or love.keyboard.isDown('d') and p1.x <= p1.rBound) then
		dx = 0
	elseif love.keyboard.isDown('left') or love.keyboard.isDown('a') and p1.x >= p1.lBound then
		dx = -p1.v*dt
		if p1.d ~= moveLeft then
			sTime = love.timer.getTime()
		end
		p1.d = moveLeft
		eTime = love.timer.getTime()
		if eTime - sTime < .25 then
			movingLeft = love.graphics.newQuad(21, 20, 32, 64, 587, 304)
		elseif eTime - sTime < .5 then
			movingLeft = love.graphics.newQuad(68, 20, 32, 64, 587, 304)
		elseif eTime - sTime < .75 then
			movingLeft = love.graphics.newQuad(120, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1 then
			movingLeft = love.graphics.newQuad(168, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1.25 then
			movingLeft = love.graphics.newQuad(210, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1.5 then
			movingLeft = love.graphics.newQuad(258, 20, 32, 64, 587, 304)	
		elseif eTime - sTime < 1.75 then
			movingLeft = love.graphics.newQuad(312, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2 then
			movingLeft = love.graphics.newQuad(372, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.25 then
			movingLeft = love.graphics.newQuad(418, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.5 then
			movingLeft = love.graphics.newQuad(472, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.75 then
			movingLeft = love.graphics.newQuad(518, 20, 32, 64, 587, 304)
		else
			sTime = love.timer.getTime()
		end
		p1.dImg = movingLeft
		
	elseif love.keyboard.isDown('right') or love.keyboard.isDown('d') and p1.x <= p1.rBound then
		dx = p1.v*dt
		if p1.d ~= moveRight then
			sTime = love.timer.getTime()
		end
		p1.d = moveRight
		eTime = love.timer.getTime()
		if eTime - sTime < .25 then
			movingRight = love.graphics.newQuad(25, 20, 32, 64, 587, 304)
		elseif eTime - sTime < .5 then
			movingRight = love.graphics.newQuad(72, 20, 32, 64, 587, 304)
		elseif eTime - sTime < .75 then
			movingRight = love.graphics.newQuad(124, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1 then
			movingRight = love.graphics.newQuad(172, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1.25 then
			movingRight = love.graphics.newQuad(214, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 1.5 then
			movingRight = love.graphics.newQuad(262, 20, 32, 64, 587, 304)	
		elseif eTime - sTime < 1.75 then
			movingRight = love.graphics.newQuad(316, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2 then
			movingRight = love.graphics.newQuad(376, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.25 then
			movingRight = love.graphics.newQuad(422, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.5 then
			movingRight = love.graphics.newQuad(476, 20, 32, 64, 587, 304)
		elseif eTime - sTime < 2.75 then
			movingRight = love.graphics.newQuad(522, 20, 32, 64, 587, 304)
		else
			sTime = love.timer.getTime()
		end
		p1.dImg = movingRight
	else 
		dx = 0
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