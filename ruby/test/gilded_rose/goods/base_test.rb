require 'test_helper'

class BaseTest < Test::Unit::TestCase

  test "Goods::Base acts like Item" do
    good = GildedRose::Goods::Base.new("foo", 1, 2)
    assert_equal "foo", good.name
    assert_equal 1, good.sell_in
    assert_equal 2, good.quality
  end

end