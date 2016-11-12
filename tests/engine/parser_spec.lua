-- Github Game Off 2016
-- Bryan DeGrendel (c) 2016

require "tests.setup"

describe("Parser", function()
  require "engine.parser"

  local parser, tree
  before_each(function()
    parser = Parser(true)
  end)

  it("parses empty input", function()
    tree = parser:parse("")
    assert.is_table(tree)
    assert.are.equal(0, #tree)
  end)

  it("parses various comments", function()
    tree = parser:parse("--hello\n-- world\n-- again")
    assert.is_table(tree)
    assert.are.equal(3, #tree)
    assert.are.equal("comment", tree[1][1])
    assert.are.equal("hello", tree[1][2])
    assert.are.equal("comment", tree[2][1])
    assert.are.equal(" world", tree[2][2])
    assert.are.equal("comment", tree[3][1])
    assert.are.equal(" again", tree[3][2])
  end)

  it("parses string assignment", function()
    tree = parser:parse(
      "variable = \"hello world\"\n" ..
      "one =\"two\"\n" ..
      "okay= \"three\"\n" ..
      "what=\"\""
    )
    assert.is_table(tree)
    assert.are.equal(4, #tree)
    assert.are.equal("assignment", tree[1][1])
    assert.are.equal("variable", tree[1][2])
    assert.are.equal("hello world", tree[1][3])
    assert.are.equal("assignment", tree[2][1])
    assert.are.equal("one", tree[2][2])
    assert.are.equal("two", tree[2][3])
    assert.are.equal("", tree[4][3])
  end)

  it("parses integer assignment", function()
    tree = parser:parse(
      "hello = 10\n" ..
      "world= 5\n" ..
      "okay = 2\n" ..
      "what=1"
    )
    assert.is_table(tree)
    assert.are.equal(4, #tree)
    assert.are.equal("assignment", tree[1][1])
    assert.are.equal("hello", tree[1][2])
    assert.are.equal(10, tree[1][3])
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
    tree = parser:parse(
      "hello = TrUE\n" ..
      "world = falsE\n"
    )
    assert.is_table(tree)
    assert.are.equal(2, #tree)
    assert.is_true(tree[1][3])
    assert.is_false(tree[2][3])
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
    assert.is_table(tree)
    assert.are.same(reference, tree)
  end)
end)
