require "game"

input = {}

function input.keypressed(key)
        if key == "left" then
            game.Player.moveDirection = game.Player.moveDirection -5
        end
        if key == "right" then
            game.Player.moveDirection = game.Player.moveDirection +5
        end
        if key == "space" then
            if game.isGameOver then 
                game.isGameOver = false
                game.init()
            end

            if not game.Ball.isMoving then
                game.Velocity.x = love.math.random(10) - 5
                game.Velocity.y = -love.math.random(5)
            end
    
           game.Ball.isMoving = true
        end
end

function input.keyreleased(key)
    if key == "left" then
        game.Player.moveDirection = game.Player.moveDirection +5
    end
    if key == "right" then
        game.Player.moveDirection = game.Player.moveDirection -5
    end
end

return input