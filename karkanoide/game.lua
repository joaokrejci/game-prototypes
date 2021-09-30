game = {}

Player = {
	width = 50,
	height = 10,
	x = love.graphics.getWidth()/2 - 25,
	y = love.graphics.getHeight() - 20,
    moveDirection = 0
}

function Player.move()
    if Player.moveDirection > 0 and Player.x + Player.width >= love.graphics.getWidth()  then 
        return 
    elseif Player.moveDirection < 0 and Player.x <= 0 then
        return
    else
        Player.x = Player.x + Player.moveDirection
    end
end

Ball = {
	width = 10,
	height = 10,
	x = Player.x + Player.width/2,
	y = Player.y - 10,
    isMoving = false
}

function Ball.move()
    if Ball.x + Ball.width >= love.graphics.getWidth() or Ball.x <= 0 then 
        Velocity.x = -Velocity.x
    end
    if Ball.y >= love.graphics.getHeight() then
        game.stop()
    elseif Ball.y <= 0 then
        Velocity.y = -Velocity.y
    end

    if Ball.isMoving then 
        Ball.x = Ball.x + Velocity.x
        Ball.y = Ball.y + Velocity.y
    end
end

Velocity = {
	x = 0,
	y = 0
}

function game.init()
    Player.x = love.graphics.getWidth()/2 - 25
    Player.moveDirection = 0

	Ball.x = Player.x + Player.width/2
	Ball.y = Player.y - 10
    Ball.isMoving = false

    Velocity.x = 0
    Velocity.y = 0
end

function game.update()
    if Ball.y + Ball.height >= Player.y 
        and Ball.y < Player.y 
        and Ball.x >= Player.x 
        and Ball.x + Ball.width <= Player.x + Player.width 
    then
        Velocity.y = -Velocity.y
    end
end

game.isGameOver = false

function game.stop()
    game.isGameOver = true
end

game.Player = Player
game.Ball = Ball
game.Velocity = Velocity

return game

