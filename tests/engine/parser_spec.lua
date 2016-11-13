-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Parser", function()
  require "engine.parser"

  local parser, tree
  before_each(function()
    parser = Parser()
  end)

  it("parses empty input", function()
    reference = {}
    tree = parser:parse("")
    assert.are.same(reference, tree)
  end)

  it("parses various comments", function()
    reference = {
      { "comment", "hello" },
      { "comment", " world" },
      { "comment", " again" },
    }
    tree = parser:parse(
      "--hello\n" ..
      "-- world\n" ..
      "-- again"
    )
    assert.are.same(reference, tree)
  end)

  it("parses string assignment", function()
    reference = {
      { "assignment", "variable", "hello world" },
      { "assignment", "one", "two" },
      { "assignment", "okay", "three" },
      { "assignment", "what", "" },
    }
    tree = parser:parse(
      "variable = \"hello world\"\n" ..
      "one =\"two\"\n" ..
      "okay= \"three\"\n" ..
      "what=\"\""
    )
    assert.are.same(reference, tree)
  end)

  it("parses integer assignment", function()
    reference = {
      { "assignment", "hello", 10 },
      { "assignment", "world", 5 },
      { "assignment", "okay", 2 },
      { "assignment", "what", 1 },
    }
    tree = parser:parse(
      "hello = 10\n" ..
      "world= 5\n" ..
      "okay = 2\n" ..
      "what=1"
    )
    assert.are.same(reference, tree)
  end)

  it("parses floating point assignment", function()
    reference = {
      { "assignment", "hello", tonumber"10.12345" },
      { "assignment", "world", tonumber"0.1" },
      { "assignment", "okay", tonumber"0." },
    }
    tree = parser:parse(
      "hello = 10.12345\n" ..
      "world = 0.1\n"  ..
      "okay = 0.\n"
    )
    assert.are.same(reference, tree)
  end)

  it("parses booleans", function()
    reference = {
      { "assignment", "hello", true },
      { "assignment", "world", false },
    }
    tree = parser:parse(
      "hello = TrUE\n" ..
      "world = falsE\n"
    )
    assert.are.same(reference, tree)
  end)

  it("parses function calls", function()
    reference = {
      { "function-call", "call" },
      { "function-call", "call", true },
      { "function-call", "call" },
      { "function-call", "call", "hello", 12 },
    }
    tree = parser:parse(
      "call()\n" ..
      "call(trUe)\n" ..
      "call ( )\n" ..
      "call(\"hello\", 12)\n"
    )
    assert.are.same(reference, tree)
  end)
end)
