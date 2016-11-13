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
    Clear = { 255, 255, 255, 255 },
  }
  root.Fonts = {
    Directory = "fonts/",
    Console = "VT323-Regular.ttf",
  }
  root.Scenes = {
    Execute = {
      Images = {
        Background = "background.png"
      },
      Sizes = {
        Console = 16,
      },
      DefaultColor = { 0, 0, 0, 255 },
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
      Max = {
        History = 200,
        Line = 80,
      },
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
