-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "System"

System = Scene:extend("System")

function System:init()
  System.super:init()
  self.Background = self:loadImage("Background")
end

function System:enter()
end

function System:update(dt)
end

function System:draw()
  love.graphics.draw(self.Background)
end

function System:exit()
end

function System:keyPressed(key)
end

function System:keyReleased(key)
end
