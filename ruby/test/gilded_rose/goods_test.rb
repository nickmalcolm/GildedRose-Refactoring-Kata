require 'test_helper'

class BaseTest < Test::Unit::TestCase

  test "factory returns Base by default" do
    good = GildedRose::Goods.good_for("foo", 1, 2)
    assert good.is_a? GildedRose::Goods::Base
  end

  test "Aged Brie gets its own class" do
    good = GildedRose::Goods.good_for("Aged Brie", 1, 2)
    assert good.is_a? GildedRose::Goods::AgedBrie
  end

end