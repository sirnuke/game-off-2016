-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local tag = "Console"

Console = Class("Console")

function Console:init()
  self.History = {}
  self:reset_input()
end

function Console:add_history(line)
  assert(type(line) == "string")
  local i, j = 1, #line
  while i <= j do
    table.insert(self.History, string.sub(line, i, i + Settings.World.Console.Max.Line - 1))
    i = i + Settings.World.Console.Max.Line
  end
  while #self.History > Settings.World.Console.Max.History  do
    table.remove(self.History, 1)
  end
end

function Console:add_input(character)
  assert(type(character) == "string" and #character == 1)
  table.insert(self.Input, character)
end

function Console:delete_input()
  if #self.Input > 0 then
    table.remove(self.Input)
  end
end

function Console:reset_input()
  self.Input = {}
end
