-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "scenes.scene"

require "engine.repl"
require "world.console"

local tag = "Execute"

Execute = Scene:extend("Execute")

function Execute:init()
  Execute.super:init()
  self.Background = self:loadImage("Background")
  self.Console = Console()
  self.Font = self:loadFont("Console", "Console")
end

function Execute:enter()
  self.HasKeyRepeat = love.keyboard.hasKeyRepeat()
  love.keyboard.setKeyRepeat(true)
end

function Execute:update(dt)
end

function Execute:draw()
  love.graphics.draw(self.Background)
  local offset = 10
  love.graphics.setColor(Settings.Scenes.Execute.DefaultColor)
  love.graphics.setFont(self.Font)
  for _,value in ipairs(self.Console.History) do
    love.graphics.print(value, 10, offset)
    offset = offset + 16
  end
  love.graphics.print(self.Console:format_input(), 10, offset)
end

function Execute:exit()
  love.keyboard.setKeyRepeat(self.HasKeyRepeat)
end

function Execute:textInputted(text)
  self.Console:add_input(text)
end

function Execute:keyPressed(key)
  -- TODO: Delete, arrow keys, etc
  if key == "backspace" then
    self.Console:delete_input()
  elseif key == "enter" then
    -- TODO: Execute input
  end
end

function Execute:keyReleased(key)
end
