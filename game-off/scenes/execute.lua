-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "Execute"

Execute = Scene:extend("Execute")

function Execute:init()
  Execute.super:init()
  self.Background = self:loadImage("Background")
end

function Execute:enter()
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
