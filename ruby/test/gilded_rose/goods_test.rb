require 'test_helper'

class BaseTest < Test::Unit::TestCase

  test "factory returns Base with defaults" do
    good = GildedRose::Goods.good_for("foo", 1, 2)
    assert_equal GildedRose::Goods::Base::DEFAULT_MIN_QUALITY, good.min_quality
    assert_equal GildedRose::Goods::Base::DEFAULT_MAX_QUALITY, good.max_quality
    assert_equal GildedRose::Goods::Base::DEFAULT_QUALITY_MODIFIER, good.base_quality_modifier
  end

  test "Aged Brie increases in quality, to a maximum of 50" do
    good = GildedRose::Goods.good_for("Aged Brie", 1, 2)
    assert_equal GildedRose::Goods::Base::DEFAULT_MIN_QUALITY, good.min_quality
    assert_equal 50, good.max_quality
    assert_equal +1, good.base_quality_modifier
  end

end