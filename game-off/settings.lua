-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

local tag = "Settings"

local SettingsImpl = Class("settings")

local function generate_defaults(root)
  root.Magic = {
    QuickExit = {
      Enabled = true,
      Key = "escape"
    },
  }
  root.Graphics = {
    Directory = "images/",
    Clear = { 255, 255, 255, 0 },
  }
  root.Scenes = {
    Execute = {
      Images = {
        Background = "background.png"
      },
    },
    System = {
      Images = {
        Background = "background.png"
      },
    },
    Editor = {
      Images = {
        Background = "background.png"
      },
    },
    Loading = {
      Images = {
        Background = "background.png"
      },
    },
  }
  root.World = {
    Console = {
      MaxLength = 200,
    },
  }
end

function SettingsImpl:init()
  generate_defaults(self)
end

function SettingsImpl:dump()
  Log.info(tag, "%s", Inspect(self))
end

Settings = SettingsImpl()
