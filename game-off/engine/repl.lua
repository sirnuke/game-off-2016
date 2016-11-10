-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "engine.parser"

local tag = "REPL"

REPL = Class("REPL")

-- TODO: Genericize to work with strings or whatever
function REPL:init()
  self.Parser = Parser(true)
  local input
  while true do
    io.write("> ")
    input = io.read()
    if input == nil or input == "quit" then
      break
    end
    print(Inspect(self.Parser:parse(input)))
  end 
end
