-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

local tag = "Loading"

Loading = Scene:extend("Loading")

function Loading:init()
  Loading.super:init()
  self.Background = self:loadImage("Background")
end

function Loading:setReturnScene(nextScene)
  self.NextScene = nextScene
end

function Loading:enter()
  assert(self.NextScene)
end

function Loading:update(dt)
  Core:changeScene(self.NextScene)
end

function Loading:draw()
  love.graphics.draw(self.Background)
end

function Loading:exit()
  self.NextScene = nil
end
