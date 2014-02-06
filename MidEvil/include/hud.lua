-----------------------------------------------------------
-- START draw hud------------------------------------------
-----------------------------------------------------------
hud = {x = 20, y = 20, w = 100, h = 60}

function hud_draw()
	--border()
	--health()
	stamina()
end

-----------------------------------------------------------
-- START draw border---------------------------------------
-----------------------------------------------------------
function border()
	love.graphics.rectangle("line", hud.x, hud.y, hud.w, hud.h)
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
	local x = hud.x + hud.x * .25
	local y = hud.y + hud.y * .25
	love.graphics.rectangle("line", x, y, w, h)
	--love.graphics.rectangle("fill", hud.x + ((hud.x * .05) * 2), hud.y + ((hud.y * .05) * 2), (hud.w * .9) * .9, (hud.h * .25) * .25)
end
-----------------------------------------------------------
-- END draw health-----------------------------------------
-----------------------------------------------------------

-----------------------------------------------------------
-- START draw stamina--------------------------------------
-----------------------------------------------------------
function stamina()
	love.graphics.rectangle("line", 20, love.window.getHeight() - 60, 110, 30)
	love.graphics.rectangle("fill", 25, love.window.getHeight() - 55, p1.stam, 20)
	love.graphics.line(50, love.window.getHeight() - 60, 50, love.window.getHeight() - 55)
	love.graphics.line(50, love.window.getHeight() - 30, 50, love.window.getHeight() - 35)
	love.graphics.line(75, love.window.getHeight() - 60, 75, love.window.getHeight() - 55)
	love.graphics.line(75, love.window.getHeight() - 30, 75, love.window.getHeight() - 35)
	love.graphics.line(100, love.window.getHeight() - 60, 100, love.window.getHeight() - 55)
	love.graphics.line(100, love.window.getHeight() - 30, 100, love.window.getHeight() - 35)
	love.graphics.printf(math.ceil(p1.stam), 71, love.window.getHeight() - 25, 3, "center")
end
-----------------------------------------------------------
-- END draw stamina----------------------------------------
-----------------------------------------------------------
-----------------------------------------------------------
-- END draw hud--------------------------------------------
-----------------------------------------------------------