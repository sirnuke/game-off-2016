-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Console", function()
  require "world.console"

  it("performs basic initialization", function()
    local console = Console()
    assert.is_table(console.History)
    assert.is_table(console.Input)
  end)
end)
