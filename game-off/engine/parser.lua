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
    input = V'block'^0 * -1,
    block = (V'whitespace'^0 * (V'expression' + V'comment') * V'whitespace'^0)^1,

    comment = P'--' * C((P(1) - P'\n')^0) * P'\n'^-1 / self.tocomment,

    expression = V'whitespace'^0 * (V'assignment' + V'function_call' + V'symbol' + V'value'),

    assignment = V'symbol' * V'whitespace'^0 * P'=' * V'whitespace'^0 * V'expression' / self.toassignment,

    value = V'string' + V'number',

    function_call = V'symbol' * V'whitespace'^0 * P'(' * V'function_arguments'^0 * V'whitespace'^0 * P')' / self.tofunctioncall,
    function_arguments = C(V'whitespace'^0 * V'expression' * (V'whitespace'^0 * P',' * V'whitespace'^0 * V'expression')^0),

    string = (P'"' * C((P(1) - P'"')^0) * P'"'),
    number = C(R'09'^1 * (P'.' * R'09')^0) / tonumber,

    whitespace = S' \t\r\n',
    symbol = C((R'az' + R'AZ' + P'_') * (R'az' + R'AZ' + R'09' + P'_')^0),
  })
end

function Parser:parse(input)
  return self.Grammar:match(input)
end

function Parser.tocomment(contents)
  if D then Log.info(tag, "Comment! %s", contents) end
  return { "comment", contents }
end

function Parser.toassignment(variable, value)
  if D then Log.info(tag, "Assignment! %s = %s", variable, Inspect(value)) end
  return { "assignment", variable, value }
end

function Parser.tofunctioncall(symbol, arguments)
  if D then Log.info(tag, "Function call! %s ( %s )", symbol, Inspect(arguments)) end
  return { "function-call", symbol, arguments }
end
