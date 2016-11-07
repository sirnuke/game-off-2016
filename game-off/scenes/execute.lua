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
  local x, y = love.mouse.getPosition()
end

function Execute:draw()
  love.graphics.draw(self.Background)
end

function Execute:exit()
end

function Execute:mousePressed(x, y, button)
end

function Execute:mouseReleased(x, y, button)
end
