local shake_screen = function(shake, dt)
	if shake.duration > 0 then
		shake.duration = shake.duration - dt
		if shake.wait > 0 then
			shake.wait = shake.wait - dt
		else
			shake.offset.x = love.math.random(-5, 5)
			shake.offset.y = love.math.random(-5, 5)
			shake.wait = 0.05
		end
	end
end

return shake_screen
