-----------------------------------------------------------
-- START draw hud------------------------------------------
-----------------------------------------------------------
hud = {x = 10, y = 10, w = 100, h = 60}

function hud_draw()
	border()
	health()
	stamina()
	utility()
end

-----------------------------------------------------------
-- START draw border---------------------------------------
-----------------------------------------------------------
function border()
	love.graphics.setColor(0,0,0,75)
	love.graphics.rectangle("fill", hud.x, hud.y, hud.w, hud.h)
end
-----------------------------------------------------------
-- END draw border-----------------------------------------
-----------------------------------------------------------

-----------------------------------------------------------
-- START draw health---------------------------------------
-----------------------------------------------------------
function health()
	local w = hud.w - hud.w * .1
	local h = hud.h * .25
	local x = hud.x + ((hud.w - w) / 2)
	local y = hud.y + ((hud.h - h) / 2) - (h + (hud.h * .05))
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("line", x, y, w, h)
	love.graphics.rectangle("fill", x, y, w * p1.health * .01, h)
end
-----------------------------------------------------------
-- END draw health-----------------------------------------
-----------------------------------------------------------

-----------------------------------------------------------
-- START draw stamina--------------------------------------
-----------------------------------------------------------
function stamina()
	local w = hud.w - hud.w * .1
	local h = hud.h * .25
	local x = hud.x + ((hud.w - w) / 2)
	local y = hud.y + ((hud.h - h) / 2)
	love.graphics.setColor(0,255,0)
	love.graphics.rectangle("line", x, y, w, h)
	love.graphics.line(x + w / 2, y, x + w / 2, y + h /4)
	love.graphics.line(x + w / 2, y + h, x + w / 2, y + h - h /4)
	love.graphics.rectangle("fill", x, y, w * p1.stam * .01, h)
end
-----------------------------------------------------------
-- END draw stamina----------------------------------------
-----------------------------------------------------------

-----------------------------------------------------------
-- START draw utility---------------------------------------
-----------------------------------------------------------
function utility()
	local w = hud.w - hud.w * .1
	local h = hud.h * .25
	local x = hud.x + ((hud.w - w) / 2)
	local y = hud.y + ((hud.h - h) / 2) + (h + (hud.h * .05))
	love.graphics.setColor(255,255,0)
	love.graphics.rectangle("line", x, y, w, h)
end
-----------------------------------------------------------
-- END draw health-----------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-- END draw hud--------------------------------------------
-----------------------------------------------------------