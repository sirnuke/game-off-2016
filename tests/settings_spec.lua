-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Settings", function()
  require "game-off.settings"

  it("performs basic initialization", function()
    assert.is_table(Settings.Magic)
    assert.is_table(Settings.Graphics)
    assert.is_table(Settings.Scenes)
  end)
end)
