-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "Editor"

Editor = Scene:extend("Editor")

function Editor:init()
  Editor.super:init()
  self.Background = self:loadImage("Background")
end

function Editor:enter()
end

function Editor:update(dt)
  local x, y = love.mouse.getPosition()
end

function Editor:draw()
  love.graphics.draw(self.Background)
end

function Editor:exit()
  self.Map = nil
  self.MapView = nil
end

function Editor:mousePressed(x, y, button)
end

function Editor:mouseReleased(x, y, button)
end
