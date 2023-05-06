local function check_collision(p1, p2)
	-- Calculating distance in 1 line
	-- Subtract the x's and y's, square the difference
	-- Sum the squares and find the root of the sum.
	local distance = math.sqrt((p1.x - p2.x) ^ 2 + (p1.y - p2.y) ^ 2)
	-- Return whether the distance is lower than the sum of the sizes.
	return distance < p1.size + p2.size
end

return check_collision
