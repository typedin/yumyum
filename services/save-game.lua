local lume = require("services.lume")

local function save_game(player, coins)
	local data = {}
	data.player = {
		x = player.x,
		y = player.y,
		size = player.size,
		score = player.score,
	}

	data.coins = {}
	for i, v in ipairs(coins) do
		-- In this case data.coins[i] = value is the same as table.insert(data.coins, value )
		data.coins[i] = { x = v.x, y = v.y }
	end

	local serialized = lume.serialize(data)
	-- The filetype actually doesn't matter, and can even be omitted.
	love.filesystem.write("savedata.txt", serialized)
end

return save_game
