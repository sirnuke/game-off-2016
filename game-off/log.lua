-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local log = {}

local function perform(level, tag, message, ...)
  local info, src, func, line = debug.getinfo(3, "nlS"), "?", "?", "?"
  if info then 
    func = info.name
    if not func then func = "[root]" end
    src = info.short_src
    line = info.currentline
  end
  io.write(string.format("%s [%s][%s] %s@%i:%s %s\n", os.date(), level, tag, src, line, func, string.format(message, ...)))
end

function log.debug(tag, message, ...) perform("Debug", tag, message, ...) end
function log.warn(tag, message, ...)  perform("Warn",  tag, message, ...) end
function log.info(tag, message, ...)  perform("Info",  tag, message, ...) end
function log.error(tag, message, ...) perform("Error", tag, message, ...) end

return log
