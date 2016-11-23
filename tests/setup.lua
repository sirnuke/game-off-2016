-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

Inspect = require "library.inspect"
Class = require "library.30log"
local success, lpeg = pcall(require, "lpeg")
if success then
  LPeg = lpeg
else
  LPeg = require "library.lulpeg"
end

require "library.strict"

Utilities = require "utilities"
Log = require "log"

require "settings"

Core = {
  loadImage = function() end
}
