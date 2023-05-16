local check_collision = require("services.collision")
local load_game = require("services.load-game")
local load_image = require("services.load-image")
local player_controls = require("services.player_controls")
local save_game = require("services.save-game")
local shake_screen = require("services.shake-screen")

local coins = {}
local player = {
	x = 100,
	y = 100,
	size = 25,
	image = load_image("assets/face.png"),
	score = 0,
}

local shake = {
	duration = 0,
	wait = 0,
	offset = { x = 0, y = 0 },
}

function love.keypressed(key)
	if key == "f1" then
		save_game(player, coins)
	elseif key == "f2" then
		love.filesystem.remove("savedata.txt")
		love.event.quit("restart")
	end
end

function love.load()
	load_game(player, coins)
end

function love.update(dt)
	shake_screen(shake, dt, love)
	player_controls(player, dt)

	if love.keyboard.isDown("escape") then
		love.event.quit()
	end

	-- Start at the end, until 1, with steps of -1
	for i = #coins, 1, -1 do
		-- Use coins[i] instead of v
		if check_collision(player, coins[i]) then
			table.remove(coins, i)
			player.size = player.size + 1
			player.score = player.score + 1
			shake.duration = 0.3
		end
	end
end

function love.draw()
	love.graphics.push() -- Make a copy of the current state and push it onto the stack.
	love.graphics.translate(-player.x + 400, -player.y + 300)
	if shake.duration > 0 then
		love.graphics.translate(shake.offset.x, shake.offset.y)
	end
	love.graphics.circle("line", player.x, player.y, player.size)
	love.graphics.draw(
		player.image,
		player.x,
		player.y,
		0,
		1,
		1,
		player.image:getWidth() / 2,
		player.image:getHeight() / 2
	)
	for i, v in ipairs(coins) do
		love.graphics.circle("line", v.x, v.y, v.size)
		love.graphics.draw(v.image, v.x, v.y, 0, 1, 1, v.image:getWidth() / 2, v.image:getHeight() / 2)
	end
	love.graphics.pop() -- Pull the copy of the state of the stack and apply it.
	love.graphics.print(tostring(player.score), 10, 10)
end
