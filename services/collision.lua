local function check_collision(player, coin)
	-- Calculating distance in 1 line
	-- Subtract the x's and y's, square the difference
	-- Sum the squares and find the root of the sum.
	local distance = math.sqrt((player.x - coin.x) ^ 2 + (player.y - coin.y) ^ 2)
	-- Return whether the distance is lower than the sum of the sizes.
	return distance < player.size + coin.size
end

return check_collision
