-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "settings"

require "engine.repl"
require "scenes.loading"
require "scenes.execute"
require "scenes.system"
require "scenes.editor"

local tag = "Core"

local CoreImpl = Class("Core")
Core = nil

function StartGame(arguments)
  Log.info(tag, "Starting...")
  Core = CoreImpl()
  if arg[2] and string.lower(arg[2]) == "--repl" then
    Core:repl(true)
    os.exit(true)
  else
    Core:load()
  end
end

function CoreImpl:load()
  self.Scenes = {
    Loading = Loading(),
    Execute = Execute(),
    System = System(),
    Editor = Editor(),
  }
  self.Scenes.Loading:setReturnScene("Execute")
  self.ActiveScene = self.Scenes.Loading
  self.ActiveScene:enter()
  self.ActiveScene:draw()
end

-- TODO: Convert this to a magic REPL scene?
function CoreImpl:repl()
  love.window.close()
  self.REPL = REPL()
end

function CoreImpl:draw()
  love.graphics.clear(Settings.Graphics.Clear)
  self.ActiveScene:draw()
end

function CoreImpl:update(dt)

  if self.NewScene then
    self.ActiveScene:exit()
    self.ActiveScene = self.NewScene
    self.NewScene = nil
    self.ActiveScene:enter()
  end

  self.ActiveScene:update(dt)
end

function CoreImpl:displayLoadingScene(returnScene)
  self.Scenes.Loading:setReturnScene(returnScene)
  self:changeScene("Loading")
end

function CoreImpl:changeScene(scene)
  assert(self.Scenes[scene])
  Log.info(tag, "Switching from %s to %s", self.ActiveScene.name, scene)
  self.NewScene = self.Scenes[scene]
end

function CoreImpl:loadImage(scope, name)
  local data = love.graphics.newImage(Settings.Graphics.Directory..scope.."/"..name)
  assert(data)
  return data
end

function CoreImpl:loadFont(name, size)
  local data = love.graphics.newFont(Settings.Fonts.Directory..Settings.Fonts[name], size)
  assert(data)
  return data
end

function CoreImpl:textInputted(text)
  self.ActiveScene:textInputted(text)
end

function CoreImpl:keyPressed(key)
  if Settings.Magic.QuickExit.Enabled and key == Settings.Magic.QuickExit.Key then
    os.exit(true)
  end
  self.ActiveScene:keyPressed(key)
end

function CoreImpl:keyReleased(key)
  self.ActiveScene:keyReleased(key)
end

function CoreImpl:mousePressed(x, y, button)
  self.ActiveScene:mousePressed(x, y, button)
end

function CoreImpl:mouseReleased(x, y, button)
  self.ActiveScene:mouseReleased(x, y, button)
end
