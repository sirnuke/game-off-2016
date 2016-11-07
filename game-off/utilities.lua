-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local Utilities = Class("Utilities")

function Utilities:isInteger(value)
  local integer, fractional
  if type(value) ~= "number" then
    return false
  end
  integer, fractional = math.modf(value)
  if fractional ~= 0 then
    return false
  else
    return true
  end
end

return Utilities
