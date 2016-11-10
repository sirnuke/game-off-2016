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
    input = P(-1) + ((V'whitespace' * V'line')^1 * V'whitespace' * -1),
    line = V'expression' + V'comment',

    comment = P'--' * C((P(1) - P'\n')^0) * P'\n'^-1 / self.decomment,

    expression = V'assignment' + V'value',

    assignment = V'symbol' * V'whitespace' * P'=' * V'whitespace' * V'expression' / self.deassignment,

    value = V'string' + V'number',

    string = (P'"' * C((P(1) - P'"')^0) * P'"') / self.destring,
    number = C(R'09'^1 * P'.' * R'09'^0),

    whitespace = S' \t\r\n'^0,
    symbol = C((R'az' + R'AZ' + P'_') * (R'az' + R'AZ' + R'09' + P'_')^0),
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

function Parser.deassignment(variable, value)
  if D then Log.info(tag, "Assignment! %s = %s", variable, Inspect(value)) end
  return { "assignment", variable, value }
end
