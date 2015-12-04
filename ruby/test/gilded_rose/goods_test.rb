require 'test_helper'

class BaseTest < Test::Unit::TestCase

  test "factory returns Base by default" do
    good = GildedRose::Goods.good_for("foo", 1, 2)
    assert good.is_a? GildedRose::Goods::Base
  end

end