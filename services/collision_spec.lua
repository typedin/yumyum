local check_collision = require("services.collision")
describe("check_collision", function()
	describe("true", function()
		it("is true player and coin with different size", function()
			assert.is_true(check_collision({ x = 1, y = 1, size = 1 }, { x = 1, y = 1, size = 1 }))
			assert.is_true(check_collision({ x = 1, y = 1, size = 10 }, { x = 1, y = 1, size = 1 }))
			assert.is_true(check_collision({ x = 1, y = 1, size = 20 }, { x = 1, y = 1, size = 1 }))
			assert.is_true(check_collision({ x = 1, y = 1, size = 30 }, { x = 1, y = 1, size = 1 }))
		end)
	end)
	it("is false player and coin with different size", function()
		assert.is_false(check_collision({ x = 3, y = 1, size = 1 }, { x = 1, y = 1, size = 1 }))
		assert.is_false(check_collision({ x = 1, y = 3, size = 1 }, { x = 1, y = 1, size = 1 }))
		--[[ assert.is_false(check_collision({ x = 1, y = 1, size = 10 }, { x = 1, y = 1, size = 1 })) ]]
		--[[ assert.is_false(check_collision({ x = 1, y = 1, size = 20 }, { x = 1, y = 1, size = 1 })) ]]
		--[[ assert.is_false(check_collision({ x = 1, y = 1, size = 30 }, { x = 1, y = 1, size = 1 })) ]]
	end)
end)
