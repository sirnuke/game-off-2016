-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

Inspect = require "library.inspect"
Class = require "library.30log"
LPeg = require "library.lulpeg"

require "library.strict"

Utilities = require "utilities"
Log = require "log"

local tag = "Main"

require "core"

function love.load()
  Log.info(tag, "Loading...")
  StartGame()
end

function love.update(dt) Core:update(dt) end
function love.draw() Core:draw() end

function love.keypressed(key) Core:keyPressed(key) end
function love.keyreleased(key) Core:keyReleased(key) end
function love.mousepressed(x, y, button) Core:mousePressed(x, y, button) end
function love.mousereleased(x, y, button) Core:mouseReleased(x, y, button) end
