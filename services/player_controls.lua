local player_controls = function(player, dt)
	if love.keyboard.isDown("left") then
		player.x = player.x - 200 * dt
	elseif love.keyboard.isDown("right") then
		player.x = player.x + 200 * dt
	end

	if love.keyboard.isDown("up") then
		player.y = player.y - 200 * dt
	elseif love.keyboard.isDown("down") then
		player.y = player.y + 200 * dt
	end
end

return player_controls
