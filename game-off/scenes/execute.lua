-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

require "engine.parser"
require "world.console"

local tag = "Execute"

Execute = Scene:extend("Execute")

function Execute:init()
  Execute.super:init()
  self.Background = self:loadImage("Background")
  self.Console = Console()
  self.Parser = Parser(true)
end

function Execute:enter()
  Log.info(tag, Inspect(self.Parser:parse("\"hello\" -- world")))
end

function Execute:update(dt)
end

function Execute:draw()
  love.graphics.draw(self.Background)
end

function Execute:exit()
end

function Execute:keyPressed(key)
end

function Execute:keyReleased(key)
end
