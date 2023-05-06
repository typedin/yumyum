local lume = require("services.lume")
local load_image = require("services.load-image")

local function load_game(player, coins)
	if love.filesystem.getInfo("savedata.txt") then
		local data = lume.deserialize(love.filesystem.read("savedata.txt"))

		--Apply the player info
		player.x = data.player.x
		player.y = data.player.y
		player.size = data.player.size
		player.score = data.player.score

		for i, v in ipairs(data.coins) do
			coins[i] = {
				x = v.x,
				y = v.y,
				size = 10,
				image = load_image("assets/dollar.png"),
			}
		end
	else
		-- Only execute this if you don't have a save file
		for i = 1, 25 do
			table.insert(coins, {
				x = love.math.random(50, 650),
				y = love.math.random(50, 450),
				size = 10,
				image = load_image("assets/dollar.png"),
			})
		end
	end
end

return load_game
