require "game"
require "input"
require "levels"
require "utils"

function love.keypressed(key)
	input.keypressed(key)
end

function love.keyreleased(key)
	input.keyreleased(key)
end

function love.load()
	currentLevel = 1
	game.init()
end

function love.update()
	if isGameOver then
		return
	end

	game.Player.move()
	game.Ball.move()
	game.update()
end

function love.draw()
	if game.isGameOver then
		r,g,b,a = love.graphics.getColor()
		love.graphics.setColor(1, 0, 0, 1)
		love.graphics.print("Game Over!", love.graphics.getWidth() /2, love.graphics.getHeight() / 2)
		love.graphics.setColor(r,g,b,a)
		return
	end

	love.graphics.setColor(1,1,1)
	love.graphics.rectangle("fill", Player.x, Player.y, 50, 10)
	love.graphics.rectangle("fill", Ball.x, Ball.y, 10, 10)

	for row = 1 , 9 do
		for block = 1, 12 do
			if(levels[currentLevel][row][block] > 0) then
				love.graphics.setColor(currentLevel*0.1, row*0.1, block*0.1)
				love.graphics.rectangle("fill", block * blockSize.width - blockSize.width, row * blockSize.height - blockSize.height, blockSize.width, blockSize.height)
			end
		end
	end
end
