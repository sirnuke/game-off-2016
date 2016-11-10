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

  it("parses strings", function()
    tree = parser:parse("\"hello world\"\n\"two\"")
    assert.is_table(tree)
    assert.are.equal(2, #tree)
    assert.are.equal("string", tree[1][1])
    assert.are.equal("hello world", tree[1][2])
    assert.are.equal("string", tree[2][1])
    assert.are.equal("two", tree[2][2])
  end)
end)
