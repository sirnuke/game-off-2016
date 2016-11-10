-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local tag = "Parser"

local S, P, R, V, C, Ct = LPeg.S, LPeg.P, LPeg.R, LPeg.V, LPeg.C, LPeg.Ct

Parser =  Class("Parser")

function Parser:init()
  self.Grammar = Ct(P{
    "input",
    input = V'string' * -1,
    string = (P'"' * C((P(1) - P'"')^0) * P'"') / self.destring,
  })
end

function Parser:match(input)
  return self.Grammar:match(input)
end

function Parser.destring(contents)
  Log.info(tag, "String! %s %s", contents)
  return { "string", contents }
end
