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
    assert.is_table(tree[1][3])
    assert.are.equal("string", tree[1][3][1])
    assert.are.equal("hello world", tree[1][3][2])
    assert.are.equal("assignment", tree[2][1])
    assert.are.equal("one", tree[2][2])
    assert.is_table(tree[2][3])
    assert.are.equal("string", tree[2][3][1])
    assert.are.equal("two", tree[2][3][2])
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
end)
