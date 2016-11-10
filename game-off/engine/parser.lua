-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local tag = "Parser"

local S, P, R, V, C, Ct = LPeg.S, LPeg.P, LPeg.R, LPeg.V, LPeg.C, LPeg.Ct

local D

Parser =  Class("Parser")

function Parser:init(debug)
  D = debug or false
  self.Grammar = Ct(P{
    "input",
    input = P(-1) + ((V'whitespace'^0 * V'line')^1 * V'whitespace'^0 * -1),
    line = V'statement'+V'comment',
    statement = V'string',
    string = (P'"' * C((P(1) - P'"')^0) * P'"') / self.destring,
    comment = P'--' * C((P(1) - P'\n')^0) * P'\n'^-1 / self.decomment,
    whitespace = S' \t\r\n',
  })
end

function Parser:parse(input)
  return self.Grammar:match(input)
end

function Parser.destring(contents)
  if D then Log.info(tag, "String! %s", contents) end
  return { "string", contents }
end

function Parser.decomment(contents)
  if D then Log.info(tag, "Comment! %s", contents) end
  return { "comment", contents }
end
