require 'test_helper'

class ActiveRecordCteTest < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveRecordCTE::VERSION
  end

  def test_useless_test
    foo = Foo.where(int: 123).first
    assert_equal foo.str, 'string'
  end

  def test_with_recursive_clause
    non_rec = Foo.select([:id, :str, :int]).where('int IS NOT NULL')
    recursive = Foo.select('c.id, c.str, c.int').where('c.str IS NOT NULL').from('cte AS c')
    res = Foo.with_recursive(cte: non_rec.union(recursive)).from('"cte" AS "foos"').where(str: 'string3').first
    assert_nil res.int
  end
end
