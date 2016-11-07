-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Console", function()
  require "world.console"

  local console
  before_each(function()
    console = Console()
  end)

  it("performs basic initialization", function()
    assert.is_table(console.History)
    assert.is_table(console.Input)
  end)

  it("tracks added input", function()
    assert.are.equal(0, #console.Input)
    console:add_input("H")
    console:add_input("E")
    console:add_input("L")
    console:add_input("L")
    console:add_input("O")
    assert.are.equal(5, #console.Input)
    assert.are.equal("HELLO", table.concat(console.Input))
  end)

  it("resets input", function()
    console:add_input("H")
    console:reset_input()
    assert.are.equal(0, #console.Input)
    assert.are.equal(0, #console.History)
  end)

  it("deletes input", function()
    console:add_input("H")
    console:add_input("E")
    console:add_input("L")
    console:add_input("L")
    console:add_input("O")
    console:delete_input()
    console:delete_input()
    assert.are.equal(3, #console.Input)
    assert.are.equal("HEL", table.concat(console.Input))
    console:add_input("P")
    assert.are.equal(4, #console.Input)
    assert.are.equal("HELP", table.concat(console.Input))
  end)

  it("tracks history", function()
    assert.are.equal(0, #console.History)
    console:add_history("HELLO WORLD")
    assert.are.equal(1, #console.History)
    assert.are.equal("HELLO WORLD", console.History[1])
    console:add_history("HELLO WORLDER")
    assert.are.equal(2,#console.History)
    assert.are.equal("HELLO WORLD", console.History[1])
    assert.are.equal("HELLO WORLDER", console.History[2])
  end)

  it("deletes extra history", function()
    for i = 1, Settings.World.Console.Max.History + 20 do
      console:add_history(tostring(i))
    end
    assert.are.equal(Settings.World.Console.Max.History, #console.History)
    assert.are.equal(console.History[1], tostring(21))
    assert.are.equal(tostring(Settings.World.Console.Max.History + 20),
      console.History[Settings.World.Console.Max.History])
  end)

  it("splits up long lines", function()
    local line, reference, short = {}, {}, {}
    for i = 1, Settings.World.Console.Max.Line * 3 - 5 do
      table.insert(line, "A")
    end
    for i = 1, Settings.World.Console.Max.Line do table.insert(reference, "A") end
    for i = 1, Settings.World.Console.Max.Line - 5 do table.insert(short, "A") end
    line = table.concat(line)
    reference = table.concat(reference)
    short = table.concat(short)
    console:add_history(line)
    assert.are.equal(3, #console.History)
    assert.are.equal(reference, console.History[1])
    assert.are.equal(reference, console.History[2])
    assert.are.equal(short, console.History[3])
  end)

  it("rejects invalid character input", function()
    assert.has_error(function() console:add_input("AA") end)
    assert.has_error(function() console:add_input(nil) end)
    assert.has_error(function() console:add_input("") end)
    assert.has_error(function() console:add_input({"A"}) end)
    assert.has_error(function() console:add_input(0) end)
  end)

  it("rejects invalid history lines", function()
    assert.has_error(function() console:add_history(nil) end)
    assert.has_error(function() console:add_history({"A"}) end)
    assert.has_error(function() console:add_history(0) end)
  end)
end)
