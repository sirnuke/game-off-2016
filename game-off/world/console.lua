-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local tag = "Console"

Console = Class("Console")

function Console:init()
  self.Input = ""
  self.History = {}
end

function Console:add_line(line)
  table.insert(self.History, line)
  while #self.History > Settings.World.Console.MaxLength  do
    table.remove(self.History, 1)
  end
end
